/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import org.remoteHome.AbstractDevice;
import org.remoteHome.LightAlarmDevice;

/**
 *
 * @author pt596
 */
public class LightAlarmDeviceManager extends AbstractWebService {
 
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        try {
            LightAlarmDevice device = (LightAlarmDevice)r.getDevice(Integer.parseInt(requestParameters.get("deviceId")));
            String action = requestParameters.get("action");
            if (action.equals("ON")) {
                device.switchOn();
            } else if (action.equals("OFF")) {
                device.switchOff();
            } else if (action.equals("ONTIMEOUT")) {
                int time = Integer.parseInt(requestParameters.get("period"));
                if (time != 0) device.configurePeriod(time);
                device.switchOnForConfiguredPeriod();                
            } else if (action.equals("CONFIGURE")) {
                String nm = requestParameters.get("nm");
                int tm = Integer.parseInt(requestParameters.get("tm"));
                Boolean onWhenPower = new Boolean(requestParameters.get("pw"));
                if (!device.getDeviceName().equals(nm)) device.setDeviceName(nm);
                if (device.getConfiguredPeriod() != tm) device.configurePeriod(tm);
                if (device.isOnWhenAppliedPower() != onWhenPower) device.switchOnWhenAppliedPower(onWhenPower);
                //alarm params
                int et = Integer.parseInt(requestParameters.get("et"));
                int lt = Integer.parseInt(requestParameters.get("lt"));
                Boolean onWhenAlarmDetected = new Boolean(requestParameters.get("apw"));
                if (device.getAlarmEnterTimeout() != et) device.configureAlarmEnterTimeout(et);
                if (device.getAlarmLeaveTimeout() != lt) device.configureAlarmLeaveTimeout(lt);
                if (device.isOnWhenMovementDetected() != onWhenAlarmDetected) device.configureSwitchOnWhenMovement(onWhenAlarmDetected);
                if (requestParameters.get("smtpHost") != device.getSmtpHost()) device.setSmtpHost(requestParameters.get("smtpHost"));
                if (requestParameters.get("smtpUser") != device.getSmtpUser()) device.setSmtpUser(requestParameters.get("smtpUser"));
                if (requestParameters.get("smtpPassword") != device.getSmtpPassword()) device.setSmtpPassword(requestParameters.get("smtpPassword"));
                if (requestParameters.get("smtpFrom") != device.getSmtpEmailFrom()) device.setSmtpEmailFrom(requestParameters.get("smtpFrom"));
                if (requestParameters.get("smtpTo") != device.getSmtpEmailTo()) device.setSmtpEmailTo(requestParameters.get("smtpTo"));
                if (requestParameters.get("smtpSubject") != device.getSmtpSubject()) device.setSmtpSubject(requestParameters.get("smtpSubject"));
                if (requestParameters.get("smtpMessage") != device.getSmtpMessage()) device.setSmtpMessage(requestParameters.get("smtpMessage"));
                r.savePersistentData();
            } else if (action.equals("ALON")) {
                device.alarmOn();
            } else if (action.equals("ALOFF")) {
                device.alarmOff();
            } else if (action.equals("ALALLON")) {
                for (AbstractDevice dev : r.getDevices()) {
                    if (dev instanceof LightAlarmDevice) {
                        ((LightAlarmDevice)dev).alarmOn();
                    }
                }
            } else if (action.equals("ALALLOFF")) {
                for (AbstractDevice dev : r.getDevices()) {
                    if (dev instanceof LightAlarmDevice) {
                        ((LightAlarmDevice)dev).alarmOff();
                    }
                }
            } else if (action.equals("SAVESCH")) {
                for (int i=0; i<14;i++) {
                    device.getLightSchedule().saveSchedule(requestParameters.get(Integer.toString(i)), Integer.toString(i));
                }
            } else if (action.equals("LOADSCH")) {
                sendAjaxAnswer(device.getLightSchedule().loadSchedule());
                return;
            } else if (action.equals("SAVESCHMOVEMENT")) {
                for (int i=0; i<14;i++) {
                    device.getLightOnWhenMovementDetectedSchedule().saveSchedule(requestParameters.get(Integer.toString(i)), Integer.toString(i));
                }                
            } else if (action.equals("LOADSCHMOVEMENT")) {
                sendAjaxAnswer(device.getLightOnWhenMovementDetectedSchedule().loadSchedule());
                return;
            }
            sendAjaxAnswer("OK");
        } catch (Exception e) {
            sendAjaxError(e.getMessage());
        }        
    }    
}
