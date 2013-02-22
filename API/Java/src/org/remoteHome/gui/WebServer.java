/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketTimeoutException;
import org.remoteHome.RemoteHomeManager;

/**
 *
 * @author pt596
 */
public class WebServer extends Thread {
    
    private int listenPort = 8080;
    private RemoteHomeManager remoteHomeManager;
    
    public WebServer() {}
    public WebServer(String listenPort, RemoteHomeManager remoteHomeManager) {
        this.listenPort = Integer.parseInt(listenPort);
        this.remoteHomeManager = remoteHomeManager;
    }
    
    public void run() {
        while (true) {
            ServerSocket ss = null;
            try {
                ss = new ServerSocket(listenPort);
                ss.setSoTimeout(10000);
                Socket clientSocket = ss.accept();
                WebServerHandler webServerHandler = new WebServerHandler(clientSocket, remoteHomeManager);
                webServerHandler.start();
            } catch (SocketTimeoutException se) {
                if (this.isInterrupted()) return;
            } catch (IOException ioe) {
                ioe.printStackTrace();
            } finally {
                try {
                    if (ss != null) ss.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
    
    public static void main(String... args) throws Exception {
        WebServer w = new WebServer("8080", new RemoteHomeManager("127.0.0.1", "8081", "C:/test.ser"));
        w.start();
    }
}
