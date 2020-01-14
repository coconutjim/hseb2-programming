import System;

public class EAIExample
{
    private var mainThread;

    private function OnBrowserEvent(sender: Object, e: Vrml.EAI.Event.BrowserEventArgs)
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
        }
    }

    private var red = [ 1, 0, 0 ];
    private var green = [ 0, 1, 0 ];
    private var set_diffuseColor;

    private function OnIsOverChanged(sender: Object, e: Vrml.EAI.Event.VrmlEventArgs)
    {
        // Change the color of the sphere to red when the mouse pointer is over the
        // sphere, and back to green when it is not
        var isOver = Vrml.EAI.Field.EventOutSFBool(sender);
        set_diffuseColor.SetValue(isOver.GetValue() == true ? red : green);
    }

    function Main()
    {
        var browser: Vrml.EAI.Browser = null;
        mainThread = System.Threading.Thread.CurrentThread;
        try
        {
            var address = System.Net.Dns.GetHostAddresses("localhost")[0];
            browser = Vrml.EAI.BrowserFactory.GetBrowser(address, 4848);

            // Tell the browser to call our OnBrowserEvent method in case of an event
            browser.add_BrowserEvent(OnBrowserEvent);

            // Get the isOver event out of the TouchSensor node
            var touchSensor = browser.GetNode("touchSensor");
            var isOver = Vrml.EAI.Field.EventOutSFBool(touchSensor.GetEventOut("isOver"));

            // Get the set_diffuseColor event in of the Material node
            var material = browser.GetNode("material");
            set_diffuseColor = Vrml.EAI.Field.EventInSFColor(material.GetEventIn("set_diffuseColor"));

            // Tell the isOver event out to call our OnIsOverChanged method in case of an event
            isOver.add_VrmlEvent(OnIsOverChanged);

            // Wait until InstantPlayer gets closed
            try
            {
                System.Threading.Thread.CurrentThread.Join();
            }
            catch (ex: System.Threading.ThreadInterruptedException)
            { }
        }
        catch (ex)
        {
            print(ex);
        }
        finally
        {
            if (browser != null)
                browser.Dispose();
        }
    }
}

var eaiExample = new EAIExample;
eaiExample.Main();
