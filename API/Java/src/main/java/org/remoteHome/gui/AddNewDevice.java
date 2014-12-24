/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import org.remoteHome.AbstractDevice;
import org.remoteHome.AccelerometerSensorDevice;
import org.remoteHome.Group;
import org.remoteHome.LightSensorDevice;
import org.remoteHome.MagneticSensorDevice;
import org.remoteHome.PirSensorDevice;
import org.remoteHome.RemoteHomeManager;
import org.remoteHome.TemperatureHumiditySensorDevice;
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
          RemoteHomeManager.log.debug("Received request to add the device.");
          if (user.getGroup().equals(Group.ADMIN_GROUP)) {
            AbstractDevice newDevice = null;
            if ((requestParameters.get("addSubDeviceId") != null) && requestParameters.get("addSubDeviceId").length() > 0) {
                if (Integer.parseInt(requestParameters.get("addSubDeviceId")) == 1) {
                        if (!requestParameters.containsKey("donotadd") || !requestParameters.get("addDeviceId").equals("9")) {
                            r.addDevice(Integer.parseInt(requestParameters.get("addDeviceId")));
                        }
                }
                newDevice = r.createRemoteHomeMultipleDevice(Integer.parseInt(requestParameters.get("addDeviceId")),
                    Integer.parseInt(requestParameters.get("addSubDeviceId")),
                    requestParameters.get("addDeviceName"),
                    Integer.parseInt(requestParameters.get("type")));
                    newDevice.setRoomName(requestParameters.get("roomName"));                
            } else {
                if (!(requestParameters.containsKey("donotadd") || (Integer.parseInt(requestParameters.get("addDeviceId")) == 9))) {
                    r.addDevice(Integer.parseInt(requestParameters.get("addDeviceId")));
                }
                newDevice = r.createRemoteHomeDevice(Integer.parseInt(requestParameters.get("addDeviceId")),
                requestParameters.get("addDeviceName"),
                Integer.parseInt(requestParameters.get("type")));
                newDevice.setRoomName(requestParameters.get("roomName"));                
                if (newDevice instanceof TemperatureSensorDevice) ((TemperatureSensorDevice)newDevice).setExpectedFrequency(60);
                if (newDevice instanceof TemperatureHumiditySensorDevice) ((TemperatureHumiditySensorDevice)newDevice).setExpectedFrequency(60);
                if (newDevice instanceof LightSensorDevice) ((LightSensorDevice)newDevice).setExpectedFrequency(60);
                if (newDevice instanceof PirSensorDevice) ((PirSensorDevice)newDevice).setExpectedFrequency(60);
                if (newDevice instanceof MagneticSensorDevice) ((MagneticSensorDevice)newDevice).setExpectedFrequency(60);
                if (newDevice instanceof AccelerometerSensorDevice) ((AccelerometerSensorDevice)newDevice).setExpectedFrequency(60);
            }
            r.getPersistance().saveDevice(newDevice);
            RemoteHomeManager.log.info("Device added: "+newDevice);
            sendAjaxAnswer("OK, device added.");
          } else {
            RemoteHomeManager.log.warning("User "+user+" doesnt have permission to add device.");
            sendAjaxError("error_no_permission");
          }
        } catch (Exception e) {
            RemoteHomeManager.log.error(20, e);
            sendAjaxError(e.getMessage());
        }
    }
}