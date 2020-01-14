import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

/**
 * Created by Lev on 18.03.14.
 */
public class Osipov_Panel extends JPanel {

    private boolean paint;

    private int thickness = 10;

    final private boolean mirror;

    final private Osipov_Panel panelMirror;

    private boolean canPaint;

    public Osipov_Panel(boolean mirror, Osipov_Panel panelMirror) {

        this.mirror = mirror;

        this.panelMirror = panelMirror;

        setBorder(BorderFactory.createLineBorder(Color.BLUE, 3));

        setBackground(Color.WHITE);

        paint = true;

        MouseAdapter mouseAdapter = new MouseAdapter() {

            private int x;

            private int y;


            @Override
            public void mousePressed(MouseEvent e) {
                super.mousePressed(e);
                if (isCanPaint()) {

                    if (isMirror()) {
                        x = getWidth() - e.getX();
                    }
                    else {
                        x = e.getX();
                    }
                    y = e.getY();
                    if (! isMirror()) {
                        getPanelMirror().setCanPaint(true);
                        getPanelMirror().dispatchEvent(e);
                    }
                    else {
                        setCanPaint(false);
                    }
                }
            }

            @Override
            public void mouseDragged(MouseEvent e) {
                super.mouseDragged(e);
                if (isCanPaint()) {
                    Graphics g = getGraphics();
                    Graphics2D g2 = (Graphics2D)g;

                    if (isPaint()) {
                        g2.setColor(Color.BLACK);
                    }
                    else {
                        g2.setColor(Color.WHITE);
                    }
                    g2.setStroke(new BasicStroke(getThickness()));
                    if (isMirror()) {
                        g2.drawLine(getWidth() - e.getX(), e.getY(), x, y);
                    }
                    else {
                        g2.drawLine(e.getX(), e.getY(), x, y);
                    }
                    if (isMirror()) {
                        x = getWidth() - e.getX();
                    }
                    else {
                        x = e.getX();
                    }
                    y = e.getY();
                    if (! isMirror()) {
                        getPanelMirror().setCanPaint(true);
                        getPanelMirror().dispatchEvent(e);
                    }
                    else {
                        setCanPaint(false);
                    }
                }
            }
        };

        addMouseListener(mouseAdapter);
        addMouseMotionListener(mouseAdapter);

    }

    public boolean isPaint() {
        return paint;
    }

    public void setPaint(boolean paint) {
        this.paint = paint;
    }

    public boolean isMirror() {
        return mirror;
    }

    public Osipov_Panel getPanelMirror() {
        return panelMirror;
    }

    public boolean isCanPaint() {
        return canPaint;
    }

    public void setCanPaint(boolean canPaint) {
        this.canPaint = canPaint;
    }

    public int getThickness() {
        return thickness;
    }

    public void setThickness(int thickness) {
        this.thickness = thickness;
    }
}
