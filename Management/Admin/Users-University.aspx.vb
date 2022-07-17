
Partial Class Management_Admin_Users_University
    Inherits System.Web.UI.Page

    Dim ClassProfile_Section As New View_Users_Sections

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Select Case Request.QueryString("type")
            Case "cat"
                Title = "کاربران- گروه های دانشگاهها"
                MultiView.ActiveViewIndex = 0
            Case "uni"
                Title = "کاربران- دانشگاهها"
                MultiView.ActiveViewIndex = 1
        End Select
    End Sub

    Public Function getFnLn(ByVal email As Object) As String
        Return ClassProfile_Section.GetFnLn(email.ToString)
    End Function

End Class
