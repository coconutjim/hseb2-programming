Module EAIExample

    Dim mainThread As System.Threading.Thread

    Sub OnBrowserEvent(ByVal sender As Object, ByVal e As Vrml.EAI.Event.BrowserEventArgs)
        ' Exit the program when there is an error or InstantPlayer gets closed
        Select Case e.ID
            Case Vrml.EAI.Event.BrowserEventArgs.INITIALIZED
            Case Vrml.EAI.Event.BrowserEventArgs.SHUTDOWN
                mainThread.Interrupt()
            Case Vrml.EAI.Event.BrowserEventArgs.URL_ERROR
                mainThread.Interrupt()
            Case Vrml.EAI.Event.BrowserEventArgs.CONNECTION_ERROR
                mainThread.Interrupt()
            Case Else
                mainThread.Interrupt()
        End Select
    End Sub

    Dim red() As Single = {1, 0, 0}
    Dim green() As Single = {0, 1, 0}
    Dim set_diffuseColor As Vrml.EAI.Field.EventInSFColor

    Sub OnIsOverChanged(ByVal sender As Object, ByVal e As Vrml.EAI.Event.VrmlEventArgs)
        ' Change the color of the sphere to red when the mouse pointer is over the
        ' sphere, and back to green when it is not
        Dim isOver As Vrml.EAI.Field.EventOutSFBool = sender
        If isOver.GetValue() = True Then
            set_diffuseColor.SetValue(red)
        Else
            set_diffuseColor.SetValue(green)
        End If
    End Sub

    Sub Main(ByVal args() As String)
        Dim browser As Vrml.EAI.Browser = Nothing
        mainThread = System.Threading.Thread.CurrentThread
        Try
            ' Initialize the connection
            Dim address As System.Net.IPAddress = System.Net.Dns.GetHostAddresses("localhost")(0)
            browser = Vrml.EAI.BrowserFactory.GetBrowser(address, 4848)

            ' Tell the browser to call our OnBrowserEvent method in case of an event
            AddHandler browser.BrowserEvent, AddressOf OnBrowserEvent

            ' Get the isOver event out of the TouchSensor node
            Dim touchSensor As Vrml.EAI.Node = browser.GetNode("touchSensor")
            Dim isOver As Vrml.EAI.Field.EventOutSFBool = touchSensor.GetEventOut("isOver")

            ' Get the set_diffuseColor event in of the Material node
            Dim material As Vrml.EAI.Node = browser.GetNode("material")
            set_diffuseColor = material.GetEventIn("set_diffuseColor")

            ' Tell the isOver event out to call our OnIsOverChanged method in case of an event
            AddHandler isOver.VrmlEvent, AddressOf OnIsOverChanged

            ' Wait until InstantPlayer gets closed
            Try
                System.Threading.Thread.CurrentThread.Join()
            Catch ex As System.Threading.ThreadInterruptedException
            End Try
        Catch ex As Exception
            System.Console.WriteLine(ex)
        Finally
            If Not (browser Is Nothing) Then
                browser.Dispose()
            End If
        End Try
    End Sub

End Module
