package org.remoteHome;

/**
 * This class represents the exception, thrown by the RemoteHomeManager class, it means by the business logic of the API.
 * Usual case could be e.g. that the implementation provided invalid value to the API.
 * @author Robert Gregor
 */
public class RemoteHomeManagerException extends Exception {
    
    /**
     * This constant represent the case, when the device Id, has been provided, however, it doesn't exist in the system.
     */
    public static final int UNKNOWN_DEVICE = 1;  
    
    private int type;

   /**
     * @param message is the error message to provide
     * @param  type is the type of the exception, represented by the static constant value.
     */
    protected RemoteHomeManagerException(String message, int type) {
        super(message);
        this.type = type;
    }

   /**
     * @param  type is the type of the exception, represented by the static constant value.
     */
    protected RemoteHomeManagerException(int type) {
        this.type = type;
    }
    
   /**
     * @returns Text message representing the error.
     */    

    @Override
    public String getMessage() {
        switch (type) {
            case UNKNOWN_DEVICE:
                    return "Unknown device type.";
            default:
                return super.getMessage();
        }        
    }
   /**
     * @returns type of the exception, which matches with one of the static constant in this class.
     */    
    public int getType() {
        return type;
    }
}
