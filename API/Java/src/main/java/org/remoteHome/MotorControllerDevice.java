package org.remoteHome;

import com.sun.net.httpserver.HttpExchange;
import java.io.OutputStream;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;


/**
  * Motor controller<br/>
  * <br/>
  * bxt=nnn - configure number of seconds, when the blind is moving fully from the open position to closed position.
  * bxu - blinds up moving to fully open position it means 0 %
  * bxd - blinds down moving to fully closed position it means 100 %
  * bxp - blinds stop stop movements
  * bxc=nnn - Move to the nnn position. nnn is the percentage between open and close. 0 - fully open, 100 - fully closed
  * bxm=nnn - Timeout value - number of configured timeout in 100 msec. This value is the 100 % time to open the blinds
  * bxs - return status 1b|blindId|down|up|timeout value|current timeout value|expected opening|current opening
  *     blindID - number of blind ( It is in fact value x )
  * 	down - 1 if currently moving down
  * 	up - 1 if currently moving up
  * 	timeout value - number of configured timeout in 100 msec. This value is the 100 % time to open the blinds
  * 	current timeout value - number of configured timeout in 100 msec. This value is the 100 % time to open the blinds
  *     expected opening - Blinds opening in %. This is expected value. When the blind reach that value, it will stop and will send the asynchronous command.
  * 	current opening - Blinds opening in %. 0 means fully open, 100 means fully closed. If the blinds moving, it display current position. If it is not moving, this value should match the value of the expected temperature.
  * 
  * x - pair of the relays number. In this mode, always 2 relays form 1 controller. So to use this mode, 2 relay board or 8 relay board should be used. So e.g. b2u command means, that blind's motor is connected to relays 3 and 4.
  * Asynchronous messages (It is changed, when the status of the device change):
  * 1b|blindId|down|up|timeout value|current timeout value|expected opening|current opening
  * 
  * <br/><br/> 
  * 
  * @author Robert Gregor
  */
public class MotorControllerDevice extends AbstractDevice implements Serializable {
    
    /**
     * When the blinds are moving already, this is true.
     */
    private boolean moving;
    
    /**
     * When the blinds are moving up, this is true.
     */
    private boolean movingUp;

    /**
     * When the blinds are moving down, this is true.
     */
    private boolean movingDown;

    /**
     * Calibration value of the blinds. It is time in seconds, from fully opened position to fully closed position.
     */
    private int fullRangeTimeout;
    
    /**
     * Current opening is the value in percent of the position. Fully opened is 0, fully closed is 100.
     */
    private int currentOpening;

    /*
     * This is automatic scheduler
     */
    private PercentageSchedule positionSchedule = new PercentageSchedule();

    /*
     * This is true if scheduler is enabled.
     */
    private boolean enabledScheduler;
    
    /*
     * This is true if power has been lost and the message "LP" has been received.
     */
    private boolean powerLost;    

   /**
     * The constructor is protected. The object should be constructed using
     * BlindsControllerDevice device = 
     *          (BlindsControllerDevice)remoteHomeManager.getRemoteHomeDevice(deviceId,deviceName, AbstractDevice.BlindsController)
     * 
     * @param m remote manager reference
     * @param deviceId deviceId assigned to this device
     * @param deviceName device name
     */    
    protected MotorControllerDevice(RemoteHomeManager m, int deviceId, String deviceName) {
        super (m, deviceId, deviceName);
        setSubDeviceNumber("1");
        positionSchedule = new PercentageSchedule();
    }
    /**
     * Contains the initialization of the device.
     */
    protected void init() {
        try {
            updateDevice();
        } catch (Exception e) {
            RemoteHomeManager.log.error(42,e);
        }
    }
    /**
     * Receive asynchronous command
     * 
     * @param statusResponse items returned back
     */    
    @Override
    protected void manageAsynchronousCommand(String[] statusResponse) {
        if (statusResponse[0].equals("LP")) {
            setPowerLost(true);
            movingDown = false;
            movingUp = false;
            moving = false;
        } else {
            setPowerLost(false);
            parseReceivedData(statusResponse);
        }
    }
    
    /**
      * Not used
      */
    @Override
    protected void manageAsynchronousCommand(OutputStream o, HttpExchange t, HashMap<String, String> requestParameters) {       
    }
    
   /**
     * This method will update the values in this object from the hardware device
     * 
     * @throws RemoteHomeConnectionException if there is a problem with communication
     * @throws RemoteHomeManagerException if the type of the device doesn't belongs to the answer received back.
     * 
     */
    public void updateDevice() throws RemoteHomeConnectionException, RemoteHomeManagerException {
        String statusResponse[] = null;
        try {
            statusResponse = m.sendCommandWithAnswer(parseDeviceIdForMultipleDevice(getDeviceId()), "b"+getSubDeviceNumber()+"s").split("\\|");
            setPowerLost(false);
            if (!statusResponse[0].equals("1b")) {
                throw new RemoteHomeManagerException("This response belongs to different device type.", RemoteHomeManagerException.WRONG_DEVICE_TYPE);
            }
        } catch (RemoteHomeConnectionException e) {
            if (isPowerLost()) {
                return;
            } else {
                throw e;
            }
        }
        if (!statusResponse[1].equals(getSubDeviceNumber())) {
            throw new RemoteHomeManagerException("This response belongs to different sub device type.", RemoteHomeManagerException.WRONG_DEVICE_TYPE);
        }
        parseReceivedData(statusResponse);
    }
    
    public void parseReceivedData(String statusResponse[]) {
        if (statusResponse[2].equals("1")) {
            movingDown = true;
        } else {
            movingDown = false;
        }
        if (statusResponse[3].equals("1")) {
            movingUp = true;
        } else {
            movingUp = false;
        }
        if (statusResponse[2].equals("1") || statusResponse[3].equals("1")) {
            moving = true;
        } else {
            moving = false;
        }
        fullRangeTimeout = Integer.parseInt(statusResponse[4]);
        currentOpening = Integer.parseInt(statusResponse[7]);
        setTimestamp(System.currentTimeMillis());
        try {
            saveHistoryData();
        } catch (RemoteHomeManagerException e) {
            if (e.getType() != RemoteHomeManagerException.PERSISTANCE_NOT_INITIALIZED)
                RemoteHomeManager.log.error(241, e);
        }        
        m.notifyDeviceChange(this);
        RemoteHomeManager.log.info("Values set. Current values: "+toString());
    }
    
    @Override
    public String toString() {
        HashMap h = new HashMap();
        h.putAll(super.getFieldValues());
        h.put("movingDown", movingDown);
        h.put("movingUp", movingUp);    
        h.put("moving", moving);
        h.put("fullRangeTimeout", fullRangeTimeout);
        h.put("currentOpening", currentOpening);
        h.put("powerLost", powerLost);
        h.put("positionSchedule", positionSchedule);
        h.put("enabledScheduler", enabledScheduler);        
        return h.toString();
    }
    /**
     * 
     * @param fullRangeTimeout timeout in seconds to move from fully open position to fully closed position. It is multiple 100ms, so e.g. for 5 seconds, put 50.
     * @throws RemoteHomeConnectionException if there is a problem with the connection
     * @throws RemoteHomeManagerException if the range is outside 0 - 255 seconds
     */
    public void configureFullRangeTimeout(int fullRangeTimeout) throws RemoteHomeConnectionException, RemoteHomeManagerException {
        if ((fullRangeTimeout < 0) || (fullRangeTimeout > 65535)) {
            throw new RemoteHomeManagerException("The value should be 0 - 65535", RemoteHomeManagerException.WRONG_PARAMETER_VALUE);
        }
        m.sendCommand(getRealDeviceId(), "b"+getSubDeviceNumber()+"m="+fullRangeTimeout);
        setFullRangeTimeout(fullRangeTimeout);
    }

    /**
     * This method will move the motor to fully opened position
     * @throws RemoteHomeConnectionException if there is a problem with the connection 
     */
    public void motorUp() throws RemoteHomeConnectionException {
        m.sendCommand(getRealDeviceId(), "b"+getSubDeviceNumber()+"u"); 
        moving = true;
        movingUp = true;
        movingDown = false;
    }
    
    /**
     * This method will move the blinds to fully closed position
     * @throws RemoteHomeConnectionException if there is a problem with the connection 
     */
    public void motorDown() throws RemoteHomeConnectionException {
        m.sendCommand(getRealDeviceId(), "b"+getSubDeviceNumber()+"d");        
        moving = true;
        movingUp = false;
        movingDown = true;
    }

    /**
     * This method will move the blinds to predefined position
     * @param position is the expected position in percents
     * @throws RemoteHomeConnectionException if there is a problem with the connection 
     * @throws RemoteHomeManagerException if the value is not in range 0 - 100
     */
    public void moveMotorToPosition(int position) throws RemoteHomeConnectionException, RemoteHomeManagerException {
        if ((position < 0) || (position > 100)) {
            throw new RemoteHomeManagerException("The value should be 0 - 100", RemoteHomeManagerException.WRONG_PARAMETER_VALUE);
        }
        m.sendCommand(getRealDeviceId(), "b"+getSubDeviceNumber()+"c="+position);        
        moving = true;
        movingUp = false;
        movingDown = false;
    }
    
    /**
     * This method will stop the movement of the blinds
     * @throws RemoteHomeConnectionException if there is a problem with the connection
     */
    public void stopMotorMovement() throws RemoteHomeConnectionException {
        m.sendCommand(getRealDeviceId(), "b"+getSubDeviceNumber()+"p");
        moving = false;
        movingUp = false;
        movingDown = false;
    }
    
    /**
     * When the blinds are moving already, this is true.
     * @return the moving
     */
    public boolean isMoving() {
        return moving;
    }

    /**
     * Current opening is the value in percent of the position. Fully opened is 0, fully closed is 100.
     * @return the currentOpening
     */
    public int getCurrentOpening() {
        return currentOpening;
    }

    /**
     * Current opening is the value in percent of the position. Fully opened is 0, fully closed is 100.
     * @param currentOpening the currentOpening to set
     */
    protected void setCurrentOpening(int currentOpening) {
        this.currentOpening = currentOpening;
    }

    /**
     * When the blinds are moving already, this is true.
     * @param moving the moving to set
     */
    protected void setMoving(boolean moving) {
        this.moving = moving;
    }

    /**
     * When the blinds are moving up, this is true.
     * @return the movingUp
     */
    public boolean isMovingUp() {
        return movingUp;
    }

    /**
     * When the blinds are moving up, this is true.
     * @param movingUp the movingUp to set
     */
    protected void setMovingUp(boolean movingUp) {
        this.movingUp = movingUp;
    }

    /**
     * When the blinds are moving down, this is true.
     * @return the movingDown
     */
    public boolean isMovingDown() {
        return movingDown;
    }

    /**
     * When the blinds are moving down, this is true.
     * @param movingDown the movingDown to set
     */
    protected void setMovingDown(boolean movingDown) {
        this.movingDown = movingDown;
    }

    /**
     * Calibration value of the blinds. It is time in seconds, from fully opened position to fully closed position.
     * @return the fullRangeTimeout
     */
    public int getFullRangeTimeout() {
        return fullRangeTimeout;
    }

    /**
     * Calibration value of the blinds. It is time in seconds, from fully opened position to fully closed position.
     * @param fullRangeTimeout the fullRangeTimeout to set
     */
    protected void setFullRangeTimeout(int fullRangeTimeout) {
        this.fullRangeTimeout = fullRangeTimeout;
    }
    /**
     * This method will save the current state of the device to the database together with the timestamp.
     * @throws RemoteHomeManagerException if the saving fails.
     */
    protected void saveHistoryData() throws RemoteHomeManagerException {
          int expected = getCurrentOpening();
          if (isEnabledScheduler()) expected = getPositionSchedule().processSchedule();          
          HistoryData history = new HistoryData();
          history.setDeviceId(getDeviceId());
          history.setDataName("DOUBLELINEDATA");
          history.setDataValue(getCurrentOpening()+"|"+expected);
          history.setDataTimestamp();
          m.getPersistance().addHistoryData(history);
          RemoteHomeManager.log.debug("Saved history data: "+history.toString());          
    }

    /**
     * @return the positionSchedule
     */
    public PercentageSchedule getPositionSchedule() {
        return positionSchedule;
    }

    /**
     * @param positionSchedule the positionSchedule to set
     */
    public void setPositionSchedule(PercentageSchedule positionSchedule) {
        this.positionSchedule = positionSchedule;
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
        try {
            saveHistoryData();
            if (isEnabledScheduler()) {
                int schPosition = getPositionSchedule().processSchedule();
                if (schPosition != getCurrentOpening()) {
                    this.moveMotorToPosition(schPosition);
                }    
            }
        } catch (RemoteHomeManagerException e) {
            RemoteHomeManager.log.error(44,e);
        } catch (RemoteHomeConnectionException e) {
            RemoteHomeManager.log.error(45,e);
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
    
    public float getLowBatteryLimit() {
        return 0f;
    }

    /**
     * @return the powerLost
     */
    public boolean isPowerLost() {
        return powerLost;
    }

    /**
     * @param powerLost the powerLost to set
     */
    public void setPowerLost(boolean powerLost) {
        this.powerLost = powerLost;
    }

    public class MotorChartItem {
        private String xData;
        private int yData;
        private int yDataExpected;
        
        @Override
        public String toString() {
            return "xData:"+getxData()+",yData:"+getyData()+",yDataExpected:"+getyDataExpected();
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
         * @return the yDataExpected
         */
        public int getyDataExpected() {
            return yDataExpected;
        }

        /**
         * @param yDataExpected the yDataExpected to set
         */
        public void setyDataExpected(int yDataExpected) {
            this.yDataExpected = yDataExpected;
        }
    }
    
    public ArrayList generateChartItems(HistoryData[] historyData, String type) {
        ArrayList<MotorControllerDevice.MotorChartItem> retArray = new ArrayList<MotorControllerDevice.MotorChartItem>();
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'.000Z'");
            for (HistoryData d : historyData) {
                MotorControllerDevice.MotorChartItem item = new MotorControllerDevice.MotorChartItem();            
                item.setxData(df.format(d.getDataTimestamp()));
                item.setyData(Integer.parseInt(d.getDataValue().split("\\|")[0]));
                item.setyDataExpected(Integer.parseInt(d.getDataValue().split("\\|")[1]));
                retArray.add(item);
            }
            return retArray;
    }
}
