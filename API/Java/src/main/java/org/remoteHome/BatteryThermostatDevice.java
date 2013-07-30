package org.remoteHome;

/**
 *
 * pn - check weather the device is up and running (ping command)<br/>
 * o - Switch on the relay
 * f - Switch off the relay
 * s - return status 7|temperature|battery|frequency|expected temperature|relay|threshold<br/>
 * 	temperature format - 3 decimals degree celsius, e.g 233 = 23.3 or -23 = -23 or 022 = 2.2<br/>
 * 	battery voltage e.g. 29 = 2.9 or 30 3.0. Below 2.8, the hardware starts to work not correctly.<br/>
 * 	frequency - frequency in seconds to send status. Longer value, longer battery life<br/>
 * 	expected temperature - the value set with command t: 23.5 celsius = 47, or 17 celsius = 34<br/>
 * 	relay - Current state of the relay 0 - off, 1 on<br/>
 * 	threshold - Current threshold 0 - 9<br/>
 * m=nnn - set the frequency and put to the sleep mode. 1 means 10 seconds, 255 means 2550 seconds. Needs to be set to put the device to sleep mode!!!<br/>
 * 	If not set, or set to 0, then no sleep - useful for testing and configuration, but consume lot of power and battery will be quickly empty.<br/>
 * t=nnn - Expected temperature - if set, the header is running in self managed mode - each frequency period checks the current temperature, and if it is lower, open the<br/>
 *     valve and then sleep another period. The value is temperature * 2, it means, that 23.5 celsius = 47, or 17 celsius = 34.<br/>
 *     If it is set to 0, then relay is operated manually: each frequency period the relay send status, then you have 2 seconds to send l command to set the open angle of the valve.<br/>
 * r=n  -  Threshold 0 - 9. For the self managed mode, the threshold could be set. It means that relay will go off when currentTemperature + threshold / 10 > expected temperature and will<br/>
 * 	go on, when currentTemperature - threshold / 10 < expected temperature<br/>
 *<br/><br/>
 *     Quick startup:<BR/>
 *     1. Insert battery<BR/>
 *     2. Test the communication AT+0=pn<BR/>
 *     3. Assign the device ID: AT+a=9  Id is 9.<BR/><BR/>
 *     <table>
 *     <tr><td>Self managed mode</td><td>                                                                  Manual mode</td></tr>
 *     <tr><td>AT+9=t=45 set temperature in room to 22,5 celsius</td><td>                                  AT+9=t=0 manual mode, temperature is 0</td></tr>
 *     <tr><td>AT+9=r=5 set threshold to 0,5 degree celsius</td><td>                                        AT+9=m=60  sleep 10 minutes</td></tr>
 *     <tr><td>AT+9=m=60 sleep 10 minutes</td><td>                                                         After 10 minutes the status is sent, sent back the position of the relay:<br/>AT+9=o Swith relay on</td></tr>
 *     <tr><td>After 10 minutes the status is sent, you have to answer till 1 second</td><td>              </td></tr>
 *     <tr><td>AT+9=t=34 Lower the temperature for the night</td><td>                                      </td></tr>
 *     </table> 
 * 
 * @author Robert Gregor
 */
public class BatteryThermostatDevice extends AbstractDevice {

    /**
     * Current temperature
     */
    private int temperature; 

    /**
     * Expected temperature value should be set by external system in order to trigger the temperature change
     * Also the manageTemperatureAuto method should be set to true.
     */
    private int expectedTemperature;
    
    /**
     * Set this to true, if you want to set the expected temperature
     */
    private boolean manageTemperatureAuto;
    
    /**
     * Device Expected temperature already configured in the device
     */
    private int deviceExpectedTemperature;
    
    /**
     * State of the relay, true if the relay is ON
     */
    private boolean relayOn;
    
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
    private boolean manageFrequencyAuto;

    /**
     * Battery
     */
    private int battery;    

    /**
     * Threshold 0 - 9. For the self managed mode, the threshold could be set. It means that relay will go off when currentTemperature + threshold / 10 > expected temperature and will<br/>
     * go on, when currentTemperature - threshold / 10 < expected temperature<br/>
     */
    private int threshold;
    
    /**
     * Expected threshold should be set by external system in order to set the threshold to the device, as soon as the device sends the status.
     */
    private int expectedThreshold;

    /**
     * Set this to true, if you want to set the expected threshold
     */
    private boolean manageThresholdAuto;
    
    /*
     * This is true if scheduler is enabled.
     */
    private boolean enabledScheduler;

    /*
     * This is automatic scheduler
     */
    private TemperatureSchedule temperatureSchedule;   
    
    /**
     * The constructor is protected. The object should be constructed using
     * BatteryThermostatDevice device = 
     *          (BatteryThermostatDevice)remoteHomeManager.getRemoteHomeDevice(deviceId,deviceName, AbstractDevice.BatteryThermostat)
     * 
     * @param m remote manager reference
     * @param deviceId deviceId assigned to this device
     * @param deviceName device name
    **/

    protected BatteryThermostatDevice(RemoteHomeManager m, int deviceId, String deviceName) {
        super (m, deviceId, deviceName);        
    }
    
        /**
      * 
      * @param items the data from asynchronous event. Could be:
             * 7|temperature|battery|frequency|expected temperature|relay|threshold - status
      */
    @Override
    protected void manageAsynchronousCommand(String[] items) {
        if (items[0].equals("7")) {
            //This is the status
            this.setTemperature(Integer.parseInt(items[1]));
            this.setBattery(Integer.parseInt(items[2]));
            this.setFrequency(Integer.parseInt(items[3])*10); //Frequency in seconds * 10
            this.setDeviceExpectedTemperature((Integer.parseInt(items[4])*10)/2); //0.5 is one degree celsius
            if (items[5].equals("1")) {
                relayOn = true;
            } else {
                relayOn = false;                
            }
            this.setThreshold(Integer.parseInt(items[6]));
            setTimestamp(System.currentTimeMillis());
        }
        //here manage the temperature
            if (isManageTemperatureAuto() && (getDeviceExpectedTemperature() != getExpectedTemperature())) {
                // OK, set expected temperature
                new Thread(new Runnable() {
                     public void run() {
                         try {
                            Thread.sleep(10);
                            m.sendCommand(getDeviceId(),"t="+(getExpectedTemperature()*2)/10);
                            setManageTemperatureAuto(false);
                         } catch (InterruptedException e) {
                             return;
                         } catch (Exception e) {
                             e.printStackTrace();
                         }
                     }
                }).start();                                            
            } else if (isManageThresholdAuto() && (getExpectedThreshold() != getThreshold())) {
                new Thread(new Runnable() {
                     public void run() {
                         try {
                            Thread.sleep(30);
                            m.sendCommand(getDeviceId(),"r="+getExpectedThreshold());
                            setManageThresholdAuto(false);
                         } catch (InterruptedException e) {
                             return;
                         } catch (Exception e) {
                             e.printStackTrace();
                         }
                     }
                }).start();                                            
            } else if (isManageFrequencyAuto() && (getExpectedFrequency() != getFrequency())) {
                new Thread(new Runnable() {
                     public void run() {
                         try {
                            Thread.sleep(50);
                            m.sendCommand(getDeviceId(),"m="+getExpectedFrequency()/10);
                            setManageFrequencyAuto(false);
                         } catch (InterruptedException e) {
                             return;
                         } catch (Exception e) {
                             e.printStackTrace();
                         }
                     }
                }).start();                                            
            }
    }

    /**
     * Current temperature
     * @return the temperature
     */
    public int getTemperature() {
        return temperature;
    }

    /**
     * Current temperature
     * @param temperature the temperature to set
     */
    protected void setTemperature(int temperature) {
        this.temperature = temperature;
    }

    /**
     * Expected temperature value should be set by external system in order to trigger the temperature change
     * Also the manageTemperatureAuto method should be set to true.
     * @return the expectedTemperature
     */
    public int getExpectedTemperature() {
        return expectedTemperature;
    }

    /**
     * Expected temperature value should be set by external system in order to trigger the temperature change
     * Also the manageTemperatureAuto method should be set to true.
     * @param expectedTemperature the expectedTemperature to set
     */
    public void setExpectedTemperature(int expectedTemperature) throws RemoteHomeManagerException {
        if ((expectedTemperature < 0) || (expectedTemperature > 400)) {
            throw new RemoteHomeManagerException("The value should be 0 - 400", RemoteHomeManagerException.WRONG_PARAMETER_VALUE);
        }
        this.expectedTemperature = expectedTemperature;
        setManageTemperatureAuto(true);
    }

    /**
     * Set this to true, if you want to set the expected temperature
     * @return the manageTemperatureAuto
     */
    public boolean isManageTemperatureAuto() {
        return manageTemperatureAuto;
    }

    /**
     * Set this to true, if you want to set the expected temperature
     * @param manageTemperatureAuto the manageTemperatureAuto to set
     */
    public void setManageTemperatureAuto(boolean manageTemperatureAuto) {
        this.manageTemperatureAuto = manageTemperatureAuto;
    }

    /**
     * Device Expected temperature already configured in the device
     * @return the deviceExpectedTemperature
     */
    public int getDeviceExpectedTemperature() {
        return deviceExpectedTemperature;
    }

    /**
     * Device Expected temperature already configured in the device
     * @param deviceExpectedTemperature the deviceExpectedTemperature to set
     */
    protected void setDeviceExpectedTemperature(int deviceExpectedTemperature) {
        this.deviceExpectedTemperature = deviceExpectedTemperature;
    }

    /**
     * State of the relay, true if the relay is ON
     * @return the relayState
     */
    public boolean isRelayOn() {
        return relayOn;
    }

    /**
     * State of the relay, true if the relay is ON
     * @param relayOn the relayState to set
     */
    protected void setRelayOn(boolean relayOn) {
        this.relayOn = relayOn;
    }

    /**
     * Frequency in seconds
     * @return the frequency
     */
    public int getFrequency() {
        return frequency;
    }

    /**
     * Frequency in seconds
     * @param frequency the frequency to set
     */
    protected void setFrequency(int frequency) {
        this.frequency = frequency;
    }

    /**
     * Expected frequency in seconds value should be set by external system in order to trigger the value change
     * Also the manageOpenAngleAuto method should be set to true.
     * @return the expectedFrequency
     */
    public int getExpectedFrequency() {
        return expectedFrequency;
    }

    /**
     * Expected frequency in seconds value should be set by external system in order to trigger the value change
     * Also the manageOpenAngleAuto method should be set to true.
     * @param expectedFrequency the expectedFrequency to set
     * @throws RemoteHomeManagerException if the value is not between 0 - 2550
     */
    public void setExpectedFrequency(int expectedFrequency) throws RemoteHomeManagerException {
        if ((expectedFrequency < 0) || (expectedFrequency > 2550)) {
            throw new RemoteHomeManagerException("The value should be 0 - 2550", RemoteHomeManagerException.WRONG_PARAMETER_VALUE);
        }
        this.expectedFrequency = expectedFrequency;
        setManageFrequencyAuto(true);
    }

    /**
     * Set this to true, if you want to set the expected frequency
     * @return the manageFrequencyAuto
     */
    public boolean isManageFrequencyAuto() {
        return manageFrequencyAuto;
    }

    /**
     * Set this to true, if you want to set the expected frequency
     * @param manageFrequencyAuto the manageFrequencyAuto to set
     */
    public void setManageFrequencyAuto(boolean manageFrequencyAuto) {
        this.manageFrequencyAuto = manageFrequencyAuto;
    }

    /**
     * Battery
     * @return the battery
     */
    public int getBattery() {
        return battery;
    }

    /**
     * Battery
     * @param battery the battery to set
     */
    protected void setBattery(int battery) {
        this.battery = battery;
    }

    /**
     * Threshold 0 - 9. For the self managed mode, the threshold could be set. It means that relay will go off when currentTemperature + threshold / 10 > expected temperature and will<br/>
     * go on, when currentTemperature - threshold / 10 < expected temperature<br/>
     * @return the threshold
     */
    protected int getThreshold() {
        return threshold;
    }

    /**
     * Threshold 0 - 9. For the self managed mode, the threshold could be set. It means that relay will go off when currentTemperature + threshold / 10 > expected temperature and will<br/>
     * go on, when currentTemperature - threshold / 10 < expected temperature<br/>
     * @param threshold the threshold to set
     */
    protected void setThreshold(int threshold) {
        this.threshold = threshold;
    }

    /**
     * Expected threshold should be set by external system in order to set the threshold to the device, as soon as the device sends the status.
     * @return the expectedThreshold
     */
    protected int getExpectedThreshold() {
        return expectedThreshold;
    }

    /**
     * Expected threshold should be set by external system in order to set the threshold to the device, as soon as the device sends the status.
     * @param expectedThreshold the expectedThreshold to set
     * @throws RemoteHomeManagerException if the value is not in range 0 - 9
     */
    protected void setExpectedThreshold(int expectedThreshold) throws RemoteHomeManagerException {
        if ((expectedThreshold < 0) || (expectedThreshold > 9)) {
            throw new RemoteHomeManagerException("The value should be 0 - 9", RemoteHomeManagerException.WRONG_PARAMETER_VALUE);
        }
        this.expectedThreshold = expectedThreshold;
        setManageThresholdAuto(true);
    }

    /**
     * Set this to true, if you want to set the expected threshold
     * @return the manageThresholdAuto
     */
    protected boolean isManageThresholdAuto() {
        return manageThresholdAuto;
    }

    /**
     * Set this to true, if you want to set the expected threshold
     * @param manageThresholdAuto the manageThresholdAuto to set
     */
    protected void setManageThresholdAuto(boolean manageThresholdAuto) {
        this.manageThresholdAuto = manageThresholdAuto;
    }

    /**
     * @return the enabledScheduler
     */
    public boolean isEnabledScheduler() {
        return enabledScheduler;
    }

    /**
     * @param enabledScheduler the enabledScheduler to set
     */
    public void setEnabledScheduler(boolean enabledScheduler) {
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
    
    /*
     * This method is not supported for this device and will throw always RemoteHomeManagerException - NOT_SUPPORTED.
     * The status of the device is received asynchronously from the device.
     */
    public void updateDevice() throws RemoteHomeManagerException {
        throw new RemoteHomeManagerException(RemoteHomeManagerException.NOT_SUPPORTED);
    }
    /**
     * This method will start the scheduler thread to process the schedule it is not implemented.
     */
    public void startScheduling() {
        
    }
}
