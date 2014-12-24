/*
Magnetic sensor sketch

Radio commands (Works only 1st minutes after the power on, if interval is not 0). Please be sure to set the interval, othervise the unit doesn't switch to sleep mode and the battery will be exhausted quickly.

s - return status 4|frequency|battery|enabled|state
	frequency - frequency in seconds to send status. Longer value, longer battery life
	battery voltage e.g. 2.9 or 3.0
        enabled - if enabled asynchronous messages ENABLED / DISABLED are sent. 0 - disabed, 1 - enabled
        state - 0 = open, 1 = closed
m=nnn - set the frequency and put to the sleep mode. 1 means 10 seconds, 254 means 2540 seconds. Needs to be set to put the device to sleep mode!!!
	If not set, or set to 0, then no sleep - usefull for testing, but consume lot of power and batery will be quicly empty.
en - enable the sensor
di - disable the sensor

pn - check weather the device is up and runing (ping command) - returns OK
nn - check weather the device is up and runing (ping command) - returns nothing - used by the transceiver to measure the RSSI.
res - reset the device
def - reset the device and place the EEPROM device to factory default

Serial commands:
at+c=XXX Configure the channel - Network. Receiver should have the same channel than all the devices. There could be channels 1 >= XXX >= 254
at+n=XXX Configure the node Id - Network. Node ID should be unique and identify the node in the network. There could be channels 1 >= XXX >= 254. The receiver has always nodeId = 255.
at+res Reset the device
at+def Reset the device and set the factory default values of EEPROM
at+memid=XXX To set the eeprom value. This command preset the address
at+memval=XXX This command set the XXX value at the position memid in the EEPROM
at+p=thisIsEncryptKey - for AES encryption, this command set the symetric key for encryption between the transceiver and the device. Should be exactly 16 characters
at+s - print the status of the device. Values are separated by \t character.
at+m=XXX - set the frequency and put to the sleep mode. 1 means 10 seconds, 254 means 2540 seconds. Needs to be set to put the device to sleep mode!!!
	   If not set, or set to 0, then no sleep - usefull for testing, but consume lot of power and batery will be quicly empty.
at+en - enable the sensor
at+di - disable the sensor

EEPROM bank
EEPROM_POSITION_NODE_ID 0 //Node Id eeprom position
EEPROM_POSITION_NETWORK_ID 1 //Node Id eeprom position
EEPROM_POSITION_KEY 2 //Node Id eeprom position
EEPROM_SENDING_STATUS_PERIOD 18 //Sending status period position eeprom position
EEPROM_SENSOR_ENABLED_FLAG 19 //Enabled / disabled
*/

package org.remoteHome;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

/**
 *
 * @author gregorro
 */
public class MagneticSensorDevice extends AbstractDevice implements Serializable {
   /**
     * Current magnet state of the sensor. 1 - opened, 0 - closed, 2 - unknown
     */
    private int magnetState; 

    /**
     * Frequency in seconds
     */
    private int frequency; 

    /**
     * Expected frequency in seconds value should be set by external system in order to trigger the value change
     * Also the manageFrequencyAuto method should be set to true.
     */
    private int expectedFrequency; 

    /**
     * Set this to true, if you want to set the expected frequency
     */
    private boolean manageFrequencyAuto = false;

    /**
     * enabled, equals to device enabled status
     */
    private boolean enabled;

    /**
     * Expected enabled should be set by external system in order to trigger the value to change.
     * Also the manageEnabledAuto should be set to true.
     */
    private boolean expectedEnabled;

    /**
     * Set this to true, if you want to set the expected enabled
     */
    private boolean manageEnabledAuto = false;
    
    /**
     * Alarm enabled should be set to true, if the alarm is enabled. If set to true, the HW device is set to true. 
     */
    private boolean alarmEnabled;

    /**
     * Switch enabled should be set to true, if the switch is enabled. In that case, each movement will switch on the defined switchDeviceId and switchSubDeviceId. If set to true, the HW device is set to true. 
     */
    private boolean switchEnabled;

    /**
     * SMTP settings
     */
    private String smtpTo = "";
    private String smtpSubject = "";
    private String smtpMessage = "";
    
    /**
     * Alarm settings
     */
    private int alarmEnterTimeout = 0;
    private int alarmLeaveTimeout = 0;
    private int alarmTimeout = 0;
    private transient int currentAlarmEnterTimeout = 0;
    private transient int currentAlarmLeaveTimeout = 0;

    /*
     * Alarm scheduler, which enable / disable the device
     */
    private OnOffSchedule alarmScheduler = new OnOffSchedule();
    
    /*
     * If this is true, alarm scheduler is enabled.
     */
    private boolean enabledAlarmScheduler;
    
    /*
     * Switch scheduler, which enable / disable the device
     */
    private OnOffSchedule switchScheduler = new OnOffSchedule();
    
    /*
     * If this is true, switch scheduler is enabled.
     */
    private boolean enabledSwitchScheduler;

    /*
     * switchDeviceId is the controlled switch device id. If not 0 and motion is detected this switch is turned on for predefined period.
     */
    private int switchDeviceId;

    /*
     * switchSubDeviceId is the controlled switch sub device id. If 0 subdevice 1 is always used.
     */
    private int switchSubDeviceId;
    
    /*
     * alarmDeviceId is the device id, which is switched on, when alarm occured. If not 0 and motion is detected this deviceId is turned on for predefined period.
     */
    private int alarmDeviceId;

    /*
     * alarmSubDeviceId is the controlled sub device id, used when alarm occured. If 0 subdevice 1 is always used.
     */
    private int alarmSubDeviceId;

    /*
     * If this is true, email alert is enabled. The email is sent first time, the intrusion arrived from sensor after the enable command
     */
    private boolean emailAlertFirstTime;

    /*
     * If this is true, email alert is enabled. The email is sent every time, the intrusion arrived from sensor.
     */
    private boolean emailAlertEveryTime;

    /*
     * If this is true, the sensor was enabled and then the movement has been detected.
     */
    private boolean intruded;

    /**
     * The constructor is protected. The object should be constructed using
     * PirSensorDevice device = 
     *          (PirSensorDevice)remoteHomeManager.getRemoteHomeDevice(deviceId,deviceName, AbstractDevice.PirSensor)
     * 
     * @param m remote manager reference
     * @param deviceId deviceId assigned to this device
     * @param deviceName device name
     **/

    protected MagneticSensorDevice(RemoteHomeManager m, int deviceId, String deviceName) {
        super (m, deviceId, deviceName);        
    }
    
    /**
     * Contains the initialization of the device.
     */
    protected void init() {
        magnetState = 2;
    }
    
    /**
      * 
      * @param items the data from asynchronous event. Could be:
      * 4|frequency|battery|enabled|state
      */
    @Override
    protected void manageAsynchronousCommand(String[] items) {
        if (items[0].equals("4")) {
            setBattery(Float.parseFloat(items[2]));
            setFrequency(Integer.parseInt(items[1]));
            if (items[3].equals("1")) enabled=true; else enabled=false;
            setMagnetState(Integer.parseInt(items[4]));
            timestamp = System.currentTimeMillis();
            try {
                saveHistoryData();
            } catch (RemoteHomeManagerException e) {
                RemoteHomeManager.log.error(241, e);
            }            
            m.notifyDeviceChange(this);
            RemoteHomeManager.log.debug("Values set. Current values: "+toString());
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
                             RemoteHomeManager.log.error(221, e);
                         }
                     }
                }).start();
            }
            if (isManageEnabledAuto()) {
                RemoteHomeManager.log.debug("Going to set new enabled state: "+isExpectedEnabled());
                new Thread(new Runnable() {
                     public void run() {
                         try {
                            if (isExpectedEnabled()) {
                                m.sendCommand(getDeviceId(),"en");
                            } else {
                                m.sendCommand(getDeviceId(),"di");
                            }
                            setManageEnabledAuto(false);
                            setEnabled(isExpectedEnabled());
                            RemoteHomeManager.log.info("New enabled state set: "+isEnabled());
                         } catch (Exception e) {
                             RemoteHomeManager.log.error(222, e);
                         }
                     }
                }).start();
            }
        } else if (items[0].equals("OPENED")) {
            this.setMagnetState(1);
            try {
               saveHistoryData();
            } catch (RemoteHomeManagerException e) {
                RemoteHomeManager.log.error(241, e);
            }
            if (isAlarmEnabled() && (currentAlarmLeaveTimeout == 0)) {
                if (!intruded) {
                    currentAlarmEnterTimeout = this.getAlarmEnterTimeout();
                    if (currentAlarmEnterTimeout == 0) currentAlarmEnterTimeout = 1;
                } else {
                    if (emailAlertEveryTime) {
                        try {
                            Properties p = m.getPersistance().loadProperties();
                            if (p != null) {
                                new Mailer().sendEmail(new Mail(smtpTo, smtpSubject, smtpMessage), p);
                                RemoteHomeManager.log.info("Email sent, because open detected and emailAlertEveryTime = true. Device: "+toString());
                            } else {
                                RemoteHomeManager.log.warning("Cannot send email, the properties file is empty. Device: "+toString());
                            }
                        } catch (Exception e) {
                            RemoteHomeManager.log.error(124,e);
                        }                        
                    }
                }
            }
            if (isSwitchEnabled()) {
                if (getSwitchDeviceId() != 0) {
                    int subDeviceId = (getSwitchSubDeviceId()==0)?1:getSwitchSubDeviceId();
                    AbstractDevice d = null;
                    try {
                        d = m.getDevice(getSwitchDeviceId());
                    } catch (RemoteHomeManagerException e) {
                        //Does not exist, OK, lets try multiple device
                        try {
                            d = m.getDevice(getSwitchDeviceId(), subDeviceId);
                        } catch (RemoteHomeManagerException ee) {}
                    }
                    if (d == null) {
                        RemoteHomeManager.log.warning("Received MOTION from device " +getDeviceName()+ ". Trying to switch ON the controlled device, but it doesnt exist in the system: "+getSwitchDeviceId()+" or: "+getSwitchDeviceId()*1000 + subDeviceId);
                    }
                    if (!(d instanceof SimpleSwitchDevice)) {
                        RemoteHomeManager.log.warning("Received MOTION from device " +getDeviceName()+ " Device "+d+" is not SimpleSwitchDevice. Cannot switch ON the controlled switch.");
                    }
                    //Switch on
                    if ((d!=null) && (d instanceof SimpleSwitchDevice)) {
                        RemoteHomeManager.log.debug("Going to switch on the device: "+d+", thus OPENED received from the device: "+this);          
                        final SimpleSwitchDevice dd = (SimpleSwitchDevice)d;
                        new Thread(new Runnable() {
                                public void run() {
                                    try {
                                        Thread.sleep(100);
                                        dd.switchOnForConfiguredPeriod();
                                        RemoteHomeManager.log.info("Device: "+dd+", switched ON, thus OPENED received from the device: "+this);
                                    } catch (Exception e) {
                                         RemoteHomeManager.log.error(222, e);
                                    }
                                }
                        }).start();
                    }
                    
                }
            }
        } else if (items[0].equals("CLOSED")) {
            this.setMagnetState(0);
            try {
                saveHistoryData();
            } catch (RemoteHomeManagerException e) {
                RemoteHomeManager.log.error(241, e);
            }            
        }
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
     * @throws RemoteHomeConnectionException if there is a problem with the connection
     */
    public void setInitialFrequency() throws RemoteHomeConnectionException {
        this.setFrequency(10);
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

    /*
     * This method is not supported for this device and will throw always RemoteHomeManagerException - NOT_SUPPORTED.
     * The status of the device is received asynchronously from the device.
     */
    public void updateDevice() throws RemoteHomeManagerException {
        throw new RemoteHomeManagerException(RemoteHomeManagerException.NOT_SUPPORTED);
    }
    /**
     * This method will save the current state of the sensor device to the database together with the enabled.
     * @throw RemoteHomeManagerException if the save fail.
     */
    protected void saveHistoryData() throws RemoteHomeManagerException {
          HistoryData history = new HistoryData();
          history.setDeviceId(getDeviceId());
          history.setDataName("MAGNETICSENSOR");
          history.setDataValue(Integer.toString(getMagnetState())+"|"+(isEnabled()?0:1)+"|"+(isAlarmEnabled()?0:1));
          history.setDataTimestamp();
          m.getPersistance().addHistoryData(history);
          RemoteHomeManager.log.debug("Saved history data: "+history.toString());    
    }

    /**
     * @return the magnetState of the sensor. 0 - opened, 1 - closed, 2 - unknown
     */
    public int getMagnetState() {
        return magnetState;
    }

    /**
     * @return true if the state of the sensor is Closed. Please note, that to return the valid value in real time, the sensor must be enabled.
     */
    public boolean isClosed() {
        return magnetState==0;
    }

    /**
     * @return true if the state of the sensor is Open. Please note, that to return the valid value in real time, the sensor must be enabled.
     */
    public boolean isOpen() {
        return magnetState==1;
    }

    /**
     * @param magnetState the magnetState to set
     */
    private void setMagnetState(int magnetState) {
        this.magnetState = magnetState;
    }

    /**
     * @return the enabled
     */
    public boolean isEnabled() {
        return enabled;
    }

    /**
     * @param enabled the enabled to set
     */
    private void setEnabled(boolean enabled) {
        this.enabled = enabled;
        if (enabled) intruded = false;
        if (!enabled) this.magnetState = 2;
        m.notifyDeviceChange(this);
    }

    /**
     * @return the expectedEnabled
     */
    public boolean isExpectedEnabled() {
        return expectedEnabled;
    }

    /**
     * @param expectedEnabled the expectedEnabled to set
     */
    public void setExpectedEnabled(boolean expectedEnabled) {
        this.expectedEnabled = expectedEnabled;
        manageEnabledAuto = true;
        if (expectedEnabled) intruded = false;
    }

    /**
     * @return the manageEnabledAuto
     */
    public boolean isManageEnabledAuto() {
        return manageEnabledAuto;
    }

    /**
     * @param manageEnabledAuto the manageEnabledAuto to set
     */
    public void setManageEnabledAuto(boolean manageEnabledAuto) {
        this.manageEnabledAuto = manageEnabledAuto;
    }

    /**
     * @return the smtpTo
     */
    public String getSmtpTo() {
        return smtpTo;
    }

    /**
     * @param smtpTo the smtpTo to set
     */
    public void setSmtpTo(String smtpTo) {
        this.smtpTo = smtpTo;
    }

    /**
     * @return the smtpSubject
     */
    public String getSmtpSubject() {
        return smtpSubject;
    }

    /**
     * @param smtpSubject the smtpSubject to set
     */
    public void setSmtpSubject(String smtpSubject) {
        this.smtpSubject = smtpSubject;
    }

    /**
     * @return the smtpMessage
     */
    public String getSmtpMessage() {
        return smtpMessage;
    }

    /**
     * @param smtpMessage the smtpMessage to set
     */
    public void setSmtpMessage(String smtpMessage) {
        this.smtpMessage = smtpMessage;
    }

    @Override
    public String toString() {
        HashMap h = new HashMap();
        h.putAll(super.getFieldValues());
        h.put("magnetState", magnetState);
        h.put("frequency", getFrequency());
        h.put("expectedFrequency", expectedFrequency);
        h.put("manageFrequencyAuto", manageFrequencyAuto);
        h.put("enabled", enabled);
        h.put("expectedEnabled", expectedEnabled);
        h.put("manageEnabledAuto", manageEnabledAuto);
        h.put("alarmEnabled", alarmEnabled);
        h.put("switchEnabled", switchEnabled);
        h.put("smtpTo", smtpTo);
        h.put("smtpSubject", smtpSubject);
        h.put("smtpMessage", smtpMessage);
        h.put("alarmScheduler", alarmScheduler);
        h.put("switchScheduler", switchScheduler);
        h.put("emailAlertFirstTime", emailAlertFirstTime);
        h.put("emailAlertEveryTime", emailAlertEveryTime);
        h.put("intruded", intruded);
        h.put("alarmEnterTimeout", alarmEnterTimeout);
        h.put("alarmLeaveTimeout", alarmLeaveTimeout);
        h.put("alarmTimeout", alarmTimeout);
        h.put("switchDeviceId", switchDeviceId);
        h.put("switchSubDeviceId", switchSubDeviceId);
        h.put("alarmDeviceId", alarmSubDeviceId);
        h.put("enabledAlarmScheduler", enabledAlarmScheduler);
        h.put("enabledSwitchScheduler", enabledSwitchScheduler);
        h.put("currentAlarmLeaveTimeout", currentAlarmLeaveTimeout);
        h.put("currentAlarmEnterTimeout", currentAlarmEnterTimeout);
        return h.toString();
    }
    /*
     * This method is called each second. Do not put inside blocking operations
    */
    protected void runEachSecond() {
        if (currentAlarmLeaveTimeout > 0) currentAlarmLeaveTimeout--;
        if (currentAlarmEnterTimeout > 0) {
            currentAlarmEnterTimeout--;
            if (currentAlarmEnterTimeout == 0) {
                if ((!intruded) && alarmEnabled) {
                    //OK, alarm still enabled send mail and swith on alarm if configured
                    RemoteHomeManager.log.info("Alarm occured from device: "+this);
                    intruded = true;
                    try {
                        if (emailAlertFirstTime) {
                            Properties p = m.getPersistance().loadProperties();
                            if (p != null) {
                                new Mailer().sendEmail(new Mail(smtpTo, smtpSubject, smtpMessage), p);
                                RemoteHomeManager.log.info("Email sent, because motion detected enter timeout = 0 and emailAlertFirstTime = true. Device: "+toString());                            
                            } else {
                                RemoteHomeManager.log.warning("Cannot send email, the properties file is empty. Device: "+toString());
                            }
                        }
                        if (getAlarmDeviceId() != 0) {
                            int subDeviceId = (getAlarmSubDeviceId()==0)?1:getAlarmSubDeviceId();
                            AbstractDevice d = null;
                            try {
                                d = m.getDevice(getAlarmDeviceId());
                            } catch (RemoteHomeManagerException e) {
                                //Does not exist, OK, lets try multiple device
                                try {
                                    d = m.getDevice(getAlarmDeviceId(), subDeviceId);
                                } catch (RemoteHomeManagerException ee) {}
                            }
                            if (d == null) {
                                RemoteHomeManager.log.warning("Cannot switch on alarm device " +getDeviceName()+ ". Trying to switch ON the alarm device, but it doesnt exist in the system: "+getSwitchDeviceId()+" or: "+getSwitchDeviceId()*1000 + subDeviceId);
                            }
                            if (!(d instanceof SimpleSwitchDevice)) {
                                RemoteHomeManager.log.warning("Cannot switch on alarm device " +getDeviceName()+ " Device "+d+" is not SimpleSwitchDevice. Cannot switch ON the alarm switch.");
                            }
                            //Switch on
                            if ((d!=null) && (d instanceof SimpleSwitchDevice)) {
                                RemoteHomeManager.log.debug("Going to switch on the alarm device: "+d);          
                                final SimpleSwitchDevice dd = (SimpleSwitchDevice)d;
                                new Thread(new Runnable() {
                                        public void run() {
                                            try {
                                                dd.switchOnForConfiguredPeriod();
                                                RemoteHomeManager.log.info("Device: "+dd+", switched ON, thus alarm occured.");
                                            } catch (Exception e) {
                                                RemoteHomeManager.log.error(223, e);
                                            }
                                        }
                                }).start();
                            }
                        }
                    } catch (Exception e) {
                        RemoteHomeManager.log.error(126,e);
                    }
                    m.notifyDeviceChange(this);
                }
            }
        }
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
            if (isEnabledAlarmScheduler()) {
                boolean action = getAlarmScheduler().getCurrentSchedule();
                if (action) {
                    if (!isAlarmEnabled()) setAlarmEnabled(true);
                } else {
                     if (isAlarmEnabled()) setAlarmEnabled(false);
                }
            }
            if (isEnabledSwitchScheduler()) {
                boolean action = getSwitchScheduler().getCurrentSchedule();
                if (action) {
                    if (!isSwitchEnabled()) setSwitchEnabled(true);
                } else {
                     if (isSwitchEnabled()) setSwitchEnabled(false);
                }
            }
        } catch (RemoteHomeManagerException e) {
            RemoteHomeManager.log.error(58,e);
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

    /**
     * @return the enabledAlarmScheduler
     */
    public boolean isEnabledAlarmScheduler() {
        return enabledAlarmScheduler;
    }

    /**
     * @param enabledAlarmScheduler the enabledAlarmScheduler to set
     */
    public void setEnabledAlarmScheduler(boolean enabledAlarmScheduler) {
        this.enabledAlarmScheduler = enabledAlarmScheduler;
        m.notifyDeviceChange(this);
    }

    /**
     * @return the alarmScheduler
     */
    public OnOffSchedule getAlarmScheduler() {
        return alarmScheduler;
    }

    /**
     * @param alarmScheduler the alarmScheduler to set
     */
    public void setAlarmScheduler(OnOffSchedule alarmScheduler) {
        this.alarmScheduler = alarmScheduler;
        m.notifyDeviceChange(this);
    }

    /**
     * @return the emailAlertFirstTime
     */
    public boolean isEmailAlertFirstTime() {
        return emailAlertFirstTime;
    }

    /**
     * @param emailAlertFirstTime the emailAlertFirstTime to set
     */
    public void setEmailAlertFirstTime(boolean emailAlertFirstTime) {
        this.emailAlertFirstTime = emailAlertFirstTime;
        m.notifyDeviceChange(this);
    }

    /**
     * @return the emailAlertEveryTime
     */
    public boolean isEmailAlertEveryTime() {
        return emailAlertEveryTime;
    }

    /**
     * @param emailAlertEveryTime the emailAlertEveryTime to set
     */
    public void setEmailAlertEveryTime(boolean emailAlertEveryTime) {
        this.emailAlertEveryTime = emailAlertEveryTime;
        m.notifyDeviceChange(this);
    }

    /**
     * @return the intruded
     */
    public boolean isIntruded() {
        return intruded;
    }

    /**
     * @return the switchScheduler
     */
    public OnOffSchedule getSwitchScheduler() {
        return switchScheduler;
    }

    /**
     * @param switchScheduler the switchScheduler to set
     */
    public void setSwitchScheduler(OnOffSchedule switchScheduler) {
        this.switchScheduler = switchScheduler;
        m.notifyDeviceChange(this);
    }

    /**
     * @return the enabledSwitchScheduler
     */
    public boolean isEnabledSwitchScheduler() {
        return enabledSwitchScheduler;
    }

    /**
     * @param enabledSwitchScheduler the enabledSwitchScheduler to set
     */
    public void setEnabledSwitchScheduler(boolean enabledSwitchScheduler) {
        this.enabledSwitchScheduler = enabledSwitchScheduler;
        m.notifyDeviceChange(this);
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
        m.notifyDeviceChange(this);
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
        m.notifyDeviceChange(this);
    }

    /**
     * @return the alarmEnabled
     */
    public boolean isAlarmEnabled() {
        return alarmEnabled;
    }

    /**
     * @param alarmEnabled the alarmEnabled to set
     */
    public void setAlarmEnabled(boolean alarmEnabled) {
        this.alarmEnabled = alarmEnabled;
        if (alarmEnabled) {
            currentAlarmLeaveTimeout = getAlarmLeaveTimeout();
            currentAlarmEnterTimeout = 0;
        }
        this.setEnabledAlarmScheduler(false);
        if (alarmEnabled) {
            setExpectedEnabled(alarmEnabled);
        } else {
            if (!switchEnabled) setExpectedEnabled(false);
        }
        m.notifyDeviceChange(this);
    }

    /**
     * @return the switchEnabled
     */
    public boolean isSwitchEnabled() {
        return switchEnabled;
    }

    /**
     * @param switchEnabled the switchEnabled to set
     */
    public void setSwitchEnabled(boolean switchEnabled) {
        this.switchEnabled = switchEnabled;
        this.setEnabledSwitchScheduler(false);
        if (switchEnabled) {
            setExpectedEnabled(switchEnabled);
        } else {
            if (!alarmEnabled) setExpectedEnabled(false);
        }
        m.notifyDeviceChange(this);
    }

    /**
     * @return the alarmDeviceId
     */
    public int getAlarmDeviceId() {
        return alarmDeviceId;
    }

    /**
     * @param alarmDeviceId the alarmDeviceId to set
     */
    public void setAlarmDeviceId(int alarmDeviceId) {
        this.alarmDeviceId = alarmDeviceId;
        m.notifyDeviceChange(this);
    }

    /**
     * @return the alarmSubDeviceId
     */
    public int getAlarmSubDeviceId() {
        return alarmSubDeviceId;
    }

    /**
     * @param alarmSubDeviceId the alarmSubDeviceId to set
     */
    public void setAlarmSubDeviceId(int alarmSubDeviceId) {
        this.alarmSubDeviceId = alarmSubDeviceId;
        m.notifyDeviceChange(this);
    }

    /**
     * @return the alarmEnterTimeout
     */
    public int getAlarmEnterTimeout() {
        return alarmEnterTimeout;
    }

    /**
     * @param alarmEnterTimeout the alarmEnterTimeout to set
     */
    public void setAlarmEnterTimeout(int alarmEnterTimeout) {
        this.alarmEnterTimeout = alarmEnterTimeout;
        m.notifyDeviceChange(this);
    }

    /**
     * @return the alarmLeaveTimeout
     */
    public int getAlarmLeaveTimeout() {
        return alarmLeaveTimeout;
    }

    /**
     * @param alarmLeaveTimeout the alarmLeaveTimeout to set
     */
    public void setAlarmLeaveTimeout(int alarmLeaveTimeout) {
        this.alarmLeaveTimeout = alarmLeaveTimeout;
        m.notifyDeviceChange(this);
    }

    /**
     * @return the alarmTimeout
     */
    public int getAlarmTimeout() {
        return alarmTimeout;
    }

    /**
     * @param alarmTimeout the alarmTimeout to set
     */
    public void setAlarmTimeout(int alarmTimeout) {
        this.alarmTimeout = alarmTimeout;
        m.notifyDeviceChange(this);
    }
    
    public float getLowBatteryLimit() {
        return 2.8f;
    }

    public class MagneticSensorChartItem {
        private String xData;
        private int yData;
        private int yDataSensorEnabled;
        private int yDataAlarmEnabled;

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
         * @return the yDataSensorEnabled
         */
        public int getyDataSensorEnabled() {
            return yDataSensorEnabled;
        }

        /**
         * @param yDataSensorEnabled the yDataSensorEnabled to set
         */
        public void setyDataSensorEnabled(int yDataSensorEnabled) {
            this.yDataSensorEnabled = yDataSensorEnabled;
        }

        /**
         * @return the yDataAlarmEnabled
         */
        public int getyDataAlarmEnabled() {
            return yDataAlarmEnabled;
        }

        /**
         * @param yDataAlarmEnabled the yDataAlarmEnabled to set
         */
        public void setyDataAlarmEnabled(int yDataAlarmEnabled) {
            this.yDataAlarmEnabled = yDataAlarmEnabled;
        }
    }
    public ArrayList generateChartItems(HistoryData[] historyData, String type) {
        ArrayList<MagneticSensorDevice.MagneticSensorChartItem> retArray = new ArrayList<MagneticSensorDevice.MagneticSensorChartItem>();
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'.000Z'");
            for (HistoryData d : historyData) {
                MagneticSensorDevice.MagneticSensorChartItem item = new MagneticSensorDevice.MagneticSensorChartItem();            
                item.setxData(df.format(d.getDataTimestamp()));
                item.setyData(Integer.parseInt(d.getDataValue().split("\\|")[0]));
                item.setyDataSensorEnabled(Integer.parseInt(d.getDataValue().split("\\|")[1]));
                item.setyDataAlarmEnabled(Integer.parseInt(d.getDataValue().split("\\|")[2]));
                retArray.add(item);
            }
            return retArray;
    }
}
