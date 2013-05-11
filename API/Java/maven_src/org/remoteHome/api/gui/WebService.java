/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.api.gui;

import com.sun.net.httpserver.HttpExchange;
import org.remoteHome.api.RemoteHomeManager;

import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;

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
