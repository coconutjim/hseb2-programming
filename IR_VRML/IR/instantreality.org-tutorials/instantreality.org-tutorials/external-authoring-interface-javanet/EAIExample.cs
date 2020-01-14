public class EAIExample
{
    private static System.Threading.Thread mainThread;

    private static void OnBrowserEvent(object sender, Vrml.EAI.Event.BrowserEventArgs e)
    {
        // Exit the program when there is an error or InstantPlayer gets closed
        switch (e.ID)
        {
        case Vrml.EAI.Event.BrowserEventArgs.INITIALIZED:
            break;
        case Vrml.EAI.Event.BrowserEventArgs.SHUTDOWN:
        case Vrml.EAI.Event.BrowserEventArgs.URL_ERROR:
        case Vrml.EAI.Event.BrowserEventArgs.CONNECTION_ERROR:
            mainThread.Interrupt();
            break;
        }
    }

    private static float[] red   = { 1, 0, 0 };
    private static float[] green = { 0, 1, 0 };
    private static Vrml.EAI.Field.EventInSFColor set_diffuseColor;

    private static void OnIsOverChanged(object sender, Vrml.EAI.Event.VrmlEventArgs e)
    {
        // Change the color of the sphere to red when the mouse pointer is over the
        // sphere, and back to green when it is not
        Vrml.EAI.Field.EventOutSFBool isOver = (Vrml.EAI.Field.EventOutSFBool)sender;
        set_diffuseColor.SetValue(isOver.GetValue() == true ? red : green);
    }

    public static void Main(string[] args)
    {
        Vrml.EAI.Browser browser = null;
        mainThread = System.Threading.Thread.CurrentThread;
        try
        {
            // Initialize the connection
            System.Net.IPAddress address = System.Net.Dns.GetHostAddresses("localhost")[0];
            browser = Vrml.EAI.BrowserFactory.GetBrowser(address, 4848);

            // Tell the browser to call our OnBrowserEvent method in case of an event
            browser.BrowserEvent += OnBrowserEvent;

            // Get the isOver event out of the TouchSensor node
            Vrml.EAI.Node touchSensor = browser.GetNode("touchSensor");
            Vrml.EAI.Field.EventOutSFBool isOver = (Vrml.EAI.Field.EventOutSFBool)touchSensor.GetEventOut("isOver");

            // Get the set_diffuseColor event in of the Material node
            Vrml.EAI.Node material = browser.GetNode("material");
            set_diffuseColor = (Vrml.EAI.Field.EventInSFColor)material.GetEventIn("set_diffuseColor");

            // Tell the isOver event out to call our OnIsOverChanged method in case of an event
            isOver.VrmlEvent += OnIsOverChanged;

            // Wait until InstantPlayer gets closed
            try
            {
                System.Threading.Thread.CurrentThread.Join();
            }
            catch (System.Threading.ThreadInterruptedException)
            { }
        }
        catch (System.Exception ex)
        {
            System.Console.WriteLine(ex);
        }
        finally
        {
            // Shutdown
            if (browser != null)
                browser.Dispose();
        }
    }
}
