package seminar21.lecture_samples.io;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Scanner;

public class InputInterruptTest extends JFrame {

    public static void main(String[] args){
        JFrame f = new InputInterruptTest();
        f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }

    public InputInterruptTest(){
        add(new MyPanel());
        pack();
        setVisible(true);
    }
}

class MyPanel extends JPanel {

    private Thread thread;

    MyPanel(){

        JButton startReadButton = new JButton("Read...");
        startReadButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
            System.out.println("event: " + e);
                thread = new Thread(){
                    public void run(){
                        try{
                            System.out.println("thread: " + thread + " -> start reading...");
                            Scanner scanner = new Scanner(System.in);
                            String inputString = scanner.nextLine();
                            System.out.println("inputString = " + inputString);
                            System.out.println("isInterrupted = " + thread.isInterrupted());
                        }catch (Exception e){
                            System.out.println("Exception: " + e);
                        }
                    }
                };
                thread.setName("ReadingThread");
                thread.start();
            }
        });
        add(startReadButton);

        JButton interruptButton = new JButton("Interrupt");
        interruptButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                thread.interrupt();
            }
        });
        add(interruptButton);
    }
}