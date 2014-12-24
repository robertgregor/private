/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import org.remoteHome.DeviceSoftwareData;
import org.remoteHome.Group;
import org.remoteHome.RemoteHomeConnectionException;
import org.remoteHome.RemoteHomeManager;
import org.remoteHome.RemoteHomeManagerException;

/**
 *
 * @author gregorro
 */
public class LoadSwToDevice extends AbstractWebService {
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException, RemoteHomeManagerException {
        if (user.getGroup().equals(Group.ADMIN_GROUP)) {
            if (requestParameters.get("getProgress") != null) {
                //OK, it is request to progress indicator, send the percentage.
                sendAjaxAnswer(r.getProgrammingDeviceProgress());
                return;
            }
            DeviceSoftwareData proto = new DeviceSoftwareData();
            proto.setDeviceSoftwareHexName(requestParameters.get("type"));
            byte[] dataToLoad = r.getPersistance().loadDeviceSoftwareData(proto).getDeviceSoftwareHexData();
            try {
                r.programDevice(dataToLoad);
                RemoteHomeManager.log.info("Software successfully loaded to the device.");
                sendAjaxAnswer("");
            } catch (RemoteHomeConnectionException e) {
                RemoteHomeManager.log.error(19, e);
                sendAjaxError(e.getMessage());
            }
        } else {
            RemoteHomeManager.log.warning("User "+user+" doesnt have permission to load the software to the device.");
            sendAjaxError("error_no_permission");
        }
    }
 

}
