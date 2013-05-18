package org.remoteHome;

/**
 * This class represents the communication errors with the harware.It is thrown by the RemoteHomeCommunicator class, it means by the communication layer of the API.
 * Usual case could be e.g. that the hardware device didn't answer to the command - it means, that the communication with the device is not established,
 * either, because e.g. the device is powered off or the range between the transceiver and the device is too large.
 * 
 * @author Robert Gregor
 */
public class RemoteHomeConnectionException extends Exception {
    /**
     * This constant represent the case, when the API doesn't connect to the transceiver, because the host was not found. If you are
     * connecting from the remote machine using hostname, make sure, that hostname could be resolved.
     */
    public static final int UNKNOWN_HOST = 1;
    /**
     * This constant represent the case, when the API doesn't connect to the transceiver. If you are connecting e.g. to localhost, make sure, that ser2net
     * is listening on localhost, and that it is listening on the port, you expect. Also please check, that the ser2net is already running.
     */
    public static final int CONNECTION = 2;
    /**
     * The device send back ERROR. Please check the protocol document.
     */    
    public static final int ERROR_FROM_DEVICE = 3;
    /**
     * The device didn't answer to the command. Is the device powered? Is the device in the range of transceiver.
     */    
    public static final int NO_RESPONSE_FROM_DEVICE = 4;
        
    /**
     * The supplied parameter is invalid.
     */    
    public static final int INVALID_PARAMETER = 5;

    /**
     * The supplied parameter is invalid.
     */    
    public static final int UNKNOWN_PORT = 6;

    private int type;
    
   /**
     * @param message is the error message to provide
     * @param  type is the type of the exception, represented by the static constant value.
     */
    protected RemoteHomeConnectionException(String message, int type) {
        super(message);
        this.type = type;
    }

   /**
     * @param  type is the type of the exception, represented by the static constant value.
     */
    protected RemoteHomeConnectionException(int type) {
        this.type = type;
    }

   /**
     * @return Text message representing the error.
     */    

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
            case INVALID_PARAMETER:
                    return "Invalid parameter: "+super.getMessage();
            case UNKNOWN_PORT:
                    return "The specified serial port doesn't exist: "+super.getMessage();
            default:
                return super.getMessage();
        }        
    }
   /**
     * @return type of the exception, which matches with one of the static constant in this class.
     */    
    public int getType() {
        return type;
    }    
}
