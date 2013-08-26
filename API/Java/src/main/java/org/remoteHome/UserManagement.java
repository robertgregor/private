package org.remoteHome;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: dr
 * Date: 8/25/13
 * Time: 7:54 PM
 * To change this template use File | Settings | File Templates.
 */
public class UserManagement {

    private List<User> users = new ArrayList<User>();
    private List<User> loggedOnUsers = new ArrayList<User>();

    public final User ADMIN = new User(0, "admin", "admin", new Group(0, "Admnistrator"));

    public void init() {
        users.add(ADMIN);
    }

    public List<User> getLoggedOnUsers() {
        return loggedOnUsers;
    }

    public void setLoggedOnUsers(List<User> loggedOnUsers) {
        this.loggedOnUsers = loggedOnUsers;
    }
}
