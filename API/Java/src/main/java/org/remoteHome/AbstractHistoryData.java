/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome;

import java.util.SortedMap;
import java.util.TreeMap;

/**
 *
 * @author gregorro
 */
public abstract class AbstractHistoryData {
    
    public void saveSampleData(long timestamp, int sample) {
        if (getSamples() == null) samples = new TreeMap<Long, Integer>();
        if (getSamples().size() > 160704) getSamples().remove(getSamples().firstKey());     // 3 years
        getSamples().put(timestamp/600000, sample); // This means, the timestamp represents 10 minute
    }
    
    public SortedMap<Long, Integer> getLastHourSamples() {
        long timestamp = (System.currentTimeMillis()/600000) - 6;
        return getSamples().tailMap(timestamp);
    }

    public SortedMap<Long, Integer> getLastDaySamples() {
        long timestamp = (System.currentTimeMillis()/600000) - (6*24);
        return getSamples().tailMap(timestamp);        
    }

    public SortedMap<Long, Integer> getLastWeekSamples() {
        long timestamp = (System.currentTimeMillis()/600000) - (6*24*7);
        return getSamples().tailMap(timestamp);
    }

    public SortedMap<Long, Integer> getLastMonthSamples() {
        long timestamp = (System.currentTimeMillis()/600000) - (6*24*31);
        return getSamples().tailMap(timestamp);        
    }

    public SortedMap<Long, Integer> getLastThreeMonthSamples() {
        long timestamp = (System.currentTimeMillis()/600000) - (6*24*31*3);
        return getSamples().tailMap(timestamp);
    }
    
    public SortedMap<Long, Integer> getLastYearSamples() {
        long timestamp = (System.currentTimeMillis()/600000) - (6*24*365);
        return getSamples().tailMap(timestamp);        
    }

    public SortedMap<Long, Integer> getLastThreeYearsSamples() {
        long timestamp = (System.currentTimeMillis()/600000) - (6*24*365*3) + 1;
        return getSamples().tailMap(timestamp);        
    }

    private int deviceId;
    
    private TreeMap<Long, Integer> samples;

    /**
     * @return the deviceId
     */
    public int getDeviceId() {
        return deviceId;
    }

    /**
     * @param deviceId the deviceId to set
     */
    public void setDeviceId(int deviceId) {
        this.deviceId = deviceId;
    }

    /**
     * @return the samples
     */
    public TreeMap getSamples() {
        return samples;
    }

    /**
     * @param samples the samples to set
     */
    public void setSamples(TreeMap samples) {
        this.samples = samples;
    }
    
}
