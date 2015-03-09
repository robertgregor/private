/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.remoteHome;

import com.sun.net.httpserver.HttpExchange;
import java.io.OutputStream;
import java.io.Serializable;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * Temperature and humidity meter sketch
 * 
 * Radio commands (Works only 1st minutes after the power on, if interval is not 0). Please be sure to set the interval, othervise the unit doesn't switch to sleep mode and the battery will be exhausted quickly.
 * 
 * s - return status 10|temperature|humidity|battery|frequency|thermostatId|thermostatSubDeviceId|humidityId|humiditySubDeviceId
 * 	temperature format - always sign, 2 decimals degree celsius, dot, 2 decimals, e.g 23.32 or -02.32 or 02.20
 * 	humidity format - 2 decimals, dot, 2 decimals, e.g 30.32 or 02.20
 * 	battery voltage e.g. 2.9 or 3.0
 * 	frequency - frequency in seconds to send status. Longer value, longer battery life
 *         thermostatId - thermostat device Id, where the temperature meter is sending the temperature
 *         thermostatSubDeviceId - thermostat sub device Id, where the temperature meter is sending the temperature
 * m=nnn - set the frequency and put to the sleep mode. 1 means 10 seconds, 254 means 2540 seconds. Needs to be set to put the device to sleep mode!!!
 * 	If not set, or set to 0, then no sleep - usefull for testing, but consume lot of power and batery will be quicly empty.
 * t=nnn - set the thermostat device Id, where the temperature should be sent. The range is 0 < nnn < 255.
 * ts=nnn - set the thermostat subdevice device Id, where the temperature should be sent. The range is 0 < nnn < 9.
 * h=nnn - set the ventilator device Id, where the humidity should be sent. The range is 0 < nnn < 255.
 * hs=nnn - set the ventilator subdevice device Id, where the humidity should be sent. The range is 0 < nnn < 9.
 * 
 * 
 * pn - check weather the device is up and runing (ping command) - returns OK
 * nn - check weather the device is up and runing (ping command) - returns nothing - used by the transceiver to measure the RSSI.
 * res - reset the device
 * def - reset the device and place the EEPROM device to factory default
 * 
 * Serial commands:
 * at+c=XXX Configure the channel - Network. Receiver should have the same channel than all the devices. There could be channels 1 >= XXX >= 254
 * at+n=XXX Configure the node Id - Network. Node ID should be unique and identify the node in the network. There could be channels 1 >= XXX >= 254. The receiver has always nodeId = 255.
 * at+res Reset the device
 * at+def Reset the device and set the factory default values of EEPROM
 * at+memid=XXX To set the eeprom value. This command preset the address
 * at+memval=XXX This command set the XXX value at the position memid in the EEPROM
 * at+p=thisIsEncryptKey - for AES encryption, this command set the symetric key for encryption between the transceiver and the device. Should be exactly 16 characters
 * at+s - print the status of the device. Values are separated by \t character.
 * at+m=XXX - set the frequency and put to the sleep mode. 1 means 10 seconds, 254 means 2540 seconds. Needs to be set to put the device to sleep mode!!!
 * 	   If not set, or set to 0, then no sleep - usefull for testing, but consume lot of power and batery will be quicly empty.
 * at+t=XXX - set the thermostat device Id, where the temperature should be sent. The range is 0 < nnn < 255.
 * at+ts=XXX - set the thermostat sub device Id, where the temperature should be sent. The range is 0 < nnn < 255.
 * at+h=XXX - set the ventilator device Id, where the humidity should be sent. The range is 0 < nnn < 255.
 * at+hs=XXX - set the ventilator sub device Id, where the humidity should be sent. The range is 0 < nnn < 255.
 */

public class TemperatureHumiditySensorDevice extends AbstractDevice implements Serializable  {
   /**
     * Current temperature
     */
    private float temperature; 

   /**
     * Current humidity
     */
    private float humidity; 

    /**
     * Frequency in seconds
     */
    private int frequency; 

    /**
     * Expected frequency in seconds value should be set by external system in order to trigger the value change
     * Also the manageOpenAngleAuto method should be set to true.
     */
    private int expectedFrequency = 0; 

    /**
     * Set this to true, if you want to set the expected frequency
     */
    private boolean manageFrequencyAuto = false;

    /**
     * Thermostat device Id, where to send the temperature.
     */
    private String thermostatDeviceId; 
    
    /**
     * Expected thermostat device Id is the value, which should be set by external system in order to trigger the value change.
     * Also the manageThermostatDeviceIdAuto method should be set to true.
     */
    private String expectedThermostatDeviceId; 

    /**
     * Set this to true, if you want to set the thermostat device id
     */
    private boolean manageThermostatDeviceIdAuto = false;

    /**
     * Sub device Id, where to send the temperature.
     */
    private int thermostatSubDeviceId; 
    
    /**
     * Expected thermostat sub device Id is the value, which should be set by external system in order to trigger the value change.
     * Also the manageThermostatSubDeviceIdAuto method should be set to true.
     */
    private int expectedThermostatSubDeviceId; 

    /**
     * Set this to true, if you want to set the thermostat sub device id
     */
    private boolean manageThermostatSubDeviceIdAuto = false;

    /**
     * humidity device Id, where to send the humidity.
     */
    private String humidityDeviceId; 
    
    /**
     * Expected humidity device Id is the value, which should be set by external system in order to trigger the value change.
     * Also the manageHumidityDeviceIdAuto method should be set to true.
     */
    private String expectedHumidityDeviceId; 

    /**
     * Set this to true, if you want to set the humidity device id
     */
    private boolean manageHumidityDeviceIdAuto = false;

    /**
     * Sub device Id, where to send the humidity.
     */
    private int humiditySubDeviceId; 
    
    /**
     * Expected humidity sub device Id is the value, which should be set by external system in order to trigger the value change.
     * Also the manageHumiditySubDeviceIdAuto method should be set to true.
     */
    private int expectedHumiditySubDeviceId; 

    /**
     * Set this to true, if you want to set the humidity sub device id
     */
    private boolean manageHumiditySubDeviceIdAuto = false;

    /**
     * The constructor is protected. The object should be constructed using
     * TemperatureHumiditySensorDevice device = 
     *          (TemperatureHumiditySensorDevice)remoteHomeManager.getRemoteHomeDevice(deviceId,deviceName, AbstractDevice.TemperatureHumiditySensor)
     * 
     * @param m remote manager reference
     * @param deviceId deviceId assigned to this device
     * @param deviceName device name
     **/

    protected TemperatureHumiditySensorDevice(RemoteHomeManager m, int deviceId, String deviceName) {
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
             * 10|temperature|humidity|battery|frequency|thermostatId|thermostatSubDeviceId|humidityId|humiditySubDeviceId - status
      */
    @Override
    protected void manageAsynchronousCommand(String[] items) {
        if (items[0].equals("10")) {
            temperature = Float.parseFloat(items[1]);
            humidity = Float.parseFloat(items[2]);
            setBattery(Float.parseFloat(items[3]));
            frequency = Integer.parseInt(items[4]);
            thermostatDeviceId = items[5];
            thermostatSubDeviceId = Integer.parseInt(items[6]);
            humidityDeviceId = items[7];
            humiditySubDeviceId = Integer.parseInt(items[8]);
            timestamp = System.currentTimeMillis();
            try {
                saveHistoryData();
            } catch (RemoteHomeManagerException e) {
                RemoteHomeManager.log.error(58,e);
            }            
            m.notifyDeviceChange(this);
            RemoteHomeManager.log.debug("Values set. Current values: "+toString());
        }
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
                             RemoteHomeManager.log.error(231, e);
                         }
                     }
                }).start();
            }
            if (isManageThermostatDeviceIdAuto()) {
                RemoteHomeManager.log.debug("Going to set new thermostat device ID: "+getExpectedThermostatDeviceId());
                new Thread(new Runnable() {
                     public void run() {
                         try {
                            m.sendCommand(getDeviceId(),"t="+getExpectedThermostatDeviceId());
                            setManageThermostatDeviceIdAuto(false);
                            setThermostatDeviceId(getExpectedThermostatDeviceId());
                            expectedThermostatDeviceId = "";
                            RemoteHomeManager.log.info("New thermostat device ID set: "+getThermostatDeviceId());
                         } catch (Exception e) {                                                         
                             RemoteHomeManager.log.error(232, e);
                         }
                     }
                }).start();
            }
            if (isManageThermostatSubDeviceIdAuto()) {
                RemoteHomeManager.log.debug("Going to set new thermostat sub device ID: "+getExpectedThermostatSubDeviceId());
                new Thread(new Runnable() {
                     public void run() {
                         try {
                            m.sendCommand(getDeviceId(),"ts="+getExpectedThermostatSubDeviceId());
                            setManageThermostatSubDeviceIdAuto(false);
                            setThermostatSubDeviceId(getExpectedThermostatSubDeviceId());
                            expectedThermostatSubDeviceId = 0;
                            RemoteHomeManager.log.info("New thermostat sub device ID set: "+getThermostatSubDeviceId());
                         } catch (Exception e) {
                             RemoteHomeManager.log.error(233, e);
                         }
                     }
                }).start();
            }
            if (isManageHumidityDeviceIdAuto()) {
                RemoteHomeManager.log.debug("Going to set new humidity device ID: "+getExpectedHumidityDeviceId());
                new Thread(new Runnable() {
                     public void run() {
                         try {
                            m.sendCommand(getDeviceId(),"h="+getExpectedHumidityDeviceId());
                            setManageHumidityDeviceIdAuto(false);
                            setHumidityDeviceId(getExpectedHumidityDeviceId());
                            expectedHumidityDeviceId = "";
                            RemoteHomeManager.log.info("New humidity device ID set: "+getHumidityDeviceId());
                         } catch (Exception e) {                                                         
                             RemoteHomeManager.log.error(232, e);
                         }
                     }
                }).start();
            }
            if (isManageHumiditySubDeviceIdAuto()) {
                RemoteHomeManager.log.debug("Going to set new humidity sub device ID: "+getExpectedHumiditySubDeviceId());
                new Thread(new Runnable() {
                     public void run() {
                         try {
                            m.sendCommand(getDeviceId(),"hs="+getExpectedHumiditySubDeviceId());
                            setManageHumiditySubDeviceIdAuto(false);
                            setHumiditySubDeviceId(getExpectedHumiditySubDeviceId());
                            expectedHumiditySubDeviceId = 0;
                            RemoteHomeManager.log.info("New humidity sub device ID set: "+getHumiditySubDeviceId());
                         } catch (Exception e) {
                             RemoteHomeManager.log.error(233, e);
                         }
                     }
                }).start();
            }
    }
    
    /**
      * Not used
      */
    @Override
    protected void manageAsynchronousCommand(OutputStream o, HttpExchange t, HashMap<String, String> requestParameters) {
        if (requestParameters.get("v").equals("1.0.0")) {
            temperature = Float.parseFloat(requestParameters.get("t"));
            humidity = Float.parseFloat(requestParameters.get("h"));
            setBattery(Float.parseFloat(requestParameters.get("b")));
            frequency = Integer.parseInt(requestParameters.get("p"));
            thermostatDeviceId = requestParameters.get("tip");
            thermostatSubDeviceId = Integer.parseInt(requestParameters.get("ts"));
            humidityDeviceId = requestParameters.get("vip");
            humiditySubDeviceId = Integer.parseInt(requestParameters.get("vs"));
            timestamp = System.currentTimeMillis();
            try {
                saveHistoryData();
            } catch (RemoteHomeManagerException e) {
                RemoteHomeManager.log.error(58,e);
            }            
            m.notifyDeviceChange(this);
            RemoteHomeManager.log.debug("Values set. Current values: "+toString());
        }
        //here manage the parameters which has to be changed. The parameters should be send all together. The example of the query:
        //GET /ce?cs=192.168.1.103&cp=8080&cr=8081&cd=1&e=6&f=192.168.1.17&g=1&h=192.168.1.18&i=2 HTTP/1.1
        RemoteHomeManager.log.debug("Manage freq. auto: " + isManageFrequencyAuto()+" manage thermostat device Id auto: " + isManageThermostatDeviceIdAuto() +
                " manage thermostat sub device Id auto: " + isManageThermostatSubDeviceIdAuto() + " manage humidity device Id auto: " + isManageHumidityDeviceIdAuto() +
                " manage humidity sub device Id auto: "+isManageHumiditySubDeviceIdAuto());
        if (isManageFrequencyAuto() || 
                isManageThermostatDeviceIdAuto() || 
                isManageThermostatSubDeviceIdAuto() || 
                isManageHumidityDeviceIdAuto() || 
                isManageHumiditySubDeviceIdAuto()) {
            final String remoteAddr = t.getRemoteAddress().getHostString();
            final HashMap<String, String> rp = requestParameters;
            new Thread(new Runnable() {
              public void run() {
               try {
                 Thread.sleep(50);
                 URL obj = new URL("http://"+remoteAddr+"/ce?cs="+rp.get("ip")+"&cp="+
                        rp.get("sp")+"&cr="+
                        rp.get("pp")+"&cd="+
                        rp.get("n")+"&e="+
                        (isManageFrequencyAuto()?getExpectedFrequency():getFrequency())+"&f="+
                        (isManageThermostatDeviceIdAuto()?getExpectedThermostatDeviceId():getThermostatDeviceId())+"&g="+
                        (isManageThermostatSubDeviceIdAuto()?getExpectedThermostatSubDeviceId():getThermostatSubDeviceId())+"&h="+
                        (isManageHumidityDeviceIdAuto()?getExpectedHumidityDeviceId():getHumidityDeviceId())+"&i="+
                        (isManageHumiditySubDeviceIdAuto()?getExpectedHumiditySubDeviceId():getHumiditySubDeviceId()));
                 RemoteHomeManager.log.info("Going to set new values: "+obj.toString());
                 HttpURLConnection con = (HttpURLConnection) obj.openConnection();
                 con.setRequestMethod("GET");
                 if (con.getResponseCode() == 200) {
                    //OK, it was configured
                    setManageThermostatDeviceIdAuto(false); setManageThermostatSubDeviceIdAuto(false); 
                    setManageHumidityDeviceIdAuto(false); setManageHumiditySubDeviceIdAuto(false);
                    setManageFrequencyAuto(false);
                    frequency = getExpectedFrequency();
                    expectedFrequency = 0;
                    thermostatDeviceId = getExpectedThermostatDeviceId();
                    expectedThermostatDeviceId = "";                
                    thermostatSubDeviceId = getExpectedThermostatSubDeviceId();
                    expectedThermostatSubDeviceId = 0;                
                    humidityDeviceId = getExpectedHumidityDeviceId();
                    expectedHumidityDeviceId = "";               
                    setHumiditySubDeviceId(getExpectedHumiditySubDeviceId());
                    expectedHumiditySubDeviceId = 0;                    
                    con.disconnect();
                    RemoteHomeManager.log.info("New values has been set: "+TemperatureHumiditySensorDevice.this.toString());
                    m.getPersistance().saveDevice(TemperatureHumiditySensorDevice.this);
                 }
               } catch (Exception e) {
                   RemoteHomeManager.log.error(1112,e);
               }
              }
            }).start();            
        }
    }
    
    /**
     * Current temperature
     * @return the temperature
     */
    public float getTemperature() {
        return temperature;
    }

    /**
     * Current temperature
     * @param temperature the temperature to set
     */
    private void setTemperature(float temperature) {
        this.temperature = temperature;
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
     */
    public void setInitialFrequency() throws RemoteHomeConnectionException {
        this.frequency = 10;
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

    /**
     * @return the thermostatDeviceId
     */
    public String getThermostatDeviceId() {
        return thermostatDeviceId;
    }

    /**
     * @param thermostatDeviceId the thermostatDeviceId to set. To set this value please use setExpectedThermostatDeviceId().
     */
    protected void setThermostatDeviceId(String thermostatDeviceId) {
        this.thermostatDeviceId = thermostatDeviceId;
        m.notifyDeviceChange(this);
    }

    /**
     * @return the thermostatSubDeviceId
     */
    public int getThermostatSubDeviceId() {
        return thermostatSubDeviceId;
    }

    /**
     * @param thermostatSubDeviceId the thermostatSubDeviceId to set. To set this value please use setExpectedThermostatSubDeviceId().
     */
    protected void setThermostatSubDeviceId(int thermostatSubDeviceId) {
        this.thermostatSubDeviceId = thermostatSubDeviceId;
        m.notifyDeviceChange(this);
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
          history.setDataValue(Float.toString(getTemperature()));
          history.setDataTimestamp();
          m.getPersistance().addHistoryData(history);
          RemoteHomeManager.log.debug("Saved history data. "+history);
          HistoryData history_2 = new HistoryData();
          history_2.setDeviceId(getDeviceId());
          history_2.setDataName("SINGLELINEDATA_2");
          history_2.setDataValue(Float.toString(this.getHumidity()));
          history_2.setDataTimestamp();
          m.getPersistance().addHistoryData(history_2);
          RemoteHomeManager.log.debug("Saved history data. "+history_2);

    }

    /**
     * @return the expectedThermostatDeviceId
     */
    public String getExpectedThermostatDeviceId() {
            return expectedThermostatDeviceId;
    }

    /**
     * @param expectedThermostatDeviceId the expectedThermostatDeviceId to set
     */
    public void setExpectedThermostatDeviceId(String expectedThermostatDeviceId) {
        this.expectedThermostatDeviceId = expectedThermostatDeviceId;
        setManageThermostatDeviceIdAuto(true);
    }

    /**
     * @return the manageThermostatDeviceIdAuto
     */
    public boolean isManageThermostatDeviceIdAuto() {
        return manageThermostatDeviceIdAuto;
    }

    /**
     * @param manageThermostatDeviceIdAuto the manageThermostatDeviceIdAuto to set
     */
    public void setManageThermostatDeviceIdAuto(boolean manageThermostatDeviceIdAuto) {
        this.manageThermostatDeviceIdAuto = manageThermostatDeviceIdAuto;
    }

    /**
     * @return the expectedThermostatSubDeviceId
     */
    public int getExpectedThermostatSubDeviceId() {
            return expectedThermostatSubDeviceId;
    }

    /**
     * @param expectedThermostatSubDeviceId the expectedThermostatSubDeviceId to set
     */
    public void setExpectedThermostatSubDeviceId(int expectedThermostatSubDeviceId) {
        this.expectedThermostatSubDeviceId = expectedThermostatSubDeviceId;
        setManageThermostatSubDeviceIdAuto(true);
    }

    /**
     * @return the manageThermostatSubDeviceIdAuto
     */
    public boolean isManageThermostatSubDeviceIdAuto() {
        return manageThermostatSubDeviceIdAuto;
    }

    /**
     * @param manageThermostatSubDeviceIdAuto the manageThermostatSubDeviceIdAuto to set
     */
    public void setManageThermostatSubDeviceIdAuto(boolean manageThermostatSubDeviceIdAuto) {
        this.manageThermostatSubDeviceIdAuto = manageThermostatSubDeviceIdAuto;
    }

    /**
     * @return the humidity
     */
    public float getHumidity() {
        return humidity;
    }

    /**
     * @param humidity the humidity to set
     */
    private void setHumidity(float humidity) {
        this.humidity = humidity;
    }

    /**
     * @return the humidityDeviceId
     */
    public String getHumidityDeviceId() {
        return humidityDeviceId;
    }

    /**
     * @param humidityDeviceId the humidityDeviceId to set
     */
    protected void setHumidityDeviceId(String humidityDeviceId) {
        this.humidityDeviceId = humidityDeviceId;
        m.notifyDeviceChange(this);
    }

    /**
     * @return the expectedHumidityDeviceId
     */
    public String getExpectedHumidityDeviceId() {
        return expectedHumidityDeviceId;
    }

    /**
     * @param expectedHumidityDeviceId the expectedHumidityDeviceId to set
     */
    public void setExpectedHumidityDeviceId(String expectedHumidityDeviceId) {
        this.expectedHumidityDeviceId = expectedHumidityDeviceId;
        setManageHumidityDeviceIdAuto(true);
    }

    /**
     * @return the manageHumidityDeviceIdAuto
     */
    public boolean isManageHumidityDeviceIdAuto() {
        return manageHumidityDeviceIdAuto;
    }

    /**
     * @param manageHumidityDeviceIdAuto the manageHumidityDeviceIdAuto to set
     */
    public void setManageHumidityDeviceIdAuto(boolean manageHumidityDeviceIdAuto) {
        this.manageHumidityDeviceIdAuto = manageHumidityDeviceIdAuto;
    }

    /**
     * @return the humiditySubDeviceId
     */
    public int getHumiditySubDeviceId() {
        return humiditySubDeviceId;
    }

    /**
     * @param humiditySubDeviceId the humiditySubDeviceId to set
     */
    protected void setHumiditySubDeviceId(int humiditySubDeviceId) {
        this.humiditySubDeviceId = humiditySubDeviceId;
        m.notifyDeviceChange(this);
    }

    /**
     * @return the expectedHumiditySubDeviceId
     */
    public int getExpectedHumiditySubDeviceId() {
        return expectedHumiditySubDeviceId;
    }

    /**
     * @param expectedHumiditySubDeviceId the expectedHumiditySubDeviceId to set
     */
    public void setExpectedHumiditySubDeviceId(int expectedHumiditySubDeviceId) {
        this.expectedHumiditySubDeviceId = expectedHumiditySubDeviceId;
        setManageHumiditySubDeviceIdAuto(true);
    }

    /**
     * @return the manageHumiditySubDeviceIdAuto
     */
    public boolean isManageHumiditySubDeviceIdAuto() {
        return manageHumiditySubDeviceIdAuto;
    }

    /**
     * @param manageHumiditySubDeviceIdAuto the manageHumiditySubDeviceIdAuto to set
     */
    public void setManageHumiditySubDeviceIdAuto(boolean manageHumiditySubDeviceIdAuto) {
        this.manageHumiditySubDeviceIdAuto = manageHumiditySubDeviceIdAuto;
    }

    @Override
    public String toString() {
        HashMap h = new HashMap();
        h.putAll(super.getFieldValues());
        h.put("temperature", temperature);
        h.put("humidity", humidity);
        h.put("frequency", frequency);
        h.put("expectedFrequency", expectedFrequency);
        h.put("manageFrequencyAuto", manageFrequencyAuto);
        h.put("thermostatDeviceId", thermostatDeviceId);
        h.put("expectedThermostatDeviceId", expectedThermostatDeviceId);
        h.put("manageExpectedThermostatDeviceIdAuto", manageThermostatDeviceIdAuto);
        h.put("thermostatSubDeviceId", thermostatSubDeviceId);
        h.put("expectedThermostatSubDeviceId", expectedThermostatSubDeviceId);
        h.put("manageExpectedThermostatSubDeviceIdAuto", manageThermostatSubDeviceIdAuto);
        h.put("humidityDeviceId", humidityDeviceId);
        h.put("expectedHumidityDeviceId", expectedHumidityDeviceId);
        h.put("manageHumidityDeviceIdAuto", manageHumidityDeviceIdAuto);        
        h.put("humiditySubDeviceId", humiditySubDeviceId);
        h.put("expectedHumiditySubDeviceId", expectedHumiditySubDeviceId);
        h.put("manageHumiditySubDeviceIdAuto", manageHumiditySubDeviceIdAuto);
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
        return 2.8f;
    }

    public class ChartItem {
        private String xData;
        private float yData;

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
        public float getyData() {
            return yData;
        }

        /**
         * @param yData the yData to set
         */
        public void setyData(float yData) {
            this.yData = yData;
        }
    }
    public ArrayList generateChartItems(HistoryData[] historyData, String type) {
        ArrayList<TemperatureHumiditySensorDevice.ChartItem> retArray = new ArrayList<TemperatureHumiditySensorDevice.ChartItem>();
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'.000Z'");
            for (HistoryData d : historyData) {
                TemperatureHumiditySensorDevice.ChartItem item = new TemperatureHumiditySensorDevice.ChartItem();            
                item.setxData(df.format(d.getDataTimestamp()));
                item.setyData(Float.parseFloat(d.getDataValue()));
                retArray.add(item);
            }
            return retArray;
    }

}
