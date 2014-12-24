package org.remoteHome;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class Mailer {

    public Mailer() {}

    public void sendEmail(Mail email, org.remoteHome.Properties properties) {
        final org.remoteHome.Properties p = properties;
        final Mail mail = email;
        new Thread(new Runnable() {
            public void run() {
                try {
                    Properties properties = new Properties();
                    properties.put("mail.smtp.host", p.smtpHost);
                    properties.put("mail.smtp.port", p.smtpPort);
                    if (p.smtpAuthenticate) {
                        properties.put("mail.smtp.auth", "true");
                        properties.put("mail.user", p.smtpUserName);
                        properties.put("mail.password", p.smtpPassword);
                    }
                    if (p.useMailTls) {
                        properties.put("mail.smtp.starttls.enable", "true");
                    }
                    Session session = Session.getDefaultInstance(properties);
                    MimeMessage message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(p.smtpFrom));
                    message.addRecipient(Message.RecipientType.TO, new InternetAddress(mail.getTo()));
                    message.setSubject(mail.getSubject());
                    message.setText(mail.getMessage());
                    Transport transport = session.getTransport("smtp");
                    transport.connect(p.smtpHost, p.smtpUserName, p.smtpPassword);
                    transport.sendMessage(message, message.getAllRecipients());
                    transport.close();
                    RemoteHomeManager.log.info("Email message sent: "+message.toString());
                } catch (Exception e) {
                        RemoteHomeManager.log.error(2349, e);
                }
            }
        }).start();
    }
}
