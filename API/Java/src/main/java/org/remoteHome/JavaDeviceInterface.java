/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.remoteHome;

import java.util.HashMap;

/**
 *
 * @author gregorro
 */
public interface JavaDeviceInterface {
   /*
    * This is called to get the list of buttons, which this device represents. 
    * The hashmap structure: 
    * Key are the buuton identifiers (used in the executeButton).
    * Value is the HashMap. The structure of this hashmap:
    * Keys are the language abreviations such as "en", "cz", "de". Object type is String
    * Values are the Strings, which represents the button label.
    */
    HashMap getButtons();
   /*
    * This is called when the button is executed.
    * @param button the button name, which has been pressed.
    */
    void executeButton(String button, RemoteHomeManager m) throws RemoteHomeManagerException, RemoteHomeConnectionException;
}
