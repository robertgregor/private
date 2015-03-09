/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import org.remoteHome.Group;
import org.remoteHome.LightSensorDevice;

/**
 *
 * @author pt596
 */
public class LightSensorDeviceManager  extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        boolean refresh = false;
        if (user.getGroup().equals(Group.ADMIN_GROUP)) {
            try {
                LightSensorDevice device = (LightSensorDevice)r.getDevice(Integer.parseInt(requestParameters.get("deviceId")));
                String action = requestParameters.get("action");
                if (action.equals("CONFIGURE")) {
                    String nm = requestParameters.get("nm");
                    int tm = Integer.parseInt(requestParameters.get("tm"));
                    String room = requestParameters.get("room");
                    int switchDeviceId = Integer.parseInt(requestParameters.get("switchDeviceId"));
                    int switchSubDeviceId = Integer.parseInt(requestParameters.get("switchSubDeviceId"));
                    if (!device.getDeviceName().equals(nm)) device.setDeviceName(nm);
                    if (device.getFrequency() != tm) device.setExpectedFrequency(tm);
                    if (device.getSwitchDeviceId() != switchDeviceId) device.setSwitchDeviceIdExpected(switchDeviceId);
                    if (device.getSwitchSubDeviceId() != switchSubDeviceId) device.setSwitchSubDeviceIdExpected(switchSubDeviceId);
                    if (!device.getRoomName().equals(room)) { device.setRoomName(room); refresh = true; }
                    r.getPersistance().saveDevice(device);
                    if (refresh) sendAjaxAnswer("REFRESH"); else sendAjaxAnswer("OK");
                }
            } catch (Exception e) {
                sendAjaxError(e.getMessage());
            }
        } else {
            sendAjaxError("error_no_permission");
        }
    }
}