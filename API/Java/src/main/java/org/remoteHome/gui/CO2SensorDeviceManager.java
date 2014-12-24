/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import org.remoteHome.CO2SensorDevice;
import org.remoteHome.Group;

/**
 *
 * @author gregorro
 */
public class CO2SensorDeviceManager  extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        boolean refresh = false;
            try {
                CO2SensorDevice device = (CO2SensorDevice)r.getDevice(Integer.parseInt(requestParameters.get("deviceId")));
                String action = requestParameters.get("action");
                if (action.equals("CONFIGURE")) {
                    if (user.getGroup().equals(Group.ADMIN_GROUP)) {
                        String nm = requestParameters.get("nm");
                        int tm = Integer.parseInt(requestParameters.get("tm"));
                        String room = requestParameters.get("room");
                        int ventilatorDeviceId = Integer.parseInt(requestParameters.get("sendingDeviceId"));
                        int ventilatorSubDeviceId = Integer.parseInt(requestParameters.get("sendingSubDeviceId"));
                        if (!device.getDeviceName().equals(nm)) device.setDeviceName(nm);
                        if (!device.getRoomName().equals(room)) { device.setRoomName(room); refresh = true; }
                        if (device.getVentilatorDeviceId() != ventilatorDeviceId) { device.setVentilatorDeviceIdExpected(ventilatorDeviceId);}
                        if (device.getVentilatorSubDeviceId() != ventilatorSubDeviceId) { device.setVentilatorSubDeviceIdExpected(ventilatorSubDeviceId);}
                        if (device.getFrequency() != tm) device.setExpectedFrequency(tm);
                        r.getPersistance().saveDevice(device);
                        if (refresh) sendAjaxAnswer("REFRESH"); else sendAjaxAnswer("OK");
                    } else {
                        sendAjaxError("error_no_permission");
                    }
                } else if (action.equals("CALIBRATELOW")) {
                    if ((user.getGroup().equals(Group.ADMIN_GROUP)) || (user.getGroup().equals(Group.OPERATOR_GROUP))) {
                        device.calibrateLow();
                        sendAjaxAnswer("OK");
                    } else {
                        sendAjaxError("error_no_permission");
                    }
                } else if (action.equals("CALIBRATEHIGH")) {
                    if ((user.getGroup().equals(Group.ADMIN_GROUP)) || (user.getGroup().equals(Group.OPERATOR_GROUP))) {
                        device.calibrateHigh();
                        sendAjaxAnswer("OK");
                    } else {
                        sendAjaxError("error_no_permission");
                    }
                } else if (action.equals("PREHEAT24HOURS")) {
                    if ((user.getGroup().equals(Group.ADMIN_GROUP)) || (user.getGroup().equals(Group.OPERATOR_GROUP))) {
                        device.preheat24hours();
                        sendAjaxAnswer("OK");
                    } else {
                        sendAjaxError("error_no_permission");
                    }
                }
            } catch (Exception e) {
                sendAjaxError(e.getMessage());
            }
    }
}
