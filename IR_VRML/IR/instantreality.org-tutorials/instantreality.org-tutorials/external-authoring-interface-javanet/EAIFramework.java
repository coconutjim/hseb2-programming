class EAIFramework
{
	public static void main(String[] args)
	{
		vrml.eai.Browser browser = null;
		try
		{
			java.net.InetAddress address = java.net.InetAddress.getByName("localhost");
			browser = vrml.eai.BrowserFactory.getBrowser(address, 4848);

			System.out.println("Browser.Name = \"" + browser.getName() + '"');
			System.out.println("Browser.Version = \"" + browser.getVersion() + '"');
			System.out.println("Browser.CurrentSpeed = " + browser.getCurrentSpeed());
			System.out.println("Browser.CurrentFrameRate = " + browser.getCurrentFrameRate());
			System.out.println("Browser.WorldURL = \"" + browser.getWorldURL() + '"');
		}
		catch (Throwable all)
		{
			all.printStackTrace();
		}
		finally
		{
			if (browser != null)
				browser.dispose();
		}
	}
}
