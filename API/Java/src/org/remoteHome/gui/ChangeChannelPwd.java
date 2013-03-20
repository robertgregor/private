/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import java.io.IOException;
import org.remoteHome.RemoteHomeConnectionException;

/**
 *
 * @author pt596
 */
public class ChangeChannelPwd extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public byte[] processRequest() throws IOException {
        try {
            r.setChannel(Integer.parseInt(requestParameters.get("channel")));
            r.setPassword(requestParameters.get("password"));
            return sendAjaxAnswer("Channel and / or password configured. Please reset all your devices and add them again.");
        } catch (RemoteHomeConnectionException e) {
            return sendAjaxAnswer(e.getMessage());
        }
    }
    
}