/**
 * Created by Lev on 19.02.14.
 */
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.swing.*;
import java.util.ArrayList;
public class FEAR extends JFrame {

    private ArrayList<FearPanel> panel;

    public void repaint() {
        for (FearPanel p : panel) {
            p.repaint();
        }
    }

    public void change() {
        for (int i = 0; i < panel.size(); ++ i) {
            remove(panel.get(i));
        }
        Random gen = new Random();
        panel = new ArrayList<FearPanel>();
        for (int i = 0; i < gen.nextInt(20) + 10; ++ i) {
            FearPanel p = new FearPanel("C:\\Users\\Lev\\Desktop\\я.jpg");
            p.setPreferredSize(new Dimension(gen.nextInt(500), gen.nextInt(500)));
            panel.add(p);
            add(p);
            validate();
        }
        repaint();
    }

    public FEAR() {
        Toolkit tk = Toolkit.getDefaultToolkit();
        Dimension d = tk.getScreenSize();
        int w = d.width;
        int h = d.height;
        setSize(w, h);
        setLocation(0, 0);
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        setLayout(new FlowLayout());
        setVisible(true);
        Random gen = new Random();
        panel = new ArrayList<FearPanel>();
        for (int i = 0; i < gen.nextInt(20) + 10; ++ i) {
            FearPanel p = new FearPanel("C:\\Users\\Lev\\Desktop\\я.jpg");
            p.setPreferredSize(new Dimension(gen.nextInt(500), gen.nextInt(500)));
            panel.add(p);
            add(p);
            validate();
        }
        repaint();
    }

    public static void main(String[] args) {
        FEAR fear = new FEAR();
        Random gen = new Random();
        for (int i = 0, k = 0; i < 100000; ++ i, ++ k) {
            fear.repaint();
            fear.getContentPane().setBackground(new Color(gen.nextInt(255), gen.nextInt(255), gen.nextInt(255)));
            try {
            Thread.sleep(10);
            }
            catch(InterruptedException e) {
                e.printStackTrace();
            }
            if (k == 10) {
                //System.out.print(1);
                fear.change();
                k = 0;
            }

        }
    }
}

class FearPanel extends JPanel {
    BufferedImage image;
    public FearPanel(String string) {
        try {
        this.image = ImageIO.read(new File(string));
        }
        catch (IOException e) {
            e.printStackTrace();
        }
    }


    @Override
    public void paintComponent(Graphics g) {
        super.paintComponent(g);
        Random gen = new Random();
        g.drawLine(gen.nextInt(100), gen.nextInt(100), gen.nextInt(1000), gen.nextInt(1000));
        g.drawImage(image, gen.nextInt(300), gen.nextInt(300), null);
        setBackground(new Color(gen.nextInt(255), gen.nextInt(255), gen.nextInt(255)));
    }
}
