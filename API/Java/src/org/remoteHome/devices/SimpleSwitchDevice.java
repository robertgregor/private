/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.devices;

import org.remoteHome.AbstractDevice;
import org.remoteHome.RemoteHomeManager;
import org.remoteHome.exception.RemoteHomeConnectionException;

/**
 *
 * @author pt596
 */
public class SimpleSwitchDevice extends AbstractDevice {
    
    public SimpleSwitchDevice(RemoteHomeManager m, int deviceId, String deviceName) {
        super (m, deviceId, deviceName);        
    }
    
    @Override
    public void manageAsynchronousCommand(String[] items) {
        //For this device no asynchronous command exist, leave this method empty.
    }
    
    public void switchOn() throws RemoteHomeConnectionException {
        m.sendCommand(getDeviceId(), "l1o");
    }
    
    public void switchOff() throws RemoteHomeConnectionException {
        m.sendCommand(getDeviceId(), "l1f");
    }
}
