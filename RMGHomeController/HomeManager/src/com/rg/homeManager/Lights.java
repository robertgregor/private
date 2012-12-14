/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rg.homeManager;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.Hashtable;
import javax.servlet.ServletConfig;

/**
 *
 * @author pt596
 */
public class Lights extends Thread {
    
    private HomeCommunicator bt = null;
    ServletConfig config;
    private Hashtable lights = new Hashtable();
    private boolean schedulerRunning = false;
    
    public Lights(HomeCommunicator bt, ServletConfig config) {
        this.bt = bt;
        this.config = config;
        loadDataFromDisk();
    }
    
    public void loadDataFromDisk() {
        for (int i=0;i<11;i++) {
            lights.put(Integer.toString(i), loadLightData(Integer.toString(i), config.getInitParameter("FILE_LOCATION")+"Light"+Integer.toString(i)+".xml"));
        }
    }
    
    private Schedule loadLightData(String id, String fileName) {
        Schedule schedule = new Schedule();
        try {
            schedule.load(fileName);
            return schedule;            
        } catch (IOException e) {
            //default
            if (!id.equals("9") && !id.equals("10")) {
                schedule.setType(Schedule.LIGHT);
                schedule.setCommandOn("GET /bPINN?a="+id);
                schedule.setCommandOff("GET /cPINN?a="+id);
            } else if (id.equals("9")) {
                schedule.setType(Schedule.LIGHT);
                schedule.setCommandOn("GET /8PINN");
                schedule.setCommandOff("GET /9PINN");                
            } else if (id.equals("10")) {
                schedule.setType(Schedule.LIGHT);
                schedule.setCommandOn("GET /bPINN?a=0|GET /bPINN?a=1|GET /bPINN?a=2|GET /bPINN?a=3|GET /bPINN?a=4|GET /bPINN?a=5|GET /bPINN?a=6|GET /bPINN?a=7|GET /bPINN?a=8|GET /8PINN");
                schedule.setCommandOff("GET /cPINN?a=0|GET /cPINN?a=1|GET /cPINN?a=2|GET /cPINN?a=3|GET /cPINN?a=4|GET /cPINN?a=5|GET /cPINN?a=6|GET /cPINN?a=7|GET /cPINN?a=8|GET /9PINN");
            }
            try {
                schedule.save(fileName);
            } catch (IOException ee) {
                WebAdm.message(ee.getMessage());
            }
        }
        return schedule;
    }
    
    public synchronized void saveSchedule(String id, String value, String schNb) {
            Schedule day = (Schedule)lights.get(id);
            if (schNb.equals("0") || schNb.equals("1")) {
                String oldSch = day.getScheduleStreamMonday();
                String newSchPart = parseSchedule(value);
                if (schNb.equals("0")) oldSch = newSchPart + oldSch.substring(12*8);
                else oldSch = oldSch.substring(0, (12*8)) + newSchPart;
                day.setScheduleStreamMonday(oldSch);
                try {
                    day.save(config.getInitParameter("FILE_LOCATION")+"Light"+id+".xml");
                } catch (IOException e) {
                    WebAdm.message(e.getMessage());
                }
            }
            if (schNb.equals("2") || schNb.equals("3")) {
                String oldSch = day.getScheduleStreamTuesday();
                String newSchPart = parseSchedule(value);
                if (schNb.equals("2")) oldSch = newSchPart + oldSch.substring(12*8);
                else oldSch = oldSch.substring(0, (12*8)) + newSchPart;
                day.setScheduleStreamTuesday(oldSch);
                try {
                    day.save(config.getInitParameter("FILE_LOCATION")+"Light"+id+".xml");
                } catch (IOException e) {
                    WebAdm.message(e.getMessage());
                }
            }
            if (schNb.equals("4") || schNb.equals("5")) {
                String oldSch = day.getScheduleStreamWednesday();
                String newSchPart = parseSchedule(value);
                if (schNb.equals("4")) oldSch = newSchPart + oldSch.substring(12*8);
                else oldSch = oldSch.substring(0, (12*8)) + newSchPart;
                day.setScheduleStreamWednesday(oldSch);
                try {
                    day.save(config.getInitParameter("FILE_LOCATION")+"Light"+id+".xml");
                } catch (IOException e) {
                    WebAdm.message(e.getMessage());
                }
            }
            if (schNb.equals("6") || schNb.equals("7")) {
                String oldSch = day.getScheduleStreamThursday();
                String newSchPart = parseSchedule(value);
                if (schNb.equals("6")) oldSch = newSchPart + oldSch.substring(12*8);
                else oldSch = oldSch.substring(0, (12*8)) + newSchPart;
                day.setScheduleStreamThursday(oldSch);
                try {
                    day.save(config.getInitParameter("FILE_LOCATION")+"Light"+id+".xml");
                } catch (IOException e) {
                    WebAdm.message(e.getMessage());
                }
            }
            if (schNb.equals("8") || schNb.equals("9")) {
                String oldSch = day.getScheduleStreamFriday();
                String newSchPart = parseSchedule(value);
                if (schNb.equals("8")) oldSch = newSchPart + oldSch.substring(12*8);
                else oldSch = oldSch.substring(0, (12*8)) + newSchPart;
                day.setScheduleStreamFriday(oldSch);
                try {
                    day.save(config.getInitParameter("FILE_LOCATION")+"Light"+id+".xml");
                } catch (IOException e) {
                    WebAdm.message(e.getMessage());
                }
            }
            if (schNb.equals("10") || schNb.equals("11")) {
                String oldSch = day.getScheduleStreamSaturday();
                String newSchPart = parseSchedule(value);
                if (schNb.equals("10")) oldSch = newSchPart + oldSch.substring(12*8);
                else oldSch = oldSch.substring(0, (12*8)) + newSchPart;
                day.setScheduleStreamSaturday(oldSch);
                try {
                    day.save(config.getInitParameter("FILE_LOCATION")+"Light"+id+".xml");
                } catch (IOException e) {
                    WebAdm.message(e.getMessage());
                }
            }
            if (schNb.equals("12") || schNb.equals("13")) {
                String oldSch = day.getScheduleStreamSunday();
                String newSchPart = parseSchedule(value);
                if (schNb.equals("12")) oldSch = newSchPart + oldSch.substring(12*8);
                else oldSch = oldSch.substring(0, (12*8)) + newSchPart;
                day.setScheduleStreamSunday(oldSch);
                try {
                    day.save(config.getInitParameter("FILE_LOCATION")+"Light"+id+".xml");
                } catch (IOException e) {
                    WebAdm.message(e.getMessage());
                }
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
    public synchronized String loadSchedule(String id) {
            Schedule day = (Schedule)lights.get(id);
            StringBuffer sb = new StringBuffer();
            sb.append(day.getScheduleStreamMonday());
            sb.append(day.getScheduleStreamTuesday());
            sb.append(day.getScheduleStreamWednesday());
            sb.append(day.getScheduleStreamThursday());
            sb.append(day.getScheduleStreamFriday());
            sb.append(day.getScheduleStreamSaturday());
            sb.append(day.getScheduleStreamSunday());
            return sb.toString();
    }    
    
    public void processSchedule(String sch, int day, int hour, int min, Schedule s) {
        //get hour
        String hourBits = sch.substring((day*24*8)+(hour*8), (day*24*8)+(hour*8)+8);
        //WebAdm.message("HourBit: "+hourBits);
        String minute = Integer.toString(min);
        //WebAdm.message("Minute: "+minute);
        if (minute.length()==1) minute = "0" + minute;
        int m = Integer.parseInt(minute.substring(0,1));
        //WebAdm.message("Minute from time: "+m);
        String minBit = hourBits.substring(m+2,m+3);
        //WebAdm.message("MinBit: "+minBit);
        //WebAdm.message("Current state: "+s.getCurrentState());
        if (minBit.equals("1") && s.getCurrentState().equals("0")) {
            //executeOn
            //WebAdm.message("Scheduler: Executing command on: "+s.getCommandOn());
            bt.executeSchedulerCommand(s.getCommandOn());
        } else if (minBit.equals("0") && s.getCurrentState().equals("1")) {
            //executeOff
            //WebAdm.message("Scheduler: Executing command on: "+s.getCommandOff());
            bt.executeSchedulerCommand(s.getCommandOff());
        }
        s.setCurrentState(minBit);
    }
    
    public void run() {
        schedulerRunning = true;
        while (schedulerRunning) {
            try {
                Thread.sleep(25000);
                Calendar c = Calendar.getInstance();
                int minute = c.get(Calendar.MINUTE);
                if ((minute % 10) == 0) {
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
                    for (int i=0;i<lights.size();i++) {
                        Schedule sch = (Schedule)lights.get(Integer.toString(i));
                        String schedule = loadSchedule(Integer.toString(i));
                        processSchedule(schedule, day, hour, minute, sch);
                    }
                    Thread.sleep(25000);
                }
            } catch (InterruptedException e) {
                  return;
            }
        }
    }
    public void destroy() {
        this.interrupt();
        schedulerRunning = false;
    }
}
