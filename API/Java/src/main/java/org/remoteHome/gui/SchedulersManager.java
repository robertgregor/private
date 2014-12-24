/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import java.util.TreeSet;
import org.remoteHome.Group;
import org.remoteHome.OnOffSchedule;
import org.remoteHome.PercentageSchedule;
import org.remoteHome.RemoteHomeManager;
import org.remoteHome.TemperatureSchedule;

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
                    if ((r.getSchedulers().keySet() == null) || (r.getSchedulers().isEmpty())) {
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
                } else if (requestParameters.get("type").equalsIgnoreCase("Temperature")) {
                    if ((r.getSchedulers().keySet() == null) || (r.getSchedulers().isEmpty())) {
                        sendAjaxAnswer("");                        
                    } else {
                        TreeSet<String> names = new TreeSet<String>(r.getSchedulers().keySet());
                        StringBuilder sb = new StringBuilder();
                        for (String name : names) {
                            if (r.getSchedulers().get(name) instanceof TemperatureSchedule) {
                                sb.append(name + "\n");
                            }
                        }
                        if (sb.length() > 1) sb.deleteCharAt(sb.length()-1);                        
                        sendAjaxAnswer(sb.toString());
                    }
                } else if (requestParameters.get("type").equalsIgnoreCase("Percentage")) {
                    if ((r.getSchedulers().keySet() == null) || (r.getSchedulers().isEmpty())) {
                        sendAjaxAnswer("");                        
                    } else {
                        TreeSet<String> names = new TreeSet<String>(r.getSchedulers().keySet());
                        StringBuilder sb = new StringBuilder();
                        for (String name : names) {
                            if (r.getSchedulers().get(name) instanceof PercentageSchedule) {
                                sb.append(name + "\n");
                            }
                        }
                        if (sb.length() > 1) sb.deleteCharAt(sb.length()-1);                        
                        sendAjaxAnswer(sb.toString());
                    }
                }
            }
            if (action.equals("SAVE")) {
                if (user.getGroup().equals(Group.ADMIN_GROUP)) {
                    if (requestParameters.get("type").equalsIgnoreCase("OnOff")) {
                        String name = requestParameters.get("name");
                        if (r.getSchedulers().containsKey(name)) {
                            sendAjaxError("This program name already exist. Cannot save this program. Please use the name, which does not exist.");
                            return;
                        }
                        OnOffSchedule schd = new OnOffSchedule();
                        schd.setName(name);
                        for (int i=0; i<14;i++) {
                           schd.saveSchedule(requestParameters.get(Integer.toString(i)), Integer.toString(i));                       
                        }
                        r.getSchedulers().put(name, schd);
                        r.getPersistance().saveSchedule(schd);
                        sendAjaxAnswer("OK");
                    } else if (requestParameters.get("type").equalsIgnoreCase("Temperature")) {
                        String name = requestParameters.get("name");
                        if (r.getSchedulers().containsKey(name)) {
                            sendAjaxError("This program name already exist. Cannot save this program. Please use the name, which does not exist.");
                            return;
                        }
                        TemperatureSchedule schd = new TemperatureSchedule();
                        schd.setName(name);
                        for (int i=0; i<14;i++) {
                           schd.saveSchedule(requestParameters.get(Integer.toString(i)), Integer.toString(i));                       
                        }
                        r.getSchedulers().put(name, schd);
                        r.getPersistance().saveSchedule(schd);
                        sendAjaxAnswer("OK");
                    } else if (requestParameters.get("type").equalsIgnoreCase("Percentage")) {
                        String name = requestParameters.get("name");
                        if (r.getSchedulers().containsKey(name)) {
                            sendAjaxError("This program name already exist. Cannot save this program. Please use the name, which does not exist.");
                            return;
                        }
                        PercentageSchedule schd = new PercentageSchedule();
                        schd.setName(name);
                        for (int i=0; i<14;i++) {
                           schd.saveSchedule(requestParameters.get(Integer.toString(i)), Integer.toString(i));                       
                        }
                        r.getSchedulers().put(name, schd);
                        r.getPersistance().saveSchedule(schd);
                        sendAjaxAnswer("OK");
                    } 
                } else {
                    sendAjaxError("error_no_permission");
                }
            }
            if (action.equals("UPDATE")) {
                if (user.getGroup().equals(Group.ADMIN_GROUP)) {
                    if (requestParameters.get("type").equalsIgnoreCase("OnOff")) {
                        String name = requestParameters.get("name");
                        if (r.getSchedulers().containsKey(name)) {
                            OnOffSchedule schd = (OnOffSchedule)r.getSchedulers().get(name);
                        for (int i=0; i<14;i++) {
                           schd.saveSchedule(requestParameters.get(Integer.toString(i)), Integer.toString(i));                       
                        }
                        r.getPersistance().saveSchedule(schd);
                        sendAjaxAnswer("OK");
                        } else {
                            sendAjaxError("This program name does not exist. Cannot update this program. Please reopen the schedule frame.");
                            return;                        
                        }
                    }
                    if (requestParameters.get("type").equalsIgnoreCase("Temperature")) {
                        String name = requestParameters.get("name");
                        if (r.getSchedulers().containsKey(name)) {
                            TemperatureSchedule schd = (TemperatureSchedule)r.getSchedulers().get(name);
                        for (int i=0; i<14;i++) {
                           schd.saveSchedule(requestParameters.get(Integer.toString(i)), Integer.toString(i));                       
                        }
                        r.getPersistance().saveSchedule(schd);
                        sendAjaxAnswer("OK");
                        } else {
                            sendAjaxError("This program name does not exist. Cannot update this program. Please reopen the schedule frame.");
                            return;                        
                        }
                    }
                    if (requestParameters.get("type").equalsIgnoreCase("Percentage")) {
                        String name = requestParameters.get("name");
                        if (r.getSchedulers().containsKey(name)) {
                            PercentageSchedule schd = (PercentageSchedule)r.getSchedulers().get(name);
                        for (int i=0; i<14;i++) {
                           schd.saveSchedule(requestParameters.get(Integer.toString(i)), Integer.toString(i));                       
                        }
                        r.getPersistance().saveSchedule(schd);
                        sendAjaxAnswer("OK");
                        } else {
                            sendAjaxError("This program name does not exist. Cannot update this program. Please reopen the schedule frame.");
                            return;                        
                        }
                    }
                } else {
                    sendAjaxError("error_no_permission");
                }
            }
            if (action.equals("DELETE")) {
                if (user.getGroup().equals(Group.ADMIN_GROUP)) {
                    String name = requestParameters.get("name");
                    r.getPersistance().deleteScheduler(r.getSchedulers().get(name));
                    r.getSchedulers().remove(requestParameters.get("name"));
                        sendAjaxAnswer("OK");
                } else {
                    sendAjaxError("error_no_permission");
                }
            }
            if (action.equals("GET")) {
                sendAjaxAnswer(r.getSchedulers().get(requestParameters.get("name")).loadSchedule());
            }
        } catch (Exception e) {
            RemoteHomeManager.log.error(98,e);
            sendAjaxError(e.getMessage());
        }
    }
}
