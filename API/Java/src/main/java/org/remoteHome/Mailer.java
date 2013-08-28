package org.remoteHome;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

/**
 * Created with IntelliJ IDEA.
 * User: dr
 * Date: 8/28/13
 * Time: 7:34 PM
 * To change this template use File | Settings | File Templates.
 */
public class Mailer {

    public Mailer() {}

    public void sendEmail(Mail mail, SMTPConfig smtpConfig) throws MessagingException {
        Properties properties = new Properties();
        properties.put("mail.smtp.host", smtpConfig.getHost());
        properties.put("mail.smtp.port", smtpConfig.getPort());
        if (smtpConfig.isAuthenticate()) {
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.starttls.enable", "true"); // added this line
            properties.put("mail.user", smtpConfig.getUserName());
            properties.put("mail.password", smtpConfig.getPassword());
        }

        Session session = Session.getDefaultInstance(properties);
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(mail.getFrom()));
        message.addRecipient(Message.RecipientType.TO,
                new InternetAddress(mail.getTo()));
        message.setSubject(mail.getSubject());
        message.setText(mail.getMessage());
        //Transport.send(message);
        Transport transport = session.getTransport("smtp");
        transport.connect(smtpConfig.getHost(), smtpConfig.getUserName(), smtpConfig.getPassword());
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
    }


}
