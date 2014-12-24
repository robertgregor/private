/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome;

import java.util.Calendar;

/**
 * This class represents the week percentage schedule
 * The day strings represents the schedule stream. Each 10 minute interval is represented by one hex number, one hour is represented by 6 hex numbers.
 * The percentage is represented as the hex number. It means, that e.g 32 hexa is 50%.
 * By default whole day is set to 0%:
 * 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
 * So in total, there is 24 * 6 = 144 hex numbers.
 */


public class PercentageSchedule extends AbstractSchedule {

    public PercentageSchedule() {
        scheduleStreamMonday =    "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        scheduleStreamTuesday =   "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        scheduleStreamWednesday = "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        scheduleStreamThursday =  "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        scheduleStreamFriday =    "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        scheduleStreamSaturday =  "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
        scheduleStreamSunday =    "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    }

    /*
     * This method is used to receive the schedule hex format.
     * @param value is the schedule string, represents 24 * 6 hexa digits number
     * @param schNb is the schedule number. 0 means Monday AM, 1 means Monday PM, 2 means Tuesday AM and so on.
     */
    public void saveSchedule(String value, String schNb) {
            if (schNb.equals("0") || schNb.equals("1")) {
                String oldSch = getScheduleStreamMonday();
                String newSchPart = (value);
                if (schNb.equals("0")) oldSch = newSchPart + oldSch.substring(12*12);
                else oldSch = oldSch.substring(0, (12*12)) + newSchPart;
                setScheduleStreamMonday(oldSch);
            }
            if (schNb.equals("2") || schNb.equals("3")) {
                String oldSch = getScheduleStreamTuesday();
                String newSchPart = (value);
                if (schNb.equals("2")) oldSch = newSchPart + oldSch.substring(12*12);
                else oldSch = oldSch.substring(0, (12*12)) + newSchPart;
                setScheduleStreamTuesday(oldSch);
            }
            if (schNb.equals("4") || schNb.equals("5")) {
                String oldSch = getScheduleStreamWednesday();
                String newSchPart = (value);
                if (schNb.equals("4")) oldSch = newSchPart + oldSch.substring(12*12);
                else oldSch = oldSch.substring(0, (12*12)) + newSchPart;
                setScheduleStreamWednesday(oldSch);
            }
            if (schNb.equals("6") || schNb.equals("7")) {
                String oldSch = getScheduleStreamThursday();
                String newSchPart = (value);
                if (schNb.equals("6")) oldSch = newSchPart + oldSch.substring(12*12);
                else oldSch = oldSch.substring(0, (12*12)) + newSchPart;
                setScheduleStreamThursday(oldSch);
            }
            if (schNb.equals("8") || schNb.equals("9")) {
                String oldSch = getScheduleStreamFriday();
                String newSchPart = (value);
                if (schNb.equals("8")) oldSch = newSchPart + oldSch.substring(12*12);
                else oldSch = oldSch.substring(0, (12*12)) + newSchPart;
                setScheduleStreamFriday(oldSch);
            }
            if (schNb.equals("10") || schNb.equals("11")) {
                String oldSch = getScheduleStreamSaturday();
                String newSchPart = (value);
                if (schNb.equals("10")) oldSch = newSchPart + oldSch.substring(12*12);
                else oldSch = oldSch.substring(0, (12*12)) + newSchPart;
                setScheduleStreamSaturday(oldSch);
            }
            if (schNb.equals("12") || schNb.equals("13")) {
                String oldSch = getScheduleStreamSunday();
                String newSchPart = (value);
                if (schNb.equals("12")) oldSch = newSchPart + oldSch.substring(12*12);
                else oldSch = oldSch.substring(0, (12*12)) + newSchPart;
                setScheduleStreamSunday(oldSch);
            }
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
     * This method will process the realtime schedule
     * @return decimal value of the expected position between 0 and 100.
     */
    public int processSchedule() {
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
        String hourValues = sch.substring((day*24*12)+(hour*12), (day*24*12)+(hour*12)+12);
        String percent = hourValues.substring((min/10)*2, ((min/10)*2)+2);
        return Integer.parseInt(percent, 16);
    }
}
