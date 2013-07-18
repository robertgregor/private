/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import org.remoteHome.AbstractDevice;
import org.remoteHome.TemperatureSensorDevice;

/**
 *
 * @author pt596
 */
public class AddNewDevice extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        try {
            AbstractDevice newDevice = null;
            if ((requestParameters.get("addSubDeviceId") != null) && requestParameters.get("addSubDeviceId").length() > 0) {
                if (Integer.parseInt(requestParameters.get("addSubDeviceId")) == 1) {
                    if (Integer.parseInt(requestParameters.get("type")) != AbstractDevice.ThermostatWithSwitchAndTempSensor) {
                        r.addDevice(Integer.parseInt(requestParameters.get("addDeviceId")));
                    }
                }
                newDevice = r.createRemoteHomeMultipleDevice(Integer.parseInt(requestParameters.get("addDeviceId")),
                    Integer.parseInt(requestParameters.get("addSubDeviceId")),
                    requestParameters.get("addDeviceName"),
                    Integer.parseInt(requestParameters.get("type")));
                    newDevice.setRoomName(requestParameters.get("roomName"));                
            } else {
                if (Integer.parseInt(requestParameters.get("type")) != AbstractDevice.ThermostatWithSwitchAndTempSensor) {
                    r.addDevice(Integer.parseInt(requestParameters.get("addDeviceId")));
                }
                newDevice = r.createRemoteHomeDevice(Integer.parseInt(requestParameters.get("addDeviceId")),
                    requestParameters.get("addDeviceName"),
                    Integer.parseInt(requestParameters.get("type")));
                    newDevice.setRoomName(requestParameters.get("roomName"));                
                    if (newDevice instanceof TemperatureSensorDevice) {
                        ((TemperatureSensorDevice)newDevice).setExpectedFrequency(60);
                    }
            }
            r.getPersistance().saveDevice(newDevice);
            sendAjaxAnswer("OK, device is added.");
        } catch (Exception e) {
            e.printStackTrace();
            sendAjaxError(e.getMessage());
        }
    }
}