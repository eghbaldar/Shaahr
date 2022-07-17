Imports System.Data.SqlClient
Imports System.Data

Partial Class UserControl_Stage_ListCitizen
    Inherits System.Web.UI.UserControl

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassProfileHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassStage As New Stage

    '------------------

    Public Function SetAvatar(ByVal email As Object) As String
        Return "~\content\images\profile\avatars\" + ClassProfile.getOrginalAvatar(email.ToString)
    End Function
    Public Function SetTitle(ByVal email As Object) As String
        Return ClassProfile_Section.GetFnLn(email.ToString)
    End Function
    Public Function SetBirthDate(ByVal email As Object) As String
        Return String.Format("تولد: {0}", ClassProfileHome.GetBirthDateByEmail(email.ToString))
    End Function
    Public Function SetLocation(ByVal email As Object) As String
        Return ClassProfileHome.GetCountryStateByEmail(email.ToString)
    End Function

    '------------------
    'Orginal Programming

    Private Shared Count_ As Integer
    Private Shared Start_ As Integer
    Private Shared Step_ As Integer

    Public Property StepIndex() As Integer
        Get
            Return Step_
        End Get
        Set(ByVal value As Integer)
            Step_ = value
        End Set
    End Property

    Public Property Start() As Integer
        Get
            Return Start_
        End Get
        Set(ByVal value As Integer)
            Start_ = value
        End Set
    End Property

    Public Sub Action()
        Fill()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            btn_pre.Enabled = False
            Start = Start_
            Fill()
        End If

        If Start <= Count_ Then
            btn_pre.Enabled = True
        Else
            btn_next.Enabled = False
        End If
        If Start >= 0 Then
            btn_next.Enabled = True
        Else
            btn_pre.Enabled = False
        End If


    End Sub

    Protected Sub Fill()

        Dim cnn As New SqlConnection
        Dim sqlcom As New SqlCommand
        Dim sqlda As New SqlDataAdapter
        Dim ds As New DataSet
        cnn.ConnectionString = ConfigurationManager.ConnectionStrings("shaahrConnectionString").ConnectionString.ToString
        cnn.Open()
        sqlcom.CommandText = "exec Stage_SearchCitizen '','','','','','','','','','','','','','','',''"
        sqlcom.Connection = cnn
        sqlda.SelectCommand = sqlcom
        '--- baraye inke age in dastorat ra bad az kahte 35 benevisam: Count 5 ra be man midahad ;-)
        sqlda.Fill(ds)
        Count_ = ds.Tables(0).Rows.Count
        '---
        ds = New DataSet
        sqlda.Fill(ds, Start, Step_, 0)
        '---Count_
        'If ds.Tables(0).Rows.Count < Step_ + 1 Then
        'btn_next.Enabled = False
        'btn_last.Enabled = False
        'btn_pre.Enabled = False
        'btn_frist.Enabled = False
        'End If
        DG_Citizen.DataSource = ds
        DG_Citizen.DataBind()
        cnn.Close()

    End Sub
    Protected Sub btn_next_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_next.Click
        Start += Step_
        If Start <= Count_ Then
            Fill()
        Else
            Start -= 1
        End If
    End Sub
    Protected Sub btn_pre_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_pre.Click
        Start -= Step_
        If Start >= 0 Then
            Fill()
        Else
            Start += Step_
        End If
    End Sub
    Protected Sub btn_last_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_last.Click
        If Count_ Mod 12 = 0 Then
            Start = Count_
            Fill()
        Else
            Start = Step_ * ((Count_ - 1) Mod 5)
            Fill()
        End If
    End Sub
    Protected Sub btn_frist_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_frist.Click
        Start = 0
        Fill()
    End Sub

End Class
