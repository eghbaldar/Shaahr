Imports System.Data

Partial Class home_Menu_Setting_security
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHomeSetting As New HomeSetting

    Public Sub CheckCorrectSecureStatement(ByVal sender As Object, ByVal e As CommandEventArgs)

        If ClassHomeSetting.GetIDStatementSecurtiy(Session("MY-UsErNaMe")) = e.CommandArgument Then
            Session("CounterSecurity") = 0

            Pnl_ChangeUsername.Enabled = True
            Pnl_ChangeUsername.BorderWidth = 1
            Pnl_ChangeUsername.BorderStyle = BorderStyle.Solid
            Pnl_ChangeUsername.BorderColor = System.Drawing.ColorTranslator.FromHtml("#81a5b3")

            Pnl_ComputerName.Enabled = True
            Pnl_ComputerName.BorderWidth = 1
            Pnl_ComputerName.BorderStyle = BorderStyle.Solid
            Pnl_ComputerName.BorderColor = System.Drawing.ColorTranslator.FromHtml("#81a5b3")

            txtStatement.Text = ClassHomeSetting.GetStatementSecurity(Session("MY-UsErNaMe"))
            DG_Secure.Visible = False
            lblCounter.Text = String.Format("تعداد حق انتخاب شما {0}", "<b><span style='font-size:20px'>" + Session("CounterSecurity").ToString + "</span></b>")
        Else
            Session("CounterSecurity") = Str(Val(Session("CounterSecurity")) + 1)
            lblCounter.Text = String.Format("تعداد حق انتخاب شما {0}", "<b><span style='font-size:20px'>" + Session("CounterSecurity") + "</span></b>")
        End If
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        If Session("CounterSecurity") = 3 Then
            ClassHomeSetting.UpdateBandUser(Session("MY-UsErNaMe"), False)
            Session.Abandon()
            'Delete Cookie
            Try
                Response.Cookies("ShaahrDotCom").Expires = DateTime.Now.AddYears(-30)
            Catch ex As Exception
            End Try
            '
            Response.Redirect("~\Default.aspx")
        End If

    End Sub

    Protected Sub btnUpdateStatement_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnUpdateStatement.Click

        If txtStatement.Text <> "" Then
            If ClassHomeSetting.CheckDuplicateSecureStatement(Session("MY-UsErNaMe"), txtStatement.Text) Then
                ClassHomeSetting.UpdateStatement(txtStatement.Text, Session("MY-UsErNaMe"))
                lblUserName_auth.Text = "جمله امنیتی بدرستی اصلاح گردید."
                Pnl_ChangeUsername.BorderWidth = 0
                Pnl_ChangeUsername.Enabled = False
            Else
                lblUserName_auth.Text = "این جمله توسط کاربر دیگری انتخاب شده برای امنیت بیشتر جمله دیگری را انتخاب کنید "
                Pnl_ChangeUsername.BorderWidth = 0
                Pnl_ChangeUsername.Enabled = False
            End If
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Title = String.Format("تنظیمات امنیتی و ورودی - {0}", ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe")))

        Try
            If (Not IsPostBack) And (Session("CounterSecurity").ToString = "") Then Session("CounterSecurity") = 0
            lblCounter.Text = String.Format("تعداد حق انتخاب شما {0}", "<b><span style='font-size:20px'>" + IIf(Session("CounterSecurity").ToString = "", 0, Session("CounterSecurity").ToString) + "</span></b>")
        Catch ex As Exception
            lblCounter.Text = String.Format("تعداد حق انتخاب شما {0}", "<b><span style='font-size:20px'>0</span></b>")
        End Try
        'Read CitizenName (ComputerName)
        If Not IsPostBack Then
            'Dim dr As DataRow = ClassHomeSetting.Permission(Session("MY-UsErNaMe"))
            'txtComputerName.Text = dr(4)
        End If

    End Sub

    Public Sub UpdateCitizenPhoto(ByVal sender As Object, ByVal e As CommandEventArgs)

        ClassHomeSetting.UpdateCitizenName(e.CommandArgument, Session("MY-UsErNaMe"))
        DL_CitizenPhoto.DataBind()
        Pnl_ComputerName.Enabled = False
        Pnl_ComputerName.BorderColor = System.Drawing.ColorTranslator.FromHtml("#fff")

    End Sub

    Public Function BorderColorPanel(ByVal string_factor As Object) As System.Drawing.Color

        Dim dr As DataRow = ClassHomeSetting.Permission(Session("MY-UsErNaMe"))
        'dr(4).ToString   TEXT
        'dr(3).ToString   True/False
        If dr(4).ToString = string_factor Then
            Return System.Drawing.ColorTranslator.FromHtml("#396e83")
        ElseIf dr(4) <> string_factor Then
            Return System.Drawing.ColorTranslator.FromHtml("#ccc")
        End If

    End Function

    Public Function VisibleLock(ByVal string_factor As Object) As Boolean

        Dim dr As DataRow = ClassHomeSetting.Permission(Session("MY-UsErNaMe"))
        'dr(4).ToString   TEXT
        'dr(3).ToString   True/False
        If dr(4).ToString = string_factor Then
            Return True
        ElseIf dr(4) <> string_factor Then
            Return False
        End If

    End Function

End Class
