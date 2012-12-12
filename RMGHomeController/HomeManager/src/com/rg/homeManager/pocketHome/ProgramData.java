/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rg.homeManager.pocketHome;

import com.rg.homeManager.WebAdm;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Properties;

/**
 *
 * @author pt596
 */
public class ProgramData {
    private String programData = "332FBB28BB28BB28BB28BB28332FBB28BB28BB28BB28BB28332FBB28BB28BB28BB28BB28332FBB28BB28BB28BB28BB28332FBB28BB28BB28BB28BB28332FBB28BB28BB28BB28BB28332FBB28BB28BB28BB28BB28";
    //                                                                                                    |                      |
    private String programName = "Prez den 23 stupnu, v noci 20 stupnu";
    private int programId = 1;
    private String filename = "";
    private static Hashtable programs = new Hashtable();
    private static String location = "";
    
    public static void loadPrograms(String loca) {
            location = loca;
            for (int i=1; i<100; i++) {
                String fileName = "HeatingProgram"+Integer.toString(i)+".xml";
                File f = new File(location+fileName);
                if (f.exists()) {
                    ProgramData pd = new ProgramData();
                    pd.load(location+fileName);
                    programs.put(pd.getProgramName(), pd);
                }
            }
            if (programs.size() == 0) {
                //create one default program
                ProgramData pd = new ProgramData();
                pd.save();
                programs.put(pd.getProgramName(), pd);
            }
    }
    public String getScheduleByDay(int day) {
        String schedule = "";
        if (day == Calendar.MONDAY) schedule = getProgramData().substring(0, 24);
        else if (day == Calendar.TUESDAY) schedule = getProgramData().substring(24, 48);
        else if (day == Calendar.WEDNESDAY) schedule = getProgramData().substring(48, 72);
        else if (day == Calendar.THURSDAY) schedule = getProgramData().substring(72, 96);
        else if (day == Calendar.FRIDAY) schedule = getProgramData().substring(96, 120);
        else if (day == Calendar.SATURDAY) schedule = getProgramData().substring(120, 144);
        else if (day == Calendar.SUNDAY) schedule = getProgramData().substring(144);
        return schedule;
    }
    
    public String getExpectedTemperature() {
        Calendar c = Calendar.getInstance();
        int day = c.get(Calendar.DAY_OF_WEEK);
        int hour = c.get(Calendar.HOUR_OF_DAY)*8;
        if (c.get(Calendar.MINUTE) > 30) hour += 3;
        String schedule = getScheduleByDay(day);
        if (day == 1) day = 7; else day--;
        String scheduleDayBefore = getScheduleByDay(day);
        String temperature = scheduleDayBefore.substring(22,24);
        for (int i=0;i<6;i++) {
            int hourOfChangeFull = Integer.parseInt(schedule.substring(i*4,(i*4)+2), 16);
            if (hour < hourOfChangeFull) return temperature;
            else {
                temperature = schedule.substring((i*4)+2,(i*4)+4);
            }
        }
        return temperature;
    }

    public String getExpectedTemperatureString() {
        int temp = Integer.parseInt(getExpectedTemperature(),16);
        int dec = temp / 2;
        int rad = (temp % 2)*5;
        return Integer.toString(dec) + "," + Integer.toString(rad);
    }
    
    public void load(String fileName) {
        try {
            Properties p = new Properties();
            p.loadFromXML(new FileInputStream(fileName));
            setProgramName(p.getProperty("programName"));
            setProgramId(Integer.parseInt(p.getProperty("programId")));
            filename = fileName;
            setProgramData(p.getProperty("programData"));
        } catch (Exception e) {
            WebAdm.message(e.getMessage());
        }
    }
    public void save() {
      try {
        Properties p = new Properties();
        p.setProperty("programName", getProgramName());
        p.setProperty("programData", getProgramData());
        p.setProperty("programId", Integer.toString(getProgramId()));
        if (filename.equals("")) {
            for (int i=1; i<100; i++) {
                String fileName = location+"HeatingProgram"+Integer.toString(i)+".xml";
                File f = new File(fileName);
                if (!f.exists()) {
                    filename = fileName;
                    break;
                }
            }
        }
        FileOutputStream of = new FileOutputStream(filename);
        p.storeToXML(of, "Property definition");
        of.close();
        programs.put(getProgramName(), this);
      } catch (Exception e) {
          WebAdm.message(e.getMessage());
      }
    }
    public static Enumeration<ProgramData> getPrograms() {
        return programs.elements();
    }
    
    public static String getProgramList() {
        String retString = "";
        Enumeration<ProgramData> e = programs.elements();
        while (e.hasMoreElements()) {
            retString += e.nextElement().getProgramName() + "|";
        }
        retString = retString.substring(0,retString.length()-1);
        return retString;
    }
    
    public static String getProgramData(String name) {
        Enumeration<ProgramData> e = programs.elements();
        while (e.hasMoreElements()) {
            ProgramData pd = e.nextElement();
            if (pd.getProgramName().equals(name)) return pd.getProgramData();
        }
        return "";
    }
    public static ProgramData getProgramDataByMame(String name) {
        Enumeration<ProgramData> e = programs.elements();
        while (e.hasMoreElements()) {
            ProgramData pd = e.nextElement();
            if (pd.getProgramName().equals(name)) return pd;
        }
        return null;
    }
    public static ProgramData getProgramDataById(byte pId) {
        Enumeration<ProgramData> e = programs.elements();
        while (e.hasMoreElements()) {
            ProgramData pd = e.nextElement();
            if (pd.getProgramId() == (int)pId) return pd;
        }
        return null;
    }
    public static void updateProgramSchedule(String name, String sch) {
        Enumeration<ProgramData> e = programs.elements();
        while (e.hasMoreElements()) {
            ProgramData pd = e.nextElement();
            if (pd.getProgramName().equals(name)) {
                pd.setProgramData(sch);
                pd.save();
                return;
            }
        }
        //OK program doesn't exist, create it
        createDefaultProgram(name);
        updateProgramSchedule(name, sch);
    }
    public static String deleteProgram(String name) {
        Enumeration<ProgramData> e = programs.elements();
        //to do check the list of headers and it's assignments
        while (e.hasMoreElements()) {
            ProgramData pd = e.nextElement();
            if (pd.getProgramName().equals(name)) {
                programs.remove(pd.getProgramName());
                try {
                    File f = new File(pd.filename);
                    f.delete();
                    return "";
                } catch (Exception ee) {
                    WebAdm.message("Cannot delete program: "+ee.getMessage());
                    return ee.getMessage();
                }
            }
        }
        return null;
    }    
    public static void createDefaultProgram(String programName) {
        ProgramData pd = new ProgramData();
        pd.setProgramName(programName);
        int programIdCandidate = 0;
        while (true) {
            programIdCandidate++;
            boolean exist = false;
            Enumeration<ProgramData> e = programs.elements();
            while (e.hasMoreElements()) {
                if (e.nextElement().getProgramId() == programIdCandidate) {
                    exist = true;
                    break;
                }
            }
            if (!exist) {
                break;
            }
        }
        pd.setProgramId(programIdCandidate);
        pd.save();
    }
    public String getProgramData() {
        return programData;
    }

    public void setProgramData(String programData) {
        this.programData = programData;
    }

    public String getProgramName() {
        return programName;
    }

    public void setProgramName(String programName) {
        this.programName = programName;
    }

    public int getProgramId() {
        return programId;
    }

    public void setProgramId(int programId) {
        this.programId = programId;
    }
}
