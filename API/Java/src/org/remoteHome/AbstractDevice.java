package org.remoteHome;

/**
 * This is the implementation class for all hardware devices. All the devices should extend this class.
 * 
 * @author Robert Gregor
 */
public abstract class AbstractDevice implements Device {
    
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
}
