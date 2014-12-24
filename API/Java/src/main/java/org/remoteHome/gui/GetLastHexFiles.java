/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import org.remoteHome.ApiPersistance;
import org.remoteHome.DeviceSoftwareData;
import org.remoteHome.Group;
import org.remoteHome.RemoteHomeManager;
import org.remoteHome.util.Hex;

/**
 *
 * @author gregorro
 */
public class GetLastHexFiles extends AbstractWebService {
    
    private final String DATA_LOCATION = "http://www.remote-home.org/hexfiles/";
    @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        try {
            if (user.getGroup().equals(Group.ADMIN_GROUP)) {
                RemoteHomeManager.log.debug("Going to get the content of the file "+DATA_LOCATION+"versions.txt");
                String[] serverFiles = (new String(getFileFromServer(DATA_LOCATION+"versions.txt"))).split("\n");
                RemoteHomeManager.log.debug("Received data. It contains "+serverFiles.length + " lines.");
                ApiPersistance p = r.getPersistance();
                StringBuffer answer = new StringBuffer();
                for (String lines : serverFiles) {
                    RemoteHomeManager.log.debug("Going to process data:" + lines);
                    String fileName = lines.trim().split(" ")[0];
                    int version = Integer.parseInt(lines.trim().split(" ")[1]);
                    RemoteHomeManager.log.debug(fileName + " has version "+version);
                    DeviceSoftwareData proto = new DeviceSoftwareData();
                    proto.setDeviceSoftwareHexName(fileName);
                    DeviceSoftwareData data = p.loadDeviceSoftwareData(proto);
                    if (data.getDeviceSoftwareHexVersion() != version) {
                        //OK, get the hex file and save it
                        RemoteHomeManager.log.debug("Going to get content of "+DATA_LOCATION+fileName);
                        data.setDeviceSoftwareHexData(getByteStreamFromHexStream(getFileFromServer(DATA_LOCATION+fileName)));
                        RemoteHomeManager.log.info("Received content of "+DATA_LOCATION+fileName+" Size:"+data.getDeviceSoftwareHexData().length);
                        data.setDeviceSoftwareHexVersion(version);
                        p.saveDeviceSoftwareData(data);
                        RemoteHomeManager.log.debug("Device software data has been saved: "+data.toString());
                        answer.append(data.toString() + "\n");
                    }
                }            
                sendAjaxAnswer(answer.toString());
            } else {
                RemoteHomeManager.log.warning("User "+user+" doesnt have permission to update the software list.");
                sendAjaxError("error_no_permission");                
            }
        } catch (Exception e) {
            RemoteHomeManager.log.error(200, e);
            sendAjaxError("Cannot connect with the "+DATA_LOCATION+" server. Please check, that you have direct connection:\n"+e.getMessage());
        }
    }
    
    private byte[] getFileFromServer(String url) throws Exception {
        URL u = new URL(url);
        URLConnection connection = u.openConnection();
        DataInputStream in = new DataInputStream(connection.getInputStream());
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int n = - 1;
        while ( (n = in.read(buffer)) != -1) {
            if (n > 0) {
                out.write(buffer, 0, n);
            }
        }
        in.close();
        return out.toByteArray();
    }
    
    private byte[] getByteStreamFromHexStream(byte[] in) {
        String[] input = new String(in).split("\n");
        ByteArrayOutputStream out = new ByteArrayOutputStream();        
        for (String line : input) {
            line = line.trim();
            if (line.startsWith(":")) line = line.substring(1);
            try {
                out.write(":".getBytes());
                out.write(Hex.fromString(line));
            } catch (IOException e) {
                break;
            }
        }
        return out.toByteArray();
    }
}
