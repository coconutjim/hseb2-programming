import javax.swing.*;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * Created by Lev on 18.03.14.
 */
public class Osipov_Frame extends JFrame {

    private boolean paint;

    final private Osipov_Panel panelMirror = new Osipov_Panel(true, null);

    final private Osipov_Panel panelDraw = new Osipov_Panel(false, panelMirror);


    public Osipov_Frame() {

        Toolkit tk = Toolkit.getDefaultToolkit();
        Dimension d = tk.getScreenSize();
        int w = d.width;
        int h = d.height;
        setSize(3 * w / 4, 3 * h / 4);
        setLocation(w / 8, h / 8);
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        setTitle("Зеркальная панель. Осипов Лев 271ПИ");
        createGUI();


    }

    private void createGUI() {


        setLayout(new BorderLayout());

        ButtonGroup buttonGroup = new ButtonGroup();
        Box buttons = Box.createHorizontalBox();

        final JRadioButton painting = new JRadioButton("Перо");
        painting.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                setPaint(painting.isSelected());
            }
        });
        buttonGroup.add(painting);
        buttons.add(painting);
        painting.setSelected(true);

        final JRadioButton erasing = new JRadioButton("Ластик");
        erasing.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                setPaint(painting.isSelected());
            }
        });
        buttonGroup.add(erasing);
        buttons.add(erasing);

        JButton clear = new JButton("Очистить");
        clear.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                panelDraw.repaint();
                panelMirror.repaint();
            }
        });
        buttonGroup.add(clear);
        buttons.add(clear);

        final JSlider slider = new JSlider(1, 10);
        slider.setToolTipText("Толщина линий");
        slider.addChangeListener(new ChangeListener() {
            @Override
            public void stateChanged(ChangeEvent e) {
                panelDraw.setThickness(slider.getValue());
                panelMirror.setThickness(slider.getValue());
            }
        });
        slider.setValue(5);
        buttons.add(slider);

        final JCheckBox checkBox = new JCheckBox("Рисовать многоугольник");
        checkBox.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                panelDraw.setDrawPolygon(checkBox.isSelected());
                panelMirror.setDrawPolygon(checkBox.isSelected());
                panelDraw.setPoints(null);
                panelMirror.setPoints(null);
            }
        });

        add(buttons, BorderLayout.NORTH);


        final JPanel panels = new JPanel();
        panels.setLayout(new GridLayout(0, 2));


        panelDraw.setCanPaint(true);
        panelMirror.setCanPaint(false);

        panels.add(panelDraw);
        panels.add(panelMirror);

        add(panels);








    }

    private void setPaint(boolean paint) {
        this.paint = paint;
        panelDraw.setPaint(paint);
        panelMirror.setPaint(paint);
    }

    public static void main(String[] args) {
        Osipov_Frame frame = new Osipov_Frame();
        frame.setVisible(true);
    }
}
