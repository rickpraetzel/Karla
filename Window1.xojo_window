#tag DesktopWindow
Begin DesktopWindow Window1
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composite       =   False
   DefaultLocation =   2
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   False
   HasMinimizeButton=   False
   Height          =   90
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   400
   MaximumWidth    =   600
   MenuBar         =   2123218943
   MenuBarVisible  =   False
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   False
   Title           =   "Reacher Status"
   Type            =   7
   Visible         =   True
   Width           =   406
   Begin DesktopButton Button1
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Refresh"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   318
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   4
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin URLConnection URLConnection1
      AllowCertificateValidation=   False
      HTTPStatusCode  =   0
      Index           =   -2147483648
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin DesktopLabel Label1
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   20.0
      FontUnit        =   0
      Height          =   30
      Index           =   -2147483648
      Italic          =   False
      Left            =   87
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Last Verified Up Status:"
      TextAlignment   =   0
      TextColor       =   &c2A4DC600
      Tooltip         =   ""
      Top             =   17
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   232
   End
   Begin DesktopTextField TextField1
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   16.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      Height          =   26
      Hint            =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   87
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Not Yet Verified..."
      TextAlignment   =   2
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   51
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   232
   End
   Begin Timer CheckStatusTimer
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   300000
      RunMode         =   2
      Scope           =   2
      TabPanelIndex   =   0
   End
   Begin SMTPSecureSocket ServerSocket1
      CertificateFile =   
      CertificatePassword=   ""
      CertificateRejectionFile=   
      Index           =   -2147483648
      LockedInPosition=   False
      Scope           =   0
      Secure          =   True
      SMTPConnectionMode=   0
      SSLConnectionType=   3
      TabPanelIndex   =   0
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Closing()
		  quit
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  
		  if loadlogins then
		    loadesettings("1")
		  end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function AppnameToProcessClass(appname as string) As ProcessClass
		  dim i as integer
		  
		  if ubound(webapplist) > 0 then
		    for i = 1 to ubound(webapplist)
		      if webapplist(i).appname = appname then
		        currentWebApp = webapplist(i)
		        return currentWebApp
		      end if
		    next
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckForRunningProcesses()
		  'checkstatus
		  dim grepresult,s as string
		  dim i as integer
		  mShell = New grepShellClass
		  mShell.ExecuteMode = shell.ExecuteModes.synchronous
		  
		  
		  if ubound(Webapplist) > 0 then
		    
		    for i = 1 to ubound(Webapplist)
		      if webapplist(i).active then
		        s = "pgrep -f " + chr(34) + replaceall(webapplist(i).processName,chr(32),"\ ") + chr(34)
		        mShell.execute(s)
		        grepresult = mshell.result
		        'if instr(grepresult,shellprompt) <> 0 then 'this concludes the instruction
		        grepresult = Replace(grepresult,shellprompt,"")
		        grepresult = trim(grepresult)
		        if isnumeric(grepresult) then 'this is the PID and it is running
		          webapplist(i).running = true
		          webapplist(i).PID = val(grepresult)
		        else 'this thing is not running
		          webapplist(i).running = false
		          webapplist(i).PID = 0
		        end if
		        'end if
		      end if
		    next
		  end if
		  
		  
		  'catch exceptions here
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub KillAppIfAppIsRunning(Appname as string,PIDtoKill as string)
		  dim shellstring,fname,lname,position,eadd,s as string
		  dim i as integer
		  
		  if ubound(webapplist) >= 0 then
		    for i = 1 to ubound(webapplist)
		      if webapplist(i).appname = appname then
		        if webapplist(i).running then
		          killshell = New Shell
		          killshell.ExecuteMode = shell.ExecuteModes.synchronous
		          If killshell <> Nil Then
		            killshell.execute "kill " + PIDtoKill
		            shellstring = killshell.result
		            if shellstring = "" AND killshell.errorcode = 0 then 'change the status to not running
		              webapplist(i).running = false
		              'webapplist(i).active = false
		              PopupMenu2.RowTagAt(popupmenu2.selectedrowindex) = ""
		              PlaceCheckmarks
		            end if
		          end if
		        end if
		      else
		        
		      end if
		    next
		  end if
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LaunchApp(appName as string)
		  dim s,grepresult as string
		  dim n as integer
		  dim d as new date
		  
		  window1.shellstring = ""
		  window1.grepReturnString = ""
		  window1.AppWeAreChecking = ""
		  
		  launchShell = new Shell
		  launchShell.ExecuteMode = shell.ExecuteModes.Synchronous
		  launchShell.Execute "sh"
		  currentWebApp = AppnameToProcessClass(appname)
		  launchshell.execute(currentWebApp.params)
		  DelayMBS 1
		  s = launchshell.result
		  if s = "" AND launchshell.errorcode = 0 then
		    currentWebApp.running = true 'get the PID
		    
		    s = "pgrep " + currentWebApp.processName
		    mShell.execute(s)
		    grepresult = mshell.result
		    grepresult = trim(grepresult)
		    if isnumeric(grepresult) then 'this is the PID and it is running
		      currentWebApp.running = true
		      currentWebApp.PID = val(grepresult)
		    else 'this thing is not running
		      currentWebApp.running = false
		      currentWebApp.PID = 0
		    end if
		  end if
		  LoadPIDSintoPopup
		  PlaceCheckmarks
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		KillShell As Shell
	#tag EndProperty

	#tag Property, Flags = &h0
		launchShell As Shell
	#tag EndProperty

	#tag Property, Flags = &h0
		mShell As grepShellClass
	#tag EndProperty


#tag EndWindowCode

#tag Events Button1
	#tag Event
		Sub Pressed()
		  
		  
		  urlconnection1.send("GET","https://reacher.zionadventures.com")
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events URLConnection1
	#tag Event
		Sub ContentReceived(URL As String, HTTPStatus As Integer, content As String)
		  Var d as datetime = datetime.now
		  
		  if HTTPStatus = 521 then
		    SendEmailToSMS("reacher Status","Reacher Error: Server is not responding.","Karla@zionadventures.com","1045")
		    'Turn the last confirmed status to red
		    'Kill Reacher?
		    'If it is already killed, enable it?
		    
		  elseif HTTPStatus = 200 then 'things are normal
		    TextField1.text = d.SQLDateTime
		    'SendEmailToSMS("Reacher Status","Reacher Error: Server is not responding.","Karla@zionadventures.com","1045")
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckStatusTimer
	#tag Event
		Sub Action()
		  urlconnection1.send("GET","https://reacher.zionadventures.com")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ServerSocket1
	#tag Event
		Sub ConnectionEstablished(greeting as string)
		  TextField1.text = "Connected"
		End Sub
	#tag EndEvent
	#tag Event
		Sub MailSent()
		  TextField1.text = "Mail is sent."
		End Sub
	#tag EndEvent
	#tag Event
		Sub ServerError(ErrorID as integer, ErrorMessage as string, Email as EmailMessage)
		  'TextField1.text = ErrorMessage
		End Sub
	#tag EndEvent
	#tag Event
		Sub Error(err As RuntimeException)
		  'TextField1.text = err.Message
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Window Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&cFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="DesktopMenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
