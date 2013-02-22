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
public abstract class AbstractWebService implements WebService {
    
    protected RemoteHomeManager r;
    protected HashMap<String, String> requestParameters;
        
    public void setParameters(RemoteHomeManager r, String... requestAttributes) {
        this.r = r;
    }

    public abstract byte[] processRequest() throws IOException;
    
    public byte[] processRequest(HashMap<String, String> requestParameters) throws IOException {
        this.requestParameters = requestParameters;
        return processRequest();
    }
    
    protected byte[] sendAjaxAnswer(String data) {
        StringBuffer sb = new StringBuffer();
        sb.append("HTTP/1.0 200 OK\n");
        sb.append("Content-length:"+data.length()+"\n");
        sb.append("Content-Type: text/html\nConnection: close\n\n");
        sb.append(data);
        return sb.toString().getBytes();
    } 
}
