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
            accordionBody.append("<h3><table><tr><td><span id=\"titleOfAccordionStart"+Integer.toString(device.getDeviceId())+"\"></span></td><td>"
                    +device.getDeviceName()+"&nbsp;&nbsp;</td><td><span id=\"titleOfAccordionEnd"+Integer.toString(device.getDeviceId())+"\"></span></td></tr></table></h3>\n");
            String clazzName = device.getClass().getName().split("\\.")[2];
            accordionBody.append(getDiv(clazzName+".div",Integer.toString(device.getDeviceId())));
        }
        if (accordionBody.toString().length()==0) {
            accordionBody.append("<h3><p>No device exist in the room</p></h3><div>&nbsp;</div>\n");
        }
        roomHtml = roomHtml.substring(0, roomHtml.indexOf("BBBODYYY")) + accordionBody.toString() + roomHtml.substring(roomHtml.indexOf("BBBODYYY")+8);
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