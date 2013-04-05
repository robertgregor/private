/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.Headers;
import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import org.remoteHome.RemoteHomeManager;

/**
 *
 * @author pt596
 */
public abstract class AbstractWebService implements WebService {
    
    protected RemoteHomeManager r;
    protected HashMap<String, String> requestParameters;
    OutputStream o;
    HttpExchange t;
        
    public void setParameters(RemoteHomeManager r, String... requestAttributes) {
        this.r = r;
    }

    public abstract void processRequest(OutputStream o, HttpExchange t) throws IOException;
    
    public void processRequest(HashMap<String, String> requestParameters, OutputStream o, HttpExchange t) throws IOException {
        this.requestParameters = requestParameters;
        this.o = o;
        this.t = t;
        processRequest(o, t);
    }
    
    protected void sendAjaxAnswer(String data) throws IOException {
        Headers headers = t.getResponseHeaders();
        headers.add("Content-Type", "text/html");
        headers.add("Cache-Control", "no-cache");
        t.sendResponseHeaders(200, data.length());
        o.write(data.getBytes());
        o.flush();
    } 
    protected void sendAjaxError(String data) throws IOException {
        Headers headers = t.getResponseHeaders();
        headers.add("Content-Type", "text/html");
        headers.add("Cache-Control", "no-cache");
        t.sendResponseHeaders(500, data.length());
        o.write(data.getBytes());
        o.flush();
    } 
}
