/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import java.io.IOException;
import org.remoteHome.TemperatureSensorDevice;

/**
 *
 * @author pt596
 */
public class TemperatureSensorDeviceManager  extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public byte[] processRequest() throws IOException {
        try {
            TemperatureSensorDevice device = (TemperatureSensorDevice)r.getDevice(Integer.parseInt(requestParameters.get("deviceId")));
            String action = requestParameters.get("action");
            if (action.equals("CONFIGURE")) {
                String nm = requestParameters.get("nm");
                int tm = Integer.parseInt(requestParameters.get("tm"));
                if (!device.getDeviceName().equals(nm)) device.setDeviceName(nm);
                if (device.getFrequency() != tm) device.setExpectedFrequency(tm);
            }
            return sendAjaxAnswer("OK");
        } catch (Exception e) {
            return sendAjaxError(e.getMessage());
        }
    }
}
