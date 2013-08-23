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
        boolean refresh = false;
        try {
            HeatingHeaderDevice device = (HeatingHeaderDevice)r.getDevice(Integer.parseInt(requestParameters.get("deviceId")));
            String action = requestParameters.get("action");
            if (action.equals("CONFIGURE")) {
                String nm = requestParameters.get("nm");
                String roomName = requestParameters.get("room");
                int tm = Integer.parseInt(requestParameters.get("tm"));
                //int oa = Integer.parseInt(requestParameters.get("oa"));
                int temp = Integer.parseInt(requestParameters.get("temp"));
                int cfgTemp = (temp * 2) / 10;
                if ((temp % 10) > 4) cfgTemp++;
                int heatingId = Integer.parseInt(requestParameters.get("heatingId"));
                int remoteTempId = Integer.parseInt(requestParameters.get("remoteTempId"));
                int openAngleHeating = Integer.parseInt(requestParameters.get("openAngleHeating"));
                Boolean enabledScheduler = new Boolean(requestParameters.get("schenabled"));
                Boolean heatingEnabled = new Boolean(requestParameters.get("heatingEnabled"));
                Boolean tempEnabled = new Boolean(requestParameters.get("tempEnabled"));
                if (!device.getDeviceName().equals(nm)) device.setDeviceName(nm);
                if (!device.getRoomName().equals(roomName)) { device.setRoomName(roomName); refresh = true; }
                if (device.getFrequency() != tm) device.setExpectedFrequency(tm);
                if (device.getHeatingController()!= heatingId) device.setHeatingController(heatingId);
                if (device.getRemoteTemperatureMeter() != remoteTempId) device.setRemoteTemperatureMeter(remoteTempId);                
                if (device.getHeatingControllerOpenAngle()!= openAngleHeating) device.setHeatingControllerOpenAngle(openAngleHeating);  
                //if ((device.getExpectedOpenAngle() != oa) && temp == 0) device.setExpectedOpenAngle(oa);
                if (device.getExpectedTemperature() != cfgTemp) device.setExpectedTemperature(cfgTemp);
                if (device.isEnabledScheduler() != enabledScheduler) device.setEnabledScheduler(enabledScheduler);
                if (device.isHeatingControllerEnabled()!= heatingEnabled) device.setHeatingControllerEnabled(heatingEnabled);                
                if (device.isRemoteTemperatureMeterEnabled()!= tempEnabled) device.setRemoteTemperatureMeterEnabled(tempEnabled);
                r.getPersistance().saveDevice(device);
            }
            if (refresh) sendAjaxAnswer("REFRESH"); else sendAjaxAnswer("OK");
        } catch (Exception e) {
            sendAjaxError(e.getMessage());
        }
    }
}
