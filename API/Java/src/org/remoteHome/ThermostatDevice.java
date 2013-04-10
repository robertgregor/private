package org.remoteHome;

/**
  *Thermostat<br/>
  *<br/><br/>
  *pn - check weather the device is up and runing (ping command)<br/>
  *o - Switch on the relay<br/>
  *f - Switch off the relay<br/>
  *s - return status 6|temperature|frequency|expected temperature|relay|treshold<br/>
  *	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;temperature format - 3 decimals degree celsius, e.g 233 = 23.3 or -23 = -23 or 022 = 2.2<br/>
  *	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;frequency - frequency in seconds to send status. Longer value, longer battery life<br/>
  *	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;expected temperature - the value set with command t: 23.5 celsius = 47, or 17 celsius = 34<br/>
  *	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;relay - Current state of the relay 0 - off, 1 on<br/>
  *	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;treshold - Current treshold 0 - 9<br/>
  *m=nnn - set the frequency of the notifications and relay changes. 1 means 10 seconds, 255 means 2550 seconds.<br/>
  *	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;If not set, or set to 0, then no relay changes - Manual mode<br/>
  *t=nnn - Expected temperature - if set, the header is running in self managed mode - each frequency period checks the current temperature, and if it is lower, switch on the<br/>
  *    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;relay. The value is temperature * 2, it means, that 23.5 celsius = 47, or 17 celsius = 34.<br/>
  *	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;If it is set to 0, then relay is operated manually.<br/>
  *r=n  -  Treshhold 0 - 9. For the self managed mode, the treshhold could be set. It means that relay will go off when currentTemperature + treshold / 10 > expected temperature and will<br/>
  *	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;go on, when currentTemperature - treshold / 10 < expected temperature<br/>
  *<br/><br/>
  * @author Robert Gregor<br/>
  */
public class ThermostatDevice extends AbstractDevice {

    /**
     * Current temperature
     */
    private int temperature; 
        
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
     * Threshold 0 - 9. For the self managed mode, the threshold could be set. It means that relay will go off when currentTemperature + threshold / 10 > expected temperature and will<br/>
     * go on, when currentTemperature - threshold / 10 < expected temperature<br/>
     */
    private int threshold;
        
    
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
    }
    
    /**
      * 
      * @param items the data from asynchronous event. Could be:
             * 6|temperature|frequency|expected temperature|relay|treshold 
      */
    @Override
    protected void manageAsynchronousCommand(String[] items) {
         if (items[0].equals("6")) {
            //This is the status
            this.temperature = (Integer.parseInt(items[1]));
            this.frequency = (Integer.parseInt(items[2])*10); //Frequency in seconds * 10
            this.deviceExpectedTemperature = ((Integer.parseInt(items[3])*10)/2); //0.5 is one degree celsius
            if (items[4].equals("1")) {
                relayOn = true;
            } else {
                relayOn = false;                
            }
            this.threshold = (Integer.parseInt(items[5]));
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
        String statusResponse[] = m.sendCommandWithAnswer(getDeviceId(), "s").split("\\|");
        if (!statusResponse[0].equals("6")) {
            throw new RemoteHomeManagerException("This response belongs to different device type.", RemoteHomeManagerException.WRONG_DEVICE_TYPE);
        }        
        this.setTemperature(Integer.parseInt(statusResponse[1]));
        this.setFrequency(Integer.parseInt(statusResponse[2])*10); //Frequency in seconds * 10
        this.setDeviceExpectedTemperature((Integer.parseInt(statusResponse[3])*10)/2); //0.5 is one degree celsius
        if (statusResponse[4].equals("1")) {
                relayOn = true;
        } else {
                relayOn = false;                
        }
        this.setThreshold(Integer.parseInt(statusResponse[5]));
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
     * Device Expected temperature already configured in the device
     * @return the deviceExpectedTemperature
     */
    public int getDeviceExpectedTemperature() {
        return deviceExpectedTemperature;
    }

    /**
     * Device Expected temperature already configured in the device
     * @param deviceExpectedTemperature the deviceExpectedTemperature to set
     * @throws RemoteHomeConnectionException if there is a problem with communication
     * @throws RemoteHomeManagerException if the value is not in range 0 - 400
     */
    public void setDeviceExpectedTemperature(int deviceExpectedTemperature) throws RemoteHomeConnectionException, RemoteHomeManagerException {
        if ((deviceExpectedTemperature < 0) || (deviceExpectedTemperature > 400)) {
            throw new RemoteHomeManagerException("The value should be 0 - 400", RemoteHomeManagerException.WRONG_PARAMETER_VALUE);
        }        
        m.sendCommand(getDeviceId(), "t="+(deviceExpectedTemperature*2)/10);
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
     * Set state of the relay, true if the relay should go ON
     * @param relayOn the relayState to set
     * @throws RemoteHomeConnectionException if there is a problem with communication
     */
    public void setRelayOn(boolean relayOn) throws RemoteHomeConnectionException {
        if (relayOn) {
            m.sendCommand(getDeviceId(), "o");
        } else {
            m.sendCommand(getDeviceId(), "f");
        }
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
     * @throws RemoteHomeConnectionException if there is a problem with communication
     * @throws RemoteHomeManagerException if the value is not in range 0 - 2550
     */
    public void setFrequency(int frequency) throws RemoteHomeConnectionException, RemoteHomeManagerException {
        if ((frequency < 0) || (frequency > 2550)) {
            throw new RemoteHomeManagerException("The value should be 0 - 2550", RemoteHomeManagerException.WRONG_PARAMETER_VALUE);
        }
        m.sendCommand(getDeviceId(), "m="+(frequency)/10);
        this.frequency = frequency;
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
        m.sendCommand(getDeviceId(), "r="+threshold);
        this.threshold = threshold;
    }
}
