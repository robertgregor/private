/*
 * The MIT License
 *
 * Copyright 2014 Remote-Home s.r.o..
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import org.remoteHome.AbstractDevice;
import org.remoteHome.RemoteHomeManager;

/**
 *
 * @author gregorro
 */
public class LongPoolingManager extends AbstractWebService {
    private static ArrayList<LongPoolingManager> allPollingManagers = null;
    private AbstractDevice d = null;
    @Override
    public void init() {
        LongPoolingDeviceChangeListener l = new LongPoolingDeviceChangeListener(this);
        r.setDeviceChangeListener(l);
        if (allPollingManagers == null) allPollingManagers = new ArrayList<LongPoolingManager>();
        allPollingManagers.add(this);
    }
    protected void setDeviceOnlyToThisObject(AbstractDevice d) {
        this.d = d;
    }
    protected void setDevice(AbstractDevice d) {
        this.d = d;
        if (allPollingManagers != null) {
            for (LongPoolingManager m : allPollingManagers) {
                if (m!=null) {
                    m.setDeviceOnlyToThisObject(d);
                }
            }
        }
    }
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        while (d == null) {
            try {
              Thread.sleep(100);
            } catch (InterruptedException e) {
                return;
            }  
        }
        try {
            RemoteHomeManager.log.debug("Device: "+d+" changed. Going to send JSON object.");
            StringBuilder sb = new StringBuilder();
            sb.append(AbstractDevice.generateJsonData(d));
            RemoteHomeManager.log.debug("Sending JSON object: "+sb.toString());
            sendAjaxAnswer(sb.toString());
        } finally {
            if (allPollingManagers != null) {
                allPollingManagers.remove(this);
                RemoteHomeManager.log.debug("Removed this from allPollingManagers. The current size: "+allPollingManagers.size());
            }
        }
    }
}
