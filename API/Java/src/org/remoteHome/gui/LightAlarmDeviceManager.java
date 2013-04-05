/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author pt596
 */
public class LightAlarmDeviceManager extends AbstractWebService {
 
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        
    }
    
    
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
    private void sendEmail(String smtpHost, String username, String password, String subject, String message, String from, String to) throws IOException {
            java.net.Socket s = new java.net.Socket(smtpHost, 25);
            PrintWriter out = new PrintWriter(s.getOutputStream());
            BufferedReader in = new BufferedReader(new java.io.InputStreamReader(s.getInputStream()));
            sendSMTPcmd(null, out, in);
            sendSMTPcmd("HELO " + java.net.InetAddress.getLocalHost().getHostName(), out, in);
            if (username != null) {
                ByteArrayOutputStream bout = new ByteArrayOutputStream();
                bout.write(username.getBytes());
                bout.write(new byte[] {(byte)0});
                bout.write(username.getBytes());
                bout.write(new byte[] {(byte)0});
                bout.write(password.getBytes());
                sendSMTPcmd("AUTH plain", out, in);
                sendSMTPcmd(DatatypeConverter.printBase64Binary(bout.toByteArray()), out, in);
                bout.close();
            }
            sendSMTPcmd("MAIL FROM: <" + from + ">", out, in);
            sendSMTPcmd("RCPT TO: <" + to + ">", out, in);
            sendSMTPcmd("DATA", out, in);
            out.println("From: \""+from+"\" <"+from+">");
            out.println("To: \""+to+"\" <"+to+">");
            out.println("Subject:" + subject+"\n");
            out.println(message);
            sendSMTPcmd(".", out, in);
            sendSMTPcmd("quit", out, in);
            out.close();
            in.close();
            s.close();
    }
}
