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
import org.remoteHome.MotorControllerDevice;

/**
 *
 * @author pt596
 */
public class MotorControllerDeviceManager extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        boolean refresh = false;
        try {
            MotorControllerDevice device = (MotorControllerDevice)r.getDevice(Integer.parseInt(requestParameters.get("deviceId")));
            String action = requestParameters.get("action");
            boolean allDevices = new Boolean(requestParameters.get("all"));
            if (action.equals("CLOSE")) {
                if ((user.getGroup().equals(Group.ADMIN_GROUP)) || (user.getGroup().equals(Group.OPERATOR_GROUP))) {
                    if (allDevices) {
                        for (AbstractDevice dev : r.getDevices()) {
                            if (dev instanceof MotorControllerDevice) {
                                ((MotorControllerDevice)dev).motorDown();
                            }
                        }
                    } else {
                        device.motorDown();
                    }
                    sendAjaxAnswer("OK");
                } else {
                    sendAjaxError("error_no_permission");
                }
            } else if (action.equals("OPEN")) {
                if ((user.getGroup().equals(Group.ADMIN_GROUP)) || (user.getGroup().equals(Group.OPERATOR_GROUP))) {
                    if (allDevices) {
                        for (AbstractDevice dev : r.getDevices()) {
                            if (dev instanceof MotorControllerDevice) {
                                ((MotorControllerDevice)dev).motorUp();
                            }
                        }
                    } else {
                        device.motorUp();
                    }
                    sendAjaxAnswer("OK");
                } else {
                    sendAjaxError("error_no_permission");
                }
            } else if (action.equals("STOP")) {
                if ((user.getGroup().equals(Group.ADMIN_GROUP)) || (user.getGroup().equals(Group.OPERATOR_GROUP))) {
                    if (allDevices) {
                        for (AbstractDevice dev : r.getDevices()) {
                            if (dev instanceof MotorControllerDevice) {
                                ((MotorControllerDevice)dev).stopMotorMovement();
                            }
                        }
                    } else {
                        device.stopMotorMovement();
                    }
                    sendAjaxAnswer("OK");
                } else {
                    sendAjaxError("error_no_permission");
                }
            } else if (action.equals("SETPOS")) {                
                int time = Integer.parseInt(requestParameters.get("period"));
                if ((user.getGroup().equals(Group.ADMIN_GROUP)) || (user.getGroup().equals(Group.OPERATOR_GROUP))) {
                    if (allDevices) {
                        for (AbstractDevice dev : r.getDevices()) {
                            if (dev instanceof MotorControllerDevice) {
                                ((MotorControllerDevice)dev).moveMotorToPosition(time);
                            }
                        }
                    } else {
                        device.moveMotorToPosition(time);
                    }
                    sendAjaxAnswer("OK");
                } else {
                    sendAjaxError("error_no_permission");
                }
            } else if (action.equals("CONFIGURE")) {
                if (user.getGroup().equals(Group.ADMIN_GROUP)) {
                    String nm = requestParameters.get("nm");
                    int tm = Integer.parseInt(requestParameters.get("tm"));
                    Boolean enabledScheduler = new Boolean(requestParameters.get("schenabled"));
                    String room = requestParameters.get("room");
                    Boolean powerLostReporting = new Boolean(requestParameters.get("plr"));
                    if (!device.getDeviceName().equals(nm)) device.setDeviceName(nm);
                    if (device.getFullRangeTimeout() != tm) device.configureFullRangeTimeout(tm);
                    if (device.isEnabledScheduler() != enabledScheduler) device.setEnabledScheduler(enabledScheduler);
                    if (device.isEnableLowBattOrPowerLostReporting() != powerLostReporting.booleanValue()) device.setEnableLowBattOrPowerLostReporting(powerLostReporting);
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
                            if (dev instanceof MotorControllerDevice) {
                                for (int i=0; i<14;i++) {
                                    ((MotorControllerDevice)dev).getPositionSchedule().saveSchedule(requestParameters.get(Integer.toString(i)), Integer.toString(i));
                                }
                                r.getPersistance().saveDevice(((MotorControllerDevice)dev));
                            }
                        }
                    } else {
                        for (int i=0; i<14;i++) {
                            device.getPositionSchedule().saveSchedule(requestParameters.get(Integer.toString(i)), Integer.toString(i));
                        }
                        r.getPersistance().saveDevice(device);
                    }                    
                    sendAjaxAnswer("OK");
                } else {
                    sendAjaxError("error_no_permission");
                }
            } else if (action.equals("LOADSCH")) {
                sendAjaxAnswer(device.getPositionSchedule().loadSchedule());
            }
        } catch (Exception e) {
            sendAjaxError(e.getMessage());
        }
    }
}
