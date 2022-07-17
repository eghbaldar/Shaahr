
Partial Class Management_Admin_RailUser
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage
    Dim ClassUserManagement As New CMS_UserManagement
    Dim ClassCMS_Nazmie As New CMS_Nazmie
    Dim ClassCharacter3 As New Character3

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "مدیریت شهر دات کام - مدیریت توبیخ ها و محرومیت ها"
        lblName.Text = ClassProfile_Section.GetFnLn(Request.QueryString("email"))
        CountRails.Text = ClassCMS_Nazmie.CountRailsUser(Request.QueryString("email"))
        txtSuspentionDateS.Text = ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate)
        lblStatusProfile.Text = IIf(ClassCMS_Nazmie.GetBand(Request.QueryString("email")) = True, "باز است", "بسته شده")
    End Sub

    Protected Sub btnInsertRail_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertRail.Click

        Dim CountRails_ As Integer = Val(ClassCMS_Nazmie.CountRailsUser(Request.QueryString("email")))
        If CountRails_ = 2 Then
            WrongSuspention.Text = "تعداد توبیخ های کاربر به عدد 3 رسیده است و باید تعلیق شماره یک روی آن اعمال شود."
        ElseIf CountRails_ = 3 Then
            WrongSuspention.Text = "تعداد توبیخ های کاربر به عدد 4 رسیده است و باید تعلیق شماره دو روی آن اعمال شود."
        ElseIf CountRails_ = 4 Then
            WrongSuspention.Text = "تعداد توبیخ های کاربر به عدد 5 رسیده است و باید تعلیق شماره سه روی آن اعمال شود."
        End If
        ClassCMS_Nazmie.InsertRailUser(Request.QueryString("email"), CmbInsertRail.SelectedValue, txtInsertCuase.Text, "eghbaldar")
        'ارسال پیام برای کاربر
        ClassUserManagement.InsertSystemInbox(Request.QueryString("email"), "شما توسط نظمیه بر طبق دلایل زیر توبیخ شده اید.", txtInsertCuase.Text)
        'ثبت برای شخصیت سوم
        ClassCharacter3.Insert_Charaacter3_Users(Request.QueryString("email"), "کاربر محترم شما از طرف نظمیه توبیخ شده اید. لطفا قوانین و مقررات نظمیه را به دقت مطالعه کنید.امیدوارم آخرین باری باشه که توسط نظمیه توبیخ میشی", "NT", True)
        '
        txtInsertCuase.Text = ""
        DG_RailUser.DataBind()
        CountRails.Text = ClassCMS_Nazmie.CountRailsUser(Request.QueryString("email")).ToString

    End Sub

    Public Function CheckTypeLaw(ByVal CodeCrime As Object) As String
        Return ClassCMS_Nazmie.GetSubjectLawByCode(CodeCrime)
    End Function

    Public Sub DeleteRailUser(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassCMS_Nazmie.DeleteRailUser(e.CommandArgument)
        DG_RailUser.DataBind()
        CountRails.Text = ClassCMS_Nazmie.CountRailsUser(Request.QueryString("email"))
    End Sub

    Protected Sub btnInsertSuspention_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertSuspention.Click
        Dim Flag As Boolean
        If RbSuspention.Items(0).Selected Then Flag = True
        If RbSuspention.Items(1).Selected Then Flag = False
        ClassCMS_Nazmie.InsertSuspention(Request.QueryString("email"), cmbSuspentionType.SelectedValue, "eghbaldar", _
                                         txtSuspentionDateS.Text, txtSuspentionDateE.Text, txtSuspentionCuase.Text, Flag)
        txtSuspentionCuase.Text = ""
        txtSuspentionDateE.Text = ""
        DG_Suspention.DataBind()
        'Band
        ClassCMS_Nazmie.UpdateBand(0, txtSuspentionDateS.Text + ";" + cmbSuspentionType.SelectedValue, Request.QueryString("email"))
        lblStatusProfile.Text = IIf(ClassCMS_Nazmie.GetBand(Request.QueryString("email")) = True, "باز است", "بسته شده")
    End Sub

    Public Function GetTypeSuspention(ByVal type As Object) As String
        Select Case type
            Case "0"
                Return "تعلیق یک"
            Case "1"
                Return "تعلیق دو"
            Case "2"
                Return "تعلیق سه )اخرا("
        End Select
    End Function

    Public Sub DeleteSuspention(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassCMS_Nazmie.DeleteSuspention(e.CommandArgument)
        DG_Suspention.DataBind()
    End Sub

    Protected Sub btnExitBand_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExitBand.Click
        ClassCMS_Nazmie.UpdateBand("1", ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate) + ";-1", Request.QueryString("email"))
        lblStatusProfile.Text = IIf(ClassCMS_Nazmie.GetBand(Request.QueryString("email")) = True, "باز است", "بسته شده")
    End Sub

End Class
