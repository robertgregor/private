/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.HashSet;
import org.remoteHome.AbstractDevice;
import org.remoteHome.MotorControllerDevice;
import org.remoteHome.HeatingHeaderDevice;
import org.remoteHome.LightAlarmDevice;
import org.remoteHome.SimpleSwitchDevice;
import org.remoteHome.TemperatureSensorDevice;
import org.remoteHome.ThermostatDevice;
import org.remoteHome.ThermostatWithSwitchAndTempSensorDevice;

/**
 *
 * @author pt596
 */
public class LoadRoomPage extends AbstractWebService {
    
    private HashMap<String, String> divs = new HashMap<String, String>();
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        String roomHtml = readResource("RoomHTML.html");
        roomHtml = roomHtml.replaceAll("ROOMNAME", requestParameters.get("room").replaceAll(" ","xxx"));
        HashSet<AbstractDevice> devices = r.getDevicesInRoom(requestParameters.get("room"));
        StringBuilder accordionBody = new StringBuilder();
        for (AbstractDevice device : devices) {
            //accordionBody.append("<H3>"+device.getDeviceName()+"</H3>\n");
            accordionBody.append("<H3><a href=\"#\">"+device.getDeviceName()+"</a></H3>");

            if (device instanceof LightAlarmDevice) {
                accordionBody.append(getDiv("LightAlarmDevice.div",Integer.toString(device.getDeviceId())));
            } else if (device instanceof SimpleSwitchDevice) {
                accordionBody.append(getDiv("SimpleSwitchDevice.div",Integer.toString(device.getDeviceId())));
            } else if (device instanceof TemperatureSensorDevice) {
                accordionBody.append(getDiv("TemperatureSensorDevice.div",Integer.toString(device.getDeviceId())));
            } else if (device instanceof LightAlarmDevice) {
                accordionBody.append(getDiv("LightAlarmDevice.div",Integer.toString(device.getDeviceId())));
            } else if (device instanceof MotorControllerDevice) {
                accordionBody.append(getDiv("BlindsControllerDevice.div",Integer.toString(device.getDeviceId())));
            } else if (device instanceof HeatingHeaderDevice) {
                accordionBody.append(getDiv("HeatingHeaderDevice.div",Integer.toString(device.getDeviceId())));
            } else if (device instanceof ThermostatDevice) {
                accordionBody.append(getDiv("ThermostatDevice.div",Integer.toString(device.getDeviceId())));
            } else if (device instanceof ThermostatWithSwitchAndTempSensorDevice) {
                accordionBody.append(getDiv("ThermostatWithSwitchAndTempSensorDevice.div",Integer.toString(device.getDeviceId())));
            }
        }
        if (accordionBody.toString().length()==0) {
            accordionBody.append("<H3>No device exist in the room<H3><div>&nbsp;</div>\n");
        }
        roomHtml = roomHtml.substring(0, roomHtml.indexOf("BBBODYYY")) + accordionBody.toString() + roomHtml.substring(roomHtml.indexOf("BBBODYYY")+8);
        //System.out.println(roomHtml);
        sendAjaxAnswer(roomHtml);
    }
    
    String getDiv(String name, String id) throws IOException {
        String content = divs.get(name);
        if (content == null) {
            content = readResource(name);
            divs.put(name, content);
        }
        return content.replaceAll("COMPONENTID", id);
    }

    private String readResource(String name) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(this.getClass().getClassLoader().getResourceAsStream(name)));
        StringBuilder fileBr = new StringBuilder();
        String buffer = "";
        while ((buffer = br.readLine()) != null) {
             fileBr.append(buffer+"\n");
        }
        return fileBr.toString();
    }
}