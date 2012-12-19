package org.remoteHome;

import java.io.Serializable;

 /**
  * Simple switch<BR/>
  * 
  * pn - check weather the device is up and running (ping command).<BR/>
  * l1o - light 1 on<BR/>
  * l1of - light 1 on and off after timeout period<BR/>
  * l1f - light 1 off<BR/>
  * l1co - configure light 1 to swith on when applied power<BR/>
  * l1cf - configure light 1 to stay off when applied power<BR/>
  * l1ct=nnn - configure light 1 timeout nnn = 0 to 255 minutes (0 means forever) minutes<BR/>
  * s - return status 3|light|power|configuredTimeout|currentTimeout<BR/>
  *	light 0 off, 1 on<BR/>
  *	power 0 on when applied power, 1 stay off when applied power<BR/>
  *	onWhenMovement 1 - on when movement detected 0 no action<BR/>
  *	configuredTimeout - no of minutes, when l1 will go off, 0 forever<BR/>
  *	currentTimeout - current light 1 timeout in minutes, 0 - never switch off<BR/>
  *
  *     Quick startup:<BR/>
  *     1. Connect to the power. 110 and 220 V AC is supported<BR/>
  *     2. Test the communication AT+0=pn<BR/>
  *     3. Assign the device ID: AT+a=9  Id is 9.<BR/>
  *     4. Test the device: AT+9=s Should return back the status.<BR/>
  *     5. Test the device: AT+9=l1o Should switch ON.<BR/>
  *     6. Test the device: AT+9=l1f Should switch OFF.<BR/>
  * 
  * @author Robert Gregor
  */
public class SimpleSwitchDevice extends AbstractDevice implements Serializable {
    
    /**
     * Indicates, if the swith is configured to switch on, when applied power.
     * True means ON, when applied power, false means to stay OFF.
     */
    private boolean onWhenAppliedPower;
    
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
    }
    /**
     * For Simple switch, this method is not used.
     * 
     * @param items items returned back
     */
    
    @Override
    protected void manageAsynchronousCommand(String[] items) {
        //For this device no asynchronous command exist, leave this method empty.
    }
    
    /**
     * This method will update the values in the this object from the hardware device
     * 
     * @throws RemoteHomeConnectionException if there is a problem with communication
     * @throws RemoteHomeManagerException if the type of the device doesn't belongs to the answer received back.
     * 
     */
    public void updateDevice() throws RemoteHomeConnectionException, RemoteHomeManagerException {
        String statusResponse[] = m.sendCommandWithAnswer(getDeviceId(), "s").split("\\|");
        if (!statusResponse[0].equals("3")) {
            throw new RemoteHomeManagerException("This response belongs to different device type.", RemoteHomeManagerException.WRONG_DEVICE_TYPE);
        }
        if (statusResponse[1].equals("1")) {
            currentState = true;
        } else {
            currentState = false;
        }
        if (statusResponse[2].equals("1")) {
            onWhenAppliedPower = true;
        } else {
            onWhenAppliedPower = false;
        }
        configuredPeriod = Integer.parseInt(statusResponse[3]);
        currentCounter = Integer.parseInt(statusResponse[4]);
    }
    /**
     * This method will switch on the device.
     * 
     * @throws RemoteHomeConnectionException if there is problem with connection
     */
    public void switchOn() throws RemoteHomeConnectionException {
        m.sendCommand(getDeviceId(), "l1o");
        setCurrentState(true);
    }
    
    /**
     * This method will switch off the device.
     * 
     * @throws RemoteHomeConnectionException if there is problem with connection
     */
    public void switchOff() throws RemoteHomeConnectionException {
        m.sendCommand(getDeviceId(), "l1f");
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
        m.sendCommand(getDeviceId(), "l1of");
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
        m.sendCommand(getDeviceId(), "l1ct="+period);
        setConfiguredPeriod(period);
    }
    
    /**
     * This method will configure the behavior of the switch, when the power is applied.
     * @param onWhenPower true, if the switch should go ON, when the power is applied. false, when it should stay off.
     * @throws RemoteHomeConnectionException if there is problem with connection
     */
    public void switchOnWhenAppliedPower(boolean onWhenPower) throws RemoteHomeConnectionException {
        if (onWhenPower) {
            m.sendCommand(getDeviceId(), "l1co");
        } else {
            m.sendCommand(getDeviceId(), "l1cf");
        }
        setOnWhenAppliedPower(onWhenPower);
    }
    
}
