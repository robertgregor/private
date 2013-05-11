/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.api.gui;

import com.sun.net.httpserver.HttpExchange;
import org.remoteHome.api.exception.RemoteHomeConnectionException;

import java.io.IOException;
import java.io.OutputStream;

/**
 *
 * @author pt596
 */
public class ChangeChannelPwd extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        try {
            r.setChannel(Integer.parseInt(requestParameters.get("channel")));
            r.setPassword(requestParameters.get("password"));
            sendAjaxAnswer("Channel and / or password configured. Please reset all your devices and add them again.");
        } catch (RemoteHomeConnectionException e) {
            sendAjaxAnswer(e.getMessage());
        }
    }
    
}