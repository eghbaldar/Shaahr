
Partial Class Shaahr_Default2
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassCMSShaahr As New CMS_Shaahr_Management
    Dim ClassShaahr As New Shaahr

    Dim ShaahrCode As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ShaahrCode = (Request.QueryString("sh")).ToLower.ToString.Replace("shaahr", " ").Trim
        Title = ClassShaahr.GetSubjectPost(Request.QueryString("cdP"))
        If DL_Answer.Items.Count = 0 Then lblNotAnswer.Text = "در حال حاضر جوابی برای این پست وجود ندارد."

        'NotUser

        If ClassShaahr.CheckRegisterUserInShaahr(Session("MY-UsErNaMe"), ShaahrCode) Or _
            ClassShaahr.CheckMayor(Session("MY-UsErNaMe"), ShaahrCode) Or _
            ClassShaahr.CheckMayorAssist1(Session("MY-UsErNaMe"), ShaahrCode) Or _
            ClassShaahr.CheckMayorAssist2(Session("MY-UsErNaMe"), ShaahrCode) Then

            NotUser.Visible = False
            btnNewAnswer.Visible = True
        Else
            NotUser.Visible = True
            btnNewAnswer.Visible = False
        End If


    End Sub

    Public Function GetFN(ByVal funder As String) As String
        Return ClassProfile_Section.GetFnLn(funder)
    End Function

    Public Function GetCategory(ByVal Code As String) As String
        Return ClassShaahr.GetSubjectCategory(Code)
    End Function

    Public Function CheckLuckPost(ByVal Code As String) As String
        Return Not ClassShaahr.GetLuckPost(Code)
    End Function

    Protected Sub btnNewAnswer_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnNewAnswer.Click
        PnlAnswer.Visible = True
        btnNewAnswer.Visible = False
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancel.Click
        PnlAnswer.Visible = False
        btnNewAnswer.Visible = True
    End Sub

    Protected Sub btnInsert_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnInsert.Click
        ClassShaahr.InsertShaahrAnswerPost(Request.QueryString("cdP"), txtSubject.Text, txtText.Value, Session("MY-UsErNaMe"))
        txtSubject.Text = ""
        txtText.Value = ""
        lblNotAnswer.Text = ""
        PnlAnswer.Visible = False
        btnNewAnswer.Visible = True
        DL_Answer.DataBind()
    End Sub

    Public Function GetAvatar(ByVal email As String) As String
        Return "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(email) + "&W=80&H=80"
    End Function

    Public Sub Delete(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassShaahr.DeleteCategory_Post_AnswerPost(2, e.CommandArgument)
        DL_Answer.DataBind()
        If DL_Answer.Items.Count = 0 Then lblNotAnswer.Text = "در حال حاضر جوابی برای این پست وجود ندارد."
    End Sub

    Public Function GetUser(ByVal email As String) As String

        If ClassShaahr.CheckMayor(email, ShaahrCode) Then
            Return "( شهردار )"
        ElseIf ClassShaahr.CheckMayorAssist1(email, ShaahrCode) Then
            Return "( معاون اول شهردار )"
        ElseIf ClassShaahr.CheckMayorAssist2(email, ShaahrCode) Then
            Return "( معاون دوم شهردار )"
        Else
            Return "( شهروند عادی )"
        End If

    End Function

    Public Function CheckVisibleDelete(ByVal ID As String) As Boolean
        If Session("MY-UsErNaMe") <> "" Then
            If ClassShaahr.CheckMayor(Session("MY-UsErNaMe"), ShaahrCode) Or ClassShaahr.CheckUserWriteAnswerPost(Session("MY-UsErNaMe"), ID) Then
                Return True
            Else
                Return False
            End If
        Else
            Return False
        End If
    End Function

End Class

