/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome;

import java.util.HashMap;

/**
 *
 * @author Robert Gregor
 * 
 * This is the main class of the API.
 */
public class RemoteHomeManager {
    
    private HashMap<Integer, AbstractDevice> devices = new HashMap<Integer, AbstractDevice>();
    private RemoteHomeCommunicator comm;
    
    public RemoteHomeManager(String host, String port) throws RemoteHomeConnectionException {
        comm = new RemoteHomeCommunicator(host, port, this);
    }
    
    public AbstractDevice getRemoteHomeDevice(int deviceId, String deviceName, int deviceType) throws RemoteHomeManagerException {
        if (deviceType == AbstractDevice.HeatingHeader) {
            HeatingHeaderDevice device = new HeatingHeaderDevice(this, deviceId, deviceName);
            devices.put(deviceId, device);
            return device;
        } else if (deviceType == AbstractDevice.SimpleSwitch) {
            SimpleSwitchDevice device = new SimpleSwitchDevice(this, deviceId, deviceName);
            devices.put(deviceId, device);
            return device;
        } else if (deviceType == AbstractDevice.TemperatureSensor) {
            TemperatureSensorDevice device = new TemperatureSensorDevice(this, deviceId, deviceName);
            devices.put(deviceId, device);
            return device;
        } else if (deviceType == AbstractDevice.LightAlarmDevice) {
            LightAlarmDevice device = new LightAlarmDevice(this, deviceId, deviceName);
            devices.put(deviceId, device);
            return device;
        } else {
            throw new RemoteHomeManagerException(RemoteHomeManagerException.UNKNOWN_DEVICE);
        }
    }
    
    protected void manageAsynchronousCommand(String data) {
           String tokens[] = data.split(" ");
           //device Id, skip + sign
           Integer deviceId = Integer.parseInt(tokens[0].substring(1));
           AbstractDevice targetDevice = devices.get(deviceId);
           if (targetDevice != null) {
               targetDevice.manageAsynchronousCommand(tokens[1].split("\\|"));
           }
    }
    
    public void sendCommand(int deviceId, String command) throws RemoteHomeConnectionException {
        comm.sendCommand(deviceId, command);
    }

    public String sendCommandWithAnswer(int deviceId, String command) throws RemoteHomeConnectionException {
        return comm.sendCommandWithAnswer(deviceId, command);
    }
    
}
