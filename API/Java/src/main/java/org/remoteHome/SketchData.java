/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.remoteHome;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import javax.tools.JavaCompiler;
import javax.tools.JavaFileManager;
import javax.tools.JavaFileObject;
import javax.tools.ToolProvider;
import org.remoteHome.compiler.CharSequenceJavaFileObject;
import org.remoteHome.compiler.ClassFileManager;

/**
 *
 * @author gregorro
 */
public class SketchData {
    private String sketchName;
    private String sketchClassName;
    private String sketchSourceCode;
    private transient AbstractSketch sketchInstance;

    /**
     * @return the sketchName
     */
    public String getSketchName() {
        return sketchName;
    }

    /**
     * @param sketchName the sketchName to set
     */
    public void setSketchName(String sketchName) {
        this.sketchName = sketchName;
    }

    /**
     * @return the sketchSourceCode
     */
    public String getSketchSourceCode() {
        return sketchSourceCode;
    }

    /**
     * @param sketchSourceCode the sketchSourceCode to set
     */
    public void setSketchSourceCode(String sketchSourceCode) {
        this.sketchSourceCode = sketchSourceCode;
    }

    /**
     * @return the sketchInstance
     */
    public AbstractSketch getSketchInstance() {
        return sketchInstance;
    }

    /**
     * @param sketchInstance the sketchInstance to set
     */
    public void setSketchInstance(AbstractSketch sketchInstance) {
        this.sketchInstance = sketchInstance;
    }
    
    /**
     * Compile the sketch from source code
     * @return empty string, if everything is OK. If compilation fails, return the stacktrace of the error.
     */    
    public String compileSketch() {
        try {
            JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
            JavaFileManager fileManager = new ClassFileManager(compiler.getStandardFileManager(null, null, null));
            List<JavaFileObject> jfiles = new ArrayList<JavaFileObject>();
            jfiles.add(new CharSequenceJavaFileObject(getSketchClassName(), getSketchSourceCode()));
            StringWriter out = new StringWriter();
            compiler.getTask(out, fileManager, null, null, null, jfiles).call();
            if (out.getBuffer().toString().contains("error")) {
                throw new Exception(out.getBuffer().toString());
            }
            ClassLoader loader = fileManager.getClassLoader(null);
            Class clazz = loader.loadClass(getSketchClassName());
            setSketchInstance((AbstractSketch)(clazz.forName(getSketchClassName(),true,loader).newInstance()));
            return "";
        } catch (Exception e) {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            e.printStackTrace(pw);            
            RemoteHomeManager.log.warning(sw.toString().replaceAll("\n", "<br/>"));
            return sw.toString();
        }
    }
    /**
     * @return the sketchClassName
     */
    public String getSketchClassName() {
        return sketchClassName;
    }

    /**
     * @return the sketchClassName
     */
    public String getSketchShortClassName() {
        String[] tokens = sketchClassName.split(".");
        return tokens[tokens.length-1];
    }

    /**
     * @param sketchClassName the sketchClassName to set
     */
    public void setSketchClassName(String sketchClassName) {
        this.sketchClassName = sketchClassName;
    }
}
