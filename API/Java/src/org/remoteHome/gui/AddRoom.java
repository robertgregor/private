/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import org.remoteHome.RemoteHomeManager;

/**
 *
 * @author pt596
 */
public class AddRoom  extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public byte[] processRequest() throws IOException {
        r.addRoom(requestParameters.get("roomName"));
        r.savePersistentData();
        return sendAjaxAnswer("OK");
    }
}