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
public class ResourceLoaderWebService extends AbstractWebService {
    
    private String name = null;
    
    public void init() {}

    public void setParameters(RemoteHomeManager r, String... name) {
        this.r = r;
        this.name = name[0];
    }
    
    public byte[] processRequest() throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(this.getClass().getClassLoader().getResourceAsStream(name)));
        StringBuffer fileBr = new StringBuffer();
        String buffer = "";
        while ((buffer = br.readLine()) != null) {
             fileBr.append(buffer+"\n");
        }
        StringBuffer sb = new StringBuffer();
        sb.append("HTTP/1.0 200 OK\n");
        sb.append("Content-length:"+fileBr.length()+"\n");
        sb.append("Content-Type: text/html\nConnection: close\n\n");
        sb.append(fileBr);
        return sb.toString().getBytes();
    }
}
