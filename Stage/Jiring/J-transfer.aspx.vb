
Partial Class Stage_Jiring_J_transfer
    Inherits System.Web.UI.Page

    Dim ClassHome As New HomeProfile
    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassStage As New Stage
    Dim ClassCharacter3 As New Character3

    Public Function GetFnLn(ByVal user As Object) As String
        Return ClassProfile_Section.GetFnLn(user.ToString)
    End Function

    Public Sub SetSenderUser(ByVal sender As Object, ByVal e As CommandEventArgs)
        Session("UserJ") = e.CommandArgument
        txtSender.Text = String.Format("{0} ({1})", ClassProfile_Section.GetFnLn(e.CommandArgument), ClassProfile.getUsernameByEmail(e.CommandArgument))
        MV.ActiveViewIndex = 1
    End Sub

    Public Function GetAvatar(ByVal user As Object) As String
        Return "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(user.ToString) + "&W=45&H=45"
    End Function

    Protected Sub btnTransfer_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnTransfer.Click

        If (Val(ClassStage.GetJiringByEmail(Session("MY-UsErNaMe"))) - Val(txtJiring.Text)) < 501 Then
            lblWrong.Text = "با انتقال این ملبغ موجودی شما کتر از 500 جیرینگ خواهد شد."
            Exit Sub
        End If
        If ClassStage.GetJiringByEmail(Session("MY-UsErNaMe")) > 501 Then
            Dim Per As Integer = ((Val(txtJiring.Text) * 3) / 100)

            ClassStage.UpdateUserJiring(Str(-1 * Val(Str(Val(txtJiring.Text) - Per))), Session("UserJ"))
            ClassStage.UpdateUserJiring(txtJiring.Text, Session("MY-UsErNaMe"))

            ClassStage.InsertTransferJiring(Session("MY-UsErNaMe"), Session("UserJ"), Str(Val(txtJiring.Text) - Per), Per.ToString)
            HttpContext.Current.Session.Remove("UserJ")
            txtJiring.Text = ""
            txtSender.Text = ""
            lblWrong.Text = "مبلغ مورد نظر با موفقیت به کاربر مورد نظر ارسال گردید."
        Else
            lblWrong.Text = "موجودی شما برای ارسال جیرینگ کافی نمی باشد."
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Title = "انتقال جیرینگ - شهر"

        If Not ClassCharacter3.Get_CountRelate(Session("MY-UsErNaMe")) Or DG.Items.Count = 0 Then
            Div_transferJ.Visible = False
            lbl.Text = "<div style='padding:5px;color:#646464;'>کاربری برای انتخاب وجود ندارد.</div>"
        End If

    End Sub

End Class