/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import org.remoteHome.AbstractDevice;
import org.remoteHome.MotorControllerDevice;
import org.remoteHome.LightAlarmDevice;

/**
 *
 * @author pt596
 */
public class MotorControllerDeviceManager extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        try {
            MotorControllerDevice device = (MotorControllerDevice)r.getDevice(Integer.parseInt(requestParameters.get("deviceId")));
            String action = requestParameters.get("action");
            if (action.equals("CLOSE")) {
                device.blindsDown();
            } else if (action.equals("OPEN")) {
                device.blindsUp();
            } else if (action.equals("STOP")) {
                device.stopBlindsMovement();
            } else if (action.equals("SETPOS")) {
                int time = Integer.parseInt(requestParameters.get("period"));
                device.moveBlindsToPosition(time);
            } else if (action.equals("CONFIGURE")) {
                String nm = requestParameters.get("nm");
                int tm = Integer.parseInt(requestParameters.get("tm"));
                Boolean enabledScheduler = new Boolean(requestParameters.get("schenabled"));
                if (!device.getDeviceName().equals(nm)) device.setDeviceName(nm);
                if (device.getFullRangeTimeout() != tm) device.configureFullRangeTimeout(tm);
                if (device.isEnabledScheduler() != enabledScheduler) device.setEnabledScheduler(enabledScheduler);                
            } else if (action.equals("CLOSEALL")) {
                for (AbstractDevice dev : r.getDevices()) {
                    if (dev instanceof MotorControllerDevice) {
                        ((MotorControllerDevice)dev).blindsDown();
                    }
                }
            } else if (action.equals("OPENALL")) {
                for (AbstractDevice dev : r.getDevices()) {
                    if (dev instanceof MotorControllerDevice) {
                        ((MotorControllerDevice)dev).blindsUp();
                    }
                }
            } else if (action.equals("STOPALL")) {
                for (AbstractDevice dev : r.getDevices()) {
                    if (dev instanceof MotorControllerDevice) {
                        ((MotorControllerDevice)dev).stopBlindsMovement();
                    }
                }
            } else if (action.equals("SAVESCH")) {
                for (int i=0; i<14;i++) {
                    device.getPositionSchedule().saveSchedule(requestParameters.get(Integer.toString(i)), Integer.toString(i));
                }
                r.savePersistentData();        
            } else if (action.equals("LOADSCH")) {
                sendAjaxAnswer(device.getPositionSchedule().loadSchedule());
                return;
            }
            sendAjaxAnswer("OK");
        } catch (Exception e) {
            sendAjaxError(e.getMessage());
        }
    }
}
