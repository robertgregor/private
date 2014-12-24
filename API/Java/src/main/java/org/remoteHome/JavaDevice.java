package org.remoteHome;

import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.Serializable;
import java.util.ArrayList;

/**
* Java device
* 
* This is artifical device, which is built by java code, manipulating real devices. It could be used to control the group of the devices or add additional
* functionality to the existing device.
*
* @author Robert Gregor
* 
**/
public class JavaDevice extends AbstractDevice implements Serializable {
   /**
     * Here is the java source code, which defines the functionality of this device
     * It has to implement JavaDeviceInterface.
     */
    private String javaDeviceInterfaceSourceCode = ""; 

   
   /**
     * The constructor is protected. The object should be constructed using
     * JavaDevice device = 
     *          (JavaDevice)remoteHomeManager.getRemoteHomeDevice(deviceId,deviceName, AbstractDevice.Java)
     * 
     * @param m remote manager reference
     * @param deviceId deviceId assigned to this device
     * @param deviceName device name
     **/

    protected JavaDevice(RemoteHomeManager m, int deviceId, String deviceName) {
        super (m, deviceId, deviceName);
        if (javaDeviceInterfaceSourceCode.equals("")) {
            try {
                DataInputStream br = new DataInputStream(this.getClass().getClassLoader().getResourceAsStream("TemplateJavaDevice.txt"));
                ByteArrayOutputStream out = new ByteArrayOutputStream();        
                byte[] buffer = new byte[65535];
                int length;
                while ((length = br.read(buffer)) != -1) out.write(buffer, 0, length);
                br.close();
                byte[] result = out.toByteArray();
                javaDeviceInterfaceSourceCode = (new String(result)).replace("COMPONENTID", Integer.toString(deviceId));
            } catch (Exception e) {
                RemoteHomeManager.log.error(1231, e);
            }
        }
    }

    /**
     * Contains the initialization of the device.
     */
    protected void init() {      
    }
    
    @Override
    protected void manageAsynchronousCommand(String[] items) {
    }
    
    
    /*
     * This method is not supported for this device and will throw always RemoteHomeManagerException - NOT_SUPPORTED.
     * The status of the device is received asynchronously from the device.
     */
    public void updateDevice() throws RemoteHomeManagerException {
        setTimestamp(System.currentTimeMillis());
    }

    @Override
    public String toString() {
        return super.toString();
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

    /**
     * @return the javaDeviceInterfaceSourceCode
     */
    public String getJavaDeviceInterfaceSourceCode() {
        return javaDeviceInterfaceSourceCode;
    }

    /**
     * @param javaDeviceInterfaceSourceCode the javaDeviceInterfaceSourceCode to set
     */
    public void setJavaDeviceInterfaceSourceCode(String javaDeviceInterfaceSourceCode) {
        this.javaDeviceInterfaceSourceCode = javaDeviceInterfaceSourceCode;
    }
    
    public float getLowBatteryLimit() {
        return 0f;
    }

    public ArrayList generateChartItems(HistoryData[] historyData, String type) {
            return new ArrayList();
    }
}
