/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import org.remoteHome.AbstractDevice;
import org.remoteHome.Group;
import org.remoteHome.PirSensorDevice;
import org.remoteHome.RemoteHomeManager;

/**
 *
 * @author gregorro
 */
public class PirSensorDeviceManager extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        boolean refresh = false;
        try {
            PirSensorDevice device = (PirSensorDevice)r.getDevice(Integer.parseInt(requestParameters.get("deviceId")));
            String action = requestParameters.get("action");
            if (action.equals("CONFIGURE")) {
                if (user.getGroup().equals(Group.ADMIN_GROUP)) {
                    String nm = requestParameters.get("nm");
                    Boolean alEnabledScheduler = new Boolean(requestParameters.get("alschenabled"));
                    Boolean swEnabledScheduler = new Boolean(requestParameters.get("swschenabled"));
                    Boolean emailFirstTimeEnabled = new Boolean(requestParameters.get("emailFirstTimeEnabled"));
                    Boolean emailEveryTimeEnabled = new Boolean(requestParameters.get("emailEveryTimeEnabled"));
                    String room = requestParameters.get("room");
                    int tm = Integer.parseInt(requestParameters.get("tm"));
                    String smtpToForm = requestParameters.get("smtpToForm"); 
                    if (smtpToForm == null) smtpToForm = "";
                    String smtpSubjectForm = requestParameters.get("smtpSubjectForm");
                    if (smtpSubjectForm == null) smtpSubjectForm = "";
                    String smtpMessageForm = requestParameters.get("smtpMessageForm");                    
                    if (smtpMessageForm == null) smtpMessageForm = "";
                    String alarmEnterTimeout = requestParameters.get("alEnterTimeout");
                    if (alarmEnterTimeout == null) alarmEnterTimeout = "0";
                    String alarmLeaveTimeout = requestParameters.get("alLeaveTimeout");
                    if (alarmLeaveTimeout == null) alarmLeaveTimeout = "0";
                    String alarmTimeout = requestParameters.get("alTimeout");
                    if (alarmTimeout == null) alarmTimeout = "0";
                    String switchDeviceId = requestParameters.get("swDeviceId");
                    if (switchDeviceId == null) switchDeviceId = "0";
                    String switchSubDeviceId = requestParameters.get("swSubDeviceId");
                    if (switchSubDeviceId == null) switchSubDeviceId = "0";
                    String alarmDeviceId = requestParameters.get("alDeviceId");
                    if (alarmDeviceId == null) alarmDeviceId = "0";
                    String alarmSubDeviceId = requestParameters.get("alSubDeviceId");
                    if (alarmSubDeviceId == null) alarmSubDeviceId = "0";                    
                    if (!device.getDeviceName().equals(nm)) device.setDeviceName(nm);
                    if (device.isEnabledAlarmScheduler() != alEnabledScheduler) device.setEnabledAlarmScheduler(alEnabledScheduler);
                    if (device.isEnabledSwitchScheduler() != swEnabledScheduler) device.setEnabledSwitchScheduler(swEnabledScheduler);
                    if (!device.getRoomName().equals(room)) { device.setRoomName(room); refresh = true; }
                    if (device.getFrequency() != tm) device.setExpectedFrequency(tm);
                    if (device.isEmailAlertFirstTime() != emailFirstTimeEnabled) device.setEmailAlertFirstTime(emailFirstTimeEnabled);
                    if (device.isEmailAlertEveryTime() != emailEveryTimeEnabled) device.setEmailAlertEveryTime(emailEveryTimeEnabled);
                    if (!device.getSmtpTo().equals(smtpToForm)) device.setSmtpTo(smtpToForm);
                    if (!device.getSmtpSubject().equals(smtpSubjectForm)) device.setSmtpSubject(smtpSubjectForm);
                    if (!device.getSmtpMessage().equals(smtpMessageForm)) device.setSmtpMessage(smtpMessageForm);
                    if (device.getAlarmEnterTimeout() != Integer.parseInt(alarmEnterTimeout)) device.setAlarmEnterTimeout(Integer.parseInt(alarmEnterTimeout));
                    if (device.getAlarmLeaveTimeout() != Integer.parseInt(alarmLeaveTimeout)) device.setAlarmLeaveTimeout(Integer.parseInt(alarmLeaveTimeout));
                    if (device.getAlarmTimeout() != Integer.parseInt(alarmTimeout)) device.setAlarmTimeout(Integer.parseInt(alarmTimeout));
                    if (device.getAlarmDeviceId() != Integer.parseInt(alarmDeviceId)) device.setAlarmDeviceId(Integer.parseInt(alarmDeviceId));
                    if (device.getAlarmSubDeviceId() != Integer.parseInt(alarmSubDeviceId)) device.setAlarmSubDeviceId(Integer.parseInt(alarmSubDeviceId));
                    if (device.getSwitchDeviceId() != Integer.parseInt(switchDeviceId)) device.setSwitchDeviceId(Integer.parseInt(switchDeviceId));
                    if (device.getSwitchSubDeviceId() != Integer.parseInt(switchSubDeviceId)) device.setSwitchSubDeviceId(Integer.parseInt(switchSubDeviceId));
                    r.getPersistance().saveDevice(device);
                    if (refresh) sendAjaxAnswer("REFRESH"); else sendAjaxAnswer("OK");
                } else {
                    sendAjaxError("error_no_permission");
                }
            } else if (action.equals("SAVEALARMSCH")) {
                if (user.getGroup().equals(Group.ADMIN_GROUP)) {
                    if (requestParameters.get("all").equals("true")) {
                        for (AbstractDevice dev : r.getDevices()) {
                            if (dev instanceof PirSensorDevice) {
                                for (int i=0; i<14;i++) {
                                    ((PirSensorDevice)dev).getAlarmScheduler().saveSchedule(requestParameters.get(Integer.toString(i)), Integer.toString(i));
                                }
                                if (((PirSensorDevice)dev).isEnabledAlarmScheduler()) ((PirSensorDevice)dev).setAlarmEnabled(((PirSensorDevice)dev).getAlarmScheduler().getCurrentSchedule());
                                r.getPersistance().saveDevice(dev);                                                        
                            }
                        }
                        sendAjaxAnswer("OK");
                    } else {
                        for (int i=0; i<14;i++) {
                            device.getAlarmScheduler().saveSchedule(requestParameters.get(Integer.toString(i)), Integer.toString(i));
                        }
                        if (device.isEnabledAlarmScheduler()) device.setAlarmEnabled(device.getAlarmScheduler().getCurrentSchedule());
                        r.getPersistance().saveDevice(device);
                        sendAjaxAnswer("OK");                        
                    }
                } else {
                    sendAjaxError("error_no_permission");
                }
            } else if (action.equals("SAVESWITCHSCH")) {
                if (user.getGroup().equals(Group.ADMIN_GROUP)) {
                    if (requestParameters.get("all").equals("true")) {
                        for (AbstractDevice dev : r.getDevices()) {
                            if (dev instanceof PirSensorDevice) {
                                for (int i=0; i<14;i++) {
                                    ((PirSensorDevice)dev).getSwitchScheduler().saveSchedule(requestParameters.get(Integer.toString(i)), Integer.toString(i));
                                }
                                if (((PirSensorDevice)dev).isEnabledSwitchScheduler()) ((PirSensorDevice)dev).setSwitchEnabled(((PirSensorDevice)dev).getSwitchScheduler().getCurrentSchedule());
                                r.getPersistance().saveDevice(device);                                                    
                            }
                        }
                        sendAjaxAnswer("OK");
                    } else {
                        for (int i=0; i<14;i++) {
                            device.getSwitchScheduler().saveSchedule(requestParameters.get(Integer.toString(i)), Integer.toString(i));
                        }
                        if (device.isEnabledSwitchScheduler()) device.setSwitchEnabled(device.getSwitchScheduler().getCurrentSchedule());
                        r.getPersistance().saveDevice(device);
                        sendAjaxAnswer("OK");                        
                    }
                } else {
                    sendAjaxError("error_no_permission");
                }                
            } else if (action.equals("ALARMON")) {
                if (user.getGroup().equals(Group.OPERATOR_GROUP) || user.getGroup().equals(Group.ADMIN_GROUP)) {
                    if (requestParameters.get("all").equals("true")) {
                        for (AbstractDevice dev : r.getDevices()) {
                            if (dev instanceof PirSensorDevice) {
                                for (int i=0; i<14;i++) {
                                    ((PirSensorDevice)dev).setAlarmEnabled(true);
                                    ((PirSensorDevice)dev).setEnabledAlarmScheduler(false);
                                }                                                      
                            }
                        }
                        sendAjaxAnswer("OK");
                    } else {
                        device.setAlarmEnabled(true);
                        device.setEnabledAlarmScheduler(false);
                        sendAjaxAnswer("OK");                        
                    }
                } else {
                    sendAjaxError("error_no_permission");
                }
            } else if (action.equals("ALARMOFF")) {
                if (user.getGroup().equals(Group.OPERATOR_GROUP) || user.getGroup().equals(Group.ADMIN_GROUP)) {
                    if (requestParameters.get("all").equals("true")) {
                        for (AbstractDevice dev : r.getDevices()) {
                            if (dev instanceof PirSensorDevice) {
                                for (int i=0; i<14;i++) {
                                    ((PirSensorDevice)dev).setAlarmEnabled(false);
                                    ((PirSensorDevice)dev).setEnabledAlarmScheduler(false);
                                }                                                      
                            }
                        }
                        sendAjaxAnswer("OK");
                    } else {
                        device.setAlarmEnabled(false);
                        device.setEnabledAlarmScheduler(false);
                        sendAjaxAnswer("OK");                        
                    }
                } else {
                    sendAjaxError("error_no_permission");
                }
            } else if (action.equals("SWITCHON")) {
                if (user.getGroup().equals(Group.OPERATOR_GROUP) || user.getGroup().equals(Group.ADMIN_GROUP)) {
                    if (requestParameters.get("all").equals("true")) {
                        for (AbstractDevice dev : r.getDevices()) {
                            if (dev instanceof PirSensorDevice) {
                                for (int i=0; i<14;i++) {
                                    ((PirSensorDevice)dev).setSwitchEnabled(true);
                                    ((PirSensorDevice)dev).setEnabledSwitchScheduler(false);
                                }                                                        
                            }
                        }
                        sendAjaxAnswer("OK");
                    } else {
                        device.setSwitchEnabled(true);
                        device.setEnabledSwitchScheduler(false);
                        sendAjaxAnswer("OK");                        
                    }
                } else {
                    sendAjaxError("error_no_permission");
                }
            } else if (action.equals("SWITCHOFF")) {
                if (user.getGroup().equals(Group.OPERATOR_GROUP) || user.getGroup().equals(Group.ADMIN_GROUP)) {
                    if (requestParameters.get("all").equals("true")) {
                        for (AbstractDevice dev : r.getDevices()) {
                            if (dev instanceof PirSensorDevice) {
                                for (int i=0; i<14;i++) {
                                    ((PirSensorDevice)dev).setSwitchEnabled(false);
                                    ((PirSensorDevice)dev).setEnabledSwitchScheduler(false);                                    
                                }                                                        
                            }
                        }
                        sendAjaxAnswer("OK");
                    } else {
                        device.setSwitchEnabled(false);
                        device.setEnabledSwitchScheduler(false);                        
                        sendAjaxAnswer("OK");                        
                    }
                } else {
                    sendAjaxError("error_no_permission");
                }
            } else if (action.equals("LOADALSCH")) {
                sendAjaxAnswer(device.getAlarmScheduler().loadSchedule());
            } else if (action.equals("LOADSWSCH")) {
                sendAjaxAnswer(device.getSwitchScheduler().loadSchedule());
            }
        } catch (Exception e) {
            RemoteHomeManager.log.error(77,e);
            sendAjaxStackTrace(e);
        }
    }
}
