package org.remoteHome;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

/**
  *Thermostat<br/>
  *<br/><br/>
  * txcu=nn.nn - receive current temperature from temperature sensor nn.nn is the float
  * txcte=nnn - configure expected temperature. Should be in form float, decimal character is ".", e.g. 21.5
  * txctt=nnn - configure threshold. Should be 0 < nnn < 9. If the expected temperature is e.g. 21 and threshold is 2, then the switch is on, when the current temperature is bellow 20.8 and will switch off, when it is higher than 21.2
  * txch=nnn - configure heating device Id. If there is a device, which needs to be switched on ( e.g. heating unit ), then configure it. This value is common for all the switches on the same board. nnn = 1 to 254
  * txcs=nnn - configure heating sub device Id. If there is a device, which needs to be switched on ( e.g. heating unit ), then configure it. If there is a subdevice board to control more outputs configure subdevice Id. nnn = 1 to 8
  * txs - return status 1t|thermostatID|status|currentTemperature|ExpectedTemperature|Threshold|HeatingDeviceId|HeatingDeviceSubdeviceId
  *         thermostatID - number of thermostat ( It is in fact value x )
  *         status - 0 off, 1 on
  *         currentTemperature - current temperature send by the temperature sensor
  *         ExpectedTemperature - expected temperature
  *         Threshold - Threshold. Should be 0 < nnn < 9. If the expected temperature is e.g. 21 and threshold is 2, then the switch is on, when the current temperature is bellow 20.8 and will switch off, when it is higher than 21.2
  *         HeatingDeviceId - heating device Id. If there is a device, which needs to be switched on ( e.g. heating unit ), then configure it. This value is common for all the switches on the same board. nnn = 1 to 254
  *         HeatingDeviceSubdeviceId - heating sub device Id. If there is a device, which needs to be switched on ( e.g. heating unit ), then configure it. If there is a subdevice board to control more outputs configure subdevice Id. nnn = 1 to 8
  *<br/><br/>
  * @author Robert Gregor<br/>
  */
public class ThermostatDevice extends AbstractDevice {

    /**
     * Current temperature
     */
    private float temperature; 
        
    /**
     * Device Expected temperature already configured in the device
     */
    private float deviceExpectedTemperature;
    
    /**
     * State of the relay, true if the relay is ON
     */
    private boolean relayOn;
    
    /**
     * Threshold 0 - 9. For the self managed mode, the threshold could be set. It means that relay will go off when currentTemperature + threshold / 10 > expected temperature and will<br/>
     * go on, when currentTemperature - threshold / 10 < expected temperature<br/>
     */
    private int threshold;
        
    /**
     * This is true if scheduler is enabled.
     */
    private boolean enabledScheduler;

    /**
     * This is automatic scheduler
     */
    private TemperatureSchedule temperatureSchedule = new TemperatureSchedule();   
    
    /**
     * This is id of the heating controller
     */
    private int heatingControllerDeviceId;   

    /**
     * This is subdevice id of the heating controller
     */
    private int heatingControllerSubDeviceId;   

    /*
     * Holds the hour counter for the manual temperature setup
     */
    private int manualSetupHourCounter;

    /*
     * This is true if power has been lost and the message "LP" has been received.
     */
    private boolean powerLost;
    /**
     * The constructor is protected. The object should be constructed using
     * ThermostatDevice device = 
     *          (ThermostatDevice)remoteHomeManager.getRemoteHomeDevice(deviceId,deviceName, AbstractDevice.Thermostat)
     * 
     * @param m remote manager reference
     * @param deviceId deviceId assigned to this device
     * @param deviceName device name
     **/

    protected ThermostatDevice(RemoteHomeManager m, int deviceId, String deviceName) {
        super (m, deviceId, deviceName);
        temperatureSchedule = new TemperatureSchedule();
    }
    
    /**
     * Contains the initialization of the device. Here the correct expected temperature is set.
     */
    protected void init() {
        try {
            if (enabledScheduler) {
                if (getDeviceExpectedTemperature() != getTemperatureSchedule().getCurrentExpectedValue()) {
                    setDeviceExpectedTemperature(getTemperatureSchedule().getCurrentExpectedValue());
                    enabledScheduler = true;
                }
            }
        } catch (Exception e) {
            RemoteHomeManager.log.error(31,e);
        }
    }
    
    /**
      * 
      * @param items the data from asynchronous event. Could be:
             * 6|temperature|frequency|expected temperature|relay|treshold 
      */
    @Override
    protected void manageAsynchronousCommand(String[] items) {
        if (items[0].equals("LP")) {
            setPowerLost(true);
            relayOn = false;
        } else {
            setPowerLost(false);
            parseReceivedData(items);
        }
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
            statusResponse = m.sendCommandWithAnswer(parseDeviceIdForMultipleDevice(getDeviceId()), "t"+getSubDeviceNumber()+"s").split("\\|");
            setPowerLost(false);
            if (!statusResponse[0].equals("1t")) {
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
    public void parseReceivedData(String statusResponse[]) {
            setPowerLost(false);
            if (statusResponse[2].equals("1")) {
                relayOn = true;
            } else {
                relayOn = false;                
            }
            temperature = Float.parseFloat(statusResponse[3]);
            deviceExpectedTemperature = Float.parseFloat(statusResponse[4]);
            threshold = (int)(Float.parseFloat(statusResponse[5])*10);  
            heatingControllerDeviceId = Integer.parseInt(statusResponse[6]);
            heatingControllerSubDeviceId = Integer.parseInt(statusResponse[7]);
            setTimestamp(System.currentTimeMillis());
            try {
                saveHistoryData();
            } catch (RemoteHomeManagerException e) {
                if (e.getType() != RemoteHomeManagerException.PERSISTANCE_NOT_INITIALIZED)
                    RemoteHomeManager.log.error(241, e);
            }
            m.notifyDeviceChange(this);
            RemoteHomeManager.log.info("Values set. Current values: "+toString());
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
    protected void setTemperature(float temperature) {
        this.temperature = temperature;
    }

    /**
     * Device Expected temperature already configured in the device
     * @return the deviceExpectedTemperature
     */
    public float getDeviceExpectedTemperature() {
        return deviceExpectedTemperature;
    }

    /**
     * Device Expected temperature already configured in the device
     * @param deviceExpectedTemperature the deviceExpectedTemperature to set. Should be in form float, decimal character is ".", e.g. 21.5
     * @throws RemoteHomeConnectionException if there is a problem with communication
     */
    public void setDeviceExpectedTemperature(float deviceExpectedTemperature) throws RemoteHomeConnectionException {        
        m.sendCommand(getRealDeviceId(), "t"+this.getSubDeviceNumber()+"cte="+(Float.toString(deviceExpectedTemperature)));
        this.deviceExpectedTemperature = deviceExpectedTemperature;
        enabledScheduler = false;
    }

    /**
     * State of the relay, true if the relay is ON
     * @return the relayState
     */
    public boolean isRelayOn() {
        return relayOn;
    }

    /**
     * Threshold 0 - 9. For the self managed mode, the threshold could be set. It means that relay will go off when currentTemperature + threshold / 10 > expected temperature and will<br/>
     * go on, when currentTemperature - threshold / 10 < expected temperature<br/>
     * @return the threshold
     */
    public int getThreshold() {
        return threshold;
    }

    /**
     * Threshold 0 - 9. For the self managed mode, the threshold could be set. It means that relay will go off when currentTemperature + threshold / 10 > expected temperature and will<br/>
     * go on, when currentTemperature - threshold / 10 < expected temperature<br/>
     * @param threshold the threshold to set
     * @throws RemoteHomeConnectionException if there is a problem with communication
     * @throws RemoteHomeManagerException if the value is not in range 0 - 9
     */
    public void setThreshold(int threshold) throws RemoteHomeConnectionException, RemoteHomeManagerException {
        if ((threshold < 0) || (threshold > 9)) {
            throw new RemoteHomeManagerException("The value should be 0 - 9", RemoteHomeManagerException.WRONG_PARAMETER_VALUE);
        }
        m.sendCommand(getRealDeviceId(), "t"+this.getSubDeviceNumber()+"ctt="+(threshold));
        this.threshold = threshold;

    }

    /**
     * @return the enabledScheduler
     */
    public boolean isEnabledScheduler() {
        return enabledScheduler;
    }

    /**
     * @param enabledScheduler the enabledScheduler to set
     * @throws RemoteHomeConnectionException if there is a problem with communication
     */
    public void setEnabledScheduler(boolean enabledScheduler) throws RemoteHomeConnectionException {
        //set the correct expected temperature
        if (enabledScheduler) {
            if (getDeviceExpectedTemperature() != getTemperatureSchedule().getCurrentExpectedValue()) {
                setDeviceExpectedTemperature(getTemperatureSchedule().getCurrentExpectedValue());
            }
        }
        this.enabledScheduler = enabledScheduler;
    }

    /**
     * @return the temperatureSchedule
     */
    public TemperatureSchedule getTemperatureSchedule() {
        return temperatureSchedule;
    }

    /**
     * @param temperatureSchedule the temperatureSchedule to set
     */
    public void setTemperatureSchedule(TemperatureSchedule temperatureSchedule) {
        this.temperatureSchedule = temperatureSchedule;
    }

    /**
     * @return the heatingController
     */
    public int getHeatingControllerDeviceId() {
        return heatingControllerDeviceId;
    }

    /**
     * @param heatingControllerDeviceId the heatingController device id to set
     * @throws RemoteHomeConnectionException if there is a problem with communication
     * @throws RemoteHomeManagerException if the value is not in range 1 - 254
     */
    public void setHeatingControllerDeviceId(int heatingControllerDeviceId) throws RemoteHomeConnectionException, RemoteHomeManagerException {
        if ((heatingControllerDeviceId < 0) || (heatingControllerDeviceId > 254)) {
            throw new RemoteHomeManagerException("The value should be 1 - 254", RemoteHomeManagerException.WRONG_PARAMETER_VALUE);
        }
        m.sendCommand(getRealDeviceId(), "t"+this.getSubDeviceNumber()+"ch="+(heatingControllerDeviceId));
        this.heatingControllerDeviceId = heatingControllerDeviceId;
    }

    /**
     * This method will save the current state of the device (current and expected temperature) to the database together with the timestamp.
     * @throws RemoteHomeManagerException if the saving fails.
     */
    protected void saveHistoryData() throws RemoteHomeManagerException {
        HistoryData history = new HistoryData();
        history.setDeviceId(getDeviceId());
        history.setDataName("DOUBLELINEDATA");
        history.setDataValue(Float.toString(getTemperature())+"|"+Float.toString(getDeviceExpectedTemperature()));
        history.setDataTimestamp();
        m.getPersistance().addHistoryData(history);
        RemoteHomeManager.log.debug("Saved history data: "+history.toString());        
    }

    /**
     * @return the heatingControllerSubDeviceId
     */
    public int getHeatingControllerSubDeviceId() {
        return heatingControllerSubDeviceId;
    }

    /**
     * @param heatingControllerSubDeviceId the heatingControllerSubDeviceId to set
     * @throws RemoteHomeConnectionException if there is a problem with communication
     * @throws RemoteHomeManagerException if the value is not in range 1 - 8
     */
    public void setHeatingControllerSubDeviceId(int heatingControllerSubDeviceId) throws RemoteHomeConnectionException, RemoteHomeManagerException {
        if ((heatingControllerSubDeviceId < 0) || (heatingControllerSubDeviceId > 8)) {
            throw new RemoteHomeManagerException("The value should be 1 - 8", RemoteHomeManagerException.WRONG_PARAMETER_VALUE);
        }
        m.sendCommand(getRealDeviceId(), "t"+this.getSubDeviceNumber()+"cs="+(heatingControllerSubDeviceId));        
        this.heatingControllerSubDeviceId = heatingControllerSubDeviceId;
    }
    
    @Override
    public String toString() {
        HashMap h = new HashMap();
        h.putAll(super.getFieldValues());
        h.put("temperature", temperature);
        h.put("deviceExpectedTemperature", deviceExpectedTemperature);
        h.put("relayOn", relayOn);
        h.put("threshold", threshold);
        h.put("enabledScheduler", enabledScheduler);
        h.put("heatingControllerDeviceId", heatingControllerDeviceId);
        h.put("heatingControllerSubDeviceId", heatingControllerSubDeviceId);
        h.put("powerLost", powerLost);
        return h.toString();
    }
    
    /**
     * This method is called each second. Do not put inside blocking operations
     */
    protected void runEachSecond() {        
    }
    
    /**
     * This method is called each minute. Do not put inside blocking operations
     */
    protected void runEachMinute() {
        if (manualSetupHourCounter > 0) {
            if (--manualSetupHourCounter == 0) {
                //OK set the schedulerEnabled and set the scheduler temperature
                RemoteHomeManager.log.debug("Temporary manual setup period is over. Setting to the enabled scheduler mode.");
                enabledScheduler = true;
                if (getDeviceExpectedTemperature() != getTemperatureSchedule().getCurrentExpectedValue()) {
                    try {
                        setDeviceExpectedTemperature(getTemperatureSchedule().getCurrentExpectedValue());
                        enabledScheduler = true;
                        RemoteHomeManager.log.debug("Scheduler enabled. Set the new expected temperature: "+getDeviceExpectedTemperature());
                    } catch (RemoteHomeConnectionException e) {
                        RemoteHomeManager.log.error(33,e);
                    }            
                }                
            } else {
                RemoteHomeManager.log.debug("Temporary manual setup counter decressed by 1. New value: "+manualSetupHourCounter);
            }
        }
    }

    /**
     * This method is called each 10 minutes. Do not put inside blocking operations
     */
    protected void runEach10Minutes() {
        try {            
            if (enabledScheduler) {
                if (getDeviceExpectedTemperature() != getTemperatureSchedule().getCurrentExpectedValue()) {
                    setDeviceExpectedTemperature(getTemperatureSchedule().getCurrentExpectedValue());
                    enabledScheduler = true;
                    RemoteHomeManager.log.debug("Scheduler enabled. Set the new expected temperature: "+getDeviceExpectedTemperature());
                }
            }
            saveHistoryData();
        } catch (RemoteHomeConnectionException e) {
            RemoteHomeManager.log.error(33,e);
        } catch (RemoteHomeManagerException e) {
            RemoteHomeManager.log.error(34,e);
        }            
    }

    /**
     * This method is called each hour. Do not put inside blocking operations
     */
    protected void runEachHour() {
    }

    /**
     * This method is called each day. Do not put inside blocking operations
     */
    protected void runEachDay() {
    }

    /**
     * @return the manualSetupHourCounter
     */
    public int getManualSetupHourCounter() {
        return manualSetupHourCounter;
    }

    /**
     * This method will set for the temporary hour period the defined temperature. After this period, the device will be set automatically to the scheduler enabled mode and the
     * temperature from the assigned scheduler is used.
     * 
     * @param manualSetupHourCounter the number of hours, for which the device should stay on the temperature.
     * @param temperature the temporary temperature
     * @throws RemoteHomeConnectionException if there is a problem with communication
     */
    public void setManualSetupHourCounterAndTemperature(int manualSetupHourCounter, float temperature) throws RemoteHomeConnectionException {
        this.manualSetupHourCounter = manualSetupHourCounter*60;
        setDeviceExpectedTemperature(temperature);
        RemoteHomeManager.log.debug("Temporary manual setup enabled. Hour(s): "+manualSetupHourCounter+" Temperature: "+temperature);
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
    
    public class ThermostatChartItem {
        private String xData;
        private float yData;
        private float yDataExpected;

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

        /**
         * @return the yDataExpected
         */
        public float getyDataExpected() {
            return yDataExpected;
        }

        /**
         * @param yDataExpected the yDataExpected to set
         */
        public void setyDataExpected(float yDataExpected) {
            this.yDataExpected = yDataExpected;
        }
    }
    public ArrayList generateChartItems(HistoryData[] historyData, String type) {
        ArrayList<ThermostatDevice.ThermostatChartItem> retArray = new ArrayList<ThermostatDevice.ThermostatChartItem>();
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'.000Z'");
            for (HistoryData d : historyData) {
                ThermostatDevice.ThermostatChartItem item = new ThermostatDevice.ThermostatChartItem();            
                item.setxData(df.format(d.getDataTimestamp()));
                item.setyData(Float.parseFloat(d.getDataValue().split("\\|")[0]));
                item.setyDataExpected(Float.parseFloat(d.getDataValue().split("\\|")[1]));
                retArray.add(item);
            }
            return retArray;
    }
}