#tag Class
Protected Class LaunchShellClass
Inherits shell
	#tag Event
		Sub DataAvailable()
		  dim s as string
		  dim d as new date
		  s = me.ReadAll
		  'we have a running shell
		  
		  if launchStage = 1 then 'we have a running shell and the launch has been requested of a given app
		    if apptolaunch <> "" then
		      launchStage = 2
		      if apptolaunch = "onlineJobApplication" then
		        me.writeline "/users/zacserver/Desktop/onlineJobApplication/onlineJobApplication --secureport=8082 --maxsecuresockets=200 --maxsockets=0"
		        'window1.listbox1.insertrow(0,"Web Job App")
		        'window1.listbox1.cell(window1.listbox1.LastIndex,1) = d.shortdate
		        'window1.listbox1.cell(window1.listbox1.LastIndex,2) = d.LongTime
		        DelayMBS 2
		      elseif apptolaunch = "Gear Return" then
		        me.writeline "open /users/zacserver/Desktop/Gear\ Return/Gear\ Return"
		        'window1.listbox1.insertrow(0,"Gear Return")
		        'window1.listbox1.cell(window1.listbox1.LastIndex,1) = d.shortdate
		        'window1.listbox1.cell(window1.listbox1.LastIndex,2) = d.LongTime
		        DelayMBS 2
		      elseif apptolaunch = "Gear Tester" then
		        me.writeline "open /users/zacserver/Desktop/Gear\ Tester/Gear\ Tester"
		        'window1.listbox1.insertrow(0,"Gear Tester")
		        'window1.listbox1.cell(window1.listbox1.LastIndex,1) = d.shortdate
		        'window1.listbox1.cell(window1.listbox1.LastIndex,2) = d.LongTime
		        DelayMBS 2
		      elseif apptolaunch = "Fleet Services" then
		        me.writeline "open /users/zacserver/Desktop/Fleet\ Services/Fleet\ Services"
		        'window1.listbox1.insertrow(0,"MobiCal")
		        'window1.listbox1.cell(window1.listbox1.LastIndex,1) = d.shortdate
		        'window1.listbox1.cell(window1.listbox1.LastIndex,2) = d.LongTime
		        DelayMBS 2
		      elseif apptolaunch = "MobiCal" then
		        me.writeline "/users/zacserver/Desktop/MobiCal/MobiCal --secureport=8081 --maxsecuresockets=150 --maxsockets=0"
		        'window1.listbox1.insertrow(0,"MobiCal")
		        'window1.listbox1.cell(window1.listbox1.LastIndex,1) = d.shortdate
		        'window1.listbox1.cell(window1.listbox1.LastIndex,2) = d.LongTime
		        DelayMBS 2
		      elseif apptolaunch = "onlineCheckIn" then
		        me.writeline "/users/zacserver/Desktop/onlineCheckIn/onlineCheckIn --secureport=8083 --maxsecuresockets=500 --maxconnections=0"
		        'window1.listbox1.insertrow(0,"onlineCheckIn")
		        'window1.listbox1.cell(window1.listbox1.LastIndex,1) = d.shortdate
		        'window1.listbox1.cell(window1.listbox1.LastIndex,2) = d.LongTime
		        DelayMBS 2
		      elseif apptolaunch = "BikePit" then
		        me.writeline "open /users/zacserver/Desktop/BikePit/BikePit"
		        'window1.listbox1.insertrow(0,"BikePit")
		        'window1.listbox1.cell(window1.listbox1.LastIndex,1) = d.shortdate
		        'window1.listbox1.cell(window1.listbox1.LastIndex,2) = d.LongTime
		        DelayMBS 2
		      elseif apptolaunch = "Reacher" then
		        me.writeline "/users/zacserver/Desktop/Reacher/Reacher --secureport=8224 --maxsecuresockets=500 --maxconnections=0"
		        'window1.listbox1.insertrow(0,"BikePit")
		        'window1.listbox1.cell(window1.listbox1.LastIndex,1) = d.shortdate
		        'window1.listbox1.cell(window1.listbox1.LastIndex,2) = d.LongTime
		        DelayMBS 2
		      end if
		    end if
		  elseif launchStage = 2 then
		    'we are determining if it is running again.
		    if apptolaunch = "onlineJobApplication" then
		      launchStage = 3
		      me.writeline "lsof -i :8082"
		    elseif apptolaunch = "Gear Return" then
		      launchStage = 3
		      me.writeline "lsof -i :8222"
		    elseif apptolaunch = "Gear Tester" then
		      launchStage = 3
		      me.writeline "lsof -i :8223"
		    elseif apptolaunch = "MobiCal" then
		      launchStage = 3
		      me.writeline "lsof -i :8081"
		    elseif apptolaunch = "onlineCheckIn" then
		      launchStage = 3
		      me.writeline "lsof -i :8083"
		    elseif apptolaunch = "BikePit" then
		      launchStage = 3
		      me.writeline "lsof -i :8229"
		    elseif apptolaunch = "Reacher" then
		      launchStage = 3
		      me.writeline "lsof -i :8224"
		    end if
		  elseif launchStage = 3 then
		    'see if s contains the PID of the app
		    if instr(s,"PID") <> 0 then
		      'window1.listbox1.cell(0,3) = "Success"
		    else
		      'window1.listbox1.cell(0,3) = "Fail"
		    end if
		  end if
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		appToLaunch As string
	#tag EndProperty

	#tag Property, Flags = &h0
		lastread As string
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			0 = not running
			1 = running
			2 = asked to go to directory
			3 = confirmed directory
			4 = asked to launch
			5 = confirmed launch - app is running
		#tag EndNote
		launchStage As integer
	#tag EndProperty


	#tag Constant, Name = k_navigatetodirectory, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = k_queryisrunning, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = k_sentcommandtolauch, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="ExecuteMode"
			Visible=true
			Group=""
			InitialValue=""
			Type="ExecuteModes"
			EditorType="Enum"
			#tag EnumValues
				"0 - Synchronous"
				"1 - Asynchronous"
				"2 - Interactive"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="ExitCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Result"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsRunning"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TimeOut"
			Visible=true
			Group=""
			InitialValue=""
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Arguments"
			Visible=true
			Group=""
			InitialValue=""
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backend"
			Visible=true
			Group=""
			InitialValue=""
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Canonical"
			Visible=true
			Group=""
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="launchStage"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="integer"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="appToLaunch"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="lastread"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
