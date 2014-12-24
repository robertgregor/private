/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.Headers;
import com.sun.net.httpserver.HttpExchange;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Properties;
import org.remoteHome.RemoteHomeManager;
import org.remoteHome.RemoteHomeManagerException;
import org.remoteHome.User;

/**
 *
 * @author pt596
 */
public class ResourceLoaderWebService extends AbstractWebService {
    
    private String name = null;
    private Properties mimeTypes = null;
    
    public void init() {
    }

    public void setParameters(RemoteHomeManager r, User user, String... name) {
        super.setParameters(r, user, name);
        this.name = name[0];
    }
    
    public synchronized void processRequest(OutputStream o, HttpExchange t) throws IOException, RemoteHomeManagerException {
      try {
        DataInputStream br = new DataInputStream(this.getClass().getClassLoader().getResourceAsStream(name));
        ByteArrayOutputStream out = new ByteArrayOutputStream();        
        byte[] buffer = new byte[65535];
        int length;
        while ((length = br.read(buffer)) != -1) out.write(buffer, 0, length);
        br.close();
        byte[] result = out.toByteArray();
        if (name.equals("main.html") || name.equals("login.html")) {
            //OK, replace the language placeholder PREFLANG - preferred language
            org.remoteHome.Properties p = r.getPersistance().loadProperties();
            String lang = "en";
            if (p==null) {
                org.remoteHome.Properties newP = new org.remoteHome.Properties();
                newP.language = "en";
                r.getPersistance().saveProperties(newP);
            } else {
                if (p.language == null) {
                    p.language = "en";
                    r.getPersistance().saveProperties(p);                   
                } else {
                    lang = p.language;
                }
            }
            String page = new String(result);
            page = page.replaceAll("PREFLANG", lang);
            result = page.getBytes();
        }
        //Save the preferred language
        if (name.startsWith("Messages_") && name.endsWith(".properties")) {
            String prefLang = name.substring(9,11);
            org.remoteHome.Properties p = r.getPersistance().loadProperties();
            p.language = prefLang;
            r.getPersistance().saveProperties(p);
            WebServerHandler.setLocale(prefLang);
        }
        Headers headers = t.getResponseHeaders();
        headers.add("Content-Type", getContentType(name));
        t.sendResponseHeaders(200, result.length);
        o.write(result);
        o.flush();
      } catch (NullPointerException e) {
          throw new IOException("Resource cannot be loaded.");
      }
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
