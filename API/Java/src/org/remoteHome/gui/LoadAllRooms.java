/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import java.io.IOException;
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
    public byte[] processRequest() throws IOException {
        TreeSet<String> rooms = new TreeSet<String>(r.getRooms().keySet());
        StringBuilder sb = new StringBuilder();
        for (String room : rooms) sb.append(room + "\n");
        sb.deleteCharAt(sb.length()-1);
        return sendAjaxAnswer(sb.toString());
    }
}