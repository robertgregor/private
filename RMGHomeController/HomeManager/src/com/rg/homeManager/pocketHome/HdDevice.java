/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rg.homeManager.pocketHome;

import com.rg.homeManager.WebAdm;
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
public class HdDevice implements Comparable<HdDevice> {
    
    public static int NAHORE_SEVER_LEFT = 3;
    public static String NAHORE_SEVER_LEFT_STRING = "Nahore severni strana vlevo";
    public static int NAHORE_SEVER_RIGHT = 4;
    public static String NAHORE_SEVER_RIGHT_STRING = "Nahore severni strana vpravo";
    public static int NAHORE_JIH_LEFT = 1;
    public static String NAHORE_JIH_LEFT_STRING = "Nahore jizni strana vlevo";    
    public static int NAHORE_JIH_RIGHT = 2;
    public static String NAHORE_JIH_RIGHT_STRING = "Nahore jizni strana vpravo";        
    public static int JASMINKA = 8;
    public static String JASMINKA_STRING = "Jasminka";            
    public static int POKOJIK = 5;
    public static String POKOJIK_STRING = "Kancelar";                
    public static int OBYVACI_POKOJ = 9;
    public static String OBYVACI_POKOJ_STRING = "Obyvaci pokoj";    
    public static int KOUPELNA = 11;
    public static String KOUPELNA_STRING = "Koupelna";        
    public static int ZACHOD = 10;
    public static String ZACHOD_STRING = "Zachod";
    public static int LOZNICE = 12;
    public static String LOZNICE_STRING = "Loznice";    
    public static int PREDSIN = 6;
    public static String PREDSIN_STRING = "Predsin";        
    public static int STARA_KUCHYN = 7;
    public static String STARA_KUCHYN_STRING = "Stara kuchyn";        

    public int AUTO_CONTROL = 1;
    public int MANUAL_CONTROL = 2;
    public int WINDOW_OPEN = 3;
    
    private byte hdNumber;
    private String hdName;
    private byte programId;
    private byte openAngle;
    private String temperature;
    private byte temperatureByte;
    private String logseconds;
    private String logtemperature;
    private String logexpectedtemperature;
    private String logopenangle;
    private int status;
    private String battery = "OK";
    private String lastModifDateTime = "Not yet updated.";
    private String file;
    private String previousTemperature = "";

    public void load(String filename) throws IOException {
        Properties p = new Properties();
        p.loadFromXML(new FileInputStream(filename));
        setHdNumber(Byte.parseByte(p.getProperty("hdNumber")));
        setHdName(p.getProperty("hdName"));
        setProgramId(Byte.parseByte(p.getProperty("programId")));
        setLogseconds(p.getProperty("logseconds")); if (logseconds == null) logseconds="";
        setLogtemperature(p.getProperty("logtemperature")); if (logtemperature == null) logtemperature="";
        setLogexpectedtemperature(p.getProperty("logexpectedtemperature")); if (logexpectedtemperature == null) logexpectedtemperature="";
        setLogopenangle(p.getProperty("logopenangle")); if (logopenangle == null) logopenangle="";
        this.file = filename;
    }

    public void populateDefaultHdDevice(int hd) throws IOException {
        setLogseconds("");
        setLogtemperature("");
        setLogexpectedtemperature("");        
        setLogopenangle("");        
        if (hd == NAHORE_SEVER_LEFT) {
            setHdNumber((byte)NAHORE_SEVER_LEFT);
            setHdName(NAHORE_SEVER_LEFT_STRING);
            setProgramId((byte)1);
        } else if (hd == NAHORE_SEVER_RIGHT) {
            setHdNumber((byte)NAHORE_SEVER_RIGHT);
            setHdName(NAHORE_SEVER_RIGHT_STRING);
            setProgramId((byte)1);            
        } else if (hd == NAHORE_JIH_LEFT) {
            setHdNumber((byte)NAHORE_JIH_LEFT);
            setHdName(NAHORE_JIH_LEFT_STRING);
            setProgramId((byte)1);            
        } else if (hd == NAHORE_JIH_RIGHT) {
            setHdNumber((byte)NAHORE_JIH_RIGHT);
            setHdName(NAHORE_JIH_RIGHT_STRING);
            setProgramId((byte)1);            
        } else if (hd == JASMINKA) {
            setHdNumber((byte)JASMINKA);
            setHdName(JASMINKA_STRING);
            setProgramId((byte)1);            
        } else if (hd == POKOJIK) {
            setHdNumber((byte)POKOJIK);
            setHdName(POKOJIK_STRING);
            setProgramId((byte)1);            
        } else if (hd == OBYVACI_POKOJ) {
            setHdNumber((byte)OBYVACI_POKOJ);
            setHdName(OBYVACI_POKOJ_STRING);
            setProgramId((byte)1);            
        } else if (hd == KOUPELNA) {
            setHdNumber((byte)KOUPELNA);
            setHdName(KOUPELNA_STRING);
            setProgramId((byte)1);            
        } else if (hd == ZACHOD) {
            setHdNumber((byte)ZACHOD);
            setHdName(ZACHOD_STRING);
            setProgramId((byte)1);            
        } else if (hd == LOZNICE) {
            setHdNumber((byte)LOZNICE);
            setHdName(LOZNICE_STRING);
            setProgramId((byte)1);            
        } else if (hd == PREDSIN) {
            setHdNumber((byte)PREDSIN);
            setHdName(PREDSIN_STRING);
            setProgramId((byte)1);            
        } else if (hd == STARA_KUCHYN) {
            setHdNumber((byte)STARA_KUCHYN);
            setHdName(STARA_KUCHYN_STRING);
            setProgramId((byte)1);            
        }
    }

    public void save() throws IOException {
        save(file);
    }
    public void save(String fileName) throws IOException {
        Properties p = new Properties();
        p.setProperty("logseconds", getLogseconds());
        p.setProperty("logtemperature", getLogtemperature());
        p.setProperty("logexpectedtemperature", getLogexpectedtemperature());
        p.setProperty("hdNumber", Byte.toString(getHdNumber()));
        p.setProperty("hdName", getHdName());
        p.setProperty("programId", Byte.toString(getProgramId()));
        p.setProperty("logopenangle", getLogopenangle());
        FileOutputStream of = new FileOutputStream(fileName);
        p.storeToXML(of, "Property definition");
        of.close();
        this.file = fileName;
    }
    public byte getExpectedTemperature() {
        ProgramData program = ProgramData.getProgramDataById(getProgramId());
        byte[] temp = Hex.fromString(program.getExpectedTemperature());
        return temp[0];
    }
    
    public String getStatusData() {
        ProgramData program = ProgramData.getProgramDataById(getProgramId());
        return hdName + "|" + hdNumber + "|" + programId + "|" +program.getProgramName()+ "|" + status + "|" + temperature + "|" + program.getExpectedTemperatureString() + "|" + openAngle + "|" + getBattery() + "|" + lastModifDateTime;
    }
    
    public void saveLogRecord() {
        long millis = System.currentTimeMillis();
        millis = millis / (long)600000;
        long lastRec = 0L;
        if (getLogseconds().length() > 6) {
            lastRec = Long.parseLong(getLogseconds().substring(getLogseconds().length()-6), 16);
        }
        if (lastRec < millis) {
            setLogopenangle(getLogopenangle() + Hex.toString(getOpenAngle())); //1 byte 2 hex characters
            setLogexpectedtemperature(getLogexpectedtemperature()+Hex.toString(getExpectedTemperature())); //1 byte 2 hex characters
            setLogtemperature(getLogtemperature()+Hex.toString(getTemperatureByte())); //1 byte 2 hex characters
            setLogseconds(getLogseconds()+Hex.toHexString(millis, 3)); //3 byte 6 hex characters
            try {
                save();
            } catch (Exception e) {
                e.printStackTrace();
                WebAdm.message("Cannot save log record:"+e.getMessage());
            }
        }
    }
    
    public static void main(String[] args) {
        String hex = "AAAAAAAABBCCDD21CDC0";
        long lastRec = Long.parseLong(hex.substring(hex.length()-6), 16);
        System.out.println(lastRec);
        long millis = System.currentTimeMillis();
        millis = millis / (long)600000;
        System.out.println(lastRec < millis);
    }
    public byte getHdNumber() {
        return hdNumber;
    }

    public void setHdNumber(byte hdNumber) {
        this.hdNumber = hdNumber;
    }

    public String getHdName() {
        return hdName;
    }

    public void setHdName(String hdName) {
        this.hdName = hdName;
    }

    public byte getOpenAngle() {
        return openAngle;
    }

    public void setOpenAngle(byte openAngle) {
        this.openAngle = openAngle;
    }

    public String getTemperature() {
        return temperature;
    }

    public void setTemperature(String temperature) {
        this.temperature = temperature;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public byte getProgramId() {
        return programId;
    }

    public void setProgramId(byte programId) {
        this.programId = programId;
    }

    public String getBattery() {
        return battery;
    }

    public void setBattery(String battery) {
        this.battery = battery;
    }
    
    public void setLastModifDateTime() {
        SimpleDateFormat sf = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss"); 
        lastModifDateTime = sf.format(new Date());
    }

    public String getLogtemperature() {
        return logtemperature;
    }

    public void setLogtemperature(String logtemperature) {
        this.logtemperature = logtemperature;
    }

    public String getLogexpectedtemperature() {
        return logexpectedtemperature;
    }

    public void setLogexpectedtemperature(String logexpectedtemperature) {
        this.logexpectedtemperature = logexpectedtemperature;
    }

    public String getLogseconds() {
        return logseconds;
    }

    public void setLogseconds(String logseconds) {
        this.logseconds = logseconds;
    }

    public String getLogopenangle() {
        return logopenangle;
    }

    public void setLogopenangle(String logopenangle) {
        this.logopenangle = logopenangle;
    }

    public byte getTemperatureByte() {
        return temperatureByte;
    }

    public void setTemperatureByte(byte temperatureByte) {
        this.temperatureByte = temperatureByte;
    }

    /**
     * @return the previousTemperature
     */
    public String getPreviousTemperature() {
        return previousTemperature;
    }

    /**
     * @param previousTemperature the previousTemperature to set
     */
    public void setPreviousTemperature(String previousTemperature) {
        this.previousTemperature = previousTemperature;
    }
    public int compareTo(HdDevice d) {
        return hdName.compareTo(d.getHdName());
    }
}
