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
        try {
            ThermostatDevice device = (ThermostatDevice)r.getDevice(Integer.parseInt(requestParameters.get("deviceId")));
            String action = requestParameters.get("action");
            if (action.equals("CONFIGURE")) {
                String nm = requestParameters.get("nm");
                int tm = Integer.parseInt(requestParameters.get("tm"));
                int thr = Integer.parseInt(requestParameters.get("thr"));
                int temp = Integer.parseInt(requestParameters.get("temp"));
                Boolean enabledScheduler = new Boolean(requestParameters.get("schenabled"));
                Boolean manualMode = new Boolean(requestParameters.get("manual"));
                if (!device.getDeviceName().equals(nm)) device.setDeviceName(nm);
                if (device.getFrequency() != tm) device.setFrequency(tm);
                if ((device.getThreshold() != thr) && temp == 0) device.setThreshold(thr);
                if (device.getDeviceExpectedTemperature() != temp) device.setDeviceExpectedTemperature(temp);
                if (device.isEnabledScheduler() != enabledScheduler) device.setEnabledScheduler(enabledScheduler);
                if (device.isManualControl()!= manualMode) device.setManualControl(manualMode);                
            } else if (action.equals("ON")) {
                device.setRelayOn(true);
            } else if (action.equals("OFF")) {
                device.setRelayOn(false);
            } else if (action.equals("SAVESCH")) {
                for (int i=0; i<14;i++) {
                    device.getTemperatureSchedule().saveSchedule(requestParameters.get(Integer.toString(i)), Integer.toString(i));
                }
                r.savePersistentData();        
            } else if (action.equals("LOADSCH")) {
                sendAjaxAnswer(device.getTemperatureSchedule().loadSchedule());
                return;
            }
            sendAjaxAnswer("OK");
        } catch (Exception e) {
            sendAjaxError(e.getMessage());
        }
    }
}
