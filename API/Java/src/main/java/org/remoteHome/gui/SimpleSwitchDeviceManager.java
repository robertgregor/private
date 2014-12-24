/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import org.remoteHome.AbstractDevice;
import org.remoteHome.Group;
import org.remoteHome.SimpleSwitchDevice;

/**
 *
 * @author pt596
 */
public class SimpleSwitchDeviceManager extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        boolean refresh = false;
        try {
            SimpleSwitchDevice device = (SimpleSwitchDevice)r.getDevice(Integer.parseInt(requestParameters.get("deviceId")));
            String action = requestParameters.get("action");
            boolean allDevices = new Boolean(requestParameters.get("all"));            
            if (action.equals("ON")) {
                if ((user.getGroup().equals(Group.ADMIN_GROUP)) || (user.getGroup().equals(Group.OPERATOR_GROUP))) {
                    if (allDevices) {
                        for (AbstractDevice dev : r.getDevices()) {
                            if (dev instanceof SimpleSwitchDevice) {
                                ((SimpleSwitchDevice)dev).switchOn();
                            }
                        }
                    } else {
                        device.switchOn();
                    }
                    sendAjaxAnswer("OK");
                } else {
                    sendAjaxError("error_no_permission");
                }
            } else if (action.equals("OFF")) {
                if ((user.getGroup().equals(Group.ADMIN_GROUP)) || (user.getGroup().equals(Group.OPERATOR_GROUP))) {
                    if (allDevices) {
                        for (AbstractDevice dev : r.getDevices()) {
                            if (dev instanceof SimpleSwitchDevice) {
                                ((SimpleSwitchDevice)dev).switchOff();
                            }
                        }
                    } else {
                        device.switchOff();
                    }
                    sendAjaxAnswer("OK");
                } else {
                    sendAjaxError("error_no_permission");
                }
            } else if (action.equals("ONTIMEOUT")) {
                if ((user.getGroup().equals(Group.ADMIN_GROUP)) || (user.getGroup().equals(Group.OPERATOR_GROUP))) {
                    int time = Integer.parseInt(requestParameters.get("period"));
                    if (allDevices) {
                        for (AbstractDevice dev : r.getDevices()) {
                            if (dev instanceof SimpleSwitchDevice) {
                                if (time != 0) ((SimpleSwitchDevice)dev).configurePeriod(time);
                                ((SimpleSwitchDevice)dev).switchOnForConfiguredPeriod();
                            }
                        }
                    } else {
                        device.configurePeriod(time);
                        device.switchOnForConfiguredPeriod();
                    }
                    sendAjaxAnswer("OK");
                } else {
                    sendAjaxError("error_no_permission");
                }
            } else if (action.equals("CONFIGURE")) {
                if (user.getGroup().equals(Group.ADMIN_GROUP)) {
                    String nm = requestParameters.get("nm");
                    int tm = Integer.parseInt(requestParameters.get("tm"));
                    int lightBorder = Integer.parseInt(requestParameters.get("lightBorder"));
                    Boolean onWhenPower = new Boolean(requestParameters.get("pw"));
                    Boolean powerLostReporting = new Boolean(requestParameters.get("plr"));
                    Boolean enabledScheduler = new Boolean(requestParameters.get("schenabled"));
                    String room = requestParameters.get("room");
                    if (!device.getDeviceName().equals(nm)) device.setDeviceName(nm);
                    if (device.getConfiguredPeriod() != tm) device.configurePeriod(tm);
                    if (device.getCurrentLightIntensityBorderValue() != lightBorder) device.configureLightIntensityBorderValue(lightBorder);
                    if (device.isOnWhenAppliedPower() != onWhenPower.booleanValue()) device.switchOnWhenAppliedPower(onWhenPower);
                    if (device.isEnableLowBattOrPowerLostReporting() != powerLostReporting.booleanValue()) device.setEnableLowBattOrPowerLostReporting(powerLostReporting);
                    if (device.isEnabledScheduler() != enabledScheduler.booleanValue()) device.setEnabledScheduler(enabledScheduler);
                    if (!device.getRoomName().equals(room)) { device.setRoomName(room); refresh = true; }
                    r.getPersistance().saveDevice(device);
                    if (refresh) sendAjaxAnswer("REFRESH"); else sendAjaxAnswer("OK");
                } else {
                    sendAjaxError("error_no_permission");
                }
            } else if (action.equals("SAVESCH")) {
                if (user.getGroup().equals(Group.ADMIN_GROUP)) {
                    if (allDevices) {
                        for (AbstractDevice dev : r.getDevices()) {
                            if (dev instanceof SimpleSwitchDevice) {
                                for (int i=0; i<14;i++) {
                                    ((SimpleSwitchDevice)dev).getLightSchedule().saveSchedule(requestParameters.get(Integer.toString(i)), Integer.toString(i));
                                }
                                r.getPersistance().saveDevice(((SimpleSwitchDevice)dev));
                            }
                        }
                    } else {
                        for (int i=0; i<14;i++) {
                            device.getLightSchedule().saveSchedule(requestParameters.get(Integer.toString(i)), Integer.toString(i));
                        }
                        r.getPersistance().saveDevice(device);
                    }                    
                    sendAjaxAnswer("OK");
                } else {
                    sendAjaxError("error_no_permission");
                }
            } else if (action.equals("LOADSCH")) {
                sendAjaxAnswer(device.getLightSchedule().loadSchedule());
            }            
        } catch (Exception e) {
            sendAjaxError(e.getMessage());
        }
    }
}
