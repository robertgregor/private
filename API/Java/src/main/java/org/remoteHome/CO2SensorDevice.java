package org.remoteHome;

import com.sun.net.httpserver.HttpExchange;
import java.io.OutputStream;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

/**
* CO2 sensor sketch
* 
* The co2 sensor is the device, which measures the CO2 concentration. Please note, that CO2 sensor needs 3 minutes preheat period, so it is not possible to get the reading in realtime.
*  Radio commands:
*  
*  Commands
*  --------------------------------------------------------------------------------------------
*  oh -     Factory heat. The sensor used - MG811 needs to be 24 hours heated to work properly. This operation should be done only one time, when the sensor is new. Otherwise, it could read incorrect data. So use this command first time.
*           When you will submit this command, make sure that the microcontrollerBattery is fully charged. You can touch the sensor after while, you will see, that it is hot. After the issuing this command, the board will go to the sleep mode for 24 hours, so it will not 
*           answer to any command. At the end, it will send the status with indication, that initial heat of the sensor is done.
*  ocl -    Calibration low: The sensor will need to calibrate. It should calibrate first in normal air, it means 400ppm. Make sure to put the board with sensor to the outside air, there should be around 20 degrees and no wind. Then issue 
*           this command, wait 3 minute for the sensor preheat, then the value is read and the status is sent. The board is in the sleep mode for these 3 minutes so it will not answer to any command.
*  och -    Calibration high: The sensor will need to calibrate at 40000ppm, this is 100% concentration of the CO2. Take the small cup, where the sensor fully fit. Put there soda and vineger. Wait for the CO2. Then issue 
*           this command, wait 3 minute for the sensor preheat, then the value is read and the status is sent. The board is in the sleep mode for these 3 minutes so it will not answer to any command. Now the sensor is fully ready.
*  om=nnn - Set the frequency and put to the sleep mode. 1 means 10 seconds, 254 means 2540 seconds. Needs to be set to put the device to sleep mode!!!
*  	    If not set, or set to 0, then no sleep - usefull for testing, but consume lot of power and batery will be drained. The preheat time of the sensor is 3 minute, so the minimal frequency is 30 which is 5 minutes (300 seconds)
*           Also note that preheat consume around 200 mA, so in case of e.g. 5 minutes period, the sensor will waste the microcontrollerBattery quite fast. The good period for this sensor is 30 minutes = 180. The microcontrollerBattery has 5000 mAh it is around 500 cycles which means 
*           250 hours of the working time, it is around 10 days. If you will measure one time per hour the working time is 20 days.        
* ocv=nnn - set the ventilator device Id, where the humidity should be sent. The range is 0 < nnn < 255.
* ocvs=nnn -set the ventilator subdevice device Id, where the humidity should be sent. The range is 0 < nnn < 9.
*  
*  Status: 1o|1|co2concentrationVoltage|co2ConcentrationPPM|calibrationVoltageLow|CalibrationVoltageHigh|voltageAtMicroprocessor|voltageAtCells|sendingPeriod|preheat|ventilatorDeviceId|ventilatorSubdeviceId
*  Status format example: 11|2.754|400 ppm|2.754|1.023|3.3|7.2|0|1|0|1
*         1o - fixed unique value
*         1 - Sub device Id
*         2.754 - read voltage from the sensor
*         400 ppm - Calculated ppm value - for details see MG811 datasheet
*         2.754 - calibrated voltage at 400 ppm value
*         1.023 - calibrated voltage at 40000 ppm value
*         3.3 - voltage at the microprocessor
*         7.2 - voltage at the microcontrollerBattery
*         0 - sending period in seconds
*         1 - 1st time 24 hours preheat indicator. 0 - no preheat was done. 1 - preheat executed.
*         0 - Ventilator device Id
*         1 - Ventilator Sub deviceId
*         
*  Manual operation commands - for testing purpose only. Set first m=0 so the board will not sleep.
*  opo -   Switch the power to the sensor. This means the heating.
*  opf -   Switch off the power to the sensor.
*  os -    It will preheat the sensor for 3 minutes and then will send the value. 
*  --------------------------------------------------------------------------------------------
*  
*  pn - check weather the device is up and runing (ping command) - returns OK
*  nn - check weather the device is up and runing (ping command) - returns nothing - used by the transceiver to measure the RSSI.
*  res - reset the device
*  def - reset the device and place the EEPROM device to factory default
* 
* @author Robert Gregor
* 
**/

public class CO2SensorDevice extends AbstractDevice implements Serializable {
   /**
     * Current concentration in ppm
     */
    private int co2Concentration; 

   /**
     * Current concentration in volts
     */
    private float co2ConcentrationVoltage; 

   /**
     * Low calibration voltage in volts (This equals to 400 ppm - normal air)
     */
    private float lowCalibrationCo2Voltage; 

   /**
     * High calibration voltage in volts (This equals to 40000 ppm - 100 % co2)
     */
    private float highCalibrationCo2Voltage; 

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
    private boolean manageFrequencyAuto = false;

    /**
     * Microcontroller battery
     */
    private float microcontrollerBattery;
    
    /**
     * True, if the 24 hours preheat has been done
     */
    private boolean preheat24hours;
    
    /**
     * The device id of the ventilator controller
     */
    private int ventilatorDeviceId;

    /**
     * The expected device id of the ventilator controller
     */
    private int ventilatorDeviceIdExpected;
    
    /**
     * Set this to true, if you want to set the ventilator device Id
     */
    private boolean manageVentilatorDeviceIdAuto;
    
    /**
     * The sub device id of the ventilator controller
     */
    private int ventilatorSubDeviceId;

    /**
     * The expected sub device id of the ventilator controller
     */
    private int ventilatorSubDeviceIdExpected;
    
    /**
     * Set this to true, if you want to set the ventilator sub device Id
     */
    private boolean manageVentilatorSubDeviceIdAuto;

    /**
     * The constructor is protected. The object should be constructed using
     * CO2SensorDevice device = 
     *          (CO2SensorDevice)remoteHomeManager.getRemoteHomeDevice(deviceId,deviceName, AbstractDevice.CO2Sensor)
     * 
     * @param m remote manager reference
     * @param deviceId deviceId assigned to this device
     * @param deviceName device name
     **/

    protected CO2SensorDevice(RemoteHomeManager m, int deviceId, String deviceName) {
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
             * 11|co2concentrationVoltage|co2ConcentrationPPM|calibrationVoltageLow|CalibrationVoltageHigh|voltageAtMicroprocessor|voltageAtCells|sendingPeriod|preheat|ventilatorDeviceId|ventilatorSubdeviceId
      */
    @Override
    protected void manageAsynchronousCommand(String[] items) {
        if (items[0].equals("1o")) {
            setCo2ConcentrationVoltage(Float.parseFloat(items[2]));
            setCo2Concentration(Integer.parseInt(items[3].split(" ")[0]));
            setLowCalibrationCo2Voltage(Float.parseFloat(items[4]));
            setHighCalibrationCo2Voltage(Float.parseFloat(items[5]));
            microcontrollerBattery = Float.parseFloat(items[6]);
            setBattery(Float.parseFloat(items[7]));
            frequency = Integer.parseInt(items[8]);
            preheat24hours = (Integer.parseInt(items[9]) == 1);
            this.setVentilatorDeviceId(Integer.parseInt(items[10]));
            this.setVentilatorSubDeviceId(Integer.parseInt(items[11]));
            timestamp = System.currentTimeMillis();
            try {
                saveHistoryData();
            } catch (RemoteHomeManagerException e) {
                if (e.getType() != RemoteHomeManagerException.PERSISTANCE_NOT_INITIALIZED)
                    RemoteHomeManager.log.error(241, e);
            }
            m.notifyDeviceChange(this);
            RemoteHomeManager.log.info("Values set. Current values: "+toString());
        } else {
            
        }
        //here manage the CO2 sensor meter expected settings
            if (isManageFrequencyAuto()) {
                RemoteHomeManager.log.debug("Going to set new frequency: "+getExpectedFrequency());
                new Thread(new Runnable() {
                     public void run() {
                         try {
                            m.sendCommand(parseDeviceIdForMultipleDevice(getRealDeviceId()),"om="+getExpectedFrequency()/10);
                            setManageFrequencyAuto(false);
                            setFrequency(getExpectedFrequency());
                            expectedFrequency = 0;                            
                            RemoteHomeManager.log.info("New frequency set: "+getFrequency());
                         } catch (Exception e) {
                             RemoteHomeManager.log.error(231, e);
                         }
                     }
                }).start();
            }
            if (isManageVentilatorDeviceIdAuto()) {
                RemoteHomeManager.log.debug("Going to set new ventilator device ID: "+this.getVentilatorDeviceIdExpected());
                new Thread(new Runnable() {
                     public void run() {
                         try {
                            m.sendCommand(parseDeviceIdForMultipleDevice(getRealDeviceId()),"ocv="+getVentilatorDeviceIdExpected());
                            setManageVentilatorDeviceIdAuto(false);
                            setVentilatorDeviceId(getVentilatorDeviceIdExpected());
                            ventilatorDeviceIdExpected = 0;
                            RemoteHomeManager.log.info("New ventilator device ID set: "+getVentilatorDeviceId());
                         } catch (Exception e) {                                                         
                             RemoteHomeManager.log.error(222, e);
                         }
                     }
                }).start();
            }
            if (isManageVentilatorSubDeviceIdAuto()) {
                RemoteHomeManager.log.debug("Going to set new ventilator sub device ID: "+getVentilatorSubDeviceIdExpected());
                new Thread(new Runnable() {
                     public void run() {
                         try {
                            m.sendCommand(parseDeviceIdForMultipleDevice(getRealDeviceId()),"ocvs="+getVentilatorSubDeviceIdExpected());
                            setManageVentilatorSubDeviceIdAuto(false);
                            setVentilatorSubDeviceId(getVentilatorSubDeviceIdExpected());
                            ventilatorSubDeviceIdExpected = 0;
                            RemoteHomeManager.log.info("New ventilator sub device ID set: "+getVentilatorSubDeviceId());
                         } catch (Exception e) {
                             RemoteHomeManager.log.error(223, e);
                         }
                     }
                }).start();
            }            
    }

    /**
      * Not used
      */
    protected void manageAsynchronousCommand(OutputStream o, HttpExchange t, HashMap<String, String> requestParameters) {       
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
     * After the device Id assignment, the frequency is still 0 second, it means no sleep at all. Set 1800 seconds sleep (30 minutes) in order not to empty microcontrollerBattery. 
     */
    public void setInitialFrequency() throws RemoteHomeConnectionException {
        this.frequency = 1800;
        this.expectedFrequency = 1800;
        this.manageFrequencyAuto = false;
        m.sendCommand(parseDeviceIdForMultipleDevice(getRealDeviceId()),"om=180");
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
        //if frequency is 0, then send the command now thus device is not sleeping
        try {
            m.sendCommand(parseDeviceIdForMultipleDevice(getRealDeviceId()),"om="+(expectedFrequency/10));
            setFrequency(expectedFrequency);
        } catch (RemoteHomeConnectionException e) {
            //OK, device is not available, schedule the command
            this.expectedFrequency = expectedFrequency;
            setManageFrequencyAuto(true);
        }
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

    /**
     * Battery
     * @return the microcontrollerBattery
     */
    public float getMicrocontrollerBattery() {
        return microcontrollerBattery;
    }

    /**
     * Battery
     * @param microcontrollerBattery the microcontrollerBattery to set
     */
    protected void setMicrocontrollerBattery(float microcontrollerBattery) {
        this.microcontrollerBattery = microcontrollerBattery;
    }

    /**
     * @return the co2Concentration
     */
    public int getCo2Concentration() {
        return co2Concentration;
    }

    /**
     * @param co2Concentration the co2Concentration to set
     */
    protected void setCo2Concentration(int co2Concentration) {
        this.co2Concentration = co2Concentration;
    }

    /**
     * @return the co2ConcentrationVoltage
     */
    public float getCo2ConcentrationVoltage() {
        return co2ConcentrationVoltage;
    }

    /**
     * @param co2ConcentrationVoltage the co2ConcentrationVoltage to set
     */
    protected void setCo2ConcentrationVoltage(float co2ConcentrationVoltage) {
        this.co2ConcentrationVoltage = co2ConcentrationVoltage;
    }

    /**
     * @return the lowCalibrationCo2Voltage
     */
    public float getLowCalibrationCo2Voltage() {
        return lowCalibrationCo2Voltage;
    }

    /**
     * @param lowCalibrationCo2Voltage the lowCalibrationCo2Voltage to set
     */
    protected void setLowCalibrationCo2Voltage(float lowCalibrationCo2Voltage) {
        this.lowCalibrationCo2Voltage = lowCalibrationCo2Voltage;
    }

    /**
     * Calibrate sensor at the fresh air concentration 400 ppm
     */
    public void calibrateLow() throws RemoteHomeConnectionException {
        m.sendCommand(parseDeviceIdForMultipleDevice(getRealDeviceId()),"ocl");
    }

    /**
     * @return the highCalibrationCo2Voltage
     */
    public float getHighCalibrationCo2Voltage() {
        return highCalibrationCo2Voltage;
    }

    /**
     * @param highCalibrationCo2Voltage the highCalibrationCo2Voltage to set
     */
    protected void setHighCalibrationCo2Voltage(float highCalibrationCo2Voltage) {
        this.highCalibrationCo2Voltage = highCalibrationCo2Voltage;
    }

    /**
     * Calibrate sensor at the 100% CO2 - 40000 ppm
     * Please see the web, how to make 100 % CO2 using soda and vinegar
     */
    public void calibrateHigh() throws RemoteHomeConnectionException {
        m.sendCommand(parseDeviceIdForMultipleDevice(getRealDeviceId()),"och");
    }

    /**
     * @return the preheat24hours
     */
    public boolean isPreheat24hours() {
        return preheat24hours;
    }

    /**
     * @param preheat24hours the preheat24hours to set
     */
    protected void setPreheat24hours(boolean preheat24hours) {
        this.preheat24hours = preheat24hours;
    }

    /**
     * Preheat the sensor 24hours before it will be calibrated and use
     */
    public void preheat24hours() throws RemoteHomeConnectionException {
        m.sendCommand(parseDeviceIdForMultipleDevice(getRealDeviceId()),"oh");
    }

    /**
     * @return the ventilatorDeviceId
     */
    public int getVentilatorDeviceId() {
        return ventilatorDeviceId;
    }

    /**
     * @param ventilatorDeviceId the ventilatorDeviceId to set
     */
    protected void setVentilatorDeviceId(int ventilatorDeviceId) {
        this.ventilatorDeviceId = ventilatorDeviceId;
        m.notifyDeviceChange(this);
    }

    /**
     * @return the ventilatorDeviceIdExpected
     */
    public int getVentilatorDeviceIdExpected() {
        return ventilatorDeviceIdExpected;
    }

    /**
     * @param ventilatorDeviceIdExpected the ventilatorDeviceIdExpected to set
     */
    public void setVentilatorDeviceIdExpected(int ventilatorDeviceIdExpected) {
        //if frequency is 0, then send the command now
        try {
            m.sendCommand(parseDeviceIdForMultipleDevice(getRealDeviceId()),"ocv="+ventilatorDeviceIdExpected);
            setVentilatorDeviceId(ventilatorDeviceIdExpected);
        } catch (RemoteHomeConnectionException e) {
            //OK, device is not available, schedule the command
            this.ventilatorDeviceIdExpected = ventilatorDeviceIdExpected;
            setManageVentilatorDeviceIdAuto(true);
        }
    }

    /**
     * @return the manageVentilatorDeviceIdAuto
     */
    public boolean isManageVentilatorDeviceIdAuto() {
        return manageVentilatorDeviceIdAuto;
    }

    /**
     * @param manageVentilatorDeviceIdAuto the manageVentilatorDeviceIdAuto to set
     */
    protected void setManageVentilatorDeviceIdAuto(boolean manageVentilatorDeviceIdAuto) {
        this.manageVentilatorDeviceIdAuto = manageVentilatorDeviceIdAuto;
    }

    /**
     * @return the ventilatorSubDeviceId
     */
    public int getVentilatorSubDeviceId() {
        return ventilatorSubDeviceId;
    }

    /**
     * @param ventilatorSubDeviceId the ventilatorSubDeviceId to set
     */
    protected void setVentilatorSubDeviceId(int ventilatorSubDeviceId) {
        this.ventilatorSubDeviceId = ventilatorSubDeviceId;
        m.notifyDeviceChange(this);
    }

    /**
     * @return the ventilatorSubDeviceIdExpected
     */
    public int getVentilatorSubDeviceIdExpected() {
        return ventilatorSubDeviceIdExpected;
    }

    /**
     * @param ventilatorSubDeviceIdExpected the ventilatorSubDeviceIdExpected to set
     */
    public void setVentilatorSubDeviceIdExpected(int ventilatorSubDeviceIdExpected) {
        //if frequency is 0, then send the command now
        try {
            m.sendCommand(parseDeviceIdForMultipleDevice(getRealDeviceId()),"ocvs="+ventilatorSubDeviceIdExpected);
            setVentilatorSubDeviceId(ventilatorSubDeviceIdExpected);
        } catch (RemoteHomeConnectionException e) {
            //OK, device is not available, schedule the command
            this.ventilatorSubDeviceIdExpected = ventilatorSubDeviceIdExpected;
            setManageVentilatorSubDeviceIdAuto(true);
        }
    }

    /**
     * @return the manageVentilatorSubDeviceIdAuto
     */
    public boolean isManageVentilatorSubDeviceIdAuto() {
        return manageVentilatorSubDeviceIdAuto;
    }

    /**
     * @param manageVentilatorSubDeviceIdAuto the manageVentilatorSubDeviceIdAuto to set
     */
    protected void setManageVentilatorSubDeviceIdAuto(boolean manageVentilatorSubDeviceIdAuto) {
        this.manageVentilatorSubDeviceIdAuto = manageVentilatorSubDeviceIdAuto;
    }
    
    /*
     * This method is not supported for this device and will throw always RemoteHomeManagerException - NOT_SUPPORTED.
     * The status of the device is received asynchronously from the device.
     */
    public void updateDevice() throws RemoteHomeManagerException {
        throw new RemoteHomeManagerException(RemoteHomeManagerException.NOT_SUPPORTED);
    }
    /**
     * This method will save the current state of the device to the database together with the timestamp.
     */
    protected void saveHistoryData() throws RemoteHomeManagerException {
          HistoryData history = new HistoryData();
          history.setDeviceId(getDeviceId());
          history.setDataName("SINGLELINEDATA");
          history.setDataValue(Integer.toString(getCo2Concentration()));
          history.setDataTimestamp();
          m.getPersistance().addHistoryData(history);
          RemoteHomeManager.log.debug("Saved CO2 concentration history data. "+history.getDataName()+": "+history.getDataValue());        
    }

    @Override
    public String toString() {
        HashMap h = new HashMap();
        h.putAll(super.getFieldValues());
        h.put("co2Concentration", getCo2Concentration());
        h.put("co2ConcentrationVoltage", getCo2ConcentrationVoltage());
        h.put("lowCalibrationCo2Voltage", this.getLowCalibrationCo2Voltage());
        h.put("highCalibrationCo2Voltage", this.getHighCalibrationCo2Voltage());
        h.put("frequency", frequency);
        h.put("expectedFrequency", expectedFrequency);
        h.put("manageFrequencyAuto", manageFrequencyAuto);
        h.put("microcontrollerBattery", microcontrollerBattery);
        h.put("ventilatorDeviceId", getVentilatorDeviceId());
        h.put("ventilatorDeviceIdExpected", getVentilatorDeviceIdExpected());
        h.put("manageVentilatorDeviceIdAuto", isManageVentilatorDeviceIdAuto());
        h.put("ventilatorSubDeviceId", getVentilatorSubDeviceId());
        h.put("ventilatorSubDeviceIdExpected", getVentilatorSubDeviceIdExpected());
        h.put("manageVentilatorSubDeviceIdAuto", isManageVentilatorSubDeviceIdAuto());
        h.put("preheat24hours", isPreheat24hours());
        
        return h.toString();
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
        return 6.7f;
    }

    public class CO2ChartItem {
        private String xData;
        private int yData;

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
    }
    public ArrayList generateChartItems(HistoryData[] historyData, String type) {
        ArrayList<CO2SensorDevice.CO2ChartItem> retArray = new ArrayList<CO2SensorDevice.CO2ChartItem>();
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'.000Z'");
            for (HistoryData d : historyData) {
                CO2SensorDevice.CO2ChartItem item = new CO2SensorDevice.CO2ChartItem();            
                item.setxData(df.format(d.getDataTimestamp()));
                item.setyData(Integer.parseInt(d.getDataValue()));
                retArray.add(item);
            }
            return retArray;
    }
}
