/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rg.homeManager.pocketHome;

import com.rg.homeManager.WebAdm;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Calendar;
import java.util.Enumeration;
import java.net.Socket;
/**
 *
 * @author pt596
 */
public class PocketHomeCommunicator extends Thread {
    
    HeatingManager hm = null;
    Socket socket;
    DataInputStream dataInputStream = null;
    OutputStream outputStream = null;
    String port;
    boolean responseReceived = false;
    byte sentCmd[] = new byte[] {(byte)0};
    boolean initPhase = false;
    boolean newDataToSend = false;
    
    public PocketHomeCommunicator(String port, HeatingManager hm) throws Exception {
        try {
            this.hm = hm;
            this.port = port;
            connect();
            message("Heating controller connected.");
        } catch (Exception e) {
            message("Cannot connect to PocketHome unit: "+e.getLocalizedMessage());
        }
    }
    
    private void connect() throws Exception {
            disconnect();

                    socket = new Socket("localhost", Integer.parseInt(port));
                    outputStream = socket.getOutputStream();
                    dataInputStream = new DataInputStream(socket.getInputStream());
    }
    
    public void run() {
        if (dataInputStream == null) return;
        try {
            int n = dataInputStream.available();
            dataInputStream.skipBytes(n);
        } catch (Exception e) {
            e.printStackTrace();
        }
        while(true) {            
            try {              
              byte[] dataByte = new byte[] {(byte)0,(byte)0,(byte)0,(byte)0,(byte)0,(byte)0,(byte)0,(byte)0,(byte)0,(byte)0,(byte)0};
              message("PHC: Going to wait for the new data.");
              while (dataInputStream.available() < 11) {
                  Thread.sleep(50);
              }
              dataInputStream.readFully(dataByte, 0, 11);
                if ((dataByte[9]==(byte)0x0D) && (dataByte[10]==(byte)0x0A)) {
                    message("Received: "+Hex.toString(dataByte));
                        if ((dataByte[0] == 0x04) && (dataByte[1] == 0x50) && (dataByte[2] == sentCmd[0])) {
                            message("Cmd confirmed.");
                            responseReceived = true;
                            if (dataByte[2] == (byte)0x07)
                                new Thread(new Runnable(){
                                    public void run() {
                                        initialize();
                                    }                                
                                }).start();

                            }
                        if ((dataByte[0] == 0x04) && (dataByte[1] == 0x5A)) {
                            if (sendCommand()) {
                                byte[] outDataKeepAlive = new byte[] {(byte)0x03, (byte)0x00, (byte)0x00, (byte)0x00, (byte)0x20, (byte)0x0D, (byte)0x20, (byte)0xFD, (byte)0xFE, (byte)0x0D, (byte)0x0A};                            
                                outputStream.write(outDataKeepAlive);
                                outputStream.flush();
                                message("Keep alive responded.");
                            }
                        }
                        if ((dataByte[0] == 0x04) && (dataByte[1] == 0x56)) {
                            message("Time request received.");
                            new Thread(new Runnable(){
                                public void run() {
                                    Calendar c = Calendar.getInstance();
                                    String year = Integer.toString(c.get(Calendar.YEAR));
                                    year = year.substring(year.length()-2);
                                    byte yearByte = Byte.parseByte(year);
                                    byte[] outTimeData = new byte[] {(byte)0x07, yearByte, (byte)(c.get(Calendar.MONTH)+1), (byte)c.get(Calendar.DAY_OF_MONTH), (byte)c.get(Calendar.HOUR_OF_DAY), (byte)c.get(Calendar.MINUTE), (byte)c.get(Calendar.SECOND), (byte)0xFD, (byte)0xFE, (byte)0x0D, (byte)0x0A};
                                    try {
                                        outputStream.write(outTimeData);                                        
                                        outputStream.flush();
                                        sentCmd = outTimeData;
                                        message("Time cmd sent: "+Hex.toString(outTimeData));
                                    } catch(Exception e) {
                                        message("Cannot send time response: "+e.getMessage());
                                    }
                                }                                
                            }).start();
                        }
                        if ((dataByte[0] == 0x05) && (dataByte[1] == 0x00) && (dataByte[3] == 0x48)) {
                        //if ((dataByte[5] == (byte)0) && (dataByte[6] == (byte)0)) {
                            //no communication retry
                            /*
                            final byte retryHdId = dataByte[2];
                            new Thread(new Runnable(){
                                public void run() {
                                    //getHDStatus(retryHdId);
                                }
                            }).start();
                            * 
                            */
                        //} else {
                            hm.setCurrentData(dataByte);
                            message("HD:"+Byte.toString(dataByte[2])+", Temperature:"+Byte.toString(dataByte[5])+"."+Byte.toString(dataByte[6])+", %Open:"+Byte.toString(dataByte[4]));
                            sentCmd[0] = 0;
                            responseReceived = true;
                        //}
                        
                        }
                        if ((dataByte[0] == 0x05) && (dataByte[1] == 0x00) && (dataByte[3] == 0x54)) {
                            hm.setPkData(dataByte);
                            message("PK:"+Byte.toString(dataByte[4])+" :"+Byte.toString(dataByte[6]));
                            sentCmd[0] = 0;
                            responseReceived = true;
                        }
                } else {
                        try {
                            dataInputStream.read(dataByte);
                            message("Going to skip these data: "+Hex.toString(dataByte));
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                }
            } catch (InterruptedException e) {
                message("Pocket home communicator interrupted.");
                disconnect();
                return;
            } catch (NullPointerException e) {
                message(e.getMessage());
            } catch (Exception e) {
                message(e.getMessage());
            }            
        }        
    }
    
    private boolean sendCommand() {
        if (sentCmd[0] == (byte)0) return true;
        try {
            outputStream.write(sentCmd);
            outputStream.flush();
            message("Sent cmd: "+Hex.toString(sentCmd));
        } catch (Exception e) {            
            //trying to reconnect
            try {
                connect();
                outputStream.write(sentCmd);
                outputStream.flush();
                message("Sent heating cmd: "+Hex.toString(sentCmd));
            } catch (Exception ee) {
                message("Exception when tried to send command "+Hex.toString(sentCmd)+": "+ee.getMessage());
            }
        }
        return false;
    }
    
    private void sendCommand(byte[] cmd) {
        sentCmd = cmd;
        waitForResponse();
    }

    private void waitForResponse() {
        int counter = 0;
        responseReceived = false;
        while (!responseReceived) {
            try {                
                Thread.sleep(10);
                counter++;
                if (counter > 2000) {
                    message("Response not received within 20 seconds.");
                    return;
                }
            } catch (InterruptedException ee) {
                return;
            }
        }
        sentCmd[0] = (byte)0;
    }
    
    public synchronized void initializeHD(byte hd, byte temp, byte programNb) throws IOException {
            message("Initializing HD:"+hd+" "+temp+" "+programNb);
            byte[] outData = new byte[] {(byte)0x02, (byte)0x00, hd, (byte)0x48, programNb, (byte)0x01, temp, (byte)0xFD, (byte)0xFE, (byte)0x0D, (byte)0x0A};
            sendCommand(outData);
    }
    
    public synchronized void initializePK() throws IOException {
            message("Initializing PK...");
            byte[] outData = new byte[] {(byte)0x02, (byte)0x00, (byte)0x00, (byte)0x54, (byte)0x01, (byte)0x01, (byte)0x26, (byte)0xFD, (byte)0xFE, (byte)0x0D, (byte)0x0A};
            sendCommand(outData);
    }

    private void initialize() {
        if (initPhase) return;
        initPhase = true;
        //send FD 0F000000012020FDFE0D0A
        try {
            byte[] outData = new byte[] {(byte)0x0F, (byte)0x00, (byte)0x00, (byte)0x00, (byte)0x01, (byte)0x20, (byte)0x20, (byte)0xFD, (byte)0xFE, (byte)0x0D, (byte)0x0A};
            sendCommand(outData);                    
            initializePK();
            for (int i=1; i<13; i++) {            
                initializeHD((byte)i, hm.getHD(i).getExpectedTemperature(), hm.getHD(i).getProgramId());
            }
            Enumeration<ProgramData> e = ProgramData.getPrograms();
            while (e.hasMoreElements()) {
                ProgramData pd = e.nextElement();
                sendProgramToUnit((byte)pd.getProgramId(), pd.getProgramData());
            }
        } catch (Exception e) {
            message(e.getMessage());
        } finally {
            initPhase = false;
            message("Pocket home initialization done.");
        }
    }
    
    private void message(String msg) {
        WebAdm.message(msg);
        //System.err.println(msg);
        //System.out.println(msg);
    }
    public synchronized void getHDStatus(byte hd) {
        try {
            message("Requesting HD status:"+hd);
            byte[] outData = new byte[] {(byte)0x06, (byte)0x00, hd, (byte)0x48, (byte)0x20, (byte)0x20, (byte)0x20, (byte)0xFD, (byte)0xFE, (byte)0x0D, (byte)0x0A};
            sendCommand(outData);
        } catch (Exception e) {
            message(e.getMessage());
        }        
    }

    private synchronized void getPKStatus() {
        try {
            message("Requesting PK status.");
            byte[] outData = new byte[] {(byte)0x06, (byte)0x00, (byte)0x00, (byte)0x54, (byte)0x20, (byte)0x20, (byte)0x20, (byte)0xFD, (byte)0xFE, (byte)0x0D, (byte)0x0A};
            sendCommand(outData);
        } catch (Exception e) {
            message(e.getMessage());
        }        
    }    
    public synchronized void sendProgramToUnit(byte programId, String programData) {        
        try {
            message("Setting program:"+programId);
            String data = "0D00" + Hex.toString(programId) + "20" + programData + "FDFE0D0A";
            sendCommand(Hex.fromString(data));
            //message(data);
        } catch (Exception e) {
            message(e.getMessage());
        }        
    }    
    public synchronized void setNormalOperation() {
        setConstant("PZ", (byte)0x00);
    }
    public synchronized void setSummerOperation() {
        setConstant("PZ", (byte)0x02);
    }
    public synchronized void setFullOnOperation() {
        setConstant("PZ", (byte)0x01);
    }
    public synchronized void setHeaderOpened(byte opened) {
        setConstant("ZH", opened);
    }
    public synchronized void setTemperature(byte header, byte temperature) {
        try {
            initializeHD(header, temperature, hm.getHD(header).getProgramId());
        } catch (Exception e) {
            message(e.getMessage());
        }        
    }

    public synchronized void setConstant(String constant, byte value) {
        message("Setting constant:"+constant+"="+value);
        String data = "09" + Hex.toString(constant.getBytes()) + Hex.toString(value) + "202020FDFE0D0A";
        sendCommand(Hex.fromString(data));
    }    
    public void getAllHDStatus() {
        getPKStatus();
        for (byte i=1; i<13; i++) getHDStatus(i);
    }

    public void disconnect() {
        try { dataInputStream.close(); } catch (Exception e) {}
        try { outputStream.close(); } catch (Exception e) {}
        try { socket.close(); } catch (Exception e) {}
    }
    public static void main(String[] args) throws Exception {
        PocketHomeCommunicator phc = new PocketHomeCommunicator("2001", null);
        phc.start();
        Thread.sleep(60000);
        phc.getAllHDStatus();
        Thread.sleep(60000);
        phc.getAllHDStatus();
    }
}