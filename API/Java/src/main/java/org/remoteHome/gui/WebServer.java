/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

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
        HttpServer server = HttpServer.create(new InetSocketAddress(listenPort), 100);
        server.createContext("/", new WebServerHandler(remoteHomeManager));
        server.setExecutor(java.util.concurrent.Executors.newFixedThreadPool(100)); // creates a default executor
        server.start();
    }
}
