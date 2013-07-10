/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import org.remoteHome.ThermostatWithSwitchAndTempSensorDevice;

/**
 *
 * @author gregorro
 */
public class ThermostatWithSwitchAndTempSensorDeviceManager extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
                try {
            ThermostatWithSwitchAndTempSensorDevice device = 
                    (ThermostatWithSwitchAndTempSensorDevice)r.getDevice(Integer.parseInt(requestParameters.get("deviceId")));
            String action = requestParameters.get("action");
            if (action.equals("CONFIGURE")) {
                String nm = requestParameters.get("nm");
                int thr = Integer.parseInt(requestParameters.get("thr"));
                int temp = Integer.parseInt(requestParameters.get("temp"));
                int simpleswithId = Integer.parseInt(requestParameters.get("remoteSsId"));
                int heatingId = Integer.parseInt(requestParameters.get("heatingId"));
                int remoteTempId = Integer.parseInt(requestParameters.get("remoteTempId"));                
                Boolean enabledScheduler = new Boolean(requestParameters.get("schenabled"));
                Boolean heatingEnabled = new Boolean(requestParameters.get("heatingEnabled"));
                if (!device.getDeviceName().equals(nm)) device.setDeviceName(nm);
                if (device.getThreshold() != thr) device.setThreshold(thr);
                if (device.getHeatingController()!= heatingId) device.setHeatingController(heatingId);
                if (device.getRemoteTemperatureMeterId() != remoteTempId) device.setRemoteTemperatureMeterId(remoteTempId);                
                if (device.getDeviceExpectedTemperature() != temp) device.setDeviceExpectedTemperature(temp);
                if (device.getSimpleSwitchDeviceId() != simpleswithId) device.setSimpleSwitchDeviceId(simpleswithId);
                if (device.isEnabledScheduler() != enabledScheduler) device.setEnabledScheduler(enabledScheduler);
                if (device.isHeatingControllerEnabled()!= heatingEnabled) device.setHeatingControllerEnabled(heatingEnabled);                
                r.savePersistentData();        
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
