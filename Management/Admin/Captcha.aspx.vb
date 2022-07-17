
Partial Class Management_Admin_Captcha
    Inherits System.Web.UI.Page

    Dim ClassCaptcha As New CMS_Captcha

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "مدیریت شهر دات کام - کپچـــــــــــا"
    End Sub

    Public Function Level(ByVal Level_ As String) As String
        Select Case Level_.ToString.Trim
            Case "0"
                Return "آسان"
            Case "1"
                Return "متوسط"
            Case "2"
                Return "سخت"
        End Select
    End Function

    Protected Sub btnInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsert.Click
        ClassCaptcha.InsertCaptcha(cmbL.SelectedValue, txtQ.Text, txtA.Text)
        txtA.Text = ""
        txtQ.Text = ""
        DG.DataBind()
    End Sub
End Class
