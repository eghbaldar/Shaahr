
Partial Class Management_Admin_Users_Jiring
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage
    Dim Class_CMS_Jiring As New CMS_Jiring
    Dim ClassCharacter3 As New Character3

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = String.Format("مدیریت شهر دات کام - مدیریت جیرینک {0}", ClassProfile_Section.GetFnLn(Request.QueryString("email")))
        Try
            lblJiring.Text = String.Format(" {0}", "<b><span style='font-family:KOODAK;font-size:25px;' >" + ClassStage.GetJiringByEmail(Request.QueryString("email"))) + "</span></b>"
            lblSumIncrease.Text = ClassStage.GetIncrease(Request.QueryString("email"))
            lblSumDecrease.Text = ClassStage.GetDecrease(Request.QueryString("email"))
        Catch ex As Exception
        End Try
        lblFnLn.Text = ClassProfile_Section.GetFnLn(Request.QueryString("email"))
    End Sub

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnClear.Click
        ClassStage.DeleteFactorUsers(Request.QueryString("email"))
        Dl.DataBind()
    End Sub

    Protected Sub btnDeleteTransferFrom_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDeleteTransferFrom.Click
        Class_CMS_Jiring.DeleteTransferJiringFrom(Request.QueryString("email"))
        DG_From.DataBind()
    End Sub

    Protected Sub btnDeleteTransferTo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDeleteTransferTo.Click
        Class_CMS_Jiring.DeleteTransferJiringTo(Request.QueryString("email"))
        DG_To.DataBind()
    End Sub

    Public Function GetFnLn(ByVal from As Object) As String
        Return ClassProfile_Section.GetFnLn(from.ToString)
    End Function

    Protected Sub EnableServiceUser(ByVal Sender As Object, ByVal e As CommandEventArgs)
        Dim s() As String = e.CommandArgument.ToString.Split("|")
        Class_CMS_Jiring.UpdateUserService(s(1), 1, s(0))
        DG_UserService.DataBind()
    End Sub

    Protected Sub DisibleServiceUser(ByVal Sender As Object, ByVal e As CommandEventArgs)
        Dim s() As String = e.CommandArgument.ToString.Split("|")
        Class_CMS_Jiring.UpdateUserService(s(1), 0, s(0))
        DG_UserService.DataBind()
    End Sub

    Protected Sub DeleteServiceUser(ByVal Sender As Object, ByVal e As CommandEventArgs)
        Class_CMS_Jiring.DeleteUserService(e.CommandArgument)
        DG_UserService.DataBind()
    End Sub

    Protected Sub btnExtraJiring_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExtraJiring.Click
        Class_CMS_Jiring.UpdateJiring(txtExtraJiring.Text, Request.QueryString("email"))
        lblJiring.Text = String.Format(" {0}", "<b><span style='font-family:KOODAK;font-size:25px;' >" + ClassStage.GetJiringByEmail(Request.QueryString("email"))) + "</span></b>"
        'ثبت برای شخصیت سوم
        If rbType.Items(0).Selected Then
            ClassCharacter3.Insert_Charaacter3_Users(Request.QueryString("email"), String.Format("{0}  حسابتو مدیریت شهر افزایش داده و مانده حسابت در حال حاضر {1} جیرینگ می باشه. موفق باشد دوست من", ClassProfile_Section.GetFnLn(Request.QueryString("email")), txtExtraJiring.Text), "IJ", True)
        End If
        If rbType.Items(1).Selected Then
            ClassCharacter3.Insert_Charaacter3_Users(Request.QueryString("email"), String.Format("{0}  حسابتو مدیریت شهر کاهش داده و مانده حسابت در حال حاضر {1} جیرینگ می باشه. موفق باشد دوست عزیز من", ClassProfile_Section.GetFnLn(Request.QueryString("email")), txtExtraJiring.Text), "DJ", True)
        End If
        ''
    End Sub

End Class
