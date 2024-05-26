#tag Module
Protected Module TWILIOModule
	#tag Method, Flags = &h0
		Sub LoadTwilioSettings()
		  dim sqlstring as string
		  dim rs as rowset
		  
		  sqlstring = "Select * from twiliosettings where serial = '1000'"
		  
		  rs = app.mysqldb.SelectSQL(sqlstring)
		  if rs <> nil then
		    if not rs.AfterLastRow then
		      TWILIOModule.AccountID = rs.column("sid").StringValue
		      TWILIOModule.FromNumber = rs.column("phonenumber").StringValue
		      TWILIOModule.MessageServiceID = rs.Column("message_service_id").StringValue
		      TWILIOModule.Password = rs.column("token").StringValue
		      TWILIOModule.url_prefix = rs.column("api_url_prefix").StringValue
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendSMS(bodytext as string)
		  
		  
		  
		  Var accountID As String = TWILIOModule.AccountID
		  
		  Var params() As String
		  params.Add("From=" + TWILIOModule.FromNumber)
		  params.Add("To=" + EncodeURLComponent("+14357725208"))
		  params.Add("MessagingServiceSid=" + TWILIOModule.MessageServiceID)
		  params.Add("Body=" + bodytext)
		  Var textParams As String = String.FromArray(params, "&")
		  
		  // Assign to the Request's Content
		  Window1.TwilioSocket.SetRequestContent(textParams, "application/x-www-form-urlencoded")
		  
		  // Set the URL
		  Var url As String = TWILIOModule.url_prefix + twiliomodule.accountID + "/Messages.json"
		  
		  // Send Request, results are in TwilioSocket.PageReceived event handler
		  Window1.TwilioSocket.Send("POST", url)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AccountID As string
	#tag EndProperty

	#tag Property, Flags = &h0
		FromNumber As string
	#tag EndProperty

	#tag Property, Flags = &h0
		MessageServiceID As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Password As string
	#tag EndProperty

	#tag Property, Flags = &h0
		url_prefix As string
	#tag EndProperty


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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
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
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AccountID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FromNumber"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MessageServiceID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Password"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="url_prefix"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
