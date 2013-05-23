/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.String;
import java.util.TreeSet;

/**
 *
 * @author pt596
 */
public class LoadAllRooms extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        if (r.getRooms().keySet() == null) {
            sendAjaxAnswer("");
        } else {
            TreeSet<String> rooms = new TreeSet<String>(r.getRooms().keySet());
            StringBuilder sb = new StringBuilder();
            for (String room : rooms) sb.append(room + "\n");
            if (sb.length() > 1) sb.deleteCharAt(sb.length()-1);
            sendAjaxAnswer(sb.toString());
        }
    }
}