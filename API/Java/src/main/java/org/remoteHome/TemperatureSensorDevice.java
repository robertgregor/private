package org.remoteHome;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

/**
 * Temperature meter sketch
 * 
 * Radio commands (Works only 1st minutes after the power on, if interval is not 0). Please be sure to set the interval, othervise the unit doesn't switch to sleep mode and the battery will be exhausted quickly.
 * 
 * s - return status 2|temperature|battery|frequency|thermostatId|thermostatSubDeviceId
 * 	temperature format - always sign, 2 decimals degree celsius, dot, 2 decimals, e.g 23.32 or -02.32 or 02.20
 * 	battery voltage e.g. 2.9 or 3.0
 * 	frequency - frequency in seconds to send status. Longer value, longer battery life
 *      thermostatId - thermostat device Id, where the temperature meter is sending the temperature
 *      thermostatSubDeviceId - thermostat sub device Id, where the temperature meter is sending the temperature
 * m=nnn - set the frequency and put to the sleep mode. 1 means 10 seconds, 254 means 2540 seconds. Needs to be set to put the device to sleep mode!!!
 * 	If not set, or set to 0, then no sleep - usefull for testing, but consume lot of power and batery will be quicly empty.
 * t=nnn - set the thermostat device Id, where the temperature should be sent. The range is 0 < nnn < 255.
 * ts=nnn - set the thermostat subdevice device Id, where the temperature should be sent. The range is 0 < nnn < 9.
 * 
 * 
 * 
 * pn - check weather the device is up and runing (ping command) - returns OK
 * nn - check weather the device is up and runing (ping command) - returns nothing - used by the transceiver to measure the RSSI.
 * res - reset the device
 * def - reset the device and place the EEPROM device to factory default
 * 
 * Serial commands:
 * at+c=XXX Configure the channel - Network. Receiver should have the same channel than all the devices. There could be channels 1 >= XXX >= 254
 * at+n=XXX Configure the node Id - Network. Node ID should be unique and identify the node in the network. There could be channels 1 >= XXX >= 254. The receiver has always nodeId = 255.
 * at+res Reset the device
 * at+def Reset the device and set the factory default values of EEPROM
 * at+memid=XXX To set the eeprom value. This command preset the address
 * at+memval=XXX This command set the XXX value at the position memid in the EEPROM
 * at+p=thisIsEncryptKey - for AES encryption, this command set the symetric key for encryption between the transceiver and the device. Should be exactly 16 characters
 * at+s - print the status of the device. Values are separated by \t character.
 * at+m=XXX - set the frequency and put to the sleep mode. 1 means 10 seconds, 254 means 2540 seconds. Needs to be set to put the device to sleep mode!!!
 * 	   If not set, or set to 0, then no sleep - usefull for testing, but consume lot of power and batery will be quicly empty.
 * at+t=XXX - set the thermostat device Id, where the temperature should be sent. The range is 0 < nnn < 255.
 * at+ts=XXX - set the thermostat device Id, where the temperature should be sent. The range is 0 < nnn < 255. 
 * 
 * @author Robert Gregor
 * 
 **/
public class TemperatureSensorDevice extends AbstractDevice implements Serializable {
   /**
     * Current temperature
     */
    private float temperature; 

    /**
     * Frequency in seconds
     */
    private int frequency; 

    /**
     * Expected frequency in seconds value should be set by external system in order to trigger the value change
     * Also the manageOpenAngleAuto method should be set to true.
     */
    private int expectedFrequency; 

    /**
     * Set this to true, if you want to set the expected frequency
     */
    private boolean manageFrequencyAuto = false;

    /**
     * Thermostat device Id, where to send the temperature.
     */
    private int thermostatDeviceId; 
    
    /**
     * Expected thermostat device Id is the value, which should be set by external system in order to trigger the value change.
     * Also the manageThermostatDeviceIdAuto method should be set to true.
     */
    private int expectedThermostatDeviceId; 

    /**
     * Set this to true, if you want to set the thermostat device id
     */
    private boolean manageThermostatDeviceIdAuto = false;

    /**
     * Sub device Id, where to send the temperature.
     */
    private int thermostatSubDeviceId; 
    
    /**
     * Expected thermostat sub device Id is the value, which should be set by external system in order to trigger the value change.
     * Also the manageThermostatSubDeviceIdAuto method should be set to true.
     */
    private int expectedThermostatSubDeviceId; 

    /**
     * Set this to true, if you want to set the thermostat sub device id
     */
    private boolean manageThermostatSubDeviceIdAuto = false;

    /**
     * The constructor is protected. The object should be constructed using
     * TemperatureSensorDevice device = 
     *          (TemperatureSensorDevice)remoteHomeManager.getRemoteHomeDevice(deviceId,deviceName, AbstractDevice.TemperatureSensor)
     * 
     * @param m remote manager reference
     * @param deviceId deviceId assigned to this device
     * @param deviceName device name
     **/

    protected TemperatureSensorDevice(RemoteHomeManager m, int deviceId, String deviceName) {
        super (m, deviceId, deviceName);        
    }
    
    /**
     * Contains the initialization of the device.
     */
    protected void init() {      
    }
    
    /**
      * 
      * @param items the data from asynchronous event. Could be:
             * 2|temperature|battery|frequency|thermostatId|thermostatSubDeviceId - status
      */
    @Override
    protected void manageAsynchronousCommand(String[] items) {
        if (items[0].equals("2")) {
            temperature = Float.parseFloat(items[1]);
            setBattery(Float.parseFloat(items[2]));
            frequency = Integer.parseInt(items[3]);
            thermostatDeviceId = Integer.parseInt(items[4]);
            thermostatSubDeviceId = Integer.parseInt(items[5]);
            timestamp = System.currentTimeMillis();
            try { 
                saveHistoryData();
            } catch (RemoteHomeManagerException e) {
                RemoteHomeManager.log.error(241, e);
            }
            m.notifyDeviceChange(this);
            RemoteHomeManager.log.debug("Values set. Current values: "+toString());
        }
        //here manage the temperature meter expected settings
            if (isManageFrequencyAuto()) {
                RemoteHomeManager.log.debug("Going to set new frequency: "+getExpectedFrequency());
                new Thread(new Runnable() {
                     public void run() {
                         try {
                            m.sendCommand(getDeviceId(),"m="+getExpectedFrequency()/10);
                            setManageFrequencyAuto(false);
                            setFrequency(getExpectedFrequency());
                            expectedFrequency = 0;
                            RemoteHomeManager.log.info("New frequency set: "+getFrequency());
                         } catch (Exception e) {
                             RemoteHomeManager.log.error(231, e);
                         }
                     }
                }).start();
            }
            if (isManageThermostatDeviceIdAuto()) {
                RemoteHomeManager.log.debug("Going to set new thermostat device ID: "+getExpectedThermostatDeviceId());
                new Thread(new Runnable() {
                     public void run() {
                         try {
                            m.sendCommand(getDeviceId(),"t="+getExpectedThermostatDeviceId());
                            setManageThermostatDeviceIdAuto(false);
                            setThermostatDeviceId(getExpectedThermostatDeviceId());
                            expectedThermostatDeviceId = 0;
                            RemoteHomeManager.log.info("New thermostat device ID set: "+getThermostatDeviceId());
                         } catch (Exception e) {                                                         
                             RemoteHomeManager.log.error(232, e);
                         }
                     }
                }).start();
            }
            if (isManageThermostatSubDeviceIdAuto()) {
                RemoteHomeManager.log.debug("Going to set new thermostat sub device ID: "+getExpectedThermostatSubDeviceId());
                new Thread(new Runnable() {
                     public void run() {
                         try {
                            m.sendCommand(getDeviceId(),"ts="+getExpectedThermostatSubDeviceId());
                            setManageThermostatSubDeviceIdAuto(false);
                            setThermostatSubDeviceId(getExpectedThermostatSubDeviceId());
                            expectedThermostatSubDeviceId = 0;
                            RemoteHomeManager.log.info("New thermostat sub device ID set: "+getThermostatSubDeviceId());
                         } catch (Exception e) {
                             RemoteHomeManager.log.error(233, e);
                         }
                     }
                }).start();
            }
    }
    
    /**
     * Current temperature
     * @return the temperature
     */
    public float getTemperature() {
        return temperature;
    }

    /**
     * Current temperature
     * @param temperature the temperature to set
     */
    private void setTemperature(float temperature) {
        this.temperature = temperature;
    }

    /**
     * Frequency in seconds
     * @return the frequency in seconds
     */
    public int getFrequency() {
        return frequency;
    }

    /**
     * Frequency  in seconds
     * @param frequency in seconds the frequency to set. To set the sending frequency, please use setExpectedFrequency(int expectedFrequency).
     */
    protected void setFrequency(int frequency) {
        this.frequency = frequency;
        m.notifyDeviceChange(this);
    }

    /**
     * After the device Id assignment, the frequency is still 0 second, it means no sleep at all. Set 10 seconds sleep in order not to empty battery. 
     */
    public void setInitialFrequency() throws RemoteHomeConnectionException {
        this.frequency = 10;
        this.expectedFrequency = 10;
        this.manageFrequencyAuto = false;
        m.sendCommand(getDeviceId(),"m=1");
    }

    /**
     * Expected frequency in seconds value should be set by external system in order to trigger the value change
     * @return the expectedFrequency in seconds
     */
    public int getExpectedFrequency() {
            return expectedFrequency;
    }

    /**
     * Expected frequency in seconds value should be set by external system in order to trigger the value change
     * @param expectedFrequency the expectedFrequency to set
     */
    public void setExpectedFrequency(int expectedFrequency) {
        this.expectedFrequency = expectedFrequency;
        setManageFrequencyAuto(true);
    }

    /**
     * If true, during the next device asynchronous command, the value is set.
     * @return the manageFrequencyAuto
     */
    public boolean isManageFrequencyAuto() {
        return manageFrequencyAuto;
    }

    /**
     * Set this to true, if you want to set the expected frequency
     * @param manageFrequencyAuto the manageFrequencyAuto to set
     */
    protected void setManageFrequencyAuto(boolean manageFrequencyAuto) {
        this.manageFrequencyAuto = manageFrequencyAuto;
    }

    /**
     * @return the thermostatDeviceId
     */
    public int getThermostatDeviceId() {
        return thermostatDeviceId;
    }

    /**
     * @param thermostatDeviceId the thermostatDeviceId to set. To set this value please use setExpectedThermostatDeviceId().
     */
    protected void setThermostatDeviceId(int thermostatDeviceId) {
        this.thermostatDeviceId = thermostatDeviceId;
        m.notifyDeviceChange(this);
    }

    /**
     * @return the thermostatSubDeviceId
     */
    public int getThermostatSubDeviceId() {
        return thermostatSubDeviceId;
    }

    /**
     * @param thermostatSubDeviceId the thermostatSubDeviceId to set. To set this value please use setExpectedThermostatSubDeviceId().
     */
    protected void setThermostatSubDeviceId(int thermostatSubDeviceId) {
        this.thermostatSubDeviceId = thermostatSubDeviceId;
        m.notifyDeviceChange(this);
    }
    
    /*
     * This method is not supported for this device and will throw always RemoteHomeManagerException - NOT_SUPPORTED.
     * The status of the device is received asynchronously from the device.
     */
    public void updateDevice() throws RemoteHomeManagerException {
        throw new RemoteHomeManagerException(RemoteHomeManagerException.NOT_SUPPORTED);
    }
    /**
     * This method will save the current state of the device to the database together with the timestamp.
     * @throws RemoteHomeManagerException if the data cannot be saved.
     */
    protected void saveHistoryData() throws RemoteHomeManagerException {
          HistoryData history = new HistoryData();
          history.setDeviceId(getDeviceId());
          history.setDataName("SINGLELINEDATA");
          history.setDataValue(Float.toString(getTemperature()));
          history.setDataTimestamp();
          m.getPersistance().addHistoryData(history);
          RemoteHomeManager.log.debug("Saved history data. "+history);
    }

    /**
     * @return the expectedThermostatDeviceId
     */
    public int getExpectedThermostatDeviceId() {
            return expectedThermostatDeviceId;
    }

    /**
     * @param expectedThermostatDeviceId the expectedThermostatDeviceId to set
     */
    public void setExpectedThermostatDeviceId(int expectedThermostatDeviceId) {
        this.expectedThermostatDeviceId = expectedThermostatDeviceId;
        setManageThermostatDeviceIdAuto(true);
    }

    /**
     * @return the manageThermostatDeviceIdAuto
     */
    public boolean isManageThermostatDeviceIdAuto() {
        return manageThermostatDeviceIdAuto;
    }

    /**
     * @param manageThermostatDeviceIdAuto the manageThermostatDeviceIdAuto to set
     */
    public void setManageThermostatDeviceIdAuto(boolean manageThermostatDeviceIdAuto) {
        this.manageThermostatDeviceIdAuto = manageThermostatDeviceIdAuto;
    }

    /**
     * @return the expectedThermostatSubDeviceId
     */
    public int getExpectedThermostatSubDeviceId() {
            return expectedThermostatSubDeviceId;
    }

    /**
     * @param expectedThermostatSubDeviceId the expectedThermostatSubDeviceId to set
     */
    public void setExpectedThermostatSubDeviceId(int expectedThermostatSubDeviceId) {
        this.expectedThermostatSubDeviceId = expectedThermostatSubDeviceId;
        setManageThermostatSubDeviceIdAuto(true);
    }

    /**
     * @return the manageThermostatSubDeviceIdAuto
     */
    public boolean isManageThermostatSubDeviceIdAuto() {
        return manageThermostatSubDeviceIdAuto;
    }

    /**
     * @param manageThermostatSubDeviceIdAuto the manageThermostatSubDeviceIdAuto to set
     */
    public void setManageThermostatSubDeviceIdAuto(boolean manageThermostatSubDeviceIdAuto) {
        this.manageThermostatSubDeviceIdAuto = manageThermostatSubDeviceIdAuto;
    }

    @Override
    public String toString() {
        HashMap h = new HashMap();
        h.putAll(super.getFieldValues());
        h.put("temperature", temperature);
        h.put("frequency", frequency);
        h.put("expectedFrequency", expectedFrequency);
        h.put("manageFrequencyAuto", manageFrequencyAuto);
        h.put("thermostatDeviceId", thermostatDeviceId);
        h.put("expectedThermostatDeviceId", expectedThermostatDeviceId);
        h.put("manageExpectedThermostatDeviceIdAuto", manageThermostatDeviceIdAuto);
        h.put("thermostatSubDeviceId", thermostatSubDeviceId);
        h.put("expectedThermostatSubDeviceId", expectedThermostatSubDeviceId);
        h.put("manageExpectedThermostatSubDeviceIdAuto", manageThermostatSubDeviceIdAuto);
        return h.toString();
    }
    /*
     * This method is called each second. Do not put inside blocking operations
    */
    protected void runEachSecond() {
    }
    
    /*
     * This method is called each minute. Do not put inside blocking operations
    */
    protected void runEachMinute() {     
    }

    /*
     * This method is called each 10 minutes. Do not put inside blocking operations
    */
    protected void runEach10Minutes() {
    }

    /*
     * This method is called each hour. Do not put inside blocking operations
    */
    protected void runEachHour() {      
    }

    /*
     * This method is called each day. Do not put inside blocking operations
    */
    protected void runEachDay() {               
    }
    
    public float getLowBatteryLimit() {
        return 2.8f;
    }

    public class TemperatureChartItem {
        private String xData;
        private float yData;

        /**
         * @return the xData
         */
        public String getxData() {
            return xData;
        }

        /**
         * @param xData the xData to set
         */
        public void setxData(String xData) {
            this.xData = xData;
        }

        /**
         * @return the yData
         */
        public float getyData() {
            return yData;
        }

        /**
         * @param yData the yData to set
         */
        public void setyData(float yData) {
            this.yData = yData;
        }
    }
    public ArrayList generateChartItems(HistoryData[] historyData, String type) {
        ArrayList<TemperatureSensorDevice.TemperatureChartItem> retArray = new ArrayList<TemperatureSensorDevice.TemperatureChartItem>();
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'.000Z'");
            for (HistoryData d : historyData) {
                TemperatureSensorDevice.TemperatureChartItem item = new TemperatureSensorDevice.TemperatureChartItem();            
                item.setxData(df.format(d.getDataTimestamp()));
                item.setyData(Float.parseFloat(d.getDataValue()));
                retArray.add(item);
            }
            return retArray;
    }
}
