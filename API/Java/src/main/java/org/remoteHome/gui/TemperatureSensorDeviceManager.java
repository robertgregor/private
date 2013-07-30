/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import org.remoteHome.TemperatureSensorDevice;

/**
 *
 * @author pt596
 */
public class TemperatureSensorDeviceManager  extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        boolean refresh = false;
        try {
            TemperatureSensorDevice device = (TemperatureSensorDevice)r.getDevice(Integer.parseInt(requestParameters.get("deviceId")));
            String action = requestParameters.get("action");
            if (action.equals("CONFIGURE")) {
                String nm = requestParameters.get("nm");
                int tm = Integer.parseInt(requestParameters.get("tm"));
                String room = requestParameters.get("room");
                if (!device.getDeviceName().equals(nm)) device.setDeviceName(nm);
                if (device.getFrequency() != tm) device.setExpectedFrequency(tm);
                if (!device.getRoomName().equals(room)) { device.setRoomName(room); refresh = true; }
                r.savePersistentData();
                if (refresh) sendAjaxAnswer("REFRESH"); else sendAjaxAnswer("OK");
            }
        } catch (Exception e) {
            sendAjaxError(e.getMessage());
        }
    }
}
