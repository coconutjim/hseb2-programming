import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

/**
 * Main frame
 */
public class StopWatch extends JFrame {

    private static final int DEFAULT_WIDTH = 900;
    private static final int DEFAULT_HEIGHT = 300;
    // columns names
    private final String[] columnNames = {
            "Number",
            "Last Lap",
            "Total time",
    };
    // for table working
    private final DefaultTableModel tablemodel = new DefaultTableModel(null, columnNames);
    private static StopWatchPanel stopWatchPanel;
    // laps numbers
    private int lapNumber;


    public static void main(String[] args){
        final JFrame f = new StopWatch();
        f.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        f.setVisible(true);

        new Timer(1000, new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                stopWatchPanel.repaint();
                ((StopWatch)f).updateColumn();
            }
        }).start();
    }

    public StopWatch(){
        setTitle("StopWatch");
        setSize(DEFAULT_WIDTH, DEFAULT_HEIGHT);
        lapNumber = 1;

        stopWatchPanel = new StopWatchPanel();
        add(stopWatchPanel, BorderLayout.CENTER);

        JTable table = new JTable(tablemodel);
        final JScrollPane scrollPane = new JScrollPane(table);

        // Buttons listeners
        JPanel buttonPanel = new JPanel();
        ButtonGroup group = new ButtonGroup();

        // start button
        JButton startButton = new JButton("Start");
        buttonPanel.add(startButton);
        group.add(startButton);
        startButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                stopWatchPanel.start();
            }
        });

        // pause button
        JButton pauseButton = new JButton("Pause");
        buttonPanel.add(pauseButton);
        group.add(pauseButton);
        pauseButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                stopWatchPanel.pause();
            }
        });

        // reset button
        JButton resetButton = new JButton("Reset");
        buttonPanel.add(resetButton);
        group.add(resetButton);
        resetButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                stopWatchPanel.reset();
                stopWatchPanel.repaint();
                lapNumber = 1;
                tablemodel.setRowCount(0);
            }
        });

        // New lap button
        JButton lapButton = new JButton("Lap");
        buttonPanel.add(lapButton);
        group.add(lapButton);
        lapButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                tablemodel.addRow(new String[]{Integer.toString(lapNumber++), stopWatchPanel.toString(), stopWatchPanel.toString()});
            }
        });

        // Output button
        JButton outputButton = new JButton("Output");
        buttonPanel.add(outputButton);
        group.add(outputButton);
        outputButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                PrintWriter writer = null;
                try {
                    writer = new PrintWriter("results.csv", "UTF-8");
                    for (int i = 0; i < tablemodel.getRowCount(); ++i) {
                        for (int j = 0; j < tablemodel.getColumnCount(); ++j) {
                            writer.print(tablemodel.getValueAt(i,j) + "\t");
                        }
                        JOptionPane.showMessageDialog(null, "Записано!");
                        writer.println();
                    }
                    writer.close();
                } catch (FileNotFoundException e1) {
                    e1.printStackTrace();
                } catch (UnsupportedEncodingException e1) {
                    e1.printStackTrace();
                }

            }
        });

        add(buttonPanel, BorderLayout.NORTH);
        add(scrollPane, BorderLayout.EAST);
        setResizable(false);
    }


    /**
     * Update columns with new value of total time
     */
    public void updateColumn() {
        int n = tablemodel.getColumnCount();
        for (int i = 0; i < tablemodel.getRowCount(); i++) {
            tablemodel.setValueAt(stopWatchPanel.toString(), i, n - 1);
        }
    }

}

