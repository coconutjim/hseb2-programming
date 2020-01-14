package seminar21.lecture_samples.browser;

import javax.swing.*;

/** A regular JButton created with an ImageIcon and with borders
 *  and content areas turned off.
 *
 *  From <a href="http://courses.coreservlets.com/Course-Materials/">the
 *  coreservlets.com tutorials on servlets, JSP, Struts, JSF, Ajax, GWT, and Java</a>.
 */

public class JIconButton extends JButton {
    public JIconButton(String file) {
        super(new ImageIcon(file));
        setContentAreaFilled(false);
        setBorderPainted(false);
        setFocusPainted(false);
    }
}