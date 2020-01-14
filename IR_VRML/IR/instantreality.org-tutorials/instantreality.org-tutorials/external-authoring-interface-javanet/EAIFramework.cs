public class EAIFramework
{
    public static void Main(string[] args)
    {
        Vrml.EAI.Browser browser = null;
        try
        {
            System.Net.IPAddress address = System.Net.Dns.GetHostAddresses("localhost")[0];
            browser = Vrml.EAI.BrowserFactory.GetBrowser(address, 4848);

            System.Console.WriteLine("Browser.Name = \"" + browser.Name + '"');
            System.Console.WriteLine("Browser.Version = \"" + browser.Version + '"');
            System.Console.WriteLine("Browser.CurrentSpeed = " + browser.CurrentSpeed);
            System.Console.WriteLine("Browser.CurrentFrameRate = " + browser.CurrentFrameRate);
            System.Console.WriteLine("Browser.WorldURL = \"" + browser.WorldURL + '"');
        }
        catch (System.Exception ex)
        {
            System.Console.WriteLine(ex);
        }
        finally
        {
            if (browser != null)
                browser.Dispose();
        }
    }
}
