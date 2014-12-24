package org.remoteHome;

/**
 *
 * @author gregorro
 */
public class DeviceSoftwareData {
    /**
     * This is the binary data for the device software
     */    
    private byte[] deviceSoftwareHexData;
    /**
     * This is the version of the software
     */    
    private int deviceSoftwareHexVersion;
    
    /**
     * This is the name of the software
     */    
    private String deviceSoftwareHexName;

    /**
     * @return the deviceSoftwareHexData
     */
    public byte[] getDeviceSoftwareHexData() {
        return deviceSoftwareHexData;
    }

    /**
     * @param deviceSoftwareHexData the deviceSoftwareHexData to set
     */
    public void setDeviceSoftwareHexData(byte[] deviceSoftwareHexData) {
        this.deviceSoftwareHexData = deviceSoftwareHexData;
    }

    /**
     * @return the deviceSoftwareHexVersion
     */
    public int getDeviceSoftwareHexVersion() {
        return deviceSoftwareHexVersion;
    }

    /**
     * @param deviceSoftwareHexVersion the deviceSoftwareHexVersion to set
     */
    public void setDeviceSoftwareHexVersion(int deviceSoftwareHexVersion) {
        this.deviceSoftwareHexVersion = deviceSoftwareHexVersion;
    }

    /**
     * @return the deviceSoftwareHexName
     */
    public String getDeviceSoftwareHexName() {
        return deviceSoftwareHexName;
    }

    /**
     * @param deviceSoftwareHexName the deviceSoftwareHexName to set
     */
    public void setDeviceSoftwareHexName(String deviceSoftwareHexName) {
        this.deviceSoftwareHexName = deviceSoftwareHexName;
    }
    
    @Override
    public String toString() {
        return getDeviceSoftwareHexName()+": "+"Ver:"+getDeviceSoftwareHexVersion()+" "+getDeviceSoftwareHexData().length+" bytes";
    }
}
