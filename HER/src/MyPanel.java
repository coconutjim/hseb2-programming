import javax.swing.*;
import java.awt.*;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;

/**
 * Created by Lev on 18.03.14.
 */
public class MyPanel extends JPanel{

    int x = 10;

    int x1 = 100;
            int y2 =100;

    MyPanel() {
        addKeyListener(new KeyAdapter() {
            @Override
            public void keyReleased(KeyEvent e) {
                super.keyReleased(e);
                if (e.getKeyCode() == KeyEvent.VK_UP) {
                    x1+=10;
                    y2+=10;
                }
            }
        });
    }

    public void paintComponent(Graphics g){
        super.paintComponent(g);
        Graphics2D g2 = (Graphics2D)g;
        g2.fillOval(++ x, 10, 8, 8);
        g2.drawRect(x1, y2, 50, 50);

    }
}
