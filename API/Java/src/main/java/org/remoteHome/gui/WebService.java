/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import org.remoteHome.RemoteHomeManager;

/**
 *
 * @author pt596
 */
public interface WebService {
    
    void init();
    void processRequest(OutputStream o, HttpExchange t) throws IOException;
    void processRequest(HashMap<String, String> requestParameters, OutputStream o, HttpExchange t) throws IOException;
    void setParameters(RemoteHomeManager r, String... requestAttributes);
}