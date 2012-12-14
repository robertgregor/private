/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rg.homeManager.pocketHome;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import javax.imageio.ImageIO;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.DateAxis;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.plot.DatasetRenderingOrder;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.plot.XYPlot;
import org.jfree.chart.renderer.xy.XYItemRenderer;
import org.jfree.chart.renderer.xy.XYLineAndShapeRenderer;
import org.jfree.data.xy.XYSeries;
import org.jfree.data.xy.XYSeriesCollection;

/**
 *
 * @author pt596
 */
public class ChartManager {
    
    private String title;
    BufferedImage bf = null;
    
    public ChartManager(String title) {
            this.title = title;            
   }
    private String padAndCutString(String in, int bytesToPad, int coef) {
        while (in.length() < bytesToPad*coef) in = "00" + in;
        in = in.substring(in.length() - bytesToPad*coef);
        return in;
    }
    private String padAndCutTime(String in, int bytesToPad, int coef) {
        while (in.length() < bytesToPad*coef) {
            if (in.length() == 0) {
                long millis = System.currentTimeMillis();
                millis = millis / (long)600000;
                in = Hex.toHexString(millis, 3);
            } else {
                long curr = Long.parseLong(in.substring(0, 6), 16) - 1L;
                in = Hex.toHexString(curr, 3) + in;
            }
        }
        in = in.substring(in.length() - bytesToPad*coef);
        return in;
    }
    private double generateSeries(XYSeries series1, XYSeries series2, XYSeries openAngle, HdDevice dev, int lastPositions) {
            double minTemp = 100.0;            
            String lastTemp = padAndCutString(dev.getLogtemperature(), lastPositions, 2);
            String lastExpTemp = padAndCutString(dev.getLogexpectedtemperature(), lastPositions, 2);
            String lastTimes = padAndCutTime(dev.getLogseconds(), lastPositions, 6);
            String lastOpenAngle = padAndCutString(dev.getLogopenangle(), lastPositions, 2);
            for (int i=0; i<lastPositions; i++) {
                Double time = new Double(Long.parseLong(lastTimes.substring(i*6, (i*6)+6), 16) * 600000L);
                Double temp = new Double((double)Long.parseLong(lastTemp.substring(i*2, (i*2)+2), 16) / (double)2);
                series1.add(time, temp);
                Double exptemp = new Double((double)Long.parseLong(lastExpTemp.substring(i*2, (i*2)+2), 16) / (double)2);
                series2.add(time, exptemp);
                Double angle = new Double((double)Long.parseLong(lastOpenAngle.substring(i*2, (i*2)+2), 16));
                openAngle.add(time, angle);
                if (temp < minTemp) minTemp = temp;
                if (exptemp < minTemp) minTemp = exptemp;
            }
        return minTemp;
    }
    private void generatePkSeries(XYSeries series1, PkDevice dev, int lastPositions) {
            String lastTimes = padAndCutTime(dev.getLogseconds(), lastPositions, 6);
            String laststatus = dev.getLogstatus();
            while (laststatus.length() < lastPositions) laststatus = "0" + laststatus;
            for (int i=0; i<lastPositions; i++) {
                Double time = new Double(Long.parseLong(lastTimes.substring(i*6, (i*6)+6), 16) * 600000L);
                Double stat = Double.parseDouble(laststatus.substring(i, i+1));
                series1.add(time, stat);
            }            
    }
    
    public void createChart(HdDevice dev, String type) {
        final XYSeries series1 = new XYSeries("Current temperature");
        final XYSeries series2 = new XYSeries("Expected temperature");
        final XYSeries openAngle = new XYSeries("Open angle");
        double minTemp = 100.0;
        if (type.equals("1")) {
            //last hour = 3 last changes
            minTemp = generateSeries(series1, series2, openAngle, dev, 3);
        } else if (type.equals("2")) {
            //last day = 3*24 last changes
            minTemp = generateSeries(series1, series2, openAngle, dev, 3*24);            
        } else if (type.equals("3")) {
            //last week = 3*24*7 last changes
            minTemp = generateSeries(series1, series2, openAngle, dev, 3*24*7);            
        } else if (type.equals("4")) {
            //last 2 week = 3*24*7*2 last changes
            minTemp = generateSeries(series1, series2, openAngle, dev, 3*24*7*2);            
        } else if (type.equals("5")) {
            //last month = 3*24*31 last changes
            minTemp = generateSeries(series1, series2, openAngle, dev, 3*24*31);            
        } else if (type.equals("6")) {
            //last 3 month = 3*24*31 last changes
            minTemp = generateSeries(series1, series2, openAngle, dev, 3*24*31*3);            
        } else if (type.equals("7")) {
            //last year = 3*24*366 last changes
            minTemp = generateSeries(series1, series2, openAngle, dev, 3*24*366);            
        }
        final XYSeriesCollection dataset = new XYSeriesCollection(series1);
        dataset.addSeries(series2);
        final XYSeriesCollection datasetAngle = new XYSeriesCollection(openAngle);
        
        final JFreeChart chart = ChartFactory.createXYLineChart(
            title,
            "Time", "Temperatures",
            dataset,
            PlotOrientation.VERTICAL,
            true,  // legend
            true,  // tool tips
            false  // URLs
        );
                
        chart.setBackgroundPaint(Color.white);
        
        final XYPlot plot = chart.getXYPlot();
        plot.setOutlinePaint(Color.black);
        plot.setBackgroundPaint(Color.lightGray);
        plot.setForegroundAlpha(0.65f);
        plot.setDomainGridlinePaint(Color.white);
        plot.setRangeGridlinePaint(Color.white);
        DateAxis axis = new DateAxis();
        axis.setDateFormatOverride(new SimpleDateFormat("d/M/yy H:mm"));
        plot.setDomainAxis(axis);
        final ValueAxis domainAxis = plot.getDomainAxis();
        domainAxis.setTickMarkPaint(Color.black);
        domainAxis.setLowerMargin(0.0);
        domainAxis.setUpperMargin(0.0);
        
        final ValueAxis rangeAxis = plot.getRangeAxis();
        rangeAxis.setTickMarkPaint(Color.black);
        rangeAxis.setLowerBound((minTemp == 0d)? 0 : new Double(minTemp-5D));
        
        final NumberAxis axis2 = new NumberAxis("Open angle in %");
        axis2.setAutoRangeIncludesZero(false);
        axis2.setLowerBound(0d);
        axis2.setUpperBound(100d);
        plot.setRangeAxis(1, axis2);
        plot.setDataset(1, datasetAngle);
        plot.mapDatasetToRangeAxis(1, 1);
        final XYItemRenderer renderer2 = new XYLineAndShapeRenderer();
        renderer2.setSeriesPaint(0, Color.BLACK);
        plot.setRenderer(1, renderer2);

        plot.setDatasetRenderingOrder(DatasetRenderingOrder.REVERSE);
        
        bf = chart.createBufferedImage(700, 300);
    }
    
    public void createPkChart(PkDevice dev, String type) {
        final XYSeries series1 = new XYSeries("Current working status");
        if (type.equals("1")) {
            //last hour = 3 last changes
            generatePkSeries(series1, dev, 3);
        } else if (type.equals("2")) {
            //last day = 3*24 last changes
            generatePkSeries(series1, dev, 3*24);            
        } else if (type.equals("3")) {
            //last week = 3*24*7 last changes
            generatePkSeries(series1, dev, 3*24*7);            
        } else if (type.equals("4")) {
            //last 2 week = 3*24*7*2 last changes
            generatePkSeries(series1, dev, 3*24*7*2);            
        } else if (type.equals("5")) {
            //last month = 3*24*31 last changes
            generatePkSeries(series1, dev, 3*24*31);            
        } else if (type.equals("6")) {
            //last 3 month = 3*24*31 last changes
            generatePkSeries(series1, dev, 3*24*31*3);            
        } else if (type.equals("7")) {
            //last year = 3*24*366 last changes
            generatePkSeries(series1, dev, 3*24*366);            
        }
        final XYSeriesCollection dataset = new XYSeriesCollection(series1);
        final JFreeChart chart = ChartFactory.createXYLineChart(
            title,
            "Time", "Heating unit state",
            dataset,
            PlotOrientation.VERTICAL,
            true,  // legend
            true,  // tool tips
            false  // URLs
        );
        chart.setBackgroundPaint(Color.white);        
        final XYPlot plot = chart.getXYPlot();
        plot.setOutlinePaint(Color.black);
        plot.setBackgroundPaint(Color.lightGray);
        plot.setForegroundAlpha(0.65f);
        plot.setDomainGridlinePaint(Color.white);
        plot.setRangeGridlinePaint(Color.white);
        DateAxis axis = new DateAxis();
        axis.setDateFormatOverride(new SimpleDateFormat("d/M/yy H:mm"));
        plot.setDomainAxis(axis);
        final ValueAxis domainAxis = plot.getDomainAxis();
        domainAxis.setTickMarkPaint(Color.black);
        domainAxis.setLowerMargin(0.0);
        domainAxis.setUpperMargin(0.0);
        
        final ValueAxis rangeAxis = plot.getRangeAxis();
        rangeAxis.setTickMarkPaint(Color.black);
        rangeAxis.setLowerBound(-1d);
        rangeAxis.setUpperBound(2d);
        plot.mapDatasetToRangeAxis(1, 1);
        final XYItemRenderer renderer2 = new XYLineAndShapeRenderer();
        renderer2.setSeriesPaint(0, Color.BLACK);
        plot.setRenderer(1, renderer2);

        plot.setDatasetRenderingOrder(DatasetRenderingOrder.REVERSE);
        
        bf = chart.createBufferedImage(700, 300);        
    }
    
    public void writeToStream(OutputStream out) throws IOException {
        DataOutputStream dout = new DataOutputStream(out);
        ImageIO.write(bf, "png", dout);
        dout.flush();
        dout.close();
    }
}
