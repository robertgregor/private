package org.remoteHome;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

/**
 * 
 * Heating header<BR/>
 * 
 * pn - check weather the device is up and running (ping command)<BR/>
 * ad - adaptation of the header. Each valve has different ranges of the open / close borders. This command will measure the time between the close / open and<BR/>
 *     adapt the header to the valve. It needs to be run at the beginning and then each two weeks.<BR/>
 * s - return status 4|temperature|battery|frequency|expected temperature|openAngle<BR/>
 * 	temperature format - 3 decimals degree celsius, e.g 233 = 23.3 or -23 = -23 or 022 = 2.2<BR/>
 * 	battery voltage e.g. 29 = 2.9 or 30 3.0. Below 2.8, the hardware starts to work not correctly.<BR/>
 * 	frequency - frequency in seconds to send status. Longer value, longer battery life<BR/>
 * 	expected temperature - the value set with command t: 23.5 celsius = 47, or 17 celsius = 34<BR/>
 * 	openAngle - Current open angle in % 100 - means close, 0 means fully open<BR/>
 * m=nnn - set the frequency and put to the sleep mode. 1 means 10 seconds, 255 means 2550 seconds. Needs to be set to put the device to sleep mode!!!<BR/>
 * 	If not set, or set to 0, then no sleep - useful for testing and configuration, but consume lot of power and battery will be quickly empty.<BR/>
 * t=nnn - Expected temperature - if set, the header is running in self managed mode - each frequency period checks the current temperature, and if it is lower, open the<BR/>
 *     valve and then sleep another period. The value is temperature * 2, it means, that 23.5 celsius = 47, or 17 celsius = 34.<BR/>
 *     If it is set to 0, then valve is operated manually: each frequency period the valve send status, then you have 2 seconds to send l command to set the open angle of the valve.<BR/>
 * l=nnn Set manually the valve to expected position allowed range is 100 closed, 0 fully open.<BR/><br/>
 * 
 *     Asynchronous messages: As - adaptation start, Ae - adaptation end, l|nnn after the valve is moved to correct position, the actual current position is sent. <BR/><BR/>
 *         
 *     Quick startup:<BR/>
 *     1. Insert battery<BR/>
 *     2. Test the communication AT+0=pn<BR/>
 *     3. Assign the device ID: AT+a=9  Id is 9. Adaptation start. As is printed after while Ae is printed with the Valve position 100 - fully closed<BR/><BR/>
 *     <table>
 *     <tr><td>Self managed mode</td><td>                                                             Manual mode</td></tr>
 *     <tr><td>AT+9=t=45 set temperature in room to 22,5 celsius</td><td>                                  AT+9=t=0 manual mode, temperature is 0</td></tr>
 *     <tr><td>AT+9=m=60 sleep 10 minutes</td><td>                                                         AT+9=m=60  sleep 10 minutes</td></tr>
 *     <tr><td>After 10 minutes the status is sent, you have to answer after the valve is set l|100</td><td>  After 10 minutes the status is sent, sent back the new position</td></tr>
 *     <tr><td>AT+9=t=34 Lower the temperature for the night</td><td>                                      AT+9=l=50 Opened 50 percent.</td></tr>
 *     </table>
 *
 * @author Robert Gregor
 */
public class HeatingHeaderDevice extends AbstractDevice implements Serializable {
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
     * Device Expected temperature, which has been set manually. It is value backed up, when scheduler is enabled.
     */
    private int deviceExpectedTemperatureBackedUp;

    /**
     * Open angle
     */
    private int openAngle; 

    /**
     * Expected open angle value should be set by external system in order to trigger the value change
     * Also the manageOpenAngleAuto method should be set to true.
     */
    private int expectedOpenAngle; 

    /**
     * Set this to true, if you want to set the expected open angle
     */
    private boolean manageOpenAngleAuto;
    
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

    /*
     * This is true if scheduler is enabled.
     */
    private boolean enabledScheduler;

    /*
     * This is automatic scheduler
     */
    private TemperatureSchedule temperatureSchedule = new TemperatureSchedule();   
    /*
     * This is id of the heating controller
     */
    private int heatingController;   

    /*
     * This is id of the remote temperature meter
     */
    private boolean heatingControllerEnabled = false;   

    /*
     * This is id of the remote temperature meter
     */
    private int remoteTemperatureMeter;   

    /*
     * This is id of the remote temperature meter
     */
    private boolean remoteTemperatureMeterEnabled = false; 
    
    /*
     * This is the value of the openAngle, when the heating controller is switched on.
     */
    private int heatingControllerOpenAngle;   
    
   /**
     * The constructor is protected. The object should be constructed using
     * HeatingHeaderDevice device = 
     *          (HeatingHeaderDevice)remoteHomeManager.getRemoteHomeDevice(deviceId,deviceName, AbstractDevice.HeatingHeader)
     * 
     * @param m remote manager reference
     * @param deviceId deviceId assigned to this device
     * @param deviceName device name
     **/

    protected HeatingHeaderDevice(RemoteHomeManager m, int deviceId, String deviceName) {
        super (m, deviceId, deviceName);
        temperatureSchedule = new TemperatureSchedule();
    }
    
    /**
     * Contains the initialization of the device.
     */
    protected void init() {      
    }
    /**
      * 
      * @param items the data from asynchronous event. Could be:
             * 4|temperature|battery|frequency|expected temperature|openAngle - status
             * As Adaptation start
             * Ae Adaptation end
             * l|nnn current open angle
      */
    @Override
    protected void manageAsynchronousCommand(String[] items) {
        if (items[0].equals("4")) {
            //This is the status
            this.setTemperature(Integer.parseInt(items[1]));
            setBattery(Float.parseFloat(items[2]));
            this.setFrequency(Integer.parseInt(items[3])*10); //Frequency in seconds * 10
            this.setDeviceExpectedTemperature(Integer.parseInt(items[4]) * 10 / 2);
            this.setOpenAngle(Integer.parseInt(items[5]));
            setTimestamp(System.currentTimeMillis());            
        } else if (items[0].equals("l")) {
            this.setOpenAngle(Integer.parseInt(items[1]));
            setTimestamp(System.currentTimeMillis());
        }
        //here manage the header values
            if (isManageTemperatureAuto() && (getDeviceExpectedTemperature() != getExpectedTemperature())) {
                // OK, set expected temperature
                new Thread(new Runnable() {
                     public void run() {
                         try {
                            Thread.sleep(10);
                            m.sendCommand(getDeviceId(),"t="+ getExpectedTemperature());
                            setManageTemperatureAuto(false);
                         } catch (InterruptedException e) {
                             return;
                         } catch (Exception e) {
                             e.printStackTrace();
                         }
                     }
                }).start();                            
            } else if (isManageOpenAngleAuto() && (getExpectedOpenAngle() != getOpenAngle())) {
                new Thread(new Runnable() {
                     public void run() {
                         try {
                            Thread.sleep(30);            
                            m.sendCommand(getDeviceId(),"l="+getExpectedOpenAngle());
                            setManageOpenAngleAuto(false);
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
    private void setTemperature(int temperature) {
        this.temperature = temperature;
    }

    /**
     * Expected temperature value should be set by external system in order to trigger the tepmerature change
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
     * @throws RemoteHomeManagerException if the range is outside 0 - 80 ( means 0 - 40 degree celsius )
     */
    public void setExpectedTemperature(int expectedTemperature) throws RemoteHomeManagerException {
        if ((expectedTemperature < 0) || (expectedTemperature > 80)) {
            throw new RemoteHomeManagerException("The value should be 0 - 80", RemoteHomeManagerException.WRONG_PARAMETER_VALUE);
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
    private void setManageTemperatureAuto(boolean manageTemperatureAuto) {
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
    private void setDeviceExpectedTemperature(int deviceExpectedTemperature) {
        this.deviceExpectedTemperature = deviceExpectedTemperature;
    }

    /**
     * @return the deviceExpectedTemperatureBackedUp
     */
    public int getDeviceExpectedTemperatureBackedUp() {
        return deviceExpectedTemperatureBackedUp;
    }

    /**
     * @param deviceExpectedTemperatureBackedUp the deviceExpectedTemperatureBackedUp to set
     */
    public void setDeviceExpectedTemperatureBackedUp(int deviceExpectedTemperatureBackedUp) {
        this.deviceExpectedTemperatureBackedUp = deviceExpectedTemperatureBackedUp;
    }

    /**
     * Open angle
     * @return the openAngle
     */
    public int getOpenAngle() {
        return openAngle;
    }

    /**
     * Open angle
     * @param openAngle the openAngle to set
     */
    private void setOpenAngle(int openAngle) {
        this.openAngle = openAngle;
    }

    /**
     * Expected open angle value should be set by external system in order to trigger the value change
     * @return the expectedOpenAngle
     */
    public int getExpectedOpenAngle() {
        return expectedOpenAngle;
    }

    /**
     * Expected open angle value should be set by external system in order to trigger the value change
     * @param expectedOpenAngle the expectedOpenAngle to set
     * @throws RemoteHomeManagerException if the value is not between 0 - 100
     */
    public void setExpectedOpenAngle(int expectedOpenAngle) throws RemoteHomeManagerException {
        if ((expectedOpenAngle < 0) || (expectedOpenAngle > 100)) {
            throw new RemoteHomeManagerException("The value should be 0 - 100", RemoteHomeManagerException.WRONG_PARAMETER_VALUE);
        }
        this.expectedOpenAngle = expectedOpenAngle;
        setManageOpenAngleAuto(true);
    }

    /**
     * Set this to true, if you want to set the expected open angle
     * @return the manageOpenAngleAuto
     */
    public boolean isManageOpenAngleAuto() {
        return manageOpenAngleAuto;
    }

    /**
     * Set this to true, if you want to set the expected open angle
     * @param manageOpenAngleAuto the manageOpenAngleAuto to set
     */
    private void setManageOpenAngleAuto(boolean manageOpenAngleAuto) {
        this.manageOpenAngleAuto = manageOpenAngleAuto;
    }

    /**
     * Frequency
     * @return the frequency
     */
    public int getFrequency() {
        return frequency;
    }

    /**
     * Frequency in seconds
     * @param frequency in seconds the frequency to set
     */
    private void setFrequency(int frequency) {
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
    private void setManageFrequencyAuto(boolean manageFrequencyAuto) {
        this.manageFrequencyAuto = manageFrequencyAuto;
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

    /**
     * @return the heatingController
     */
    public int getHeatingController() {
        return heatingController;
    }

    /**
     * @param heatingController the heatingController to set
     */
    public void setHeatingController(int heatingController) {
        this.heatingController = heatingController;
    }

    /**
     * @return the heatingControllerEnabled
     */
    public boolean isHeatingControllerEnabled() {
        return heatingControllerEnabled;
    }

    /**
     * @param heatingControllerEnabled the heatingControllerEnabled to set
     */
    public void setHeatingControllerEnabled(boolean heatingControllerEnabled) {
        this.heatingControllerEnabled = heatingControllerEnabled;
    }

    /**
     * @return the remoteTemperatureMeter
     */
    public int getRemoteTemperatureMeter() {
        return remoteTemperatureMeter;
    }

    /**
     * @param remoteTemperatureMeter the remoteTemperatureMeter to set
     */
    public void setRemoteTemperatureMeter(int remoteTemperatureMeter) {
        this.remoteTemperatureMeter = remoteTemperatureMeter;
    }

    /**
     * @return the remoteTemperatureMeterEnabled
     */
    public boolean isRemoteTemperatureMeterEnabled() {
        return remoteTemperatureMeterEnabled;
    }

    /**
     * @param remoteTemperatureMeterEnabled the remoteTemperatureMeterEnabled to set
     */
    public void setRemoteTemperatureMeterEnabled(boolean remoteTemperatureMeterEnabled) {
        this.remoteTemperatureMeterEnabled = remoteTemperatureMeterEnabled;
    }

    /**
     * @return the heatingControllerOpenAngle
     */
    public int getHeatingControllerOpenAngle() {
        return heatingControllerOpenAngle;
    }

    /**
     * @param heatingControllerOpenAngle the heatingControllerOpenAngle to set
     */
    public void setHeatingControllerOpenAngle(int heatingControllerOpenAngle) {
        this.heatingControllerOpenAngle = heatingControllerOpenAngle;
    }
    /**
     * This method will save the current state of the device to the database together with the timestamp.
     */
    protected void saveHistoryData() throws RemoteHomeManagerException {
          int expected = getDeviceExpectedTemperature();
          if (isEnabledScheduler()) {
              Integer tmp = (int)getTemperatureSchedule().getCurrentExpectedValue()*10;
              if (tmp != null) expected = tmp;
          }
    }    
    /*
     * This method is not supported for this device and will throw always RemoteHomeManagerException - NOT_SUPPORTED.
     * The status of the device is received asynchronously from the device.
     */
    public void updateDevice() throws RemoteHomeManagerException {
        throw new RemoteHomeManagerException(RemoteHomeManagerException.NOT_SUPPORTED);
    }
    /**
     * This method will start the scheduler thread to process the schedule.
     */
    public void startScheduling() {
        String deviceTemp = Integer.toString(getDeviceExpectedTemperature(),16).toUpperCase();
        while (deviceTemp.length() < 2) deviceTemp = "0" + deviceTemp;
        getTemperatureSchedule().setCurrentState(deviceTemp);
        new Thread(new Runnable() {
            public void run() {
                while(true) {
                    try {
                        Calendar c = Calendar.getInstance();
                        int min = c.get(Calendar.MINUTE);
                        if (((min % 10) == 0) || (min == 0)) {
                            saveHistoryData();
                        }
                        Thread.sleep(50000);
                        //manage heating controller
                        if (isHeatingControllerEnabled() && getHeatingController() != 0) {
                            try {
                                if (getHeatingControllerOpenAngle() >= getOpenAngle()) {
                                    SimpleSwitchDevice ssd = (SimpleSwitchDevice)m.getDevice(getHeatingController());
                                    if (ssd.updatedBefore(1)) ssd.updateDevice();
                                    if (!ssd.isCurrentState() || ssd.getCurrentCounter() < 2) {
                                        if (ssd.getConfiguredPeriod() != 3) {
                                            ssd.configurePeriod(3);
                                        }
                                        ssd.switchOnForConfiguredPeriod();
                                    }
                                }
                            } catch (RemoteHomeConnectionException e) {
                                e.printStackTrace();
                            }
                        }
                        //manage the remote temperature meter and device relay
                        if (!isEnabledScheduler()) {
                            manageRemoteTemperatureSensorAndHeader();
                            continue;
                        }
                        if (!isRemoteTemperatureMeterEnabled()) continue;
                        c = Calendar.getInstance();
                        min = c.get(Calendar.MINUTE);
                        if (((min % 15) == 0) || (min == 0)) {
                            Integer temperature = getTemperatureSchedule().processSchedule();
                            if (temperature != null) {
                                //something has to be done.
                                if (!isRemoteTemperatureMeterEnabled()) {
                                    setExpectedTemperature((temperature*2)/10);
                                } else {
                                    manageRemoteTemperatureSensorAndHeader();
                                }
                            }
                        }
                        Thread.sleep(50000);
                    } catch (InterruptedException e) {
                        return;
                    } catch (RemoteHomeConnectionException e) {
                        e.printStackTrace();
                    } catch (RemoteHomeManagerException e) {
                        e.printStackTrace();
                    }
                }
            }
        }).start();        
    }
    private void manageRemoteTemperatureSensorAndHeader() throws RemoteHomeConnectionException, RemoteHomeManagerException {
        if (isRemoteTemperatureMeterEnabled() && getRemoteTemperatureMeter() != 0) {
            int targetOpenAngle = 100;
            if (getTemperature() < 7) {
                targetOpenAngle = 0;
            } else {
                if (getDeviceExpectedTemperature() > getTemperature()) {
                    int differenceTemp = getDeviceExpectedTemperature() - getTemperature();
                    if (differenceTemp < 5) {
                        targetOpenAngle = 75;
                    } else if (differenceTemp < 10) {
                        targetOpenAngle = 50;
                    } else if (differenceTemp < 15) {
                        targetOpenAngle = 30;
                    }    
                } else {
                    targetOpenAngle = 100;
                }
            }
            if (getOpenAngle()!=targetOpenAngle) setExpectedOpenAngle(targetOpenAngle);
        }
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

    public ArrayList generateChartItems(HistoryData[] historyData, String type) {
        ArrayList retArray = new ArrayList();
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'.000Z'");
            for (HistoryData d : historyData) {
            }
            return retArray;
    }
}
