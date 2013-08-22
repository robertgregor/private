package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import org.remoteHome.AbstractDevice;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: dr
 * Date: 8/22/13
 * Time: 8:22 PM
 * To change this template use File | Settings | File Templates.
 */
public class DeleteObject extends AbstractWebService {

    @Override
    public void init() {}

    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        String loadData = requestParameters.get("loadData");
        String loadDevices = requestParameters.get("loadDevices");
        String loadRooms = requestParameters.get("loadRooms");

        try {
            if (loadData != null && loadData.equals("true")) {
                if(loadDevices != null && loadDevices.equals("true")
                    && loadRooms != null && loadRooms.equals("false")) {
                    Map<String, HashSet<AbstractDevice>> map = r.getRooms();
                    List<Room> rooms = new ArrayList<Room>();
                    for(String roomName: map.keySet()) {
                        Room r = new Room(roomName);
                        rooms.add(r);
                    }
                    sendAjaxAnswer(AbstractDevice.generateJsonData(rooms));
                } else if(loadDevices != null && loadDevices.equals("false")
                            && loadRooms != null && loadRooms.equals("true")) {
                    List<AbstractDevice> devs = (ArrayList<AbstractDevice>) r.getDevices();
                    List<Device> devices = new ArrayList<Device>();
                    for(AbstractDevice dev : devs ) {
                        Device device = new Device(dev.getDeviceName(), dev.getDeviceId());
                        devices.add(device);
                    }
                    sendAjaxAnswer(AbstractDevice.generateJsonData(devices));

                } else {
                    sendAjaxAnswer("Deleted object.");
                }
            } else {
                sendAjaxAnswer("Channel and / or password configured. Please reset all your devices and add them again.");
            }
        } catch (Exception e) {
            sendAjaxAnswer(e.getMessage());
        }

    }

    class Room {
        private String name;
        private Room(String name) {
            this.name = name;
        }
    }

    class Device {
        private String name;
        private int id;
        private Device(String name, int id) {
            this.name = name;
            this.id = id;
        }
    }

}
