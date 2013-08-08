/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import org.remoteHome.HeatingHeaderDevice;

/**
 *
 * @author pt596
 */
public class HeatingHeaderDeviceManager  extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        try {
            HeatingHeaderDevice device = (HeatingHeaderDevice)r.getDevice(Integer.parseInt(requestParameters.get("deviceId")));
            String action = requestParameters.get("action");
            if (action.equals("CONFIGURE")) {
                String nm = requestParameters.get("nm");
                int tm = Integer.parseInt(requestParameters.get("tm"));
                int oa = Integer.parseInt(requestParameters.get("oa"));
                int temp = Integer.parseInt(requestParameters.get("temp"));
                if (!device.getDeviceName().equals(nm)) device.setDeviceName(nm);
                if (device.getFrequency() != tm) device.setExpectedFrequency(tm);
                if ((device.getOpenAngle() != oa) && temp == 0) device.setExpectedOpenAngle(oa);
                if (device.getTemperature() != temp) device.setExpectedTemperature(temp);
                r.getPersistance().saveDevice(device);
            }
            sendAjaxAnswer("OK");
        } catch (Exception e) {
            sendAjaxError(e.getMessage());
        }
    }
}
