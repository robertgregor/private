/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rg.homeManager;

import java.util.HashMap;
import java.util.HashSet;

/**
 *
 * @author pt596
 */
public class WeatherData {

    private String outTemperature;
    private String wind;
    private String windGust;
    private String windDir;
    private String humidity;
    private String rain;
    private String presure;
    private String presureTrend;
    public String testString="17:28 CEST: Temperature: 26.4°C, Wind: NNW, 7 km/h (ave), 23 km/h (gust), Humidity: 17%, Rain (hourly) 0.0 mm, Pressure: 1003 hPa, falling slowly";

    public String getOutTemperature() {
        return outTemperature;
    }

    public void setOutTemperature(String outTemperature) {
        this.outTemperature = outTemperature;
    }

    public String getWind() {
        return wind;
    }

    public void setWind(String wind) {
        this.wind = wind;
    }

    public String getWindGust() {
        return windGust;
    }

    public void setWindGust(String windGust) {
        this.windGust = windGust;
    }

    public String getWindDir() {
        return windDir;
    }

    public void setWindDir(String windDir) {
        this.windDir = windDir;
    }

    public String getHumidity() {
        return humidity;
    }

    public void setHumidity(String humidity) {
        this.humidity = humidity;
    }

    public String getRain() {
        return rain;
    }

    public void setRain(String rain) {
        this.rain = rain;
    }

    public String getPresure() {
        return presure;
    }

    public void setPresure(String presure) {
        this.presure = presure;
    }

    public String getPresureTrend() {
        return presureTrend;
    }

    public void setPresureTrend(String presureTrend) {
        this.presureTrend = presureTrend;
    }
    public void parseWeatherLine(String line) {
        String[] pieces = line.split(",");
        //temperature
        String[] tempPiece = pieces[0].split(" ");
        String tmpString = tempPiece[tempPiece.length-1].trim();
        setOutTemperature(tmpString.substring(0, tmpString.length()-2));
        //wind dir
        tempPiece = pieces[1].split(" ");
        setWindDir(tempPiece[tempPiece.length-1].trim());
        //wind ave
        tempPiece = pieces[2].trim().split(" ");
        setWind(tempPiece[0].trim());
        //wind gust
        tempPiece = pieces[3].trim().split(" ");
        setWindGust(tempPiece[0].trim());
        //Humidity
        tempPiece = pieces[4].trim().split(" ");
        tmpString = tempPiece[1].trim();
        setHumidity(tmpString.substring(0, tmpString.length()-1));
        //Rain
        tempPiece = pieces[5].trim().split(" ");
        setRain(tempPiece[2].trim());
        //Pressure
        tempPiece = pieces[6].trim().split(" ");
        setPresure(tempPiece[1].trim());
        //Pressure trend
        setPresureTrend(pieces[7].trim());
    }
    public HashMap toHashMap() {
        HashMap h = new HashMap();
            h.put("outTemperature", getOutTemperature());
            h.put("wind", getWind());
            h.put("windGust", getWindGust());
            h.put("windDir", getWindDir());
            h.put("humidity", getHumidity());
            h.put("rain", getRain());
            h.put("presure", getPresure());
            h.put("presureTrend", getPresureTrend());
        return h;
    }
    public String toString() {
        return toHashMap().toString();
    }
    public static void main(String[] args) {
        WeatherData d = new WeatherData();
        d.parseWeatherLine(d.testString);
        System.out.println(d.toString());
    }
}
