/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rg.homeManager.pocketHome;

import com.rg.homeManager.WebAdm;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletConfig;

/**
 *
 * @author pt596
 */
public class HeatingManager extends Thread {

    private Hashtable components = new Hashtable();
    public PkDevice pkdevice = new PkDevice();
    public PocketHomeCommunicator phc = null;
    private ServletConfig config;
    
    public HeatingManager(ServletConfig config) throws Exception {
        this.config = config;
        ProgramData.loadPrograms(config.getInitParameter("FILE_LOCATION"));
        loadHdDevices();
        phc = new PocketHomeCommunicator(config.getInitParameter("HEATING_PORT"), 
                                                 this);
        phc.setName("Pocket home communicator");
        phc.start();
    }
    private void loadHdDevices() {
        for (int i=1;i<13;i++) components.put(Integer.toString(i),loadHdDeviceData(i));
        try {
            pkdevice.load(config.getInitParameter("FILE_LOCATION")+"PKdata1.xml");
        } catch (IOException e) {
            //default
            pkdevice.setLogseconds("");
            pkdevice.setLogstatus("");
            pkdevice.setState(PkDevice.UNKNOWN);
        }
    }
    
    private HdDevice loadHdDeviceData(int hdId) {
        HdDevice dev = new HdDevice();
        try {
            dev.load(config.getInitParameter("FILE_LOCATION")+"HDdata"+Integer.toString(hdId)+".xml");
            return dev;            
        } catch (IOException e) {
            //default
            try {
                dev.populateDefaultHdDevice(hdId);
                dev.save(config.getInitParameter("FILE_LOCATION")+"HDdata"+Integer.toString(hdId)+".xml");
            } catch (IOException ee) {
                WebAdm.message(ee.getMessage());
            }
        }
        return dev;
    }
        
    public String getProgramsList(String id) {
        if (id.equals("13")) id = "1";
        if (id.equals("14")) id = "1";
        String ret = "";
        Iterator<HdDevice> i = (components.values()).iterator();
            while(i.hasNext()) {
                HdDevice dev = i.next();
                if (dev.getHdNumber() == Byte.parseByte(id)) {
                     ProgramData pd = ProgramData.getProgramDataById(dev.getProgramId());
                     ret = pd.getProgramName() + "|";
                     break;
                }
            }
        return ret + ProgramData.getProgramList();
    }

    public HdDevice getHD(int id) {
        Iterator<HdDevice> i = (components.values()).iterator();
            while(i.hasNext()) {
                HdDevice dev = i.next();
                if (dev.getHdNumber() == (byte)id) {
                    return dev;
                }
            }
        return null;
    }

    public void assignProgram(String id, String programName) {
        if (id.equals("14")) {
            for (int i=1; i<13; i++) assignProgram(Integer.toString(i), programName);
        } else if (id.equals("13")) {
            for (int i=1; i<5; i++) assignProgram(Integer.toString(i), programName);            
        } else {
            Iterator<HdDevice> i = (components.values()).iterator();
            while(i.hasNext()) {
                HdDevice dev = i.next();
                if (dev.getHdNumber() == Byte.parseByte(id)) {
                    try {
                        dev.setProgramId((byte)ProgramData.getProgramDataByMame(programName).getProgramId());
                        dev.save();                        
                        phc.initializeHD(dev.getHdNumber(), dev.getExpectedTemperature(), dev.getProgramId());
                    } catch (Exception e) {
                        WebAdm.message("Cannot assign program: "+e.getMessage());
                    }
                }
            }
        }
    }
    public String getProgramsData(String name) {
        return ProgramData.getProgramData(name);
    }

    public void saveProgram(String name, String sch) {
        ProgramData.updateProgramSchedule(name, sch);
        ProgramData pd = ProgramData.getProgramDataByMame(name);
        phc.sendProgramToUnit((byte)pd.getProgramId(), pd.getProgramData());
    }
    public String deleteProgram(String name) {
        ProgramData pd = ProgramData.getProgramDataByMame(name);
        if (pd == null) return null;
        Iterator<HdDevice> i = (components.values()).iterator();
        boolean programAssigned = false;
            while(i.hasNext()) {
                HdDevice dev = i.next();
                if (dev.getProgramId() == pd.getProgramId()) {
                    programAssigned = true;
                    break;
                }                        
            }
        if (programAssigned) return null;        
        return ProgramData.deleteProgram(name);
    }
    
    public void getChart(String id, String type, OutputStream out) {
        int hdId = Integer.parseInt(id);
        if (hdId == 0) {
            ChartManager ch = new ChartManager(pkdevice.getName());
                    try {
                        ch.createPkChart(pkdevice, type);
                        ch.writeToStream(out);
                    } catch (Exception e) {
                        e.printStackTrace();
                        WebAdm.message("Error generating chart: "+e.getMessage());
                    }            
        } else {
            Iterator<HdDevice> i = (components.values()).iterator();
            while(i.hasNext()) {
                HdDevice dev = i.next();
                if (dev.getHdNumber() == hdId) {
                    ChartManager ch = new ChartManager(dev.getHdName());
                    try {
                        ch.createChart(dev, type);
                        ch.writeToStream(out);
                    } catch (Exception e) {
                        WebAdm.message("Error generating chart: "+e.getMessage());
                    }
                }
            }
        }        
    }
    public void closePHC() {
        phc.interrupt();
        phc.disconnect();
    }
    public String getHdStatus(String id) {
        int hdId = Integer.parseInt(id);
        String result = "";
        List<HdDevice> l = new ArrayList<HdDevice>(components.values());
        Collections.sort(l);
        Iterator<HdDevice> i = l.iterator();
        if (hdId == 13) {
            while(i.hasNext()) {
                HdDevice dev = i.next();
                if ((dev.getHdNumber() == (byte)1) ||
                        (dev.getHdNumber() == (byte)2) ||
                        (dev.getHdNumber() == (byte)3) ||
                        (dev.getHdNumber() == (byte)4)) {
                    result += dev.getStatusData() + ";";
                }
            }                        
        } else if (hdId == 0) {
            //pkstatus
            result = pkdevice.getStateString();
        } else if (hdId == 14) {
            while(i.hasNext()) {
                HdDevice dev = i.next();
                result += dev.getStatusData() + ";";
            }            
        } else {
            while(i.hasNext()) {
                HdDevice dev = i.next();
                if (dev.getHdNumber() == hdId) {
                    result = dev.getStatusData();
                }
            }
        }
        if (result.endsWith(";")) result = result.substring(0, result.length() - 1);
        return result;
    }
    public String getAllHdStatus() {
        String returnData = "";
        Iterator<HdDevice> i = (components.values()).iterator();
        while(i.hasNext()) {
            HdDevice dev = i.next();
            returnData = returnData + dev.getStatusData() + ";";
        }
        return returnData.substring(0, returnData.length() - 1);
    }
    public void setCurrentData(byte[] data) {
        int hdId = (int)data[2];
        Iterator<HdDevice> i = (components.values()).iterator();
        while(i.hasNext()) {
            HdDevice dev = i.next();
            if (dev.getHdNumber() == hdId) {
                if (data[6] < (byte)0) {
                    //low baterry
                    dev.setBattery("LOW");
                    data[6] = (byte)(data[6] - (byte)128);
                } else {
                    dev.setBattery("OK");
                }
                dev.setTemperature(Byte.toString(data[5]) + "," + Byte.toString(data[6]));
                byte temperature = (byte)(data[5]*2);
                if (data[6]>(byte)4) temperature++;
                dev.setTemperatureByte(temperature);
                dev.setOpenAngle(data[4]);
                dev.setLastModifDateTime();
                if ((data[5] != (byte)0) && (data[6] != (byte)0)) dev.saveLogRecord();
                return;
            }
        }
    }
    public void setPkData(byte[] data) {
        pkdevice.setCurrentData(data);
    }
    public void setTemperatureMan(byte id, byte temperature) {
        if (id == 14) {
            for (byte i=(byte)1; i<(byte)13;i++) phc.setTemperature(i, temperature);
        } else if (id == 13) {
            phc.setTemperature((byte)1, temperature);
            phc.setTemperature((byte)2, temperature);
            phc.setTemperature((byte)3, temperature);
            phc.setTemperature((byte)4, temperature);            
        } else {
            phc.setTemperature(id, temperature);
        }
    }
    public void run() {
        while(true) {
            try {
                Thread.sleep(600000);
                /*
                setCurrentData(Hex.fromString("05000148021B01FDFE0D0A"));
                setCurrentData(Hex.fromString("05000148021A01FDFE0D0A"));
                setCurrentData(Hex.fromString("05000148021901FDFE0D0A"));
                setCurrentData(Hex.fromString("05000148021701FDFE0D0A"));
                setCurrentData(Hex.fromString("05000148021A01FDFE0D0A"));
                setCurrentData(Hex.fromString("05000148021601FDFE0D0A"));
                setCurrentData(Hex.fromString("05000148021901FDFE0D0A"));
                setCurrentData(Hex.fromString("05000148021E01FDFE0D0A"));
                setCurrentData(Hex.fromString("05000148021C01FDFE0D0A"));
                setCurrentData(Hex.fromString("05000148021B01FDFE0D0A"));
                * 
                */
                phc.getAllHDStatus();
                Iterator<HdDevice> i = (components.values()).iterator();
                    while(i.hasNext()) {
                        HdDevice dev = i.next();
                        if (dev.getTemperature().equals("0,0")) {
                            phc.getHDStatus(dev.getHdNumber());
                        }
                        //set the temperature based on the program
                        ProgramData program = ProgramData.getProgramDataById(dev.getProgramId());
                        String expectedTemperature = program.getExpectedTemperature();
                        if (!expectedTemperature.equals(dev.getPreviousTemperature())) {
                            phc.setTemperature(dev.getHdNumber(), Byte.parseByte(expectedTemperature, 16));
                            dev.setPreviousTemperature(expectedTemperature);
                        }
                    }                
                Thread.sleep(600000);
            } catch (InterruptedException e) {
                WebAdm.message("Heating manager thread interrupted.");
                return;
            }
        }        
    }
}
