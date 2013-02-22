/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import java.io.IOException;
import java.util.HashMap;
import org.remoteHome.RemoteHomeManager;

/**
 *
 * @author pt596
 */
public interface WebService {
    
    void init();
    byte[] processRequest() throws IOException;
    byte[] processRequest(HashMap<String, String> requestParameters) throws IOException;
    void setParameters(RemoteHomeManager r, String... requestAttributes);
}
