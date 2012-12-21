package org.remoteHome;

import java.util.HashMap;

/**
 *
 * This is the main starting point of the remote-home API. To be able to use it, you have to plug the USB communicator or Raspberry shield.<BR/>
 * Then install ser2net. Configure it and start it.<BR/><BR/>
 * 
 * Quick howto for raspberry:<BR/>
 * <ul>
 * <li>Edit /boot/cmdline.txt<BR/>From: dwc_otg.lpm_enable=0 rpitestmode=1 console=ttyAMA0,115200 kgdboc=ttyAMA0,115200 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 rootwait<br/>
 * to:dwc_otg.lpm_enable=0 rpitestmode=1 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 rootwait</li>
 * <li>Edit /etc/innitab<br/>comment out:&nbsp;2:23:respawn:/sbin/getty -L ttyAMA0 115200 vt100</li>
 * <li>Install ser2net:<br/>&nbsp;&nbsp;Archlinux: pacman -S ser2net<br/>&nbsp;&nbsp;Raspbian/Debian: sudo apt-get install ser2net</li>
 * <li>Edit config file: vi /etc/ser2net.conf and add the following:<br/>2000:raw:0:/dev/ttyAMA0:9600 8DATABITS NONE 1STOPBIT<br/>2001:telnet:0:/dev/ttyAMA0:9600 8DATABITS NONE 1STOPBIT</li>
 * <li>Restart ser2net: cd /etc/rc.d&nbsp;./ser2net restart</li>
 * </ul>
 * <br/>
 * <br/>
 * Quick howto for LINUX<BR/>
 * <ul>
 * <li>Install ser2net:<br/>&nbsp;&nbsp;Archlinux: pacman -S ser2net<br/>&nbsp;&nbsp;Debian: sudo apt-get install ser2net</li>
 * <li>Edit config file: vi /etc/ser2net.conf and add the following:<br/>2000:raw:0:/dev/ttyUSB0:9600 8DATABITS NONE 1STOPBIT<br/>2001:telnet:0:/dev/ttyUSB0:9600 8DATABITS NONE 1STOPBIT</li>
 * <li>Restart ser2net: cd /etc/rc.d&nbsp;./ser2net restart</li>
 * </ul>
 * <br/>
 * <br/>
 * Quick howto for WINDOWS<BR/>
 * <ul>
 * <li>Install some COM port redirector. HW VSP3 is recomended. http://www.hw-group.com/products/hw_vsp/index_en.html</li>
 * <li>Configure it in the mode RS232 -> TCP socket. The RS232 should be configured as 9600 Bd 8N1 (8 bytes no parity, one stop bit, no flowcontrol.</li>
 * <li>Start</li>
 * </ul>
 * <br/>
 * <br/>
 * @author Robert Gregor
 * 
 * This is the main class of the API.
 */
public class RemoteHomeManager {
    
    private HashMap<Integer, AbstractDevice> devices = new HashMap<Integer, AbstractDevice>();
    private RemoteHomeCommunicator comm;
    
    /**
     * 
     * @param host hostname or IP address of the machine, to which is the communicator connected.
     * @param port the TCP port, on which the ser2net or comport redirector is listening. (e.g. 2000)
     * @throws RemoteHomeConnectionException if there is a problem with the connection
     */
    public RemoteHomeManager(String host, String port) throws RemoteHomeConnectionException {
        comm = new RemoteHomeCommunicator(host, port, this);
    }
    /**
     * 
     * @param deviceId the device Id, of the device, which was configured during the initial setup.
     * @param deviceName Device name is free text to describe the device and e.g. the location of the device
     * @param deviceType could be:<br/>AbstractDevice.HeatingHeader<br/>AbstractDevice.SimpleSwitch<br/>AbstractDevice.TemperatureSensor<br/>
     * AbstractDevice.LightAlarmDevice<br/>AbstractDevice.BlindsControllerDevice<br/>AbstractDevice.Thermostat<br/>AbstractDevice.BatteryThermostat
     * @return the device reference
     * @throws RemoteHomeManagerException if the type of the device is unknown.
     */
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
        } else if (deviceType == AbstractDevice.BlindsControllerDevice) {
            BlindsControllerDevice device = new BlindsControllerDevice(this, deviceId, deviceName);
            devices.put(deviceId, device);
            return device;            
        } else if (deviceType == AbstractDevice.Thermostat) {
            ThermostatDevice device = new ThermostatDevice(this, deviceId, deviceName);
            devices.put(deviceId, device);
            return device;            
        } else if (deviceType == AbstractDevice.BatteryThermostat) {
            BatteryThermostatDevice device = new BatteryThermostatDevice(this, deviceId, deviceName);
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
