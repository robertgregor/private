package org.remoteHome.gui;

import com.sun.net.httpserver.Headers;
import com.sun.net.httpserver.HttpExchange;
import org.remoteHome.RemoteHomeManagerException;
import org.remoteHome.User;
import org.remoteHome.UserManagement;

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
        if(logon != null && logon.equals("true")) {
            String userName = requestParameters.get("userName");
            String password = requestParameters.get("userPassword");
            Headers reqHeaders = t.getRequestHeaders();
            String session = null;
            if(!reqHeaders.containsKey("Cookie")) {
                sendAjaxAnswer("Something went wrong.");
            } else {
                List<String> cookies = reqHeaders.get("Cookie");
                session = (cookies.get(0) != null) ? cookies.get(0) : null;
            }
            if(userName != null && !"".equals(userName)
                    && password != null && !"".equals(password)) {
                UserManagement ums = r.getPersistance().loadUserManagement();
                List<User> newList = new ArrayList<User>();
                if(ums != null) {
                    if(ums.getUsers().size() > 0) {
                        for(User u : ums.getUsers()) {
                            if((userName.equals(u.getUserName())
                                    && password.equals(u.getPassword()))) {
                                u.setLoggedOn(true);
                                u.setHttpSession(session);
                                isLoggedOn = true;
                                newList.add(u);
                                break;
                            }
                        }
                    } else {
                        if((userName.equals(ums.ADMIN.getUserName())
                                && password.equals(ums.ADMIN.getPassword()))) {
                            ums.ADMIN.setLoggedOn(true);
                            ums.ADMIN.setHttpSession(session);
                            newList.add(ums.ADMIN);
                            isLoggedOn = true;
                        }
                    }
                    if(isLoggedOn) {
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
        } else if(recover != null && recover.equals("true")) {
            String userEmail = requestParameters.get("userEmail");
            sendAjaxAnswer("TRUE");
        } else if(logout != null && logout.equals("true")) {
            UserManagement ums = r.getPersistance().loadUserManagement();
            List<User> newList = new ArrayList<User>();
            Headers reqHeaders = t.getRequestHeaders();
            Headers respHeaders = t.getResponseHeaders();
            List<String> cookies = reqHeaders.get("Cookie");
            String session = (cookies.get(0) != null) ? cookies.get(0) : null;
            if(reqHeaders.containsKey("Cookie")) {
                respHeaders.remove("Cookie");
            }
            if(ums != null) {
                for(User user : ums.getUsers()) {
                    if(!user.getHttpSession().equals(session)) {
                        newList.add(user);
                    } else {
                        if(user.getUserName().equals(ums.ADMIN.getUserName())) {
                            ums.ADMIN.setLoggedOn(false);
                            ums.ADMIN.setHttpSession(null);
                        }
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
