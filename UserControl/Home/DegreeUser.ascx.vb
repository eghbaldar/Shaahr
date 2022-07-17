
Partial Class UserControl_Home_DegreeUser
    Inherits System.Web.UI.UserControl

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassProfileHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            Select Case Val(ClassProfileHome.GetStarNum(Session("MY-UsErNaMe")))
                Case 0 To 71
                    imgStar.ImageUrl = "~\content\images\home\star\star_0.png"
                    lblDegree.Text = "درجه شهروندی : بدون درجه"
                Case 72 To 214
                    imgStar.ImageUrl = "~\content\images\home\star\star_0-5.png"
                    lblDegree.Text = "درجه شهروندی : یک "
                Case 215 To 428
                    imgStar.ImageUrl = "~\content\images\home\star\star_1.png"
                    lblDegree.Text = "درجه شهروندی : دو "
                Case 429 To 713
                    imgStar.ImageUrl = "~\content\images\home\star\star_1-5.png"
                    lblDegree.Text = "درجه شهروندی : سه "
                Case 714 To 1069
                    imgStar.ImageUrl = "~\content\images\home\star\star_2.png"
                    lblDegree.Text = "درجه شهروندی : چهار "
                Case 1070 To 1496
                    imgStar.ImageUrl = "~\content\images\home\star\star_2-5.png"
                    lblDegree.Text = "درجه شهروندی : پنچ "
                Case 1497 To 1994
                    imgStar.ImageUrl = "~\content\images\home\star\star_3.png"
                    lblDegree.Text = "درجه شهروندی : شش "
                Case 1995 To 2563
                    imgStar.ImageUrl = "~\content\images\home\star\star_3-5.png"
                    lblDegree.Text = "درجه شهروندی : هفت "
                Case 2564 To 3203
                    imgStar.ImageUrl = "~\content\images\home\star\star_4.png"
                    lblDegree.Text = "درجه شهروندی : هشت "
                Case 3204 To 3914
                    imgStar.ImageUrl = "~\content\images\home\star\star_4-5.png"
                    lblDegree.Text = "درجه شهروندی : نه "
                Case Is > 3915
                    imgStar.ImageUrl = "~\content\images\home\star\star_5.png"
                    lblDegree.Text = "درجه شهروندی : ده "
            End Select

        End If

    End Sub

    Protected Sub imgStar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgStar.Click
        Response.Redirect("~/MyShaahr/Help/Part/?Part=DUsers")
    End Sub

End Class
