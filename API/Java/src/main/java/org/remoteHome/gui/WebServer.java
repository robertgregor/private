/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.HttpContext;
import com.sun.net.httpserver.HttpServer;
import org.remoteHome.RemoteHomeManager;

import java.net.InetSocketAddress;

/**
 * @author pt596
 */
public class WebServer {

    private int listenPort = 8080;
    private RemoteHomeManager remoteHomeManager;

    public WebServer(String listenPort, RemoteHomeManager remoteHomeManager) {
        this.listenPort = Integer.parseInt(listenPort);
        this.remoteHomeManager = remoteHomeManager;
    }

    public void startServer() throws Exception {
        HttpServer server = HttpServer.create(new InetSocketAddress(listenPort), 0);
        HttpContext context = server.createContext("/", new WebServerHandler(remoteHomeManager));
        //context.getFilters().add(new ParameterFilter());
        server.setExecutor(null); // creates a default executor
        server.start();
    }

    public static void main(String... args) throws Exception {
        WebServer w = new WebServer("8080", new RemoteHomeManager("127.0.0.1", "8081", "C:/test.ser"));
        w.startServer();
    }
}
