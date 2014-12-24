/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
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
import org.remoteHome.SketchData;
import org.remoteHome.TemperatureSchedule;

/**
 *
 * @author gregorro
 */
public class SketchesManager extends AbstractWebService {
    
        
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        try {
            String action = requestParameters.get("action");
            if (action.equals("LOAD")) {
                    if ((r.getSketches().keySet() == null) || (r.getSketches().isEmpty())) {
                        sendAjaxAnswer("");                        
                    } else {
                        TreeSet<String> names = new TreeSet<String>(r.getSketches().keySet());
                        StringBuilder sb = new StringBuilder();
                        for (String name : names) {
                                sb.append(name + "\n");
                        }
                        if (sb.length() > 1) sb.deleteCharAt(sb.length()-1);                        
                        sendAjaxAnswer(sb.toString());
                    }
            }
            if (action.equals("SAVE")) {
                if (user.getGroup().equals(Group.ADMIN_GROUP)) {
                        String name = requestParameters.get("name");
                        if (r.getSketches().containsKey(name)) {
                            sendAjaxError("This sketch name already exist. Cannot save this sketch. Please use the name, which does not exist.");
                            return;
                        }
                        SketchData sketch = new SketchData();                        
                        sketch.setSketchName(name);
                        sketch.setSketchSourceCode(requestParameters.get("data"));
                        sketch.setSketchClassName(getClassNameFromSource(requestParameters.get("data")));
                        String result = sketch.compileSketch();
                        if (!result.equals("")) {
                            sendAjaxError(result);
                            return;
                        }
                        sketch.getSketchInstance().remoteHomeManager = r;
                        sketch.getSketchInstance().init();
                        r.getSketches().put(name, sketch);
                        r.getPersistance().saveSketchData(sketch);
                        sendAjaxAnswer("OK");
                } else {
                    sendAjaxError("error_no_permission");
                }
            }
            if (action.equals("UPDATE")) {
                if (user.getGroup().equals(Group.ADMIN_GROUP)) {
                        String name = requestParameters.get("name");
                        if (r.getSketches().containsKey(name)) {
                            SketchData data = (SketchData)r.getSketches().get(name);
                            String oldSource = data.getSketchSourceCode();
                            String oldClassName = data.getSketchClassName();
                            data.setSketchSourceCode(requestParameters.get("data"));
                            data.setSketchClassName(getClassNameFromSource(requestParameters.get("data")));
                            String result = data.compileSketch();
                            if (!result.equals("")) {
                                data.setSketchSourceCode(oldSource);
                                data.setSketchClassName(oldClassName);
                                sendAjaxError("Compilation fail:\n\n"+result);
                                return;
                            }
                            data.getSketchInstance().remoteHomeManager = r;
                            data.getSketchInstance().init();
                            r.getSketches().put(name, data);
                            r.getPersistance().saveSketchData(data);                            
                            sendAjaxAnswer("OK");
                        } else {
                            sendAjaxError("This sketch name does not exist. Cannot update this sketch.");
                            return;                        
                        }
                } else {
                    sendAjaxError("error_no_permission");
                }
            }
            if (action.equals("DELETE")) {
                if (user.getGroup().equals(Group.ADMIN_GROUP)) {
                    String name = requestParameters.get("name");
                    r.getPersistance().deleteSketchData(r.getSketches().get(name));
                    r.getSketches().remove(name);
                        sendAjaxAnswer("OK");
                } else {
                    sendAjaxError("error_no_permission");
                }
            }
            if (action.equals("GET")) {
                sendAjaxAnswer(r.getSketches().get(requestParameters.get("name")).getSketchSourceCode());
            }
        } catch (Exception e) {
            RemoteHomeManager.log.error(97,e);
            sendAjaxError(e.getMessage());
        }
    }
    
    private String getClassNameFromSource(String source) {
        String packageName = "";
        String[] tokens = source.split(" ");
        for (int i=0; i<tokens.length; i++) {
            if (tokens[i].equals("package")) packageName = tokens[i+1].replaceAll(";", ".").replaceAll(" ", "").substring(0, tokens[i+1].indexOf("\n"));
            if (tokens[i].equals("class")) return packageName+tokens[i+1];
        }
        return "";
    }
}
