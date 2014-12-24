/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import org.remoteHome.AbstractDevice;
import org.remoteHome.Group;
import org.remoteHome.VentilatorControllerDevice;

/**
 *
 * @author gregorro
 */
public class VentilatorControllerDeviceManager extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        boolean refresh = false;
        try {
            VentilatorControllerDevice device = (VentilatorControllerDevice)r.getDevice(Integer.parseInt(requestParameters.get("deviceId")));
            String action = requestParameters.get("action");
            boolean allDevices = new Boolean(requestParameters.get("all"));            
            if (action.equals("ON")) {
                if ((user.getGroup().equals(Group.ADMIN_GROUP)) || (user.getGroup().equals(Group.OPERATOR_GROUP))) {
                    if (allDevices) {
                        for (AbstractDevice dev : r.getDevices()) {
                            if (dev instanceof VentilatorControllerDevice) {
                                ((VentilatorControllerDevice)dev).switchOn();
                            }
                        }
                    } else {
                        device.switchOn();
                    }
                    sendAjaxAnswer("OK");
                } else {
                    sendAjaxError("error_no_permission");
                }
            } else if (action.equals("OFF")) {
                if ((user.getGroup().equals(Group.ADMIN_GROUP)) || (user.getGroup().equals(Group.OPERATOR_GROUP))) {
                    if (allDevices) {
                        for (AbstractDevice dev : r.getDevices()) {
                            if (dev instanceof VentilatorControllerDevice) {
                                ((VentilatorControllerDevice)dev).switchOff();
                            }
                        }
                    } else {
                        device.switchOff();
                    }
                    sendAjaxAnswer("OK");
                } else {
                    sendAjaxError("error_no_permission");
                }
            } else if (action.equals("CONFIGURE")) {
                if (user.getGroup().equals(Group.ADMIN_GROUP)) {
                    device.updateDevice();
                    String nm = requestParameters.get("nm");
                    String room = requestParameters.get("room");
                    int maxCO2concentration = Integer.parseInt(requestParameters.get("maxCO2concentration"));
                    int maxHumidity = Integer.parseInt(requestParameters.get("maxHumidity"));
                    int co2timeout = Integer.parseInt(requestParameters.get("co2period"));
                    int humidityTimeout = Integer.parseInt(requestParameters.get("humidityTimeout"));
                    Boolean powerLostReporting = new Boolean(requestParameters.get("plr"));
                    if (!device.getDeviceName().equals(nm)) device.setDeviceName(nm);
                    if (!device.getRoomName().equals(room)) { device.setRoomName(room); refresh = true; }
                    if (device.getCo2Counter() != co2timeout) device.configureCO2Counter(co2timeout);
                    if (device.getHumidityCounter() != humidityTimeout) device.configureHumidityCounter(humidityTimeout);
                    if (device.getMaxCO2concentration() != maxCO2concentration) device.configureMaxCO2concentration(maxCO2concentration);
                    if (device.isEnableLowBattOrPowerLostReporting() != powerLostReporting.booleanValue()) device.setEnableLowBattOrPowerLostReporting(powerLostReporting);
                    if (device.getMaxHumidity() != maxHumidity) device.configureMaxHumidity(maxHumidity);
                    r.getPersistance().saveDevice(device);
                    if (refresh) sendAjaxAnswer("REFRESH"); else sendAjaxAnswer("OK");
                } else {
                    sendAjaxError("error_no_permission");
                }
            }            
        } catch (Exception e) {
            sendAjaxError(e.getMessage());
        }
    }
}
