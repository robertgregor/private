/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.api.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import org.remoteHome.api.device.*;

/**
 *
 * @author pt596
 */
public class SimpleSwitchDeviceManager extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        try {
            SimpleSwitchDevice device = (SimpleSwitchDevice)r.getDevice(Integer.parseInt(requestParameters.get("deviceId")));
            String action = requestParameters.get("action");
            if (action.equals("ON")) {
                device.switchOn();
            } else if (action.equals("OFF")) {
                device.switchOff();
            } else if (action.equals("ONTIMEOUT")) {
                int time = Integer.parseInt(requestParameters.get("period"));
                if (time != 0) device.configurePeriod(time);
                device.switchOnForConfiguredPeriod();                
            } else if (action.equals("CONFIGURE")) {
                device.updateDevice();
                String nm = requestParameters.get("nm");
                int tm = Integer.parseInt(requestParameters.get("tm"));
                Boolean onWhenPower = new Boolean(requestParameters.get("pw"));
                if (!device.getDeviceName().equals(nm)) device.setDeviceName(nm);
                if (device.getConfiguredPeriod() != tm) device.configurePeriod(tm);
                if (device.isOnWhenAppliedPower() != onWhenPower) device.switchOnWhenAppliedPower(onWhenPower);
            }
            sendAjaxAnswer("OK");
        } catch (Exception e) {
            sendAjaxError(e.getMessage());
        }
    }
}
