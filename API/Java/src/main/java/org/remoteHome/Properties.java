/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome;

/**
 *
 * @author gregorro
 */
public class Properties {
    public String language = "en";
    public String programmingPort = "8081";
    public String tempDir = "/temp";
    public String smtpHost = "smtp.gmail.com";
    public int smtpPort = 25;
    public boolean smtpAuthenticate = true;
    public String smtpUserName = "username";
    public String smtpPassword = "password";
    public String smtpFrom = "from.example@gmail.com";
    public String lowBatteryMessage = "The device with ID:{deviceId}, Name:{deviceName}, Room:{deviceRoom} has low battery: {voltage}V. Please replace/charge it.";
    public String powerLostMessage = "The device with ID:{deviceId}, Name:{deviceName}, Room:{deviceRoom} lost the power.";
    public String notificationMessageSubject = "Message from home controller";
    public String notificationMessageTo = "cool.person@gmail.com";
    public boolean useMailTls = false;
    public boolean useTextLogging = false;
    public String logFileName = "/var/log/remoteHome.log";
    public String logLevel = "INFO";  
}
