/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome;

import java.io.Serializable;

/**
 *
 * @author rgregor
 */
public abstract class AbstractSchedule implements Serializable {
    
    protected String scheduleStreamMonday =    "";
    protected String scheduleStreamTuesday =   "";
    protected String scheduleStreamWednesday = "";
    protected String scheduleStreamThursday =  "";
    protected String scheduleStreamFriday =    "";
    protected String scheduleStreamSaturday =  "";
    protected String scheduleStreamSunday =    "";
    
    private String name;
    /**
     * If true, schedule is enabled, false disabled
     */
    private boolean enabled = false;

    /**
     * @return the full schedule string
     */    
    public abstract String loadSchedule();

    /**
     * @return the scheduleStreamMonday
     */
    public String getScheduleStreamMonday() {
        return scheduleStreamMonday;
    }

    /**
     * @param scheduleStreamMonday the scheduleStreamMonday to set
     */
    public void setScheduleStreamMonday(String scheduleStreamMonday) {
        this.scheduleStreamMonday = scheduleStreamMonday;
    }

    /**
     * @return the scheduleStreamTuesday
     */
    public String getScheduleStreamTuesday() {
        return scheduleStreamTuesday;
    }

    /**
     * @param scheduleStreamTuesday the scheduleStreamTuesday to set
     */
    public void setScheduleStreamTuesday(String scheduleStreamTuesday) {
        this.scheduleStreamTuesday = scheduleStreamTuesday;
    }

    /**
     * @return the scheduleStreamWednesday
     */
    public String getScheduleStreamWednesday() {
        return scheduleStreamWednesday;
    }

    /**
     * @param scheduleStreamWednesday the scheduleStreamWednesday to set
     */
    public void setScheduleStreamWednesday(String scheduleStreamWednesday) {
        this.scheduleStreamWednesday = scheduleStreamWednesday;
    }

    /**
     * @return the scheduleStreamThursday
     */
    public String getScheduleStreamThursday() {
        return scheduleStreamThursday;
    }

    /**
     * @param scheduleStreamThursday the scheduleStreamThursday to set
     */
    public void setScheduleStreamThursday(String scheduleStreamThursday) {
        this.scheduleStreamThursday = scheduleStreamThursday;
    }

    /**
     * @return the scheduleStreamFriday
     */
    public String getScheduleStreamFriday() {
        return scheduleStreamFriday;
    }

    /**
     * @param scheduleStreamFriday the scheduleStreamFriday to set
     */
    public void setScheduleStreamFriday(String scheduleStreamFriday) {
        this.scheduleStreamFriday = scheduleStreamFriday;
    }

    /**
     * @return the scheduleStreamSaturday
     */
    public String getScheduleStreamSaturday() {
        return scheduleStreamSaturday;
    }

    /**
     * @param scheduleStreamSaturday the scheduleStreamSaturday to set
     */
    public void setScheduleStreamSaturday(String scheduleStreamSaturday) {
        this.scheduleStreamSaturday = scheduleStreamSaturday;
    }

    /**
     * @return the scheduleStreamSunday
     */
    public String getScheduleStreamSunday() {
        return scheduleStreamSunday;
    }

    /**
     * @param scheduleStreamSunday the scheduleStreamSunday to set
     */
    public void setScheduleStreamSunday(String scheduleStreamSunday) {
        this.scheduleStreamSunday = scheduleStreamSunday;
    }

    /**
     * @return the enabled
     */
    public boolean isEnabled() {
        return enabled;
    }

    /**
     * @param enabled the enabled to set
     */
    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }
}
