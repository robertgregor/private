package org.remoteHome; 

//import gnu.io.SerialPort;
import gnu.io.NativeResource;
import gnu.io.NRSerialPort;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.remoteHome.stk500_v1.Logger;
import org.remoteHome.stk500_v1.STK500v1;

/**
 *
 * @author pt596
 */
class RemoteHomeCommunicator extends Thread  { 

    private String host;
    private String port;
    private String password;
    private int channel;
    private RemoteHomeManager manager;
    private Socket socket;
    private NRSerialPort serialPort = null; 
    private BufferedReader dataInputStream = null;
    private DataOutputStream dataOutputStream = null;
    private List<String> dataReceived;
    private boolean simulate = false;
    private boolean programming = false;
    private String programDeviceProgress = "";

    protected RemoteHomeCommunicator(String host, String port, RemoteHomeManager manager) throws RemoteHomeConnectionException {
        dataReceived = Collections.synchronizedList(new <String>ArrayList());
        processAsynchronousCommands();
        this.host = host;
        this.port = port;
        this.manager = manager;
        connect();
        this.start();
        getUserNamePassword();
    }
        
    protected void connect() throws RemoteHomeConnectionException {
            programming = false;
            disconnect();
            try {
                Integer.parseInt(getPort());
                connectTcp();
                RemoteHomeManager.log.info("TCP connection established to: "+getHost()+":"+getPort());
            } catch (NumberFormatException e) {
                //OK, the port is COM port.
                if (!getPort().equalsIgnoreCase("SIMULATE")) {
                    connectComPort();
                    RemoteHomeManager.log.info("COMM port connection established: "+getPort());
                } else {
                    simulate = true;
                    RemoteHomeManager.log.info("!!!!!!!!!!!    Simulation mode     !!!!!!!!!!!!!");
                    new Thread(new Runnable(){
                        public void run() {
                            while (true) {
                                try {
                                    Thread.sleep(60000);
                                    Thread.sleep(150000);
                                } catch (InterruptedException e) {
                                    return;
                                } catch (Exception e) {
                                    RemoteHomeManager.log.error(107, e);
                                }
                            }
                        }
                    }).start();
                }
            }
    }
    private void getUserNamePassword() throws RemoteHomeConnectionException {
            if (isSimulate()) {
                if (channel==0) channel = 1;
                if (password==null) password = "thisIsEncryptKey";
                return;
            }
            RemoteHomeManager.log.debug("Going to get username and password from the transceiver.");
            try {
                String answer = sendCommandWithAnswer(-1, "s");
                String[] data = answer.split("\t");
                channel = (Integer.parseInt(data[1].split(":")[1]));
                password = (data[2].split(":")[1]);
            } catch (Exception ee) {
                RemoteHomeManager.log.error(100, ee);
                throw new RemoteHomeConnectionException("Cannot read username and password.", RemoteHomeConnectionException.CONNECTION);                
            }
    }
    protected void connectTcp() throws RemoteHomeConnectionException {
            if (isSimulate()) return;
            disconnect();
            try {
                socket = new Socket( getHost(), Integer.parseInt(getPort()));
                dataOutputStream = new DataOutputStream(socket.getOutputStream());
                dataInputStream = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            } catch (UnknownHostException e) {
                RemoteHomeManager.log.error(104, e);
                throw new RemoteHomeConnectionException(e.getMessage(), RemoteHomeConnectionException.UNKNOWN_HOST);
            } catch (IOException e) {
                RemoteHomeManager.log.error(105, e);
                throw new RemoteHomeConnectionException(e.getMessage(), RemoteHomeConnectionException.CONNECTION);                
            }
    }
    protected void connectComPort() throws RemoteHomeConnectionException {
            if (isSimulate()) return;
            disconnect();
            try {
		NativeResource nr = new NativeResource();
		nr.load("libNRJavaSerial");
                serialPort = new NRSerialPort(getPort(), 115200);
                serialPort.connect();
                dataInputStream = new BufferedReader(new InputStreamReader(serialPort.getInputStream()));
                dataOutputStream = new DataOutputStream(serialPort.getOutputStream());                 
            } catch (Exception e) {
                RemoteHomeManager.log.error(103, e);
                throw new RemoteHomeConnectionException(e.getMessage(), RemoteHomeConnectionException.UNKNOWN_PORT);                
            }
    }

    protected void disconnect() {
        if (isSimulate()) return;
        try { dataOutputStream.close(); } catch (Throwable e) {}
        try { dataInputStream.close(); } catch (Throwable e) {}
        try { if (socket != null) socket.close(); } catch (Throwable e) {}
        try { if (serialPort != null) { if (serialPort.isConnected()) serialPort.disconnect(); }} catch (Throwable e) {}
        RemoteHomeManager.log.info("Disconnected.");
    }
    
    protected synchronized void programDevice(byte[] hexDataToLoad) throws RemoteHomeConnectionException {
      disconnect();
      dataOutputStream = null;
      dataInputStream = null;
      programming = true;
      OutputStream out = null;
      InputStream in = null;
      try {
        RemoteHomeManager.log.info("Going to program device.");
        try {
            Integer.parseInt(getPort());
            RemoteHomeManager.log.debug("TCP connection is used.");
            try {
                socket = new Socket( getHost(), Integer.parseInt(getPort()));
                out = socket.getOutputStream();
                in = socket.getInputStream();
                RemoteHomeManager.log.info("TCP connection is established.");
            } catch (UnknownHostException e) {
                RemoteHomeManager.log.error(115, e);
                throw new RemoteHomeConnectionException(e.getMessage(), RemoteHomeConnectionException.UNKNOWN_HOST);
            } catch (IOException e) {
                RemoteHomeManager.log.error(116, e);
                throw new RemoteHomeConnectionException(e.getMessage(), RemoteHomeConnectionException.CONNECTION);                
            }    
        } catch (NumberFormatException e) {
            //Ok it is comport connection or simulate
            if (!getPort().equalsIgnoreCase("SIMULATE")) {
                RemoteHomeManager.log.debug("COMM port direct connection is used.");
                try {
                    NativeResource nr = new NativeResource();
                    nr.load("libNRJavaSerial");
                    serialPort = new NRSerialPort(getPort(), 115200);
                    serialPort.connect();
                    in = serialPort.getInputStream();
                    out = serialPort.getOutputStream();
                    RemoteHomeManager.log.info("COM port connection is established.");
                } catch (Exception ee) {
                    RemoteHomeManager.log.error(117, ee);
                    throw new RemoteHomeConnectionException(ee.getMessage(), RemoteHomeConnectionException.UNKNOWN_PORT);                
                }
            } else {
                RemoteHomeManager.log.info("Simulate mode is used. Nothing will happen.");
                //Simulate nothing should be done.
                return;
            }
        }
        STK500v1 stk = new STK500v1(out, in, new RemoteHomeCommunicator.StkLoggerImpl(), hexDataToLoad);
        if (stk.programUsingOptiboot(true, 128)) {
            try { Thread.sleep(1000); } catch (InterruptedException e) {}
            RemoteHomeManager.log.info("Programming successfull.");
            programDeviceProgress = "";
        } else {
            try { Thread.sleep(1000); } catch (InterruptedException e) {}
            RemoteHomeManager.log.warning("Programming failed.");
            programDeviceProgress = "";
            throw new RemoteHomeConnectionException(RemoteHomeConnectionException.OPERATION_FAILED);
        }
      } finally {
        if (isSimulate()) return;
        try { in.close(); } catch (Throwable e) {}
        try { out.close(); } catch (Throwable e) {}
        try { socket.close(); } catch (Throwable e) {}
        try { serialPort.disconnect(); } catch (Throwable e) {}
        programming = false;
        //connect();
      }
    }
    
    protected String getProgramDeviceProgress() {
        return programDeviceProgress;
    }
    protected void addDevice(int deviceId) throws RemoteHomeConnectionException {
        if ((deviceId < 1) || (deviceId > 254)) throw new RemoteHomeConnectionException("Invalid device ID. Should be 0 < deviceId < 255", 
                                RemoteHomeConnectionException.INVALID_PARAMETER);
        if (isSimulate()) return;
        sendCommandWithAnswer(-1, "p="+getPassword());
        sendCommandWithAnswer(-1, "c="+getChannel());
        sendCommandWithAnswer(-1, "n="+deviceId);
    }

    protected synchronized String sendCommandWithAnswer(int deviceId, String command) throws RemoteHomeConnectionException {
            cleanupDataReceived();
            if (isSimulate()) return "";
            try {
                String cmd = null;
                if (deviceId != -1) {
                    cmd = "at+"+deviceId+"="+command;
                } else {
                    cmd = "at+"+command;
                }
                RemoteHomeManager.log.info("Sending command: "+cmd);
                dataOutputStream.write(cmd.getBytes());
                dataOutputStream.write((byte)10);
                dataOutputStream.flush();
                for (int i=0; i<350;i++) {
                    for (String received : dataReceived) {
                        String tokens[] = received.split(" ",2);
                        if (tokens.length > 1) {
                            try {
                                if (Integer.parseInt(tokens[0].substring(1)) == deviceId) {
                                    dataReceived.remove(received);
                                    return tokens[1];                                    
                                }
                            } catch (NumberFormatException e) {
                                if (received.startsWith("+Device")) {
                                    //OK, it is answer to at+s command
                                    dataReceived.remove(received);
                                    return received;                                    
                                }
                            }
                        } else {
                            dataReceived.remove(received);
                            return received;                                    
                        }
                    }
                    try {
                        Thread.sleep(10);
                    } catch (InterruptedException e) {
                        return "";
                    }
                }
                throw new RemoteHomeConnectionException(RemoteHomeConnectionException.NO_RESPONSE_FROM_DEVICE);
            } catch (IOException e) {
                //OK, try to reconnect
                try {
                    connect();
                } catch (Exception ee) {}
                RemoteHomeManager.log.error(102, e);
                throw new RemoteHomeConnectionException(e.getMessage(), RemoteHomeConnectionException.CONNECTION);
            }
    }
    
    private synchronized void cleanupDataReceived() {
        while (dataReceived.remove(""));
        while (dataReceived.remove("OK"));
        while (dataReceived.remove("ERROR [Not reachable]"));
        while (dataReceived.remove("ERROR"));
        while (dataReceived.remove("Started"));      
    }

    protected synchronized void sendCommand(int deviceId, String command) throws RemoteHomeConnectionException {
            cleanupDataReceived();
            if (isSimulate()) return;
            try {
                String cmd = null;
                if (deviceId != -1) {
                    cmd = "at+"+deviceId+"="+command;
                } else {
                    cmd = "at+"+command;
                }
                RemoteHomeManager.log.info("Sending command: "+cmd);
                dataOutputStream.write(cmd.getBytes());
                dataOutputStream.write((byte)10);
                dataOutputStream.flush();
                for (int i=0; i<350;i++) {
                    for (String received : dataReceived) {
                        if (received.indexOf("OK") >= 0) {
                            dataReceived.remove(received);
                            Thread.sleep(10);
                            return;
                        }
                        if (received.indexOf("ERROR [Not reachable]") >= 0) {
                            dataReceived.remove(received);
                            Thread.sleep(10); 
                            throw new RemoteHomeConnectionException(RemoteHomeConnectionException.NO_RESPONSE_FROM_DEVICE);
                        }
                        if (received.indexOf("ERROR") >= 0) {
                            dataReceived.remove(received);
                            Thread.sleep(10); 
                            throw new RemoteHomeConnectionException(RemoteHomeConnectionException.ERROR_FROM_DEVICE);
                        }
                    }
                    try {
                        Thread.sleep(10);
                    } catch (InterruptedException e) {
                        return;
                    }
                }
                throw new RemoteHomeConnectionException(RemoteHomeConnectionException.NO_RESPONSE_FROM_DEVICE);
            } catch (IOException e) {
                try {
                    connect();
                } catch (Exception ee) {}                
                RemoteHomeManager.log.error(101, e);
                throw new RemoteHomeConnectionException(e.getMessage(), RemoteHomeConnectionException.CONNECTION);
            } catch (InterruptedException e) {}            
    }
    
    protected synchronized void processAsynchronousCommand() {
        for (String received : dataReceived) {
                            String tokens[] = received.split(" ");
                            if (tokens.length < 2) dataReceived.remove(received);
                            else {
                                dataReceived.remove(received);
                                manager.manageAsynchronousCommand(received);
                                return;
                            }
                        }
    }
    protected void processAsynchronousCommands() {
        new Thread(new Runnable() {
            public void run() {
                while (true) {                    
                    try {
                        processAsynchronousCommand();
                        Thread.sleep(50);
                    } catch (InterruptedException e) {
                        return;
                    } catch (Exception e) {
                        RemoteHomeManager.log.error(1101, e);
                    }
                }
            }
        }).start();
        //});
    }
    
    @Override
    public void run() {
        while (true) {
            try {            
                Thread.sleep(10);
                if (isSimulate()) continue;
                if (programming) continue;
                if ((serialPort != null) && !serialPort.isConnected()) continue;
                if ((socket != null) && !socket.isClosed()) continue;
                while (dataInputStream.ready()) {
                    String d = dataInputStream.readLine();
                    dataReceived.add(d);
                    RemoteHomeManager.log.info("Received: "+d);
                }
            } catch (Exception e) {
                RemoteHomeManager.log.error(100, e);
            }
        }
    }
    @Override
    public void interrupt() {
       super.interrupt();
       disconnect();
    }

    /**
     * @return the host
     */
    public String getHost() {
        return host;
    }

    /**
     * @param host the host to set
     */
    public void setHost(String host) {
        this.host = host;
    }

    /**
     * @return the port
     */
    public String getPort() {
        return port;
    }

    /**
     * @param port the port to set
     */
    public void setPort(String port) {
        this.port = port;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) throws RemoteHomeConnectionException {
        if (password.length() != 16) throw new RemoteHomeConnectionException("Invalid password length. Should be exactly 16 characters.", 
                                RemoteHomeConnectionException.INVALID_PARAMETER);
        sendCommandWithAnswer(-1, "p="+password);
        this.password = password;
    }

    /**
     * @param deviceID the device id to read.
     */
    public int readRSSI(int deviceId) throws RemoteHomeConnectionException {
        if (!((deviceId > 0) && (deviceId < 255))) throw new RemoteHomeConnectionException("Invalid deviceId. Should be 0 < deviceId < 255.", 
                                RemoteHomeConnectionException.INVALID_PARAMETER);
        return Integer.parseInt(sendCommandWithAnswer(-1, "r="+deviceId));
    }

    /**
     * @return the channel
     */
    public int getChannel() {
        return channel;
    }

    /**
     * @param channel the channel to set
     */
    public void setChannel(int channel) throws RemoteHomeConnectionException {
        if ((channel < 1) || (channel > 255)) throw new RemoteHomeConnectionException("Invalid channel. Should be 0 < channel < 256", 
                                RemoteHomeConnectionException.INVALID_PARAMETER);
        sendCommandWithAnswer(-1, "c="+Integer.toString(channel));
        this.channel = channel;
        
    }

    /**
     * @return the simulate
     */
    public boolean isSimulate() {
        return simulate;
    }
    
    class StkLoggerImpl implements Logger {        
        public void makeToast(String msg){
            //System.out.println("Toast "+System.currentTimeMillis()+": "+msg);
            RemoteHomeManager.log.debug(msg);
        }        
        public void printToConsole(String msg) {
            RemoteHomeManager.log.info(msg);
        }
        public void logcat(String msg, String level) {
                    //System.out.println("Logcat "+System.currentTimeMillis()+" "+level+": "+msg);
                    if (msg.indexOf("%") > 0) {
                        programDeviceProgress = msg;
                    }
                    if (level.equals("i")) {
                        RemoteHomeManager.log.info(msg);
                    } else if (level.equals("w")) {
                        RemoteHomeManager.log.warning(msg);
                    } else if (level.equals("e")) {
                        RemoteHomeManager.log.error(300, msg);
                    } else {
                        RemoteHomeManager.log.debug(msg);
                    }                    
        }
    }
}