/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
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
            if (action.equals("ON")) {
                device.switchOn();
                sendAjaxAnswer("OK");
            } else if (action.equals("OFF")) {
                device.switchOff();
                sendAjaxAnswer("OK");
            } else if (action.equals("ONTIMEOUT")) {
                int time = Integer.parseInt(requestParameters.get("period"));
                if (time != 0) device.configurePeriod(time);
                device.switchOnForConfiguredPeriod();
                sendAjaxAnswer("OK");
            } else if (action.equals("CONFIGURE")) {
                device.updateDevice();
                String nm = requestParameters.get("nm");
                int tm = Integer.parseInt(requestParameters.get("tm"));
                Boolean onWhenPower = new Boolean(requestParameters.get("pw"));
                Boolean enabledScheduler = new Boolean(requestParameters.get("schenabled"));
                String room = requestParameters.get("room");
                if (!device.getDeviceName().equals(nm)) device.setDeviceName(nm);
                if (device.getConfiguredPeriod() != tm) device.configurePeriod(tm);
                if (device.isOnWhenAppliedPower() != onWhenPower) device.switchOnWhenAppliedPower(onWhenPower);
                if (device.isEnabledScheduler() != enabledScheduler) device.setEnabledScheduler(enabledScheduler);
                if (!device.getRoomName().equals(room)) { device.setRoomName(room); refresh = true; }
                r.getPersistance().saveDevice(device);
                if (refresh) sendAjaxAnswer("REFRESH"); else sendAjaxAnswer("OK");
            } else if (action.equals("SAVESCH")) {
                for (int i=0; i<14;i++) {
                    device.getLightSchedule().saveSchedule(requestParameters.get(Integer.toString(i)), Integer.toString(i));
                }
                r.getPersistance().saveDevice(device);
                sendAjaxAnswer("OK");
            } else if (action.equals("LOADSCH")) {
                sendAjaxAnswer(device.getLightSchedule().loadSchedule());
            }            
        } catch (Exception e) {
            e.printStackTrace();
            sendAjaxError(e.getMessage());
        }
    }
}
