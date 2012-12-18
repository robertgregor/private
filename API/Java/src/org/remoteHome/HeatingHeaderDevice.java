package org.remoteHome;

/**
 * 
 * @author Robert Gregor
 * 
 * Heating header
 * 
 * pn - check weather the device is up and runing (ping command)
 * ad - adaptation of the header. Each valve has different ranges of the open / close borders. This command will measure the time between the close / open and
 *     adapt the header to the valve. It needs to be run at the begining and then each two weeks.
 * s - return status 4|temperature|battery|frequency|expected temperature|openAngle
 * 	temperature format - 3 decimals degree celsius, e.g 233 = 23.3 or -23 = -23 or 022 = 2.2
 * 	battery voltage e.g. 29 = 2.9 or 30 3.0. Below 2.8, the hardware starts to work not correctly.
 * 	frequency - frequency in seconds to send status. Longer value, longer battery life
 * 	expected temperature - the value set with command t: 23.5 celsius = 47, or 17 celsius = 34
 * 	openAngle - Current open angle in % 100 - means close, 0 means fully open
 * m=nnn - set the frequency and put to the sleep mode. 1 means 10 seconds, 255 means 2550 seconds. Needs to be set to put the device to sleep mode!!!
 * 	If not set, or set to 0, then no sleep - usefull for testing and configuration, but consume lot of power and batery will be quicly empty.
 * t=nnn - Expected temperature - if set, the header is running in self managed mode - each frequency period checks the current temperature, and if it is lower, open the
 *     valve and then sleep another period. The value is temperature * 2, it means, that 23.5 celsius = 47, or 17 celsius = 34.
 *     If it is set to 0, then valve is operated manually: each frequency period the valve send status, then you have 2 seconds to send l command to set the open angle of the valve.
 * l=nnn Set manually the valve to expected position allowed range is 100 closed, 0 fully open.
 * 
 *     Asynchronous messages: As - adaptation start, Ae - adaptation end, l|nnn after the valve is moved to correct position, the actual current position is sent. 
 *         
 *     Quick startup:
 *     1. Insert battery
 *     2. Test the communication AT+0=pn<ENTER>
 *     3. Assign the device ID: AT+a=9<ENTER>  Id is 9. Adaptation start. As is printed after while Ae is printed with the Valve position 100 - fully closed
 *     
 *     Self managed mode                                                                       Manual mode
 *     4. AT+9=t=45<ENTER> set temperature in room to 22,5 celsius                             AT+9=t=0<ENTER> manual mode, temperature is 0
 *     5. AT+9=m=60<ENTER>    sleep 10 minutes                                                   AT+9=m=60<ENTER>    sleep 10 minutes
 *     After 10 minutes the status is sent, you have to answer after the valve is set l|100    After 10 minutes the status is sent, sent back the new position
 *     6. AT+9=t=34<ENTER> Lower the temperature for the night                                   AT+9=l=50<ENTER> Opened 50 percent.
 */
public class HeatingHeaderDevice extends AbstractDevice {
    /**
     * Current temperature
     */
    private int temperature; 

    /**
     * Expected temperature value should be set by external system in order to trigger the tepmerature change
     * Also the manageTemperatureAuto method should be set to true.
     * @see manageTemperatureAuto
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
     * Open angle
     */
    private int openAngle; 

    /**
     * Expected open angle value should be set by external system in order to trigger the value change
     * Also the manageOpenAngleAuto method should be set to true.
     * @see manageOpenAngleAuto
     */
    private int expectedOpenAngle; 

    /**
     * Set this to true, if you want to set the expected open angle
     */
    private boolean manageOpenAngleAuto;
    
    /**
     * Frequency
     */
    private int frequency; 

    /**
     * Expected frequency value should be set by external system in order to trigger the value change
     * Also the manageOpenAngleAuto method should be set to true.
     * @see manageTemperatureAuto
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

    public HeatingHeaderDevice(RemoteHomeManager m, int deviceId, String deviceName) {
        super (m, deviceId, deviceName);        
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
    public void manageAsynchronousCommand(String[] items) {
        if (items[0].equals("4")) {
            //This is the status
            this.setTemperature(Integer.parseInt(items[1]));
            this.setBattery(Integer.parseInt(items[2]));
            this.setFrequency(Integer.parseInt(items[3])*10); //Frequency in seconds * 10
            this.setExpectedTemperature((Integer.parseInt(items[4])*10)/2); //0.5 is one degree celsius
            this.setOpenAngle(Integer.parseInt(items[5]));
        } else if (items[0].equals("l")) {
            this.setOpenAngle(Integer.parseInt(items[1]));
        }
        //here manage the temperature
        try {
            if (isManageTemperatureAuto() && (getDeviceExpectedTemperature() != getExpectedTemperature())) {
                // OK, set expected temperature
                m.sendCommand(getDeviceId(),"t="+(getExpectedTemperature()*2)/10);
                setManageTemperatureAuto(false);
            } else if (isManageOpenAngleAuto() && (getExpectedOpenAngle() != getOpenAngle())) {
                m.sendCommand(getDeviceId(),"l="+getExpectedOpenAngle());
                setManageOpenAngleAuto(false);
            } else if (isManageFrequencyAuto() && (getExpectedFrequency() != getFrequency())) {
                m.sendCommand(getDeviceId(),"m="+getExpectedFrequency()/10);
                setManageOpenAngleAuto(false);
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
    private void setTemperature(int temperature) {
        this.temperature = temperature;
    }

    /**
     * Expected temperature value should be set by external system in order to trigger the tepmerature change
     * Also the manageTemperatureAuto method should be set to true.
     * @see manageTemperatureAuto
     * @return the expectedTemperature
     */
    public int getExpectedTemperature() {
        return expectedTemperature;
    }

    /**
     * Expected temperature value should be set by external system in order to trigger the tepmerature change
     * Also the manageTemperatureAuto method should be set to true.
     * @see manageTemperatureAuto
     * @param expectedTemperature the expectedTemperature to set
     */
    public void setExpectedTemperature(int expectedTemperature) {
        this.expectedTemperature = expectedTemperature;
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
    public void setManageTemperatureAuto(boolean manageTemperatureAuto) {
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
    public void setDeviceExpectedTemperature(int deviceExpectedTemperature) {
        this.deviceExpectedTemperature = deviceExpectedTemperature;
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
    public void setOpenAngle(int openAngle) {
        this.openAngle = openAngle;
    }

    /**
     * Expected open angle value should be set by external system in order to trigger the value change
     * Also the manageOpenAngleAuto method should be set to true.
     * @see manageOpenAngleAuto
     * @return the expectedOpenAngle
     */
    public int getExpectedOpenAngle() {
        return expectedOpenAngle;
    }

    /**
     * Expected open angle value should be set by external system in order to trigger the value change
     * Also the manageOpenAngleAuto method should be set to true.
     * @see manageOpenAngleAuto
     * @param expectedOpenAngle the expectedOpenAngle to set
     */
    public void setExpectedOpenAngle(int expectedOpenAngle) {
        this.expectedOpenAngle = expectedOpenAngle;
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
    public void setManageOpenAngleAuto(boolean manageOpenAngleAuto) {
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
     * Frequency
     * @param frequency the frequency to set
     */
    public void setFrequency(int frequency) {
        this.frequency = frequency;
    }

    /**
     * Expected frequency value should be set by external system in order to trigger the value change
     * Also the manageOpenAngleAuto method should be set to true.
     * @see manageTemperatureAuto
     * @return the expectedFrequency
     */
    public int getExpectedFrequency() {
        return expectedFrequency;
    }

    /**
     * Expected frequency value should be set by external system in order to trigger the value change
     * Also the manageOpenAngleAuto method should be set to true.
     * @see manageTemperatureAuto
     * @param expectedFrequency the expectedFrequency to set
     */
    public void setExpectedFrequency(int expectedFrequency) {
        this.expectedFrequency = expectedFrequency;
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
    public void setManageFrequencyAuto(boolean manageFrequencyAuto) {
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
    public void setBattery(int battery) {
        this.battery = battery;
    }
}
