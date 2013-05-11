/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.api.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;

/**
 *
 * @author pt596
 */
public class LoadChannelPassword extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        
        StringBuilder sb = new StringBuilder();
        sb.append(r.getChannel());
        sb.append("\n");
        sb.append(r.getPassword());
        //sendAjaxAnswer(sb.toString());
        sendAjaxAnswer("40\nROBIK");
    }
    
}
