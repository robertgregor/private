/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import org.remoteHome.AbstractDevice;
import org.remoteHome.Group;
import org.remoteHome.RemoteHomeManager;
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
                if (user.getGroup().equals(Group.ADMIN_GROUP)) {
                    String nm = requestParameters.get("nm");
                    int thr = Integer.parseInt(requestParameters.get("thr"));
                    int temp = Integer.parseInt(requestParameters.get("temp"));
                    int heatingId = Integer.parseInt(requestParameters.get("heatingId"));               
                    int heatingSubId = Integer.parseInt(requestParameters.get("heatingSubId"));
                    Boolean powerLostReporting = new Boolean(requestParameters.get("plr"));
                    Boolean enabledScheduler = new Boolean(requestParameters.get("schenabled"));
                    String room = requestParameters.get("room");
                    if (!device.getDeviceName().equals(nm)) device.setDeviceName(nm);
                    if (device.getThreshold() != thr) device.setThreshold(thr);
                    if (device.getHeatingControllerDeviceId()!= heatingId) device.setHeatingControllerDeviceId(heatingId);
                    if (device.getHeatingControllerSubDeviceId()!= heatingSubId) device.setHeatingControllerSubDeviceId(heatingSubId);
                    if ((int)(device.getDeviceExpectedTemperature()*10) != temp) device.setDeviceExpectedTemperature(((float)temp)/10);
                    if (device.isEnableLowBattOrPowerLostReporting() != powerLostReporting.booleanValue()) device.setEnableLowBattOrPowerLostReporting(powerLostReporting);
                    if (device.isEnabledScheduler() != enabledScheduler) device.setEnabledScheduler(enabledScheduler);
                    if (!device.getRoomName().equals(room)) { device.setRoomName(room); refresh = true; }
                    r.getPersistance().saveDevice(device);
                    if (refresh) sendAjaxAnswer("REFRESH"); else sendAjaxAnswer("OK");
                } else {
                    sendAjaxError("error_no_permission");
                }
            } else if (action.equals("SAVESCH")) {
                if (user.getGroup().equals(Group.ADMIN_GROUP)) {
                    if (requestParameters.get("all").equals("true")) {
                        for (AbstractDevice dev : r.getDevices()) {
                            if (dev instanceof ThermostatDevice) {
                                for (int i=0; i<14;i++) {
                                    device.getTemperatureSchedule().saveSchedule(requestParameters.get(Integer.toString(i)), Integer.toString(i));
                                }
                                if (device.isEnabledScheduler()) device.setDeviceExpectedTemperature(device.getTemperatureSchedule().getCurrentExpectedValue());
                                r.getPersistance().saveDevice(device);
                                sendAjaxAnswer("OK");                                                        
                            }
                        }
                    } else {
                        for (int i=0; i<14;i++) {
                            device.getTemperatureSchedule().saveSchedule(requestParameters.get(Integer.toString(i)), Integer.toString(i));
                        }
                        if (device.isEnabledScheduler()) device.setDeviceExpectedTemperature(device.getTemperatureSchedule().getCurrentExpectedValue());
                        r.getPersistance().saveDevice(device);
                        sendAjaxAnswer("OK");                        
                    }
                } else {
                    sendAjaxError("error_no_permission");
                }
            } else if (action.equals("setmanduration")) {
                if (user.getGroup().equals(Group.ADMIN_GROUP) || user.getGroup().equals(Group.OPERATOR_GROUP)) {
                    if (requestParameters.get("all").equals("true")) {
                        for (AbstractDevice dev : r.getDevices()) {
                            if (dev instanceof ThermostatDevice) {
                                ((ThermostatDevice)dev).setManualSetupHourCounterAndTemperature(
                                                            Integer.parseInt(requestParameters.get("manSetupHourDuration")), 
                                                            Float.parseFloat(requestParameters.get("manSetupTemperature").split(" ")[0].replace(",", ".")));
                            }
                        }
                    } else {
                        device.setManualSetupHourCounterAndTemperature(
                                Integer.parseInt(requestParameters.get("manSetupHourDuration")), 
                                Float.parseFloat(requestParameters.get("manSetupTemperature").split(" ")[0].replace(",", ".")));
                    }                    
                    sendAjaxAnswer("OK");
                } else {
                    sendAjaxError("error_no_permission");
                }
            } else if (action.equals("LOADSCH")) {
                sendAjaxAnswer(device.getTemperatureSchedule().loadSchedule());
            }
        } catch (Exception e) {
            RemoteHomeManager.log.error(77,e);
            sendAjaxError(e.getMessage());
        }
    }
}
