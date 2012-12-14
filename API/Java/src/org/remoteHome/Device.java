package org.remoteHome;

/**
 * This is the interface for all hardware devices. All the devices should implement this interface
 * 
 * @author Robert Gregor
 */
interface Device {
        
    /**
     * This device type is heating header.
     */
    int HeatingHeader = 4;
    int SimpleSwitch = 3;
    
    
   /**
    * This method is called by the Remote home manager. If you register your device to receive the asynchronous events, 
    * the communication class will call this method to set the values of the specific device type.
    * Please note, that this method is called in the same thread as the receiving thread, so the implementation should be fast enough to return as soon as possible.
    * @param items, the items after the space. The detailed list is described in the communication protocol.
    * @return void
    * 
    * @author Robert Gregor
    */
    void manageAsynchronousCommand(String[] items);
    
}
