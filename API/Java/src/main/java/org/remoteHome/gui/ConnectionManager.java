/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import org.remoteHome.Group;
import org.remoteHome.RemoteHomeManager;

/**
 *
 * @author gregorro
 */
public class ConnectionManager extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        try {
            String action = requestParameters.get("action");
            if (user.getGroup().equals(Group.ADMIN_GROUP)) {
                if (action.equals("CONNECT")) {
                    r.connectTransceiver();
                } else if (action.equals("DISCONNECT")) {
                    r.disconnectTransceiver();
                }
                sendAjaxAnswer("OK");
            } else {
                sendAjaxError("error_no_permission");
            }
        } catch (Exception e) {
            RemoteHomeManager.log.error(20, e);
            sendAjaxError(e.getMessage());
        }
    }
}