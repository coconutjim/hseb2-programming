import vrml.*;
import vrml.field.*;
import vrml.node.*;
import vrml.Event;

public class InstantJava extends Script
{
	// define an eventOut for settig the new color
	public SFColor get_newcolor;
	
	public void initialize()
	{
		System.out.println("click the cube to switch its color!");
		
		// get the eventOut from the scene
		get_newcolor = (SFColor)getEventOut("get_newcolor");
	}
	
	public void processEvent( Event e )
	{	
		// this function is called when an event is sent from the scene to the script
		
		// get the event's name
		if (e.getName().equals("set_touchtime"))
		{
			// get the value of touchtime and print it
			ConstSFTime time = (ConstSFTime)e.getValue();
			System.out.println( "touched at " + time.getValue());
			
			// set a new random color
			get_newcolor.setValue((float)Math.random(), (float)Math.random(), (float)Math.random());
		}
    }
	
	public void shutdown()
	{
		System.out.println("bye!");
    }
}
