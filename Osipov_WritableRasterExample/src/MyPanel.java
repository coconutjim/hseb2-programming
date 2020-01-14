import javax.swing.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.image.WritableRaster;

/**
 * Osipov Lev. WritableRaster example.
 * class MyPanel
 * Simulates the panel
 */
public class MyPanel extends JPanel{

    private WritableRaster writableRaster;

    private BufferedImage bufferedImage;

    private int imageWidth;

    private int imageHeight;

    /** Current color */
    private boolean flag;

    /** White */
    private int[] color2 = {255, 255, 255};

    /** Blue */
    private int[] color1 = {0, 0, 255};

    /** If is painted */
    private volatile boolean painted;

    public boolean isPainted() {
        return painted;
    }

    public void setPainted(boolean painted) {
        this.painted = painted;
    }

    /** Creates proper image and raster */
    public void setImageSize(int imageWidth, int imageHeight) {
        this.imageWidth = imageWidth;
        this.imageHeight = imageHeight;
        bufferedImage = new BufferedImage(imageWidth, imageHeight, BufferedImage.TYPE_INT_RGB);
        writableRaster = bufferedImage.getRaster();
    }

    /** Drawing */
    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);

        /** Choosing the color */
        int[] color = flag? color1 : color2;

        /** Pixels */
        for (int i = 0; i < imageWidth; ++ i) {
            for (int j = 0; j < imageHeight; ++ j) {
                writableRaster.setPixel(i, j, color);
            }
        }

        g.drawImage(bufferedImage, 0, 0, null);

        /** Changing the color */
        flag = ! flag;


        painted = true;
    }
}
