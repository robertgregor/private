/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rg.homeManager;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import javax.mail.PasswordAuthentication;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author pt596
 */
public class AlarmData {

    private HomeCommunicator bt;
    private int roomId;
    public static int NAHORE = 1;
    public static int NAHORE_SMOKE = 2;
    public static int PREDSIN = 3;
    public static int OBYVACI_POKOJ = 4;
    public static int JASMINKA = 5;
    public static int KANCELAR = 6;
    public static int LOZNICE = 7;
    public static int STARA_KUCHYN = 8;
    public static int ALL = 9;
    private int enterTimeout = 0;
    private int leaveTimeout = 0;
    private int alarmTimeout = 0;
    private boolean lightOnMovement = false;
    private int lightOnMovementTimeout = 5;
    private boolean alarmActionSiren = false;
    private boolean alarmActionEmail = false;
    private String smtpServer = "";
    private String smtpUser = "";
    private String smtpPassword = "";
    private String smtpFromAddress = "";
    private String smtpToAddress = "";
    private String smtpSubject = "";
    private String smtpMessage = "";
    private boolean alarmActive = false;
    private int enterTimeoutCounter = 0;
    private int leaveTimeoutCounter = 0;
    private int alarmTimeoutCounter = 0;
    private boolean alarmActivated = false;
    private boolean alarmReported = false;

    public AlarmData(HomeCommunicator bt) {
        this.bt = bt;
    }
    public void manageSeconds() {
        if (alarmActive) {
            if (getLeaveTimeoutCounter() > 0) {
                leaveTimeoutCounter--;
            }
            if (getAlarmTimeoutCounter() > 0) {
                alarmTimeoutCounter--;
            }            
            if ((getEnterTimeoutCounter() > 0) && isAlarmActivated()) {
                enterTimeoutCounter--;
            }
            if ((getLeaveTimeoutCounter() == 0) && (getEnterTimeoutCounter() == 0) && isAlarmActivated() && !isAlarmReported()) {
                WebAdm.message("Going to report alarm for room "+getRoomName());
                setAlarmTimeoutCounter(getAlarmTimeout()+1);
                //report alarm
                if (isAlarmActionSiren()) {
                    WebAdm.message("Going to activate siren. Fired in room "+getRoomName());
                    //siren On
                    final HomeCommunicator btl = bt;
                    new Thread( new Runnable() {                        
                        public void run() {
                            try {
                                btl.sendHTTPCommand("GET /lPINN");
                                Thread.sleep(getAlarmTimeoutCounter()*1000);
                            } catch (Exception ee) {
                                WebAdm.message(ee.getMessage());
                            }
                            try {
                                btl.sendHTTPCommand("GET /mPINN");
                            } catch (Exception ee) {
                                WebAdm.message(ee.getMessage());
                            }                            
                        }
                    }).start();
                }
                if (isAlarmActionEmail()) {
                    WebAdm.message("Going to send email. Fired in room "+getRoomName());
                    sendEmail();
                }
                setAlarmReported(true);
            }
        }
    }
    
    public void activateAlarm() {
        setAlarmReported(false);
        setAlarmActivated(false);
        alarmActive = true;
        leaveTimeoutCounter = leaveTimeout;
        enterTimeoutCounter = enterTimeout;
    }
    public void deactivateAlarm() {
        alarmActive = false;
        setAlarmReported(false);        
        setAlarmActivated(false);
        try {
            bt.sendHTTPCommand("GET /mPINN");
        } catch (Exception e) {
            WebAdm.message(e.getMessage());
            try {
                Thread.sleep(1000);
                bt.sendHTTPCommand("GET /mPINN");
            } catch (Exception ee) {
                WebAdm.message(ee.getMessage());
            }
        }
    }
    public void fireAlarmEvent(int roomId) {
        WebAdm.message("Received alarm from room: "+getRoomName());
        if (alarmActive && (leaveTimeoutCounter==0)) {            
            setAlarmActivated(true);
        }
        if (lightOnMovement && isDarkAlready()) {
            try {
                if (roomId == NAHORE)
                    bt.sendHTTPCommand("GET /bPINN?a=0&b="+Integer.toString(lightOnMovementTimeout));
                else if (roomId == NAHORE_SMOKE)
                    bt.sendHTTPCommand("GET /bPINN?a=1&b="+Integer.toString(lightOnMovementTimeout));
                else if (roomId == PREDSIN)
                    bt.sendHTTPCommand("GET /bPINN?a=5&b="+Integer.toString(lightOnMovementTimeout));
                else if (roomId == OBYVACI_POKOJ)
                    bt.sendHTTPCommand("GET /bPINN?a=4&b="+Integer.toString(lightOnMovementTimeout));
                else if (roomId == JASMINKA)
                    bt.sendHTTPCommand("GET /bPINN?a=2&b="+Integer.toString(lightOnMovementTimeout));
                else if (roomId == KANCELAR)
                    bt.sendHTTPCommand("GET /bPINN?a=3&b="+Integer.toString(lightOnMovementTimeout));
                else if (roomId == LOZNICE)
                    bt.sendHTTPCommand("GET /bPINN?a=7&b="+Integer.toString(lightOnMovementTimeout));
                else if (roomId == STARA_KUCHYN)
                    bt.sendHTTPCommand("GET /bPINN?a=6&b="+Integer.toString(lightOnMovementTimeout));
            } catch (Exception e) {
                WebAdm.message("Error when tried to switch on light, when fire alarm event occured: "+e.getMessage());
            }
        }
    }

    public static boolean isDarkAlready() {
        Calendar c = Calendar.getInstance();
        int hour = c.get(Calendar.HOUR_OF_DAY);
        int month = c.get(Calendar.MONTH);
        if (month == Calendar.JANUARY) {
            if (hour > 17 || hour < 8) return true;
        } else if (month == Calendar.FEBRUARY) {
            if (hour > 18 || hour < 7) return true;
        } else if (month == Calendar.MARCH) {
            if (hour > 19 || hour < 6) return true;
        } else if (month == Calendar.APRIL) {
            if (hour > 20 || hour < 6) return true;
        } else if (month == Calendar.MAY) {
            if (hour > 20 || hour < 6) return true;
        } else if (month == Calendar.JUNE) {
            if (hour > 21 || hour < 5) return true;
        } else if (month == Calendar.JULY) {
            if (hour > 22 || hour < 5) return true;
        } else if (month == Calendar.AUGUST) {
            if (hour > 21 || hour < 6) return true;
        } else if (month == Calendar.SEPTEMBER) {
            if (hour > 20 || hour < 6) return true;
        } else if (month == Calendar.OCTOBER) {
            if (hour > 19 || hour < 7) return true;
        } else if (month == Calendar.NOVEMBER) {
            if (hour > 18 || hour < 7) return true;
        } else if (month == Calendar.DECEMBER) {
            if (hour > 17 || hour < 8) return true;
        }
        return false;
    }
        
    public boolean isAlarmActivated() {
        return alarmActivated;
    }

    public void setAlarmActivated(boolean alarmActivated) {
        this.alarmActivated = alarmActivated;
    }
    private class Authenticator extends javax.mail.Authenticator {

        private PasswordAuthentication authentication;

        public Authenticator() {
            String username = getSmtpUser();
            String password = getSmtpPassword();
            authentication = new PasswordAuthentication(username, password);
        }

        protected PasswordAuthentication getPasswordAuthentication() {
            return authentication;
        }
    }

    private Session getSession() {
        boolean loginRequired = !getSmtpUser().equals("") && !getSmtpPassword().equals("");
        Authenticator authenticator = new Authenticator();

        Properties properties = new Properties();
        if (loginRequired) {
            properties.setProperty("mail.smtp.submitter", authenticator.getPasswordAuthentication().getUserName());
            properties.setProperty("mail.smtp.auth", "true");
        }

        properties.setProperty("mail.smtp.host", getSmtpServer());
        properties.setProperty("mail.smtp.port", "25");
        if (loginRequired) {
            return Session.getInstance(properties, authenticator);
        } else {
            return Session.getInstance(properties);
        }
    }

    private void sendEmail() {
        try {
            Message message = new MimeMessage(getSession());

            message.addRecipient(RecipientType.TO, new InternetAddress(getSmtpToAddress()));
            message.addFrom(new InternetAddress[]{new InternetAddress(getSmtpFromAddress())});

            message.setSubject(getSmtpSubject());
            message.setContent(getSmtpMessage(), "text/plain");

            Transport.send(message);
        } catch (Exception e) {
            WebAdm.message(e.getMessage());
            new Thread(new Runnable() {
                public void run() {
                    try {
                        Thread.sleep(10000);
                    } catch (InterruptedException ee) {
                        return;
                    }
                    sendEmail();
                }
            }).start();
        }
    }

    public void load(String filename) throws IOException {
        Properties p = new Properties();
        p.loadFromXML(new FileInputStream(filename));
        setRoomId(Integer.parseInt(p.getProperty("roomId")));
        setEnterTimeout(Integer.parseInt(p.getProperty("enterTimeout")));
        setLeaveTimeout(Integer.parseInt(p.getProperty("leaveTimeout")));
        setAlarmTimeout(Integer.parseInt(p.getProperty("alarmTimeout")));
        setLightOnMovement(Boolean.parseBoolean(p.getProperty("lightOnMovement")));
        setLightOnMovementTimeout(Integer.parseInt(p.getProperty("lightOnMovementTimeout")));
        setAlarmActionSiren(Boolean.parseBoolean(p.getProperty("alarmActionSiren")));
        setAlarmActionEmail(Boolean.parseBoolean(p.getProperty("alarmActionEmail")));
        setSmtpServer(p.getProperty("smtpServer"));
        setSmtpUser(p.getProperty("smtpUser"));
        setSmtpPassword(p.getProperty("smtpPassword"));
        setSmtpFromAddress(p.getProperty("smtpFromAddress"));
        setSmtpToAddress(p.getProperty("smtpToAddress"));
        setSmtpSubject(p.getProperty("smtpSubject"));
        setSmtpMessage(p.getProperty("smtpMessage"));
    }

    public void save(String fileName) throws IOException {
        Properties p = new Properties();
        p.setProperty("roomId", Integer.toString(roomId));
        p.setProperty("enterTimeout", Integer.toString(getEnterTimeout()));
        p.setProperty("leaveTimeout", Integer.toString(getLeaveTimeout()));
        p.setProperty("alarmTimeout", Integer.toString(getAlarmTimeout()));
        p.setProperty("lightOnMovement", Boolean.toString(isLightOnMovement()));
        p.setProperty("lightOnMovementTimeout", Integer.toString(getLightOnMovementTimeout()));
        p.setProperty("alarmActionSiren", Boolean.toString(isAlarmActionSiren()));
        p.setProperty("alarmActionEmail", Boolean.toString(isAlarmActionEmail()));
        p.setProperty("smtpServer", getSmtpServer());
        p.setProperty("smtpUser", getSmtpUser());
        p.setProperty("smtpPassword", getSmtpPassword());
        p.setProperty("smtpFromAddress", getSmtpFromAddress());
        p.setProperty("smtpToAddress", getSmtpToAddress());
        p.setProperty("smtpSubject", getSmtpSubject());
        p.setProperty("smtpMessage", getSmtpMessage());


        FileOutputStream of = new FileOutputStream(fileName);
        p.storeToXML(of, "Property definition");
        of.close();
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public int getEnterTimeout() {
        return enterTimeout;
    }

    public void setEnterTimeout(int enterTimeout) {
        this.enterTimeout = enterTimeout;
    }

    public int getLeaveTimeout() {
        return leaveTimeout;
    }

    public void setLeaveTimeout(int leaveTimeout) {
        this.leaveTimeout = leaveTimeout;
    }

    public int getAlarmTimeout() {
        return alarmTimeout;
    }

    public void setAlarmTimeout(int alarmTimeout) {
        this.alarmTimeout = alarmTimeout;
    }

    public boolean isLightOnMovement() {
        return lightOnMovement;
    }

    public void setLightOnMovement(boolean lightOnMovement) {
        this.lightOnMovement = lightOnMovement;
    }

    public int getLightOnMovementTimeout() {
        return lightOnMovementTimeout;
    }

    public void setLightOnMovementTimeout(int lightOnMovementTimeout) {
        this.lightOnMovementTimeout = lightOnMovementTimeout;
    }

    public boolean isAlarmActionSiren() {
        return alarmActionSiren;
    }

    public void setAlarmActionSiren(boolean alarmActionSiren) {
        this.alarmActionSiren = alarmActionSiren;
    }

    public boolean isAlarmActionEmail() {
        return alarmActionEmail;
    }

    public void setAlarmActionEmail(boolean alarmActionEmail) {
        this.alarmActionEmail = alarmActionEmail;
    }

    public String getSmtpServer() {
        return smtpServer;
    }

    public void setSmtpServer(String smtpServer) {
        this.smtpServer = smtpServer;
    }

    public String getSmtpUser() {
        return smtpUser;
    }

    public void setSmtpUser(String smtpUser) {
        this.smtpUser = smtpUser;
    }

    public String getSmtpPassword() {
        return smtpPassword;
    }

    public void setSmtpPassword(String smtpPassword) {
        this.smtpPassword = smtpPassword;
    }

    public String getSmtpFromAddress() {
        return smtpFromAddress;
    }

    public void setSmtpFromAddress(String smtpFromAddress) {
        this.smtpFromAddress = smtpFromAddress;
    }

    public String getSmtpToAddress() {
        return smtpToAddress;
    }

    public void setSmtpToAddress(String smtpToAddress) {
        this.smtpToAddress = smtpToAddress;
    }

    public String getSmtpSubject() {
        return smtpSubject;
    }

    public void setSmtpSubject(String smtpSubject) {
        this.smtpSubject = smtpSubject;
    }

    public String getSmtpMessage() {
        return smtpMessage;
    }

    public void setSmtpMessage(String smtpMessage) {
        this.smtpMessage = smtpMessage;
    }

    public boolean isAlarmActive() {
        return alarmActive;
    }

    public void setAlarmActive(boolean alarmActive) {
        this.alarmActive = alarmActive;
    }

    public int getEnterTimeoutCounter() {
        return enterTimeoutCounter;
    }

    public void setEnterTimeoutCounter(int enterTimeoutCounter) {
        this.enterTimeoutCounter = enterTimeoutCounter;
    }

    public int getLeaveTimeoutCounter() {
        return leaveTimeoutCounter;
    }

    public void setLeaveTimeoutCounter(int leaveTimeoutCounter) {
        this.leaveTimeoutCounter = leaveTimeoutCounter;
    }

    public int getAlarmTimeoutCounter() {
        return alarmTimeoutCounter;
    }

    public void setAlarmTimeoutCounter(int alarmTimeoutCounter) {
        this.alarmTimeoutCounter = alarmTimeoutCounter;
    }

    public String getRoomName() {
        if (getRoomId() == NAHORE) {
            return "horni patro - cidlo obytna kuchyn";
        }
        if (getRoomId() == NAHORE_SMOKE) {
            return "horni patro - kourove cidlo";
        }
        if (getRoomId() == PREDSIN) {
            return "predsin";
        }
        if (getRoomId() == OBYVACI_POKOJ) {
            return "obyvaci pokoj";
        }
        if (getRoomId() == JASMINKA) {
            return "jasminka";
        }
        if (getRoomId() == KANCELAR) {
            return "kancelar";
        }
        if (getRoomId() == LOZNICE) {
            return "loznice";
        }
        if (getRoomId() == ALL) {
            return "Vsechny mistnosti";
        }
        if (getRoomId() == STARA_KUCHYN) {
            return "stara kuchyn";
        } else {
            return "Unknown room";
        }
    }

    public boolean isAlarmFired() {
        return isAlarmActivated();
    }

    public void setAlarmFired(boolean alarmFired) {
        this.setAlarmActivated(alarmFired);
    }

    public boolean isAlarmReported() {
        return alarmReported;
    }

    public void setAlarmReported(boolean alarmReported) {
        this.alarmReported = alarmReported;
    }
    
    public static void main(String[] args) {
        System.out.println(AlarmData.isDarkAlready());
    }
}