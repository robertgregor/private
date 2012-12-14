/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.exception;

/**
 *
 * @author pt596
 */
public class RemoteHomeConnectionException extends Exception {
    
    public static final int UNKNOWN_HOST = 1;
    public static final int CONNECTION = 2;
    public static final int ERROR_FROM_DEVICE = 3;
    public static final int NO_RESPONSE_FROM_DEVICE = 4;
    
    
    private int type;
    
    public RemoteHomeConnectionException(String message, int type) {
        super(message);
        this.type = type;
    }

    public RemoteHomeConnectionException(int type) {
        this.type = type;
    }

    @Override
    public String getMessage() {
        switch (type) {
            case UNKNOWN_HOST:
                    return "Unknown host: "+super.getMessage();
            case CONNECTION:
                    return "Cannot establish connection to smart home device: "+super.getMessage();
            case ERROR_FROM_DEVICE:
                    return "Error received from device, invalid command.";
            case NO_RESPONSE_FROM_DEVICE:
                    return "No any response received from device.";
            default:
                return super.getMessage();
        }        
    }
}
