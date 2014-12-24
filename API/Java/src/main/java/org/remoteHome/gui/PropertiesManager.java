package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import org.remoteHome.AbstractDevice;
import org.remoteHome.Group;
import org.remoteHome.Properties;
import org.remoteHome.RemoteHomeManager;
import org.remoteHome.RemoteHomeManagerException;

/**
 *
 * @author gregorro
 */
public class PropertiesManager  extends AbstractWebService {

    public void init() {

    }

    public void processRequest(OutputStream o, HttpExchange t) throws IOException, RemoteHomeManagerException {
        String action = requestParameters.get("action");
        RemoteHomeManager.log.debug("Received action: "+action);
        if (action.equals("loadAllProperties")) {
                String jsonP = AbstractDevice.generateJsonData(r.getPersistance().loadProperties());
                RemoteHomeManager.log.debug("Sending properties: "+jsonP);
                sendAjaxAnswer(jsonP);
        } else if (action.equals("modifyProperties")) {
            if (user.getGroup().equals(Group.ADMIN_GROUP)) {
                Properties p = r.getPersistance().loadProperties();
                if (!requestParameters.get("lang").equals(p.language)) {
                    p.language = requestParameters.get("lang");
                    RemoteHomeManager.log.info("User: "+user+" changed parameter language:"+p.language);
                }
                if (!requestParameters.get("programmingPort").equals(p.programmingPort)) {
                    p.programmingPort = requestParameters.get("programmingPort");
                    RemoteHomeManager.log.info("User: "+user+" changed parameter programmingPort:"+p.programmingPort);
                }
                if (!requestParameters.get("tempDir").equals(p.tempDir)) {
                    p.tempDir = requestParameters.get("tempDir");
                    RemoteHomeManager.log.info("User: "+user+" changed parameter tempDir:"+p.tempDir);
                }
                if (!requestParameters.get("emailUsername").equals(p.smtpUserName)) {
                    p.smtpUserName = requestParameters.get("emailUsername");
                    RemoteHomeManager.log.info("User: "+user+" changed parameter smtpUserName:"+p.smtpUserName);
                }
                if (!requestParameters.get("emailPassword").equals(p.smtpPassword)) {
                    p.smtpPassword = requestParameters.get("emailPassword");
                    RemoteHomeManager.log.info("User: "+user+" changed parameter emailPassword:"+p.smtpPassword);
                }
                if (!requestParameters.get("emailFrom").equals(p.smtpFrom)) {
                    p.smtpFrom = requestParameters.get("emailFrom");
                    RemoteHomeManager.log.info("User: "+user+" changed parameter smtpFrom:"+p.smtpFrom);
                }
                if (!requestParameters.get("emailSmtpHost").equals(p.smtpHost)) {
                    p.smtpHost = requestParameters.get("emailSmtpHost");
                    RemoteHomeManager.log.info("User: "+user+" changed parameter smtpHost:"+p.smtpHost);
                }
                try {
                    if (Integer.parseInt(requestParameters.get("emailSmtpPort")) != p.smtpPort) {
                        p.smtpPort = Integer.parseInt(requestParameters.get("emailSmtpPort"));
                        RemoteHomeManager.log.info("User: "+user+" changed parameter smtpPort:"+p.smtpPort);
                    }
                } catch (NumberFormatException e) {}
                if (Boolean.parseBoolean(requestParameters.get("emailauthenticate")) != p.smtpAuthenticate) {
                    p.smtpAuthenticate = new Boolean(requestParameters.get("emailauthenticate"));
                    RemoteHomeManager.log.info("User: "+user+" changed parameter smtpAuthenticate:"+p.smtpAuthenticate);
                }
                if (!requestParameters.get("lowBatteryMessage").equals(p.lowBatteryMessage)) {
                    p.lowBatteryMessage = requestParameters.get("lowBatteryMessage");
                    RemoteHomeManager.log.info("User: "+user+" changed parameter lowBatteryMessage:"+p.lowBatteryMessage);
                }
                if (!requestParameters.get("powerLostMessage").equals(p.powerLostMessage)) {
                    p.powerLostMessage = requestParameters.get("powerLostMessage");
                    RemoteHomeManager.log.info("User: "+user+" changed parameter powerLostMessage:"+p.powerLostMessage);
                }
                if (!requestParameters.get("notificationMessageSubject").equals(p.notificationMessageSubject)) {
                    p.notificationMessageSubject = requestParameters.get("notificationMessageSubject");
                    RemoteHomeManager.log.info("User: "+user+" changed parameter notificationMessageSubject:"+p.notificationMessageSubject);
                }
                if (!requestParameters.get("notificationMessageTo").equals(p.notificationMessageTo)) {
                    p.notificationMessageTo = requestParameters.get("notificationMessageTo");
                    RemoteHomeManager.log.info("User: "+user+" changed parameter notificationMessageTo:"+p.notificationMessageTo);
                }
                if (Boolean.parseBoolean(requestParameters.get("emailtls")) != p.useMailTls) {
                    p.useMailTls = new Boolean(requestParameters.get("emailtls"));
                    RemoteHomeManager.log.info("User: "+user+" changed parameter useMailTls:"+p.useMailTls);
                }
                if (!requestParameters.get("logFileName").equals(p.logFileName)) {
                    p.logFileName = requestParameters.get("logFileName");
                    RemoteHomeManager.log.info("User: "+user+" changed parameter logFileName:"+p.logFileName);
                }
                if (Boolean.parseBoolean(requestParameters.get("useLogFile")) != p.useTextLogging) {
                    p.useTextLogging = new Boolean(requestParameters.get("useLogFile"));
                    RemoteHomeManager.log.info("User: "+user+" changed parameter useLogFile:"+p.useTextLogging);
                    if (p.useTextLogging) {
                        RemoteHomeManager.log.startLoggingToFile(p.logFileName);
                    } else {
                        RemoteHomeManager.log.stopLoggingToFile();
                    }
                }
                if (!requestParameters.get("logLevel").equals(p.logLevel)) {
                    p.logLevel = requestParameters.get("logLevel");
                    RemoteHomeManager.log.info("User: "+user+" changed parameter logLevel:"+p.logLevel);
                    RemoteHomeManager.log.setLogLevel(p.logLevel);
                }
                r.getPersistance().saveProperties(p);
                sendAjaxAnswer(AbstractDevice.generateJsonData(p));
            } else {
                RemoteHomeManager.log.warning("User "+user+" doesnt have permission to modify parameters.");
                sendAjaxError("error_no_permission");
            }
        }
    }
}
