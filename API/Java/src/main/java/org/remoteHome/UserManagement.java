package org.remoteHome;

import java.io.UnsupportedEncodingException;
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
        ADMIN.setPassword(computeSha1OfString(ADMIN.getPassword()));
        //initTest(); // TESTING PURPOSE
        users.add(ADMIN);
    }

    private void initTest() {
        ADMIN.setSmtpConfig(test());
        ADMIN.setEmail("cojetototo@gmail.com");
    }

    private SMTPConfig test() {
        SMTPConfig smtpConfig = new SMTPConfig();
        smtpConfig.setHost("smtp.gmail.com");
        smtpConfig.setPort(465);
        smtpConfig.setAuthenticate(true);
        smtpConfig.setUserName("cojetototo@gmail.com");
        smtpConfig.setPassword("lolitka81");
        return smtpConfig;
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

    /**
     * Lower case Hex Digits.
     */
    private static final String HEX_DIGITS = "0123456789abcdef";

    /**
     * Byte mask.
     */
    private static final int BYTE_MSK = 0xFF;

    /**
     * Hex digit mask.
     */
    private static final int HEX_DIGIT_MASK = 0xF;

    /**
     * Number of bits per Hex digit (4).
     */
    private static final int HEX_DIGIT_BITS = 4;

    public static String computeSha1OfString(final String message)
            throws UnsupportedOperationException, NullPointerException {
        try {
            return computeSha1OfByteArray(message.getBytes(("UTF-8")));
        } catch (UnsupportedEncodingException ex) {
            throw new UnsupportedOperationException(ex);
        }
    }

    private static String computeSha1OfByteArray(final byte[] message)
            throws UnsupportedOperationException {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            md.update(message);
            byte[] res = md.digest();
            return toHexString(res);
        } catch (NoSuchAlgorithmException ex) {
            throw new UnsupportedOperationException(ex);
        }
    }

    private static String toHexString(final byte[] byteArray) {
        StringBuilder sb = new StringBuilder(byteArray.length * 2);
        for (int i = 0; i < byteArray.length; i++) {
            int b = byteArray[i] & BYTE_MSK;
            sb.append(HEX_DIGITS.charAt(b >>> HEX_DIGIT_BITS)).append(
                    HEX_DIGITS.charAt(b & HEX_DIGIT_MASK));
        }
        return sb.toString();
    }

}
