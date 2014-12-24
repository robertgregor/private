/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import org.remoteHome.Group;

/**
 *
 * @author pt596
 */
public class GetFreeDeviceId extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        if (user.getGroup().equals(Group.ADMIN_GROUP)) {
            sendAjaxAnswer(Integer.toString(r.getUnusedDeviceId()));
        } else {
            sendAjaxError("error_no_permission");
        }
    }
}