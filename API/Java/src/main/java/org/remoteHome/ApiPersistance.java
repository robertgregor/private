/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome;

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
    void saveSchedulers(HashMap<String, AbstractSchedule> map);
    void saveSchedule(AbstractSchedule sch);
    void deleteScheduler(AbstractSchedule sch);
    HashMap<Integer, AbstractDevice> loadDevices();
    HashMap<String, AbstractSchedule> loadSchedulers();
    void saveProperties(Properties prop);
    Properties loadProperties();
    void saveHistoryData(AbstractHistoryData data);
    AbstractHistoryData loadHistoryData(AbstractHistoryData proto);
    void deleteObjects(Collection<AbstractDevice> devices);
}
