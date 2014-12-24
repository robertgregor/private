/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.remoteHome;

import java.util.Date;
import java.util.HashMap;

/**
 *
 * @author gregorro
 */
public class HistoryData {
    
    /*
     * Device id which belongs to these history data items
    */
    private int deviceId;
    private String dataName;
    private String dataValue;
    private Date dataTimestamp;
    
    public HistoryData() {}
    
    public HistoryData(int deviceId) {
        this.deviceId = deviceId;
        dataName = null;
        dataValue = null;
        dataTimestamp = null;
    }
    
    public HistoryData(int deviceId, String dataName, String dataValue) {
        this.deviceId = deviceId;
        this.dataName = dataName;
        this.dataValue = dataValue;
        dataTimestamp = new Date(System.currentTimeMillis());
    }
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
     * @return the dataName
     */
    public String getDataName() {
        return dataName;
    }

    /**
     * @param dataName the dataName to set
     */
    public void setDataName(String dataName) {
        this.dataName = dataName;
    }

    /**
     * @return the dataValue
     */
    public String getDataValue() {
        return dataValue;
    }

    /**
     * @param dataValue the dataValue to set
     */
    public void setDataValue(String dataValue) {
        this.dataValue = dataValue;
    }

    /**
     * @return the dataTimestamp
     */
    public Date getDataTimestamp() {
        return dataTimestamp;
    }

    /**
     * This method sets the System.currentTimeMillis() to dataTimestamp.
     */
    public void setDataTimestamp() {
        this.dataTimestamp = new Date(System.currentTimeMillis());
    }
    /**
     * This method sets the dataTimestamp.
     * @param timestamp is the timestamp to set
     */
    public void setDataTimestamp(Date timestamp) {
        this.dataTimestamp = timestamp;
    }
    @Override
    public String toString() {
        HashMap h = new HashMap();
        h.put("deviceId", Integer.toString(deviceId));
        h.put("dataName", dataName);
        h.put("dataValue", dataValue);
        h.put("dataTimestamp", dataTimestamp.toString());
        return h.toString();
    }
}
