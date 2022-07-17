Imports System.Data

Partial Class user_CheckRequest
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfileSection As New View_Users_Sections
    Dim ClassCharacter3 As New Character3
    Dim ClassStage As New Stage
    Dim ClassHomeProfile As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim EmailFrom As String = ClassProfile.getEmailByUsername(Request.QueryString("from"))
        Dim EmailTo As String = ClassProfile.getEmailByUsername(Request.QueryString("to"))
        If EmailFrom = Nothing Then Response.Redirect("~\outscope\state.aspx?state=NoUser")
        If EmailTo = Nothing Then Response.Redirect("~\outscope\state.aspx?state=NoUser")

        'imgFrom.ImageUrl = "~\content\images\profile\avatars\" + ClassProfile.getOrginalAvatar(EmailFrom)
        imgFrom.ImageUrl = "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(EmailFrom) + "&W=90&H=90"
        'imgTo.ImageUrl = "~\content\images\profile\avatars\" + ClassProfile.getOrginalAvatar(EmailTo)
        imgTo.ImageUrl = "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(EmailTo) + "&W=90&H=90"
        '
        Dim TYPE As String
        Select Case Request.QueryString("type")
            Case 0
                Title = String.Format("قطع ارتباط با {0}", ClassProfileSection.GetFnLn(EmailTo))
            Case 1
                Title = String.Format("ایجاد ارتباط با {0}", ClassProfileSection.GetFnLn(EmailTo))
        End Select

        If Request.QueryString("type") = 1 Then
            imgSwitch.ImageUrl = "~\content\images\Profile_View_Users\plus.png"
        Else
            imgSwitch.ImageUrl = "~\content\images\Profile_View_Users\NoPlus.png"
        End If

        '------------- Jiring
        Dim dr As DataRow = ClassStage.Select_Row_CMS_Factor(3)
        lblIncrease.Text = String.Format("برای هر ایجاد ارتباط مبلغ {0} جیرینگ به موجودی شما اضافه می شود.", "<b><span style='color:green;font-size:15px;'><blink>" + dr(4) + "</blink></span></b>")
        dr = ClassStage.Select_Row_CMS_Factor(4)
        lblDecrease.Text = String.Format("برای هر قطع ارتباط مبلغ {0} جیرینگ از موجودی شما کسر می شود.", "<b><span style='color:red;font-size:15px;'><blink>" + dr(4) + "</blink></span></b>")

    End Sub

    Protected Sub btnAccept_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAccept.Click

        Dim EmailFrom As String = ClassProfile.getEmailByUsername(Request.QueryString("from"))
        Dim EmailTo As String = ClassProfile.getEmailByUsername(Request.QueryString("to"))

        If Request.QueryString("type") = 1 Then 'ایجاد ارتباط
            ClassProfile.InsertRelationship(EmailFrom, EmailTo, 0, 0, "")
            Response.Redirect("Default.aspx?user=" + Request.QueryString("to"))
        Else 'قطع ارتباط

            Dim ClassStage As New Stage
            If Val(ClassStage.GetJiringByEmail(Session("MY-UsErNaMe"))) < 200 Then
                lblDelete.Text = "کاربر محترم موجودی شما برای قطع ارتباط کافی نمی باشد."
                Exit Sub
            End If

            ClassProfile.DeleteRelationship(EmailFrom, EmailTo)
            ClassProfile.DeleteRelationship(EmailTo, EmailFrom)
            'کسر مبلغ برای قطع ارتباط
            Dim dr As DataRow = ClassStage.Select_Row_CMS_Factor(4)
            ClassStage.UpdateUserJiring(dr(4), Session("MY-UsErNaMe"))
            ClassStage.InsertCycleJiring(4, Session("MY-UsErNaMe"))
            ''برای شخصیت سوم
            ClassCharacter3.Insert_Charaacter3_Users(ClassProfile.getEmailByUsername(Request.QueryString("from")), ClassCharacter3.Get_Text_Character3_Cut_Relationship(ClassProfile.getEmailByUsername(Request.QueryString("to")), True), "CF", 1)
            ClassCharacter3.Insert_Charaacter3_Users(ClassProfile.getEmailByUsername(Request.QueryString("to")), ClassCharacter3.Get_Text_Character3_Cut_Relationship(ClassProfile.getEmailByUsername(Request.QueryString("from")), False), "CF", 1)
            'برای حذف درخواست فامیلی احتمالی، چون معنی نمی دهد مثلا درخواست برادری آمده و شما آن شخص را کلا از لسیتتان حذف میکنید ،درصورتی که شرط فامیلی ابتدا دوستی است
            '''''''''''''ClassHomeSetting.DeleteTempFamily(Session("ID_Relation"), Session("MY-UsErNaMe"))
            ''
            Response.Redirect("Default.aspx?user=" + Request.QueryString("to"))
        End If

    End Sub

    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageButton2.Click
        Response.Redirect("~\home\")
    End Sub

End Class
