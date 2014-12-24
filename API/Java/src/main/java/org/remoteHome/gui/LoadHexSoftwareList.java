/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import org.remoteHome.AbstractDevice;
import org.remoteHome.DeviceSoftwareData;
import org.remoteHome.RemoteHomeManagerException;

/**
 *
 * @author gregorro
 */
public class LoadHexSoftwareList extends AbstractWebService {
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException, RemoteHomeManagerException {
        DeviceSoftwareData[] data = r.getPersistance().loadAllDeviceSoftwareData();
        sendAjaxAnswer(AbstractDevice.generateJsonData(data));
    }
    
}
