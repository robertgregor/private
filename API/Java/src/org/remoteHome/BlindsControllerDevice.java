package org.remoteHome;

import java.io.Serializable;

/**
  * Blinds controller<br/>
  * <br/>
  * pn - check weather the device is up and runing (ping command)<br/>
  * s - return status 5|down|up|timeout value|current opening<br/>
  * 	&nbsp;&nbsp;&nbsp;down - 1 if currently moving down<br/>
  * 	&nbsp;&nbsp;&nbsp;up - 1 if currently moving up<br/>
  * 	&nbsp;&nbsp;&nbsp;timeout value - number of configured timeout in sec. This value is the 100 % time to open the blinds<br/>
  * 	&nbsp;&nbsp;&nbsp;current opening - Blinds opening in %. 0 means fully open, 100 means fully closed. In manual mode always 0.<br/>
  * <br/>
  * Position managed mode:<br/>
  * <br/>
  * bt=nnn - configure number of seconds, when the blind is moving fully from open position to closed position.<br/>
  * bu - blinds up moving to fully open position<br/>
  * bd - blinds down moving to fully closed position<br/>
  * bs - blinds stop stop movements<br/>
  * bm=nnn - Move to the nnn position. nnn is the percentage between open and close. 0 - fully open, 100 - fully closed<br/>
  * <br/>
  * Asynchronous messages: l|nnn percentage of opening.<br/>
  * <br/>
  * Manual mode:<br/>
  * <br/>
  * u - start to move up<br/>
  * d - start to move down<br/>
  * e - stop to move<br/>
  *<br/><br/> 
  *     Quick startup:<BR/>
  *     1. Connect wires<BR/>
  *     2. Test the communication AT+0=pn<BR/>
  *     3. Assign the device ID: AT+a=9  Id is 9.<BR/>
  *     4. Measure the number of seconds from fully open position to fully closed position.<BR/>
  *     5. Set this value to device: AT+9=bm=123<BR/>
  * 
  * @author Robert Gregor
  */
public class BlindsControllerDevice extends AbstractDevice implements Serializable {
   /**
     * This listenner listen for the event, when the blind is moved to required position. The user of this API should implement this interface
     * and register it for that event.
     */    
    private BlindsControllerListener blindsControllerListener;
    
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

    
   /**
     * The constructor is protected. The object should be constructed using
     * BlindsControllerDevice device = 
     *          (BlindsControllerDevice)remoteHomeManager.getRemoteHomeDevice(deviceId,deviceName, AbstractDevice.BlindsController)
     * 
     * @param m remote manager reference
     * @param deviceId deviceId assigned to this device
     * @param deviceName device name
     */    
    protected BlindsControllerDevice(RemoteHomeManager m, int deviceId, String deviceName) {
        super (m, deviceId, deviceName);        
    }
    /**
     * Receive asynchronous command - blinds positioned
     * 
     * @param items items returned back
     */    
    @Override
    protected void manageAsynchronousCommand(String[] items) {
        if (items[0].equals("l")) {
            this.setCurrentOpening(Integer.parseInt(items[1]));
            this.setMoving(false);
            this.setMovingUp(false);
            this.setMovingDown(false);
            if (blindsControllerListener != null) {
                blindsControllerListener.blindsPositioned();
            }
        }
    }    
   /**
     * This method will update the values in this object from the hardware device
     * 
     * @throws RemoteHomeConnectionException if there is a problem with communication
     * @throws RemoteHomeManagerException if the type of the device doesn't belongs to the answer received back.
     * 
     */
    public void updateDevice() throws RemoteHomeConnectionException, RemoteHomeManagerException {
        String statusResponse[] = m.sendCommandWithAnswer(getDeviceId(), "s").split("\\|");
        if (!statusResponse[0].equals("5")) {
            throw new RemoteHomeManagerException("This response belongs to different device type.", RemoteHomeManagerException.WRONG_DEVICE_TYPE);
        }        
        if (statusResponse[1].equals("1")) {
            movingDown = true;
        } else {
            movingDown = false;
        }
        if (statusResponse[2].equals("1")) {
            movingUp = true;
        } else {
            movingUp = false;
        }
        if (statusResponse[1].equals("1") || statusResponse[2].equals("1")) {
            moving = true;
        } else {
            moving = false;
        }
        fullRangeTimeout = Integer.parseInt(statusResponse[3]);
        currentOpening = Integer.parseInt(statusResponse[4]);
    }
    
    /**
     * 
     * @param fullRangeTimeout timeout in seconds to move from fully open position to fully closed position
     * @throws RemoteHomeConnectionException if there is a problem with the connection
     * @throws RemoteHomeManagerException if the range is outside 0 - 255 seconds
     */
    public void configureFullRangeTimeout(int fullRangeTimeout) throws RemoteHomeConnectionException, RemoteHomeManagerException {
        if ((fullRangeTimeout < 0) || (fullRangeTimeout > 255)) {
            throw new RemoteHomeManagerException("The value should be 0 - 255", RemoteHomeManagerException.WRONG_PARAMETER_VALUE);
        }
        m.sendCommand(getDeviceId(), "bt="+fullRangeTimeout);
        setFullRangeTimeout(fullRangeTimeout);
    }

    /**
     * This method will move the blinds to fully opened position
     * @throws RemoteHomeConnectionException if there is a problem with the connection 
     */
    public void blindsUp() throws RemoteHomeConnectionException {
        m.sendCommand(getDeviceId(), "bu"); 
        moving = true;
        movingUp = true;
        movingDown = false;        
    }
    
    /**
     * This method will move the blinds to fully closed position
     * @throws RemoteHomeConnectionException if there is a problem with the connection 
     */
    public void blindsDown() throws RemoteHomeConnectionException {
        m.sendCommand(getDeviceId(), "bd");        
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
    public void moveBlindsToPosition(int position) throws RemoteHomeConnectionException, RemoteHomeManagerException {
        if ((fullRangeTimeout < 0) || (fullRangeTimeout > 100)) {
            throw new RemoteHomeManagerException("The value should be 0 - 100", RemoteHomeManagerException.WRONG_PARAMETER_VALUE);
        }
        m.sendCommand(getDeviceId(), "bm="+position);        
        moving = true;
        movingUp = false;
        movingDown = false;
    }
    
    /**
     * This method will stop the movement of the blinds
     * @throws RemoteHomeConnectionException if there is a problem with the connection
     */
    public void stopBlindsMovement() throws RemoteHomeConnectionException {
        m.sendCommand(getDeviceId(), "bs");
        moving = false;
        movingUp = false;
        movingDown = false;
    }
    
    /**
     * Don't use this method!!! Only for your own risk!!!
     * Use rather blindsUp(). It is only for someone, who want to implement it's own logic. In this manual mode, the device will lost control about the 
     * position!!!!. Also the device will not stop the blinds!!!! So it is your responsibility to call manualStop!!!!
     * @throws RemoteHomeConnectionException if there is a problem with the connection
     */
    public void manualMoveUp() throws RemoteHomeConnectionException {
        m.sendCommand(getDeviceId(), "u");        
        moving = true;
        movingUp = true;
        movingDown = false;
    }

    /**
     * Don't use this method!!! Only for your own risk!!!
     * Use rather blindsDown(). It is only for someone, who want to implement it's own logic. In this manual mode, the device will lost control about the 
     * position!!!!. Also the device will not stop the blinds!!!! So it is your responsibility to call manualStop!!!!
     * @throws RemoteHomeConnectionException if there is a problem with the connection
     */
    public void manualMoveDown() throws RemoteHomeConnectionException {
        m.sendCommand(getDeviceId(), "d");        
        moving = true;
        movingUp = false;
        movingDown = true;
    }
    
    /**
     * Don't use this method!!! Only for your own risk!!!
     * Use rather stopBlindsMovement(). It is only for someone, who want to implement it's own logic. In this manual mode, the device will lost control about the 
     * position!!!!. Also the device will not stop the blinds!!!! So it is your responsibility to call manualMoveStop!!!!
     * @throws RemoteHomeConnectionException if there is a problem with the connection
     */
    public void manualStop() throws RemoteHomeConnectionException {
        m.sendCommand(getDeviceId(), "e");
        moving = false;
        movingUp = false;
        movingDown = false;
    }

    /**
     * This listenner listen for the event, when the blind is moved to required position. The user of this API should implement this interface
     * and register it for that event.
     * @return the blindsControllerListener
     */
    public BlindsControllerListener getBlindsControllerListener() {
        return blindsControllerListener;
    }

    /**
     * This listenner listen for the event, when the blind is moved to required position. The user of this API should implement this interface
     * and register it for that event.
     * @param blindsControllerListener the blindsControllerListener to set
     */
    public void setBlindsControllerListener(BlindsControllerListener blindsControllerListener) {
        this.blindsControllerListener = blindsControllerListener;
    }

    /**
     * When the blinds are moving already, this is true.
     * @return the moving
     */
    protected boolean isMoving() {
        return moving;
    }

    /**
     * Current opening is the value in percent of the position. Fully opened is 0, fully closed is 100.
     * @return the currentOpening
     */
    protected int getCurrentOpening() {
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
    protected boolean isMovingUp() {
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
    protected boolean isMovingDown() {
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
}
