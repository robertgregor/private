package org.remoteHome.gui;

import com.sun.net.httpserver.Headers;
import com.sun.net.httpserver.HttpExchange;
import org.remoteHome.*;

import javax.mail.MessagingException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

public class UserManager extends AbstractWebService {

    public void init() {

    }

    public void processRequest(OutputStream o, HttpExchange t) throws IOException, RemoteHomeManagerException {
        String action = requestParameters.get("action");
        RemoteHomeManager.log.debug("Received action: "+action);
        if (action.equals("loadAllUsers")) {
            sendAjaxAnswer(AbstractDevice.generateJsonData(r.getPersistance().loadAllUsers()));
        } else if (action.equals("addUser")) {
            if (user.getGroup().equals(Group.ADMIN_GROUP)) {
                User u = new User();
                u.setUserName(requestParameters.get("userName"));
                r.getPersistance().loadUser(u);
                u.setPassword(User.computeSha1OfString(requestParameters.get("userPassword")));
                String grp = requestParameters.get("userGroupId");
                Group g = null;
                if (grp.equals("1")) {
                    g = Group.ADMIN_GROUP;
                } else if (grp.equals("2")) {
                    g = Group.OPERATOR_GROUP;
                } else if (grp.equals("3")) {
                    g = Group.GUEST_GROUP;
                }
                u.setGroup(g);
                r.getPersistance().saveUser(u);
                RemoteHomeManager.log.debug("User added: "+u);
                sendAjaxAnswer("OK");
            } else {
                sendAjaxError("error_no_permission");
            }
        } else if (action.equals("modifyUser")) {
            if (user.getGroup().equals(Group.ADMIN_GROUP)) {
                User u = new User();
                u.setUserName(requestParameters.get("userNameModify"));
                r.getPersistance().loadUser(u);
                u.setPassword(User.computeSha1OfString(requestParameters.get("userPasswordModify")));
                String grp = requestParameters.get("userGroupId2");
                Group g = null;
                if (grp.equals("1")) {
                    g = Group.ADMIN_GROUP;
                } else if (grp.equals("2")) {
                    g = Group.OPERATOR_GROUP;
                } else if (grp.equals("3")) {
                    g = Group.GUEST_GROUP;
                }
                u.setGroup(g);
                r.getPersistance().saveUser(u);
                RemoteHomeManager.log.debug("User modified: "+u);
                sendAjaxAnswer("OK");
            } else {
                sendAjaxError("error_no_permission");
            }                
        } else if (action.equals("deleteUser")) {
            if (user.getGroup().equals(Group.ADMIN_GROUP)) {
                User uproto = new User();
                uproto.setUserName(requestParameters.get("userNameDelete"));
                User u = r.getPersistance().loadUser(uproto);
                r.getPersistance().deleteUser(u);
                for (String keys : WebServerHandler.loggedUsers.keySet()) {
                    User usr = WebServerHandler.loggedUsers.get(keys);
                    if (usr.getUserName().equals(requestParameters.get("userNameDelete"))) {
                        WebServerHandler.loggedUsers.remove(usr);
                    }
                }
                RemoteHomeManager.log.debug("User deleted: "+u);
                sendAjaxAnswer("OK");
            } else {
                sendAjaxError("error_no_permission");
            }                
        }
    }
}
