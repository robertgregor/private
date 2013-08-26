/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.Socket;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import org.remoteHome.AbstractDevice;
import org.remoteHome.RemoteHomeManager;

/**
 *
 * @author pt596
 */
public class WebServerHandler implements HttpHandler {
    
    RemoteHomeManager remoteHomemanager = null;

    public WebServerHandler(RemoteHomeManager remoteHomemanager) {
        this.remoteHomemanager = remoteHomemanager;
    }
    
    public void handle(HttpExchange t) throws IOException {
        OutputStream out = null; 
        try {
            //Thread.sleep(100);
            out = t.getResponseBody();
            String getRequest = t.getRequestURI().toString();
            System.out.println(getRequest);
            if(remoteHomemanager.getUserManagement().isLoggedOn()) {
                if ((getRequest.indexOf('?') == -1) || (getRequest.indexOf('?') > 6)) {
                    //it is the request to the resource
                    if (getRequest.indexOf('?') != -1) getRequest = getRequest.substring(0, getRequest.indexOf('?'));
                    String fileNameWithDirs = getRequest.replaceAll("/", " ");
                    fileNameWithDirs = fileNameWithDirs.trim();
                    if (fileNameWithDirs.length() != 0) {
                        if (fileNameWithDirs.indexOf(" ") != -1) {
                            String fileNameArray[] = fileNameWithDirs.split(" ");
                            fileNameWithDirs = fileNameArray[fileNameArray.length - 1];
                        }
                    }
                    WebService w = (WebService)Class.forName("org.remoteHome.gui.ResourceLoaderWebService").newInstance();
                    if (fileNameWithDirs.length() == 0) {
                        w.setParameters(remoteHomemanager, "main.html");
                    } else {
                        w.setParameters(remoteHomemanager, fileNameWithDirs);
                    }
                    w.processRequest(out, t);
                } else {
                    //it is ajax request to do something
                    String parameters = getRequest.replaceAll("/", "");
                    parameters = parameters.substring(parameters.indexOf('?')+1);
                    HashMap<String, String> parsedParameters = parseParameters(parameters);
                    WebService w = (WebService)Class.forName("org.remoteHome.gui."+parsedParameters.get("ServiceName")).newInstance();
                    w.setParameters(remoteHomemanager);
                    w.processRequest(parsedParameters, out, t);
                    Thread.sleep(100);
                }
            } else {
                WebService w = (WebService)Class.forName("org.remoteHome.gui.ResourceLoaderWebService").newInstance();
                w.setParameters(remoteHomemanager, "login.html");
                w.processRequest(out, t);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                out.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    private HashMap<String, String> parseParameters(String parametersString) throws UnsupportedEncodingException {
        HashMap<String, String> parsedParams = new HashMap<String, String>();
        String[] pairs = parametersString.split("&");
        for (String pair : pairs) {
            String[] keyVaue = pair.split("=");
            if (keyVaue.length == 1) {
                parsedParams.put(keyVaue[0], null);
            } else {
                parsedParams.put(keyVaue[0], URLDecoder.decode(keyVaue[1],"UTF-8"));
            }
        }
        return parsedParams;
    }
}
