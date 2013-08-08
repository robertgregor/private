/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome;

import java.util.Calendar;

/**
  * Thermostat with temperature sensor and simple switch, which control the heating<br/>
  * <br/><br/>
  * This device is virtual, it is doing logic between physical devices:
  * Temperature meter, which is giving the temperature in the room.
  * Simple switch, this controls the heating header or electric radiator.<br/>
  * <br/>
  * @author Robert Gregor<br/>
  */

public class ThermostatWithSwitchAndTempSensorDevice extends AbstractDevice {

   /**
     * Device Expected temperature
     */
    private int temperature;
    
   /**
     * Device Expected temperature
     */
    private int deviceExpectedTemperature;
    
   /**
     * Device Expected temperature, which has been set manually. It is value backed up, when scheduler is enabled.
     */
    private int deviceExpectedTemperatureBackedUp;
   /**
     * State of the relay, true if the relay is ON
     */
    private boolean relayOn;
    
    /**
     * State of the manual control mode, true if the manual control is ON (Relay is not controlled using the expected temperature.)
     */
    private boolean manualControl;

    /**
     * Threshold 0 - 9. For the self managed mode, the threshold could be set. It means that relay will go off when currentTemperature + threshold / 10 > expected temperature and will<br/>
     * go on, when currentTemperature - threshold / 10 < expected temperature<br/>
     */
    private int threshold;
        
    /*
     * This is true if scheduler is enabled.
     */
    private boolean enabledScheduler;

    /*
     * This is automatic scheduler
     */
    private TemperatureSchedule temperatureSchedule;   
    
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
    private int remoteTemperatureMeterId;   

    /*
     * This is id of the simpleSwitchDevice
     */
    private int simpleSwitchDeviceId;   

    /**
     * The constructor is protected. The object should be constructed using
     * ThermostatDevice device = 
     *          (ThermostatDevice)remoteHomeManager.getRemoteHomeDevice(deviceId,deviceName, AbstractDevice.Thermostat)
     * 
     * @param m remote manager reference
     * @param deviceId deviceId assigned to this device
     * @param deviceName device name
     **/

    protected ThermostatWithSwitchAndTempSensorDevice(RemoteHomeManager m, int deviceId, String deviceName) {
        super (m, deviceId, deviceName);
        temperatureSchedule = new TemperatureSchedule();
        enabledScheduler = temperatureSchedule.isEnabled();
    }

    /**
     * This method is not implemented, this device is only virtual.
     * 
     * @throws RemoteHomeConnectionException if there is a problem with communication
     * @throws RemoteHomeManagerException if the type of the device doesn't belongs to the answer received back.
     * 
     */
    @Override
    public void updateDevice() throws RemoteHomeConnectionException, RemoteHomeManagerException {
        setTimestamp(System.currentTimeMillis());
    }
    
    /**
      * @param items the data from asynchronous event. This method is not implemented, because this device is only virtual.
      */
    @Override
    protected void manageAsynchronousCommand(String[] items) {
    }
    /**
     * Set state of the relay, true if the relay should go ON
     * @param relayOn the relayState to set
     * @throws RemoteHomeConnectionException if there is a problem with communication
     */
    public void relayOn(boolean relayOn) throws RemoteHomeConnectionException, RemoteHomeManagerException {
        SimpleSwitchDevice ssd = (SimpleSwitchDevice)m.getDevice(getSimpleSwitchDeviceId());
        setManualControl(true);
        if (relayOn) {
            ssd.switchOn();
            setRelayOn(true);
        } else {
            ssd.switchOff();
            setRelayOn(false);
        }
    }
    /**
     * This method will save the current state of the device to the database together with the timestamp.
     */
    protected void saveHistoryData() {
          TemperatureHistoryData historyProto = new TemperatureHistoryData();
          historyProto.setDeviceId(getDeviceId());
          TemperatureHistoryData history = (TemperatureHistoryData)m.getPersistance().loadHistoryData(historyProto);
          if (history == null) history = historyProto;
          history.saveSampleData(System.currentTimeMillis(), (int)Math.round(getTemperature()*10));
          m.getPersistance().saveHistoryData(history);
    }
    /**
     * This method will start the scheduler thread to process the schedule.
     */
    public void startScheduling() {
        String deviceTemp = Integer.toString((getDeviceExpectedTemperature()*2)/10,16).toUpperCase();
        while (deviceTemp.length() < 2) deviceTemp = "0" + deviceTemp;
        getTemperatureSchedule().setCurrentState(deviceTemp);
        if (isEnabledScheduler()) setDeviceExpectedTemperature(getTemperatureSchedule().getCurrentExpectedValue());
        new Thread(new Runnable() {
            public void run() {
                while(true) {
                    try {
                        Thread.sleep(50000);
                        if (isManualControl()) continue;
                        //manage heating controller
                        if (getSimpleSwitchDeviceId() == 0) continue;
                        if (getRemoteTemperatureMeterId() == 0) continue;
                        if (isHeatingControllerEnabled() && getHeatingController() != 0) {
                            try {
                                //ok heating controller enabled check the status of the relay
                                SimpleSwitchDevice ssd = (SimpleSwitchDevice)m.getDevice(getSimpleSwitchDeviceId());
                                ssd.updateDevice();
                                if (ssd.isCurrentState()) {
                                    setRelayOn(true);
                                    //ok, get the device and check if it is on
                                    SimpleSwitchDevice heatingUnit = (SimpleSwitchDevice)m.getDevice(getHeatingController());
                                    if (heatingUnit.updatedBefore(1)) heatingUnit.updateDevice();
                                    if (!heatingUnit.isCurrentState() || heatingUnit.getCurrentCounter() < 2) {
                                        if (heatingUnit.getConfiguredPeriod() != 3) {
                                            heatingUnit.configurePeriod(3);
                                        }
                                        heatingUnit.switchOnForConfiguredPeriod();
                                    }
                                } else {
                                    setRelayOn(false);
                                }
                            } catch (RemoteHomeConnectionException e) {
                                e.printStackTrace();
                            }
                        }
                        //manage the remote temperature meter and device relay
                        if (!isEnabledScheduler()) {
                            manageRemoteTemperatureSensorAndDeviceRelay();
                            continue;
                        }
                        Calendar c = Calendar.getInstance();
                        int min = c.get(Calendar.MINUTE);
                        if (((min % 15) == 0) || (min == 0)) {
                            Integer temperature = getTemperatureSchedule().processSchedule();
                            if (temperature != null) {
                                setDeviceExpectedTemperature(temperature);
                                //something has to be done.
                                manageRemoteTemperatureSensorAndDeviceRelay();
                            }
                        }
                        if (((min % 15) == 0) || (min == 0)) {
                            saveHistoryData();
                        }
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
    
    private void manageRemoteTemperatureSensorAndDeviceRelay() throws RemoteHomeConnectionException, RemoteHomeManagerException {        
        TemperatureSensorDevice tsd = (TemperatureSensorDevice)m.getDevice(getRemoteTemperatureMeterId());  
        int temperature = (int)Math.round(tsd.getTemperature()*10);
        setTemperature(temperature);
        SimpleSwitchDevice ssd = (SimpleSwitchDevice)m.getDevice(getSimpleSwitchDeviceId());        
        int finalTemp = temperature + getThreshold();
        if (finalTemp > getDeviceExpectedTemperature()) {
               if (ssd.isCurrentState()) {
                   ssd.switchOff();
                   setRelayOn(false);
               }
        } else {
               finalTemp = temperature - getThreshold();
               if (finalTemp < getDeviceExpectedTemperature()) {
                    if (!ssd.isCurrentState()) {
                        ssd.switchOn();
                        setRelayOn(true);
                    }
               }
        }        
    }

    /**
     * @return the relayOn
     */
    public boolean isRelayOn() {
        return relayOn;
    }

    /**
     * @param relayOn the relayOn to set
     */
    public void setRelayOn(boolean relayOn) {
        this.relayOn = relayOn;
    }

    /**
     * @return the manualControl
     */
    public boolean isManualControl() {
        return manualControl;
    }

    /**
     * @param manualControl the manualControl to set
     */
    public void setManualControl(boolean manualControl) {
        this.manualControl = manualControl;
    }


    /**
     * @return the deviceExpectedTemperature
     */
    public int getDeviceExpectedTemperature() {
        return deviceExpectedTemperature;
    }

    /**
     * @param deviceExpectedTemperature the deviceExpectedTemperature to set
     */
    public void setDeviceExpectedTemperature(int deviceExpectedTemperature) {
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
     * @return the temperature
     */
    public int getTemperature() {
        return temperature;
    }

    /**
     * @param temperature the temperature to set
     */
    public void setTemperature(int temperature) {
        this.temperature = temperature;
    }

    /**
     * @return the threshold
     */
    public int getThreshold() {
        return threshold;
    }

    /**
     * @param threshold the threshold to set
     */
    public void setThreshold(int threshold) {
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
     */
    public void setEnabledScheduler(boolean enabledScheduler) {
        if (enabledScheduler) {
            if (!this.enabledScheduler) setDeviceExpectedTemperatureBackedUp(getDeviceExpectedTemperature());
        } else {
            if (this.enabledScheduler) setDeviceExpectedTemperature(getDeviceExpectedTemperatureBackedUp());
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
     * @return the remoteTemperatureMeterId
     */
    public int getRemoteTemperatureMeterId() {
        return remoteTemperatureMeterId;
    }

    /**
     * @param remoteTemperatureMeterId the remoteTemperatureMeterId to set
     */
    public void setRemoteTemperatureMeterId(int remoteTemperatureMeterId) {
        this.remoteTemperatureMeterId = remoteTemperatureMeterId;
    }

    /**
     * @return the simpleSwitchDeviceId
     */
    public int getSimpleSwitchDeviceId() {
        return simpleSwitchDeviceId;
    }

    /**
     * @param simpleSwitchDeviceId the simpleSwitchDeviceId to set
     */
    public void setSimpleSwitchDeviceId(int simpleSwitchDeviceId) {
        this.simpleSwitchDeviceId = simpleSwitchDeviceId;
    }
}
