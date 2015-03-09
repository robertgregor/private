package org.remoteHome;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.net.httpserver.HttpExchange;
import java.io.OutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * This is the implementation class for all hardware devices. All the devices should extend this class.
 * 
 * @author Robert Gregor
 */
public abstract class AbstractDevice implements Serializable, Comparable<AbstractDevice> {
    
    /**
     * This device type is simple switch
     */
    public static int SimpleSwitch = 1;
    
    /**
     * This device type is simple switch
     */
    public static int TemperatureSensor = 2;

    /**
     * This device type is blinds controller
     */
    public static int BlindsController = 3;

    /**
     * This device type is thermostat, connected to power line
     */
    public static int Thermostat = 4;
  
    /**
     * This device type is battery Pir sensor device
     */
    public static int PirSensor = 5;
   
    /**
     * This device type is battery magnetic sensor device
     */
    public static int MagneticSensor = 6;
    /**
     * This device type is light sensor device
     */
    public static int LightSensor = 7;
    /**
     * This device type is accelerometer sensor, which measure movements
     */
    public static int AccelerometerSensor = 8;
    /**
     * This device type is the artifical java device. You can define its functionality via the java code
     */
    public static int Java = 9;
    /**
     * This device type is the Temperature humidity device based on the AM2302 sensor.
     */
    public static int TemperatureHumiditySensorDevice = 10;
    /**
     * This device type is the CO2 sensor based on the MG811 sensor.
     */
    public static int CO2SensorDevice = 11;
    /**
     * This device type is the ventilator / recuperation unit controller device.
     */
    public static int VentilatorController = 12;
    /**
     * This is subdevice number e.g. for 8 relay board switch it is 1..8
     */
    private String subDeviceNumber = "1";

    /**
     * This is device id known in the api. Please note, that if this is multiple device,
     * the value should be realDeviceId*1000 + sub device id, if it is single device, then this is real device id.
     */
    private int deviceId = 0;    

    /**
     * This is real device id of the hardware device assigned with AT+n=id command
     */
    private int realDeviceId = 0;    

    /**
     * This is real device ip address - only in case of network device.
     */
    private String deviceIPaddress = "";    

    /**
     * This is device name of the hardware device. Free text
     */
    private String deviceName = "";

    /**
     * This is the current device battery voltage
     */
    private float battery;
    /**
     * If true, the email reporting of low battery or power lost event is enabled.
     */
    private boolean enableLowBattOrPowerLostReporting = false;
    /**
     * If true, the email reported about low battery has been already sent.
     */
    private boolean lowBatteryReported = false;

    /**
     * This is reference to the RemoteHomeManager
     */
    protected transient RemoteHomeManager m;
    
    private String roomName = "";
    /**
     * This is timestamp, when the values has been last updated
     */
    protected transient long timestamp = 0;

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
    */
    protected abstract void manageAsynchronousCommand(String[] items);

  /**
    * This method is called by the NetworkDevice service. It is called, when the new GET request is received by the device
    * @param o the outputStream. This has to be send back to the device.
    * @param t the HttpExchange object, used for the device request.
    * @param requestParameters is the hasmap of the GET parameters
    * 
    */
    protected abstract void manageAsynchronousCommand(OutputStream o, HttpExchange t, HashMap<String, String> requestParameters);
    
  /**
    * This method will update the device 
    */
    public abstract void updateDevice() throws RemoteHomeConnectionException, RemoteHomeManagerException;
    
    @Override
    public int hashCode() {
        return getDeviceId()%10;
    }
    @Override
    public boolean equals(Object o) {
        if (!(o instanceof AbstractDevice)) return false;
        return ((AbstractDevice)o).deviceId == deviceId;
    }
    
    public int compareTo(AbstractDevice device) {
        return getDeviceName().compareTo(device.getDeviceName());
    }
    public static String generateJsonData(Object o) {
        try {
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(o);
        } catch (JsonProcessingException e) {
            RemoteHomeManager.log.error(124, e);
            return "";
        }
        //Gson gson = new Gson();
        //return gson.toJson(o);
    }
    
    /**
     * This is timestamp, when the values has been last updated
     * @return the timestamp
     */
    public long getTimestamp() {
        return timestamp;
    }

    /**
     * This is timestamp, when the values has been last updated
     * @param timestamp the timestamp to set
     */
    public void setTimestamp(long timestamp) {
        this.timestamp = timestamp;
    }
        /**
     * @return the subDeviceNumber
     */
    public String getSubDeviceNumber() {
        return subDeviceNumber;
    }

    /**
     * @param subDeviceNumber the subDeviceNumber to set
     */
    public void setSubDeviceNumber(String subDeviceNumber) {
        this.subDeviceNumber = subDeviceNumber;
    }

    /**
     * @return the roomName
     */
    public String getRoomName() {
        return roomName;
    }

    /**
     * @param roomName the roomName to set
     */
    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }
  
    protected int parseDeviceIdForMultipleDevice(int deviceId) {
        if (deviceId < 256) {            
            return deviceId;
        } else {
            subDeviceNumber = Integer.toString(deviceId % 1000);
            return deviceId / 1000;
        }
    }
    /*
     * This method is called first time, when the device is either created or loaded from the persistent class. Be carefull, when loaded from persistance class,
     * constructor is not called.
    */
    protected abstract void init();
    /*
     * This method is called each second. Do not put inside blocking operations
    */
    protected abstract void runEachSecond();
    
    /*
     * This method is called each minute. Do not put inside blocking operations
    */
    protected abstract void runEachMinute();

    /*
     * This method is called each 10 minutes. Do not put inside blocking operations
    */
    protected abstract void runEach10Minutes();

    /*
     * This method is called each hour. Do not put inside blocking operations
    */
    protected abstract void runEachHour();

    /*
     * This method is called each day. Do not put inside blocking operations
    */
    protected abstract void runEachDay();

    /*
     * This method will return true, if the device data are older then defined
     * @param minute is the defined period, after which the device has been updated
     * @return true, if the timestamp + minute < current system date, otherwise return false
     */
    public boolean updatedBefore (int minute) {
        long currentTimestamp = System.currentTimeMillis();
        if ((timestamp + minute*60000) < currentTimestamp) return true;
        return false;
    }
    
    protected HashMap getFieldValues() {
        HashMap h = new HashMap();
        h.put("deviceId", deviceId);
        h.put("realDeviceId", realDeviceId);
        h.put("deviceIPaddress", deviceIPaddress);
        h.put("subDeviceNumber", subDeviceNumber);
        h.put("deviceName", deviceName);
        h.put("roomName", roomName);
        h.put("battery", battery);
        h.put("enableLowBattOrPowerLostReporting", enableLowBattOrPowerLostReporting);
        h.put("lowBatteryReported", lowBatteryReported);
        h.put("timestamp", timestamp);
        return h;
    }

    /**
     * @return the realDeviceId
     */
    public int getRealDeviceId() {
        return realDeviceId;
    }

    /**
     * @param realDeviceId the realDeviceId to set
     */
    public void setRealDeviceId(int realDeviceId) {
        this.realDeviceId = realDeviceId;
    }
    
    /**
     * If you will use your own implementation of the history data presentation just return here the empty ArrayList()
     * The purpose of this method is to prepare the list of java objects, ready for tranformation to e.g. xml or json. These java objects can be instanced from the inner class of
     * the device e.g.
     * @param historyData is the array of the history data read e.g. from the DB
     * @param type is the history data type - i.e. if the device should store more independent values - like humidity and temperature e.g.
     * @return the Array list with the java objects, ready for the transformation
     */
    public abstract ArrayList generateChartItems(HistoryData[] historyData, String type);
    
    /**
     * This method should return the limit of the low battery. If the battery value received is lower, the API will send notification email - if set and configured.
     * @return the low battery limit e.g. 2.8
     */
    public abstract float getLowBatteryLimit();

    /**
     * @return the enableLowBattOrPowerLostReporting
     */
    public boolean isEnableLowBattOrPowerLostReporting() {
        return enableLowBattOrPowerLostReporting;
    }

    /**
     * @param enableLowBattOrPowerLostReporting the enableLowBattOrPowerLostReporting to set
     */
    public void setEnableLowBattOrPowerLostReporting(boolean enableLowBattOrPowerLostReporting) {
        this.enableLowBattOrPowerLostReporting = enableLowBattOrPowerLostReporting;
    }

    /**
     * @return the battery
     */
    public float getBattery() {
        return battery;
    }

    /**
     * @param battery the battery to set
     */
    protected void setBattery(float battery) {
        this.battery = battery;
    }

    /**
     * @return the lowBatteryReported
     */
    protected boolean isLowBatteryReported() {
        return lowBatteryReported;
    }

    /**
     * @param lowBatteryReported the lowBatteryReported to set
     */
    protected void setLowBatteryReported(boolean lowBatteryReported) {
        this.lowBatteryReported = lowBatteryReported;
    }

    /**
     * @return the deviceIPaddress
     */
    public String getDeviceIPaddress() {
        return deviceIPaddress;
    }

    /**
     * @param deviceIPaddress the deviceIPaddress to set
     */
    public void setDeviceIPaddress(String deviceIPaddress) {
        this.deviceIPaddress = deviceIPaddress;
    }
    public boolean isNetworkDevice() {
        if (deviceIPaddress == null) return false;
        return !(deviceIPaddress.equals(""));
    }
}
