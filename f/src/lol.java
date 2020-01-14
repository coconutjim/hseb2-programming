/**
 * Created by Lev on 19.02.14.
 */
import javax.swing.*;
import java.awt.*;
import java.util.Random;
import javax.swing.*;
public class lol extends JFrame {
    public static void main(String[] args) {
        lol l = new lol();
        Toolkit tk = Toolkit.getDefaultToolkit();
        Dimension d = tk.getScreenSize();
        int w = d.width;
        int h = d.height;
        l.setSize(w / 2, h / 2);
        l.setLocation(w / 4, h / 4);
        l.setVisible(true);
        l.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        while (true) {
            java.util.Random gen = new Random();
            l.getContentPane().setBackground(new Color(gen.nextInt(255), gen.nextInt(255), gen.nextInt(255)));
            try {
                Thread.sleep(0);
            }
            catch(InterruptedException e) {}
            }
        }
    }
