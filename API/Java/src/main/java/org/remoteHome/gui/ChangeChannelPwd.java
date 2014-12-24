/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import org.remoteHome.Group;
import org.remoteHome.RemoteHomeConnectionException;

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
            if (user.getGroup().equals(Group.ADMIN_GROUP)) {
                r.setChannel(Integer.parseInt(requestParameters.get("channel")));
                r.setPassword(requestParameters.get("password"));
                sendAjaxAnswer("OK");
            } else {
                sendAjaxError("error_no_permission");
            }
        } catch (RemoteHomeConnectionException e) {
            sendAjaxAnswer(e.getMessage());
        }
    }
    
}