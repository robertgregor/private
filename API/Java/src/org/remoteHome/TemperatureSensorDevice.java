package org.remoteHome;

import java.io.Serializable;

/**
  * Temperature sensor<BR/>
  * 
  * pn - check weather the device is up and running (ping command).<BR/>
  * m=nnn - set the frequency and put to the sleep mode. 1 means 10 seconds, 255 means 2550 seconds. Needs to be set to put the device to sleep mode!!!<BR/>
  *     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;If not set, or set to 0, then no sleep - usefull for testing, but consume lot of power and batery will be quicly empty.<BR/>
  * s - return status 2|temperature|battery|frequency<BR/>
  *	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;temperature format - always sign, 2 decimals degree celsius, dot, 2 decimals, e.g +23.32 or -02.32 or +02.20<BR/>
  *	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;battery voltage e.g. 2.9 or 3.0<BR/>
  *     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;frequency - frequency in seconds to send status. Longer value, longer battery life<BR/><BR/>
  *
  *     Quick startup:<BR/><BR/>
  *     1. Insert the battery<BR/>
  *     2. Test the communication AT+0=pn<BR/>
  *     3. Assign the device ID: AT+a=5  Id is 5.<BR/>
  *     4. Test the device: AT+5=s Should return back the status.<BR/>
  *     5. Configure the sleep period: AT+5=m=60 This means 10 minutes timeout (60 * 10) seconds = 600 / 60 = 10 mins.<BR/>
  *     6. Now you can use this API.<BR/>
  * 
  * @author Robert Gregor
  */
public class TemperatureSensorDevice extends AbstractDevice implements Serializable {
   /**
     * Current temperature
     */
    private int temperature; 

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
     * The constructor is protected. The object should be constructed using
     * TemperatureSensorDevice device = 
     *          (TemperatureSensorDevice)remoteHomeManager.getRemoteHomeDevice(deviceId,deviceName, AbstractDevice.TemperatureSensor)
     * 
     * @param m remote manager reference
     * @param deviceId deviceId assigned to this device
     * @param deviceName device name
     **/

    protected TemperatureSensorDevice(RemoteHomeManager m, int deviceId, String deviceName) {
        super (m, deviceId, deviceName);        
    }
    
    /**
      * 
      * @param items the data from asynchronous event. Could be:
             * 2|temperature|battery|frequency - status
      */
    @Override
    protected void manageAsynchronousCommand(String[] items) {
        if (items[0].equals("2")) {
            //This is the status
            this.setTemperature(Integer.parseInt(items[1]));
            this.setBattery(Integer.parseInt(items[2]));
            this.setFrequency(Integer.parseInt(items[3])*10); //Frequency in seconds * 10
        }
        //here manage the temperature
        try {
            if (isManageFrequencyAuto() && (getExpectedFrequency() != getFrequency())) {
                m.sendCommand(getDeviceId(),"m="+getExpectedFrequency()/10);
                setManageFrequencyAuto(false);
            }
        } catch (RemoteHomeConnectionException e) {
            //there is no way how to report this exception
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
     * Frequency in seconds
     * @return the frequency in seconds
     */
    public int getFrequency() {
        return frequency;
    }

    /**
     * Frequency  in seconds
     * @param frequency in seconds the frequency to set 
     */
    protected void setFrequency(int frequency) {
        this.frequency = frequency;
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
        manageFrequencyAuto = true;
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
    protected void setManageFrequencyAuto(boolean manageFrequencyAuto) {
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
    
}
