#tag Module
Protected Module EmailToSMSModule
	#tag Method, Flags = &h0
		Sub loadesettings(inserial as string)
		  dim rs as rowset
		  dim i as integer
		  
		  
		  rs = app.mysqldb.selectsql("Select * from emailsettings where serial = " + inserial)
		  
		  if rs <> nil then
		    if not rs.AfterLastRow then
		      window1.ServerSocket1.Address =  "smtp.gmail.com"
		      window1.ServerSocket1.Username =  "info@zionadventures.com"
		      window1.ServerSocket1.port = 587
		      window1.ServerSocket1.Password = "435GetThoseEmails"
		      window1.ServerSocket1.SSLConnectionType = SMTPSecureSocket.SSLConnectionTypes.TLSv1
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function loadlogins() As Boolean
		  
		  dim i,n,t,lb as integer
		  dim s,dstr,ban as string
		  dim tx as transactorClass
		  dim d as date
		  dim rs as RowSet
		  
		  d = new date
		  dstr = str(d.year) + format(d.month,"00") + format (d.day,"00")
		  redim emps(0)
		  
		  // FIXME: this should only be active employees
		  rs = app.mysqldb.selectsql("select serial,login,priv,firstname,lastname,email1,cellphonecarrier,cell,usetextmessaging,status,isaguide,isbikemechanic FROM employees where status = 1 ORDER by lastname,firstname")
		  
		  if rs <> nil then
		    if not rs.AfterLastRow then
		      while not rs.AfterLastRow
		        tx = new transactorClass
		        tx.serial = rs.Column("serial").StringValue
		        tx.login = rs.column("login").value
		        tx.privileges = val(rs.column("priv").value)
		        tx.firstname = rs.column("firstname").value
		        tx.lastname = rs.column("lastname").value
		        tx.name = rs.column("firstname").value + " " + rs.column("lastname").value
		        tx.email = replaceall(rs.column("email1").value,chr(0),"")
		        tx.cellprovider = rs.column("cellphonecarrier").value
		        tx.cellnumber = replaceall(rs.column("cell").value,chr(0),"")
		        tx.SMSsetting = rs.column("usetextmessaging").value
		        
		        if rs.column("status").value = "1" then
		          tx.active = true
		        else
		          tx.active = false
		        end if
		        if rs.column("isaguide").value = "1" then
		          tx.isaguide = true
		        end if
		        if rs.column("isbikemechanic").value = "1" then
		          tx.isbikemechanic = true
		        end if
		        emps.append tx
		        rs.MoveToNextRow
		      wend
		      rs = nil
		      return true
		    else
		    end if
		  else
		    
		  end if
		  
		  exception err
		    if err isa nilObjectException then
		      msgbox "loadlogins Nil Object"
		    elseif err isa outofboundsException then
		      msgbox "loadlogins Out Of Bounds"
		    elseif err isa typeMismatchException then
		      msgbox "loadlogins Type Mismatch"
		    end if
		    
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub sendEmailToSMS(insubject as string, inbody as string, infromaddress as string, optional inempserial as string, optional group as string)
		  dim ostream as TextOutputStream
		  dim f as folderitem
		  Var msg as new EmailMessage
		  dim recipients,lebody,pnum as string
		  dim i, u as Integer
		  
		  
		  msg.FromAddress = infromaddress
		  msg.Subject = insubject
		  msg.Headers.AddHeader("X-Mailer", "Xojo SMTP Example") // Sample header
		  
		  msg.BodyPlainText = inbody
		  // add the recipients
		  for i = 1 to ubound(emps)
		    if emps(i).serial = inempserial then
		      pnum = emps(i).cellnumber
		      pnum = ReplaceAll(pnum,"-","")
		      pnum = replaceall(pnum,".","")
		      pnum = replaceall(pnum," ","")
		      if emps(i).cellprovider = "Verizon" then
		        recipients = pnum + "@vtext.com"
		      elseif emps(i).cellprovider = "T-Mobile" then
		        recipients = pnum+ "@tmomail.net"
		      elseif emps(i).cellprovider = "Virgin" then
		        recipients = pnum + "@vmobl.com"
		      elseif emps(i).cellprovider = "Cingular" then
		        recipients = pnum + "@cingularme.com"
		      elseif emps(i).cellprovider = "Sprint" then
		        recipients = pnum + "@messaging.sprintpcs.com"
		      elseif emps(i).cellprovider = "Nextel" then
		        recipients = pnum + "@page.nextel.com"
		      elseif emps(i).cellprovider = "AT&T" then
		        recipients = pnum + "@txt.att.net"
		      end if
		      exit
		    end if
		  next
		  
		  'if recipients <> "" then
		  msg.AddRecipient "4357725208@vtext.com"
		  // create a new send dialog to send the message
		  window1.ServerSocket1.Messages.add(msg)
		  window1.ServerSocket1.sendmail
		  'end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		emps(0) As transactorclass
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ETSsmtpauthentication As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ETSsmtpfromaddress As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ETSsmtppassword As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ETSsmtpport As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ETSsmtpserver As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ETSsmtpusername As string
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
	#tag EndViewBehavior
End Module
#tag EndModule
