/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome;

import java.io.Serializable;
import java.util.Calendar;

/**
 * @author pt596
 */
public class OnOffSchedule implements Serializable {
    
    private String scheduleStreamMonday =    "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    private String scheduleStreamTuesday =   "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    private String scheduleStreamWednesday = "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    private String scheduleStreamThursday =  "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    private String scheduleStreamFriday =    "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    private String scheduleStreamSaturday =  "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    private String scheduleStreamSunday =    "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    private transient String currentState = "0";

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
    public void saveSchedule(String value, String schNb) {
            if (schNb.equals("0") || schNb.equals("1")) {
                String oldSch = getScheduleStreamMonday();
                String newSchPart = parseSchedule(value);
                if (schNb.equals("0")) oldSch = newSchPart + oldSch.substring(12*8);
                else oldSch = oldSch.substring(0, (12*8)) + newSchPart;
                setScheduleStreamMonday(oldSch);
            }
            if (schNb.equals("2") || schNb.equals("3")) {
                String oldSch = getScheduleStreamTuesday();
                String newSchPart = parseSchedule(value);
                if (schNb.equals("2")) oldSch = newSchPart + oldSch.substring(12*8);
                else oldSch = oldSch.substring(0, (12*8)) + newSchPart;
                setScheduleStreamTuesday(oldSch);
            }
            if (schNb.equals("4") || schNb.equals("5")) {
                String oldSch = getScheduleStreamWednesday();
                String newSchPart = parseSchedule(value);
                if (schNb.equals("4")) oldSch = newSchPart + oldSch.substring(12*8);
                else oldSch = oldSch.substring(0, (12*8)) + newSchPart;
                setScheduleStreamWednesday(oldSch);
            }
            if (schNb.equals("6") || schNb.equals("7")) {
                String oldSch = getScheduleStreamThursday();
                String newSchPart = parseSchedule(value);
                if (schNb.equals("6")) oldSch = newSchPart + oldSch.substring(12*8);
                else oldSch = oldSch.substring(0, (12*8)) + newSchPart;
                setScheduleStreamThursday(oldSch);
            }
            if (schNb.equals("8") || schNb.equals("9")) {
                String oldSch = getScheduleStreamFriday();
                String newSchPart = parseSchedule(value);
                if (schNb.equals("8")) oldSch = newSchPart + oldSch.substring(12*8);
                else oldSch = oldSch.substring(0, (12*8)) + newSchPart;
                setScheduleStreamFriday(oldSch);
            }
            if (schNb.equals("10") || schNb.equals("11")) {
                String oldSch = getScheduleStreamSaturday();
                String newSchPart = parseSchedule(value);
                if (schNb.equals("10")) oldSch = newSchPart + oldSch.substring(12*8);
                else oldSch = oldSch.substring(0, (12*8)) + newSchPart;
                setScheduleStreamSaturday(oldSch);
            }
            if (schNb.equals("12") || schNb.equals("13")) {
                String oldSch = getScheduleStreamSunday();
                String newSchPart = parseSchedule(value);
                if (schNb.equals("12")) oldSch = newSchPart + oldSch.substring(12*8);
                else oldSch = oldSch.substring(0, (12*8)) + newSchPart;
                setScheduleStreamSunday(oldSch);
            }
    } 
        private String parseSchedule(String in) {
        StringBuffer sb = new StringBuffer();
        for (int i=0; i<12; i++) {
            int piece = Integer.parseInt(in.substring(i*3, (i*3)+3));
            String binValue = Integer.toBinaryString(piece);
            while (binValue.length() < 8) binValue = "0" + binValue;
            sb.append(binValue);
        }
        return sb.toString();
    }
    public String loadSchedule() {
            StringBuffer sb = new StringBuffer();
            sb.append(getScheduleStreamMonday());
            sb.append(getScheduleStreamTuesday());
            sb.append(getScheduleStreamWednesday());
            sb.append(getScheduleStreamThursday());
            sb.append(getScheduleStreamFriday());
            sb.append(getScheduleStreamSaturday());
            sb.append(getScheduleStreamSunday());
            return sb.toString();
    }
    public Boolean processSchedule() {
        Calendar c = Calendar.getInstance();
        int min = c.get(Calendar.MINUTE);
        if ((min % 10) == 0) {
            int day = 0;
            int hour = c.get(Calendar.HOUR_OF_DAY);
            int d = c.get(Calendar.DAY_OF_WEEK);
            if (d == Calendar.MONDAY) day = 0;
            else if (d == Calendar.TUESDAY) day = 1;
            else if (d == Calendar.WEDNESDAY) day = 2;
            else if (d == Calendar.THURSDAY) day = 3;
            else if (d == Calendar.FRIDAY) day = 4;
            else if (d == Calendar.SATURDAY) day = 5;
            else if (d == Calendar.SUNDAY) day = 6;
            String sch = loadSchedule();
            String hourBits = sch.substring((day*24*8)+(hour*8), (day*24*8)+(hour*8)+8);
            String minute = Integer.toString(min);
            if (minute.length()==1) minute = "0" + minute;
            int m = Integer.parseInt(minute.substring(0,1));
            String minBit = hourBits.substring(m+2,m+3);
            if (minBit.equals("1") && getCurrentState().equals("0")) {
                setCurrentState(minBit);
                return true;
            } else if (minBit.equals("0") && getCurrentState().equals("1")) {
                setCurrentState(minBit);
                return false;
            }            
            setCurrentState(minBit);
        }
        return null;
    }
}
