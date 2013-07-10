package org.remoteHome;

import java.io.IOException;
import java.io.Serializable;
import java.util.Calendar;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
  * Light/Alarm controller<BR/><BR/>
  * 
  * ala - alarm On In this mode the sensor will notify the Computer one time about the intrusion<BR/>
  * ald - alarm deactivation<BR/>
  * alce=nnn - alarm configuration enter alarm timeout nnn = 0 to 255 seconds<BR/>
  * alcl=nnn - alarm configuration leave alarm timeout nnn = 0 to 255 seconds<BR/>
  * <BR/>
  * l1o - light 1 on<BR/>
  * l1of - light 1 on and off after timeout period<BR/>
  * l1f - light 1 off<BR/>
  * l1co - configure light 1 to swith on when applied power<BR/>
  * l1cf - configure light 1 to stay off when applied power<BR/>
  * l1cd - configure light 1 to switch on when movement detected<BR/>
  * l1cc - cancel light 1 to switch on when movement detected<BR/>
  * l1ct=nnn - configure light 1 timeout nnn = 0 to 255 minutes (0 means forewer) minutes<BR/>
  * pn - check weather the device is up and runing (ping command)<BR/>
  * sa - return status 1|a|Alarm|sensor|alenter|alleave<BR/>
  * 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Alarm 0 disabled, 1 enabled, 2 activated, 3 leave timeout running, 4 enter timeout running<BR/>
  * 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sensor - 0 nothing detected, 1 detected<BR/>
  * 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;alenter - enter alarm timeout in seconds<BR/>
  * 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;alleave - leave alarm timeout in seconds<BR/>
  * sc - return status 1|c|light|power|onWhenMovement|configuredTimeout|currentTimeout<BR/>
  * 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;light 0 off, 1 on<BR/>
  * 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;power 0 on when applied power, 1 stay off when applied power<BR/>
  * 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;onWhenMovement 1 - on when movement detected 0 no action<BR/>
  * 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;configuredTimeout - no of minutes, when l1 will go off, 0 forewer<BR/>
  * 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;currentTimeout - current light 1 timeout in minutes, 0 - never switch off<BR/><BR/>
  * @author Robert Gregor
  */
public class LightAlarmDevice  extends SimpleSwitchDevice implements Serializable {
    
    
    
    /**
     * Indicates, if the swith is configured to switch on, when movement detected.
     * True means switch ON, when movement detected and stay defined configured period ON, then switch off, false means to stay OFF.
     */
    private boolean onWhenMovementDetected;
    
    /**
     * Listener to receive the asynchronous alarm event
     */
    private LightAlarmDeviceListener alarmListener;

   /**
     * Status of the alarm
     */
    private int alarmStatus;
    
   /**
     * Current state of the alarm sensor
     */
    private boolean alarmSensorCurrentState;
    
   /**
     * Current enter alarm timeout
     */
    private int alarmEnterTimeout;

   /**
     * Current leave alarm timeout
     */
    private int alarmLeaveTimeout;

   /**
     * Current smtp server host
     */
    private String smtpHost;

   /**
     * Current smtp server user
     */
    private String smtpUser;

   /**
     * Current smtp server password
     */
    private String smtpPassword;

   /**
     * Current smtp email address to
     */
    private String smtpEmailTo;

   /**
     * Current smtp email address to
     */
    private String smtpEmailFrom;

    /**
     * Current smtp email subject
     */
    private String smtpSubject;

   /**
     * Current smtp email message
     */
    private String smtpMessage;

    /*
     * This is the schedule allows to set the light on when movement is detected.
     */
    private OnOffSchedule lightOnWhenMovementDetectedSchedule;
    
    /*
     * This is the schedule allows to set the light on hardly
     */
    private OnOffSchedule lightSchedule;
    
    /*
     * This is true if scheduler is enabled.
     */
    private boolean enabledScheduler;
    
    /*
     * This is true if movement scheduler is enabled.
     */
    private boolean enabledLightOnWhenMovementScheduler;
    
    /**
     * The constructor is protected. The object should be constructed using
     * TemperatureSensorDevice device = 
     *          (TemperatureSensorDevice)remoteHomeManager.getRemoteHomeDevice(deviceId,deviceName, AbstractDevice.TemperatureSensor)
     * 
     * @param m remote manager reference
     * @param deviceId deviceId assigned to this device
     * @param deviceName device name
     */
    protected LightAlarmDevice(RemoteHomeManager m, int deviceId, String deviceName) {
        super (m, deviceId, deviceName);        
    }
    
   /**
     * For LightAlarm device, this method is not used.
     * 
     * @param items returned back
     */    
    @Override
    protected void manageAsynchronousCommand(String[] items) {
        //Manage alarm event received
        if (items[0].equals("ALARM")) {
            if (alarmListener != null) {
                alarmListener.alarmFired();
            }
            if (getSmtpHost() != null) {
                //OK, send e-mail
                new Thread(new Runnable() {
                    public void run() {
                        try {
                            sendEmail();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }).start();
            }
        }
    }
    
   /**
     * This method will update the values in the this object from the hardware device
     * 
     * @throws RemoteHomeConnectionException if there is a problem with communication
     * @throws RemoteHomeManagerException if the type of the device doesn't belongs to the answer received back.
     * 
     */
    @Override
    public void updateDevice() throws RemoteHomeConnectionException, RemoteHomeManagerException {
        String[] statusResponse = m.sendCommandWithAnswer(getDeviceId(), "sc").split("\\|");
        if (!statusResponse[0].equals("1")) {
            throw new RemoteHomeManagerException("This response belongs to different device type.", RemoteHomeManagerException.WRONG_DEVICE_TYPE);
        }
        if (statusResponse[1].equals("c")) {
            if (statusResponse[2].equals("1")) {
                setCurrentState(true);
            } else {
                setCurrentState(false);
            }
            if (statusResponse[3].equals("1")) {
                setOnWhenAppliedPower(false);
            } else {
                setOnWhenAppliedPower(true);
            }
            if (statusResponse[4].equals("1")) {
                setOnWhenMovementDetected(true);
            } else {
                setOnWhenMovementDetected(false);
            }
            setConfiguredPeriod(Integer.parseInt(statusResponse[5]));
            setCurrentCounter(Integer.parseInt(statusResponse[6]));
            setTimestamp(System.currentTimeMillis());
        }
        statusResponse = m.sendCommandWithAnswer(getDeviceId(), "sa").split("\\|");
        if (!statusResponse[0].equals("1")) {
            throw new RemoteHomeManagerException("This response belongs to different device type.", RemoteHomeManagerException.WRONG_DEVICE_TYPE);
        }
        if (statusResponse[1].equals("a")) {
            setAlarmStatus(Integer.parseInt(statusResponse[2]));            
            if (statusResponse[3].equals("1")) {
                setAlarmSensorCurrentState(true);
            } else {
                setAlarmSensorCurrentState(false);
            }            
            setAlarmEnterTimeout(Integer.parseInt(statusResponse[4]));
            setAlarmLeaveTimeout(Integer.parseInt(statusResponse[5]));
            setTimestamp(System.currentTimeMillis());

        }
    }
    /**
     * This method will switch ON the alarm sensor. In this mode, the user will be notified about the intrusion of the alarm
     * using setAlarmListener(LightAlarmDeviceListener alarmListener). Actually the method alarmFired() of this listener is called by the API.
     * It is called only one time.
     */
    public void alarmOn() throws RemoteHomeConnectionException {
        m.sendCommand(getDeviceId(), "ala");
        setAlarmStatus(AlarmStatus.ALARM_ENABLED);
    }
    /**
     * This method will switch Off the alarm sensor. In this mode ALARM event is not send to the API.
     */
    public void alarmOff() throws RemoteHomeConnectionException {
        m.sendCommand(getDeviceId(), "ald");
        setAlarmStatus(AlarmStatus.ALARM_DISABLED);
    }

   /**
     * This method will configure the leave alarm timeout.
     * This is the period of time, when the sensor is in the status AlarmStatus.LEAVE_TIMEOUT_RUNNING. In this state, the alarm doesn't notify the API.
     * After this period, the alarm is in the status AlarmStatus.ALARM_ENABLED, it means ready for detection. And if someone is in the range of the sensor,
     * the API is notified.
     * @param period it is the timeout in seconds. The value should be in range (period < 0) || (period > 255).
     * 
     * @throws RemoteHomeConnectionException if there is problem with connection
     * @throws RemoteHomeManagerException if there is problem with the parameter value
     */
    public void configureAlarmLeaveTimeout(int period) throws RemoteHomeConnectionException, RemoteHomeManagerException {
        if ((period < 0) || (period > 255)) {
            throw new RemoteHomeManagerException("The value should be 0 - 255", RemoteHomeManagerException.WRONG_PARAMETER_VALUE);
        }
        m.sendCommand(getDeviceId(), "alcl="+period);
        setAlarmLeaveTimeout(period);
    }
    
   /**
     * This method will configure the enter alarm timeout.
     * This is the period of time, when the sensor is in the status AlarmStatus.ENTER_TIMEOUT_RUNNING. In this state, the alarm doesn't notify the API.
     * Before this period, the alarm is in the status AlarmStatus.ALARM_ENABLED. Then intrusion is detected and based on this the alarm jumps to the state
     * AlarmStatus.ENTER_TIMEOUT_RUNNING
     * the API is notified.
     * @param period it is the timeout in seconds. The value should be in range (period < 0) || (period > 255).
     * 
     * @throws RemoteHomeConnectionException if there is problem with connection
     * @throws RemoteHomeManagerException if there is problem with the parameter value
     */
    public void configureAlarmEnterTimeout(int period) throws RemoteHomeConnectionException, RemoteHomeManagerException {
        if ((period < 0) || (period > 255)) {
            throw new RemoteHomeManagerException("The value should be 0 - 255", RemoteHomeManagerException.WRONG_PARAMETER_VALUE);
        }
        m.sendCommand(getDeviceId(), "alce="+period);
        setAlarmEnterTimeout(period);
    }
    
   /**
     * This method will configure the behavior of the switch, when movement is detected.
     * @param onWhenMovementDetected true to switch on, and then off after configured period, false don't do anything.
     * 
     * @throws RemoteHomeConnectionException if there is problem with connection
     * @throws RemoteHomeManagerException if there is problem with the parameter value
     */
    public void configureSwitchOnWhenMovement(boolean onWhenMovementDetected) throws RemoteHomeConnectionException, RemoteHomeManagerException {
        if (onWhenMovementDetected) {
            m.sendCommand(getDeviceId(), "l1cd");
        } else {
            m.sendCommand(getDeviceId(), "l1cc");            
        }
        setOnWhenMovementDetected(onWhenMovementDetected);
    }

    /**
     * Indicates, if the swith is configured to switch on, when movement detected.
     * True means switch ON, when movement detected and stay defined configured period ON, then switch off, false means to stay OFF.
     * @return the onWhenMovement
     */
    public boolean isOnWhenMovementDetected() {
        return onWhenMovementDetected;
    }

    /**
     * Indicates, if the swith is configured to switch on, when movement detected.
     * True means switch ON, when movement detected and stay defined configured period ON, then switch off, false means to stay OFF.
     * @param onWhenMovementDetected the onWhenMovementDetected to set
     */
    protected void setOnWhenMovementDetected(boolean onWhenMovementDetected) {
        this.onWhenMovementDetected = onWhenMovementDetected;
    }

    /**
     * Status of the alarm
     * @return the alarmStatus
     */
    public int getAlarmStatus() {
        return alarmStatus;
    }

    /**
     * Status of the alarm
     * @param alarmStatus the alarmStatus to set
     */
    protected void setAlarmStatus(int alarmStatus) {
        this.alarmStatus = alarmStatus;
    }

    /**
     * Enter timeout value
     * @return the alarmEnterTimeout
     */
    public int getAlarmEnterTimeout() {
        return alarmEnterTimeout;
    }

    /**
     * Enter timeout value
     * @param alarmEnterTimeout the alarmEnterTimeout to set
     */
    public void setAlarmEnterTimeout(int alarmEnterTimeout) {
        this.alarmEnterTimeout = alarmEnterTimeout;
    }

    /**
     * Leave timeout value
     * @return the alarmLeaveTimeout
     */
    public int getAlarmLeaveTimeout() {
        return alarmLeaveTimeout;
    }

    /**
     * Leave timeout value
     * @param alarmLeaveTimeout the alarmLeaveTimeout to set
     */
    public void setAlarmLeaveTimeout(int alarmLeaveTimeout) {
        this.alarmLeaveTimeout = alarmLeaveTimeout;
    }

    /**
     * Listener to receive the asynchronous alarm event
     * @return the alarmListener
     */
    public LightAlarmDeviceListener getAlarmListener() {
        return alarmListener;
    }

    /**
     * Listener to receive the asynchronous alarm event
     * @param alarmListener the alarmListener to set
     */
    public void setAlarmListener(LightAlarmDeviceListener alarmListener) {
        this.alarmListener = alarmListener;
    }

    /**
     * Status of the alarm
     * @return the alarmSensorCurrentState
     */
    public boolean getAlarmSensorCurrentState() {
        return alarmSensorCurrentState;
    }

    /**
     * Status of the alarm
     * @param alarmSensorCurrentState the alarmSensorCurrentState to set
     */
    protected void setAlarmSensorCurrentState(boolean alarmSensorCurrentState) {
        this.alarmSensorCurrentState = alarmSensorCurrentState;
    }

    /**
     * Current smtp server host
     * @return the smtpHost
     */
    public String getSmtpHost() {
        return smtpHost;
    }

    /**
     * Current smtp server host
     * @param smtpHost the smtpHost to set
     */
    public void setSmtpHost(String smtpHost) {
        this.smtpHost = smtpHost;
    }

    /**
     * Current smtp server user
     * @return the smtpUser
     */
    public String getSmtpUser() {
        return smtpUser;
    }

    /**
     * Current smtp server user
     * @param smtpUser the smtpUser to set
     */
    public void setSmtpUser(String smtpUser) {
        this.smtpUser = smtpUser;
    }

    /**
     * Current smtp server password
     * @return the smtpPassword
     */
    public String getSmtpPassword() {
        return smtpPassword;
    }

    /**
     * Current smtp server password
     * @param smtpPassword the smtpPassword to set
     */
    public void setSmtpPassword(String smtpPassword) {
        this.smtpPassword = smtpPassword;
    }

    /**
     * Current smtp email address to
     * @return the smtpEmailTo
     */
    public String getSmtpEmailTo() {
        return smtpEmailTo;
    }

    /**
     * Current smtp email address to
     * @param smtpEmailTo the smtpEmailTo to set
     */
    public void setSmtpEmailTo(String smtpEmailTo) {
        this.smtpEmailTo = smtpEmailTo;
    }

    /**
     * Current smtp email address to
     * @return the smtpEmailFrom
     */
    public String getSmtpEmailFrom() {
        return smtpEmailFrom;
    }

    /**
     * Current smtp email address to
     * @param smtpEmailFrom the smtpEmailFrom to set
     */
    public void setSmtpEmailFrom(String smtpEmailFrom) {
        this.smtpEmailFrom = smtpEmailFrom;
    }

    /**
     * Current smtp email subject
     * @return the smtpSubject
     */
    public String getSmtpSubject() {
        return smtpSubject;
    }

    /**
     * Current smtp email subject
     * @param smtpSubject the smtpSubject to set
     */
    public void setSmtpSubject(String smtpSubject) {
        this.smtpSubject = smtpSubject;
    }

    /**
     * Current smtp email message
     * @return the smtpMessage
     */
    public String getSmtpMessage() {
        return smtpMessage;
    }

    /**
     * Current smtp email message
     * @param smtpMessage the smtpMessage to set
     */
    public void setSmtpMessage(String smtpMessage) {
        this.smtpMessage = smtpMessage;
    }

    /**
     * @return the lightOnWhenMovementDetectedSchedule
     */
    public OnOffSchedule getLightOnWhenMovementDetectedSchedule() {
        return lightOnWhenMovementDetectedSchedule;
    }

    /**
     * @param lightOnWhenMovementDetectedSchedule the lightOnWhenMovementDetectedSchedule to set
     */
    public void setLightOnWhenMovementDetectedSchedule(OnOffSchedule lightOnWhenMovementDetectedSchedule) {
        this.lightOnWhenMovementDetectedSchedule = lightOnWhenMovementDetectedSchedule;
    }

    /**
     * @return the lightSchedule
     */
    public OnOffSchedule getLightSchedule() {
        return lightSchedule;
    }

    /**
     * @param lightSchedule the lightSchedule to set
     */
    public void setLightSchedule(OnOffSchedule lightSchedule) {
        this.lightSchedule = lightSchedule;
    }

    /**
     * @return the enabledScheduler
     */
    public boolean isEnabledScheduler() {
        return enabledScheduler;
    }

    /**
     * @param enabledScheduler the enabledScheduler to set
     */
    public void setEnabledScheduler(boolean enabledScheduler) {
        this.enabledScheduler = enabledScheduler;
    }

    /**
     * @return the enabledLightOnWhenMovementScheduler
     */
    public boolean isEnabledLightOnWhenMovementScheduler() {
        return enabledLightOnWhenMovementScheduler;
    }

    /**
     * @param enabledLightOnWhenMovementScheduler the enabledLightOnWhenMovementScheduler to set
     */
    public void setEnabledLightOnWhenMovementScheduler(boolean enabledLightOnWhenMovementScheduler) {
        this.enabledLightOnWhenMovementScheduler = enabledLightOnWhenMovementScheduler;
    }
    /*    
    private void sendSMTPcmd(String s, PrintWriter out, BufferedReader in) throws IOException {
        // Send the SMTP command
        if (s != null) {
            out.println(s);
            out.flush();
        }
        // Wait for the response
        int counter = 0;
        while(!in.ready()) {
            try {
                Thread.sleep(10);
                if (++counter > 500) throw new IOException("Cannot read from the socket. No answer...");
            } catch (InterruptedException e) {
                return;
            }
        }
        in.readLine();
    }
    private void sendEmail() throws IOException {
            java.net.Socket s = new java.net.Socket(getSmtpHost(), 25);
            PrintWriter out = new PrintWriter(s.getOutputStream());
            BufferedReader in = new BufferedReader(new java.io.InputStreamReader(s.getInputStream()));
            sendSMTPcmd(null, out, in);
            sendSMTPcmd("HELO " + java.net.InetAddress.getLocalHost().getHostName(), out, in);
            if (getSmtpUser() != null) {
                ByteArrayOutputStream bout = new ByteArrayOutputStream();
                bout.write(getSmtpUser().getBytes());
                bout.write(new byte[] {(byte)0});
                bout.write(getSmtpUser().getBytes());
                bout.write(new byte[] {(byte)0});
                bout.write(getSmtpPassword().getBytes());
                sendSMTPcmd("AUTH plain", out, in);
                sendSMTPcmd(DatatypeConverter.printBase64Binary(bout.toByteArray()), out, in);
                bout.close();
            }
            sendSMTPcmd("MAIL FROM: <" + getSmtpEmailFrom() + ">", out, in);
            sendSMTPcmd("RCPT TO: <" + getSmtpEmailTo() + ">", out, in);
            sendSMTPcmd("DATA", out, in);
            out.println("From: \""+getSmtpEmailFrom()+"\" <"+getSmtpEmailFrom()+">");
            out.println("To: \""+getSmtpEmailTo()+"\" <"+getSmtpEmailTo()+">");
            out.println("Subject:" + getSmtpSubject()+"\n");
            out.println(getSmtpMessage());
            sendSMTPcmd(".", out, in);
            sendSMTPcmd("quit", out, in);
            out.close();
            in.close();
            s.close();
    }
    */
    private void sendEmail() throws Exception {
        Properties properties = System.getProperties();
        properties.setProperty("mail.smtp.host", getSmtpHost());
        properties.put("mail.smtp.port", "25");
        if (getSmtpUser() != null) {
            properties.put("mail.smtp.auth", "true");
            properties.setProperty("mail.user", getSmtpUser());
            properties.setProperty("mail.password", getSmtpPassword());
        }
        Session session = Session.getDefaultInstance(properties);
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(getSmtpEmailFrom()));
        message.addRecipient(Message.RecipientType.TO,
                                  new InternetAddress(getSmtpEmailTo()));
        message.setSubject(getSmtpSubject());
        message.setText(getSmtpMessage());
        Transport.send(message);
    }
    
    /**
     * This method will start the scheduler thread to process the schedule.
     */
    public void startScheduling() {
        getLightOnWhenMovementDetectedSchedule().setCurrentState("0");
        new Thread(new Runnable() {
            public void run() {
                while(true) {
                    try {
                        Thread.sleep(30000);
                        Calendar c = Calendar.getInstance();
                        int min = c.get(Calendar.MINUTE);
                        if (((min % 10) == 0) || (min == 0)) {
                            Boolean action = getLightOnWhenMovementDetectedSchedule().processSchedule();
                            if (action != null) {
                                //something has to be done.
                                if (action) {
                                    configureSwitchOnWhenMovement(true);
                                } else {
                                    configureSwitchOnWhenMovement(false);
                                }
                            }
                            action = getLightSchedule().processSchedule();
                            if (action != null) {
                                //something has to be done.
                                if (action) {
                                    switchOn();
                                } else {
                                    switchOff();
                                }
                            }
                        }
                        Thread.sleep(30000);
                    } catch (InterruptedException e) {
                        return;
                    } catch (RemoteHomeConnectionException e) {
                        e.printStackTrace();
                    } catch (RemoteHomeManagerException e) {
                        e.printStackTrace();
                    }
                }
            }
        }).start();        
    }
}
