/*
 * The MIT License
 *
 * Copyright 2014 Remote-Home s.r.o..
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package org.remoteHome;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Date;
import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import static javax.swing.JFrame.EXIT_ON_CLOSE;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTabbedPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.border.BevelBorder;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.text.DefaultCaret;
import org.remoteHome.stk500_v1.Logger;
import org.remoteHome.stk500_v1.STK500v1;
import org.remoteHome.util.Hex;
import org.remoteHome.util.Logfile;

/**
 *
 * @author gregorro
 */
public class NetworkProgramming extends Thread {
    
    enum Logging {CONSOLE, GUI, Logfile};
    enum LoggingSeverity {DEBUG, INFO, WARNING, ERROR, FATAL};
    public Logging loggingType = Logging.CONSOLE;
    public Logfile l;
    public Gui g = null;
    int listenPort = 8081;
    String tempDirectory = "";
    boolean terminate = false;
    ServerSocket socket;
    NetworkProgramming.HexfileScanner scn;
    byte hexFile[];
    
    public NetworkProgramming(int port, String tempDirectory) throws IOException {
        listenPort = port;        
        socket = new ServerSocket(listenPort);
        scn = this.new HexfileScanner(tempDirectory, this);
    } 
    public NetworkProgramming() throws IOException {
        socket = new ServerSocket(listenPort);
        scn = this.new HexfileScanner(tempDirectory, this);
    }     
    public void run() {
        while(!terminate) {
            try {
                log("Waiting on connection...", LoggingSeverity.INFO);
                Socket s = socket.accept();
                log("Connection established.", LoggingSeverity.INFO);
                new ProgramViaNetwork(s, hexFile, this);
            } catch (Exception e) {
                return;
            }
        }
    }
    public void closeSocket() {
        if(!socket.isClosed()) {
           try { 
               socket.close();
           } catch (Exception e) {}           
        }
    }
    public void log(String message, LoggingSeverity severity) {
        if (loggingType == Logging.CONSOLE) {
            System.out.println(new Date().toString()+" "+severity+" "+message);
        } else if (loggingType == Logging.Logfile) {
            if (severity == LoggingSeverity.DEBUG) l.debug(message);
            else if (severity == LoggingSeverity.INFO) l.info(message);
            else if (severity == LoggingSeverity.WARNING) l.warning(message);
            else if (severity == LoggingSeverity.ERROR) l.error(7896,message);
            else if (severity == LoggingSeverity.FATAL) l.fatal(7897,message);
        } else if (loggingType == Logging.GUI) {
            if (g!=null) {
                if (!message.endsWith("\n")) message += "\n";
                if (message.indexOf("%") > 0) g.programmingProgress.setText(message);
                if ((severity == LoggingSeverity.INFO) || (severity == LoggingSeverity.WARNING) || (severity == LoggingSeverity.ERROR) || (severity == LoggingSeverity.FATAL)) {
                    g.statusWindow.append(new Date().toString()+" "+severity+" "+message);
                }
            }
        }
    }
    class ProgramViaNetwork extends Thread {
        
        Socket clientSocket;
        byte[] sketchHexData;
        NetworkProgramming n;
        
        public ProgramViaNetwork(Socket clientSocket, byte[] sketchHexData, NetworkProgramming n) {
            this.n = n;
            this.clientSocket = clientSocket;
            this.sketchHexData = sketchHexData;
            this.start();
        }        
        public void run() {
            OutputStream out = null;
            InputStream in = null;
            try {
                out = clientSocket.getOutputStream();
                in = clientSocket.getInputStream();
                try { Thread.sleep(500); } catch (InterruptedException e) {}
                STK500v1 stk = new STK500v1(out, in, new StkLoggerImpl(n), sketchHexData);
                if (stk.programUsingOptiboot(false, 128)) {
                    try { Thread.sleep(1000); } catch (InterruptedException e) {}
                    log("Programming successfull.", LoggingSeverity.INFO);
                } else {
                    try { Thread.sleep(1000); } catch (InterruptedException e) {}
                    log("Programming failed.", LoggingSeverity.ERROR);
                    throw new Exception("Programming failed.");
                }
            } catch (Exception e) {
                String trace = "";
                for (StackTraceElement ste : e.getStackTrace()) trace += ste + "\n";
                log(trace, LoggingSeverity.ERROR);
            } finally {
                try { in.close(); } catch (Throwable e) {}
                try { out.close(); } catch (Throwable e) {}
                try { clientSocket.close(); } catch (Throwable e) {}
            }
        }
    }
    class StkLoggerImpl implements Logger {
        NetworkProgramming n;
        
        public StkLoggerImpl(NetworkProgramming n) {
            this.n = n;
        }
        public void makeToast(String msg){
            n.log(msg, LoggingSeverity.INFO);
        }        
        public void printToConsole(String msg) {
            n.log(msg, LoggingSeverity.INFO);
        }
        public void logcat(String msg, String level) {
                    if (level.equals("i")) {
                        n.log(msg, LoggingSeverity.INFO);
                    } else if (level.equals("w")) {
                        n.log(msg, LoggingSeverity.WARNING);
                    } else if (level.equals("e")) {
                        n.log(msg, LoggingSeverity.ERROR);
                    } else {
                        n.log(msg, LoggingSeverity.DEBUG);
                    }
            //if (msg.indexOf("%") > 0) System.out.println(msg);
        }
    }
    class HexfileScanner extends Thread {
        File dir = null;
        NetworkProgramming p = null;
        public HexfileScanner(String dir, NetworkProgramming p) {
            this.dir = new File(dir);
            this.p = p;
            this.start();
        }
        public void setDirectory(String dir) {
            this.dir = new File(dir);
        }
        File getLastModifHexFile(File dir) {
            File findedHexFile = null;
            if (dir == null) return null;
            if (!dir.exists()) return null;
            if (!dir.isDirectory()) {
                if (dir.getName().endsWith(".hex") || dir.getName().endsWith(".HEX")) return dir; else return null;
            }
            for (File f : dir.listFiles()) {
                if (f.isFile()) {
                    if (f.getName().endsWith(".hex")) {
                        if (findedHexFile == null) {
                            findedHexFile = f;
                        } else {
                            if (f.lastModified() > findedHexFile.lastModified()) findedHexFile = f;
                        }
                    }
                } else if (f.isDirectory()) {
                    File ff = getLastModifHexFile(f);
                    if (ff != null) {
                        if (findedHexFile == null) {
                            findedHexFile = ff;
                        } else {
                            if (ff.lastModified() > findedHexFile.lastModified()) findedHexFile = ff;
                        }
                    }
                }
            }
            return findedHexFile;
        }
        private byte[] getByteStreamFromHexStream(byte[] in) {
            String[] input = new String(in).split("\n");
            ByteArrayOutputStream out = new ByteArrayOutputStream();        
            for (String line : input) {
                line = line.trim();
                if (line.startsWith(":")) line = line.substring(1);
                try {
                    out.write(":".getBytes());
                    out.write(Hex.fromString(line));
                } catch (IOException e) {
                    break;
                }
            }
            return out.toByteArray();
        }
        public void run() {
            File currentFile = null;
            boolean noFileSelectedReported = false;
            while (true) {                
                    try {
                        Thread.sleep(1000);
                        if (dir != null) {
                            File f = getLastModifHexFile(dir);
                            noFileSelectedReported = false;
                            if ((f != null) && ((currentFile == null) || f.lastModified() > currentFile.lastModified() || (dir.getAbsolutePath().endsWith(".hex") && dir != currentFile))) {
                                byte b[] = new byte[(int) f.length()];
                                DataInputStream dis = new DataInputStream(new FileInputStream(f));
                                dis.readFully(b);
                                dis.close();
                                p.hexFile = getByteStreamFromHexStream(b);
                                currentFile = f;
                                p.log("The new hex file has been read. Bytes: "+p.hexFile.length, LoggingSeverity.INFO);
                            }
                        }
                    } catch (NullPointerException e) {
                            if (!noFileSelectedReported) {
                                p.log("No hex file has been read.Please select correct hexFile/directory.", LoggingSeverity.WARNING);                            
                                noFileSelectedReported = true;
                                p.hexFile = null;
                            }
                    } catch (Exception e) {
                        String trace = e.getClass().getName()+" "+e.getMessage()+":\n";
                        for (StackTraceElement ste : e.getStackTrace()) trace += "     "+ste + "\n";
                        p.log(trace, LoggingSeverity.ERROR);
                    }
            }
        }
    }
    
    class Gui extends JFrame implements ActionListener {
      public JTextField listenPortTextField;
      public JTextField directoryField;
      public JTextField hexField;
      public JTextArea statusWindow;
      public JLabel programmingProgress;
      private NetworkProgramming prg;
      private JButton startbutton;
      private JButton cleanLogButton;      
      public Gui(NetworkProgramming prg) {
        this.prg = prg;
        setTitle("WiFidunio sketch downloader");
        listenPortTextField = new JTextField(5);
        listenPortTextField.setText("8081");
        hexField = new JTextField(20);
        directoryField = new JTextField(20);
        setSize(800, 200);
        setLayout(new BorderLayout());
        setLocationRelativeTo(null);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        JTabbedPane jtab = new JTabbedPane();
        JPanel listenPort = new JPanel();
	listenPort.add(new JLabel("Listen port:"));
	listenPort.add(listenPortTextField);
        jtab.addTab("Listen port configuration",null,listenPort);
        JPanel sketchFile = new JPanel();
        sketchFile.add(new JLabel("Directory scanner:"));
        sketchFile.add(directoryField);
        JButton browseDir = new JButton("Browse");
	browseDir.addActionListener(this);
	browseDir.setActionCommand("browseDir");
        sketchFile.add(browseDir);
        sketchFile.add(new JLabel("Hex file:"));        
        sketchFile.add(hexField);
        JButton browseHex = new JButton("Browse");
	browseHex.addActionListener(this);
	browseHex.setActionCommand("findHex"); 
        sketchFile.add(browseHex);
        jtab.addTab("Sketch file configuration",null,sketchFile);
        JPanel actionPanel = new JPanel();
        startbutton = new JButton("Start processing");        
	startbutton.addActionListener(this);
	startbutton.setActionCommand("start");
        actionPanel.add(startbutton);
        cleanLogButton = new JButton("Clean log area");
	cleanLogButton.addActionListener(this);
	cleanLogButton.setActionCommand("cleanLog");
        actionPanel.add(cleanLogButton);
        programmingProgress = new JLabel();
        actionPanel.add(programmingProgress);
        jtab.addTab("Actions",null,actionPanel);
        this.add(jtab, BorderLayout.NORTH);
        this.setResizable(false);
        JPanel statusPanel = new JPanel();
        statusPanel.setBorder(new BevelBorder(BevelBorder.LOWERED));
        this.add(statusPanel, BorderLayout.SOUTH);
        statusPanel.setPreferredSize(new Dimension(this.getWidth(), 128));
        statusPanel.setLayout(new BoxLayout(statusPanel, BoxLayout.X_AXIS));
        statusWindow = new JTextArea();
        statusWindow.setLineWrap(true);
        DefaultCaret caret = (DefaultCaret)statusWindow.getCaret();
        caret.setUpdatePolicy(DefaultCaret.ALWAYS_UPDATE);
        JScrollPane jScrollPane=new JScrollPane();
        jScrollPane.add(statusWindow);
        jScrollPane.setViewportView(statusWindow); 
        statusPanel.add(jScrollPane);
        pack();
      }
      public void actionPerformed(ActionEvent e) {
          if (e.getActionCommand().equals("start")) {
              prg.start();
              startbutton.setEnabled(false);
          } else if (e.getActionCommand().equals("browseDir")) {
                JFileChooser chooser = new JFileChooser();
                chooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
                int returnVal = chooser.showOpenDialog(this);
                if(returnVal == JFileChooser.APPROVE_OPTION) {                
                    directoryField.setText(chooser.getSelectedFile().getAbsolutePath());
                    hexField.setText("");
                    prg.scn.dir = new File(chooser.getSelectedFile().getAbsolutePath());
                }
          } else if (e.getActionCommand().equals("findHex")) {
                JFileChooser chooser = new JFileChooser();
                chooser.setFileSelectionMode(JFileChooser.FILES_ONLY);
                FileNameExtensionFilter filter = new FileNameExtensionFilter("HEX files", "hex");
                chooser.setFileFilter(filter);
                int returnVal = chooser.showOpenDialog(this);
                if(returnVal == JFileChooser.APPROVE_OPTION) {                
                    hexField.setText(chooser.getSelectedFile().getAbsolutePath());
                    directoryField.setText("");
                    prg.scn.dir = new File(chooser.getSelectedFile().getAbsolutePath());
                }              
          } else if (e.getActionCommand().equals("cleanLog")) {
              statusWindow.setText("");
          }
      }
    }
    
    public static void main(String[] args) throws IOException {
        if (args.length != 2) {
            try {
                NetworkProgramming prog = new NetworkProgramming(8081, "");
                NetworkProgramming.Gui g = prog.new Gui(prog);
                prog.g = g;
                prog.loggingType = Logging.GUI;
                g.setVisible(true);
                prog.log("No command line arguments, gui is ready with default values.", LoggingSeverity.INFO);
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println();
                //OK, gui cannot be initialized and wrong arguments, exit
                System.out.println("Wrong arguments and GUI cannot be initialized. Usage: java -jar WifiDunio.jar 8081 /temp");
                System.out.println("  Param 1: Programming listen port. The same value should be configured at WifiDunio.");
                System.out.println("  Param 2: Either the temp directory, where the Arduino GUI saving the hex files. In that case");
                System.out.println("           the last generated hex file is used. In windows, this temp dir is usually in");
                System.out.println("           C:\\Users\\<USERNAME>\\AppData\\Local\\Temp, on linux it is in /temp");
                System.out.println("           or path to the hex file to load to the WifiDunio, i.e. C:\\Users\\Work\\abcdefgh.hex");
                System.exit(1);
            }
        } else {
            //OK, try to open the GUI and initialize parameters
            try {
                NetworkProgramming prog = new NetworkProgramming(Integer.parseInt(args[0]), args[1]);
                NetworkProgramming.Gui g = prog.new Gui(prog);
                prog.g = g;
                prog.loggingType = Logging.GUI;
                g.listenPortTextField.setText(args[0]);
                g.listenPortTextField.enableInputMethods(false);
                if (args[1].endsWith(".hex") || args[1].endsWith(".HEX")) {
                    g.hexField.setText(args[1]);
                    g.directoryField.enableInputMethods(false);
                } else {
                    g.directoryField.setText(args[1]);
                    g.hexField.enableInputMethods(false);
                }
                g.setVisible(true);
                prog.log("Gui is ready with with command line values: "+args[0]+" "+args[1], LoggingSeverity.INFO);
            } catch (Exception e) {
                //OK, gui cannot be initialized, run in the console mode
                //NetworkProgramming prog = new NetworkProgramming(8081, "C:\\Users\\gregorro\\AppData\\Local\\Temp");
                NetworkProgramming prog = new NetworkProgramming(Integer.parseInt(args[0]), args[1]);
                prog.start();
            }
        }
    }
}
