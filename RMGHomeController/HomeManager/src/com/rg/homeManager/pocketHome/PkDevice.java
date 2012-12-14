/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rg.homeManager.pocketHome;

import com.rg.homeManager.WebAdm;
import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

/**
 *
 * @author pt596
 */
public class PkDevice {
    
        public static int ON = 1;
        public static int OFF = 0;
        public static int UNKNOWN = 2;
        
        private int state = 2;
        private String file;
        private String name = "Heating control unit";
        private String lastModifDateTime = "Not yet updated.";

        private String logseconds;
        private String logstatus;

    public void load(String filename) throws IOException {
        this.file = filename;
        Properties p = new Properties();
        p.loadFromXML(new FileInputStream(filename));
        setLogseconds(p.getProperty("logseconds")); if (logseconds == null) logseconds="";
        setLogstatus(p.getProperty("logstatus")); if (logstatus == null) logstatus="";
    }        
    public void save() throws IOException {
        save(file);
    }
    public void save(String fileName) throws IOException {
        Properties p = new Properties();
        p.setProperty("logseconds", getLogseconds());
        p.setProperty("logstatus", getLogstatus());
        FileOutputStream of = new FileOutputStream(fileName);
        p.storeToXML(of, "Property definition");
        of.close();
        this.file = fileName;
    }
    public void fromXML(String xml) throws IOException {
        Properties p = new Properties();
        p.loadFromXML(new ByteArrayInputStream(xml.getBytes()));
        setLogseconds(p.getProperty("logseconds")); if (logseconds == null) logseconds="";
        setLogstatus(p.getProperty("logstatus")); if (logstatus == null) logstatus="";        
    }
    public int getState() {
        return state;
    }

    public void saveLogRecord() {
        long millis = System.currentTimeMillis();
        millis = millis / (long)600000;
        long lastRec = 0L;
        if (getLogseconds().length() > 6) {
            lastRec = Long.parseLong(getLogseconds().substring(getLogseconds().length()-6), 16);
        }
        if (lastRec < millis) {
            setLogstatus(getLogstatus() + Integer.toString(state)); //1 ON, 0 OFF
            setLogseconds(getLogseconds()+Hex.toHexString(millis, 3)); //3 byte 6 hex characters
            try {
                save();
            } catch (Exception e) {
                e.printStackTrace();
                WebAdm.message("Cannot save log record:"+e.getMessage());
            }
        }
    }
    public void setCurrentData(byte[] data) {
        if (data[4] == (byte)0) setState(PkDevice.OFF);
        else setState(PkDevice.ON);
                setLastModifDateTime();
                saveLogRecord();
    }
    
    public String getStateString() {
        if (state == ON) return "Heating ON.";
        else if (state == OFF) return "Heating OFF.";
        else return "Heating unit state is unknown.";
                
    }
    
    public void setState(int state) {
        this.state = state;
    }

    public void setLastModifDateTime() {
        SimpleDateFormat sf = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss"); 
        lastModifDateTime = sf.format(new Date());
    }
    public String getLastModifDateTime() {
        return lastModifDateTime;
    }

    public String getLogseconds() {
        return logseconds;
    }

    public void setLogseconds(String logseconds) {
        this.logseconds = logseconds;
    }

    public String getLogstatus() {
        return logstatus;
    }

    public void setLogstatus(String logstatus) {
        this.logstatus = logstatus;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
