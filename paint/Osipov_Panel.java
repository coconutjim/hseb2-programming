import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.ArrayList;

/**
 * Created by Lev on 18.03.14.
 */
public class Osipov_Panel extends JPanel {

    private boolean paint;

    private boolean drawPolygon;

    private ArrayList<Point> points;

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
                if (drawPolygon) {
                    return;
                }
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
                if (drawPolygon) {
                    return;
                }
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

            @Override
            public void mouseReleased(MouseEvent e) {
                if (drawPolygon) {
                    if (points == null) {
                        points = new ArrayList<Point>();
                    }
                    int x = isMirror()? getWidth() - e.getX() : e.getX();
                    int y = e.getY();
                    points.add(new Point(x, y));

                    if (points.size() != 0)
                    if (Math.abs(x - points.get(0).getX()) < 5 && Math.abs(x - points.get(0).getX()) < 5) {

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

    public boolean isDrawPolygon() {
        return drawPolygon;
    }

    public void setDrawPolygon(boolean drawPolygon) {
        this.drawPolygon = drawPolygon;
    }

    public ArrayList<Point> getPoints() {
        return points;
    }

    public void setPoints(ArrayList<Point> points) {
        this.points = points;
    }
}
