/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.google.gson.Gson;
import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import java.util.SortedMap;
import java.util.TreeMap;
import org.remoteHome.AbstractDevice;
import org.remoteHome.AbstractHistoryData;
import org.remoteHome.BatteryThermostatDevice;
import org.remoteHome.HeatingHeaderDevice;
import org.remoteHome.MotorControllerDevice;
import org.remoteHome.OnOffHistoryData;
import org.remoteHome.PercentageHistoryData;
import org.remoteHome.SimpleSwitchDevice;
import org.remoteHome.TemperatureHistoryData;
import org.remoteHome.TemperatureSensorDevice;
import org.remoteHome.ThermostatDevice;
import org.remoteHome.ThermostatWithSwitchAndTempSensorDevice;

/**
 *
 * @author gregorro
 */
public class GetHistoryDataJson extends AbstractWebService{
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        try {
            StringBuilder sb = new StringBuilder();
            int deviceId = Integer.parseInt(requestParameters.get("deviceId"));
            AbstractDevice d = r.getDevice(deviceId);
            AbstractHistoryData data = null;
            if (d instanceof SimpleSwitchDevice) data = new OnOffHistoryData();
            if ((d instanceof ThermostatDevice) 
                    || (d instanceof BatteryThermostatDevice)
                    || (d instanceof ThermostatWithSwitchAndTempSensorDevice)                
                    || (d instanceof HeatingHeaderDevice)             
                    || (d instanceof TemperatureSensorDevice)) data = new TemperatureHistoryData();
            if (d instanceof MotorControllerDevice) data = new PercentageHistoryData();
            data.setDeviceId(deviceId);
            AbstractHistoryData jsonData = r.getPersistance().loadHistoryData(data);
            String range = requestParameters.get("range");
            SortedMap<Long, AbstractHistoryData.HistoryItems> map = null;
            if (jsonData != data) {
                if (range.equalsIgnoreCase("hour")) map = jsonData.getLastHourSamples();
                else if (range.equalsIgnoreCase("day")) map = jsonData.getLastDaySamples();
                else if (range.equalsIgnoreCase("week")) map = jsonData.getLastWeekSamples();
                else if (range.equalsIgnoreCase("month")) map = jsonData.getLastMonthSamples();
                else if (range.equalsIgnoreCase("threemonth")) map = jsonData.getLastThreeMonthSamples();
                else if (range.equalsIgnoreCase("year")) map = jsonData.getLastYearSamples();
                else if (range.equalsIgnoreCase("threeyears")) map = jsonData.getLastThreeYearsSamples();
            } else {
                map = new TreeMap<Long, AbstractHistoryData.HistoryItems>();
            }
            Gson gson = new Gson();
            sb.append(gson.toJson(jsonData.createItems(map)));
            sendAjaxAnswer(sb.toString());
        } catch (Exception e) {
            e.printStackTrace();
            sendAjaxError(e.getMessage());
        }
    }   
}
