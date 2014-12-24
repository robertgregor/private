package org.remoteHome;

import java.util.Collection;

/**
 *
 * @author gregorro
 */
public abstract class AbstractSketch implements Sketch {
    public RemoteHomeManager remoteHomeManager;
    /*
    * This is called after the class is constructed.
    */
    public abstract void init();
    /*
    * This is called, when any device change its status. 
    * @param device is the device which was changed.
    */
    public abstract void manageDeviceChange(AbstractDevice device);
    
    /*
     * This method is called each second. Do not put inside blocking operations
    */
    public void runEachSecond() {}
    
    /*
     * This method is called each minute. Do not put inside blocking operations
    */
    public void runEachMinute() {}

    /*
     * This method is called each 10 minutes. Do not put inside blocking operations
    */
    public void runEach10Minutes() {}

    /*
     * This method is called each hour. Do not put inside blocking operations
    */
    public void runEachHour() {}

    /*
     * This method is called each day. Do not put inside blocking operations
    */
    public void runEachDay() {}
    
    public AbstractDevice getDevice(int deviceId) throws RemoteHomeManagerException {
        return remoteHomeManager.getDevice(deviceId);
    }
    public Collection<AbstractDevice> getAllDevices() throws RemoteHomeManagerException {
        return remoteHomeManager.getDevices();
    }

    /**
     * @param remoteHomeManager the remoteHomeManager to set
     */
    protected void setRemoteHomeManager(RemoteHomeManager remoteHomeManager) {
        this.remoteHomeManager = remoteHomeManager;
    }
}
