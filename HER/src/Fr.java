import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;

/**
 * Created by Lev on 18.03.14.
 */
public class Fr extends JFrame {

    final MyPanel panel = new MyPanel();

    Fr() {
        Toolkit tk = Toolkit.getDefaultToolkit();
        Dimension d = tk.getScreenSize();
        int w = d.width;
        int h = d.height;
        setSize(3 * w / 4, 3 * h / 4);
        setLocation(w / 8, h / 8);
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        setTitle("Ерунда какая-то");
        setResizable(false);
        add(panel);


        addKeyListener(new KeyAdapter() {
            @Override
            public void keyPressed(KeyEvent e) {
                super.keyPressed(e);
                if (e.getKeyCode() == KeyEvent.VK_UP) {
                    panel.y2-=10;
                }
                if (e.getKeyCode() == KeyEvent.VK_LEFT) {
                    panel.x1-=10;
                }
                if (e.getKeyCode() == KeyEvent.VK_RIGHT) {
                    panel.x1+=10;
                }
                if (e.getKeyCode() == KeyEvent.VK_DOWN) {
                    panel.y2+=10;
                }
            }
        });



    }

    public static void main(String[] args) {
        final Fr fr = new Fr();
        fr.setVisible(true);

        final Timer f = new Timer(3, new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                fr.panel.repaint();
                if (fr.panel.x > fr.getWidth()) {
                    JOptionPane.showMessageDialog(null, "huy");
                }
            }
        });
        f.start();
    }
}
