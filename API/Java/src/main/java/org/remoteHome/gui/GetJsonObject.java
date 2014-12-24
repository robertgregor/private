/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import org.remoteHome.AbstractDevice;
import org.remoteHome.RemoteHomeManager;


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
            AbstractDevice device = r.getDevice(Integer.parseInt(requestParameters.get("deviceId")));
            sb.append(AbstractDevice.generateJsonData(device));
            RemoteHomeManager.log.debug("Sending JSON object: "+sb.toString());
            sendAjaxAnswer(sb.toString());
        } catch (Exception e) {
            RemoteHomeManager.log.error(76,e);
            sendAjaxError(e.getMessage());
        }
    }   
}