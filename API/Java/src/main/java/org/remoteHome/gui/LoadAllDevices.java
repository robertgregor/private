/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import java.util.TreeSet;
import org.remoteHome.AbstractDevice;

/**
 *
 * @author gregorro
 */
public class LoadAllDevices  extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        sendAjaxAnswer(AbstractDevice.generateJsonData(r.getDevices()));
    }
}