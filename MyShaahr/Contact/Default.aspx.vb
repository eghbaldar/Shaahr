
Partial Class MyShaahr_Contact_Default
    Inherits System.Web.UI.Page

    Dim ClassMyShaahr As New MyShaahr

    Protected Sub btnSend_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSend.Click

        If Not Captcha.Check() Then
            Captcha._No()
            Exit Sub
        End If
        '''''''''''''''''''''''''''''''''''''''''''
        ClassMyShaahr.InsertCMSContact(txtFnLn.Text, txtEmail.Text, txtTell.Text, cmbGroup.Text, txtCuase.Text, Request.UserHostAddress, 0)
        MultiView1.ActiveViewIndex = 1

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Title = "تماس با شهر دات کام"
        Captcha.Width = 543
        If Session("MY-UsErNaMe") <> String.Empty Then
            txtEmail.Text = Session("MY-UsErNaMe")
            txtEmail.Enabled = False
        End If

    End Sub

End Class
