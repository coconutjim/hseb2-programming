
 import javax.swing.*;
import java.awt.*;

/**
 * Created with IntelliJ IDEA.
 * User: student
 * Date: 28.01.14
 * Time: 15:47
 * To change this template use File | Settings | File Templates.
 */
public class LayoutsFrame extends JFrame {
    public static void main(String[] args) {
        LayoutsFrame frame = new LayoutsFrame();
        DistributePanel panel = new DistributePanel();
        frame.add(panel);
        frame.setVisible(true);
        frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
    }
}

class DistributePanel extends JPanel{
    DistributePanel(){
        this.setLayout(new GridLayout(4,3));
        for(int i = 0; i< 9 ; i++){
            JButton button = new JButton("Button "+i);
            this.add(button);
        }

        JPanel leftPanel = new JPanel(new FlowLayout());

    }
}
