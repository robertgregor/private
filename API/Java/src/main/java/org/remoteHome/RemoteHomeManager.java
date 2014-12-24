package org.remoteHome;

import java.util.Calendar;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import org.remoteHome.util.Logfile;

/**
 *
 * This is the main starting point of the remote-home API. To be able to use it,
 * you have to plug the USB communicator or Raspberry shield.<BR/>
 * Then install ser2net. Configure it and start it.<BR/><BR/>
 *
 * Quick howto for raspberry:<BR/>
 * <ul>
 * <li>Edit /boot/cmdline.txt<BR/>From: dwc_otg.lpm_enable=0 rpitestmode=1
 * console=ttyAMA0,115200 kgdboc=ttyAMA0,115200 console=tty1 root=/dev/mmcblk0p2
 * rootfstype=ext4 rootwait<br/>
 * to:dwc_otg.lpm_enable=0 rpitestmode=1 console=tty1 root=/dev/mmcblk0p2
 * rootfstype=ext4 rootwait</li>
 * <li>Edit /etc/innitab<br/>comment out:&nbsp;2:23:respawn:/sbin/getty -L
 * ttyAMA0 115200 vt100</li>
 * <li>Install ser2net:<br/>&nbsp;&nbsp;Archlinux: pacman -S
 * ser2net<br/>&nbsp;&nbsp;Raspbian/Debian: sudo apt-get install ser2net</li>
 * <li>Edit config file: vi /etc/ser2net.conf and add the
 * following:<br/>2000:raw:0:/dev/ttyAMA0:9600 8DATABITS NONE
 * 1STOPBIT<br/>2001:telnet:0:/dev/ttyAMA0:9600 8DATABITS NONE 1STOPBIT</li>
 * <li>Restart ser2net: cd /etc/rc.d&nbsp;./ser2net restart</li>
 * </ul>
 * <br/>
 * <br/>
 * Quick howto for LINUX<BR/>
 * <ul>
 * <li>Install ser2net:<br/>&nbsp;&nbsp;Archlinux: pacman -S
 * ser2net<br/>&nbsp;&nbsp;Debian: sudo apt-get install ser2net</li>
 * <li>Edit config file: vi /etc/ser2net.conf and add the
 * following:<br/>2000:raw:0:/dev/ttyUSB0:9600 8DATABITS NONE
 * 1STOPBIT<br/>2001:telnet:0:/dev/ttyUSB0:9600 8DATABITS NONE 1STOPBIT</li>
 * <li>Restart ser2net: cd /etc/rc.d&nbsp;./ser2net restart</li>
 * </ul>
 * <br/>
 * <br/>
 * Quick howto for WINDOWS<BR/>
 * <ul>
 * <li>Install some COM port redirector. HW VSP3 is recomended.
 * http://www.hw-group.com/products/hw_vsp/index_en.html</li>
 * <li>Configure it in the mode RS232 -> TCP socket. The RS232 should be
 * configured as 9600 Bd 8N1 (8 bytes no parity, one stop bit, no
 * flowcontrol.</li>
 * <li>Start</li>
 * </ul>
 * <br/>
 * <br/>
 *
 * @author Robert Gregor
 *
 * This is the main class of the API.
 */
public class RemoteHomeManager extends Thread {

    private HashMap<Integer, AbstractDevice> devices = new HashMap<Integer, AbstractDevice>();
    private HashMap<String, AbstractSchedule> schedulers = new HashMap<String, AbstractSchedule>();
    private HashMap<String, SketchData> sketches = new HashMap<String, SketchData>();
    private RemoteHomeCommunicator comm;
    private ApiPersistance persistance = null;
    public static Logfile log = new Logfile();
    private DeviceChangeListener deviceChangeListener = null;

    /**
     *
     * @param host hostname or IP address of the machine, to which is the
     * communicator connected.
     * @param port the TCP port, on which the ser2net or comport redirector is
     * listening. (e.g. 2000)
     * @throws RemoteHomeConnectionException if there is a problem with the
     * connection
     */
    public RemoteHomeManager(String host, String port) throws RemoteHomeConnectionException {
        comm = new RemoteHomeCommunicator(host, port, this);
        this.start();
    }

    /**
     *
     * @param host hostname or IP address of the machine, to which is the
     * communicator connected.
     * @param port the TCP port, on which the ser2net or comport redirector is
     * listening. (e.g. 2000)
     * @param file the file to save the configuration and current status of the
     * system. The ApiPersistance is implemented using db4o
     * @throws RemoteHomeConnectionException if there is a problem with the
     * connection
     */
    public RemoteHomeManager(String host, String port, String file) throws RemoteHomeConnectionException, RemoteHomeManagerException {
        this(host, port);
        try {
            persistance = new Db4oPersistance();
            persistance.open(file);
            loadPersistentData();
        } catch (Exception e) {
            throw new RemoteHomeManagerException(e.getMessage(), RemoteHomeManagerException.SERIALIZATION_ERROR);
        }
    }

    /**
     *
     * @param host hostname or IP address of the machine, to which is the
     * communicator connected.
     * @param port the TCP port, on which the ser2net or comport redirector is
     * listening. (e.g. 2000)
     * @param persistance the persistance class, which implements the interface
     * to persist the data about devices
     * @param persistanceOpenParams are the parameters to use in the open method
     * (e.g. DB connection parameters...)
     * @throws RemoteHomeConnectionException if there is a problem with the
     * connection
     */
    public RemoteHomeManager(String host, String port, ApiPersistance persistance, String[] persistanceOpenParams) throws RemoteHomeConnectionException, RemoteHomeManagerException {
        this(host, port);
        try {
            this.persistance = persistance;
            persistance.open(persistanceOpenParams);
            loadPersistentData();
        } catch (Exception e) {
            throw new RemoteHomeManagerException(e.getMessage(), RemoteHomeManagerException.SERIALIZATION_ERROR);
        }
    }

    /**
     * This method should be called after instantiation to shutdown properly the
     * API - e.g. to close the serial port or to close the persistence.
     */
    public void addShutdownHook() {
        Runtime.getRuntime().addShutdownHook(new Thread(new Runnable() {
            @Override
            public void run() {
                comm.disconnect();
                try {
                    System.out.println("Shutdown in progress...");
                    if (getPersistance() != null) {
                        getPersistance().saveDevices(devices);
                        getPersistance().close();
                        System.out.println("Persistance closed...");
                    }
                } catch (Exception exc) {
                    exc.printStackTrace();
                }
            }
        }
        ));
    }

    /**
     * This method creates the device inside the API. API is using it to e.g.
     * update the device, when the status arrives. For multiple devices, use the
     * method createRemoteHomeMultipleDevice. Please note that you have to also
     * configure with this ID the hardware and<BR/>
     * also configure correct username and password. You can do it with the
     * addDevice(int deviceId) method.<br/><br/>
     *
     * @param deviceId the device Id, of the device, which was configured during
     * the initial setup.
     * @param deviceName Device name is free text to describe the device and
     * e.g. the location of the device
     * @param deviceType could
     * be:<br/>AbstractDevice.HeatingHeader<br/>AbstractDevice.SimpleSwitch<br/>AbstractDevice.TemperatureSensor<br/>
     * AbstractDevice.LightAlarmDevice<br/>AbstractDevice.BlindsControllerDevice<br/>AbstractDevice.Thermostat<br/>AbstractDevice.BatteryThermostat
     * @return the device reference
     * @throws RemoteHomeManagerException if the type of the device is unknown.
     */
    public AbstractDevice createRemoteHomeDevice(int deviceId, String deviceName, int deviceType) throws RemoteHomeManagerException {
        if (deviceType == AbstractDevice.PirSensor) {
            PirSensorDevice device = new PirSensorDevice(this, deviceId, deviceName);
            devices.put(deviceId, device);
            device.setRealDeviceId(deviceId);
            return device;
        } else if (deviceType == AbstractDevice.MagneticSensor) {
            MagneticSensorDevice device = new MagneticSensorDevice(this, deviceId, deviceName);
            devices.put(deviceId, device);
            device.setRealDeviceId(deviceId);
            return device;
        } else if (deviceType == AbstractDevice.SimpleSwitch) {
            SimpleSwitchDevice device = new SimpleSwitchDevice(this, deviceId, deviceName);
            devices.put(deviceId, device);
            device.setRealDeviceId(deviceId);
            return device;
        } else if (deviceType == AbstractDevice.TemperatureSensor) {
            TemperatureSensorDevice device = new TemperatureSensorDevice(this, deviceId, deviceName);
            devices.put(deviceId, device);
            device.setRealDeviceId(deviceId);
            return device;
        } else if (deviceType == AbstractDevice.TemperatureHumiditySensorDevice) {
            TemperatureHumiditySensorDevice device = new TemperatureHumiditySensorDevice(this, deviceId, deviceName);
            devices.put(deviceId, device);
            device.setRealDeviceId(deviceId);
            return device;
        } else if (deviceType == AbstractDevice.CO2SensorDevice) {
            CO2SensorDevice device = new CO2SensorDevice(this, deviceId, deviceName);
            devices.put(deviceId, device);
            device.setRealDeviceId(deviceId);
            return device;
        } else if (deviceType == AbstractDevice.LightSensor) {
            LightSensorDevice device = new LightSensorDevice(this, deviceId, deviceName);
            devices.put(deviceId, device);
            device.setRealDeviceId(deviceId);
            return device;
        } else if (deviceType == AbstractDevice.AccelerometerSensor) {
            AccelerometerSensorDevice device = new AccelerometerSensorDevice(this, deviceId, deviceName);
            devices.put(deviceId, device);
            device.setRealDeviceId(deviceId);
            return device;
        } else if (deviceType == AbstractDevice.Java) {
            JavaDevice device = new JavaDevice(this, deviceId, deviceName);
            devices.put(deviceId, device);
            device.setRealDeviceId(deviceId);
            return device;
        } else if (deviceType == AbstractDevice.BlindsController) {
            MotorControllerDevice device = new MotorControllerDevice(this, deviceId, deviceName);
            devices.put(deviceId, device);
            device.setRealDeviceId(deviceId);
            return device;
        } else if (deviceType == AbstractDevice.VentilatorController) {
            VentilatorControllerDevice device = new VentilatorControllerDevice(this, deviceId, deviceName);
            devices.put(deviceId, device);
            device.setRealDeviceId(deviceId);
            return device;
        } else if (deviceType == AbstractDevice.Thermostat) {
            ThermostatDevice device = new ThermostatDevice(this, deviceId, deviceName);
            devices.put(deviceId, device);
            device.setRealDeviceId(deviceId);
            return device;
        } else {
            throw new RemoteHomeManagerException(RemoteHomeManagerException.UNKNOWN_DEVICE);
        }
    }

    /**
     * This method creates the sub device inside the API. E.g. the 8 relay board
     * has 8 sub devices SimpleSwitch. So you have to create 8 SimpleSwitch sub
     * devices with this method with the deviceId always the same (It is real
     * deviceId used with the AT+n command) and subDeviceId in range 1..8.
     * <br/><br/>
     *
     * @param deviceId the device Id, of the device, which was configured during
     * the initial setup.
     * @param subDeviceId is the subdeviceId, e.g. for 2 switch board it is
     * 1..2, for 6 switch board 1..6, for 3 blinds board 1..3
     * @param deviceName Device name is free text to describe the device and
     * e.g. the location of the device
     * @param deviceType could
     * be:<br/>AbstractDevice.HeatingHeader<br/>AbstractDevice.SimpleSwitch<br/>AbstractDevice.TemperatureSensor<br/>
     * AbstractDevice.LightAlarmDevice<br/>AbstractDevice.BlindsControllerDevice<br/>AbstractDevice.Thermostat<br/>AbstractDevice.BatteryThermostat
     * @return the device reference
     * @throws RemoteHomeManagerException if the type of the device is unknown.
     */
    public AbstractDevice createRemoteHomeMultipleDevice(int deviceId, int subDeviceId, String deviceName, int deviceType) throws RemoteHomeManagerException {
        int apiDeviceId = (deviceId * 1000) + subDeviceId;
        AbstractDevice device = createRemoteHomeDevice(apiDeviceId, deviceName, deviceType);
        device.setSubDeviceNumber(Integer.toString(subDeviceId));
        device.setRealDeviceId(deviceId);
        return device;
    }

    /**
     *
     * @param deviceId the device Id, of the device, which was configured during
     * the initial setup.
     * @return the device reference
     * @throws RemoteHomeManagerException if the id of the device is unknown.
     */
    public AbstractDevice getDevice(int deviceId) throws RemoteHomeManagerException {
        AbstractDevice dev = devices.get(deviceId);
        if (dev != null) {
            return dev;
        } else {
            throw new RemoteHomeManagerException(RemoteHomeManagerException.UNKNOWN_DEVICE);
        }
    }

    /**
     *
     * @param deviceId the device Id, of the device, which was configured during
     * the initial setup.
     * @param subdeviceId the sub device Id, of the device, which was configured
     * during the initial setup.
     * @return the device reference
     * @throws RemoteHomeManagerException if the id of the device is unknown.
     */
    public AbstractDevice getDevice(int deviceId, int subdeviceId) throws RemoteHomeManagerException {
        return getDevice(deviceId * 1000 + subdeviceId);
    }

    /**
     *
     * @return the devices
     */
    public Collection<AbstractDevice> getDevices() {
        return devices.values();
    }

    /**
     * Delete Device
     *
     * @return void
     */
    public void removeDevice(int deviceId) {
        if (devices.containsKey(deviceId)) {
            devices.remove(deviceId);
        }
    }

    /**
     * Disconnect connection with transceiver
     *
     * @return void
     */
    public void disconnectTransceiver() {
        comm.disconnect();
    }

    /**
     * Establish connection with transceiver
     *
     * @return void
     */
    public void connectTransceiver() throws RemoteHomeConnectionException {
        comm.connect();
    }

    /**
     * This method is called by the communicator, when the asynchronous command
     * is received. It will parse the device Id and call the device object
     * manageAsynchronousCommand method. If unknown data are received, just
     * ignore it.
     */
    protected void manageAsynchronousCommand(String data) {
        String tokens[] = data.split(" ", 2);
        //device Id, skip + sign
        Integer deviceId = Integer.parseInt(tokens[0].substring(1));
        RemoteHomeManager.log.debug("Received asynchronous command for device Id: " + deviceId);
        if (tokens[1].equals("LP")) {
            //OK, this is power lost message distribute it to all devices and or subdevices
            AbstractDevice targetDevice = devices.get(deviceId);
            if (targetDevice != null) {
                processPowerLost(targetDevice);
                targetDevice.manageAsynchronousCommand(new String[]{"LP"});
            } else {
                for (AbstractDevice td : devices.values()) {
                    if ((td.getDeviceId() > 1000) && ((td.getDeviceId() / 1000) == deviceId)) {
                        processPowerLost(td);
                        td.manageAsynchronousCommand(new String[]{"LP"});
                    }
                }
            }
            return;
        }
        AbstractDevice targetDevice = devices.get(deviceId);
        if (targetDevice != null) {
            RemoteHomeManager.log.debug("Command send to the device class: " + tokens[1]);
            targetDevice.manageAsynchronousCommand(tokens[1].split("\\|"));
        } else {
            //OK, the device could be multiple device asynchronous command.
            try {
                int subDeviceId = Integer.parseInt(tokens[1].split("\\|")[1]);
                int deviceIdCandidate = (deviceId * 1000) + subDeviceId;
                targetDevice = devices.get(deviceIdCandidate);
                RemoteHomeManager.log.debug("Command send to the multiple device class with Id: " + deviceIdCandidate + ". Command:" + tokens[1]);
                targetDevice.manageAsynchronousCommand(tokens[1].split("\\|"));
            } catch (Exception e) {
                //crap received, forget it and don't do anything.
            }
        }
    }

    /**
     * This method should be called in the Device class, in case of change of
     * the device.
     *
     * @param changedDevice is the device, which is changed. It will parse the
     * device Id and call the device object manageAsynchronousCommand method. If
     * unknown data are received, just ignore it.
     */
    protected void notifyDeviceChange(AbstractDevice changedDevice) {
        final AbstractDevice finalTargetDevice = changedDevice;
        for (final SketchData d : getSketches().values()) {
            new Thread(new Runnable() {
                public void run() {
                    RemoteHomeManager.log.debug("Notify device change. Sketch: " + d.getSketchName());
                    try {
                        d.getSketchInstance().manageDeviceChange(finalTargetDevice);
                        RemoteHomeManager.log.debug("Notify device change called, no exception raised. Sketch: " + d.getSketchName());
                    } catch (Exception e) {
                        RemoteHomeManager.log.error(4123, e);
                    }                        
                }
            }).start();
        }
        //notify deviceChangeListener
        if (deviceChangeListener != null) {
            RemoteHomeManager.log.debug("Notify device change listener. Class name: " + deviceChangeListener.getClass().getName());            
            new Thread(new Runnable() {
                public void run() {
                    try {
                        deviceChangeListener.deviceChanged(finalTargetDevice);
                        RemoteHomeManager.log.debug("Device change listener called. No exception raised. Class name: " + deviceChangeListener.getClass().getName());
                    } catch (Exception e) {
                        RemoteHomeManager.log.error(4124, e);
                    }
                }
            }).start();
        }
    }

    /**
     * Get devices in the room
     *
     * @param name is the name of the room
     * @return HashSet of the room objects
     */
    public HashSet<AbstractDevice> getDevicesInRoom(String name) {
        HashSet<AbstractDevice> h = new HashSet<AbstractDevice>();
        Iterator devs = devices.values().iterator();
        while (devs.hasNext()) {
            AbstractDevice d = (AbstractDevice) devs.next();
            if (d.getRoomName().equals(name)) {
                h.add(d);
            }
        }
        return h;
    }

    /**
     * Get rooms
     *
     * @return list of the rooms
     */
    public HashMap<String, HashSet<AbstractDevice>> getRooms() {
        HashSet<String> rooms = new HashSet<String>();
        Iterator devs = devices.values().iterator();
        while (devs.hasNext()) {
            AbstractDevice d = (AbstractDevice) devs.next();
            rooms.add(d.getRoomName());
        }
        HashMap<String, HashSet<AbstractDevice>> h = new HashMap<String, HashSet<AbstractDevice>>();
        for (String room : rooms) {
            h.put(room, getDevicesInRoom(room));
        }
        return h;
    }

    /**
     * @return the schedulers
     */
    public HashMap<String, AbstractSchedule> getSchedulers() {
        return schedulers;
    }

    /**
     * @param schedulers the schedulers to set
     */
    public void setSchedulers(HashMap<String, AbstractSchedule> schedulers) {
        this.schedulers = schedulers;
    }

    /**
     * Sends the command to the device.
     *
     * @param deviceId is the device Id to which the command should be sent
     * @param command is the command
     * @throws RemoteHomeConnectionException if there is an error with the
     * communication.
     */
    public void sendCommand(int deviceId, String command) throws RemoteHomeConnectionException {
        try {
            comm.sendCommand(deviceId, command);
        } catch (RemoteHomeConnectionException e) {
            //try again reconnect has been done
            comm.sendCommand(deviceId, command);
        }
    }

    /**
     * Sends the command and waits for the answer from the device.
     *
     * @param deviceId is the device Id to which the command should be sent
     * @param command is the command
     * @return the answer from the device
     * @throws RemoteHomeConnectionException if there is an error with the
     * communication.
     */
    public String sendCommandWithAnswer(int deviceId, String command) throws RemoteHomeConnectionException {
        try {
            return comm.sendCommandWithAnswer(deviceId, command);
        } catch (RemoteHomeConnectionException e) {
            //try again reconnect has been done
            return comm.sendCommandWithAnswer(deviceId, command);
        }
    }

    /**
     * Sends the commands to add the device.
     *
     * @param deviceId is the new device Id which the device will hold. Please
     * note, that this Id should not exist in the system.
     * @throws RemoteHomeConnectionException if there is an error with the
     * communication.
     */
    public void addDevice(int deviceId) throws RemoteHomeConnectionException {
        comm.addDevice(deviceId);
    }

    /**
     * Program device using STK500v1 protocol. Works only with arduino optiboot
     * bootloader.
     *
     * @param hexDataToLoad is the byte array representing the hex file to load
     * @throws RemoteHomeConnectionException if there is an error with the
     * programming.
     */
    public void programDevice(byte[] hexDataToLoad) throws RemoteHomeConnectionException {
        comm.programDevice(hexDataToLoad);
    }

    /**
     * Return the progress of the programming
     */
    public String getProgrammingDeviceProgress() {
        return comm.getProgramDeviceProgress();
    }

    
    /*
     * This method will load the configuration from the file
     */
    private void loadPersistentData() throws Exception {
        if (getPersistance() != null) {
            devices = getPersistance().loadDevices();
            schedulers = getPersistance().loadSchedulers();
            setSketches(getPersistance().loadSketchesData());
            for (AbstractDevice dev : devices.values()) {
                dev.m = this;
                dev.init();
            }
            for (SketchData sketch : getSketches().values()) {
                sketch.compileSketch();
                sketch.getSketchInstance().setRemoteHomeManager(this);
                sketch.getSketchInstance().init();
            }
            Properties p = getPersistance().loadProperties();
            if (p.useTextLogging) {
                try {
                    log.startLoggingToFile(p.logFileName);
                    log.setLogLevel(p.logLevel);
                } catch (Exception e) {
                    log.error(1, e);
                }
            }
        }        
    }

    /**
     * @return the persistance object
     */
    public ApiPersistance getPersistance() throws RemoteHomeManagerException {
        if (persistance == null) {
            throw new RemoteHomeManagerException(RemoteHomeManagerException.PERSISTANCE_NOT_INITIALIZED);
        }
        return persistance;
    }

    /*
     * This method will return unused device id.
     */
    public int getUnusedDeviceId() {
        Set<Integer> deviceIds = devices.keySet();
        if (deviceIds.isEmpty()) {
            return 1;
        }
        for (int id : deviceIds) {
            if (!deviceIds.contains(Integer.valueOf(id + 1))) {
                if ((id + 1) < 256) {
                    return id + 1;
                }
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

    /**
     * @return the sketches object
     */
    public HashMap<String, SketchData> getSketches() {
        return sketches;
    }

    /**
     * @param sketches the sketches to set
     */
    public void setSketches(HashMap<String, SketchData> sketches) {
        this.sketches = sketches;
    }

    /*
     * Thread run method to manage device time methods
     */
    public void run() {
        int last10Minute = -1;
        int lastHour = -1;
        int lastDay = -1;
        while (true) {
            try {
                Thread.sleep(1000);
                for (AbstractDevice dev : devices.values()) {
                    try {
                        dev.runEachSecond();
                    } catch (Throwable e) {
                        log.error(1, e);
                    }
                }
                for (SketchData sketch : getSketches().values()) {
                    try {
                        sketch.getSketchInstance().runEachSecond();
                    } catch (Throwable e) {
                        log.error(2, e);
                    }
                }
                Calendar c = Calendar.getInstance();
                int sec = c.get(Calendar.SECOND);
                if (sec == 0) {
                    for (AbstractDevice dev : devices.values()) {
                        try {
                            dev.runEachMinute();
                        } catch (Throwable e) {
                            log.error(3, e);
                        }
                    }
                    for (SketchData sketch : getSketches().values()) {
                        try {
                            sketch.getSketchInstance().runEachMinute();
                        } catch (Throwable e) {
                            log.error(4, e);
                        }
                    }
                }
                int min = c.get(Calendar.MINUTE);
                if ((((min % 10) == 0) || (min == 0)) && (last10Minute != min)) {
                    last10Minute = min;
                    for (AbstractDevice dev : devices.values()) {
                        try {
                            dev.runEach10Minutes();
                        } catch (Throwable e) {
                            log.error(5, e);
                        }
                    }
                    for (SketchData sketch : getSketches().values()) {
                        try {
                            sketch.getSketchInstance().runEach10Minutes();
                        } catch (Throwable e) {
                            log.error(6, e);
                        }
                    }
                }
                int hour = c.get(Calendar.HOUR);
                if ((min == 0) && (lastHour != hour)) {
                    lastHour = hour;
                    for (AbstractDevice dev : devices.values()) {
                        checkAndProcessLowBattery(dev);
                        try {
                            dev.runEachHour();
                        } catch (Throwable e) {
                            log.error(7, e);
                        }
                    }
                    for (SketchData sketch : getSketches().values()) {
                        try {
                            sketch.getSketchInstance().runEachHour();
                        } catch (Throwable e) {
                            log.error(8, e);
                        }
                    }
                }
                int day = c.get(Calendar.DAY_OF_WEEK);
                if ((hour == 0) && (lastDay != day)) {
                    lastDay = day;
                    for (AbstractDevice dev : devices.values()) {
                        try {
                            dev.runEachDay();
                        } catch (Throwable e) {
                            log.error(9, e);
                        }
                    }
                    for (SketchData sketch : getSketches().values()) {
                        try {
                            sketch.getSketchInstance().runEachDay();
                        } catch (Throwable e) {
                            log.error(10, e);
                        }
                    }
                }
            } catch (InterruptedException e) {
                return;
            }
        }
    }

    private void processPowerLost(AbstractDevice dev) {
        if (dev.isEnableLowBattOrPowerLostReporting()) {
            //OK, report low battery and set already reported to true
            try {
                Properties p = getPersistance().loadProperties();
                if (p != null) {
                    new Mailer().sendEmail(new Mail(p.notificationMessageTo, p.notificationMessageSubject, p.powerLostMessage
                            .replaceAll("\\{deviceId\\}", Integer.toString(dev.getDeviceId()))
                            .replaceAll("\\{deviceName\\}", dev.getDeviceName())
                            .replaceAll("\\{deviceRoom\\}", dev.getRoomName())), p);
                    RemoteHomeManager.log.info("Email sent, because power lost message received. Device: " + toString());
                } else {
                    RemoteHomeManager.log.warning("Cannot send email, the properties file is empty. Device: " + toString());
                }
            } catch (Exception e) {
                RemoteHomeManager.log.error(1024, e);
            }
        }
    }

    private void checkAndProcessLowBattery(AbstractDevice dev) {
        if (dev.getBattery() < dev.getLowBatteryLimit()) {
            if (dev.isEnableLowBattOrPowerLostReporting()) {
                if (!dev.isLowBatteryReported()) {
                    //OK, report low battery and set already reported to true
                    try {
                        Properties p = getPersistance().loadProperties();
                        if (p != null) {
                            new Mailer().sendEmail(new Mail(p.notificationMessageTo, p.notificationMessageSubject, p.lowBatteryMessage
                                    .replaceAll("\\{deviceId\\}", Integer.toString(dev.getDeviceId()))
                                    .replaceAll("\\{deviceName\\}", dev.getDeviceName())
                                    .replaceAll("\\{deviceRoom\\}", dev.getRoomName())
                                    .replaceAll("\\{voltage\\}", Float.toString(dev.getBattery()))), p);
                            RemoteHomeManager.log.info("Email sent, because low battery occured. Device: " + toString());
                        } else {
                            RemoteHomeManager.log.warning("Cannot send email, the properties file is empty. Device: " + toString());
                        }
                    } catch (Exception e) {
                        RemoteHomeManager.log.error(1024, e);
                    }
                }
            }
        } else {
            dev.setLowBatteryReported(false);
        }
    }

    public static void main(String... args) {
        if ((args.length < 2) && (args.length > 4)) {
            System.out.println("2 parametrs: host, port\n3 parameters: host, port, file\n4 parameters: host, port, file, webServerPort\n");
            return;
        }
        RemoteHomeManager m = null;
        try {
            if (args.length == 2) {
                m = new RemoteHomeManager(args[0], args[1]);
            } else if (args.length == 3) {
                m = new RemoteHomeManager(args[0], args[1], args[2]);
            } else if (args.length == 4) {
                m = new RemoteHomeManager(args[0], args[1], args[2]);
                org.remoteHome.gui.WebServer webServer = new org.remoteHome.gui.WebServer(args[3], m);
                webServer.startServer();
            }
            if (m != null) {
                m.addShutdownHook();
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        }
    }

    /**
     * @return the deviceChangeListener
     */
    public DeviceChangeListener getDeviceChangeListener() {
        return deviceChangeListener;
    }

    /**
     * @param deviceChangeListener the deviceChangeListener to set
     */
    public void setDeviceChangeListener(DeviceChangeListener deviceChangeListener) {
        this.deviceChangeListener = deviceChangeListener;
    }
}
