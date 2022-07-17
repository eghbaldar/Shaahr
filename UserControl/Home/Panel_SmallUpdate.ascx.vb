
Partial Class UserControl_Home_Panel_SmallUpdate
    Inherits System.Web.UI.UserControl

    Dim ClassProfile As New View_Users

    Dim Email_ As String

    Property Email() As String
        Get
            Return Email_
        End Get
        Set(ByVal value As String)
            Email_ = value
        End Set
    End Property

    Protected Sub ODS_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS.Selecting
        e.InputParameters("email") = Email_
    End Sub

    Public Function Text(ByVal code As Object) As String
        Return String.Format("{0} نظر", "<b><span style='color:#587e8b'>" + String.Format("{0}", ClassProfile.GetCountComment(code.ToString)) + "</span></b>")
    End Function

    Public Function ControlDetail(ByVal Detail As Object) As String
        If Len(Detail.ToString()) > 100 Then
            Return Detail.ToString.Substring(0, 100) + "..."
        Else
            Return Detail.ToString
        End If
    End Function
    '
    Public Function RedirectPost(ByVal code_email As Object) As String

        Dim s() As String = code_email.ToString.Split("|")
        Return "../user/detailpost.aspx?code=" + s(0) + "&user=" + ClassProfile.getUsernameByEmail(s(1))

    End Function

End Class
