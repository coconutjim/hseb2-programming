/**
 * Created by Lev on 11.02.14.
 */
import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Random;

public class Paint extends JFrame {

    int x, y;
    JPanel p;
    BufferedImage f;

    public Paint() {
        Toolkit tk = Toolkit.getDefaultToolkit();
        Dimension d = tk.getScreenSize();
        int w = d.width;
        int h = d.height;
        setSize(w, h);
        setLocation(0, 0);
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        setTitle("Paint");
        try {
        f = ImageIO.read(new File("C:\\Users\\Lev\\Desktop\\я.jpg"));
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        p = createPaintPanel();
        add(p);

    }

    public void setRandomColor() {
        Random gen = new Random();
        p.setBackground(new Color(gen.nextInt(255), gen.nextInt(255), gen.nextInt(255)));
    }

    public void setImage() {
        Graphics g = p.getGraphics();
        Random gen = new Random();
        g.drawImage(f, gen.nextInt(100), gen.nextInt(1000), null);

    }

    JPanel createPaintPanel() {
        final JPanel panel = new JPanel();
        panel.addMouseMotionListener(new MouseMotionListener() {
            @Override
            public void mouseDragged(MouseEvent e) {
                Graphics g = panel.getGraphics();
                g.drawLine(e.getX(), e.getY(), x, y);
                x = e.getX();
                y = e.getY();
            }

            @Override
            public void mouseMoved(MouseEvent e) {

            }
        });
        panel.addMouseListener(new MouseListener() {
            @Override
            public void mouseClicked(MouseEvent e) {

            }

            @Override
            public void mousePressed(MouseEvent e) {
                x = e.getX();
                y = e.getY();
            }

            @Override
            public void mouseReleased(MouseEvent e) {

            }

            @Override
            public void mouseEntered(MouseEvent e) {

            }

            @Override
            public void mouseExited(MouseEvent e) {

            }
        });
        return panel;
    }
    public static void main(String[] args) {
        final Paint obj = new Paint();
        obj.setVisible(true);
        while (true) {

            new Thread() {
            @Override
            public void run() {
                obj.setRandomColor();
                obj.setImage();
                try {
                Thread.sleep(0);
                }
                catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            }.start();
        }
    }
}




