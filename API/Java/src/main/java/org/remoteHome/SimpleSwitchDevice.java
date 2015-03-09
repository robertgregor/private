package org.remoteHome;

import com.sun.net.httpserver.HttpExchange;
import java.io.OutputStream;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

/**
  * Simple switch<BR/>
  * 
  * lxo - light 1 on
  * lxof - light x on and off after timeout period
  * lxot - light x on and off after 3 minutes doesnt matter the timeout period.
  * lxf - light x off
  * lxco - configure light x to swith on when applied power
  * lxcf - configure light x to stay off when applied power
  * lxcm=nnn - configure light x timeout nnn = 0 to 255 minutes (0 means forewer) minutes
  * lxs - return status 1s|switchId|status|power|configuredTimeout|currentTimeout|configuredLightIntensity|currentLightIntensity
  *     switchID - number of switch ( It is in fact value x )
  * 	status - 0 off, 1 on
  * 	power - 0 on when applied power, 1 stay off when applied power	
  * 	configuredTimeout - no of minutes, when l1 will go off, 0 forewer
  * 	currentTimeout - current light 1 timeout in minutes, 0 - never switch off
  * 
  *
  *     Quick startup:<BR/>
  *     1. Connect to the PC, load the software to the device.<BR/>
  *     2. Test the communication AT+1=pn<BR/>
  *     3. Configure the device: 1. Set channel AT+c=5, set encryption password AT+p=LukiKukiBukiDuki, set device ID AT+n=9 Id is 9 ant the last configure number of relays AT+pcn=2<BR/>
  *     4. Test the device: AT+9=s Should return back the status.<BR/>
  *     5. Test the device: AT+9=l1o Should switch ON.<BR/>
  *     6. Test the device: AT+9=l1f Should switch OFF.<BR/>
  *     7. Connect to the power line.
  * 
  * @author Robert Gregor
  */
public class SimpleSwitchDevice extends AbstractDevice implements Serializable {
    
    /**
     * Indicates, if the swith is configured to switch on, when applied power.
     * True means ON, when applied power, false means to stay OFF.
     */
    private boolean onWhenAppliedPower = true;
    
    /**
     * Indicates the current state of the device. True means ON, false means OFF.
     */
    private boolean currentState;

    /**
     * Configured period in minutes.
     */    
    private int configuredPeriod;

    /**
     * Current counter in minutes. When the counter reach 0, the switch will turn off.
     */    
    private int currentCounter;
    
    /**
     * Configured light intensity border value.
     */    
    private int configuredLightIntensityBorderValue;

    /**
     * Current light intensity border value.
     */    
    private int currentLightIntensityBorderValue;
    
    /*
     * This is automatic scheduler
     */
    private OnOffSchedule lightSchedule = new OnOffSchedule();

    /*
     * This is true if scheduler is enabled.
     */
    private boolean enabledScheduler;
    
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
    protected SimpleSwitchDevice(RemoteHomeManager m, int deviceId, String deviceName) {
        super (m, deviceId, deviceName);
        setSubDeviceNumber("1");
        lightSchedule = new OnOffSchedule();
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
            statusResponse = m.sendCommandWithAnswer(parseDeviceIdForMultipleDevice(getDeviceId()), "l"+getSubDeviceNumber()+"s").split("\\|");
            setPowerLost(false);
            if (!statusResponse[0].equals("1s")) {
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
            currentState = true;
        } else {
            currentState = false;
        }
        if (statusResponse[3].equals("1")) {
            onWhenAppliedPower = true;
        } else {
            onWhenAppliedPower = false;
        }
        configuredPeriod = Integer.parseInt(statusResponse[4]);
        currentCounter = Integer.parseInt(statusResponse[5]);
        setConfiguredLightIntensityBorderValue(Integer.parseInt(statusResponse[6]));
        setCurrentLightIntensityBorderValue(Integer.parseInt(statusResponse[7]));
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
    
    @Override
    public String toString() {
        HashMap h = new HashMap();
        h.putAll(super.getFieldValues());
        h.put("currentState", currentState);
        h.put("currentCounter", currentCounter);    
        h.put("onWhenAppliedPower", onWhenAppliedPower);
        h.put("configuredPeriod", configuredPeriod);        
        h.put("powerLost", powerLost);
        h.put("lightSchedule", lightSchedule);
        h.put("enabledScheduler", enabledScheduler);        
        return h.toString();
    }
    /**
     * This method will switch on the device.
     * 
     * @throws RemoteHomeConnectionException if there is problem with connection
     */
    public void switchOn() throws RemoteHomeConnectionException {
        m.sendCommand(parseDeviceIdForMultipleDevice(getRealDeviceId()), "l"+getSubDeviceNumber()+"o");
        setCurrentState(true);
    }
    
    /**
     * This method will switch off the device.
     * 
     * @throws RemoteHomeConnectionException if there is problem with connection
     */
    public void switchOff() throws RemoteHomeConnectionException {
        m.sendCommand(parseDeviceIdForMultipleDevice(getRealDeviceId()), "l"+getSubDeviceNumber()+"f");
        setCurrentState(false);
    }
    
    /**
     * This method will switch on the device.
     * The device will automatically switch off after defined period of time.
     * This period could be configured using method
     * 
     * @throws RemoteHomeConnectionException if there is problem with connection
     */
    public void switchOnForConfiguredPeriod() throws RemoteHomeConnectionException {
        m.sendCommand(parseDeviceIdForMultipleDevice(getRealDeviceId()), "l"+getSubDeviceNumber()+"of");
        setCurrentState(true);
    }

    /**
     * Indicates, if the swith is configured to switch on, when applied power.
     * True means ON, when applied power, false means to stay OFF.
     * @return the onWhenAppliedPower
     */
    public boolean isOnWhenAppliedPower() {
        return onWhenAppliedPower;
    }

    /**
     * Indicates, if the swith is configured to switch on, when applied power.
     * True means ON, when applied power, false means to stay OFF.
     * @param onWhenAppliedPower the onWhenAppliedPower to set
     */
    protected void setOnWhenAppliedPower(boolean onWhenAppliedPower) {
        this.onWhenAppliedPower = onWhenAppliedPower;
        
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
     * Configured period in minutes.
     * @return the configuredPeriod
     */
    public int getConfiguredPeriod() {
        return configuredPeriod;
    }

    /**
     * Configured period in minutes.
     * @param configuredPeriod the configuredPeriod to set
     */
    protected void setConfiguredPeriod(int configuredPeriod) {
        this.configuredPeriod = configuredPeriod;
    }

    /**
     * Current counter in minutes. When the counter reach 0, the switch will turn off.
     * @return the currentCounter
     */
    public int getCurrentCounter() {
        return currentCounter;
    }

    /**
     * @return the lightSchedule
     */
    public OnOffSchedule getLightSchedule() {
        return lightSchedule;
    }

    /**
     * @param lightSchedule the lightSchedule to set
     */
    public void setLightSchedule(OnOffSchedule lightSchedule) {
        this.lightSchedule = lightSchedule;
    }

    /**
     * Current counter in minutes. When the counter reach 0, the switch will turn off.
     * @param currentCounter the currentCounter to set
     */
    protected void setCurrentCounter(int currentCounter) {
        this.currentCounter = currentCounter;
    }
    
   /**
     * This method will configure the period.
     * The device will automatically switch off after defined period of time.
     * @param period it is the timeout in minutes, till when the switch should stay on. The value should be in range (period < 0) || (period > 255), 0 - forever.
     * This period could be configured using method
     * 
     * @throws RemoteHomeConnectionException if there is problem with connection
     * @throws RemoteHomeManagerException if there is problem with the parameter value
     */
    public void configurePeriod(int period) throws RemoteHomeConnectionException, RemoteHomeManagerException {
        if ((period < 0) || (period > 255)) {
            throw new RemoteHomeManagerException("The value should be 0 - 255", RemoteHomeManagerException.WRONG_PARAMETER_VALUE);
        }
        m.sendCommand(parseDeviceIdForMultipleDevice(getRealDeviceId()), "l"+getSubDeviceNumber()+"cm="+period);
        setConfiguredPeriod(period);      
    }    
    /**
     * This method will configure the behavior of the switch, when the power is applied.
     * @param onWhenPower true, if the switch should go ON, when the power is applied. false, when it should stay off.
     * @throws RemoteHomeConnectionException if there is problem with connection
     */
    public void switchOnWhenAppliedPower(boolean onWhenPower) throws RemoteHomeConnectionException {
        if (onWhenPower) {
            m.sendCommand(parseDeviceIdForMultipleDevice(getRealDeviceId()), "l"+getSubDeviceNumber()+"co");
        } else {
            m.sendCommand(parseDeviceIdForMultipleDevice(getRealDeviceId()), "l"+getSubDeviceNumber()+"cf");
        }
        setOnWhenAppliedPower(onWhenPower);
    }

    /**
     * @return the enabledScheduler
     */
    public boolean isEnabledScheduler() {
        return this.enabledScheduler;
    }
    /**
     * @param enabledScheduler the enabledScheduler to set
     */
    public void setEnabledScheduler(boolean enabledScheduler) {
        this.enabledScheduler = enabledScheduler;
    }
    /**
     * This method will save the current state of the device to the database together with the timestamp.
     * @throws RemoteHomeManagerException if the saving fail.
     */
    protected void saveHistoryData() throws RemoteHomeManagerException {
          int expected = (isCurrentState()) ? 1 : 0;
          if (isEnabledScheduler()) {
              Boolean action = getLightSchedule().getCurrentSchedule();
              expected = action?1:0;
          }
          HistoryData history = new HistoryData();
          history.setDeviceId(getDeviceId());
          history.setDataName("ONOFF");
          history.setDataValue(((isCurrentState())?1:0)+"|"+expected);
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
            if (isEnabledScheduler()) {
                boolean action = getLightSchedule().getCurrentSchedule();
                if (action) {
                    if (!currentState) switchOn();
                } else {
                     if (currentState) switchOff();
                }
            }
        } catch (RemoteHomeManagerException e) {
            RemoteHomeManager.log.error(44,e);
        } catch (RemoteHomeConnectionException e) {
            RemoteHomeManager.log.error(45,e);
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

    /**
     * @return the configuredLightIntensityBorderValue
     */
    public int getConfiguredLightIntensityBorderValue() {
        return configuredLightIntensityBorderValue;
    }

    /**
     * @param configuredLightIntensityBorderValue the configuredLightIntensityBorderValue to set
     */
    private void setConfiguredLightIntensityBorderValue(int configuredLightIntensityBorderValue) {
        this.configuredLightIntensityBorderValue = configuredLightIntensityBorderValue;
    }

    /**
     * @return the currentLightIntensityBorderValue
     */
    public int getCurrentLightIntensityBorderValue() {
        return currentLightIntensityBorderValue;
    }

    /**
     * @param currentLightIntensityBorderValue the currentLightIntensityBorderValue to set
     */
    private void setCurrentLightIntensityBorderValue(int currentLightIntensityBorderValue) {
        this.currentLightIntensityBorderValue = currentLightIntensityBorderValue;
    }

    /**
     * @param currentLightIntensityBorderValue the currentLightIntensityBorderValue to set to the hardware device
     */
    public void configureLightIntensityBorderValue(int currentLightIntensityBorderValue) throws RemoteHomeConnectionException, RemoteHomeManagerException {
        if ((currentLightIntensityBorderValue <= 0) || (currentLightIntensityBorderValue >= 1024)) {
            throw new RemoteHomeManagerException("The value should be 0 - 1024", RemoteHomeManagerException.WRONG_PARAMETER_VALUE);
        }
        m.sendCommand(parseDeviceIdForMultipleDevice(getRealDeviceId()), "l"+getSubDeviceNumber()+"cb="+Integer.toString(currentLightIntensityBorderValue));
    }
    
    public class SimpleSwitchChartItem {
        private String xData;
        private int yData;
        private int yDataExpected;

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

        /**
         * @return the yDataExpected
         */
        public int getyDataExpected() {
            return yDataExpected;
        }

        /**
         * @param yDataExpected the yDataExpected to set
         */
        public void setyDataExpected(int yDataExpected) {
            this.yDataExpected = yDataExpected;
        }
    }
    public ArrayList generateChartItems(HistoryData[] historyData, String type) {
        ArrayList<SimpleSwitchDevice.SimpleSwitchChartItem> retArray = new ArrayList<SimpleSwitchDevice.SimpleSwitchChartItem>();
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'.000Z'");
            for (HistoryData d : historyData) {
                SimpleSwitchDevice.SimpleSwitchChartItem item = new SimpleSwitchDevice.SimpleSwitchChartItem();            
                item.setxData(df.format(d.getDataTimestamp()));
                item.setyData(Integer.parseInt(d.getDataValue().split("\\|")[0]));
                item.setyDataExpected(Integer.parseInt(d.getDataValue().split("\\|")[1]));
                retArray.add(item);
            }
            return retArray;
    }
}
