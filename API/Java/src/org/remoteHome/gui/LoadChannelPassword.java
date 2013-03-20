/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import java.io.IOException;

/**
 *
 * @author pt596
 */
public class LoadChannelPassword extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public byte[] processRequest() throws IOException {
        
        StringBuilder sb = new StringBuilder();
        sb.append(r.getChannel());
        sb.append("\n");
        sb.append(r.getPassword());
        return sendAjaxAnswer(sb.toString());
    }
    
}
