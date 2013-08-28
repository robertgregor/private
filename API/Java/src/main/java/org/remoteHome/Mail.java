package org.remoteHome;

/**
 * Created with IntelliJ IDEA.
 * User: dr
 * Date: 8/28/13
 * Time: 7:31 PM
 * To change this template use File | Settings | File Templates.
 */
public class Mail {
    private String from;
    private String to;
    private String subject;
    private String message;

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
