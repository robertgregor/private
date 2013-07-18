/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import org.remoteHome.AbstractDevice;
import org.remoteHome.BatteryThermostatDevice;
import org.remoteHome.HeatingHeaderDevice;
import org.remoteHome.TemperatureSensorDevice;

/**
 *
 * @author pt596
 */
public class GetJsonObject extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        try {
            StringBuilder sb = new StringBuilder();
            AbstractDevice device = r.getDevice(Integer.parseInt(requestParameters.get("deviceId")));
            if (!((device instanceof HeatingHeaderDevice) || (device instanceof TemperatureSensorDevice) || (device instanceof BatteryThermostatDevice))) {
                device.updateDevice();
            }
            sb.append(AbstractDevice.generateJsonData(device));
            sendAjaxAnswer(sb.toString());
        } catch (Exception e) {
            e.printStackTrace();
            sendAjaxError(e.getMessage());
        }
    }   
}