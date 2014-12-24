/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import com.sun.net.httpserver.Headers;
import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;
import org.remoteHome.Group;
import org.remoteHome.Properties;
import org.remoteHome.RemoteHomeManager;
import org.remoteHome.RemoteHomeManagerException;
import org.remoteHome.User;

/**
 *
 * @author pt596
 */
public class WebServerHandler implements HttpHandler {
    
    RemoteHomeManager remoteHomemanager = null;
    public static HashMap<String, User> loggedUsers = new HashMap<String, User>();
    public static ResourceBundle messages;

    public WebServerHandler(RemoteHomeManager remoteHomemanager) {
        this.remoteHomemanager = remoteHomemanager;
        Properties p = null;
        try {
            p = remoteHomemanager.getPersistance().loadProperties();
            if (p==null) {
                p=new Properties();
                remoteHomemanager.getPersistance().saveProperties(p);
            }
            messages = ResourceBundle.getBundle("messages", Locale.forLanguageTag(p.language));
        } catch (RemoteHomeManagerException e) {
            messages = ResourceBundle.getBundle("messages", Locale.forLanguageTag("en"));
        }
    }
    
    public void handle(HttpExchange t) throws IOException {
        OutputStream out = null; 
        try {
            out = t.getResponseBody();
            String getRequest = t.getRequestURI().toString();
            RemoteHomeManager.log.debug("Received http request: "+getRequest);
            String session = null;
            User loggedUser = null;
            boolean userListEmpty = (remoteHomemanager.getPersistance().loadAllUsers().length == 0);
            Headers reqHeaders = t.getRequestHeaders();
            Headers respHeaders = t.getResponseHeaders();
            String p = getRequest.replaceAll("/", "");
            p = p.substring(p.indexOf('?')+1);
            HashMap<String, String> params = parseParameters(p);
            if(!reqHeaders.containsKey("Cookie")) {
                respHeaders.add("Set-Cookie", "SessionId="+Long.toString(System.currentTimeMillis())+"; Max-Age=3600; Version=1");
            } else {
                List<String> cookies = reqHeaders.get("Cookie");
                session = (cookies.get(0) != null) ? cookies.get(0) : null;
                if (session != null) loggedUser = loggedUsers.get(session);
            }
            if ((getRequest.indexOf('?') == -1) || (getRequest.indexOf('?') > 6)) {
                    //it is the request to the resource
                    if (getRequest.indexOf('?') != -1) getRequest = getRequest.substring(0, getRequest.indexOf('?'));
                    String fileNameWithDirs = getRequest.replaceAll("/", " ");
                    fileNameWithDirs = fileNameWithDirs.trim();
                    if (fileNameWithDirs.length() != 0) {
                        if (fileNameWithDirs.indexOf(" ") != -1) {
                            String fileNameArray[] = fileNameWithDirs.split(" ");
                            fileNameWithDirs = fileNameArray[fileNameArray.length - 1];
                        }
                    }
                    WebService w = (WebService)Class.forName("org.remoteHome.gui.ResourceLoaderWebService").newInstance();
                    w.init();
                    if (fileNameWithDirs.length() == 0) {
                        if (userListEmpty) {
                            RemoteHomeManager.log.debug("No users exist in the system. Displaying main.html");
                            w.setParameters(remoteHomemanager, null, "main.html");                        
                        } else {
                            if (loggedUser == null) {
                                RemoteHomeManager.log.debug("Users exist in the system. Logged user is null, displaying login.html");
                                w.setParameters(remoteHomemanager, null, "login.html");
                            } else {
                                RemoteHomeManager.log.debug("Users exist in the system. Logged user is "+loggedUser.toString()+". Displaying main.html");
                                w.setParameters(remoteHomemanager, null, "main.html");                                
                            }
                        }                        
                    } else {
                        w.setParameters(remoteHomemanager, loggedUser, fileNameWithDirs);
                    }
                    w.processRequest(out, t);
            } else if (params.size() > 0 && (params.get("logon") != null && params.get("logon").equals("true"))) {
                RemoteHomeManager.log.debug("Received logon request.");
                String parameters = getRequest.replaceAll("/", "");
                parameters = parameters.substring(parameters.indexOf('?')+1);
                HashMap<String, String> parsedParameters = parseParameters(parameters);
                String userName = parsedParameters.get("userName");
                String password = parsedParameters.get("userPassword");
                RemoteHomeManager.log.debug("Username: "+userName+" password: "+password);
                User proto = new User();
                proto.setUserName(userName);
                User u = remoteHomemanager.getPersistance().loadUser(proto);
                Headers headers = t.getResponseHeaders();
                headers.add("Content-Type", "text/html;charset=UTF-8");
                headers.add("Cache-Control", "no-cache");
                if (password.equals(u.getPassword())) {
                    RemoteHomeManager.log.info("Login successfull. Password matches. Username: "+userName);
                    loggedUsers.put(session, u);
                    loggedUser = u;
                    t.sendResponseHeaders(200, 4);
                    out.write("TRUE".getBytes());
                } else {
                    RemoteHomeManager.log.warning("Login failed. Password does not match. Username: "+userName);
                    t.sendResponseHeaders(200, 5);
                    out.write("FALSE".getBytes());                    
                }
                out.flush();                            
            } else {
                    //it is ajax request to do something
                    String parameters = getRequest.replaceAll("/", "");
                    parameters = parameters.substring(parameters.indexOf('?')+1);
                    HashMap<String, String> parsedParameters = parseParameters(parameters);
                    if (params.size() > 0 && (params.get("logoff") != null && params.get("logoff").equals("true"))) {
                        RemoteHomeManager.log.debug("Logoff request received.");
                        loggedUsers.remove(session);
                        if (reqHeaders.containsKey("Cookie")) {
                           respHeaders.remove("Cookie");
                        }
                        Headers headers = t.getResponseHeaders();
                        headers.add("Content-Type", "text/html;charset=UTF-8");
                        headers.add("Cache-Control", "no-cache");
                        t.sendResponseHeaders(200, 5);
                        out.write("FALSE".getBytes());                    
                        out.flush();                                        
                    } else {
                       if ((loggedUser == null) && !userListEmpty) {
                            //ok, send the login page
                            RemoteHomeManager.log.debug("Users is not logged in and should be. Displaying login.html");
                            WebService w = (WebService)Class.forName("org.remoteHome.gui.ResourceLoaderWebService").newInstance();
                            w.setParameters(remoteHomemanager, null, "login.html");
                            w.init();
                            w.processRequest(parsedParameters, out, t);
                        } else if ((loggedUser == null) && userListEmpty) {
                            //ok, no users exist create the dummy admin user and process ajax
                            RemoteHomeManager.log.debug("User is not logged in. Created dummy admin logged on user, thus no user is defined.");
                            loggedUser = new User();
                            loggedUser.setUserName("DummyAdminUser");
                            loggedUser.setGroup(Group.ADMIN_GROUP);
                            WebService w = (WebService)Class.forName("org.remoteHome.gui."+parsedParameters.get("ServiceName")).newInstance();
                            w.setParameters(remoteHomemanager, loggedUser);
                            w.init();
                            w.processRequest(parsedParameters, out, t);
                        } else {
                            //User is logged in
                            RemoteHomeManager.log.debug("Users is logged in.");
                            WebService w = (WebService)Class.forName("org.remoteHome.gui."+parsedParameters.get("ServiceName")).newInstance();
                            w.setParameters(remoteHomemanager, loggedUser);
                            w.init();
                            w.processRequest(parsedParameters, out, t);
                        }
                    }
            }
        } catch (Exception e) {
            RemoteHomeManager.log.error(7,e);
            Headers headers = t.getResponseHeaders();
            headers.add("Content-Type", "text/html;charset=UTF-8");
            headers.add("Cache-Control", "no-cache");
            t.sendResponseHeaders(500, e.getMessage().length());
            out.write(e.getMessage().getBytes());
            out.flush();
        } finally {
            try {                
                out.close();
            } catch (Exception e) {}
        }
    }
    private HashMap<String, String> parseParameters(String parametersString) throws UnsupportedEncodingException {
        HashMap<String, String> parsedParams = new HashMap<String, String>();
        String[] pairs = parametersString.split("&");
        for (String pair : pairs) {
            String[] keyVaue = pair.split("=");
            if (keyVaue.length == 1) {
                parsedParams.put(keyVaue[0], null);
            } else {
                parsedParams.put(keyVaue[0], URLDecoder.decode(keyVaue[1],"UTF-8"));
            }
        }
        return parsedParams;
    }
    public static void setLocale(String locale) {
        messages = ResourceBundle.getBundle("messages", Locale.forLanguageTag(locale));
    }
    public static String getBundleMessage(String key) {
        return messages.getString(key);
    }
}
