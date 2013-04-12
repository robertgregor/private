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

    private String host;
    private String port;
    private String password;
    private int channel;
    private RemoteHomeManager manager;
    private Socket socket;
    private CommPort commPort = null; 
    private BufferedReader dataInputStream = null;
    private DataOutputStream dataOutputStream = null;
    private String dataReceived = "";
    private boolean cmdWithResponse = false;
    private int cmdWithResponseId = 0;
    private final Object semaphore = new Object();

    protected RemoteHomeCommunicator(String host, String port, RemoteHomeManager manager) throws RemoteHomeConnectionException {
        this.host = host;
        this.port = port;
        this.manager = manager;
        connect();
        getUserNamePassword();
        this.start();
    }
        
    protected void connect() throws RemoteHomeConnectionException {
            disconnect();
            try {
                socket = new Socket( getHost(), Integer.parseInt(getPort()));
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
    private void getUserNamePassword() throws RemoteHomeConnectionException {
        try {
            dataOutputStream.write("AT+s\n".getBytes());
            dataOutputStream.flush();
            Thread.sleep(50);
            if (dataInputStream.ready()) {
                channel = (Integer.parseInt(dataInputStream.readLine().split(":")[1]));
                password = (dataInputStream.readLine().split(":")[1]);
            } else {
                throw new RemoteHomeConnectionException("Cannot read username and password.", RemoteHomeConnectionException.CONNECTION);                
            }
        } catch (IOException e) {
            throw new RemoteHomeConnectionException(e.getMessage(), RemoteHomeConnectionException.CONNECTION);
        } catch (InterruptedException e) {
            return;
        }
    }
    protected void connectComPort() throws RemoteHomeConnectionException {
            disconnect();
            try {
                CommPortIdentifier portIdentifier = CommPortIdentifier.getPortIdentifier(getPort()); 
                commPort = portIdentifier.open(this.getClass().getName(),2000);
                SerialPort serialPort = (SerialPort) commPort;
                serialPort.setSerialPortParams(9600,SerialPort.DATABITS_8,SerialPort.STOPBITS_1,SerialPort.PARITY_NONE);
                dataInputStream = new BufferedReader(new InputStreamReader(serialPort.getInputStream()));
                dataOutputStream = new DataOutputStream(serialPort.getOutputStream());                 
            } catch (IOException e) {
                throw new RemoteHomeConnectionException(e.getMessage(), RemoteHomeConnectionException.CONNECTION);
            } catch (Exception e) {
                throw new RemoteHomeConnectionException(e.getMessage(), RemoteHomeConnectionException.UNKNOWN_PORT);                
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
            return dataReceived.split(" ")[1];
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
                    synchronized(semaphore) {
                        semaphore.wait(2000);
                    }
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
            String cmd = null;
            if (deviceId != -1) {
                cmd = "AT+"+deviceId+"="+command+"\n";
            } else {
                cmd = "AT+"+command;
            }
            System.out.println("S: "+cmd);
            dataOutputStream.write(cmd.getBytes());
            dataOutputStream.flush();
                try {
                    synchronized(semaphore) {
                        semaphore.wait(3000);
                    }
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
                    System.out.println("R:"+dataReceived);
                    if ((dataReceived.indexOf("OK") > -1) || (dataReceived.indexOf("ERROR") > -1)) {
                        //response to regular command
                        synchronized(semaphore) {
                            semaphore.notify();
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
                                synchronized(semaphore) {
                                    semaphore.notify();
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
        if (password.length() != 5) throw new RemoteHomeConnectionException("Invalid password length. Should be exactly 5 characters.", 
                                RemoteHomeConnectionException.INVALID_PARAMETER);
        sendCommand(-1, "p="+password+(char)10);
        this.password = password;
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
        sendCommand(-1, "c="+Integer.toString(channel)+(char)10);
        this.channel = channel;
        
    }
}