/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.SortedMap;

/**
 *
 * @author gregorro
 */
public class OnOffHistoryData extends AbstractHistoryData {
    
    public Object[] createItems(SortedMap<Long, HistoryItems> items) {
        ChartItem[] i = new ChartItem[items.size()];
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'.000Z'");
        int cnt = 0;
        for (long key : items.keySet()) {
            ChartItem it = new ChartItem();
            it.yData = (items.get(key).getItem()==0)?"Off":"On";
            it.yDataExpected = (items.get(key).getItemExpected()==0)?"Off":"On";
            Date d = new Date(key*600000);
            it.xData = df.format(d);
            i[cnt++] = it;
        }
        return i;
    }
    
    class ChartItem {
        String xData;
        String yData;    
        String yDataExpected;    
    }
}
