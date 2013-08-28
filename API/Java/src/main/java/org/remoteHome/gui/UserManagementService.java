package org.remoteHome.gui;

import com.sun.net.httpserver.Headers;
import com.sun.net.httpserver.HttpExchange;
import org.remoteHome.*;

import javax.mail.MessagingException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: dr
 * Date: 8/25/13
 * Time: 7:53 PM
 * To change this template use File | Settings | File Templates.
 */
public class UserManagementService extends AbstractWebService {

    public void init() {

    }

    public void processRequest(OutputStream o, HttpExchange t) throws IOException, RemoteHomeManagerException {
        String logon = requestParameters.get("logon");
        String recover = requestParameters.get("recover");
        String logout = requestParameters.get("logout");
        boolean isLoggedOn = false;
        if (logon != null && logon.equals("true")) {
            String userName = requestParameters.get("userName");
            String password = requestParameters.get("userPassword");
            Headers reqHeaders = t.getRequestHeaders();
            String session = null;
            if (!reqHeaders.containsKey("Cookie")) {
                sendAjaxAnswer("Something went wrong.");
            } else {
                List<String> cookies = reqHeaders.get("Cookie");
                session = (cookies.get(0) != null) ? cookies.get(0) : null;
            }
            if (userName != null && !"".equals(userName)
                    && password != null && !"".equals(password)) {
                UserManagement ums = r.getPersistance().loadUserManagement();
                List<User> newList = ums.getUsers();
                if (ums != null && ums.getUsers().size() > 0) {
                    for (User u : ums.getUsers()) {
                        if ((userName.equals(u.getUserName())
                                && password.equals(u.getPassword()))) {
                            if (!u.isLoggedOn()) {
                                isLoggedOn = true;
                                u.setLoggedOn(true);
                                u.setHttpSession(session);
                                break;
                            } else {
                                User uu = new User(1, u.getUserName(), u.getPassword(), u.getGroup(), true, session);
                                isLoggedOn = true;
                                newList.add(uu);
                                break;
                            }
                        }
                    }
                    if (isLoggedOn) {
                        ums.setUsers(newList);
                        r.getPersistance().saveUserManagement(ums);
                        sendAjaxAnswer("TRUE");
                    } else {
                        sendAjaxAnswer("FALSE");
                    }
                } else {
                    sendAjaxAnswer("UserManagement not correctly saved.");
                }
            } else {
                sendAjaxAnswer("Something went wrong.");
            }
        } else if (recover != null && recover.equals("true")) {
            String userEmail = requestParameters.get("userEmail");
            UserManagement ums = r.getPersistance().loadUserManagement();
            List<User> newList = new ArrayList<User>();
            boolean hasChanged = false;
            String newPassword = null;
            User u = null;
            if (ums != null && ums.getUsers().size() > 0) {
                for (User user : ums.getUsers()) {
                    if (user.getEmail().equals(userEmail)) {
                        hasChanged = true;
                        newPassword = Long.toHexString(Double.doubleToLongBits(Math.random()));
                        user.setPassword(UserManagement.computeSha1OfString(newPassword));
                        u = user;
                    }
                    newList.add(user);
                }
                if (hasChanged) {
                    if(u.getSmtpConfig() != null) {
                        ums.setUsers(newList);
                        r.getPersistance().saveUserManagement(ums);
                        Mail mail = new Mail();
                        mail.setFrom("remote-home@systemmanagement.com");
                        mail.setTo(u.getEmail());
                        mail.setSubject("New password");
                        mail.setMessage("Your new password is: " + newPassword);
                        Mailer mailer = new Mailer();
                        try {
                            mailer.sendEmail(mail, u.getSmtpConfig());
                        } catch (MessagingException e) {
                            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
                            sendAjaxAnswer("FALSE");
                        }
                        sendAjaxAnswer("TRUE");
                    } else {
                        sendAjaxAnswer("SMTP_FALSE");
                    }
                } else {
                    sendAjaxAnswer("FALSE");
                }
            }
        } else if (logout != null && logout.equals("true")) {
            UserManagement ums = r.getPersistance().loadUserManagement();
            List<User> newList = new ArrayList<User>();
            Headers reqHeaders = t.getRequestHeaders();
            Headers respHeaders = t.getResponseHeaders();
            List<String> cookies = reqHeaders.get("Cookie");
            String session = (cookies.get(0) != null) ? cookies.get(0) : null;
            if (reqHeaders.containsKey("Cookie")) {
                respHeaders.remove("Cookie");
            }
            if (ums != null && ums.getUsers().size() > 0) {
                for (User user : ums.getUsers()) {
                    if (!user.getHttpSession().equals(session)) {
                        newList.add(user);
                    }
                }
                ums.setUsers(newList);
                r.getPersistance().saveUserManagement(ums);
            }
            sendAjaxAnswer("TRUE");
        } else {
            //Pre-load data for changing
        }


    }

}
