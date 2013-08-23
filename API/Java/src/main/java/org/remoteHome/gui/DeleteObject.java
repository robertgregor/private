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
        String deleteDevice = requestParameters.get("deleteDeviceName");
        String deleteRoom = requestParameters.get("deleteRoomName");

        try {
            if (loadData != null && loadData.equals("true")) {
                if(loadDevices != null && loadDevices.equals("false")
                    && loadRooms != null && loadRooms.equals("true")) {
                    Map<String, HashSet<AbstractDevice>> map = r.getRooms();
                    List<Room> rooms = new ArrayList<Room>();
                    for(String roomName: map.keySet()) {
                        Room r = new Room(roomName);
                        rooms.add(r);
                    }
                    //System.out.println(AbstractDevice.generateJsonData(rooms));
                    sendAjaxAnswer(AbstractDevice.generateJsonData(rooms));
                } else if(loadDevices != null && loadDevices.equals("true")
                            && loadRooms != null && loadRooms.equals("false")) {
                    List<Device> devices = new ArrayList<Device>();
                    for (AbstractDevice dev : r.getDevices()) {
                    //for(AbstractDevice dev : devs ) {
                        Device device = new Device(dev.getDeviceName(), dev.getDeviceId());
                        devices.add(device);
                    }
                    //System.out.println(AbstractDevice.generateJsonData(devices));
                    sendAjaxAnswer(AbstractDevice.generateJsonData(devices));
                } else {
                    sendAjaxAnswer("Something went wrong.");
                }
            } else {
                if(deleteDevice != null && !deleteDevice.equals("0")
                    && deleteRoom != null && deleteRoom.equals("0")) {
                    try {
                        r.removeDevice(Integer.valueOf(deleteDevice));
                        r.getPersistance().deleteDevice(r.getDevices(), Integer.valueOf(deleteDevice));
                    } catch (NumberFormatException e) {
                        sendAjaxAnswer("Not a valid DeviceId");
                    }
                    sendAjaxAnswer("Deleted device: " + deleteDevice);
                } else if(deleteDevice != null && deleteDevice.equals("0")
                            && deleteRoom != null && !deleteRoom.equals("0")) {
                    for (AbstractDevice dev : r.getDevices()) {
                        if(dev.getRoomName().equals(deleteRoom)) {
                            r.removeDevice(dev.getDeviceId());
                            r.getPersistance().deleteRoom(r.getDevices(), dev.getRoomName());
                        }
                    }
                    sendAjaxAnswer("Deleted room: " + deleteRoom);
                } else if(deleteDevice != null && !deleteDevice.equals("0")
                        && deleteRoom != null && !deleteRoom.equals("0")) {
                    try {
                        r.removeDevice(Integer.valueOf(deleteDevice));
                        r.getPersistance().deleteDevice(r.getDevices(), Integer.valueOf(deleteDevice));
                        for (AbstractDevice dev : r.getDevices()) {
                            if(dev.getRoomName().equals(deleteRoom)) {
                                r.removeDevice(dev.getDeviceId());
                                r.getPersistance().deleteRoom(r.getDevices(), dev.getRoomName());
                            }
                        }
                    } catch (NumberFormatException e) {
                        sendAjaxAnswer("Not a valid DeviceId");
                    }
                    sendAjaxAnswer("Deleted device: " + deleteDevice + " and room: " + deleteRoom);
                } else {
                    sendAjaxAnswer("Something went wrong.");
                }
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
