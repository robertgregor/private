package com.rg.homeManager;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.Socket;
import java.util.Enumeration;
import java.util.StringTokenizer;

/**
 *
 * @author pt596
 */
public class HomeCommunicator extends Thread  { 

    private AlarmManager alarmManager = null;
    BufferedReader dataInputStream = null;
    DataOutputStream dataOutputStream = null;
    String receivedDataString = null;
    String currentPIN = "";
    boolean running = false;
    String port = "";
    Socket socket;
    long ioHomeControlPowerTimeout = 300000;
    long ioHomeControlPowerLongTimeout = 3600000;    
    private String ioHomeControlPowerOn =  "GET /ePINNipppppppppppppppppppppppppppu HTTP/1.0\n";
    private String ioHomeControlRemotecontrollerPowerOn =  "GET /ePINNi HTTP/1.0\n";
    private String ioHomeControlPowerOff = "GET /ePINNvprpvplpdpppj HTTP/1.0\n";
    private boolean ioHomeControlOn = false;
    private long ioCounter = 0;
    private String oldIOCommand = "";
    private static final class Lock {}
    private final Object lock = new Lock();


    public HomeCommunicator(String port) {
         this.port = port;
         connect();
    }
    private void connect() {
        try {
            disconnect();
            socket = new Socket("localhost", Integer.parseInt(port));
            dataOutputStream = new DataOutputStream(socket.getOutputStream());
            dataInputStream = new BufferedReader(new InputStreamReader(socket.getInputStream()));
        } catch (Exception e) {
            WebAdm.message("Error when tried to connect: "+e.getMessage());
            return;
        }
        try {
            dataOutputStream.write("GET /! HTTP/1.0\n".getBytes());
            dataOutputStream.flush();
            Thread.sleep(1000);
            char[] b = new char[255];
            if (dataInputStream.ready()) {
                dataInputStream.read(b);
                String resp = new String(b);
                resp = resp.substring(resp.indexOf("<BODY>")+6, resp.indexOf("<BODY>") + 10);
                currentPIN = resp;
                running = true;
                WebAdm.message("Communication with the home controller established. Current PIN="+currentPIN);            
            } else {
                WebAdm.message("PIN cannot be read. System will not work correctly.");
            }
        } catch (Exception e) {
                WebAdm.message("Error when tried to read PIN: "+e.getMessage());            
        }
    }
    
    public void disconnect() {
        running = false;
        try {
            Thread.sleep(50);
        } catch (Exception e) {}
        try { dataOutputStream.close(); } catch (Throwable e) {}
        try { dataInputStream.close(); } catch (Throwable e) {}
        try {
             socket.close();
        } catch (Throwable e) {}
    }
    
    private void switchIOHomeControlOff() {
        try {
            WebAdm.message("IOHomeControlRelay is going off.");
            sendHTTPCommand(ioHomeControlPowerOff);
            ioHomeControlOn = false;
            Thread.sleep(100);
        } catch (Exception e) {
            WebAdm.message("Error, when tried to switch off IOHomeControlRelay: "+e.getMessage());
        }        
    }
    private String modifyIOHomeControlCommand(String cmd) {
        String retCmd = "";
        String[] token = cmd.split(" ");
        if (token[1].startsWith("/e")) {
            //It is IO homecontrol command
            String deviceCommand = token[1].substring(0, token[1].length() - 1);
            if (deviceCommand.equals(oldIOCommand)) {
                retCmd = token[0] + " " + token[1].substring(0, 6) + "mpppppp" +token[1].substring(token[1].length()-1);
            } else {
                retCmd = cmd;
            }
            oldIOCommand = deviceCommand;
        } else {
            retCmd = cmd;
        }
        if (retCmd.indexOf("HTTP/1.0") == -1) retCmd += " HTTP/1.0\n";
        if (!retCmd.endsWith("\n")) retCmd += "\n";
        return retCmd;
    }    
    public String lightOn(String id) throws IOException {
        String cmd = "GET /b"+currentPIN+"?a="+id+"&b=0 HTTP/1.0\n";
        return sendHTTPCommand(cmd);
    }
    public String lightOff(String id) throws IOException {
        String cmd = "GET /c"+currentPIN+"?a="+id+" HTTP/1.0\n";
        return sendHTTPCommand(cmd);
    }
    public String lightOffAfterPeriod(String id, String period) throws IOException {
        String cmd = "GET /b"+currentPIN+"?a="+id+"&b="+period+" HTTP/1.0\n";
        return sendHTTPCommand(cmd);
    }
    public String sendHTTPCommand(String command) throws IOException {        
            if (command.indexOf("|") != -1) {
                StringTokenizer st = new StringTokenizer(command, "|");
                String resp = "";
                while (st.hasMoreTokens()) {
                    resp = sendHTTPCommand(st.nextToken());
                    resp += "|";
                }
                return resp;
            }
            synchronized(lock) {
                String realCmd = command.replaceAll("PINN", currentPIN);
                if (realCmd.indexOf("HTTP/1.0") == -1) realCmd += " HTTP/1.0\n";
                if (!realCmd.endsWith("\n")) realCmd += "\n";
                WebAdm.message("Going to send command: "+realCmd);
                if ((realCmd.startsWith("GET /e") || realCmd.startsWith("get /e")) && !(ioHomeControlPowerOn.equals(command) || ioHomeControlPowerOff.equals(command))){
                    //io home control command, reset the counter
                    ioCounter = 0;
                    if (!ioHomeControlOn) {
                        try {
                            WebAdm.message("IOHomeControlRelay is going on.");
                            receivedDataString = "";
                            String ioOncmd = ioHomeControlPowerOn.replaceAll("PINN", currentPIN);                            
                            dataOutputStream.write(ioOncmd.getBytes());
                            dataOutputStream.flush();
                            lock.wait(12000);
                            WebAdm.message("Answer from remote controller on: "+receivedDataString);
                            //Thread.sleep(11000); //wait for remote control to start
                            //String ioSystCmd = ioHomeControlPowerOn.replaceAll("PINN", currentPIN);
                            //receivedDataString = "";
                            //dataOutputStream.write(ioSystCmd.getBytes());
                            //dataOutputStream.flush();
                            //lock.wait(3000);
                            ioHomeControlOn = true;
                            ioCounter = 0;
                            //WebAdm.message("Answer from IO main switch: "+receivedDataString);
                        } catch (Exception e) {
                            ioHomeControlOn = false;
                            WebAdm.message("Error, when tried to switch on IOHomeControlRelay: "+e.getMessage());
                        }
                    }
                }
                realCmd = modifyIOHomeControlCommand(realCmd);
                try {
                    receivedDataString = "";
                    WebAdm.message("Writting real cmd:"+realCmd);
                    dataOutputStream.write(realCmd.getBytes());
                    dataOutputStream.flush();
                    lock.wait(5000);
                } catch (InterruptedException e) {
                    throw new IOException();
                } catch (Exception e) {
                    disconnect();
                    connect();
                    receivedDataString = "";
                    dataOutputStream.write(realCmd.getBytes());
                    dataOutputStream.flush();
                        try {
                            lock.wait(5000);
                        } catch (InterruptedException ee) {
                            throw new IOException();
                        }
                }
            }
            WebAdm.message("Read answer: "+receivedDataString);
            return receivedDataString;            
    }
    
    public void executeSchedulerCommand(String cmd) {
        try {
            sendHTTPCommand(cmd);
        } catch (Exception e) {
            WebAdm.message("Error when tried to execute scheduler command: "+e.getMessage());
            e.printStackTrace();
        }
    }
    
    public void run() {
        if (!running) return;
        try {            
            while (dataInputStream.ready()) dataInputStream.read();
        } catch (Exception e) {
            e.printStackTrace();
        }
        long sleepTime = 50;
        long hourPowerOffTimeoutCounter = ioHomeControlPowerLongTimeout / sleepTime;
        long currentIOHomeControlCounter = ioHomeControlPowerTimeout / sleepTime;
        try { Thread.sleep(1000); } catch (Exception e) { return; }
        switchIOHomeControlOff();
        ioCounter=0;
        if (dataInputStream == null) return;
        while (running) {
            try {
               Thread.sleep(sleepTime);
               if (--hourPowerOffTimeoutCounter < 0) {
                   hourPowerOffTimeoutCounter = ioHomeControlPowerLongTimeout / sleepTime;
                   switchIOHomeControlOff();
               }
               if (ioHomeControlOn) ++ioCounter;
               if ((ioCounter > currentIOHomeControlCounter) && ioHomeControlOn) {
                   //Ok, timeout expired, switch io homecontrol off
                   switchIOHomeControlOff();
               }
               String line = "";
               if (dataInputStream.ready()) {
                   line = dataInputStream.readLine();
                   if (line.startsWith("A|")) {
                       try {
                            String tokens[] = line.split("\\|");
                            int currentChange = (Integer.parseInt(tokens[1]) ^ Integer.parseInt(tokens[2])) & Integer.parseInt(tokens[1]);
                            WebAdm.message("Received alarm change: "+Integer.toBinaryString(currentChange));
                            if (alarmManager != null) alarmManager.fireAlarm(currentChange);
                       } catch (Exception eee) {
                           WebAdm.message("Error parsing alarm data: "+eee.getClass().getName() + ": " + eee.getMessage());
                       }
                   } else {
                       if (!line.endsWith("</HTML>")) {
                            receivedDataString += line;
                       } else {
                            synchronized (lock) {
                                lock.notifyAll();
                            }
                       }
                   }
               }
            } catch (InterruptedException e) {
                disconnect();
                return;
            } catch (Exception ee) {
                WebAdm.message(ee.getClass().getName() + ": " + ee.getMessage());
            }
        }
    }
    
    public void destroy () {
        disconnect();
    }

    public AlarmManager getAlarmManager() {
        return alarmManager;
    }

    public void setAlarmManager(AlarmManager alarmManager) {
        this.alarmManager = alarmManager;
    }
}