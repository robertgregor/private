/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.remoteHome;

/**
 *
 * @author gregorro
 */
public interface Sketch {
    /*
    * This is called after the class is constructed.
    */
    void init();
    /*
    * This is called, when any device change its status. 
    * @param device is the device which was changed.
    */
    void manageDeviceChange(AbstractDevice device);
    
    /*
     * This method is called each second. Do not put inside blocking operations
    */
    void runEachSecond();
    
    /*
     * This method is called each minute. Do not put inside blocking operations
    */
    void runEachMinute();

    /*
     * This method is called each 10 minutes. Do not put inside blocking operations
    */
    void runEach10Minutes();

    /*
     * This method is called each hour. Do not put inside blocking operations
    */
    void runEachHour();

    /*
     * This method is called each day. Do not put inside blocking operations
    */
    void runEachDay();
}
