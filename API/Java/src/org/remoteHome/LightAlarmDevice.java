package org.remoteHome;

import java.io.Serializable;

/**
  * Light/Alarm controller<BR/><BR/>
  * 
  * ala - alarm On In this mode the sensor will notify the Computer one time about the intrusion<BR/>
  * ald - alarm deactivation<BR/>
  * alce=nnn - alarm configuration enter alarm timeout nnn = 0 to 255 seconds<BR/>
  * alcl=nnn - alarm configuration leave alarm timeout nnn = 0 to 255 seconds<BR/>
  * <BR/>
  * l1o - light 1 on<BR/>
  * l1of - light 1 on and off after timeout period<BR/>
  * l1f - light 1 off<BR/>
  * l1co - configure light 1 to swith on when applied power<BR/>
  * l1cf - configure light 1 to stay off when applied power<BR/>
  * l1cd - configure light 1 to switch on when movement detected<BR/>
  * l1cc - cancel light 1 to switch on when movement detected<BR/>
  * l1ct=nnn - configure light 1 timeout nnn = 0 to 255 minutes (0 means forewer) minutes<BR/>
  * pn - check weather the device is up and runing (ping command)<BR/>
  * sa - return status 1|a|Alarm|sensor|alenter|alleave<BR/>
  * 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Alarm 0 disabled, 1 enabled, 2 activated, 3 leave timeout running, 4 enter timeout running<BR/>
  * 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sensor - 0 nothing detected, 1 detected<BR/>
  * 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;alenter - enter alarm timeout in seconds<BR/>
  * 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;alleave - leave alarm timeout in seconds<BR/>
  * sc - return status 1|c|light|power|onWhenMovement|configuredTimeout|currentTimeout<BR/>
  * 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;light 0 off, 1 on<BR/>
  * 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;power 0 on when applied power, 1 stay off when applied power<BR/>
  * 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;onWhenMovement 1 - on when movement detected 0 no action<BR/>
  * 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;configuredTimeout - no of minutes, when l1 will go off, 0 forewer<BR/>
  * 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;currentTimeout - current light 1 timeout in minutes, 0 - never switch off<BR/><BR/>
  * @author Robert Gregor
  */
public class LightAlarmDevice  extends SimpleSwitchDevice implements Serializable {
    
    
    
    /**
     * Indicates, if the swith is configured to switch on, when movement detected.
     * True means switch ON, when movement detected and stay defined configured period ON, then switch off, false means to stay OFF.
     */
    private boolean onWhenMovementDetected;
    
    /**
     * Listener to receive the asynchronous alarm event
     */
    private LightAlarmDeviceListener alarmListener;

   /**
     * Status of the alarm
     */
    private int alarmStatus;
    
   /**
     * Current state of the alarm sensor
     */
    private boolean alarmSensorCurrentState;
    
   /**
     * Current enter alarm timeout
     */
    private int alarmEnterTimeout;

   /**
     * Current leave alarm timeout
     */
    private int alarmLeaveTimeout;

    /**
     * The constructor is protected. The object should be constructed using
     * TemperatureSensorDevice device = 
     *          (TemperatureSensorDevice)remoteHomeManager.getRemoteHomeDevice(deviceId,deviceName, AbstractDevice.TemperatureSensor)
     * 
     * @param m remote manager reference
     * @param deviceId deviceId assigned to this device
     * @param deviceName device name
     */
    protected LightAlarmDevice(RemoteHomeManager m, int deviceId, String deviceName) {
        super (m, deviceId, deviceName);        
    }
    
   /**
     * For LightAlarm device, this method is not used.
     * 
     * @param items returned back
     */    
    @Override
    protected void manageAsynchronousCommand(String[] items) {
        //Manage alarm event received
        if (items[0].equals("ALARM")) {
            if (alarmListener != null) {
                alarmListener.alarmFired();
            }
        }
    }
    
   /**
     * This method will update the values in the this object from the hardware device
     * 
     * @throws RemoteHomeConnectionException if there is a problem with communication
     * @throws RemoteHomeManagerException if the type of the device doesn't belongs to the answer received back.
     * 
     */
    @Override
    public void updateDevice() throws RemoteHomeConnectionException, RemoteHomeManagerException {
        String[] statusResponse = m.sendCommandWithAnswer(getDeviceId(), "sc").split("\\|");
        if (!statusResponse[0].equals("1")) {
            throw new RemoteHomeManagerException("This response belongs to different device type.", RemoteHomeManagerException.WRONG_DEVICE_TYPE);
        }
        if (statusResponse[1].equals("c")) {
            if (statusResponse[2].equals("1")) {
                setCurrentState(true);
            } else {
                setCurrentState(false);
            }
            if (statusResponse[3].equals("1")) {
                setOnWhenAppliedPower(true);
            } else {
                setOnWhenAppliedPower(false);
            }
            if (statusResponse[4].equals("1")) {
                setOnWhenMovementDetected(true);
            } else {
                setOnWhenMovementDetected(false);
            }
            setConfiguredPeriod(Integer.parseInt(statusResponse[5]));
            setCurrentCounter(Integer.parseInt(statusResponse[6]));            
        }
        statusResponse = m.sendCommandWithAnswer(getDeviceId(), "sa").split("\\|");
        if (!statusResponse[0].equals("1")) {
            throw new RemoteHomeManagerException("This response belongs to different device type.", RemoteHomeManagerException.WRONG_DEVICE_TYPE);
        }
        if (statusResponse[1].equals("a")) {
            setAlarmStatus(Integer.parseInt(statusResponse[2]));            
            if (statusResponse[3].equals("1")) {
                setAlarmSensorCurrentState(true);
            } else {
                setAlarmSensorCurrentState(false);
            }            
            setAlarmEnterTimeout(Integer.parseInt(statusResponse[4]));
            setAlarmLeaveTimeout(Integer.parseInt(statusResponse[5]));            
        }
    }
    /**
     * This method will switch ON the alarm sensor. In this mode, the user will be notified about the intrusion of the alarm
     * using setAlarmListener(LightAlarmDeviceListener alarmListener). Actually the method alarmFired() of this listener is called by the API.
     * It is called only one time.
     */
    public void alarmOn() throws RemoteHomeConnectionException {
        m.sendCommand(getDeviceId(), "ala");
        setAlarmStatus(AlarmStatus.ALARM_ENABLED);
    }
    /**
     * This method will switch Off the alarm sensor. In this mode ALARM event is not send to the API.
     */
    public void alarmOff() throws RemoteHomeConnectionException {
        m.sendCommand(getDeviceId(), "ald");
        setAlarmStatus(AlarmStatus.ALARM_DISABLED);
    }

   /**
     * This method will configure the leave alarm timeout.
     * This is the period of time, when the sensor is in the status AlarmStatus.LEAVE_TIMEOUT_RUNNING. In this state, the alarm doesn't notify the API.
     * After this period, the alarm is in the status AlarmStatus.ALARM_ENABLED, it means ready for detection. And if someone is in the range of the sensor,
     * the API is notified.
     * @param period it is the timeout in seconds. The value should be in range (period < 0) || (period > 255).
     * 
     * @throws RemoteHomeConnectionException if there is problem with connection
     * @throws RemoteHomeManagerException if there is problem with the parameter value
     */
    public void configureAlarmLeaveTimeout(int period) throws RemoteHomeConnectionException, RemoteHomeManagerException {
        if ((period < 0) || (period > 255)) {
            throw new RemoteHomeManagerException("The value should be 0 - 255", RemoteHomeManagerException.WRONG_PARAMETER_VALUE);
        }
        m.sendCommand(getDeviceId(), "alcl="+period);
        setAlarmLeaveTimeout(period);
    }
    
   /**
     * This method will configure the enter alarm timeout.
     * This is the period of time, when the sensor is in the status AlarmStatus.ENTER_TIMEOUT_RUNNING. In this state, the alarm doesn't notify the API.
     * Before this period, the alarm is in the status AlarmStatus.ALARM_ENABLED. Then intrusion is detected and based on this the alarm jumps to the state
     * AlarmStatus.ENTER_TIMEOUT_RUNNING
     * the API is notified.
     * @param period it is the timeout in seconds. The value should be in range (period < 0) || (period > 255).
     * 
     * @throws RemoteHomeConnectionException if there is problem with connection
     * @throws RemoteHomeManagerException if there is problem with the parameter value
     */
    public void configureAlarmEnterTimeout(int period) throws RemoteHomeConnectionException, RemoteHomeManagerException {
        if ((period < 0) || (period > 255)) {
            throw new RemoteHomeManagerException("The value should be 0 - 255", RemoteHomeManagerException.WRONG_PARAMETER_VALUE);
        }
        m.sendCommand(getDeviceId(), "alce="+period);
        setAlarmEnterTimeout(period);
    }
    
    /**
     * Indicates, if the swith is configured to switch on, when movement detected.
     * True means switch ON, when movement detected and stay defined configured period ON, then switch off, false means to stay OFF.
     * @return the onWhenMovement
     */
    public boolean isOnWhenMovementDetected() {
        return onWhenMovementDetected;
    }

    /**
     * Indicates, if the swith is configured to switch on, when movement detected.
     * True means switch ON, when movement detected and stay defined configured period ON, then switch off, false means to stay OFF.
     * @param onWhenMovementDetected the onWhenMovementDetected to set
     */
    protected void setOnWhenMovementDetected(boolean onWhenMovementDetected) {
        this.onWhenMovementDetected = onWhenMovementDetected;
    }

    /**
     * Status of the alarm
     * @return the alarmStatus
     */
    public int getAlarmStatus() {
        return alarmStatus;
    }

    /**
     * Status of the alarm
     * @param alarmStatus the alarmStatus to set
     */
    protected void setAlarmStatus(int alarmStatus) {
        this.alarmStatus = alarmStatus;
    }

    /**
     * Enter timeout value
     * @return the alarmEnterTimeout
     */
    public int getAlarmEnterTimeout() {
        return alarmEnterTimeout;
    }

    /**
     * Enter timeout value
     * @param alarmEnterTimeout the alarmEnterTimeout to set
     */
    protected void setAlarmEnterTimeout(int alarmEnterTimeout) {
        this.alarmEnterTimeout = alarmEnterTimeout;
    }

    /**
     * Leave timeout value
     * @return the alarmLeaveTimeout
     */
    public int getAlarmLeaveTimeout() {
        return alarmLeaveTimeout;
    }

    /**
     * Leave timeout value
     * @param alarmLeaveTimeout the alarmLeaveTimeout to set
     */
    protected void setAlarmLeaveTimeout(int alarmLeaveTimeout) {
        this.alarmLeaveTimeout = alarmLeaveTimeout;
    }

    /**
     * Listener to receive the asynchronous alarm event
     * @return the alarmListener
     */
    public LightAlarmDeviceListener getAlarmListener() {
        return alarmListener;
    }

    /**
     * Listener to receive the asynchronous alarm event
     * @param alarmListener the alarmListener to set
     */
    public void setAlarmListener(LightAlarmDeviceListener alarmListener) {
        this.alarmListener = alarmListener;
    }

    /**
     * Status of the alarm
     * @return the alarmSensorCurrentState
     */
    public boolean getAlarmSensorCurrentState() {
        return alarmSensorCurrentState;
    }

    /**
     * Status of the alarm
     * @param alarmSensorCurrentState the alarmSensorCurrentState to set
     */
    protected void setAlarmSensorCurrentState(boolean alarmSensorCurrentState) {
        this.alarmSensorCurrentState = alarmSensorCurrentState;
    }
}
