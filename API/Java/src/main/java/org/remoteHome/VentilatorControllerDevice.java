/**
* Ventilation controller commands ( Used together with CO2 / humidity sensors )<BR/><BR/>
* --------------------------------------------------------------------------------------------
* vxch=nnn - receive current humidity from humidity sensor nnn is the value 0 - 100
* vxchx=nnn - configure max. humidity concentration. If the received concentration is higher, then the max. the relay will switch ON. ( For the defined period vxchm=nnn. )
* vxchm=nnn - configure the humidity switch ON timeout in minutes.
* vxco=nnnn - receive current CO2 from CO2 sensor nnnn is the int
* vxcox=nnn - configure max. CO2 concentration. If the received concentration is higher, then the max. the relay will switch ON. ( For the defined period vxcom=nnn. )
* vxcom=nnn - configure the CO2 switch ON timeout.
* vxo - Switch on forewer
* vxf - Switch off forewer
* vxs - return status 1v|ventilationID|status|currentHumidity|currentCo2|maxHumidity|maxCo2|humidityTimeout|Co2Timeout|currentCounter
*         ventilationID - number of ventilation ( It is in fact value x )
*         status - 0 off, 1 on
*         currentHumidity - current humidity received by the humidity sensor
*         currentCo2 - current Co2 received by the Co2 sensor
*         maxHumidity - Max. humidity value configured with the vxchx command
*         maxCo2 - Max. Co2 value configured with the vxcox command
*         humidityTimeout - humidity timeout value configured with the vxchx command
*         Co2Timeout - Co2 timeout value configured with the vxcox command
*         currentCounter - current timeout in minutes. E.g. 3 means, that after 3 minutes the relay will switch off. 0 means never switch off. 
* 
* x - subdevice number 
* 
*/

package org.remoteHome;

import com.sun.net.httpserver.HttpExchange;
import java.io.OutputStream;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author gregorro
 */
public class VentilatorControllerDevice extends AbstractDevice implements Serializable {
    
    /**
     * Indicates the current state of the device. True means ON, false means OFF.
     */
    private boolean currentState;

    /**
     * Current counter in minutes. When the counter reach 0, the switch will turn off.
     */    
    private int currentCounter;
    
    /**
     * Current CO2 value received from CO2 sensor. The value is in ppm
     */    
    private int currentCO2concentration;

    /**
     * Current humidity value received from humidity sensor. The value is in % 0 - 100
     */    
    private int currentHumidity;

    /**
     * Maximum CO2 value. If the received value from sensor is higher than this value the relay will switch ON.
     */    
    private int maxCO2concentration;

    /**
     * Maximum humidity value. If the received value from sensor is higher than this value the relay will switch ON.
     */    
    private int maxHumidity;

    /**
     * CO2 counter value. This value means, how long should be the ventilator ON, when it receive the data from sensor, which is higher than max value. It is in minutes.
     */    
    private int co2Counter;

    /**
     * Humidity counter value. This value means, how long should be the ventilator ON, when it receive the data from sensor, which is higher than max value. It is in minutes.
     */    
    private int humidityCounter;
    
    /*
     * This is true if power has been lost and the message "LP" has been received.
     */
    private boolean powerLost;
    
    /**
     * The constructor is protected. The object should be constructed using
     * SimpleSwitchDevice device = 
     *          (SimpleSwitchDevice)remoteHomeManager.getRemoteHomeDevice(deviceId,deviceName, AbstractDevice.SimpleSwitch)
     * 
     * @param m remote manager reference
     * @param deviceId deviceId assigned to this device
     * @param deviceName device name
     */    
    protected VentilatorControllerDevice(RemoteHomeManager m, int deviceId, String deviceName) {
        super (m, deviceId, deviceName);
        setSubDeviceNumber("1");
    }
    /**
     * Contains the initialization of the device.
     */
    protected void init() {
        try {
            updateDevice();
        } catch (Exception e) {
            RemoteHomeManager.log.error(42,e);
        }
    }
    /**
     * For Simple switch, this method is not used.
     * 
     * @param items items returned back
     */
    
    @Override
    protected void manageAsynchronousCommand(String[] items) {
        if (items[0].equals("LP")) {
            setPowerLost(true);
            setCurrentState(false);
        } else {
            setPowerLost(false);
            parseReceivedData(items);
        }
    }
    
    /**
      * Not used
      */
    @Override
    protected void manageAsynchronousCommand(OutputStream o, HttpExchange t, HashMap<String, String> requestParameters) {       
    }    
    
    /**
     * This method will update the values in this object from the hardware device
     * 
     * @throws RemoteHomeConnectionException if there is a problem with communication
     * @throws RemoteHomeManagerException if the type of the device doesn't belongs to the answer received back.
     * 
     */
    public void updateDevice() throws RemoteHomeConnectionException, RemoteHomeManagerException {
        String statusResponse[] = null;
        try {
            statusResponse = m.sendCommandWithAnswer(parseDeviceIdForMultipleDevice(getDeviceId()), "v"+getSubDeviceNumber()+"s").split("\\|");
            setPowerLost(false);
            if (!statusResponse[0].equals("1v")) {
                throw new RemoteHomeManagerException("This response belongs to different device type.", RemoteHomeManagerException.WRONG_DEVICE_TYPE);
            }
        } catch (RemoteHomeConnectionException e) {
            if (isPowerLost()) {
                return;
            } else {
                throw e;
            }
        }
        if (!statusResponse[1].equals(getSubDeviceNumber())) {
            throw new RemoteHomeManagerException("This response belongs to different sub device type.", RemoteHomeManagerException.WRONG_DEVICE_TYPE);
        }
        parseReceivedData(statusResponse);
    }
    /*
    * 1v|ventilationID|status|currentHumidity|currentCo2|maxHumidity|maxCo2|humidityTimeout|Co2Timeout|currentCounter
    */
    public void parseReceivedData(String statusResponse[]) {
        setPowerLost(false);
        if (statusResponse[2].equals("1")) {
            currentState = true;
        } else {
            currentState = false;
        }
        currentHumidity = Integer.parseInt(statusResponse[3]);
        currentCO2concentration = Integer.parseInt(statusResponse[4]);
        maxHumidity = Integer.parseInt(statusResponse[5]);
        maxCO2concentration = Integer.parseInt(statusResponse[6]);
        humidityCounter = Integer.parseInt(statusResponse[7]);
        co2Counter = Integer.parseInt(statusResponse[8]);
        currentCounter = Integer.parseInt(statusResponse[9]);
        setTimestamp(System.currentTimeMillis());
        try {
            saveHistoryData();
        } catch (RemoteHomeManagerException e) {
            if (e.getType() != RemoteHomeManagerException.PERSISTANCE_NOT_INITIALIZED)
                RemoteHomeManager.log.error(44,e);
        }
        m.notifyDeviceChange(this);
        RemoteHomeManager.log.info("Values set. Current values: "+toString());
    }
    
    @Override
    public String toString() {
        HashMap h = new HashMap();
        h.putAll(super.getFieldValues());
        h.put("currentState", currentState);
        h.put("currentHumidity", currentHumidity);
        h.put("currentCO2concentration", currentCO2concentration);
        h.put("maxHumidity", maxHumidity);
        h.put("maxCO2concentration", maxCO2concentration);
        h.put("humidityCounter", humidityCounter);
        h.put("co2Counter", co2Counter);
        h.put("currentCounter", currentCounter);    
        h.put("powerLost", powerLost);
        return h.toString();
    }
    
    /**
     * This method will switch on the device.
     * 
     * @throws RemoteHomeConnectionException if there is problem with connection
     */
    public void switchOn() throws RemoteHomeConnectionException {
        m.sendCommand(parseDeviceIdForMultipleDevice(getRealDeviceId()), "v"+getSubDeviceNumber()+"o");
        setCurrentState(true);
    }
    
    /**
     * This method will switch off the device.
     * 
     * @throws RemoteHomeConnectionException if there is problem with connection
     */
    public void switchOff() throws RemoteHomeConnectionException {
        m.sendCommand(parseDeviceIdForMultipleDevice(getRealDeviceId()), "v"+getSubDeviceNumber()+"f");
        setCurrentState(false);
    }

    /**
     * Indicates the current state of the device. True means ON, false means OFF.
     * @return the currentState
     */
    public boolean isCurrentState() {
        return currentState;
    }

    /**
     * Indicates the current state of the device. True means ON, false means OFF.
     * @param currentState the currentState to set
     */
    protected void setCurrentState(boolean currentState) {
        this.currentState = currentState;
    }

    /**
     * Current counter in minutes. When the counter reach 0, the switch will turn off.
     * @return the currentCounter
     */
    public int getCurrentCounter() {
        return currentCounter;
    }

    /**
     * Current counter in minutes. When the counter reach 0, the switch will turn off.
     * @param currentCounter the currentCounter to set
     */
    protected void setCurrentCounter(int currentCounter) {
        this.currentCounter = currentCounter;
    }
    
   /**
     * This method will configure the humidity counter.
     * @param period it is the timeout in minutes, till when the switch should stay on, when the humidity value from sensor is received and this value is higher than max value. The value should be in range (period < 0) || (period > 255), 0 - forever.
     * @throws RemoteHomeConnectionException if there is problem with connection
     * @throws RemoteHomeManagerException if there is problem with the parameter value
     */
    public void configureHumidityCounter(int period) throws RemoteHomeConnectionException, RemoteHomeManagerException {
        if ((period < 0) || (period > 255)) {
            throw new RemoteHomeManagerException("The value should be 0 - 255", RemoteHomeManagerException.WRONG_PARAMETER_VALUE);
        }
        m.sendCommand(parseDeviceIdForMultipleDevice(getRealDeviceId()), "v"+getSubDeviceNumber()+"chm="+period);
        this.humidityCounter = period;    
    }    

   /**
     * This method will configure the CO2 counter.
     * @param period it is the timeout in minutes, till when the switch should stay on, when the CO2 value from sensor is received and this value is higher than max value. The value should be in range (period < 0) || (period > 255), 0 - forever.
     * @throws RemoteHomeConnectionException if there is problem with connection
     * @throws RemoteHomeManagerException if there is problem with the parameter value
     */
    public void configureCO2Counter(int period) throws RemoteHomeConnectionException, RemoteHomeManagerException {
        if ((period < 0) || (period > 255)) {
            throw new RemoteHomeManagerException("The value should be 0 - 255", RemoteHomeManagerException.WRONG_PARAMETER_VALUE);
        }
        m.sendCommand(parseDeviceIdForMultipleDevice(getRealDeviceId()), "v"+getSubDeviceNumber()+"com="+period);
        this.co2Counter = period;    
    }    
   /**
     * This method will configure the maximum humidity.
     * @param maxHumidity If the sensor send the current humidity value, which is higher than maxHumidity, the ventilator will switch on for the humidity timeout. Range is 0 .. 100.
     * @throws RemoteHomeConnectionException if there is problem with connection
     * @throws RemoteHomeManagerException if there is problem with the parameter value
     */
    public void configureMaxHumidity(int maxHumidity) throws RemoteHomeConnectionException, RemoteHomeManagerException {
        if ((maxHumidity < 0) || (maxHumidity > 100)) {
            throw new RemoteHomeManagerException("The value should be 0 - 100", RemoteHomeManagerException.WRONG_PARAMETER_VALUE);
        }
        m.sendCommand(parseDeviceIdForMultipleDevice(getRealDeviceId()), "v"+getSubDeviceNumber()+"chx="+maxHumidity);
        this.maxHumidity = maxHumidity;    
    }    

   /**
     * This method will configure the maximum CO2 value.
     * @param maxCO2 If the sensor send the current CO2 value, which is higher than maxCO2, the ventilator will switch on for the humidity timeout. Range is 0 .. 40000.
     * @throws RemoteHomeConnectionException if there is problem with connection
     * @throws RemoteHomeManagerException if there is problem with the parameter value
     */
    public void configureMaxCO2concentration(int maxCO2concentration) throws RemoteHomeConnectionException, RemoteHomeManagerException {
        if ((maxCO2concentration < 0) || (maxCO2concentration > 40000)) {
            throw new RemoteHomeManagerException("The value should be 0 - 40000", RemoteHomeManagerException.WRONG_PARAMETER_VALUE);
        }
        m.sendCommand(parseDeviceIdForMultipleDevice(getRealDeviceId()), "v"+getSubDeviceNumber()+"cox="+maxCO2concentration);
        this.maxCO2concentration = maxCO2concentration;     
    }
    /**
     * @return the currentCO2concentration
     */
    public int getCurrentCO2concentration() {
        return currentCO2concentration;
    }

    /**
     * @param currentCO2concentration the currentCO2concentration to set
     */
    protected void setCurrentCO2concentration(int currentCO2concentration) {
        this.currentCO2concentration = currentCO2concentration;
    }

    /**
     * @return the currentHumidity
     */
    public int getCurrentHumidity() {
        return currentHumidity;
    }

    /**
     * @param currentHumidity the currentHumidity to set
     */
    protected void setCurrentHumidity(int currentHumidity) {
        this.currentHumidity = currentHumidity;
    }

    /**
     * @return the maxCO2concentration
     */
    public int getMaxCO2concentration() {
        return maxCO2concentration;
    }

    /**
     * @param maxCO2concentration the maxCO2concentration to set
     */
    protected void setMaxCO2concentration(int maxCO2concentration) {
        this.maxCO2concentration = maxCO2concentration;
    }

    /**
     * @return the maxHumidity
     */
    public int getMaxHumidity() {
        return maxHumidity;
    }

    /**
     * @param maxHumidity the maxHumidity to set
     */
    protected void setMaxHumidity(int maxHumidity) {
        this.maxHumidity = maxHumidity;
    }

    /**
     * @return the co2Counter
     */
    public int getCo2Counter() {
        return co2Counter;
    }

    /**
     * @param co2Counter the co2Counter to set
     */
    protected void setCo2Counter(int co2Counter) {
        this.co2Counter = co2Counter;
    }

    /**
     * @return the humidityCounter
     */
    public int getHumidityCounter() {
        return humidityCounter;
    }

    /**
     * @param humidityCounter the humidityCounter to set
     */
    protected void setHumidityCounter(int humidityCounter) {
        this.humidityCounter = humidityCounter;
    }

    /**
     * This method will save the current state of the device to the database together with the timestamp.
     * @throws RemoteHomeManagerException if the saving fail.
     */
    protected void saveHistoryData() throws RemoteHomeManagerException {        
          HistoryData history = new HistoryData();
          history.setDeviceId(getDeviceId());
          history.setDataName("ONOFF");
          history.setDataValue(Integer.toString((isCurrentState())?1:0));
          history.setDataTimestamp();
          m.getPersistance().addHistoryData(history);
          RemoteHomeManager.log.debug("Saved history data: "+history.toString());
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
        try {
            saveHistoryData();
        } catch (RemoteHomeManagerException e) {
            RemoteHomeManager.log.error(44,e);
        }
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
        return 0f;
    }

    /**
     * @return the powerLost
     */
    public boolean isPowerLost() {
        return powerLost;
    }

    /**
     * @param powerLost the powerLost to set
     */
    protected void setPowerLost(boolean powerLost) {
        this.powerLost = powerLost;
    }

    public class VentilatorChartItem {
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
        ArrayList<VentilatorControllerDevice.VentilatorChartItem> retArray = new ArrayList<VentilatorControllerDevice.VentilatorChartItem>();
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'.000Z'");
            for (HistoryData d : historyData) {
                VentilatorControllerDevice.VentilatorChartItem item = new VentilatorControllerDevice.VentilatorChartItem();            
                item.setxData(df.format(d.getDataTimestamp()));
                item.setyData(Integer.parseInt(d.getDataValue()));
                retArray.add(item);
            }
            return retArray;
    }
}
