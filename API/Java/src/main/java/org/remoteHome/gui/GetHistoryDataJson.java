/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Calendar;
import java.util.Date;

import org.remoteHome.AbstractDevice;
import org.remoteHome.Group;
import org.remoteHome.HistoryData;
import org.remoteHome.RemoteHomeManager;

/**
 *
 * @author gregorro
 */
public class GetHistoryDataJson extends AbstractWebService{
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        try {            
            StringBuilder sb = new StringBuilder();
            int deviceId = Integer.parseInt(requestParameters.get("deviceId"));
            AbstractDevice d = r.getDevice(deviceId);
            if (requestParameters.get("clear") != null) {
                    if (user.getGroup().equals(Group.ADMIN_GROUP)) {                   
                        r.getPersistance().deleteHistoryData(deviceId);
                        sendAjaxAnswer("OK");
                        return;
                    } else {
                        RemoteHomeManager.log.warning("User "+user+" doesnt have permission to modify parameters.");
                        sendAjaxError("error_no_permission");
                        return;
                    }
            }
            HistoryData[] historyData;
            String range = requestParameters.get("range");
            HistoryData prototype = new HistoryData();
            prototype.setDeviceId(deviceId);
            prototype.setDataName(requestParameters.get("type"));
            Calendar cal = Calendar.getInstance();
            cal.setTime(new Date(System.currentTimeMillis()));
            if (range.equalsIgnoreCase("hour")) {cal.add(Calendar.HOUR, -1);prototype.setDataTimestamp(cal.getTime());}
            else if (range.equalsIgnoreCase("day")) {cal.add(Calendar.DAY_OF_MONTH, -1);prototype.setDataTimestamp(cal.getTime());}
            else if (range.equalsIgnoreCase("week")) {cal.add(Calendar.WEEK_OF_MONTH, -1);prototype.setDataTimestamp(cal.getTime());}
            else if (range.equalsIgnoreCase("month")) {cal.add(Calendar.MONTH, -1);prototype.setDataTimestamp(cal.getTime());}
            else if (range.equalsIgnoreCase("threemonth")) {cal.add(Calendar.MONTH, -3);prototype.setDataTimestamp(cal.getTime());}
            else if (range.equalsIgnoreCase("year")) {cal.add(Calendar.YEAR, -1);prototype.setDataTimestamp(cal.getTime());}
            else if (range.equalsIgnoreCase("threeyears")) {cal.add(Calendar.YEAR, -3);prototype.setDataTimestamp(cal.getTime());}
            historyData = r.getPersistance().getHistoryData(prototype);                
            ObjectMapper mapper = new ObjectMapper();
            mapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);
            sb.append(mapper.writeValueAsString(d.generateChartItems(historyData, requestParameters.get("type"))));                
            RemoteHomeManager.log.debug("Data to chart: "+sb.toString());
            sendAjaxAnswer(sb.toString());
            return;
        } catch (Exception e) {
            RemoteHomeManager.log.error(8,e);
            sendAjaxError(e.getMessage());
        }
    }   
}
