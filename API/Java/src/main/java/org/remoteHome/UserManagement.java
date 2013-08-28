package org.remoteHome;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
    public static User ADMIN = new User(0, "admin",  "admin", Group.ADMIN_GROUP, false, null);
    private boolean defaultAdminPassword;

    public void init() {
        setDefaultAdminPassword(true);
        try {
            ADMIN.setPassword(MessageDigest.getInstance("SHA-256").digest(ADMIN.getPassword().getBytes()).toString());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        users.add(ADMIN);
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

    public boolean passwordsAreEqual(String password1, String password2) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        return md.digest(password1.getBytes()).equals(md.digest(password2.getBytes()));
    }

}
