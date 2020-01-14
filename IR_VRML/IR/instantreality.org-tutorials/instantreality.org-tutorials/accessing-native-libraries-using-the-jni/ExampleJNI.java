import vrml.*;
import vrml.field.*;
import vrml.node.*;
import vrml.Event;
import java.lang.String;

public class ExampleJNI extends vrml.node.Script
{
	private vrml.field.SFColor color_changed;
	
    native int function1(int arg);
    native String function2(String sourceString);
    native float[] switchColor();
    
    static
    {
        System.loadLibrary("MyDLL");
    }

    public void initialize()
    {
    	//get out slot
    	color_changed = (vrml.field.SFColor)getEventOut("color_changed");
    	
    	//do some stuff
        int myInt = 128;
        System.out.println("Return value function1: "+function1(myInt)+"\n");
        
        String myString = "My String";
        System.out.println("Return value function2: "+function2(myString)+"\n");
    }
    public void processEvent(vrml.Event e)
    {
        if (e.getName().equals("change_color"))
        {
        	vrml.field.ConstSFBool active = (vrml.field.ConstSFBool)e.getValue();
            if (active.getValue())
            {
            	float[] col = switchColor();
                System.out.println("SwitchColor: "+col[0]+", "+col[1]+", "+col[2]+"\n");
                color_changed.setValue(col);
            }
        }
    }
    public void shutdown()
	{	
    }
}