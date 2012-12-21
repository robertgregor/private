package org.remoteHome;

import java.io.Serializable;

/**
 * This is the implementation class for all hardware devices. All the devices should extend this class.
 * 
 * @author Robert Gregor
 */
public abstract class AbstractDevice implements Serializable {
    
    /**
     * This device type is heating header.
     */
    public static int HeatingHeader = 4;

    /**
     * This device type is simple switch
     */
    public static int SimpleSwitch = 3;
    
    /**
     * This device type is simple switch
     */
    public static int TemperatureSensor = 2;

    /**
     * This device type is simple switch
     */
    public static int LightAlarmDevice = 1;

    /**
     * This device type is blinds controller
     */
    public static int BlindsControllerDevice = 5;

    /**
     * This device type is thermostat, connected to power line
     */
    public static int Thermostat = 6;
    
    /**
     * This device type is battery thermostat, connected to power line
     */
    public static int BatteryThermostat = 7;
    /**
     * This is device id of the hardware device assigned with AT+a=id command
     */
    private int deviceId = 0;    

    /**
     * This is device name of the hardware device. Free text
     */
    private String deviceName = "";
    
    /**
     * This is reference to the RemoteHomeManager
     */
    protected RemoteHomeManager m;
    
    protected AbstractDevice (RemoteHomeManager m, int deviceId, String deviceName) {
        this.m = m;
        this.deviceId = deviceId;
        this.deviceName = deviceName;
    }
    /**
     * 
     * @param deviceId is device id of the hardware device assigned with AT+a=id command
     */
    protected void setDeviceId(int deviceId) {
        this.deviceId = deviceId;
    }
    
    /**
     * 
     * @return device id of the hardware device assigned with AT+a=id command
     */
    public int getDeviceId() {
        return deviceId;
    }

    /**
     * 
     * @return device name of the hardware device. Free text
     */
    public String getDeviceName() {
        return deviceName;
    }

    /**
     * 
     * @param deviceName device name of the hardware device. Free text
     */
    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName;
    }
  /**
    * This method will check, if the device is alive. Please note that for battery powerred devices, this command most likely fail, because the devices sleep
    * most of the time.
    * @throws RemoteHomeConnectionException if the device is not reachable.
    */
    public void pingDevice() throws RemoteHomeConnectionException {
        m.sendCommand(getDeviceId(), "pn");
    }
    
  /**
    * This method is called by the Remote home manager. If you register your device to receive the asynchronous events, 
    * the communication class will call this method to set the values of the specific device type.
    * Please note, that this method is called in the same thread as the receiving thread, so the implementation should be fast enough to return as soon as possible.
    * @param items the items after the space. The detailed list is described in the communication protocol.
    * 
    * @author Robert Gregor
    */
    protected abstract void manageAsynchronousCommand(String[] items);
}
