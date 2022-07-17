
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
        Title = "ایجاد پست جدید"

        If ClassShaahr.CheckRegisterUserInShaahr(Session("MY-UsErNaMe"), ShaahrCode) Or _
            ClassShaahr.CheckMayor(Session("MY-UsErNaMe"), ShaahrCode) Or _
            ClassShaahr.CheckMayorAssist1(Session("MY-UsErNaMe"), ShaahrCode) Or _
            ClassShaahr.CheckMayorAssist2(Session("MY-UsErNaMe"), ShaahrCode) Then

            MultiView.ActiveViewIndex = 0
        Else
            MultiView.ActiveViewIndex = 1
        End If


    End Sub

    Protected Sub btnInsert_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnInsert.Click
        Dim flag As Boolean
        If rbInsert.Items(0).Selected Then flag = True
        If rbInsert.Items(1).Selected Then flag = False
        ClassShaahr.InsertShaahrPost(Request.QueryString("cdT"), txtSubjectInser.Text, txtTextInsert.Value, Session("MY-UsErNaMe"), flag)
        txtSubjectInser.Text = ""
        txtTextInsert.Value = ""
        Response.Redirect("ShaahrThread.aspx?cdT=" + Request.QueryString("cdT") + "&Sh=Shaahr" + ShaahrCode)
    End Sub

End Class
