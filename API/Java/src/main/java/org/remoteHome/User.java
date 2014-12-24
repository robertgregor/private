package org.remoteHome;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;

/**
 * Created with IntelliJ IDEA.
 * User: dr
 * Date: 8/26/13
 * Time: 3:54 PM
 * To change this template use File | Settings | File Templates.
 */
public class User {
    private String userName;
    private String password;
    private Group group;

    public User() {}
    
    public User(String userName, String password, Group group) {
        this.userName = userName;
        this.password = password;
        this.group = group;
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
    
    @Override
    public String toString() {
        HashMap h = new HashMap();
        h.put("userName", userName);
        h.put("password", password);
        h.put("group", (group != null)?group.getGroupName():"");
        return h.toString();        
    }

    @Override
    public boolean equals(Object o) {
        if (!(o instanceof User)) return false;
        return ((User)o).getUserName().equals(userName);
    }
    
    @Override
    public int hashCode() {
        if (getUserName().isEmpty()) return 0;
        else return getUserName().charAt(0);
    }
}
