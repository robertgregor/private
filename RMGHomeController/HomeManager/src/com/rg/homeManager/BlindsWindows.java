/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rg.homeManager;

import java.io.IOException;
import java.util.Calendar;
import java.util.Hashtable;
import javax.servlet.ServletConfig;

/**
 *
 * @author rgregor
 */
public class BlindsWindows extends Thread {
    private HomeCommunicator bt = null;
    ServletConfig config;
    private Hashtable blinds = new Hashtable();
    private boolean schedulerRunning = false;
    private String BLIND_0_NAHORE_ALL = "vprpvpvplpvplpsplp";
    private String BLIND_0_NAHORE_ALL_PERIOD = "90";
    private String BLIND_1_NAHORE_SEVER = "vprpvpvplpvplplp";
    private String BLIND_1_NAHORE_SEVER_PERIOD = "90";
    private String BLIND_2_NAHORE_VYCHOD = "vprpvpvplpvplpspsplp";
    private String BLIND_2_NAHORE_VYCHOD_PERIOD = "90";
    private String BLIND_3_NAHORE_JIH = "vprpvpvplpvplvlp";
    private String BLIND_3_NAHORE_JIH_PERIOD = "90";
    private String BLIND_4_NAHORE_ZAPAD_LEFT = "vprpvpvplpvplvvlp";
    private String BLIND_4_NAHORE_ZAPAD_LEFT_PERIOD = "90";
    private String BLIND_5_NAHORE_ZAPAD_MIDDLE = "vprpvpvplpvplpvpvpvplp";
    private String BLIND_5_NAHORE_ZAPAD_MIDDLE_PERIOD = "90";
    private String BLIND_6_NAHORE_ZAPAD_RIGHT = "vprpvpvplpvplpspspsplp";
    private String BLIND_6_NAHORE_ZAPAD_RIGHT_PERIOD = "90";
    private String BLIND_7_JASMINKA = "vprpspsplp";
    private String BLIND_7_JASMINKA_PERIOD = "vprpspsplp";
    private String BLIND_8_KANCELAR = "vprpspspsplpvplp";
    private String BLIND_8_KANCELAR_PERIOD = "vprpspspsplpvplp";
    private String BLIND_9_OBYVAK = "vprpsplp";
    private String BLIND_9_OBYVAK_PERIOD = "vprpsplp";
    private String BLIND_10_STARA_KUCHYN = "";
    private String BLIND_10_STARA_KUCHYN_PERIOD = "90";
    private String BLIND_11_BALKONEK = "";
    private String BLIND_11_BALKONEK_PERIOD = "90";
    private String BLIND_12_LOZNICE_LEFT = "vprpvpvpvplpvplp";
    private String BLIND_12_LOZNICE_LEFT_PERIOD = "90";
    private String BLIND_13_LOZNICE_RIGHT = "";
    private String BLIND_13_LOZNICE_RIGHT_PERIOD = "90";
    private String BLIND_14_LOZNICE_ALL = BLIND_12_LOZNICE_LEFT;
    private String BLIND_14_LOZNICE_ALL_PERIOD = "90";
    private String BLIND_15_ALL = "vprplpvpl";
    private String BLIND_15_ALL_PERIOD = "90";
    private String WINDOW_16_ALL = "vprplpl";
    private String WINDOW_16_ALL_PERIOD = "90";
    private String WINDOW_17_NAHORE = "vprpvpvplplp";
    private String WINDOW_17_NAHORE_PERIOD = "90";
    private String WINDOW_18_KANCELAR = "vprpspspsplplp";
    private String WINDOW_18_KANCELAR_PERIOD = "90";
    private String WINDOW_19_LOZNICE = "vprpvpvpvplplp";
    private String WINDOW_19_LOZNICE_PERIOD = "90";
    private String VENETIAN_CROP_20_LOZNICE =  "vprpvpvpvplpvpvplplp";
    private String VENETIAN_CROP_20_LOZNICE_PERIOD =  "90";
    private String VENETIAN_TILT_21_LOZNICE =  "vprpvpvpvplpvpvplpvplp";
    private String VENETIAN_TILT_21_LOZNICE_PERIOD =  "90";
    private String VENETIAN_CROP_22_KANCELAR = "vprpspspsplpvpvplplp";
    private String VENETIAN_CROP_22_KANCELAR_PERIOD = "90";
    private String VENETIAN_TILT_23_KANCELAR = "vprpspspsplpvpvplpvplp";
    private String VENETIAN_TILT_23_KANCELAR_PERIOD = "90";
    
    
    public BlindsWindows(HomeCommunicator bt, ServletConfig config) {
        this.bt = bt;
        this.config = config;
        loadDataFromDisk();
    }
    
    public void loadDataFromDisk() {
        for (int i=0;i<24;i++) {
            blinds.put(Integer.toString(i), loadBlindData(Integer.toString(i), config.getInitParameter("FILE_LOCATION")+"Blind"+Integer.toString(i)+".xml"));
        }
    }
    
    private Schedule loadBlindData(String id, String fileName) {
        Schedule schedule = new Schedule();
        try {
            schedule.load(fileName);
            return schedule;            
        } catch (IOException e) {
            //default
            if (id.equals("0")) {
                schedule.setType(Schedule.ROLLER);
                schedule.setCommandOn("GET /ePINN"+BLIND_0_NAHORE_ALL+"d");
                schedule.setCommandOff("GET /ePINN"+BLIND_0_NAHORE_ALL+"u");
                schedule.setCommandStop("GET /ePINN"+BLIND_0_NAHORE_ALL+"m");
                schedule.setRunningPeriodSec(BLIND_0_NAHORE_ALL_PERIOD);
            } else if (id.equals("1")) {
                schedule.setType(Schedule.ROLLER);
                schedule.setCommandOn("GET /ePINN"+BLIND_1_NAHORE_SEVER+"d");
                schedule.setCommandOff("GET /ePINN"+BLIND_1_NAHORE_SEVER+"u");
                schedule.setCommandStop("GET /ePINN"+BLIND_1_NAHORE_SEVER+"m");
                schedule.setRunningPeriodSec(BLIND_1_NAHORE_SEVER_PERIOD);
            } else if (id.equals("2")) {
                schedule.setType(Schedule.ROLLER);
                schedule.setCommandOn("GET /ePINN"+BLIND_2_NAHORE_VYCHOD+"d");
                schedule.setCommandOff("GET /ePINN"+BLIND_2_NAHORE_VYCHOD+"u");
                schedule.setCommandStop("GET /ePINN"+BLIND_2_NAHORE_VYCHOD+"m");
                schedule.setRunningPeriodSec(BLIND_2_NAHORE_VYCHOD_PERIOD);
            } else if (id.equals("3")) {
                schedule.setType(Schedule.ROLLER);
                schedule.setCommandOn("GET /ePINN"+BLIND_3_NAHORE_JIH+"d");
                schedule.setCommandOff("GET /ePINN"+BLIND_3_NAHORE_JIH+"u");
                schedule.setCommandStop("GET /ePINN"+BLIND_3_NAHORE_JIH+"m");
                schedule.setRunningPeriodSec(BLIND_3_NAHORE_JIH_PERIOD);
            } else if (id.equals("4")) {
                schedule.setType(Schedule.ROLLER);
                schedule.setCommandOn("GET /ePINN"+BLIND_4_NAHORE_ZAPAD_LEFT+"d");
                schedule.setCommandOff("GET /ePINN"+BLIND_4_NAHORE_ZAPAD_LEFT+"u");
                schedule.setCommandStop("GET /ePINN"+BLIND_4_NAHORE_ZAPAD_LEFT+"m");
                schedule.setRunningPeriodSec(BLIND_4_NAHORE_ZAPAD_LEFT_PERIOD);
            } else if (id.equals("5")) {
                schedule.setType(Schedule.ROLLER);
                schedule.setCommandOn("GET /ePINN"+BLIND_5_NAHORE_ZAPAD_MIDDLE+"d");
                schedule.setCommandOff("GET /ePINN"+BLIND_5_NAHORE_ZAPAD_MIDDLE+"u");
                schedule.setCommandStop("GET /ePINN"+BLIND_5_NAHORE_ZAPAD_MIDDLE+"m");
                schedule.setRunningPeriodSec(BLIND_5_NAHORE_ZAPAD_MIDDLE_PERIOD);
            } else if (id.equals("6")) {
                schedule.setType(Schedule.ROLLER);
                schedule.setCommandOn("GET /ePINN"+BLIND_6_NAHORE_ZAPAD_RIGHT+"d");
                schedule.setCommandOff("GET /ePINN"+BLIND_6_NAHORE_ZAPAD_RIGHT+"u");
                schedule.setCommandStop("GET /ePINN"+BLIND_6_NAHORE_ZAPAD_RIGHT+"m");
                schedule.setRunningPeriodSec(BLIND_6_NAHORE_ZAPAD_RIGHT_PERIOD);
            } else if (id.equals("7")) {
                schedule.setType(Schedule.ROLLER);
                schedule.setCommandOn("GET /ePINN"+BLIND_7_JASMINKA+"d");
                schedule.setCommandOff("GET /ePINN"+BLIND_7_JASMINKA+"u");
                schedule.setCommandStop("GET /ePINN"+BLIND_7_JASMINKA+"m");
                schedule.setRunningPeriodSec(BLIND_7_JASMINKA_PERIOD);
            } else if (id.equals("8")) {
                schedule.setType(Schedule.ROLLER);
                schedule.setCommandOn("GET /ePINN"+BLIND_8_KANCELAR+"d");
                schedule.setCommandOff("GET /ePINN"+BLIND_8_KANCELAR+"u");
                schedule.setCommandStop("GET /ePINN"+BLIND_8_KANCELAR+"m");
                schedule.setRunningPeriodSec(BLIND_8_KANCELAR_PERIOD);
            } else if (id.equals("9")) {
                schedule.setType(Schedule.ROLLER);
                schedule.setCommandOn("GET /ePINN"+BLIND_9_OBYVAK+"d");
                schedule.setCommandOff("GET /ePINN"+BLIND_9_OBYVAK+"u");
                schedule.setCommandStop("GET /ePINN"+BLIND_9_OBYVAK+"m");
                schedule.setRunningPeriodSec(BLIND_9_OBYVAK_PERIOD);
            } else if (id.equals("10")) {
                schedule.setType(Schedule.ROLLER);
                schedule.setCommandOn("GET /1PINN"+BLIND_10_STARA_KUCHYN);
                schedule.setCommandOff("GET /2PINN"+BLIND_10_STARA_KUCHYN);
                schedule.setCommandStop("GET /7PINN?a=1"+BLIND_10_STARA_KUCHYN);
                schedule.setRunningPeriodSec(BLIND_10_STARA_KUCHYN_PERIOD);
            } else if (id.equals("11")) {
                schedule.setType(Schedule.ROLLER);
                schedule.setCommandOn("GET /3PINN"+BLIND_11_BALKONEK);
                schedule.setCommandOff("GET /4PINN"+BLIND_11_BALKONEK);
                schedule.setCommandStop("GET /7PINN?a=2"+BLIND_11_BALKONEK);
                schedule.setRunningPeriodSec(BLIND_11_BALKONEK_PERIOD);
            } else if (id.equals("12")) {
                schedule.setType(Schedule.ROLLER);
                schedule.setCommandOn("GET /ePINN"+BLIND_12_LOZNICE_LEFT+"d");
                schedule.setCommandOff("GET /ePINN"+BLIND_12_LOZNICE_LEFT+"u");
                schedule.setCommandStop("GET /ePINN"+BLIND_12_LOZNICE_LEFT+"m");
                schedule.setRunningPeriodSec(BLIND_12_LOZNICE_LEFT_PERIOD);
            } else if (id.equals("13")) {
                schedule.setType(Schedule.ROLLER);
                schedule.setCommandOn("GET /5PINN"+BLIND_13_LOZNICE_RIGHT);
                schedule.setCommandOff("GET /6PINN"+BLIND_13_LOZNICE_RIGHT);
                schedule.setCommandStop("GET /7PINN?a=3"+BLIND_13_LOZNICE_RIGHT);
                schedule.setRunningPeriodSec(BLIND_13_LOZNICE_RIGHT_PERIOD);
            } else if (id.equals("14")) {
                schedule.setType(Schedule.ROLLER);
                schedule.setCommandOn("GET /5PINN|GET /ePINN"+BLIND_14_LOZNICE_ALL+"d");
                schedule.setCommandOff("GET /6PINN|GET /ePINN"+BLIND_14_LOZNICE_ALL+"u");
                schedule.setCommandStop("GET /7PINN?a=3|GET /ePINN"+BLIND_14_LOZNICE_ALL+"m");
                schedule.setRunningPeriodSec(BLIND_14_LOZNICE_ALL_PERIOD);
            } else if (id.equals("15")) {
                schedule.setType(Schedule.ROLLER);
                schedule.setCommandOn("GET /1PINN|GET /3PINN|GET /5PINN|GET /ePINN"+BLIND_15_ALL+"d");
                schedule.setCommandOff("GET /2PINN|GET /4PINN|GET /6PINN|GET /ePINN"+BLIND_15_ALL+"u");
                schedule.setCommandStop("GET /7PINN|GET /ePINN"+BLIND_15_ALL+"m");
                schedule.setRunningPeriodSec(BLIND_15_ALL_PERIOD);
            } else if (id.equals("16")) {
                schedule.setType(Schedule.WINDOW);
                schedule.setCommandOn("GET /ePINN"+WINDOW_16_ALL+"d");
                schedule.setCommandOff("GET /ePINN"+WINDOW_16_ALL+"u");
                schedule.setCommandStop("GET /ePINN"+WINDOW_16_ALL+"m");
                schedule.setRunningPeriodSec(WINDOW_16_ALL_PERIOD);
            } else if (id.equals("17")) {
                schedule.setType(Schedule.WINDOW);
                schedule.setCommandOn("GET /ePINN"+WINDOW_17_NAHORE+"d");
                schedule.setCommandOff("GET /ePINN"+WINDOW_17_NAHORE+"u");
                schedule.setCommandStop("GET /ePINN"+WINDOW_17_NAHORE+"m");
                schedule.setRunningPeriodSec(WINDOW_17_NAHORE_PERIOD);
            } else if (id.equals("18")) {
                schedule.setType(Schedule.WINDOW);
                schedule.setCommandOn("GET /ePINN"+WINDOW_18_KANCELAR+"d");
                schedule.setCommandOff("GET /ePINN"+WINDOW_18_KANCELAR+"u");
                schedule.setCommandStop("GET /ePINN"+WINDOW_18_KANCELAR+"m");
                schedule.setRunningPeriodSec(WINDOW_18_KANCELAR_PERIOD);
            } else if (id.equals("19")) {
                schedule.setType(Schedule.WINDOW);
                schedule.setCommandOn("GET /ePINN"+WINDOW_19_LOZNICE+"d");
                schedule.setCommandOff("GET /ePINN"+WINDOW_19_LOZNICE+"u");
                schedule.setCommandStop("GET /ePINN"+WINDOW_19_LOZNICE+"m");
                schedule.setRunningPeriodSec(WINDOW_19_LOZNICE_PERIOD);
            } else if (id.equals("20")) {
                schedule.setType(Schedule.WENETIANCROP);
                schedule.setCommandOn("GET /ePINN"+VENETIAN_CROP_20_LOZNICE+"d");
                schedule.setCommandOff("GET /ePINN"+VENETIAN_CROP_20_LOZNICE+"u");
                schedule.setCommandStop("GET /ePINN"+VENETIAN_CROP_20_LOZNICE+"m");
                schedule.setRunningPeriodSec(VENETIAN_CROP_20_LOZNICE_PERIOD);
            } else if (id.equals("21")) {
                schedule.setType(Schedule.WENETIANTILT);
                schedule.setCommandOn("GET /ePINN"+VENETIAN_TILT_21_LOZNICE+"d");
                schedule.setCommandOff("GET /ePINN"+VENETIAN_TILT_21_LOZNICE+"u");
                schedule.setCommandStop("GET /ePINN"+VENETIAN_TILT_21_LOZNICE+"m");
                schedule.setRunningPeriodSec(VENETIAN_TILT_21_LOZNICE_PERIOD);
            } else if (id.equals("22")) {
                schedule.setType(Schedule.WENETIANCROP);
                schedule.setCommandOn("GET /ePINN"+VENETIAN_CROP_22_KANCELAR+"d");
                schedule.setCommandOff("GET /ePINN"+VENETIAN_CROP_22_KANCELAR+"u");
                schedule.setCommandStop("GET /ePINN"+VENETIAN_CROP_22_KANCELAR+"m");
                schedule.setRunningPeriodSec(VENETIAN_CROP_22_KANCELAR_PERIOD);
            } else if (id.equals("23")) {
                schedule.setType(Schedule.WENETIANTILT);
                schedule.setCommandOn("GET /ePINN"+VENETIAN_TILT_23_KANCELAR+"d");
                schedule.setCommandOff("GET /ePINN"+VENETIAN_TILT_23_KANCELAR+"u");
                schedule.setCommandStop("GET /ePINN"+VENETIAN_TILT_23_KANCELAR+"m");
                schedule.setRunningPeriodSec(VENETIAN_TILT_23_KANCELAR_PERIOD);
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
            Schedule day = (Schedule)blinds.get(id);
            if (schNb.equals("0") || schNb.equals("1")) {
                String oldSch = day.getScheduleStreamMonday();
                String newSchPart = parseSchedule(value);
                if (schNb.equals("0")) oldSch = newSchPart + oldSch.substring(12*8);
                else oldSch = oldSch.substring(0, (12*8)) + newSchPart;
                day.setScheduleStreamMonday(oldSch);
                try {
                    day.save(config.getInitParameter("FILE_LOCATION")+"Blind"+id+".xml");
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
                    day.save(config.getInitParameter("FILE_LOCATION")+"Blind"+id+".xml");
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
                    day.save(config.getInitParameter("FILE_LOCATION")+"Blind"+id+".xml");
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
                    day.save(config.getInitParameter("FILE_LOCATION")+"Blind"+id+".xml");
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
                    day.save(config.getInitParameter("FILE_LOCATION")+"Blind"+id+".xml");
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
                    day.save(config.getInitParameter("FILE_LOCATION")+"Blind"+id+".xml");
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
                    day.save(config.getInitParameter("FILE_LOCATION")+"Blind"+id+".xml");
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
            Schedule day = (Schedule)blinds.get(id);
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
        String minute = Integer.toString(min);
        if (minute.length()==1) minute = "0" + minute;
        int m = Integer.parseInt(minute.substring(0,1));
        String minBit = hourBits.substring(m+2,m+3);
        if (minBit.equals("1") && s.getCurrentState().equals("0")) {
            //executeOn
            //WebAdm.message("Scheduler: Executing command on: "+s.getCommandOn());
            bt.executeSchedulerCommand(s.getCommandOn());
            try {
                Thread.sleep(40000);
            } catch (InterruptedException e) {
                return;
            }
        } else if (minBit.equals("0") && s.getCurrentState().equals("1")) {
            //executeOff
            //WebAdm.message("Scheduler: Executing command off: "+s.getCommandOff());
            bt.executeSchedulerCommand(s.getCommandOff());
            try {
                Thread.sleep(40000);
            } catch (InterruptedException e) {
                return;
            }
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
                    for (int i=0;i<blinds.size();i++) {
                        Schedule sch = (Schedule)blinds.get(Integer.toString(i));
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
    public void down(String id) throws IOException {
        Schedule sch = (Schedule)blinds.get(id);
        WebAdm.message("Going to execute down command: "+sch.getCommandOn());
        bt.sendHTTPCommand(sch.getCommandOn());
    }
    public void up(String id) throws IOException {
        Schedule sch = (Schedule)blinds.get(id);
        WebAdm.message("Going to execute up command: "+sch.getCommandOff());
        bt.sendHTTPCommand(sch.getCommandOff());
    }
    public void stop(String id) throws IOException {
        Schedule sch = (Schedule)blinds.get(id);
        WebAdm.message("Going to execute stop command: "+sch.getCommandOff());
        bt.sendHTTPCommand(sch.getCommandStop());
    }
}
