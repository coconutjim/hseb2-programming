package seminar21.lecture_samples.web;

import javax.swing.*;
import java.awt.*;
import java.awt.event.WindowEvent;

public class WebServerSampleStarter extends JFrame {

    static Integer listen_port = null;

    JPanel jPanel1 = new JPanel();
    JScrollPane jScrollPane1 = new JScrollPane();
    JTextArea jTextArea2 = new JTextArea();

    public WebServerSampleStarter(){
        try {
            jbInit();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    private void jbInit() throws Exception {
        //oh the pretty colors
        jTextArea2.setBackground(new Color(16, 12, 66));
        jTextArea2.setForeground(new Color(151, 138, 255));
        jTextArea2.setBorder(BorderFactory.createLoweredBevelBorder());
        jTextArea2.setToolTipText("");
        jTextArea2.setEditable(false);
        jTextArea2.setColumns(30);
        jTextArea2.setRows(15);
        //change this to impress your friends
        this.setTitle("This is a WebServer Sample...");
        //ugly inline listener, it's for handling closing of the window
        this.addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosing(WindowEvent e) {
                this_windowClosed(e);
            }
        });
        //add the various to the proper containers
        jScrollPane1.getViewport().add(jTextArea2);
        jPanel1.add(jScrollPane1);
        this.getContentPane().add(jPanel1, BorderLayout.EAST);

        //tveak the apearance
        this.setVisible(true);
        this.setSize(420, 350);
        this.setResizable(false);
        //make sure it is drawn
        this.validate();
        //create the actual serverstuff,
        //all that is implemented in another class
        new WebServerSample(listen_port.intValue(), this);
    }

    //exit program when "X" is pressed.
    void this_windowClosed(WindowEvent e) {
        System.exit(1);
    }

    //this is a method to get messages from the actual
    //server to the window
    public void send_message_to_window(String s) {
        jTextArea2.append(s);
    }


    public static void main(String[] args) {
        //start server on port x, default 80
        //use argument to main for what port to start on
        try {
            listen_port = new Integer(args[0]);
            //catch parse error
        }
        catch (Exception e) {
            listen_port = new Integer(5000);
        }
        //create an instance of this class
        WebServerSampleStarter webserver = new WebServerSampleStarter();
    }
}
