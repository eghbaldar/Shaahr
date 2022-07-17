
Partial Class UserControl_Home_Panel_Events
    Inherits System.Web.UI.UserControl

    Dim ClassHome As New HomeProfile
    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections

    'Protected Sub imgBirthDay_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBirthDay.Click

    '    MultiView.ActiveViewIndex = 0

    '    imgBirthDay.ImageUrl = "~\content\images\home\BirthDay_1.png"
    '    imgShaahr.ImageUrl = "~\content\images\home\shaahr_2.png"
    '    imgSoftware.ImageUrl = "~\content\images\home\Software_2.png"
    '    imgBook.ImageUrl = "~\content\images\home\Book_2.png"

    'End Sub

    'Protected Sub imgShaahr_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgShaahr.Click

    '    MultiView.ActiveViewIndex = 1

    '    imgBirthDay.ImageUrl = "~\content\images\home\BirthDay_2.png"
    '    imgShaahr.ImageUrl = "~\content\images\home\shaahr_1.png"
    '    imgSoftware.ImageUrl = "~\content\images\home\Software_2.png"
    '    imgBook.ImageUrl = "~\content\images\home\Book_2.png"

    'End Sub

    'Protected Sub imgSoftware_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgSoftware.Click

    '    MultiView.ActiveViewIndex = 2

    '    imgBirthDay.ImageUrl = "~\content\images\home\BirthDay_2.png"
    '    imgShaahr.ImageUrl = "~\content\images\home\shaahr_2.png"
    '    imgSoftware.ImageUrl = "~\content\images\home\Software_1.png"
    '    imgBook.ImageUrl = "~\content\images\home\Book_2.png"

    'End Sub

    'Protected Sub imgBook_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBook.Click

    '    MultiView.ActiveViewIndex = 3

    '    imgBirthDay.ImageUrl = "~\content\images\home\BirthDay_2.png"
    '    imgShaahr.ImageUrl = "~\content\images\home\shaahr_2.png"
    '    imgSoftware.ImageUrl = "~\content\images\home\Software_2.png"
    '    imgBook.ImageUrl = "~\content\images\home\Book_1.png"

    'End Sub

    Public Function PnlBirthDay(ByVal _date As Object) As Boolean
        Dim Check As String = ClassHome.BirthDay(_date.ToString)
        If Check = "00" Then
            Return False
        Else
            Return True
        End If
    End Function

    Public Function TextBirth(ByVal _date As Object, ByVal email As Object) As String

        Dim Check As String = ClassHome.BirthDay(_date.ToString)
        If Check = "0" Then
            Return "<div style='float:right;'></div><div style='float:right;margin-right:2px;color:green;'>" + String.Format("تولد {0} امروز است", ClassProfile_Section.GetFnLn(email)) + "</div>"
        End If
        If Check < 0 Then
            Return "<div style='float:right;color:#366879;'>" + String.Format("<div style='padding-right:2px;float:right;padding-left:2px; -moz-border-radius: 2px;background-color:#587e8b;color:white;'>{0}</div>" + "<div style='margin-right:2px;float:right;'>روز به تولد {1} مانده است</div>", Math.Abs(Val(Check)), ClassProfile_Section.GetFnLn(email)) + "</span>"
        End If
        '
        If Check > 0 Then
            Return "<div style='float:right;color:#000;'>" + String.Format("<div style='padding-right:2px;float:right;padding-left:2px; -moz-border-radius: 2px;background-color:#000;color:white;'>{0}</div>" + "<div style='margin-right:2px;float:right;'>روز از تولد {1} گذشته است</div>", Math.Abs(Val(Check)), ClassProfile_Section.GetFnLn(email)) + "</span>"
        End If

    End Function

    Public Sub GotoShaahr(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~\shaahr\shaahr.aspx?sh=shaahr" + e.CommandArgument)
    End Sub

    Public Sub GotoToProfile(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~\user\?user=" + ClassProfile.getUsernameByEmail(e.CommandArgument))
    End Sub

End Class
