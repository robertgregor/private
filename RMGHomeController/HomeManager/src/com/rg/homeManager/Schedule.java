/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rg.homeManager;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author pt596
 */
public class Schedule {
    
    public static int LIGHT = 1;
    public static int ROLLER = 2;
    public static int WINDOW = 3;
    public static int SWITCH = 4;
    public static int WENETIANCROP = 5;
    public static int WENETIANTILT = 6;

    private int type = 0;
    private String commandOn = "";
    private String commandOff = "";
    private String commandStop = "";
    private String runningPeriodSec = "";
    private String currentState = "0";
    private String scheduleStreamMonday =    "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    private String scheduleStreamTuesday =   "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    private String scheduleStreamWednesday = "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    private String scheduleStreamThursday =  "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    private String scheduleStreamFriday =    "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    private String scheduleStreamSaturday =  "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    private String scheduleStreamSunday =    "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    /**
     * @return the type
     */
    public int getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(int type) {
        this.type = type;
    }

    /**
     * @return the commandOn
     */
    public String getCommandOn() {
        return commandOn;
    }

    /**
     * @param commandOn the commandOn to set
     */
    public void setCommandOn(String commandOn) {
        this.commandOn = commandOn;
    }

    /**
     * @return the commandOff
     */
    public String getCommandOff() {
        return commandOff;
    }

    /**
     * @param commandOff the commandOff to set
     */
    public void setCommandOff(String commandOff) {
        this.commandOff = commandOff;
    }

    /**
     * @return the scheduleStreamMonday
     */
    public String getScheduleStreamMonday() {
        return scheduleStreamMonday;
    }

    /**
     * @param scheduleStreamMonday the scheduleStreamMonday to set
     */
    public void setScheduleStreamMonday(String scheduleStreamMonday) {
        this.scheduleStreamMonday = scheduleStreamMonday;
    }

    /**
     * @return the scheduleStreamTuesday
     */
    public String getScheduleStreamTuesday() {
        return scheduleStreamTuesday;
    }

    /**
     * @param scheduleStreamTuesday the scheduleStreamTuesday to set
     */
    public void setScheduleStreamTuesday(String scheduleStreamTuesday) {
        this.scheduleStreamTuesday = scheduleStreamTuesday;
    }

    /**
     * @return the scheduleStreamWednesday
     */
    public String getScheduleStreamWednesday() {
        return scheduleStreamWednesday;
    }

    /**
     * @param scheduleStreamWednesday the scheduleStreamWednesday to set
     */
    public void setScheduleStreamWednesday(String scheduleStreamWednesday) {
        this.scheduleStreamWednesday = scheduleStreamWednesday;
    }

    /**
     * @return the scheduleStreamThursday
     */
    public String getScheduleStreamThursday() {
        return scheduleStreamThursday;
    }

    /**
     * @param scheduleStreamThursday the scheduleStreamThursday to set
     */
    public void setScheduleStreamThursday(String scheduleStreamThursday) {
        this.scheduleStreamThursday = scheduleStreamThursday;
    }

    /**
     * @return the scheduleStreamFriday
     */
    public String getScheduleStreamFriday() {
        return scheduleStreamFriday;
    }

    /**
     * @param scheduleStreamFriday the scheduleStreamFriday to set
     */
    public void setScheduleStreamFriday(String scheduleStreamFriday) {
        this.scheduleStreamFriday = scheduleStreamFriday;
    }

    /**
     * @return the scheduleStreamSaturday
     */
    public String getScheduleStreamSaturday() {
        return scheduleStreamSaturday;
    }

    /**
     * @param scheduleStreamSaturday the scheduleStreamSaturday to set
     */
    public void setScheduleStreamSaturday(String scheduleStreamSaturday) {
        this.scheduleStreamSaturday = scheduleStreamSaturday;
    }

    /**
     * @return the scheduleStreamSunday
     */
    public String getScheduleStreamSunday() {
        return scheduleStreamSunday;
    }

    /**
     * @param scheduleStreamSunday the scheduleStreamSunday to set
     */
    public void setScheduleStreamSunday(String scheduleStreamSunday) {
        this.scheduleStreamSunday = scheduleStreamSunday;
    }
    
    public void save(String fileName) throws IOException {
        Properties p = new Properties();
        p.setProperty("type", Integer.toString(type));
        p.setProperty("commandOn", getCommandOn());
        p.setProperty("commandOff", getCommandOff());
        p.setProperty("commandStop", getCommandStop());
        p.setProperty("runningPeriodSec", getRunningPeriodSec());
        p.setProperty("scheduleStreamMonday", getScheduleStreamMonday());
        p.setProperty("scheduleStreamTuesday", getScheduleStreamTuesday());
        p.setProperty("scheduleStreamWednesday", getScheduleStreamWednesday());
        p.setProperty("scheduleStreamThursday", getScheduleStreamThursday());
        p.setProperty("scheduleStreamFriday", getScheduleStreamFriday());
        p.setProperty("scheduleStreamSaturday", getScheduleStreamSaturday());
        p.setProperty("scheduleStreamSunday", getScheduleStreamSunday());
        FileOutputStream of = new FileOutputStream(fileName);
        p.storeToXML(of, "Property definition"); 
        of.close();
    }
    public void load(String fileName) throws IOException {
        Properties p = new Properties();
        p.loadFromXML(new FileInputStream(fileName));
        setType(Integer.parseInt(p.getProperty("type")));
        setCommandOn(p.getProperty("commandOn"));
        setCommandOff(p.getProperty("commandOff"));
        setCommandStop(p.getProperty("commandStop"));
        setRunningPeriodSec(p.getProperty("runningPeriodSec"));
        setScheduleStreamMonday(p.getProperty("scheduleStreamMonday"));
        setScheduleStreamTuesday(p.getProperty("scheduleStreamTuesday"));
        setScheduleStreamWednesday(p.getProperty("scheduleStreamWednesday"));
        setScheduleStreamThursday(p.getProperty("scheduleStreamThursday"));
        setScheduleStreamFriday(p.getProperty("scheduleStreamFriday"));
        setScheduleStreamSaturday(p.getProperty("scheduleStreamSaturday"));
        setScheduleStreamSunday(p.getProperty("scheduleStreamSunday"));        
    }

    /**
     * @return the currentState
     */
    public String getCurrentState() {
        return currentState;
    }

    /**
     * @param currentState the currentState to set
     */
    public void setCurrentState(String currentState) {
        this.currentState = currentState;
    }

    public String getCommandStop() {
        return commandStop;
    }

    public void setCommandStop(String commandStop) {
        this.commandStop = commandStop;
    }

    public String getRunningPeriodSec() {
        return runningPeriodSec;
    }

    public void setRunningPeriodSec(String runningPeriodSec) {
        this.runningPeriodSec = runningPeriodSec;
    }
}
