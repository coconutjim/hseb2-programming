/**
 * Created by Lev on 18.02.14.
 */
        import javax.swing.*;
        import java.awt.*;

public class ClockFrame extends JFrame {

    /**
     * @param args
     */
    public static void main(String[] args) {
// TODO Auto-generated method stub
        ClockFrame frame = new ClockFrame();
        frame.setSize(700, 400);
        frame.setVisible(true);
        ClockPanel panel = new ClockPanel();
//panel.setBackground(Color.CYAN);
//panel.setTime(5, 45);
        int hours = 0;
        int minutes = 0;
        frame.add(panel);
        while(true){
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
// TODO Auto-generated catch block
                e.printStackTrace();
            }
            if(minutes == 59){
                hours++;
                minutes = 0;
            }else{
                minutes++;
            }
            panel.setTime(hours, minutes);
            frame.repaint();

        }

//panel.DrawClock();
//panel.DrawArrows(5, 45);
    }



}

class ClockPanel extends JPanel{
    int hours;
    int minutes;
    public void setTime(int hours, int minutes){
        this.hours = hours;
        this.minutes = minutes;
    }
    public void DrawClock(Graphics g){
//Graphics g = this.getGraphics();
        g.setColor(Color.BLUE);
        g.drawOval(getWidth()/2-150, getHeight()/2-150, 300, 300);
    }

    public void DrawArrows(int hours, int minutes,Graphics g){
//Graphics g = this.getGraphics();
        Point center = new Point(getWidth()/2,getHeight()/2);
        g.setColor(Color.ORANGE);
        g.fillOval(center.x-4, center.y-2, 10, 10);
        double hourX = Math.cos(Math.toRadians(90-360.0*hours/12.0))*50+center.x;
        double hourY = -Math.sin(Math.toRadians(90-360.0*hours/12.0))*50+center.y;
//Point hourEndPoint = new Point((int)hourX,(int)hourY);

        double minuteX = Math.cos(Math.toRadians(90-360.0*minutes/60.0))*150+center.x;
        double minuteY = -Math.sin(Math.toRadians(90-360.0*minutes/60.0))*150+center.y;
//Point minuteEndPoint = new Point((int)minuteX,(int)minuteY);
        g.drawLine(center.x, center.y, (int)hourX, (int)hourY);
        g.setColor(Color.RED);
        g.drawLine(center.x, center.y, (int)minuteX, (int)minuteY);

    }

    @Override
    public void paintComponent(Graphics g){
        DrawClock(g);
        DrawArrows(hours,minutes,g);

    }
}
