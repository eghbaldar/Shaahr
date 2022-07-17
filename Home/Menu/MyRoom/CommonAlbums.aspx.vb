Imports System.Data

Partial Class home_Menu_MyRoom_CommonAlbums
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHomeSetting As New HomeSetting

    Public Sub RedirectPhoto(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim s() As String = e.CommandArgument.ToString.Split("|")
        Response.Redirect("~/user/photos.aspx?code=" + s(0) + "&user=" + ClassProfile.getUsernameByEmail(s(1)))
    End Sub

    Public Function ControlText(ByVal email As Object) As String
        Return ClassProfile_Section.GetFnLn(email.ToString)
    End Function

    Public Function SetOrgAlbum(ByVal code As Object, ByVal email As Object) As String

        Return IIf(ClassProfile_Section.Album(email.ToString, Convert.ToInt64(code)).Rows(0)(0).ToString() = String.Empty, _
        "~\content\images\Profile_View_Users\noPicture.png", _
        "~/user/CropPhoto.aspx?P=" + ClassProfile_Section.Album(email.ToString, Convert.ToInt64(code)).Rows(0)(0).ToString() + "&W=127&H=96")

    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = String.Format("آلبوم های مشترک - {0}", ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe")))
    End Sub

End Class
