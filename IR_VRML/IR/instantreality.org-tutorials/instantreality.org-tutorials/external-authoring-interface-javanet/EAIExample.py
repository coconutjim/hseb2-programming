import System
import clr
clr.AddReference("InstantReality.NET")
import Vrml

def OnBrowserEvent(sender, e):
    # Exit the program when there is an error or InstantPlayer gets closed
    if e.ID == Vrml.EAI.Event.BrowserEventArgs.INITIALIZED:
        pass
    elif e.ID == Vrml.EAI.Event.BrowserEventArgs.SHUTDOWN:
        mainThread.Interrupt()
    elif e.ID == Vrml.EAI.Event.BrowserEventArgs.URL_ERROR:
        mainThread.Interrupt()
    elif e.ID == Vrml.EAI.Event.BrowserEventArgs.CONNECTION_ERROR:
        mainThread.Interrupt()
    else:
        mainThread.Interrupt()

red = System.Array[System.Single]([1, 0, 0])
green = System.Array[System.Single]([0, 1, 0])

def OnIsOverChanged(sender, e):
    # Change the color of the sphere to red when the mouse pointer is over the
    # sphere, and back to green when it is not
    if isOver.GetValue() == True:
        set_diffuseColor.SetValue(red)
    else:
        set_diffuseColor.SetValue(green)

browser = None
mainThread = System.Threading.Thread.CurrentThread
try:
    # Initialize the connection
    address = System.Net.Dns.GetHostAddresses("localhost")[0]
    browser = Vrml.EAI.BrowserFactory.GetBrowser(address, 4848)

    # Tell the browser to call our OnBrowserEvent method in case of an event
    browser.BrowserEvent += OnBrowserEvent

    # Get the isOver event out of the TouchSensor node
    touchSensor = browser.GetNode("touchSensor")
    isOver = touchSensor.GetEventOut("isOver")

    # Get the set_diffuseColor event in of the Material node
    material = browser.GetNode("material")
    set_diffuseColor = material.GetEventIn("set_diffuseColor")

    # Tell the isOver event out to call our OnIsOverChanged method in case of an event
    isOver.VrmlEvent += OnIsOverChanged

    # Wait until InstantPlayer gets closed
    try:
        System.Threading.Thread.CurrentThread.Join()
    except System.Threading.ThreadInterruptedException:
        pass
except Exception as ex:
    System.Console.WriteLine(ex)
finally:
    if browser is not None:
        browser.Dispose()
