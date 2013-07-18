/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome;

import java.util.Calendar;

/**
 * This class represents the week temperature schedule
 * The day strings represents the schedule stream. Each 15 minute interval is represented by one hex number, one hour is represented by 4 hex numbers.
 * The temperature is represented as the multiply of 0.5 degree celsius. It means, that e.g 29 is 41, which is 20,5 degree celsius
 * By default whole day is set to 20,5:
 * 292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929
 * So in total, there is 24 * 4 = 96 hex numbers.
 */

public class TemperatureSchedule  extends AbstractSchedule {
    
    private transient String currentState = "";

    public TemperatureSchedule() {
        scheduleStreamMonday =    "292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929";
        scheduleStreamTuesday =   "292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929";
        scheduleStreamWednesday = "292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929";
        scheduleStreamThursday =  "292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929";
        scheduleStreamFriday =    "292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929";
        scheduleStreamSaturday =  "292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929";
        scheduleStreamSunday =    "292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929292929";
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
    /*
     * This method is used to receive the schedule hex format.
     * @param value is the schedule string, represents 24 * 4 hexa digits number
     * @param schNb is the schedule number. 0 means Monday AM, 1 means Monday PM, 2 means Tuesday AM and so on.
     */
    public void saveSchedule(String value, String schNb) {
            if (schNb.equals("0") || schNb.equals("1")) {
                String oldSch = getScheduleStreamMonday();
                String newSchPart = (value);
                if (schNb.equals("0")) oldSch = newSchPart + oldSch.substring(12*8);
                else oldSch = oldSch.substring(0, (12*8)) + newSchPart;
                setScheduleStreamMonday(oldSch);
            }
            if (schNb.equals("2") || schNb.equals("3")) {
                String oldSch = getScheduleStreamTuesday();
                String newSchPart = (value);
                if (schNb.equals("2")) oldSch = newSchPart + oldSch.substring(12*8);
                else oldSch = oldSch.substring(0, (12*8)) + newSchPart;
                setScheduleStreamTuesday(oldSch);
            }
            if (schNb.equals("4") || schNb.equals("5")) {
                String oldSch = getScheduleStreamWednesday();
                String newSchPart = (value);
                if (schNb.equals("4")) oldSch = newSchPart + oldSch.substring(12*8);
                else oldSch = oldSch.substring(0, (12*8)) + newSchPart;
                setScheduleStreamWednesday(oldSch);
            }
            if (schNb.equals("6") || schNb.equals("7")) {
                String oldSch = getScheduleStreamThursday();
                String newSchPart = (value);
                if (schNb.equals("6")) oldSch = newSchPart + oldSch.substring(12*8);
                else oldSch = oldSch.substring(0, (12*8)) + newSchPart;
                setScheduleStreamThursday(oldSch);
            }
            if (schNb.equals("8") || schNb.equals("9")) {
                String oldSch = getScheduleStreamFriday();
                String newSchPart = (value);
                if (schNb.equals("8")) oldSch = newSchPart + oldSch.substring(12*8);
                else oldSch = oldSch.substring(0, (12*8)) + newSchPart;
                setScheduleStreamFriday(oldSch);
            }
            if (schNb.equals("10") || schNb.equals("11")) {
                String oldSch = getScheduleStreamSaturday();
                String newSchPart = (value);
                if (schNb.equals("10")) oldSch = newSchPart + oldSch.substring(12*8);
                else oldSch = oldSch.substring(0, (12*8)) + newSchPart;
                setScheduleStreamSaturday(oldSch);
            }
            if (schNb.equals("12") || schNb.equals("13")) {
                String oldSch = getScheduleStreamSunday();
                String newSchPart = (value);
                if (schNb.equals("12")) oldSch = newSchPart + oldSch.substring(12*8);
                else oldSch = oldSch.substring(0, (12*8)) + newSchPart;
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
     * @return decimal value of the expected temperature ( e.g. 41 means 205 (20.5) degree celsius - (41 * 10) / 2) or null, if the value has not been changed.
     * It also returns null, if the min % 15 != 0
     */
    public Integer processSchedule() {
        Calendar c = Calendar.getInstance();
        int min = c.get(Calendar.MINUTE);
        if (((min % 15) == 0) || (min == 0)) {
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
            String hourValues = sch.substring((day*24*8)+(hour*8), (day*24*8)+(hour*8)+8);
            String temperature = hourValues.substring((min/15)*2, ((min/15)*2)+2);
            if (!temperature.equalsIgnoreCase(getCurrentState())) {
                setCurrentState(temperature);
                return (Integer.parseInt(temperature, 16) * 10) / 2;
            } else {
                return null;
            }            
        }
        return null;
    }
    /**
     * This method will return current expected temperature value 
     * @return decimal value of the expected temperature ( e.g. 41 means 205 (20.5) degree celsius - (41 * 10) / 2)
     */
    public Integer getCurrentExpectedValue() {
        Calendar c = Calendar.getInstance();
        int min = c.get(Calendar.MINUTE);
        int minRange = 0;
        if (min <= 15) {
            minRange = 0;
        } else if ((min > 15) && (min <= 30)) {
            minRange = 15;
        } else if ((min > 30) && (min <= 45)) {
            minRange = 30;
        } else if (min > 45) {
            minRange = 45;
        }
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
        String hourValues = sch.substring((day*24*8)+(hour*8), (day*24*8)+(hour*8)+8);
        String temperature = hourValues.substring((minRange/15)*2, ((minRange/15)*2)+2);
        return (Integer.parseInt(temperature, 16) * 10) / 2;
    }
}