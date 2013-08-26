package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import org.remoteHome.RemoteHomeManagerException;
import org.remoteHome.User;
import org.remoteHome.UserManagement;

import java.io.IOException;
import java.io.OutputStream;

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
        if(logon != null && logon.equals("true")) {
            String userName = requestParameters.get("userName");
            String password = requestParameters.get("userPassword");
            if(userName != null && !"".equals(userName)
                    && password != null && !"".equals(password)) {
                UserManagement ums = r.getPersistance().loadUserManagement();
                if(ums != null) {

                    /*
                    if(userName.equals(u.getUserName()) && password.equals(u.getPassword())) {
                        ums.setLoggedOn(true);
                        ums.setLoggedOnUser();
                        sendAjaxAnswer("TRUE");
                    } else {
                        sendAjaxAnswer("FALSE");
                    }
                    */
                } else {
                    sendAjaxAnswer("UserManagement not correctly saved.");
                }
            } else {
                sendAjaxAnswer("Something went wrong.");
            }
        } else {

        }

        String userName = requestParameters.get("userName");
        String password = requestParameters.get("userPassword");
        String group = requestParameters.get("groupId");
        String loadUsers = requestParameters.get("loadUsers");

    }



}
