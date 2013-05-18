package org.remoteHome;

/**
 * This interface should be implemented in order to receive alarms from alarm sensor capable devices.
 * @author Robert Gregor
 */
public interface LightAlarmDeviceListener {
    
    /**
     * This method is called by the API, when alarm is received.
     * @return id object id of the device, where alarm event fired.
     */
    public int alarmFired();    
}
