/**
 * This interface should be implemented in order to receive device changes. In case of asynchronous device update, the method deviceUpdated is called. It is also called in case of synchronous 
 * change e.g. when switchOn() method of Simple switch is called.
 * @author Robert Gregor
 */

package org.remoteHome;

/**
 *
 * @author gregorro
 */
public interface DeviceChangeListener {

    RemoteHomeManager remoteHomeManager = null;
    
    /**
     * This method is called by the API, when device is changed. The method is called in separate thread and the deviceChanged is final. If you want to modify anything in the passed device
     * you have to get the device from RemoteHomeManager: remoteHomeManager.getDevice(deviceChanged.getDeviceId());
     * @param deviceChanged is the device, which was changed.
     */
    public void deviceChanged(AbstractDevice deviceChanged);
}
