/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rg.homeManager;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

/**
 *
 * @author pt596
 */
public class WeatherManager extends Thread {
    
    String templatesPath = "";
    WeatherData data = new WeatherData();
    public WeatherManager(String templatesPath) {
        this.templatesPath = templatesPath;
    }
    
    private void readCurrentData() {
        try {
            BufferedReader in = new BufferedReader(new FileReader(templatesPath+"live.txt"));
            data.parseWeatherLine(in.readLine());
            WebAdm.message("WeatherData: "+data.toString());
            in.close();
        } catch (IOException e) {
            WebAdm.message(e.getClass().getName()+": "+e.getMessage());
            e.printStackTrace();
        }

    }
    public void run() {
        while (true) {
            try {
                readCurrentData();
                Thread.sleep(180000);
            } catch (InterruptedException e) {
                return;
            }
        }
    }
}
