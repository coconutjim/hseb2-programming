import javax.swing.*;
import java.awt.*;

/**
 * Panel for displaying stopwatch
 */
public class StopWatchPanel extends JPanel {

    private int minutes;
    private int seconds;
    private boolean start;
    private static final Font FONT = new Font("Serif", Font.PLAIN, 128);

    public StopWatchPanel(){
        minutes = 0;
        seconds = 0;
    }

    public void paintComponent(Graphics g){
        super.paintComponent(g);
        Graphics2D g2 = (Graphics2D)g;
        g2.setPaint(Color.GRAY);
        g2.fillRect(0, 0, this.getWidth(), this.getHeight());

        if(start) {
            ++seconds;
            if (seconds == 60) {
                seconds = 0;
                ++minutes;
            }
        }
        g2.setFont(FONT);
        int w = g.getFontMetrics().stringWidth(toString()) / 2;
        int h = g.getFontMetrics().getDescent();
        g2.setPaint(Color.WHITE);
        g2.drawString(toString(), this.getWidth() / 2 - w, this.getHeight() / 2 + h);
    }

    @Override
    public String toString() {
        return minutes % 100 + ":" + seconds % 100; // % 100 for format MM:SS
    }

    public void start() {
        this.start = true;
    }

    public void pause() {
        this.start = false;
    }

    public void reset() {
        start = false;
        minutes = 0;
        seconds = 0;
    }

}
