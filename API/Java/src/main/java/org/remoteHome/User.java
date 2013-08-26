package org.remoteHome;

/**
 * Created with IntelliJ IDEA.
 * User: dr
 * Date: 8/26/13
 * Time: 3:54 PM
 * To change this template use File | Settings | File Templates.
 */
public class User {
    private int userId;
    private String userName;
    private String password;
    private Group group;
    private boolean isLoggedOn = false;
    private String httpSession;

    public User() {}

    public User(int userId, String userName, String password, Group group) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.group = group;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public boolean isLoggedOn() {
        return isLoggedOn;
    }

    public void setLoggedOn(boolean loggedOn) {
        isLoggedOn = loggedOn;
    }

    public String getHttpSession() {
        return httpSession;
    }

    public void setHttpSession(String httpSession) {
        this.httpSession = httpSession;
    }
}
