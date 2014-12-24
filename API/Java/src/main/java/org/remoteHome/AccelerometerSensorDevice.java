/*
Accelerometer sensor sketch

Radio commands (Works only 1st minutes after the power on, if interval is not 0). Please be sure to set the interval, othervise the unit doesn't switch to sleep mode and the battery will be exhausted quickly.

s - return status 9|battery|enableMotion|enableOrientation|frequency|accelerationX|accelerationY|accelerationZ|ORIENTATION|BACK|ZTILTLOCKOUT
	battery voltage e.g. 2.9 or 3.0
        enableMotion 0 - disable motion detection, 1 enable motion detection. If motionEnabled, asychronous messages MOTION|X|Y|Z is sent when any motion happen.
        enableOrientation 0 - disable orientation detection, 1 enable orientation detection. If motionEnabled, asychronous messages ORIENTATION|BACK|ZTILTLOCKOUT is sent when any orientation change happen.
	frequency - frequency in seconds to send status. Longer value, longer battery life
        accelerationX|accelerationY|accelerationZ - is the G of the movement in axis X Y Z. The values are float, decimal separator is "."
        ORIENTATION - current orientation. Could be: PU, PD, LR, LL
        BACK - orientation back or normal. Could be: B, N 
        ZTILTLOCKOUT - orientation back or normal. Could be: Z, N
m=nnn - set the frequency and put to the sleep mode. 1 means 10 seconds, 254 means 2540 seconds. Needs to be set to put the device to sleep mode!!!
	If not set, or set to 0, then no sleep - usefull for testing, but consume lot of power and batery will be quicly empty.
enmot - enable motion detection mode. If the orientation detection mode is set, then it is disabled.
enori - enable orientation detection mode. If the motion detection mode is set, then it is disabled.
di    - disable the detection mode.

Asynchronous messages:
MOTION|X|Y|Z is sent, wnem motion happens. X Y Z is the G of the movement in axis X Y Z
ORIENTATION|BACK|ZTILTLOCKOUT is sent, when orientation change. Possible values:
                            ORIENTATION:
               			"PU" - portrait up
       			        "PD" - portrait down
       		        	"LR" - landscape right
              			"LL" - landscape left
                            BACK:
                                "B" - back
                                "N" - normal
                            ZTILTLOCKOUT:
                                "Z" - ztiltlockout
                                "N" - normal

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

EEPROM bank
EEPROM_POSITION_NODE_ID 1006 //Node Id eeprom position
EEPROM_POSITION_NETWORK_ID 1007 //Node Id eeprom position
EEPROM_POSITION_KEY 1008 //Node Id eeprom position
EEPROM_SENDING_STATUS_PERIOD 18 //Sending status period position eeprom position
EEPROM_ENABLE_ORIENTATION 19 //Enable orientation change eeprom position
EEPROM_ENABLE_MOTION 20 //Enable motion detection mode eeprom position
*/

package org.remoteHome;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

public class AccelerometerSensorDevice extends AbstractDevice implements Serializable {
    
    /**
     * Last received acceleration X
     */
    private float lastAccelerationX; 

    /**
     * Last received acceleration Y
     */
    private float lastAccelerationY; 
    
    /**
     * Last received acceleration Z
     */
    private float lastAccelerationZ;
    
    /**
     * Orientation enumeration types
     */
    public enum Orientation {PORTRAITUP, PORTRAITDOWN, LANDSCAPERIGHT, LANDSCAPELEFT, PORTRAITUPBACK, PORTRAITDOWNBACK, LANDSCAPERIGHTBACK, LANDSCAPELEFTBACK, PORTRAITUPZTILT, PORTRAITDOWNZTILT, LANDSCAPERIGHTZTILT, LANDSCAPELEFTZTILT, PORTRAITUPBACKZTILT, PORTRAITDOWNBACKZTILT, LANDSCAPERIGHTBACKZTILT, LANDSCAPELEFTBACKZTILT};

    /**
     * Orientation
     */
    private Orientation orientation;

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
    private boolean manageFrequencyAuto;

    /**
     * motionEnabled, equals to device motionEnabled status
     */
    private boolean motionEnabled;

    /**
     * expectedMotionEnabled should be set by external system in order to trigger the value to change.
     * Also the manageMotionEnabledAuto should be set to true.
     */
    private boolean expectedMotionEnabled;

    /**
     * Set this to true, if you want to set the expected motionEnabled
     */
    private boolean manageMotionEnabledAuto;
    
    /**
     * orientationEnabled, equals to device orientationEnabled status
     */
    private boolean orientationEnabled;

    /**
     * expectedOrientationEnabled should be set by external system in order to trigger the value to change.
     * Also the manageOrientationEnabledAuto should be set to true.
     */
    private boolean expectedOrientationEnabled;

    /**
     * Set this to true, if you want to set the expected orientationEnabled
     */
    private boolean manageOrientationEnabledAuto;

    /**
     * Alarm motionEnabled should be set to true, if the alarm is motionEnabled. If set to true, the HW device is set to true. 
     */
    private boolean alarmEnabled;

    /**
     * Switch motionEnabled should be set to true, if the switch is motionEnabled. In that case, each movement will switch on the defined switchDeviceId and switchSubDeviceId. If set to true, the HW device is set to true. 
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
     * If this is true, alarm scheduler is motionEnabled.
     */
    private boolean enabledAlarmScheduler;
    
    /*
     * Switch scheduler, which enable / disable the device
     */
    private OnOffSchedule switchScheduler = new OnOffSchedule();
    
    /*
     * If this is true, switch scheduler is motionEnabled.
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
     * If this is true, email alert is motionEnabled. The email is sent first time, the intrusion arrived from sensor after the enable command
     */
    private boolean emailAlertFirstTime;

    /*
     * If this is true, email alert is motionEnabled. The email is sent every time, the intrusion arrived from sensor.
     */
    private boolean emailAlertEveryTime;

    /*
     * If this is true, the sensor was motionEnabled and then the movement has been detected.
     */
    private boolean intruded;

    /**
     * The constructor is protected. The object should be constructed using
     * AccelerometerSensorDevice device = 
     *          (AccelerometerSensorDevice)remoteHomeManager.getRemoteHomeDevice(deviceId,deviceName, AbstractDevice.AccelerometerSensorDevice)
     * 
     * @param m remote manager reference
     * @param deviceId deviceId assigned to this device
     * @param deviceName device name
     **/

    protected AccelerometerSensorDevice(RemoteHomeManager m, int deviceId, String deviceName) {
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
      * 9|battery|enableMotion|enableOrientation|frequency|accelerationX|accelerationY|accelerationZ|ORIENTATION|BACK|ZTILTLOCKOUT
      */
    @Override
    protected void manageAsynchronousCommand(String[] items) {
        if (items[0].equals("9")) {
            setBattery(Float.parseFloat(items[1]));
            setMotionEnabled(items[2].equals("1"));
            setOrientationEnabled(items[3].equals("1"));
            setFrequency(Integer.parseInt(items[4]));
            setLastAccelerationX(Float.parseFloat(items[5]));
            setLastAccelerationY(Float.parseFloat(items[6]));
            setLastAccelerationZ(Float.parseFloat(items[7]));
            setOrientation(items[8], items[9], items[10]);
            timestamp = System.currentTimeMillis();
            RemoteHomeManager.log.debug("Values set. Current values: "+toString());
            try {
                saveHistoryData();
                saveOrientationHistoryData();
            } catch (RemoteHomeManagerException e) {
                RemoteHomeManager.log.error(241, e);
            }
            m.notifyDeviceChange(this);
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
            if (isManageMotionEnabledAuto()) {
                RemoteHomeManager.log.debug("Going to set new motion enabled state: "+isExpectedMotionEnabled());
                new Thread(new Runnable() {
                     public void run() {
                         try {
                            if (isExpectedMotionEnabled()) {
                                m.sendCommand(getDeviceId(),"enmot");                                
                            } else {
                                m.sendCommand(getDeviceId(),"di");
                            }
                            setManageMotionEnabledAuto(false);
                            setMotionEnabled(isExpectedMotionEnabled());
                            setOrientationEnabled(false);
                            RemoteHomeManager.log.info("New motion enabled state set: "+isMotionEnabled());
                         } catch (Exception e) {
                             RemoteHomeManager.log.error(222, e);
                         }
                     }
                }).start();
            }
            if (isManageOrientationEnabledAuto()) {
                RemoteHomeManager.log.debug("Going to set new orientation enabled state: "+isExpectedOrientationEnabled());
                new Thread(new Runnable() {
                     public void run() {
                         try {
                            if (isExpectedOrientationEnabled()) {
                                m.sendCommand(getDeviceId(),"enori");
                            } else {
                                m.sendCommand(getDeviceId(),"di");
                            }
                            setManageOrientationEnabledAuto(false);
                            setOrientationEnabled(isExpectedOrientationEnabled());
                            setMotionEnabled(false);
                            RemoteHomeManager.log.info("New orientation enabled state set: "+isOrientationEnabled());
                         } catch (Exception e) {
                             RemoteHomeManager.log.error(222, e);
                         }
                     }
                }).start();
            }
        } else if (items[0].equals("MOTION") || items[0].equals("ORIENTATION")) {
            setLastAccelerationX(Float.parseFloat(items[1]));
            setLastAccelerationY(Float.parseFloat(items[2]));
            setLastAccelerationZ(Float.parseFloat(items[3]));
            setOrientation(items[4], items[5], items[6]);
            try {
                saveHistoryData();
                saveOrientationHistoryData();
            } catch (RemoteHomeManagerException e) {
                RemoteHomeManager.log.error(242, e);
            }
            if (isAlarmEnabled() && (getCurrentAlarmLeaveTimeout() == 0)) {
                if (!intruded) {
                    setCurrentAlarmEnterTimeout(this.getAlarmEnterTimeout());
                    if (getCurrentAlarmEnterTimeout() == 0) setCurrentAlarmEnterTimeout(1);
                } else {
                    if (emailAlertEveryTime) {
                        try {
                            Properties p = m.getPersistance().loadProperties();
                            if (p != null) {
                                String msg = smtpMessage.
                                        replaceAll("\\{X\\}", Float.toString(getLastAccelerationX())).
                                        replaceAll("\\{Y\\}", Float.toString(getLastAccelerationY())).
                                        replaceAll("\\{Z\\}", Float.toString(getLastAccelerationZ())).
                                        replaceAll("\\{ORIENTATION\\}", getOrientation().toString());
                                new Mailer().sendEmail(new Mail(smtpTo, smtpSubject, msg), p);
                                RemoteHomeManager.log.info("Email sent, because motion detected and emailAlertEveryTime = true. Device: "+toString());
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
                        RemoteHomeManager.log.warning("Received MOTION/ORIENTATION from device " +getDeviceName()+ ". Trying to switch ON the controlled device, but it doesnt exist in the system: "+getSwitchDeviceId()+" or: "+getSwitchDeviceId()*1000 + subDeviceId);
                    }
                    if (!(d instanceof SimpleSwitchDevice)) {
                        RemoteHomeManager.log.warning("Received MOTION/ORIENTATION from device " +getDeviceName()+ " Device "+d+" is not SimpleSwitchDevice. Cannot switch ON the controlled switch.");
                    }
                    //Switch on
                    if ((d!=null) && (d instanceof SimpleSwitchDevice)) {
                        RemoteHomeManager.log.debug("Going to switch on the device: "+d+", thus MOTION received from the device: "+this);          
                        final SimpleSwitchDevice dd = (SimpleSwitchDevice)d;
                        if (!dd.isCurrentState()) {
                            new Thread(new Runnable() {
                                public void run() {
                                    try {
                                        Thread.sleep(100);
                                        dd.switchOnForConfiguredPeriod();
                                        RemoteHomeManager.log.info("Device: "+dd+", switched ON, thus MOTION received from the device: "+this);
                                    } catch (Exception e) {
                                         RemoteHomeManager.log.error(222, e);
                                    }
                                }
                            }).start();
                        }
                    }
                    
                }
            }
            m.notifyDeviceChange(this);
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
     * This method will save the current acceleration state of the sensor device to the database.
     * @throw RemoteHomeManagerException if the save fail.
     */
    protected void saveHistoryData() throws RemoteHomeManagerException {
          HistoryData history = new HistoryData();
          history.setDeviceId(getDeviceId());
          history.setDataName("ACCELERATION");
          history.setDataValue(this.getLastAccelerationX()+"|"+this.getLastAccelerationY()+"|"+this.getLastAccelerationZ());
          history.setDataTimestamp();
          m.getPersistance().addHistoryData(history);
          RemoteHomeManager.log.debug("Saved motion history data. "+history.getDataName()+": "+history.getDataValue());
    }
    /**
     * This method will save the current orientation state of the sensor device to the database together with the motionEnabled.
     * @throw RemoteHomeManagerException if the save fail.
     */
    protected void saveOrientationHistoryData() throws RemoteHomeManagerException {
          HistoryData history = new HistoryData();
          history.setDeviceId(getDeviceId());
          history.setDataName("ORIENTATION");
          history.setDataValue(this.getOrientation().toString());
          history.setDataTimestamp();
          m.getPersistance().addHistoryData(history);
          RemoteHomeManager.log.debug("Saved orientation history data. "+history.getDataName()+": "+history.getDataValue());
    }
    /**
     * @return the motionEnabled
     */
    public boolean isMotionEnabled() {
        return motionEnabled;
    }

    /**
     * @param motionEnabled the motionEnabled to set
     */
    private void setMotionEnabled(boolean motionEnabled) {
        this.motionEnabled = motionEnabled;
    }

    /**
     * @return the expectedMotionEnabled
     */
    public boolean isExpectedMotionEnabled() {
        return expectedMotionEnabled;
    }

    /**
     * @param expectedMotionEnabled the expectedMotionEnabled to set
     */
    public void setExpectedMotionEnabled(boolean expectedMotionEnabled) {
        this.expectedMotionEnabled = expectedMotionEnabled;
        setManageMotionEnabledAuto(true);
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

    /**
     * @return the lastAccelerationX
     */
    public float getLastAccelerationX() {
        return lastAccelerationX;
    }

    /**
     * @param lastAccelerationX the lastAccelerationX to set
     */
    protected void setLastAccelerationX(float lastAccelerationX) {
        this.lastAccelerationX = lastAccelerationX;
    }

    /**
     * @return the lastAccelerationY
     */
    public float getLastAccelerationY() {
        return lastAccelerationY;
    }

    /**
     * @param lastAccelerationY the lastAccelerationY to set
     */
    protected void setLastAccelerationY(float lastAccelerationY) {
        this.lastAccelerationY = lastAccelerationY;
    }

    /**
     * @return the lastAccelerationZ
     */
    public float getLastAccelerationZ() {
        return lastAccelerationZ;
    }

    /**
     * @param lastAccelerationZ the lastAccelerationZ to set
     */
    protected void setLastAccelerationZ(float lastAccelerationZ) {
        this.lastAccelerationZ = lastAccelerationZ;
    }

    /**
     * @return the orientation
     */
    public Orientation getOrientation() {
        return orientation;
    }

    /**
     * @param orientation the orientation to set
     */
    protected void setOrientation(Orientation orientation) {
        this.orientation = orientation;
    }

    /**
     * @param orientation the orientation to set
     */
    protected void setOrientation(String orientation, String back, String ztilt) {
        if (orientation.equals("PU") && back.equals("N") && ztilt.equals("N")) setOrientation(Orientation.PORTRAITUP);
        if (orientation.equals("PD") && back.equals("N") && ztilt.equals("N")) setOrientation(Orientation.PORTRAITDOWN);
        if (orientation.equals("LR") && back.equals("N") && ztilt.equals("N")) setOrientation(Orientation.LANDSCAPERIGHT);
        if (orientation.equals("LL") && back.equals("N") && ztilt.equals("N")) setOrientation(Orientation.LANDSCAPELEFT);
        if (orientation.equals("PU") && back.equals("N") && ztilt.equals("Z")) setOrientation(Orientation.PORTRAITUPZTILT);
        if (orientation.equals("PD") && back.equals("N") && ztilt.equals("Z")) setOrientation(Orientation.PORTRAITDOWNZTILT);
        if (orientation.equals("LR") && back.equals("N") && ztilt.equals("Z")) setOrientation(Orientation.LANDSCAPERIGHTZTILT);
        if (orientation.equals("LL") && back.equals("N") && ztilt.equals("Z")) setOrientation(Orientation.LANDSCAPELEFTZTILT);
        if (orientation.equals("PU") && back.equals("B") && ztilt.equals("N")) setOrientation(Orientation.PORTRAITUPBACK);
        if (orientation.equals("PD") && back.equals("B") && ztilt.equals("N")) setOrientation(Orientation.PORTRAITDOWNBACK);
        if (orientation.equals("LR") && back.equals("B") && ztilt.equals("N")) setOrientation(Orientation.LANDSCAPERIGHTBACK);
        if (orientation.equals("LL") && back.equals("B") && ztilt.equals("N")) setOrientation(Orientation.LANDSCAPELEFTBACK);
        if (orientation.equals("PU") && back.equals("B") && ztilt.equals("Z")) setOrientation(Orientation.PORTRAITUPBACKZTILT);
        if (orientation.equals("PD") && back.equals("B") && ztilt.equals("Z")) setOrientation(Orientation.PORTRAITDOWNBACKZTILT);
        if (orientation.equals("LR") && back.equals("B") && ztilt.equals("Z")) setOrientation(Orientation.LANDSCAPERIGHTBACKZTILT);
        if (orientation.equals("LL") && back.equals("B") && ztilt.equals("Z")) setOrientation(Orientation.LANDSCAPELEFTBACKZTILT);
    }
    
    @Override
    public String toString() {
        HashMap h = new HashMap();
        h.putAll(super.getFieldValues());
        h.put("lastAccelerationX", getLastAccelerationX());
        h.put("lastAccelerationY", getLastAccelerationY());
        h.put("lastAccelerationZ", getLastAccelerationZ());
        h.put("orientation", getOrientation());
        h.put("frequency", getFrequency());
        h.put("expectedFrequency", expectedFrequency);
        h.put("manageFrequencyAuto", manageFrequencyAuto);
        h.put("motionEnabled", motionEnabled);
        h.put("expectedMotionEnabled", expectedMotionEnabled);
        h.put("manageMotionEnabledAuto", isManageMotionEnabledAuto());
        h.put("orientationEnabled", orientationEnabled);
        h.put("expectedOrientationEnabled", expectedOrientationEnabled);
        h.put("manageOrientationEnabledAuto", isManageOrientationEnabledAuto());        
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
        h.put("currentAlarmLeaveTimeout", getCurrentAlarmLeaveTimeout());
        h.put("currentAlarmEnterTimeout", getCurrentAlarmEnterTimeout());
        return h.toString();
    }
    /*
     * This method is called each second. Do not put inside blocking operations
    */
    protected void runEachSecond() {
        if (getCurrentAlarmLeaveTimeout() > 0) setCurrentAlarmLeaveTimeout(getCurrentAlarmLeaveTimeout() - 1);
        if (getCurrentAlarmEnterTimeout() > 0) {
            setCurrentAlarmEnterTimeout(getCurrentAlarmEnterTimeout() - 1);
            if (getCurrentAlarmEnterTimeout() == 0) {
                if ((!intruded) && alarmEnabled) {
                    //OK, alarm still motionEnabled send mail and swith on alarm if configured
                    RemoteHomeManager.log.info("Alarm occured from device: "+this);
                    setIntruded(true);
                    try {
                        if (emailAlertFirstTime) {
                            Properties p = m.getPersistance().loadProperties();
                            if (p != null) {
                                String msg = smtpMessage.
                                        replaceAll("\\{X\\}", Float.toString(getLastAccelerationX())).
                                        replaceAll("\\{Y\\}", Float.toString(getLastAccelerationY())).
                                        replaceAll("\\{Z\\}", Float.toString(getLastAccelerationZ())).
                                        replaceAll("\\{ORIENTATION\\}", getOrientation().toString());                                
                                new Mailer().sendEmail(new Mail(smtpTo, smtpSubject, msg), p);
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
                                if (!dd.isCurrentState()) {
                                    new Thread(new Runnable() {
                                        public void run() {
                                            try {
                                                dd.configurePeriod(getAlarmTimeout());
                                                Thread.sleep(10);
                                                dd.switchOnForConfiguredPeriod();
                                                RemoteHomeManager.log.info("Device: "+dd+", switched ON, thus alarm occured.");
                                            } catch (Exception e) {
                                                RemoteHomeManager.log.error(223, e);
                                            }
                                        }
                                    }).start();
                                }
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
            if (isEnabledAlarmScheduler()) {
                boolean action = getAlarmScheduler().getCurrentSchedule();
                if (action) {
                    if (!isAlarmEnabled()) setAlarmEnabled(true, true);
                } else {
                     if (isAlarmEnabled()) setAlarmEnabled(false, false);
                }
            }
            if (isEnabledSwitchScheduler()) {
                boolean action = getSwitchScheduler().getCurrentSchedule();
                if (action) {
                    if (!isSwitchEnabled()) setSwitchEnabled(true, true);
                } else {
                     if (isSwitchEnabled()) setSwitchEnabled(false, false);
                }
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
     * @return the alarmEnabled
     */
    public boolean isAlarmEnabled() {
        return alarmEnabled;
    }

    /**
     * @param alarmEnabled the alarmEnabled to set
     * @param motionOrientationFlag if true, device motion detection is used, if false device orientation detection is used.
     */
    public void setAlarmEnabled(boolean alarmEnabled, boolean motionOrientationFlag) {
        this.alarmEnabled = alarmEnabled;
        this.setEnabledAlarmScheduler(false);
        if (alarmEnabled) {
            setCurrentAlarmLeaveTimeout(getAlarmLeaveTimeout());
            setCurrentAlarmEnterTimeout(0);
        }        
        if (alarmEnabled) {
            if (motionOrientationFlag) {
                setExpectedMotionEnabled(true);
                setIntruded(false);
            } else {
                setExpectedOrientationEnabled(true);
                setIntruded(false);
            }
        } else {
            if (!switchEnabled) {
                setExpectedMotionEnabled(false);
            }
        }
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
    public void setSwitchEnabled(boolean switchEnabled, boolean motionOrientationFlag) {
        this.switchEnabled = switchEnabled;
        this.setEnabledSwitchScheduler(false);
        if (switchEnabled) {
            if (motionOrientationFlag) {
                setExpectedMotionEnabled(true);
            } else {
                setExpectedOrientationEnabled(true);                
            }
        } else {
            if (!alarmEnabled) {
                setExpectedMotionEnabled(false);
            }
        }
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
    }

    /**
     * @return the manageMotionEnabledAuto
     */
    public boolean isManageMotionEnabledAuto() {
        return manageMotionEnabledAuto;
    }

    /**
     * @param manageMotionEnabledAuto the manageMotionEnabledAuto to set
     */
    protected void setManageMotionEnabledAuto(boolean manageMotionEnabledAuto) {
        this.manageMotionEnabledAuto = manageMotionEnabledAuto;
    }

    /**
     * @return the orientationEnabled
     */
    public boolean isOrientationEnabled() {
        return orientationEnabled;
    }

    /**
     * @param orientationEnabled the orientationEnabled to set
     */
    private void setOrientationEnabled(boolean orientationEnabled) {
        this.orientationEnabled = orientationEnabled;
    }

    /**
     * @return the expectedOrientationEnabled
     */
    public boolean isExpectedOrientationEnabled() {
        return expectedOrientationEnabled;
    }

    /**
     * @param expectedOrientationEnabled the expectedOrientationEnabled to set
     */
    protected void setExpectedOrientationEnabled(boolean expectedOrientationEnabled) {
        this.expectedOrientationEnabled = expectedOrientationEnabled;
        setManageOrientationEnabledAuto(true);
    }

    /**
     * @return the manageOrientationEnabledAuto
     */
    public boolean isManageOrientationEnabledAuto() {
        return manageOrientationEnabledAuto;
    }

    /**
     * @param manageOrientationEnabledAuto the manageOrientationEnabledAuto to set
     */
    protected void setManageOrientationEnabledAuto(boolean manageOrientationEnabledAuto) {
        this.manageOrientationEnabledAuto = manageOrientationEnabledAuto;
    }

    /**
     * @return the currentAlarmEnterTimeout
     */
    protected int getCurrentAlarmEnterTimeout() {
        return currentAlarmEnterTimeout;
    }

    /**
     * @param currentAlarmEnterTimeout the currentAlarmEnterTimeout to set
     */
    protected void setCurrentAlarmEnterTimeout(int currentAlarmEnterTimeout) {
        this.currentAlarmEnterTimeout = currentAlarmEnterTimeout;
    }

    /**
     * @return the currentAlarmLeaveTimeout
     */
    protected int getCurrentAlarmLeaveTimeout() {
        return currentAlarmLeaveTimeout;
    }

    /**
     * @param currentAlarmLeaveTimeout the currentAlarmLeaveTimeout to set
     */
    protected void setCurrentAlarmLeaveTimeout(int currentAlarmLeaveTimeout) {
        this.currentAlarmLeaveTimeout = currentAlarmLeaveTimeout;
    }

    public float getLowBatteryLimit() {
        return 2.8f;
    }
    /**
     * @param intruded the intruded to set
     */
    protected void setIntruded(boolean intruded) {
        this.intruded = intruded;
    }
    public class OrientationChartItem {
        private String xData;
        private int yDataPORTRAITUP = 0;
        private int yDataPORTRAITDOWN = 0;
        private int yDataLANDSCAPERIGHT = 0;
        private int yDataLANDSCAPELEFT = 0;
        private int yDataPORTRAITUPBACK = 0;
        private int yDataPORTRAITDOWNBACK = 0;
        private int yDataLANDSCAPERIGHTBACK = 0;
        private int yDataLANDSCAPELEFTBACK = 0;
        private int yDataPORTRAITUPZTILT = 0;
        private int yDataPORTRAITDOWNZTILT = 0;
        private int yDataLANDSCAPERIGHTZTILT = 0;
        private int yDataLANDSCAPELEFTZTILT = 0;
        private int yDataPORTRAITUPBACKZTILT = 0;
        private int yDataPORTRAITDOWNBACKZTILT = 0;
        private int yDataLANDSCAPERIGHTBACKZTILT = 0;
        private int yDataLANDSCAPELEFTBACKZTILT = 0;

        @Override
        public String toString() {
            return "xData:"+getxData();
        }
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
         * @return the yDataPORTRAITUP
         */
        public int getyDataPORTRAITUP() {
            return yDataPORTRAITUP;
        }

        /**
         * @param yDataPORTRAITUP the yDataPORTRAITUP to set
         */
        public void setyDataPORTRAITUP(int yDataPORTRAITUP) {
            this.yDataPORTRAITUP = yDataPORTRAITUP;
        }

        /**
         * @return the yDataPORTRAITDOWN
         */
        public int getyDataPORTRAITDOWN() {
            return yDataPORTRAITDOWN;
        }

        /**
         * @param yDataPORTRAITDOWN the yDataPORTRAITDOWN to set
         */
        public void setyDataPORTRAITDOWN(int yDataPORTRAITDOWN) {
            this.yDataPORTRAITDOWN = yDataPORTRAITDOWN;
        }

        /**
         * @return the yDataLANDSCAPERIGHT
         */
        public int getyDataLANDSCAPERIGHT() {
            return yDataLANDSCAPERIGHT;
        }

        /**
         * @param yDataLANDSCAPERIGHT the yDataLANDSCAPERIGHT to set
         */
        public void setyDataLANDSCAPERIGHT(int yDataLANDSCAPERIGHT) {
            this.yDataLANDSCAPERIGHT = yDataLANDSCAPERIGHT;
        }

        /**
         * @return the yDataLANDSCAPELEFT
         */
        public int getyDataLANDSCAPELEFT() {
            return yDataLANDSCAPELEFT;
        }

        /**
         * @param yDataLANDSCAPELEFT the yDataLANDSCAPELEFT to set
         */
        public void setyDataLANDSCAPELEFT(int yDataLANDSCAPELEFT) {
            this.yDataLANDSCAPELEFT = yDataLANDSCAPELEFT;
        }

        /**
         * @return the yDataPORTRAITUPBACK
         */
        public int getyDataPORTRAITUPBACK() {
            return yDataPORTRAITUPBACK;
        }

        /**
         * @param yDataPORTRAITUPBACK the yDataPORTRAITUPBACK to set
         */
        public void setyDataPORTRAITUPBACK(int yDataPORTRAITUPBACK) {
            this.yDataPORTRAITUPBACK = yDataPORTRAITUPBACK;
        }

        /**
         * @return the yDataPORTRAITDOWNBACK
         */
        public int getyDataPORTRAITDOWNBACK() {
            return yDataPORTRAITDOWNBACK;
        }

        /**
         * @param yDataPORTRAITDOWNBACK the yDataPORTRAITDOWNBACK to set
         */
        public void setyDataPORTRAITDOWNBACK(int yDataPORTRAITDOWNBACK) {
            this.yDataPORTRAITDOWNBACK = yDataPORTRAITDOWNBACK;
        }

        /**
         * @return the yDataLANDSCAPERIGHTBACK
         */
        public int getyDataLANDSCAPERIGHTBACK() {
            return yDataLANDSCAPERIGHTBACK;
        }

        /**
         * @param yDataLANDSCAPERIGHTBACK the yDataLANDSCAPERIGHTBACK to set
         */
        public void setyDataLANDSCAPERIGHTBACK(int yDataLANDSCAPERIGHTBACK) {
            this.yDataLANDSCAPERIGHTBACK = yDataLANDSCAPERIGHTBACK;
        }

        /**
         * @return the yDataLANDSCAPELEFTBACK
         */
        public int getyDataLANDSCAPELEFTBACK() {
            return yDataLANDSCAPELEFTBACK;
        }

        /**
         * @param yDataLANDSCAPELEFTBACK the yDataLANDSCAPELEFTBACK to set
         */
        public void setyDataLANDSCAPELEFTBACK(int yDataLANDSCAPELEFTBACK) {
            this.yDataLANDSCAPELEFTBACK = yDataLANDSCAPELEFTBACK;
        }

        /**
         * @return the yDataPORTRAITUPZTILT
         */
        public int getyDataPORTRAITUPZTILT() {
            return yDataPORTRAITUPZTILT;
        }

        /**
         * @param yDataPORTRAITUPZTILT the yDataPORTRAITUPZTILT to set
         */
        public void setyDataPORTRAITUPZTILT(int yDataPORTRAITUPZTILT) {
            this.yDataPORTRAITUPZTILT = yDataPORTRAITUPZTILT;
        }

        /**
         * @return the yDataPORTRAITDOWNZTILT
         */
        public int getyDataPORTRAITDOWNZTILT() {
            return yDataPORTRAITDOWNZTILT;
        }

        /**
         * @param yDataPORTRAITDOWNZTILT the yDataPORTRAITDOWNZTILT to set
         */
        public void setyDataPORTRAITDOWNZTILT(int yDataPORTRAITDOWNZTILT) {
            this.yDataPORTRAITDOWNZTILT = yDataPORTRAITDOWNZTILT;
        }

        /**
         * @return the yDataLANDSCAPERIGHTZTILT
         */
        public int getyDataLANDSCAPERIGHTZTILT() {
            return yDataLANDSCAPERIGHTZTILT;
        }

        /**
         * @param yDataLANDSCAPERIGHTZTILT the yDataLANDSCAPERIGHTZTILT to set
         */
        public void setyDataLANDSCAPERIGHTZTILT(int yDataLANDSCAPERIGHTZTILT) {
            this.yDataLANDSCAPERIGHTZTILT = yDataLANDSCAPERIGHTZTILT;
        }

        /**
         * @return the yDataLANDSCAPELEFTZTILT
         */
        public int getyDataLANDSCAPELEFTZTILT() {
            return yDataLANDSCAPELEFTZTILT;
        }

        /**
         * @param yDataLANDSCAPELEFTZTILT the yDataLANDSCAPELEFTZTILT to set
         */
        public void setyDataLANDSCAPELEFTZTILT(int yDataLANDSCAPELEFTZTILT) {
            this.yDataLANDSCAPELEFTZTILT = yDataLANDSCAPELEFTZTILT;
        }

        /**
         * @return the yDataPORTRAITUPBACKZTILT
         */
        public int getyDataPORTRAITUPBACKZTILT() {
            return yDataPORTRAITUPBACKZTILT;
        }

        /**
         * @param yDataPORTRAITUPBACKZTILT the yDataPORTRAITUPBACKZTILT to set
         */
        public void setyDataPORTRAITUPBACKZTILT(int yDataPORTRAITUPBACKZTILT) {
            this.yDataPORTRAITUPBACKZTILT = yDataPORTRAITUPBACKZTILT;
        }

        /**
         * @return the yDataPORTRAITDOWNBACKZTILT
         */
        public int getyDataPORTRAITDOWNBACKZTILT() {
            return yDataPORTRAITDOWNBACKZTILT;
        }

        /**
         * @param yDataPORTRAITDOWNBACKZTILT the yDataPORTRAITDOWNBACKZTILT to set
         */
        public void setyDataPORTRAITDOWNBACKZTILT(int yDataPORTRAITDOWNBACKZTILT) {
            this.yDataPORTRAITDOWNBACKZTILT = yDataPORTRAITDOWNBACKZTILT;
        }

        /**
         * @return the yDataLANDSCAPERIGHTBACKZTILT
         */
        public int getyDataLANDSCAPERIGHTBACKZTILT() {
            return yDataLANDSCAPERIGHTBACKZTILT;
        }

        /**
         * @param yDataLANDSCAPERIGHTBACKZTILT the yDataLANDSCAPERIGHTBACKZTILT to set
         */
        public void setyDataLANDSCAPERIGHTBACKZTILT(int yDataLANDSCAPERIGHTBACKZTILT) {
            this.yDataLANDSCAPERIGHTBACKZTILT = yDataLANDSCAPERIGHTBACKZTILT;
        }

        /**
         * @return the yDataLANDSCAPELEFTBACKZTILT
         */
        public int getyDataLANDSCAPELEFTBACKZTILT() {
            return yDataLANDSCAPELEFTBACKZTILT;
        }

        /**
         * @param yDataLANDSCAPELEFTBACKZTILT the yDataLANDSCAPELEFTBACKZTILT to set
         */
        public void setyDataLANDSCAPELEFTBACKZTILT(int yDataLANDSCAPELEFTBACKZTILT) {
            this.yDataLANDSCAPELEFTBACKZTILT = yDataLANDSCAPELEFTBACKZTILT;
        }
    }
    
    public class AccelerometerChartItem {
        private String xData;
        private float yDataAccX;
        private float yDataAccY;
        private float yDataAccZ;
        @Override
        public String toString() {
            return "xData:"+getxData()+",yDataAccX:"+getyDataAccX()+",yDataAccY:"+getyDataAccY()+",yDataAccZ:"+getyDataAccZ();
        }

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
         * @return the yDataAccX
         */
        public float getyDataAccX() {
            return yDataAccX;
        }

        /**
         * @param yDataAccX the yDataAccX to set
         */
        public void setyDataAccX(float yDataAccX) {
            this.yDataAccX = yDataAccX;
        }

        /**
         * @return the yDataAccY
         */
        public float getyDataAccY() {
            return yDataAccY;
        }

        /**
         * @param yDataAccY the yDataAccY to set
         */
        public void setyDataAccY(float yDataAccY) {
            this.yDataAccY = yDataAccY;
        }

        /**
         * @return the yDataAccZ
         */
        public float getyDataAccZ() {
            return yDataAccZ;
        }

        /**
         * @param yDataAccZ the yDataAccZ to set
         */
        public void setyDataAccZ(float yDataAccZ) {
            this.yDataAccZ = yDataAccZ;
        }
    }
    
    public ArrayList generateChartItems(HistoryData[] historyData, String type) {
        if (type.equals("ACCELERATION")) {
            ArrayList<AccelerometerChartItem> retArray = new ArrayList<AccelerometerChartItem>();
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'.000Z'");
            for (HistoryData d : historyData) {
                AccelerometerChartItem item = new AccelerometerChartItem();
                String[] historyStringData = d.getDataValue().split("\\|");            
                item.setxData(df.format(d.getDataTimestamp()));
                item.setyDataAccX(Float.parseFloat(historyStringData[0]));
                item.setyDataAccY(Float.parseFloat(historyStringData[1]));
                item.setyDataAccZ(Float.parseFloat(historyStringData[2]));
                retArray.add(item);
            }
            return retArray;
        } else if (type.equals("ORIENTATION")) {
            ArrayList<OrientationChartItem> retArray = new ArrayList<OrientationChartItem>();
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'.000Z'");
            for (HistoryData d : historyData) {
                OrientationChartItem item = new OrientationChartItem();
                item.setxData(df.format(d.getDataTimestamp()));            
                if (d.getDataValue().equals("PORTRAITUP")) item.setyDataPORTRAITUP(1);
                else if (d.getDataValue().equals("PORTRAITDOWN")) item.setyDataPORTRAITDOWN(1);
                else if (d.getDataValue().equals("LANDSCAPERIGHT")) item.setyDataLANDSCAPERIGHT(1);
                else if (d.getDataValue().equals("LANDSCAPELEFT")) item.setyDataLANDSCAPELEFT(1);
                else if (d.getDataValue().equals("PORTRAITUPBACK")) item.setyDataPORTRAITUPBACK(1);
                else if (d.getDataValue().equals("PORTRAITDOWNBACK")) item.setyDataPORTRAITDOWNBACK(1);
                else if (d.getDataValue().equals("LANDSCAPERIGHTBACK")) item.setyDataLANDSCAPERIGHTBACK(1);
                else if (d.getDataValue().equals("LANDSCAPELEFTBACK")) item.setyDataLANDSCAPELEFTBACK(1);
                else if (d.getDataValue().equals("PORTRAITUPZTILT")) item.setyDataPORTRAITUPZTILT(1);
                else if (d.getDataValue().equals("PORTRAITDOWNZTILT")) item.setyDataPORTRAITDOWNZTILT(1);
                else if (d.getDataValue().equals("LANDSCAPERIGHTZTILT")) item.setyDataLANDSCAPERIGHTZTILT(1);
                else if (d.getDataValue().equals("LANDSCAPELEFTZTILT")) item.setyDataLANDSCAPELEFTZTILT(1);
                else if (d.getDataValue().equals("PORTRAITUPBACKZTILT")) item.setyDataPORTRAITUPBACKZTILT(1);
                else if (d.getDataValue().equals("PORTRAITDOWNBACKZTILT")) item.setyDataPORTRAITDOWNBACKZTILT(1);
                else if (d.getDataValue().equals("LANDSCAPERIGHTBACKZTILT")) item.setyDataLANDSCAPERIGHTBACKZTILT(1);
                else if (d.getDataValue().equals("LANDSCAPELEFTBACKZTILT")) item.setyDataLANDSCAPELEFTBACKZTILT(1);
                retArray.add(item);
            }
            return retArray;
        } else {
            return new ArrayList();
        }
        
    }
}

