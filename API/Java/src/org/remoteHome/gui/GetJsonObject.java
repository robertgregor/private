/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import java.io.IOException;
import org.remoteHome.AbstractDevice;

/**
 *
 * @author pt596
 */
public class GetJsonObject extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public byte[] processRequest() throws IOException {
        try {
            StringBuilder sb = new StringBuilder();
            sb.append(AbstractDevice.generateJsonData(r.getDevice(Integer.parseInt(requestParameters.get("deviceId")))));
            return sendAjaxAnswer(sb.toString());
        } catch (Exception e) {
            return sendAjaxError(e.getMessage());
        }
    }   
}