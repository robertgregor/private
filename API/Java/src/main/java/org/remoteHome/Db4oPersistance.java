/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome;

import com.db4o.Db4oEmbedded;
import com.db4o.ObjectContainer;
import com.db4o.ObjectSet;
import com.db4o.config.EmbeddedConfiguration;
import com.db4o.query.Predicate;


import java.util.Collection;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author gregorro
 */
public class Db4oPersistance implements ApiPersistance {
    
    private static final int ACTIVATIONDEPTH = 10;
    private ObjectContainer db;
    
    public void open(String... params) {
        EmbeddedConfiguration c = Db4oEmbedded.newConfiguration();
        c.common().activationDepth(ACTIVATIONDEPTH);
        c.common().updateDepth(ACTIVATIONDEPTH);
        db = Db4oEmbedded.openFile(c, params[0]);
    }
    public void close() {
        db.commit();
        db.close();
    }
    public void saveDevices(HashMap<Integer, AbstractDevice> map) {
          for (AbstractDevice dev : map.values()) db.store(dev);
          db.commit();
    }
    public void saveDevice(AbstractDevice device) {
          db.store(device);
          db.commit();
    }
    public void saveSchedulers(HashMap<String, AbstractSchedule> map) {
            for (AbstractSchedule sch : map.values()) db.store(sch);
            db.commit();
    }
    public void saveSchedule(AbstractSchedule sch) {
            db.store(sch);
            db.commit();
    }
    public void saveSketchData(SketchData sk) {
            db.store(sk);
            db.commit();
    }    
    public HashMap<Integer, AbstractDevice> loadDevices() {
        HashMap<Integer, AbstractDevice> devices = new HashMap<Integer, AbstractDevice>();
        List <AbstractDevice> ad = db.query(AbstractDevice.class);
            for (AbstractDevice dev : ad) {
                db.activate(dev, ACTIVATIONDEPTH);
                if (dev.getDeviceId() != 0) devices.put(dev.getDeviceId(), dev);
            }
        return devices;
    }
    public HashMap<String, AbstractSchedule> loadSchedulers() {
        HashMap<String, AbstractSchedule> schedulers = new HashMap<String, AbstractSchedule>();
        List <AbstractSchedule> as = db.query(AbstractSchedule.class);
            for (AbstractSchedule sch : as) {
                db.activate(sch, ACTIVATIONDEPTH);
                if (sch.getName() != null) schedulers.put(sch.getName(), sch);
            }
        return schedulers;
    }
    public HashMap<String, SketchData> loadSketchesData() {
        HashMap<String, SketchData> sketchDatas = new HashMap<String, SketchData>();
        List <SketchData> as = db.query(SketchData.class);
            for (SketchData sch : as) {
                db.activate(sch, ACTIVATIONDEPTH);
                if (sch.getSketchName() != null) sketchDatas.put(sch.getSketchName(), sch);
            }
        return sketchDatas;
    }
    public User loadUser(User proto) {
        ObjectSet result = db.queryByExample(proto);
        if (result.hasNext()) 
            return (User)result.next();
        else return proto;
    }
    public User[] loadAllUsers() {
        List <User> ahs = db.query(User.class);
        return ahs.toArray(new User[0]);
    }
    public void saveUser(User user) {
            db.store(user);
            db.commit();
    }
    public void deleteUser(User user) {
        db.delete(user);
        db.commit();
    }
    public void saveProperties(Properties prop) {
            db.store(prop);
            db.commit();
    }
    public Properties loadProperties() {
        List <Properties> as = db.query(Properties.class);
        if (as.size()==0) return null;
        else return as.get(0);
    }
    public void deleteScheduler(AbstractSchedule sch) {
        db.delete(sch);
        db.commit();
    }
    public void deleteSketchData(SketchData sk) {
        db.delete(sk);
        db.commit();
    }
    public void saveDeviceSoftwareData(DeviceSoftwareData data) {
            db.store(data);
            db.commit();
    }
    public DeviceSoftwareData loadDeviceSoftwareData(DeviceSoftwareData proto) {
        ObjectSet result = db.queryByExample(proto);
        if (result.hasNext()) 
            return (DeviceSoftwareData)result.next();
        else return proto;
    }
    public DeviceSoftwareData[] loadAllDeviceSoftwareData() {
        List <DeviceSoftwareData> ahs = db.query(DeviceSoftwareData.class);
        return ahs.toArray(new DeviceSoftwareData[0]);
    }
    public void deleteObjects(Collection<AbstractDevice> devices) {
        for (AbstractDevice device : devices) {
            deleteHistoryData(device.getDeviceId());
            db.delete(device);
            db.commit();
        }
    }
    public void addHistoryData(HistoryData data) {
        db.store(data);
        db.commit();
    }
    public HistoryData[] getHistoryData(HistoryData prototype) {
        if (prototype.getDataTimestamp() != null) {
            final HistoryData proto = prototype;
            List <HistoryData> ahs = db.query(new Predicate<HistoryData>() {
                public boolean match(HistoryData historyData) {
                    if (historyData.getDataName() != null) {
                        return historyData.getDataTimestamp().after(proto.getDataTimestamp()) && 
                            historyData.getDeviceId() == proto.getDeviceId() &&
                            historyData.getDataName().equals(proto.getDataName());
                    } else {
                        return historyData.getDataTimestamp().after(proto.getDataTimestamp()) && 
                           historyData.getDeviceId() == proto.getDeviceId();                        
                    }
               }
            });
            return ahs.toArray(new HistoryData[0]);
        } else {
            List <HistoryData> ahs = db.queryByExample(prototype);
            return ahs.toArray(new HistoryData[0]);
        }
    }
    public void deleteHistoryData(int deviceId) {
        for (HistoryData d : getHistoryData(new HistoryData(deviceId))) db.delete(d);
        db.commit();        
    }

}
