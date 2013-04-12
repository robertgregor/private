package org.remoteHome;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

/**
 * This is the implementation class for all hardware devices. All the devices should extend this class.
 * 
 * @author Robert Gregor
 */
public abstract class AbstractDevice implements Serializable, Comparable<AbstractDevice> {
    
    /**
     * This device type is heating header.
     */
    public static int HeatingHeader = 4;

    /**
     * This device type is simple switch
     */
    public static int SimpleSwitch = 3;
    
    /**
     * This device type is simple switch
     */
    public static int TemperatureSensor = 2;

    /**
     * This device type is simple switch
     */
    public static int LightAlarmDevice = 1;

    /**
     * This device type is blinds controller
     */
    public static int BlindsControllerDevice = 5;

    /**
     * This device type is thermostat, connected to power line
     */
    public static int Thermostat = 6;
    
    /**
     * This device type is battery thermostat, connected to power line
     */
    public static int BatteryThermostat = 7;
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
    protected transient RemoteHomeManager m;
    
    /**
     * This is timestamp, when the values has been last updated
     */
    private long timestamp = 0;
    
    
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
    * @author Robert Gregor
    */
    protected abstract void manageAsynchronousCommand(String[] items);
    
  /**
    * 
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
        StringBuilder sb = new StringBuilder();
        sb.append("{\n");
        ArrayList<Field> fields = new <Field>ArrayList();
        fields.addAll(Arrays.asList(o.getClass().getDeclaredFields()));
        fields.addAll(Arrays.asList(o.getClass().getSuperclass().getDeclaredFields()));
        for (Field field : fields) {
          if (field == null) continue;
          if (field.getName() == null) continue;          
          boolean tempAccessible = field.isAccessible();
          field.setAccessible(true);
          try {
            if (sb.length() > 3) sb.append(" , \n");
            if (field.get(o) == null) {
                sb.append("\""+field.getName()+"\" : null");
                continue;
            }
            if (field.getType().isAssignableFrom(Integer.TYPE) || 
                    field.getType().isAssignableFrom(Byte.TYPE) || 
                    field.getType().isAssignableFrom(Long.TYPE)) {
                    sb.append("\""+field.getName()+"\" : "+field.get(o).toString());
            } else if (field.getType().isAssignableFrom(Boolean.TYPE)) {
               sb.append("\""+field.getName()+"\" : "+field.get(o).toString());
            } else {
               sb.append("\""+field.getName()+"\" : \""+field.get(o).toString()+"\"");
            }
          } catch (IllegalAccessException e) {
          } finally {
              field.setAccessible(tempAccessible);
          } //No access, no output
        }
        sb.append("\n}");
        return sb.toString();
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
}
