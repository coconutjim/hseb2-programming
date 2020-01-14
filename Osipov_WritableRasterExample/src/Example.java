import javax.swing.*;
import java.awt.*;
import java.awt.event.ComponentEvent;
import java.awt.event.ComponentListener;

/**
 * Osipov Lev. WritableRaster example.
 * class Example
 * Simulates main frame
 */
public class Example extends JFrame {

    /** Draw Panel */
    final private MyPanel myPanel = new MyPanel();

    public Example() {
        Toolkit tk = Toolkit.getDefaultToolkit();
        Dimension d = tk.getScreenSize();
        int w = d.width;
        int h = d.height;
        setSize(w / 2, h / 2);
        setLocation(w / 4, h / 4);
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        setTitle("Осипов Лев 271ПИ. Пример WritableRaster");
        setVisible(true);
        createGUI();
    }

    private void createGUI() {

        /** Draw panel*/
        myPanel.setLayout(new FlowLayout());
        myPanel.setSize(new Dimension(getWidth(), getHeight()));
        add(myPanel);
        myPanel.setImageSize(getWidth(), getHeight());

        /** Handling resizing */
        myPanel.addComponentListener(new ComponentListener() {
            @Override
            public void componentResized(ComponentEvent e) {
                myPanel.setImageSize(getWidth(), getHeight());
            }

            @Override
            public void componentMoved(ComponentEvent e) {

            }

            @Override
            public void componentShown(ComponentEvent e) {

            }

            @Override
            public void componentHidden(ComponentEvent e) {

            }
        });

    }


    /** Blinking */
    public void go() {

        int count = 0;
        long time = System.nanoTime();

        while (true) {

            myPanel.setPainted(false);
            myPanel.repaint();

            /** Waiting for repaint */
            while (! myPanel.isPainted()) { }

            ++ count;

            /** Checking count and output it */
            if (System.nanoTime() - time > 1000000000) {
                setTitle("Осипов Лев 271ПИ. Пример WritableRaster - " + Integer.toString(count - 1) + " fps");
                count = 0;
                time = System.nanoTime();
            }

        }
    }


    public static void main(String[] args) {
        Example example = new Example();

        example.go();
    }

}
