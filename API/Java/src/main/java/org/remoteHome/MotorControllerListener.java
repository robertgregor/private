package org.remoteHome;

/**
 * This interface should be implemented in order to receive asynchronous event, when the blind are set to required position.
 * @author Robert Gregor
 */
public interface MotorControllerListener {

   /**
     * This method is called by the API, when blinds are in required position.
     * @return id object id of the device.
     */
    public int blindsPositioned();    

}
