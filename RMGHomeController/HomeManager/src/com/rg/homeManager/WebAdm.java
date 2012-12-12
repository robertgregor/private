package com.rg.homeManager;

import com.rg.homeManager.pocketHome.HeatingManager;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WebAdm extends HttpServlet {

    private HomeCommunicator bt = null;
    public static WebAdm w = null;
    private Lights lights = null;
    private BlindsWindows blinds = null;
    private AlarmManager alarm = null;
    private HeatingManager heating = null;
    private WeatherManager weather = null;
    
    /*
    Init method of servlet (called when the servlet is going to be loaded by servlet container
     */
    public void init(ServletConfig config) throws ServletException {
        try {
            super.init(config);
            this.w = this;            
            bt = new HomeCommunicator (config.getInitParameter("HC_PORT"));
            bt.setName("Home communicator");
            bt.start();
            lights = new Lights(bt, config);
            lights.setName("Lights manager");
            blinds = new BlindsWindows(bt, config);            
            blinds.setName("Blinds manager");
            alarm = new AlarmManager(bt, config);
            alarm.setName("Alarm manager");
            lights.start();
            blinds.start();
            alarm.start();
            heating = new HeatingManager(config);
            heating.setName("Heating manager");
            heating.start(); 
            weather = new WeatherManager(config.getInitParameter("WEATHER_DATA"));
            weather.start();
            WebAdm.message("Init of Home control servlet done! ...");
        } catch (Exception e1) {
            e1.printStackTrace();
            WebAdm.message("Server error in init! ...");
        }
    }

    //prints out the message
    public static void message(String msg) {
            ServletContext sc = w.getServletContext();
            sc.log(msg);
    }
    /*
    Destroy method of servlet
     */
    public void destroy() {
        bt.interrupt();
        bt.disconnect();        
        lights.interrupt();
        blinds.interrupt();
        alarm.interrupt();
        heating.closePHC();
        heating.interrupt();
        weather.interrupt();
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        String action = request.getParameter("action");
        String pin = request.getParameter("pin");
        OutputStream out = response.getOutputStream();
        ServletContext context = getServletContext();
        if (action == null) {
            gotoPage("/pages/index.html", request, response);
            return;
        }
        if (action.equals("d")) {
            //save schedule light
            String id = request.getParameter("id");
            for (int i=0; i<14;i++) {                
                lights.saveSchedule(id, request.getParameter(Integer.toString(i)), Integer.toString(i));
                WebAdm.message("Schedule saved. Id:"+id+", SchNb: "+i+", Sch:"+request.getParameter(Integer.toString(i)));
            }
            sendResponseOK(response);
        } else if (action.equals("D")) {
            //load schedule light
            WebAdm.message("Loading schedule for id="+request.getParameter("id"));
            String resp = lights.loadSchedule(request.getParameter("id"));
            response.setContentType("text/html");
            response.setContentLength(resp.length());
            response.setHeader("Connection", "close");
            out.write(resp.getBytes());
            out.flush();
            out.close();
        } else if (action.equals("b")) {
            if (request.getParameter("id") != null) {
                //light on
                try {
                    if (!request.getParameter("id").equals("10")) {
                        if (!request.getParameter("id").equals("9")) {
                            sendResponseOK(response, bt.lightOn(request.getParameter("id")));
                        } else {
                            sendResponseOK(response, bt.sendHTTPCommand("GET /8PINN"));
                        }
                    } else {
                        for (int i=0; i<9; i++) {
                            sendResponseOK(response, bt.lightOn(Integer.toString(i)));
                        }
                        sendResponseOK(response, bt.sendHTTPCommand("GET /8PINN"));
                    }
                } catch (IOException e) {
                    sendResponseError(response, e.getMessage());
                }
            }
        } else if (action.equals("c")) {
            if (request.getParameter("id") != null) {
                //light on
                try {
                    if (!request.getParameter("id").equals("10")) {
                        if (!request.getParameter("id").equals("9")) {
                            sendResponseOK(response, bt.lightOff(request.getParameter("id")));
                        } else {
                            sendResponseOK(response, bt.sendHTTPCommand("GET /9PINN"));
                        }
                    } else {
                        for (int i=0; i<9; i++) {
                            sendResponseOK(response, bt.lightOff(Integer.toString(i)));
                        }
                        sendResponseOK(response, bt.sendHTTPCommand("GET /9PINN"));
                    }
                } catch (IOException e) {
                    sendResponseError(response, e.getMessage());
                }
            }
        } else if (action.equals("a")) {
            if ((request.getParameter("id") != null) && (request.getParameter("period") != null)) {
                //light on
                try {
                    if (!request.getParameter("id").equals("10")) {
                        if (!request.getParameter("id").equals("9")) {
                            sendResponseOK(response, bt.lightOffAfterPeriod(request.getParameter("id"), request.getParameter("period")));
                        } else {
                            sendResponseOK(response, bt.sendHTTPCommand("GET /8PINN?a="+request.getParameter("period")));
                        }
                    } else {
                        for (int i=0; i<9; i++) {
                            sendResponseOK(response, bt.lightOffAfterPeriod(Integer.toString(i), request.getParameter("period")));
                        }
                        sendResponseOK(response, bt.sendHTTPCommand("GET /8PINN?a="+request.getParameter("period")));
                    }
                } catch (IOException e) {
                    sendResponseError(response, e.getMessage());
                }
            }
            if ((request.getParameter("id") != null) && (request.getParameter("period") != null)) {
                //light on
                try {
                    sendResponseOK(response, bt.lightOffAfterPeriod(request.getParameter("id"), (request.getParameter("period"))));
                } catch (IOException e) {
                    sendResponseError(response, e.getMessage());
                }
            }            
        } else if (action.equals("E")) {
            //load schedule light
            WebAdm.message("Loading blinds schedule for id="+request.getParameter("id"));
            String resp = blinds.loadSchedule(request.getParameter("id"));
            response.setContentType("text/html");
            response.setContentLength(resp.length());
            response.setHeader("Connection", "close");
            out.write(resp.getBytes());
            out.flush();
            out.close();
        } else if (action.equals("e")) {
            //save schedule light
            String id = request.getParameter("id");
            for (int i=0; i<14;i++) {                
                blinds.saveSchedule(id, request.getParameter(Integer.toString(i)), Integer.toString(i));
                WebAdm.message("Blinds schedule saved. Id:"+id+", SchNb: "+i+", Sch:"+request.getParameter(Integer.toString(i)));
            }
            sendResponseOK(response);
        } else if (action.equals("f")) {
            //blinds down
            try {
                blinds.down(request.getParameter("id"));
                sendResponseOK(response);
            } catch (Exception e) {
                WebAdm.message(e.getMessage());
                sendResponseError(response, e.getMessage());
            }
        } else if (action.equals("g")) {
            //blinds stop
            try {
                blinds.stop(request.getParameter("id"));
                sendResponseOK(response);
            } catch (Exception e) {
                WebAdm.message(e.getMessage());
                sendResponseError(response, e.getMessage());
            }
        } else if (action.equals("h")) {
            //blinds up
            try {
                blinds.up(request.getParameter("id"));
                sendResponseOK(response);
            } catch (Exception e) {
                WebAdm.message(e.getMessage());
                sendResponseError(response, e.getMessage());
            }
        } else if (action.equals("AS")) {
                String status = alarm.getAlarmStatus(request.getParameter("id"));
                sendResponseOK(response, status);
        } else if (action.equals("AC")) {
                String status = alarm.getAlarmConfig(Integer.parseInt(request.getParameter("id")));
                sendResponseOK(response, status);
        } else if (action.equals("acs")) {
            try {
                alarm.saveAlarmConfig(Integer.parseInt(request.getParameter("id")), request);
                sendResponseOK(response);
            } catch (Exception e) {
                e.printStackTrace();
                WebAdm.message(e.getMessage());
                sendResponseError(response, e.getMessage());
            }
        } else if (action.equals("aa")) {
            alarm.activateAlarm(Integer.parseInt(request.getParameter("id")));
            sendResponseOK(response);
        } else if (action.equals("ad")) {
            alarm.deActivateAlarm(Integer.parseInt(request.getParameter("id")));
            sendResponseOK(response);
        } else if (action.equals("ass")) {
            alarm.stopSiren();
            sendResponseOK(response);
        } else if (action.equals("asi")) {
            alarm.simulateAlarm(Integer.parseInt(request.getParameter("id")));
            sendResponseOK(response);
        } else if (action.equals("ha")) {
            //load program list
            sendResponseOK(response, heating.getProgramsList(request.getParameter("id")));
        } else if (action.equals("hp")) {
            //get program
            String data = heating.getProgramsData(request.getParameter("id"));
            if (!data.equals("")) {
                sendResponseOK(response, data);
            } else {
                sendResponseError(response, "Program with the name "+request.getParameter("id")+" doesn't exist. Please refresh your data.");
            }
        } else if (action.equals("HS")) {
            sendResponseOK(response, heating.getHdStatus(request.getParameter("id")));
        } else if (action.equals("hps")) {
            heating.saveProgram(request.getParameter("id"), request.getParameter("sch"));
            sendResponseOK(response);
        } else if (action.equals("hpas")) {
            heating.assignProgram(request.getParameter("id"), request.getParameter("progid"));
            sendResponseOK(response);
        } else if (action.equals("hpd")) {
            sendResponseOK(response, heating.deleteProgram(request.getParameter("id")));
        } else if (action.equals("hct")) {
            //set manually temperature
            heating.setTemperatureMan(Byte.parseByte(request.getParameter("id")), Byte.parseByte(request.getParameter("temp")));
            sendResponseOK(response);
        } else if (action.equals("hcn")) {
            //set normal
            heating.phc.setNormalOperation();
            sendResponseOK(response);
        } else if (action.equals("hcs")) {
            //set summer
            heating.phc.setSummerOperation();
            sendResponseOK(response);
        } else if (action.equals("hcf")) {
            //set full
            heating.phc.setFullOnOperation();
            sendResponseOK(response);
        } else if (action.equals("hch")) {
            //heating chart
            response.setContentType("image/jpeg");
            response.setHeader("Connection", "close");
            heating.getChart(request.getParameter("id"), request.getParameter("type"), out);
            out.flush();
            out.close();            
        }
    }

    private void sendResponseOK(HttpServletResponse response) throws ServletException, IOException {
            String resp = "<HTML><BODY>OK</BODY></HTML>";
            response.setContentType("text/html");
            response.setContentLength(resp.length());
            response.setHeader("Connection", "close");
            OutputStream out = response.getOutputStream();
            out.write(resp.getBytes());
            out.flush();
            out.close();
        
    }
    private void sendResponseOK(HttpServletResponse response, String resp) throws ServletException, IOException {
            response.setContentType("text/html");
            response.setContentLength(resp.length());
            response.setHeader("Connection", "close");
            OutputStream out = response.getOutputStream();
            out.write(resp.getBytes());
            out.flush();
            out.close();
        
    }
    private void sendResponseError(HttpServletResponse response, String resp) throws ServletException, IOException {
            response.sendError(502, resp);
    }    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }    
    
    	public void gotoPage(String address, HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		//pack to the request the webbean object
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
		dispatcher.forward(request, response);
	}

}
