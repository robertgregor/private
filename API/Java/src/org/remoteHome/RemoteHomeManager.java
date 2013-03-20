package org.remoteHome;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;
import org.remoteHome.gui.WebServer;

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
    private HashMap<String, HashSet<AbstractDevice>> rooms = new HashMap<String, HashSet<AbstractDevice>>();
    private RemoteHomeCommunicator comm;
    private File persistentFile;
    
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
     * @param host hostname or IP address of the machine, to which is the communicator connected.
     * @param port the TCP port, on which the ser2net or comport redirector is listening. (e.g. 2000)
     * @param file the file to save the configuration and current status of the system.
     * @throws RemoteHomeConnectionException if there is a problem with the connection
     */
    public RemoteHomeManager(String host, String port, String file) throws RemoteHomeConnectionException, RemoteHomeManagerException {
        this(host, port);
        persistentFile = new File(file);
        try {
            loadPersistentData();
        } catch (Exception e) {
            throw new RemoteHomeManagerException(e.getMessage(), RemoteHomeManagerException.SERIALIZATION_ERROR);
        }
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
    public AbstractDevice createRemoteHomeDevice(int deviceId, String deviceName, int deviceType) throws RemoteHomeManagerException {
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
   
    /**
     * 
     * @param deviceId the device Id, of the device, which was configured during the initial setup.
     * @return the device reference
     * @throws RemoteHomeManagerException if the type of the device is unknown.
     */
    
    public AbstractDevice getDevice(int deviceId) throws RemoteHomeManagerException {
        AbstractDevice dev = devices.get(deviceId);
        if (dev != null) {
            return dev;
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
    /**
     * Adds the new room to the system
     * 
     * @param name is the name of the room
     * @return false if the room already exist. Returns true if the room has been added.
     */
    public boolean addRoom(String name) {
        if (rooms.containsKey(name)) return false;
        rooms.put(name, new HashSet<AbstractDevice>());
        return true;
    }
    /**
     * Removes empty room from the system
     * 
     * @param name is the name of the room
     * @return false if the room cannot be removed, because it is not empty or doesn't exist. Returns true if the room has been removed.
     */
    public boolean removeRoom(String name) {
        if (!rooms.containsKey(name)) return false;
        if (rooms.get(name).size() == 0) {
            rooms.remove(name);
            return true;
        } else {
            return false;
        }
    }
    /**
     * Add device to room
     * @param roomName is the name of the room. If it is not exist, it will be added.
     * @param device is the device to add
     * @return false if the device already exist in that room or the room name doesn't exist.
     */
    public boolean addDeviceToRoom(String roomName, AbstractDevice device) {
        if (!rooms.containsKey(roomName)) rooms.put(roomName, new HashSet<AbstractDevice>());
        return rooms.get(roomName).add(device);
    }    
    
    /**
     * Remove device from room
     * @param roomName is the name of the room.
     * @param device is the device to remove
     * @return false if the device or room not exist.
     */
    public boolean removeDeviceFromRoom(String roomName, AbstractDevice device) {
        if (!rooms.containsKey(roomName)) return false;
        return rooms.get(roomName).remove(device);
    }    

    /**
     * Get rooms
     * @return list of the rooms
     */
    public HashMap<String, HashSet<AbstractDevice>> getRooms() {
        return rooms;
    }
    
    /**
     * Sends the command to the device.
     * @param deviceId is the device Id to which the command should be sent
     * @param command is the command
     * @throws RemoteHomeConnectionException if there is an error with the communication.
     */
    public void sendCommand(int deviceId, String command) throws RemoteHomeConnectionException {
        comm.sendCommand(deviceId, command);
    }
    /**
     * Sends the command and waits for the answer from the device.
     * @param deviceId is the device Id to which the command should be sent
     * @param command is the command
     * @return the answer from the device
     * @throws RemoteHomeConnectionException if there is an error with the communication.
     */
    public String sendCommandWithAnswer(int deviceId, String command) throws RemoteHomeConnectionException {
        return comm.sendCommandWithAnswer(deviceId, command);
    }
    /**
     * Sends the add command and waits for the answer from the device.
     * @param deviceId is the device Id to which the command should be sent
     * @throws RemoteHomeConnectionException if there is an error with the communication.
     */
    public void addDevice(int deviceId) throws RemoteHomeConnectionException {
        comm.addDevice(deviceId);
    }
    /*
     * This method will join the communication thread, so the current thread will block
     */
    public void joinCommThread() throws RemoteHomeManagerException {
        try {
            comm.join();
        } catch (InterruptedException e) {
            return;
        } finally {
            comm.disconnect();
            try {
                savePersistentData();
            } catch (IOException e) {
                throw new RemoteHomeManagerException(e.getMessage(),RemoteHomeManagerException.SERIALIZATION_ERROR);
            }
        }
    }
    /*
     * This method will load the configuration from the file
     */
    private void loadPersistentData() throws Exception {
        if (persistentFile.exists()) {
            ObjectInputStream ois = new ObjectInputStream(new FileInputStream(persistentFile));
            devices = (HashMap<Integer, AbstractDevice>)ois.readObject();
            rooms = (HashMap<String, HashSet<AbstractDevice>>)ois.readObject();
            ois.close();
        }      
    }
    /*
     * This method will save the configuration to the file on the disk.
     */
    public void savePersistentData() throws IOException {
        if (persistentFile != null) {
            ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream(persistentFile));
            out.writeObject(devices);
            out.writeObject(rooms);
            out.close();
        }
    }
    /*
     * This method will return unused device id.
     */
    public int getUnusedDeviceId() {
        Set<Integer> deviceIds = devices.keySet();
        if (deviceIds.isEmpty()) return 1;
        for (int id : deviceIds) {
            if (!deviceIds.contains(Integer.valueOf(id+1))) {
                if ((id+1) < 256) return id+1;
            }
        }
        return 0;
    }
    
        /**
     * @return the password
     */
    public String getPassword() {
        return comm.getPassword();
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) throws RemoteHomeConnectionException {
        comm.setPassword(password);
    }

    /**
     * @return the channel
     */
    public int getChannel() {
        return comm.getChannel();
    }

    /**
     * @param channel the channel to set
     */
    public void setChannel(int channel) throws RemoteHomeConnectionException {
        comm.setChannel(channel);
    }
    
    public static void main(String... args) throws Exception {
        if ((args.length < 2) && (args.length > 4)) {        
            System.out.println("2 parametrs host, port; 3 parameters host, port, file; 4 parameters host, port, file, webServerPort;");
            return;
        }
        if (args.length == 2) {
            RemoteHomeManager manager = new RemoteHomeManager(args[0], args[1]);
            manager.joinCommThread();
        } else if (args.length == 3) {
            RemoteHomeManager manager = new RemoteHomeManager(args[0], args[1], args[2]);
            manager.joinCommThread();            
        } else if (args.length == 4) {
            RemoteHomeManager manager = new RemoteHomeManager(args[0], args[1], args[2]);
            WebServer webServer = new WebServer(args[3], manager);
            webServer.start();
            manager.joinCommThread();            
        }
    }    
}
