/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.Socket;
import java.net.URLDecoder;
import java.util.HashMap;
import org.remoteHome.RemoteHomeManager;

/**
 *
 * @author pt596
 */
public class WebServerHandler extends Thread {
    
    private Socket socket = null;
    RemoteHomeManager remoteHomemanager = null;
    
    public WebServerHandler(Socket socket, RemoteHomeManager remoteHomemanager) {
        this.socket = socket;
        this.remoteHomemanager = remoteHomemanager;
    }
    
    public void run() {
        BufferedReader in = null;
        OutputStream out = null; 
        try {
            Thread.sleep(100);
            in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            out = socket.getOutputStream();
            String getRequest = in.readLine();
            if (getRequest.indexOf('?') == -1) {
                //it is the request to the resource
                String fileName = getRequest.split(" ")[1].replaceAll("/", "");
                WebService w = (WebService)Class.forName("org.remoteHome.gui.ResourceLoaderWebService").newInstance();
                if (fileName.trim().length() == 0) {
                    w.setParameters(remoteHomemanager, "main.html");
                } else {
                    w.setParameters(remoteHomemanager, fileName.trim());
                }
                out.write(w.processRequest());
                out.flush();
            } else {
                //it is ajax request to do something
                String parameters = getRequest.split(" ")[1].replaceAll("/", "");
                parameters = parameters.substring(parameters.indexOf('?')+1);
                HashMap<String, String> parsedParameters = parseParameters(parameters);
                WebService w = (WebService)Class.forName("org.remoteHome.gui."+parsedParameters.get("ServiceName")).newInstance();
                w.setParameters(remoteHomemanager);
                out.write(w.processRequest(parsedParameters));
                out.flush();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                in.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                out.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                socket.close();
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
