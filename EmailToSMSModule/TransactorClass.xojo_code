#tag Class
Protected Class TransactorClass
	#tag Property, Flags = &h0
		active As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		amexlast4 As string
	#tag EndProperty

	#tag Property, Flags = &h0
		cellnumber As string
	#tag EndProperty

	#tag Property, Flags = &h0
		cellprovider As string
	#tag EndProperty

	#tag Property, Flags = &h0
		checked As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Marks whether this person can handle guide commission or not
		#tag EndNote
		commissionStatus As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		ddbankname As string
	#tag EndProperty

	#tag Property, Flags = &h0
		ddblindacctnumber As string
	#tag EndProperty

	#tag Property, Flags = &h0
		directdeposit As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		dryPantPref1 As string
	#tag EndProperty

	#tag Property, Flags = &h0
		dryPantPref2 As string
	#tag EndProperty

	#tag Property, Flags = &h0
		email As string
	#tag EndProperty

	#tag Property, Flags = &h0
		empshiftserial As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		feddeductions As string
	#tag EndProperty

	#tag Property, Flags = &h0
		firstname As string
	#tag EndProperty

	#tag Property, Flags = &h0
		homeaddress As String
	#tag EndProperty

	#tag Property, Flags = &h0
		hourly As double
	#tag EndProperty

	#tag Property, Flags = &h0
		housingpaymentfrequency As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		housingrentamount As double
	#tag EndProperty

	#tag Property, Flags = &h0
		housingrentroom As string
	#tag EndProperty

	#tag Property, Flags = &h0
		housingutilities As double
	#tag EndProperty

	#tag Property, Flags = &h0
		iconpic As picture
	#tag EndProperty

	#tag Property, Flags = &h0
		isaguide As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		isbikemechanic As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		issalaried As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		lastname As string
	#tag EndProperty

	#tag Property, Flags = &h0
		location As string
	#tag EndProperty

	#tag Property, Flags = &h0
		login As string
	#tag EndProperty

	#tag Property, Flags = &h0
		maritalstatus As string
	#tag EndProperty

	#tag Property, Flags = &h0
		name As string
	#tag EndProperty

	#tag Property, Flags = &h0
		nickname As string
	#tag EndProperty

	#tag Property, Flags = &h0
		payperiodsalary As double
	#tag EndProperty

	#tag Property, Flags = &h0
		payschedule As string
	#tag EndProperty

	#tag Property, Flags = &h0
		popupname As string
	#tag EndProperty

	#tag Property, Flags = &h0
		privileges As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			This marks an employee's work loging status
			
			0: Does not track progress
			1: Tracks progress
			2: Views progress
			3: Does both
			
			EJ 06/27/14
		#tag EndNote
		progressTracking As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		rate As double
	#tag EndProperty

	#tag Property, Flags = &h0
		receivesEquityStipend As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		serial As string
	#tag EndProperty

	#tag Property, Flags = &h0
		shifttype As string
	#tag EndProperty

	#tag Property, Flags = &h0
		SMSsetting As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		ssnumber As string
	#tag EndProperty

	#tag Property, Flags = &h0
		statedeductions As string
	#tag EndProperty

	#tag Property, Flags = &h0
		suitPref1 As string
	#tag EndProperty

	#tag Property, Flags = &h0
		suitPref2 As String
	#tag EndProperty

	#tag Property, Flags = &h0
		W41Cstatus As string
	#tag EndProperty

	#tag Property, Flags = &h0
		w4additionalwithholding As Double = 0.00
	#tag EndProperty

	#tag Property, Flags = &h0
		weight As integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="active"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="amexlast4"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="cellnumber"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="cellprovider"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="checked"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="commissionStatus"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ddbankname"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ddblindacctnumber"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="directdeposit"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="dryPantPref1"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="dryPantPref2"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="email"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="empshiftserial"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="feddeductions"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="firstname"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="homeaddress"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="hourly"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="iconpic"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="picture"
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
			Name="isaguide"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="issalaried"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="lastname"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
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
			Name="location"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="login"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="maritalstatus"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
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
			Name="nickname"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="payperiodsalary"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="payschedule"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="popupname"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="privileges"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="progressTracking"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="rate"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="receivesEquityStipend"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="serial"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="shifttype"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SMSsetting"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ssnumber"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="statedeductions"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="suitPref1"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="suitPref2"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="w4additionalwithholding"
			Visible=false
			Group="Behavior"
			InitialValue="0.00"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="weight"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="W41Cstatus"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="isbikemechanic"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="housingpaymentfrequency"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="housingrentamount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="housingrentroom"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="housingutilities"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
