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
public class BlindsControllerDeviceManager extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        try {
            BlindsControllerDevice device = (BlindsControllerDevice)r.getDevice(Integer.parseInt(requestParameters.get("deviceId")));
            String action = requestParameters.get("action");
            if (action.equals("CLOSE")) {
                device.blindsDown();
            } else if (action.equals("OPEN")) {
                device.blindsUp();
            } else if (action.equals("STOP")) {
                device.stopBlindsMovement();
            } else if (action.equals("SETPOS")) {
                int time = Integer.parseInt(requestParameters.get("period"));
                device.moveBlindsToPosition(time);
            } else if (action.equals("CONFIGURE")) {
                String nm = requestParameters.get("nm");
                int tm = Integer.parseInt(requestParameters.get("tm"));
                if (!device.getDeviceName().equals(nm)) device.setDeviceName(nm);
                if (device.getFullRangeTimeout() != tm) device.configureFullRangeTimeout(tm);
            } else if (action.equals("CLOSEALL")) {
                for (AbstractDevice dev : r.getDevices()) {
                    if (dev instanceof BlindsControllerDevice) {
                        ((BlindsControllerDevice)dev).blindsDown();
                    }
                }
            } else if (action.equals("OPENALL")) {
                for (AbstractDevice dev : r.getDevices()) {
                    if (dev instanceof BlindsControllerDevice) {
                        ((BlindsControllerDevice)dev).blindsUp();
                    }
                }
            } else if (action.equals("STOPALL")) {
                for (AbstractDevice dev : r.getDevices()) {
                    if (dev instanceof BlindsControllerDevice) {
                        ((BlindsControllerDevice)dev).stopBlindsMovement();
                    }
                }
            }
            sendAjaxAnswer("OK");
        } catch (Exception e) {
            sendAjaxError(e.getMessage());
        }
    }
}
