package org.remoteHome;

/**
 *
 * Defines the status codes of the alarm sensor
 * 0 disabled, 1 enabled, 2 activated, 3 leave timeout running, 4 enter timeout running
 * @author Robert Gregor
 */
public class AlarmStatus {
    
    public static int ALARM_DISABLED = 0;
    public static int ALARM_ENABLED = 1;
    public static int ALARM_ACTIVATED = 2;
    public static int LEAVE_TIMEOUT_RUNNING = 3;
    public static int ENTER_TIMEOUT_RUNNING = 4;
}
