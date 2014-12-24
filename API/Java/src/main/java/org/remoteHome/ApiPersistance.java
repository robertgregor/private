/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;

/**
 *
 * @author gregorro
 */
public interface ApiPersistance {
    void open(String... params);
    void close();
    void saveDevices(HashMap<Integer, AbstractDevice> map);
    void saveDevice(AbstractDevice device);
    void saveSketchData(SketchData sketchData);
    void saveSchedulers(HashMap<String, AbstractSchedule> map);
    void saveSchedule(AbstractSchedule sch);
    void deleteScheduler(AbstractSchedule sch);
    void deleteSketchData(SketchData sch);
    HashMap<Integer, AbstractDevice> loadDevices();
    HashMap<String, AbstractSchedule> loadSchedulers();
    HashMap<String, SketchData> loadSketchesData();
    User loadUser(User proto);
    User[] loadAllUsers();
    void saveUser(User user);
    void deleteUser(User user);
    void saveProperties(Properties prop);
    Properties loadProperties();
    void addHistoryData(HistoryData data);
    HistoryData[] getHistoryData(HistoryData proto);
    void deleteHistoryData(int deviceId);
    void deleteObjects(Collection<AbstractDevice> devices);
    void saveDeviceSoftwareData(DeviceSoftwareData data);
    DeviceSoftwareData loadDeviceSoftwareData(DeviceSoftwareData proto);
    DeviceSoftwareData[] loadAllDeviceSoftwareData();
}
