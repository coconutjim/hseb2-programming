/**
 * Created with IntelliJ IDEA.
 * User: Lev
 * Date: 21.01.14
 * Time: 15:17
 * To change this template use File | Settings | File Templates.
 */
import java.awt.*;
import java.io.File;
import javax.imageio.ImageIO;
import javax.swing.*;
public class sem1 {
    public static void main(String[] args) {
        CFrame f = new CFrame();
        f.setVisible(true);
        JPanel p = new DrawPanel();
        f.add(p);
    }
}
class CFrame extends JFrame {
    public CFrame() {
        Toolkit tk = Toolkit.getDefaultToolkit();
        Dimension d = tk.getScreenSize();
        int w = d.width;
        int h = d.height;
        setSize(w / 2, h / 2);
        setLocation(w / 4, h / 4);
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
    }
}

class DrawPanel extends JPanel {
    DrawPanel() {
        setBackground(Color.orange);
    }
    @Override
    public void paintComponent(Graphics g) {
        super.paintComponent(g);
        g.setFont(new Font("Consolas",Font.ITALIC, 100));
        g.drawString("Лучше масленок в руке, чем бомж в небе", 10, 100);
        g.drawString("чем бомж в небе", 10, 300);
        g.drawLine(100,120,234,2440);
        try {
            for (int i = 0; i < 1200; i += 300) {
                g.drawImage(ImageIO.read(new File("C:\\Users\\Lev\\Desktop\\Безымянный.png")), i, 50, null);
            }
            //`     throw new Exception();
        }
        catch(Exception e) {print(g);}
        g.setColor(Color.CYAN);
        g.fillRect(300, 300, 300, 300);
    }
}



