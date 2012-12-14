package org.remoteHome; 

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.Socket;
import java.net.UnknownHostException;
import org.remoteHome.exception.RemoteHomeConnectionException;

/**
 *
 * @author pt596
 */
class RemoteHomeCommunicator extends Thread  { 

    String host;
    String port;
    RemoteHomeManager manager;
    Socket socket;
    BufferedReader dataInputStream = null;
    DataOutputStream dataOutputStream = null;
    String dataReceived = "";

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
            } catch (UnknownHostException e) {
                throw new RemoteHomeConnectionException(e.getMessage(), RemoteHomeConnectionException.UNKNOWN_HOST);
            } catch (IOException e) {
                throw new RemoteHomeConnectionException(e.getMessage(), RemoteHomeConnectionException.CONNECTION);
                
            }
    }
    
    protected void disconnect() {
        try { dataOutputStream.close(); } catch (Throwable e) {}
        try { dataInputStream.close(); } catch (Throwable e) {}
        try {
             socket.close();
        } catch (Throwable e) {}
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
             throw new RemoteHomeConnectionException(e.getMessage(), RemoteHomeConnectionException.CONNECTION);            
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
                        //asynchronous command
                        manager.manageAsynchronousCommand(dataReceived);
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