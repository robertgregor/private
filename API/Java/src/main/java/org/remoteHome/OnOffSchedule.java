/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome;

import java.io.Serializable;
import java.util.Calendar;

/**
 * This class represents the week on off schedule
 * The day strings represents the schedule stream. Each 10 minute interval is represented by one bit, one hour is represented by one byte.
 * So e.g. 00111000 means, that from 0 - 30 minutes it is on, from 30 - 60 minute it is off.
 * By default whole day is off:
 * 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
 * So in total, there is 24 * 8 = 192 characters. In each hour, first two characters are ignored. 
 */

public class OnOffSchedule extends AbstractSchedule {

    public OnOffSchedule() {
        scheduleStreamMonday =    "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        scheduleStreamTuesday =   "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        scheduleStreamWednesday = "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        scheduleStreamThursday =  "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        scheduleStreamFriday =    "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        scheduleStreamSaturday =  "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        scheduleStreamSunday =    "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    }
    /*
     * This method is used to receive the schedule for external source in decimal mode, so each byte
     * is represented by the 3 digit number.
     * @param value is the schedule string, represents 12 3 digits number
     * @param schNb is the schedule number. 0 means Monday AM, 1 means Monday PM, 2 means Tuesday AM and so on.
     */
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
    
    /**
     * @return stream with all schedules started from Monday 
     */
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
    
    /**
     * This method will return the realtime schedule
     * @return true, if it is 1, false if it 0
     */
    public boolean getCurrentSchedule() {
        Calendar c = Calendar.getInstance();
        int min = c.get(Calendar.MINUTE);
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
        return minBit.equals("1");
    }
}
