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
            if ((requestParameters.get("addSubDeviceId") != null) && requestParameters.get("addSubDeviceId").length() > 0) {
                if (Integer.parseInt(requestParameters.get("addSubDeviceId")) == 1) {
                    r.addDevice(Integer.parseInt(requestParameters.get("addDeviceId")));                    
                }
                AbstractDevice newDevice = r.createRemoteHomeMultipleDevice(Integer.parseInt(requestParameters.get("addDeviceId")),
                    Integer.parseInt(requestParameters.get("addSubDeviceId")),
                    requestParameters.get("addDeviceName"),
                    Integer.parseInt(requestParameters.get("type")));
                    r.addDeviceToRoom(requestParameters.get("roomName"), newDevice);
                
            } else {
                r.addDevice(Integer.parseInt(requestParameters.get("addDeviceId")));
                AbstractDevice newDevice = r.createRemoteHomeDevice(Integer.parseInt(requestParameters.get("addDeviceId")),
                    requestParameters.get("addDeviceName"),
                    Integer.parseInt(requestParameters.get("type")));
                    r.addDeviceToRoom(requestParameters.get("roomName"), newDevice);
                    if (newDevice instanceof TemperatureSensorDevice) {
                        ((TemperatureSensorDevice)newDevice).setInitialFrequency();
                    }
            }
            r.savePersistentData();
            sendAjaxAnswer("OK, device is added.");
        } catch (Exception e) {
            e.printStackTrace();
            sendAjaxError(e.getMessage());
        }
    }
}