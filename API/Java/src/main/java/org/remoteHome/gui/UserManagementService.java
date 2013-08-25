package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import org.remoteHome.RemoteHomeManagerException;

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
        String userName = requestParameters.get("userName");
        String password = requestParameters.get("userPassword");
        String group = requestParameters.get("groupId");
        String loadUsers = requestParameters.get("loadUsers");

    }

}
