/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.exception;

/**
 *
 * @author pt596
 */
public class RemoteHomeManagerException extends Exception {
    
    public static final int UNKNOWN_DEVICE = 1;  
    
    private int type;
    
    public RemoteHomeManagerException(String message, int type) {
        super(message);
        this.type = type;
    }

    public RemoteHomeManagerException(int type) {
        this.type = type;
    }

    @Override
    public String getMessage() {
        switch (type) {
            case UNKNOWN_DEVICE:
                    return "Unknown device type.";
            default:
                return super.getMessage();
        }        
    }
}
