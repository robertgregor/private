package org.remoteHome;

/**
 * Created with IntelliJ IDEA.
 * User: dr
 * Date: 8/28/13
 * Time: 7:41 PM
 * To change this template use File | Settings | File Templates.
 */
public class SMTPConfig {
    private String host;
    private int port;
    private boolean authenticate;
    private String userName;
    private String password;

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public int getPort() {
        return port;
    }

    public void setPort(int port) {
        this.port = port;
    }

    public boolean isAuthenticate() {
        return authenticate;
    }

    public void setAuthenticate(boolean authenticate) {
        this.authenticate = authenticate;
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
}
