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
    public static User ADMIN = new User(0, "admin", "admin", Group.ADMIN_GROUP, false, null);
    private boolean defaultAdminPassword;

    public void init() {
        users.add(ADMIN);
        setDefaultAdminPassword(true);
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public boolean isDefaultAdminPassword() {
        return defaultAdminPassword;
    }

    public void setDefaultAdminPassword(boolean defaultAdminPassword) {
        this.defaultAdminPassword = defaultAdminPassword;
    }
}
