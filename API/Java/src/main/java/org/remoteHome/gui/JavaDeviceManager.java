/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.remoteHome.gui;

import com.sun.net.httpserver.HttpExchange;
import java.io.IOException;
import java.io.OutputStream;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import javax.tools.JavaCompiler;
import javax.tools.JavaFileManager;
import javax.tools.JavaFileObject;
import javax.tools.ToolProvider;
import org.remoteHome.AbstractDevice;
import org.remoteHome.Group;
import org.remoteHome.JavaDevice;
import org.remoteHome.JavaDeviceInterface;
import org.remoteHome.RemoteHomeManager;
import org.remoteHome.compiler.CharSequenceJavaFileObject;
import org.remoteHome.compiler.ClassFileManager;

/**
 *
 * @author gregorro
 */
public class JavaDeviceManager extends AbstractWebService {
        @Override
    public void init() {}
    
    @Override
    public void processRequest(OutputStream o, HttpExchange t) throws IOException {
        boolean refresh = false;
        try {
            JavaDevice device = (JavaDevice)r.getDevice(Integer.parseInt(requestParameters.get("deviceId")));
            String action = requestParameters.get("action");
            if (action.equals("CONFIGURE")) {
                if (user.getGroup().equals(Group.ADMIN_GROUP)) {
                    String nm = requestParameters.get("nm");
                    String room = requestParameters.get("room");
                    String srcCode = requestParameters.get("srcCode");
                    if (!device.getDeviceName().equals(nm)) device.setDeviceName(nm);
                    if (!device.getRoomName().equals(room)) { device.setRoomName(room); refresh = true; }
                    r.getPersistance().saveDevice(device);
                    compileCode(srcCode);
                    if (!device.getJavaDeviceInterfaceSourceCode().equals(srcCode)) { device.setJavaDeviceInterfaceSourceCode(srcCode); refresh = true; }
                    r.getPersistance().saveDevice(device);
                    if (refresh) sendAjaxAnswer("REFRESH"); else sendAjaxAnswer("OK");
                } else {
                    sendAjaxError("error_no_permission");
                }
            } else if (action.equals("LOADBUTTON")) {
                JavaDeviceInterface jdi = compileCode(device.getJavaDeviceInterfaceSourceCode());
                sendAjaxAnswer(AbstractDevice.generateJsonData(jdi.getButtons()));
            } else if (action.equals("EXECUTEBUTTON")) {
                if ((user.getGroup().equals(Group.ADMIN_GROUP)) || (user.getGroup().equals(Group.OPERATOR_GROUP))) {
                    JavaDeviceInterface jdi = compileCode(device.getJavaDeviceInterfaceSourceCode());
                    String buttonid = requestParameters.get("buttonid");
                    try {
                        jdi.executeButton(buttonid, r);
                        sendAjaxAnswer("OK");
                    } catch (Exception e) {
                        RemoteHomeManager.log.error(1129, e);
                        sendAjaxError(e.getMessage());
                    }
                } else {
                    sendAjaxError("error_no_permission");
                }
            }
        } catch (Exception e) {
            RemoteHomeManager.log.info(e.getMessage());
            sendAjaxError(e.getMessage());
        }        
    }
    private JavaDeviceInterface compileCode(String source) throws Exception {
            JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
            JavaFileManager fileManager = new ClassFileManager(compiler.getStandardFileManager(null, null, null));
            List<JavaFileObject> jfiles = new ArrayList<JavaFileObject>();
            String className = getClassName(source);
            jfiles.add(new CharSequenceJavaFileObject(className, source));
            StringWriter out = new StringWriter();
            compiler.getTask(out, fileManager, null, null, null, jfiles).call();
            if (out.getBuffer().toString().contains("error")) {
                throw new Exception(out.getBuffer().toString());
            }
            ClassLoader loader = fileManager.getClassLoader(null);
            Class clazz = loader.loadClass(className);
            return ((JavaDeviceInterface)(clazz.forName(className,true,loader).newInstance()));
    }
    private String getClassName(String source) throws Exception {
        String[] tokens = source.split(" ");
        for (int i=0;i<tokens.length;i++) {
            if (tokens[i].equals("implements")) return "org.remoteHome."+tokens[i-1];
        }
        throw new Exception("Cannot get the class name from the source code.");
    }
}
