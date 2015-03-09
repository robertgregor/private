package org.remoteHome;

import com.sun.net.httpserver.HttpExchange;
import java.io.OutputStream;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

/**
* Light meter sketch
* 
* Radio commands (Works only 1st minutes after the power on, if interval is not 0). Please be sure to set the interval, othervise the unit doesn't switch to sleep mode and the battery will be exhausted quickly.
*
* gs - return status 7|light|battery|frequency
* 	light - the value of the light intensity in the range 0 < 1024. 0 means total dark, 1024 means maximum light.
* 	battery voltage e.g. 2.9 or 3.0
* 	frequency - frequency in seconds to send status. Longer value, longer battery life
* gm=nnn - set the frequency and put to the sleep mode. 1 means 10 seconds, 254 means 2540 seconds. Needs to be set to put the device to sleep mode!!!
* 	If not set, or set to 0, then no sleep - usefull for testing, but consume lot of power and batery will be quicly empty.
* gcv=nnn - set the switch device Id, where the light intensity should be sent. The range is 0 < nnn < 255.
* gcvs=nnn - set the ventilator subdevice device Id, where the light intensity should be sent. The range is 0 < nnn < 9.
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
*	   If not set, or set to 0, then no sleep - usefull for testing, but consume lot of power and batery will be quicly empty.
*
* @author Robert Gregor
* 
**/
public class LightSensorDevice extends AbstractDevice implements Serializable {
   /**
     * Current temperature
     */
    private int light; 

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
     * The device id of the simple switch, where the light intensity should be sent
     */
    private int switchDeviceId;

    /**
     * The expected device id of the simple switch, where the light intensity should be sent
     */
    private int switchDeviceIdExpected;
    
    /**
     * Set this to true, if you want to set the switchDeviceId.
     */
    private boolean manageSwitchDeviceIdAuto;
    
    /**
     * The sub device id of the simple switch, where the light intensity should be sent
     */
    private int switchSubDeviceId;

    /**
     * The expected sub device id of the simple switch, where the light intensity should be sent
     */
    private int switchSubDeviceIdExpected;
    
    /**
     * Set this to true, if you want to set the switchSubDeviceId.
     */
    private boolean manageSwitchSubDeviceIdAuto;
    
    /**
     * The constructor is protected. The object should be constructed using
     * LightSensorDevice device = 
     *          (LightSensorDevice)remoteHomeManager.getRemoteHomeDevice(deviceId,deviceName, AbstractDevice.LightSensor)
     * 
     * @param m remote manager reference
     * @param deviceId deviceId assigned to this device
     * @param deviceName device name
     **/

    protected LightSensorDevice(RemoteHomeManager m, int deviceId, String deviceName) {
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
             * 7|temperature|battery|frequency - status
      */
    @Override
    protected void manageAsynchronousCommand(String[] items) {
        if (items[0].equals("7")) {
            light = Integer.parseInt(items[1]);
            setBattery(Float.parseFloat(items[2]));
            frequency = Integer.parseInt(items[3]);
            switchDeviceId = Integer.parseInt(items[4]);
            switchSubDeviceId = Integer.parseInt(items[5]);
            timestamp = System.currentTimeMillis();
            try {
                saveHistoryData();
            } catch (RemoteHomeManagerException e) {
                RemoteHomeManager.log.error(241, e);
            }
            m.notifyDeviceChange(this);
            RemoteHomeManager.log.debug("Values set. Current values: "+toString());
        }
        //here manage the expected settings
            if (isManageFrequencyAuto()) {
                RemoteHomeManager.log.debug("Going to set new frequency: "+getExpectedFrequency());
                new Thread(new Runnable() {
                     public void run() {
                         try {
                            m.sendCommand(parseDeviceIdForMultipleDevice(getRealDeviceId()),"gm="+getExpectedFrequency()/10);
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
            if (isManageSwitchDeviceIdAuto()) {
                RemoteHomeManager.log.debug("Going to set new switch device Id: "+getSwitchDeviceIdExpected());
                new Thread(new Runnable() {
                     public void run() {
                         try {
                            m.sendCommand(parseDeviceIdForMultipleDevice(getRealDeviceId()),"gcv="+getSwitchDeviceIdExpected());
                            setManageSwitchDeviceIdAuto(false);
                            setSwitchDeviceId(getSwitchDeviceIdExpected());
                            switchDeviceIdExpected = 0;
                            RemoteHomeManager.log.info("New switch device Id set: "+getSwitchDeviceId());
                         } catch (Exception e) {
                             RemoteHomeManager.log.error(231, e);
                         }
                     }
                }).start();
            }
            if (isManageSwitchSubDeviceIdAuto()) {
                RemoteHomeManager.log.debug("Going to set new switch sub device Id: "+getSwitchSubDeviceIdExpected());
                new Thread(new Runnable() {
                     public void run() {
                         try {
                            m.sendCommand(parseDeviceIdForMultipleDevice(getRealDeviceId()),"gcvs="+getSwitchSubDeviceIdExpected());
                            setManageSwitchSubDeviceIdAuto(false);
                            setSwitchSubDeviceId(getSwitchSubDeviceIdExpected());
                            switchSubDeviceIdExpected = 0;
                            RemoteHomeManager.log.info("New switch sub device Id set: "+getSwitchSubDeviceId());
                         } catch (Exception e) {
                             RemoteHomeManager.log.error(231, e);
                         }
                     }
                }).start();
            }
    }
    /**
      * Not used
      */
    @Override
    protected void manageAsynchronousCommand(OutputStream o, HttpExchange t, HashMap<String, String> requestParameters) {       
    }    
    /**
     * Current light
     * @return the light
     */
    public int getLight() {
        return light;
    }

    /**
     * Current light
     * @param light the light to set
     */
    private void setLight(int light) {
        this.light = light;
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
        m.sendCommand(parseDeviceIdForMultipleDevice(getRealDeviceId()),"gm=1");
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
    
    /*
     * This method is not supported for this device and will throw always RemoteHomeManagerException - NOT_SUPPORTED.
     * The status of the device is received asynchronously from the device.
     */
    public void updateDevice() throws RemoteHomeManagerException {
        throw new RemoteHomeManagerException(RemoteHomeManagerException.NOT_SUPPORTED);
    }
    /**
     * This method will save the current state of the device to the database together with the timestamp.
     */
    protected void saveHistoryData() throws RemoteHomeManagerException {
          HistoryData history = new HistoryData();
          history.setDeviceId(getDeviceId());
          history.setDataName("SINGLELINEDATA");
          history.setDataValue(Integer.toString(getLight()));
          history.setDataTimestamp();
          m.getPersistance().addHistoryData(history);
          RemoteHomeManager.log.debug("Saved light history data. "+history.getDataName()+": "+history.getDataValue());        
    }

    @Override
    public String toString() {
        HashMap h = new HashMap();
        h.putAll(super.getFieldValues());
        h.put("light", light);
        h.put("frequency", frequency);
        h.put("expectedFrequency", expectedFrequency);
        h.put("manageFrequencyAuto", manageFrequencyAuto);
        h.put("switchDeviceId", switchDeviceId);
        h.put("switchSubDeviceId", switchSubDeviceId);
        h.put("switchDeviceIdExpected", switchDeviceIdExpected);
        h.put("switchSubDeviceIdExpected", switchSubDeviceIdExpected);
        h.put("manageSwitchDeviceIdAuto", manageSwitchDeviceIdAuto);
        h.put("manageSwitchSubDeviceIdAuto", manageSwitchSubDeviceIdAuto);
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

    /**
     * @return the switchDeviceId
     */
    public int getSwitchDeviceId() {
        return switchDeviceId;
    }

    /**
     * @param switchDeviceId the switchDeviceId to set
     */
    public void setSwitchDeviceId(int switchDeviceId) {
        this.switchDeviceId = switchDeviceId;
    }

    /**
     * @return the switchDeviceIdExpected
     */
    public int getSwitchDeviceIdExpected() {
        return switchDeviceIdExpected;
    }

    /**
     * @param switchDeviceIdExpected the switchDeviceIdExpected to set
     */
    public void setSwitchDeviceIdExpected(int switchDeviceIdExpected) {
        this.switchDeviceIdExpected = switchDeviceIdExpected;
        setManageSwitchDeviceIdAuto(true);
    }

    /**
     * @return the manageSwitchDeviceIdAuto
     */
    public boolean isManageSwitchDeviceIdAuto() {
        return manageSwitchDeviceIdAuto;
    }

    /**
     * @param manageSwitchDeviceIdAuto the manageSwitchDeviceIdAuto to set
     */
    protected void setManageSwitchDeviceIdAuto(boolean manageSwitchDeviceIdAuto) {
        this.manageSwitchDeviceIdAuto = manageSwitchDeviceIdAuto;
    }

    /**
     * @return the switchSubDeviceId
     */
    public int getSwitchSubDeviceId() {
        return switchSubDeviceId;
    }

    /**
     * @param switchSubDeviceId the switchSubDeviceId to set
     */
    public void setSwitchSubDeviceId(int switchSubDeviceId) {
        this.switchSubDeviceId = switchSubDeviceId;
    }

    /**
     * @return the switchSubDeviceIdExpected
     */
    public int getSwitchSubDeviceIdExpected() {
        return switchSubDeviceIdExpected;
    }

    /**
     * @param switchSubDeviceIdExpected the switchSubDeviceIdExpected to set
     */
    public void setSwitchSubDeviceIdExpected(int switchSubDeviceIdExpected) {
        this.switchSubDeviceIdExpected = switchSubDeviceIdExpected;
        setManageSwitchSubDeviceIdAuto(true);
    }

    /**
     * @return the manageSwitchSubDeviceIdAuto
     */
    public boolean isManageSwitchSubDeviceIdAuto() {
        return manageSwitchSubDeviceIdAuto;
    }

    /**
     * @param manageSwitchSubDeviceIdAuto the manageSwitchSubDeviceIdAuto to set
     */
    protected void setManageSwitchSubDeviceIdAuto(boolean manageSwitchSubDeviceIdAuto) {
        this.manageSwitchSubDeviceIdAuto = manageSwitchSubDeviceIdAuto;
    }
    
    public class LightChartItem {
        private String xData;
        private int yData;

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
        public int getyData() {
            return yData;
        }

        /**
         * @param yData the yData to set
         */
        public void setyData(int yData) {
            this.yData = yData;
        }
    }
    public ArrayList generateChartItems(HistoryData[] historyData, String type) {
        ArrayList<LightSensorDevice.LightChartItem> retArray = new ArrayList<LightSensorDevice.LightChartItem>();
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'.000Z'");
            for (HistoryData d : historyData) {
                LightSensorDevice.LightChartItem item = new LightSensorDevice.LightChartItem();            
                item.setxData(df.format(d.getDataTimestamp()));
                item.setyData(Integer.parseInt(d.getDataValue()));
                retArray.add(item);
            }
            return retArray;
    }
}
