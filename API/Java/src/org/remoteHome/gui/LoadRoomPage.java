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
public class LoadRoomPage extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public byte[] processRequest() throws IOException {        
        return sendAjaxAnswer("Hello here will be the content of room "+requestParameters.get("room"));
    }
}