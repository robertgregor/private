package org.remoteHome; 

import gnu.io.CommPort;
import gnu.io.CommPortIdentifier;
import gnu.io.SerialPort;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.Socket;
import java.net.UnknownHostException;

/**
 *
 * @author pt596
 */
class RemoteHomeCommunicator extends Thread  { 

    String host;
    String port;
    RemoteHomeManager manager;
    Socket socket;
    CommPort commPort = null; 
    BufferedReader dataInputStream = null;
    DataOutputStream dataOutputStream = null;
    String dataReceived = "";
    boolean cmdWithResponse = false;
    int cmdWithResponseId = 0;

    protected RemoteHomeCommunicator(String host, String port, RemoteHomeManager manager) throws RemoteHomeConnectionException {
        this.host = host;
        this.port = port;
        this.manager = manager;
        connect();
        this.start();
    }
        
    protected void connect() throws RemoteHomeConnectionException {
            disconnect();
            try {
                socket = new Socket(host, Integer.parseInt(port));
                dataOutputStream = new DataOutputStream(socket.getOutputStream());
                dataInputStream = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            } catch (NumberFormatException e) {
                //OK, the port is COM port.
                connectComPort();
            } catch (UnknownHostException e) {
                throw new RemoteHomeConnectionException(e.getMessage(), RemoteHomeConnectionException.UNKNOWN_HOST);
            } catch (IOException e) {
                throw new RemoteHomeConnectionException(e.getMessage(), RemoteHomeConnectionException.CONNECTION);
                
            }
    }
    
    protected void connectComPort() throws RemoteHomeConnectionException {
            disconnect();
            try {
                CommPortIdentifier portIdentifier = CommPortIdentifier.getPortIdentifier(port); 
                commPort = portIdentifier.open(this.getClass().getName(),2000);
                SerialPort serialPort = (SerialPort) commPort;
                serialPort.setSerialPortParams(9600,SerialPort.DATABITS_8,SerialPort.STOPBITS_1,SerialPort.PARITY_NONE);
                dataInputStream = new BufferedReader(new InputStreamReader(serialPort.getInputStream()));
                dataOutputStream = new DataOutputStream(serialPort.getOutputStream());                 
            } catch (IOException e) {
                throw new RemoteHomeConnectionException(e.getMessage(), RemoteHomeConnectionException.CONNECTION);
            } catch (Exception e) {
                throw new RemoteHomeConnectionException(e.getMessage(), RemoteHomeConnectionException.UNKNOWN_HOST);                
            }
    }

    protected void disconnect() {
        try { dataOutputStream.close(); } catch (Throwable e) {}
        try { dataInputStream.close(); } catch (Throwable e) {}
        try { if (socket != null) socket.close(); } catch (Throwable e) {}
        try { if (commPort != null) commPort.close(); } catch (Throwable e) {}
    }
    
    protected synchronized String sendCommandWithAnswer(int deviceId, String command) throws RemoteHomeConnectionException {
        cmdWithResponse = true;
        cmdWithResponseId = deviceId;
        try {
            sendCommand(deviceId, command);
            return dataReceived;
        } finally {
            cmdWithResponse = false;
            cmdWithResponseId = 0;
        }
    }
    
    protected synchronized void addDevice(int deviceId) throws RemoteHomeConnectionException {
        cmdWithResponse = true;
        cmdWithResponseId = deviceId;
        try {
            dataReceived = "";
            String cmd = "AT+a="+deviceId+"\n";
            dataOutputStream.write(cmd.getBytes());
            dataOutputStream.flush();
                try {
                    wait(2000);
                } catch (InterruptedException e) {
                    return;
                }            
                if (dataReceived.indexOf("OK") > 0) return;
                if (dataReceived.indexOf("ERROR") > 0) throw new RemoteHomeConnectionException(RemoteHomeConnectionException.ERROR_FROM_DEVICE);
                if (dataReceived.length() == 0) throw new RemoteHomeConnectionException(RemoteHomeConnectionException.NO_RESPONSE_FROM_DEVICE);
        } catch (IOException e) {
            //OK, try to reconnect
            disconnect();
            try {
                connect();
            } catch (Exception ee) {
                //OK, so now throw the exception
                throw new RemoteHomeConnectionException(e.getMessage(), RemoteHomeConnectionException.CONNECTION);
            }
            addDevice(deviceId);
        } finally {
            cmdWithResponse = false;
            cmdWithResponseId = 0;
        }
    }

    protected synchronized void sendCommand(int deviceId, String command) throws RemoteHomeConnectionException {
        try {
            dataReceived = "";
            String cmd = "AT+"+deviceId+"="+command+"\n";
            dataOutputStream.write(cmd.getBytes());
            dataOutputStream.flush();
                try {
                    wait(3000);
                } catch (InterruptedException e) {
                    return;
                }            
                if (dataReceived.indexOf("OK") > 0) return;
                if (dataReceived.indexOf("ERROR") > 0) throw new RemoteHomeConnectionException(RemoteHomeConnectionException.ERROR_FROM_DEVICE);
                if (dataReceived.length() == 0) throw new RemoteHomeConnectionException(RemoteHomeConnectionException.NO_RESPONSE_FROM_DEVICE);
        } catch (IOException e) {
            //OK, try to reconnect
            disconnect();
            try {
                connect();
            } catch (Exception ee) {
                //OK, so now throw the exception
                throw new RemoteHomeConnectionException(e.getMessage(), RemoteHomeConnectionException.CONNECTION);
            }
            sendCommand(deviceId, command);
        }
    }
    @Override
    public void run() {
        while (true) {
            try {            
                Thread.sleep(50);
                while (dataInputStream.ready()) {
                    dataReceived = dataInputStream.readLine();
                    if ((dataReceived.indexOf("OK") > 0) || (dataReceived.indexOf("ERROR") > 0)) {
                        //response to regular command
                        synchronized(this) {
                            notify();
                        }
                    } else {
                        //asynchronous command? yes or not? get id first
                        String tokens[] = dataReceived.split(" ");
                        //device Id, skip + sign
                        int devId = Integer.parseInt(tokens[0].substring(1));
                        if (!cmdWithResponse) {
                            //Oki, asynchronous command
                            manager.manageAsynchronousCommand(dataReceived);
                        } else {
                            if (devId == cmdWithResponseId) {
                                //OK, it is response for the "command with response"
                                synchronized(this) {
                                    notify();
                                }
                            } else {
                                //Asynchronous command
                                manager.manageAsynchronousCommand(dataReceived);
                            }
                        }
                    }
                }
            } catch (InterruptedException e) {
                return;
            } catch (IOException e) {
                //ignore the error, thus it is communication problem. The exception is thrown, when 
            }
        }
    }
    @Override
    public void interrupt() {
       super.interrupt();
       disconnect();
    }
}