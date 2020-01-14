import vrml.*;
import vrml.Browser;
import vrml.field.*;
import vrml.node.*;
import vrml.Event;
import java.util.*;
import java.lang.String;

public class InstantJNI extends Script
{
	public SFColor color_changed;
	
	native String Init(String sourceString);
	native int Function1(int param);
	native float Function2(float param);
	native float Function3(float[] params);
	native float[] Function4(float params[]);
	native String Function5();
	native float[] SwitchColor();
	
	static
	{
		System.loadLibrary("MyDLL");
	}
	
	public void initialize()
	{	
		color_changed = (SFColor)getEventOut("color_changed");
		
		String param = "My String";
		System.out.println("Return value Init: "+Init(param)+"\n");
		
		int param1 = 128;
		System.out.println("Return value Function1: "+Function1(param1)+"\n");
		
		float param2 = 3.28f;
		System.out.println("Return value Function2: "+Function2(param2)+"\n");
		
		float[] params = {1.23f, 2.48f, 2.67f};
		System.out.println("Return value Function3: "+Function3(params)+"\n");
		
		float[] res = Function4(params);
		System.out.println("Return value Function4: "+res[0]+", "+res[1]+", "+res[2]+"\n");
		
		System.out.println("Return value Function5: "+Function5()+"\n");
	}
	
	public void shutdown()
	{
		
    }
	
	public void processEvent( Event e )
	{	
		if (e.getName().equals("set_colorChange"))
		{
			ConstSFBool active = (ConstSFBool)e.getValue();
			if (active.getValue())
			{
				float[] res = SwitchColor();
				System.out.println("SwitchColor: "+res[0]+", "+res[1]+", "+res[2]+"\n");
				color_changed.setValue(res);
			}
		}
    }
}