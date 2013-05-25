/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import java.util.TreeSet;
import org.remoteHome.AbstractSchedule;
import org.remoteHome.OnOffSchedule;

/**
 *
 * @author rgregor
 */
public class SchedulersManager extends AbstractWebService {
    
        
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        try {
            String action = requestParameters.get("action");
            if (action.equals("LOAD")) {
                if (requestParameters.get("type").equalsIgnoreCase("OnOff")) {
                    if (r.getSchedulers().keySet() == null) {
                        sendAjaxAnswer("");                        
                    } else {
                        TreeSet<String> names = new TreeSet<String>(r.getSchedulers().keySet());
                        StringBuilder sb = new StringBuilder();
                        for (String name : names) {
                            if (r.getSchedulers().get(name) instanceof OnOffSchedule) {
                                sb.append(name + "\n");
                            }
                        }
                        if (sb.length() > 1) sb.deleteCharAt(sb.length()-1);                        
                        sendAjaxAnswer(sb.toString());
                    }
                }
            }
            if (action.equals("SAVE")) {
                if (requestParameters.get("type").equalsIgnoreCase("OnOff")) {
                    String name = requestParameters.get("name");
                    if (r.getSchedulers().containsKey(name)) {
                        sendAjaxError("This program name already exist. Cannot save this program. Please use the name, which does not exist.");
                        return;
                    }
                    OnOffSchedule schd = new OnOffSchedule();
                    for (int i=0; i<14;i++) {
                       schd.saveSchedule(requestParameters.get(Integer.toString(i)), Integer.toString(i));                       
                    }
                    r.getSchedulers().put(name, schd);
                    r.savePersistentData();
                    sendAjaxAnswer("OK");
                }
            }
            if (action.equals("UPDATE")) {
                if (requestParameters.get("type").equalsIgnoreCase("OnOff")) {
                    String name = requestParameters.get("name");
                    if (r.getSchedulers().containsKey(name)) {
                        OnOffSchedule schd = (OnOffSchedule)r.getSchedulers().get(name);
                    for (int i=0; i<14;i++) {
                       schd.saveSchedule(requestParameters.get(Integer.toString(i)), Integer.toString(i));                       
                    }
                    r.savePersistentData();
                    sendAjaxAnswer("OK");
                    } else {
                        sendAjaxError("This program name does not exist. Cannot update this program. Please reopen the schedule frame.");
                        return;                        
                    }
                }
            }
            if (action.equals("DELETE")) {
                r.getSchedulers().remove(requestParameters.get("name"));
                    r.savePersistentData();
                    sendAjaxAnswer("OK");                
            }
            if (action.equals("GET")) {
                sendAjaxAnswer(r.getSchedulers().get(requestParameters.get("name")).loadSchedule());
            }
        } catch (Exception e) {
            e.printStackTrace();
            sendAjaxError(e.getMessage());
        }
    }
}
