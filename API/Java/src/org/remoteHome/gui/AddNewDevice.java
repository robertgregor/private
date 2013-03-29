/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import java.io.IOException;
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
    public byte[] processRequest() throws IOException {
        try {
            r.addDevice(Integer.parseInt(requestParameters.get("addDeviceId")));
            AbstractDevice newDevice = r.createRemoteHomeDevice(Integer.parseInt(requestParameters.get("addDeviceId")),
                requestParameters.get("addDeviceName"),
                Integer.parseInt(requestParameters.get("type")));
                r.addDeviceToRoom(requestParameters.get("roomName"), newDevice);
                if (newDevice instanceof TemperatureSensorDevice) {
                    ((TemperatureSensorDevice)newDevice).setInitialFrequency();
                }
                r.savePersistentData();
                return sendAjaxAnswer("OK, device is added.");
        } catch (Exception e) {
            e.printStackTrace();
            return sendAjaxAnswer(e.getMessage());
        }
    }
}