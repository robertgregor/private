/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.api.gui;

import com.sun.net.httpserver.Headers;
import com.sun.net.httpserver.HttpExchange;
import org.remoteHome.api.RemoteHomeManager;

import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Properties;

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
    
    public synchronized void processRequest(OutputStream o, HttpExchange t) throws IOException {
        DataInputStream br = new DataInputStream(this.getClass().getClassLoader().getResourceAsStream(name));
        ByteArrayOutputStream out = new ByteArrayOutputStream();        
        byte[] buffer = new byte[65535];
        int length;
        while ((length = br.read(buffer)) != -1) out.write(buffer, 0, length);
        br.close();
        byte[] result = out.toByteArray();
        Headers headers = t.getResponseHeaders();
        headers.add("Content-Type", getContentType(name));
        t.sendResponseHeaders(200, result.length);
        o.write(result);
        o.flush();
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
