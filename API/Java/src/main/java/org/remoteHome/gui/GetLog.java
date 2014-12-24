/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import org.remoteHome.Group;
import org.remoteHome.RemoteHomeManager;
import org.remoteHome.util.Logfile;

/**
 *
 * @author gregorro
 */
public class GetLog  extends AbstractWebService {
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        SimpleDateFormat dateFormater = new SimpleDateFormat("dd-MM-yy HH:mm:ss:SSS");
        StringBuffer sb = new StringBuffer();
        String action = requestParameters.get("action");
        List <Logfile.LogLine>data = new <Logfile.LogLine>ArrayList();
        if (action.equals("All")) {
            data = RemoteHomeManager.log.getCache();
        } else if (action.equals("Info")) {
            data = RemoteHomeManager.log.getCacheBySeverity("INFO");
        } else if (action.equals("Warning")) {
            data = RemoteHomeManager.log.getCacheBySeverity("WARNING");
        } else if (action.equals("Error")) {
            data = RemoteHomeManager.log.getCacheBySeverity("ERROR");
        } else if (action.equals("Fatal")) {
            data = RemoteHomeManager.log.getCacheBySeverity("FATAL");            
        } else if (action.equals("Clean")) {
            if (user.getGroup().equals(Group.ADMIN_GROUP)) {
                data = RemoteHomeManager.log.cleanCache();
            } else {
                RemoteHomeManager.log.warning("User "+user+" doesnt have permission to clean the logs.");
                sendAjaxError("error_no_permission");
                return;
            }                
        }
        sb.append("<table width=\"100%\" id=\"logfileTable\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">");
        sb.append("<thead><tr><th>Sequence</th><th>Date</th><th>Thread name</th><th>Method name</th><th>Severity</th>"
                             + "<th>Error code</th><th>Message</th></tr></thead><tbody>");

        for (Logfile.LogLine logLine : data) {
            sb.append("<tr"+getTdColoredClass(logLine)+">");
            sb.append("<td"+getColoredClass(logLine)+">");
            sb.append(logLine.sequence);
            sb.append("</td>");
            sb.append("<td"+getColoredClass(logLine)+">");
            sb.append(dateFormater.format(logLine.date));
            sb.append("</td>");
            sb.append("<td"+getColoredClass(logLine)+">");
            sb.append(logLine.threadName);
            sb.append("</td>");
            sb.append("<td"+getColoredClass(logLine)+">");
            sb.append(logLine.methodName);
            sb.append("</td>");
            sb.append("<td"+getColoredClass(logLine)+">");
            sb.append(logLine.severity);
            sb.append("</td>");
            sb.append("<td"+getColoredClass(logLine)+">");
            sb.append((logLine.errorCode!="")?logLine.errorCode:"&nbsp;");
            sb.append("</td>");
            sb.append("<td"+getColoredClass(logLine)+">");
            sb.append(logLine.message);
            sb.append("</td>");
            sb.append("</tr>");
        }
        sb.append("</tbody></table>");
        sendAjaxAnswer(sb.toString());
    }
    private String getColoredClass(Logfile.LogLine logLine) {
            if (logLine.severity.trim().equals("DEBUG")) return " style=\"font-size:10px;font-weight:normal;color:black;\"";
            else if (logLine.severity.trim().equals("INFO")) return " style=\"font-size:10px;font-weight:normal;color:blue;\"";
            else if (logLine.severity.trim().equals("WARNING")) return " style=\"font-size:10px;font-weight:bold;color:black;\"";
            else if (logLine.severity.trim().equals("ERROR")) return " style=\"font-size:10px;font-weight:bolder;color:white;\"";
            else if (logLine.severity.trim().equals("FATAL")) return " style=\"font-size:10px;font-weight:bolder;color:white;\"";
            return "<td class=\"textDebug\">";
   }
   private String getTdColoredClass(Logfile.LogLine logLine) {
            if (logLine.severity.trim().equals("DEBUG")) return " style=\"background-color:white;\"";
            else if (logLine.severity.trim().equals("INFO")) return " style=\"background-color:silver;\"";
            else if (logLine.severity.trim().equals("WARNING")) return " style=\"background-color:yellow;\"";
            else if (logLine.severity.trim().equals("ERROR")) return " style=\"background-color:red;\"";
            else if (logLine.severity.trim().equals("FATAL")) return " style=\"background-color:black;\"";
            return "<td class=\"textDebug\">";
   }
}
