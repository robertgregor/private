/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import org.remoteHome.AbstractDevice;

/**
 *
 * @author pt596
 */
public class GetJsonObject extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        try {
            StringBuilder sb = new StringBuilder();
            sb.append(AbstractDevice.generateJsonData(r.getDevice(Integer.parseInt(requestParameters.get("deviceId")))));
            sendAjaxAnswer(sb.toString());
        } catch (Exception e) {
            sendAjaxError(e.getMessage());
        }
    }   
}