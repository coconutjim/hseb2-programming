import org.instantreality.x3d.sai.script.SFBool;
import vrml.Event;
import vrml.field.ConstSFBool;
import vrml.field.ConstSFVec2f;
import vrml.node.Script;

/**
 * Created by Lev on 19.03.14.
 */
public class MyClass extends  Script{

    private SFBool flag;

    public void initialize() {
        flag = (SFBool)getField("flag");
    }

    public void processEvent(Event event) {

        if (event.getName().equals("isActive"))

        ConstSFBool isActive = (ConstSFBool)event.getValue();
        ConstSFVec2f coordinates = (ConstSFVec2f)event.getValue();
    }
}
