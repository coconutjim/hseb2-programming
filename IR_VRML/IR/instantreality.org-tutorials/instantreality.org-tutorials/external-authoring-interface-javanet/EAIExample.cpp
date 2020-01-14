ref class EAIExample
{
private:

	static System::Threading::Thread ^mainThread;

	static void OnBrowserEvent(System::Object ^sender, Vrml::EAI::Event::BrowserEventArgs ^e)
	{
		// Exit the program when there is an error or InstantPlayer gets closed
		switch (e->ID)
		{
		case Vrml::EAI::Event::BrowserEventArgs::INITIALIZED:
			break;
		case Vrml::EAI::Event::BrowserEventArgs::SHUTDOWN:
		case Vrml::EAI::Event::BrowserEventArgs::URL_ERROR:
		case Vrml::EAI::Event::BrowserEventArgs::CONNECTION_ERROR:
			mainThread->Interrupt();
		}
	}

	static array<float> ^red = { 1, 0, 0 };
	static array<float> ^green = { 0, 1, 0 };
	static Vrml::EAI::Field::EventInSFColor ^set_diffuseColor;

	static void OnIsOverChanged(System::Object ^sender, Vrml::EAI::Event::VrmlEventArgs ^e)
	{
		// Change the color of the sphere to red when the mouse pointer is over the
		// sphere, and back to green when it is not
		Vrml::EAI::Field::EventOutSFBool ^isOver = (Vrml::EAI::Field::EventOutSFBool^)sender;
		set_diffuseColor->SetValue(isOver->GetValue() == true ? red : green);
	}

public:

	static int Main(array<System::String ^> ^args)
	{
		Vrml::EAI::Browser ^browser = nullptr;
		mainThread = System::Threading::Thread::CurrentThread;
		try
		{
			// Initialize the connection
			System::Net::IPAddress ^address = System::Net::Dns::GetHostAddresses("localhost")[0];
			browser = Vrml::EAI::BrowserFactory::GetBrowser(address, 4848);

			// Tell the browser to call our OnBrowserEvent method in case of an event
			browser->BrowserEvent += gcnew Vrml::EAI::Event::BrowserEventHandler(OnBrowserEvent);

			// Get the isOver event out of the TouchSensor node
			Vrml::EAI::Node ^touchSensor = browser->GetNode("touchSensor");
			Vrml::EAI::Field::EventOutSFBool ^isOver = (Vrml::EAI::Field::EventOutSFBool^)touchSensor->GetEventOut("isOver");

			// Get the set_diffuseColor event in of the Material node
			Vrml::EAI::Node ^material = browser->GetNode("material");
			set_diffuseColor = (Vrml::EAI::Field::EventInSFColor^)material->GetEventIn("set_diffuseColor");

			// Tell the isOver event out to call our OnIsOverChanged method in case of an event
			isOver->VrmlEvent += gcnew Vrml::EAI::Event::VrmlEventHandler(OnIsOverChanged);

			// Wait until InstantPlayer gets closed
			try
			{
				System::Threading::Thread::CurrentThread->Join();
			}
			catch (System::Threading::ThreadInterruptedException ^)
			{ }
		}
		catch (System::Exception ^ex)
		{
			System::Console::WriteLine(ex);
		}
		finally
		{
			if (browser != nullptr)
				delete browser;
		}

		return 0;
	}
};

int main(array<System::String ^> ^args)
{
	return EAIExample::Main(args);
}
