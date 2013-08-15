/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome;

import java.util.Iterator;
import java.util.SortedMap;
import java.util.TreeMap;

/**
 *
 * @author gregorro
 */
public abstract class AbstractHistoryData {
    
    public void saveSampleData(long timestamp, int sample, int expectedSample) {
        if (getSamples() == null) samples = new TreeMap<Long, HistoryItems>();
        if (getSamples().size() > 160704) getSamples().remove(getSamples().firstKey());     // 3 years
        getSamples().put(timestamp/600000, new HistoryItems(sample, expectedSample)); // This means, the timestamp represents 10 minute
    }
    
    public SortedMap<Long, HistoryItems> getLastHourSamples() {
        long timestamp = (System.currentTimeMillis()/600000) - 6;
        return getSamples().tailMap(timestamp);
    }

    public SortedMap<Long, HistoryItems> getLastDaySamples() {
        long timestamp = (System.currentTimeMillis()/600000) - (6*24);
        return getSamples().tailMap(timestamp);        
    }

    public SortedMap<Long, HistoryItems> getLastWeekSamples() {
        long timestamp = (System.currentTimeMillis()/600000) - (6*24*7);
        return getSamples().tailMap(timestamp);
    }

    public SortedMap<Long, HistoryItems> getLastMonthSamples() {
        long timestamp = (System.currentTimeMillis()/600000) - (6*24*31);
        return getSamples().tailMap(timestamp);        
    }

    public SortedMap<Long, HistoryItems> getLastThreeMonthSamples() {
        long timestamp = (System.currentTimeMillis()/600000) - (6*24*31*3);
        SortedMap<Long, HistoryItems> mapSamples = getSamples().tailMap(timestamp);
                if (mapSamples.size() > 10000) {
            SortedMap<Long, HistoryItems> mapSamplesReduced = new TreeMap<Long, HistoryItems>();
            Iterator<Long> keys = mapSamples.keySet().iterator();
            while (keys.hasNext()) {
                Long key = keys.next();
                HistoryItems value = mapSamples.get(key);
                int counter = 1;
                for (int i=0; i<2; i++) {
                    while (keys.hasNext()) {
                        Long k = keys.next();
                        HistoryItems v = mapSamples.get(key);
                        key += k;
                        value.setItem(value.getItem()+v.getItem());
                        value.setItemExpected(value.getItemExpected()+v.getItemExpected());
                        counter++;
                    }
                }
                key = key / counter;
                value.setItem(value.getItem() / counter);
                value.setItemExpected(value.getItemExpected() / counter);
                mapSamplesReduced.put(key, value);
            }
            return mapSamplesReduced;
        } else {
            return mapSamples;
        }
    }
    
    public SortedMap<Long, HistoryItems> getLastYearSamples() {
        long timestamp = (System.currentTimeMillis()/600000) - (6*24*365);
        SortedMap<Long, HistoryItems> mapSamples = getSamples().tailMap(timestamp);
                if (mapSamples.size() > 20000) {
            SortedMap<Long, HistoryItems> mapSamplesReduced = new TreeMap<Long, HistoryItems>();
            Iterator<Long> keys = mapSamples.keySet().iterator();
            while (keys.hasNext()) {
                Long key = keys.next();
                HistoryItems value = mapSamples.get(key);
                int counter = 1;
                for (int i=0; i<9; i++) {
                    while (keys.hasNext()) {
                        Long k = keys.next();
                        HistoryItems v = mapSamples.get(key);
                        key += k;
                        value.setItem(value.getItem()+v.getItem());
                        value.setItemExpected(value.getItemExpected()+v.getItemExpected());
                        counter++;
                    }
                }
                key = key / counter;
                value.setItem(value.getItem() / counter);
                value.setItemExpected(value.getItemExpected() / counter);
                mapSamplesReduced.put(key, value);
            }
            return mapSamplesReduced;
        } else {
            return mapSamples;
        }
    }

    public SortedMap<Long, HistoryItems> getLastThreeYearsSamples() {
        long timestamp = (System.currentTimeMillis()/600000) - (6*24*365*3) + 1;
        SortedMap<Long, HistoryItems> mapSamples = getSamples().tailMap(timestamp);
                if (mapSamples.size() > 60000) {
            SortedMap<Long, HistoryItems> mapSamplesReduced = new TreeMap<Long, HistoryItems>();
            Iterator<Long> keys = mapSamples.keySet().iterator();
            while (keys.hasNext()) {
                Long key = keys.next();
                HistoryItems value = mapSamples.get(key);
                int counter = 1;
                for (int i=0; i<29; i++) {
                    while (keys.hasNext()) {
                        Long k = keys.next();
                        HistoryItems v = mapSamples.get(key);
                        key += k;
                        value.setItem(value.getItem()+v.getItem());
                        value.setItemExpected(value.getItemExpected()+v.getItemExpected());
                        counter++;
                    }
                }
                key = key / counter;
                value.setItem(value.getItem() / counter);
                value.setItemExpected(value.getItemExpected() / counter);
                mapSamplesReduced.put(key, value);
            }
            return mapSamplesReduced;
        } else {
            return mapSamples;
        }
    }

    private int deviceId;
    
    private TreeMap<Long, HistoryItems> samples;

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
    public TreeMap<Long, HistoryItems> getSamples() {
        return samples;
    }

    /**
     * @param samples the samples to set
     */
    public void setSamples(TreeMap<Long, HistoryItems> samples) {
        this.samples = samples;
    }
    
    public abstract Object[] createItems(SortedMap<Long, HistoryItems> items);
    
    public class HistoryItems {
        
        private int item;
        private int itemExpected;

        public HistoryItems(int item, int itemExpected) {
            this.item = item;
            this.itemExpected = itemExpected;
        }
        
        /**
         * @return the itemExpected
         */
        public int getItemExpected() {
            return itemExpected;
        }

        /**
         * @param itemExpected the itemExpected to set
         */
        public void setItemExpected(int itemExpected) {
            this.itemExpected = itemExpected;
        }

        /**
         * @return the item
         */
        public int getItem() {
            return item;
        }

        /**
         * @param item the item to set
         */
        public void setItem(int item) {
            this.item = item;
        }
    }
}
