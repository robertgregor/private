/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Properties;
import org.remoteHome.RemoteHomeManager;

/**
 *
 * @author pt596
 */
public class ResourceLoaderWebService extends AbstractWebService {
    
    private String name = null;
    private Properties mimeTypes = null;
    
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
        String type = getContentType(name);
        if (type != null) sb.append("Content-Type: "+type+"\n");
        sb.append("Connection: close\n\n");
        sb.append(fileBr);
        return sb.toString().getBytes();
    }
    private String getContentType(String name) throws IOException {
        if (mimeTypes == null) {
                mimeTypes = new Properties();
                mimeTypes.load(this.getClass().getClassLoader().getResourceAsStream("MimeTypes.properties"));
        }
        String ext[] = name.split("\\.");
        String type = mimeTypes.getProperty(ext[ext.length-1]);
        return type;
    }
}
