/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rg.homeManager;

import java.io.IOException;
import java.util.Hashtable;
import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author pt596
 */
public class AlarmManager extends Thread {
    
    private Hashtable rooms = new Hashtable();
    private HomeCommunicator bt = null;
    private boolean running = false;
    private ServletConfig config;
    
    public AlarmManager(HomeCommunicator bt, ServletConfig config) {
        this.bt = bt;
        bt.setAlarmManager(this);
        this.config = config;
        loadDataFromDisk();
    }    
    public String getRoomNameById(int id) {
        
        AlarmData ad = (AlarmData)rooms.get(Integer.toString(id));
        return ad.getRoomName();
    }
    public void activateAlarm(int id) {
        if (id == 9) {
            for (int i=1; i<9; i++) {
                AlarmData ad = (AlarmData)rooms.get(Integer.toString(i));
                ad.activateAlarm();                
            }
            return;
        }
        AlarmData ad = (AlarmData)rooms.get(Integer.toString(id));
        ad.activateAlarm();
    }
    public void deActivateAlarm(int id) {
        if (id == 9) {
            for (int i=1; i<9; i++) {
                AlarmData ad = (AlarmData)rooms.get(Integer.toString(i));
                ad.deactivateAlarm();                
            }
            return;
        }
        AlarmData ad = (AlarmData)rooms.get(Integer.toString(id));
        ad.deactivateAlarm();
    }
    public void stopSiren() {
        try {
            bt.sendHTTPCommand("GET /mPINN");
        } catch (Exception e) {
            WebAdm.message("Cannot stop siren: "+e.getMessage());
        }   
    }
    public void simulateAlarm(int id) {
        if (id == 9) {
            for (int i=1; i<9; i++) {
                AlarmData ad = (AlarmData)rooms.get(Integer.toString(i));
                ad.fireAlarmEvent(i);                
            }
            return;
        }
        AlarmData ad = (AlarmData)rooms.get(Integer.toString(id));
        ad.fireAlarmEvent(id);
    }
    public String getAlarmStatus(String id) {
        if (id.equals("9")) {
            String retVal = "";
            for (int i=1; i<9; i++) {
                retVal += getAlarmStatus(Integer.toString(i));
                if (i!=8) retVal += ",";
            }
            return retVal;
        }
        AlarmData ad = (AlarmData)rooms.get(id);
        StringBuffer sb = new StringBuffer();
        sb.append(ad.getRoomName());
        sb.append("|");
        sb.append(Boolean.toString(ad.isAlarmActive()));
        sb.append("|");
        sb.append(Boolean.toString(ad.isAlarmActivated()));
        sb.append("|");
        sb.append(Boolean.toString(ad.isAlarmReported()));
        sb.append("|");
        sb.append(Integer.toString(ad.getEnterTimeoutCounter()));
        sb.append("|");
        sb.append(Integer.toString(ad.getLeaveTimeoutCounter()));
        sb.append("|");
        sb.append(Integer.toString(ad.getAlarmTimeoutCounter()));        
        sb.append("|");
        sb.append(Integer.toString(ad.getEnterTimeout()));        
        sb.append("|");
        sb.append(Integer.toString(ad.getLeaveTimeout()));        
        sb.append("|");
        sb.append(Integer.toString(ad.getAlarmTimeout()));        
        return sb.toString();
    }

    public String getAlarmConfig(int id) {
        AlarmData ad = (AlarmData)rooms.get(Integer.toString(id));
        StringBuffer sb = new StringBuffer();
        sb.append(ad.getRoomName());
        sb.append("|");
        sb.append(Integer.toString(ad.getEnterTimeout()));
        sb.append("|");
        sb.append(Integer.toString(ad.getLeaveTimeout()));
        sb.append("|");
        sb.append(Integer.toString(ad.getAlarmTimeout()));        
        sb.append("|");
        sb.append(ad.isLightOnMovement()? "checked":"");
        sb.append("|");
        sb.append(Integer.toString(ad.getLightOnMovementTimeout()));
        sb.append("|");
        sb.append(ad.isAlarmActionSiren()? "checked":"");
        sb.append("|");
        sb.append(ad.isAlarmActionEmail()? "checked":"");
        sb.append("|");
        sb.append(ad.getSmtpServer());
        sb.append("|");
        sb.append(ad.getSmtpUser());
        sb.append("|");
        sb.append(ad.getSmtpPassword());
        sb.append("|");
        sb.append(ad.getSmtpFromAddress());
        sb.append("|");
        sb.append(ad.getSmtpToAddress());
        sb.append("|");
        sb.append(ad.getSmtpSubject());
        sb.append("|");
        sb.append(ad.getSmtpMessage());
        return sb.toString();
    }

    public void saveAlarmConfig(int id, HttpServletRequest request) throws Exception {
        if (id == 9) {
            AlarmData oldData = (AlarmData)rooms.get(Integer.toString(9));
            if (oldData.getEnterTimeout() != Integer.parseInt(request.getParameter("al_et"))) {
                for (int i=1;i<9;i++) {
                    AlarmData ad = (AlarmData)rooms.get(Integer.toString(i));
                    ad.setEnterTimeout(Integer.parseInt(request.getParameter("al_et")));
                }
                oldData.setEnterTimeout(Integer.parseInt(request.getParameter("al_et")));
            }
            if (oldData.getLeaveTimeout() != Integer.parseInt(request.getParameter("al_lt"))) {
                for (int i=1;i<9;i++) {
                    AlarmData ad = (AlarmData)rooms.get(Integer.toString(i));
                    ad.setLeaveTimeout(Integer.parseInt(request.getParameter("al_lt")));
                }
                oldData.setLeaveTimeout(Integer.parseInt(request.getParameter("al_lt")));
            }
            if (oldData.getAlarmTimeout() != Integer.parseInt(request.getParameter("al_at"))) {
                for (int i=1;i<9;i++) {
                    AlarmData ad = (AlarmData)rooms.get(Integer.toString(i));
                    ad.setAlarmTimeout(Integer.parseInt(request.getParameter("al_at")));
                }
                oldData.setAlarmTimeout(Integer.parseInt(request.getParameter("al_at")));
            }
            if (oldData.isLightOnMovement() != Boolean.parseBoolean(request.getParameter("al_lm"))) {
                for (int i=1;i<9;i++) {
                    AlarmData ad = (AlarmData)rooms.get(Integer.toString(i));
                    ad.setLightOnMovement(Boolean.parseBoolean(request.getParameter("al_lm")));
                }
                oldData.setLightOnMovement(Boolean.parseBoolean(request.getParameter("al_lm")));
            }
            if (oldData.getLightOnMovementTimeout() != Integer.parseInt(request.getParameter("al_lmt"))) {
                for (int i=1;i<9;i++) {
                    AlarmData ad = (AlarmData)rooms.get(Integer.toString(i));
                    ad.setLightOnMovementTimeout(Integer.parseInt(request.getParameter("al_lmt")));
                }
                oldData.setLightOnMovementTimeout(Integer.parseInt(request.getParameter("al_lmt")));
            }
            if (oldData.isAlarmActionSiren() != Boolean.parseBoolean(request.getParameter("al_as"))) {
                for (int i=1;i<9;i++) {
                    AlarmData ad = (AlarmData)rooms.get(Integer.toString(i));
                    ad.setAlarmActionSiren(Boolean.parseBoolean(request.getParameter("al_as")));
                }
                oldData.setAlarmActionSiren(Boolean.parseBoolean(request.getParameter("al_as")));
            }
            if (oldData.isAlarmActionEmail() != Boolean.parseBoolean(request.getParameter("al_ae"))) {
                for (int i=1;i<9;i++) {
                    AlarmData ad = (AlarmData)rooms.get(Integer.toString(i));
                    ad.setAlarmActionEmail(Boolean.parseBoolean(request.getParameter("al_ae")));
                }
                oldData.setAlarmActionEmail(Boolean.parseBoolean(request.getParameter("al_ae")));
            }
            if (!oldData.getSmtpServer().equals(request.getParameter("al_ss"))) {
                for (int i=1;i<9;i++) {
                    AlarmData ad = (AlarmData)rooms.get(Integer.toString(i));
                    ad.setSmtpServer(request.getParameter("al_ss"));
                }
                oldData.setSmtpServer(request.getParameter("al_ss"));
            }
            if (!oldData.getSmtpUser().equals(request.getParameter("al_su"))) {
                for (int i=1;i<9;i++) {
                    AlarmData ad = (AlarmData)rooms.get(Integer.toString(i));
                    ad.setSmtpUser(request.getParameter("al_su"));
                }
                oldData.setSmtpUser(request.getParameter("al_su"));
            }
            if (!oldData.getSmtpPassword().equals(request.getParameter("al_sp"))) {
                for (int i=1;i<9;i++) {
                    AlarmData ad = (AlarmData)rooms.get(Integer.toString(i));
                    ad.setSmtpPassword(request.getParameter("al_sp"));
                }
                oldData.setSmtpPassword(request.getParameter("al_sp"));
            }
            if (!oldData.getSmtpFromAddress().equals(request.getParameter("al_sf"))) {
                for (int i=1;i<9;i++) {
                    AlarmData ad = (AlarmData)rooms.get(Integer.toString(i));
                    ad.setSmtpFromAddress(request.getParameter("al_sf"));
                }
                oldData.setSmtpFromAddress(request.getParameter("al_sf"));
            }
            if (!oldData.getSmtpToAddress().equals(request.getParameter("al_st"))) {
                for (int i=1;i<9;i++) {
                    AlarmData ad = (AlarmData)rooms.get(Integer.toString(i));
                    ad.setSmtpToAddress(request.getParameter("al_st"));
                }
                oldData.setSmtpToAddress(request.getParameter("al_st"));
            }
            if (!oldData.getSmtpSubject().equals(request.getParameter("al_sb"))) {
                for (int i=1;i<9;i++) {
                    AlarmData ad = (AlarmData)rooms.get(Integer.toString(i));
                    ad.setSmtpSubject(request.getParameter("al_sb"));
                }
                oldData.setSmtpSubject(request.getParameter("al_sb"));
            }
            if (!oldData.getSmtpMessage().equals(request.getParameter("al_sm"))) {
                for (int i=1;i<9;i++) {
                    AlarmData ad = (AlarmData)rooms.get(Integer.toString(i));
                    ad.setSmtpMessage(request.getParameter("al_sm"));
                }
                oldData.setSmtpMessage(request.getParameter("al_sm"));
            }
            for (int i=1;i<10;i++) {
                AlarmData ad = (AlarmData)rooms.get(Integer.toString(i));
                ad.save(config.getInitParameter("FILE_LOCATION")+"Alarm"+Integer.toString(i)+".xml");            
            }
            return;
        }
        AlarmData ad = (AlarmData)rooms.get(Integer.toString(id));
        ad.setEnterTimeout(Integer.parseInt(request.getParameter("al_et")));
        ad.setLeaveTimeout(Integer.parseInt(request.getParameter("al_lt")));
        ad.setAlarmTimeout(Integer.parseInt(request.getParameter("al_at")));
        ad.setLightOnMovement(Boolean.parseBoolean(request.getParameter("al_lm")));
        ad.setLightOnMovementTimeout(Integer.parseInt(request.getParameter("al_lmt")));
        ad.setAlarmActionSiren(Boolean.parseBoolean(request.getParameter("al_as")));
        ad.setAlarmActionEmail(Boolean.parseBoolean(request.getParameter("al_ae")));
        ad.setSmtpServer(request.getParameter("al_ss"));
        ad.setSmtpUser(request.getParameter("al_su"));
        ad.setSmtpPassword(request.getParameter("al_sp"));
        ad.setSmtpFromAddress(request.getParameter("al_sf"));
        ad.setSmtpToAddress(request.getParameter("al_st"));
        ad.setSmtpSubject(request.getParameter("al_sb"));
        ad.setSmtpMessage(request.getParameter("al_sm"));
        ad.save(config.getInitParameter("FILE_LOCATION")+"Alarm"+Integer.toString(id)+".xml");
    }

    public void fireAlarm(int alarm) {
        if ((alarm & 1) != 0) {
            ((AlarmData)rooms.get("1")).fireAlarmEvent(AlarmData.NAHORE);
        }
        if ((alarm & 2) != 0) {
            ((AlarmData)rooms.get("2")).fireAlarmEvent(AlarmData.NAHORE_SMOKE);
        }
        if ((alarm & 4) != 0) {
            ((AlarmData)rooms.get("3")).fireAlarmEvent(AlarmData.PREDSIN);
        }
        if ((alarm & 8) != 0) {
            ((AlarmData)rooms.get("4")).fireAlarmEvent(AlarmData.OBYVACI_POKOJ);
        }
        if ((alarm & 16) != 0) {
            ((AlarmData)rooms.get("5")).fireAlarmEvent(AlarmData.JASMINKA);
        }
        if ((alarm & 32) != 0) {
            ((AlarmData)rooms.get("6")).fireAlarmEvent(AlarmData.KANCELAR);
        }
        if ((alarm & 64) != 0) {
            ((AlarmData)rooms.get("7")).fireAlarmEvent(AlarmData.LOZNICE);
        }
        if ((alarm & 128) != 0) {
            ((AlarmData)rooms.get("8")).fireAlarmEvent(AlarmData.STARA_KUCHYN);
        }
    }
    public void loadDataFromDisk() {
        for (int i=1;i<10;i++) {
            rooms.put(Integer.toString(i), loadAlarmData(Integer.toString(i), config.getInitParameter("FILE_LOCATION")+"Alarm"+Integer.toString(i)+".xml"));
        }
    }

    private AlarmData loadAlarmData(String roomId, String fileName) {
        AlarmData al = new AlarmData(bt);
        try {
            al.load(fileName);
            return al;            
        } catch (IOException e) {
            //default
            try {
                al.setRoomId(Integer.parseInt(roomId));
                al.setEnterTimeout(30);
                al.setLeaveTimeout(30);
                al.setAlarmTimeout(0);
                al.setLightOnMovement(false);
                al.setLightOnMovementTimeout(5);
                al.setAlarmActionSiren(false);
                al.setAlarmActionEmail(false);
                al.setSmtpServer("77.75.76.48");
                al.setSmtpUser("robert.gregor");
                al.setSmtpPassword("wapman");
                al.setSmtpFromAddress("robert.gregor@seznam.cz");
                al.setSmtpToAddress("robert.gregor@vodafonemail.cz");
                al.setSmtpSubject("Home control center "+al.getRoomName());
                al.setSmtpMessage("Alarm raised in room "+al.getRoomName()+"!");
                al.save(fileName);
            } catch (IOException ee) {
                WebAdm.message(ee.getMessage());
            }
        }
        return al;
    }
        
    public void run() {
        running = true;
        while (running) {
            try {
                Thread.sleep(1000);
                for (int i=1; i<9; i++) {
                    AlarmData d = (AlarmData)rooms.get(Integer.toString(i));
                    d.manageSeconds();
                }
            } catch (InterruptedException ee) {
                return;
            }
        }        
    }
    
    public void destroy() {
        this.interrupt();
        running = false;
    }
}
