/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome;

import com.db4o.Db4oEmbedded;
import com.db4o.ObjectContainer;
import com.db4o.config.EmbeddedConfiguration;
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
}
