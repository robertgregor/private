/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import org.remoteHome.ThermostatDevice;

/**
 *
 * @author pt596
 */
public class ThermostatDeviceManager  extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        boolean refresh = false;
        try {
            ThermostatDevice device = (ThermostatDevice)r.getDevice(Integer.parseInt(requestParameters.get("deviceId")));
            String action = requestParameters.get("action");
            if (action.equals("CONFIGURE")) {
                String nm = requestParameters.get("nm");
                int tm = Integer.parseInt(requestParameters.get("tm"));
                int thr = Integer.parseInt(requestParameters.get("thr"));
                int temp = Integer.parseInt(requestParameters.get("temp"));
                int heatingId = Integer.parseInt(requestParameters.get("heatingId"));
                int remoteTempId = Integer.parseInt(requestParameters.get("remoteTempId"));                
                Boolean enabledScheduler = new Boolean(requestParameters.get("schenabled"));
                Boolean manualMode = new Boolean(requestParameters.get("manual"));
                Boolean heatingEnabled = new Boolean(requestParameters.get("heatingEnabled"));
                Boolean tempEnabled = new Boolean(requestParameters.get("tempEnabled"));
                String room = requestParameters.get("room");
                if (!device.getDeviceName().equals(nm)) device.setDeviceName(nm);
                if (device.getFrequency() != tm) device.setFrequency(tm);
                if (device.getThreshold() != thr) device.setThreshold(thr);
                if (device.getHeatingController()!= heatingId) device.setHeatingController(heatingId);
                if (device.getRemoteTemperatureMeter() != remoteTempId) device.setRemoteTemperatureMeter(remoteTempId);                
                if (device.getDeviceExpectedTemperature() != temp) device.setDeviceExpectedTemperature(temp);
                if (device.isEnabledScheduler() != enabledScheduler) device.setEnabledScheduler(enabledScheduler);
                if (device.isManualControl()!= manualMode) device.setManualControl(manualMode);                
                if (device.isHeatingControllerEnabled()!= heatingEnabled) device.setHeatingControllerEnabled(heatingEnabled);                
                if (device.isRemoteTemperatureMeterEnabled()!= tempEnabled) {
                    device.setRemoteTemperatureMeterEnabled(tempEnabled);
                    if (device.isRemoteTemperatureMeterEnabled()) device.setManualControl(true);
                }
                if (!device.getRoomName().equals(room)) { device.setRoomName(room); refresh = true; }
                r.savePersistentData();
            } else if (action.equals("ON")) {
                device.setRelayOn(true);
            } else if (action.equals("OFF")) {
                device.setRelayOn(false);
            } else if (action.equals("SAVESCH")) {
                for (int i=0; i<14;i++) {
                    device.getTemperatureSchedule().saveSchedule(requestParameters.get(Integer.toString(i)), Integer.toString(i));
                }
                if (device.isEnabledScheduler()) device.setDeviceExpectedTemperature(device.getTemperatureSchedule().getCurrentExpectedValue());
                r.savePersistentData();        
            } else if (action.equals("LOADSCH")) {
                sendAjaxAnswer(device.getTemperatureSchedule().loadSchedule());
                return;
            }
            if (refresh) sendAjaxAnswer("REFRESH"); else sendAjaxAnswer("OK");
        } catch (Exception e) {
            sendAjaxError(e.getMessage());
        }
    }
}
