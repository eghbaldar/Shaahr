Imports System.Data

Partial Class home_Menu_MyRoom_requests
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassHomeProfile As New HomeProfile
    Dim ClassCharacter3 As New Character3
    Dim ClassStage As New Stage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Title = String.Format("درخواست ها - {0}", ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe")))
        '------------- Jiring
        Dim dr As DataRow = ClassStage.Select_Row_CMS_Factor(4)
        lblDecrease.Text = String.Format("برای هر قطع ارتباط مبلغ {0} جیرینگ از موجودی شما کسر می شود.", "<b><span style='color:red;font-size:15px;'><blink>" + dr(4) + "</blink></span></b>")

        If Dl_TempFamily.Items.Count = 0 Then lblReqFamily.Text = "<div style='padding:6px;'>درخواستی وجود ندارد.</div>"
        If Dl_Request.Items.Count = 0 Then lblReqFriends.Text = "<div style='padding:6px;'>درخواستی وجود ندارد.</div>"
        If Dl_Nok.Items.Count = 0 Then lblReqNot.Text = "<div style='padding:6px;'>درخواستی وجود ندارد.</div>"
        If DL_OK.Items.Count = 0 Then lblReqOk.Text = "<div style='padding:6px;'>درخواستی وجود ندارد.</div>"
        If DG_Relation_Wait.Rows.Count = 0 Then lbl_Relation_Wait.Text = "<div style='padding:6px;'>درخواستی وجود ندارد.</div>"
        If DG_Family_Wait.Rows.Count = 0 Then lblFamilyWait.Text = "<div style='padding:6px;'>درخواستی وجود ندارد.</div>"

    End Sub

    Public Function UserImage(ByVal user As Object) As String
        Return "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(user.ToString) + "&W=90&H=90"
    End Function

    Public Function Name(ByVal user As Object) As String
        Return ClassProfile_Section.GetFnLn(user.ToString)
    End Function
    Public Function Name_(ByVal user As Object) As String
        Return String.Format("{0} برای شما درخواست دوستی فرستاده است.", "<b>" + ClassProfile_Section.GetFnLn(user.ToString) + "</b>")
    End Function
    '
    Public Function RequestDate(ByVal DateRequest As Object) As String
        Return "<span style='color:gray'>" + String.Format("تاریخ درخواست: {0}", DateRequest.ToString) + "</span>"
    End Function
    '
    Public Function AcceptDenyDate(ByVal DateResponse As Object, ByVal flag As Object) As String

        Select Case flag.ToString
            Case "1"
                Return "<span style='color:green'>" + String.Format("تاریخ تایید: {0}", DateResponse.ToString) + "</span>"
            Case "2"
                Return "<span style='color:red'>" + String.Format("تاریخ عدم تایید: {0}", DateResponse.ToString) + "</span>"
        End Select

    End Function

    Public Function Family(ByVal type As Object) As String
        If Val(type.ToString) = 0 Then
            Return "( " + "دوست" + " )"
        Else
            Return "( " + ClassHomeProfile.WhichFamily(Val(type.ToString)) + " )"
        End If
    End Function

    Public Sub AcceptFlag(ByVal sender As Object, ByVal e As CommandEventArgs)

        Dim s() As String = e.CommandArgument.ToString.Split("|")
        ClassHomeSetting.UpdateFlagRequest(1, s(0))
        ClassHomeSetting.UpdateDateRequest(s(0))
        'افزایش مبلغ برای ایجاد ارتباط
        Dim dr As DataRow = ClassStage.Select_Row_CMS_Factor(3)
        ClassStage.UpdateUserJiring("-" + dr(4), Session("MY-UsErNaMe"))
        ClassStage.UpdateUserJiring("-" + dr(4), s(1))
        ClassStage.InsertCycleJiring(3, Session("MY-UsErNaMe"))
        ClassStage.InsertCycleJiring(3, s(1))
        'ثبت برای شخصیت سوم
        ClassCharacter3.Insert_Charaacter3_Users(s(1), ClassCharacter3.Get_Text_Character3_Relationship(Session("MY-UsErNaMe"), True), "F", True)
        ClassCharacter3.Insert_Charaacter3_Users(Session("MY-UsErNaMe"), ClassCharacter3.Get_Text_Character3_Relationship(s(1), False), "F", True)
        '
        DL_OK.DataBind()
        Dl_Request.DataBind()
        If Dl_Request.Items.Count = 0 Then lblReqFriends.Text = "<div style='padding:6px;'>درخواستی وجود ندارد.</div>"

    End Sub
    '
    Public Sub DenyFlag(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassHomeSetting.UpdateFlagRequest(2, e.CommandArgument)
        ClassHomeSetting.UpdateDateRequest(e.CommandArgument)
        Dl_Nok.DataBind()
        Dl_Request.DataBind()
        If Dl_Request.Items.Count = 0 Then lblReqFriends.Text = "<div style='padding:6px;'>درخواستی وجود ندارد.</div>"
    End Sub
    '
    Public Sub DeleteRequest(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassHomeSetting.DeleteRequestByID(e.CommandArgument)
        Dl_Nok.DataBind()
    End Sub
    '
    Public Sub DeleteRelation(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim s() As String = e.CommandArgument.ToString.Split("|")
        Session("ID_Relation") = s(0)
        Session("User_Relation") = s(1)
        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub btnCancelToDelete_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancelToDelete.Click
        Session.Remove("ID_Relation")
        Session.Remove("User_Relation")
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub btnAcceptToDelete_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAcceptToDelete.Click

        If Val(ClassStage.GetJiringByEmail(Session("MY-UsErNaMe"))) < 200 Then
            lblDelete.Text = "کاربر محترم موجودی شما برای قطع ارتباط کافی نمی باشد."
            Exit Sub
        End If

        ClassHomeSetting.DeleteRequestByID(Session("ID_Relation"))
        'کسر مبلغ برای قطع ارتباط
        Dim dr As DataRow = ClassStage.Select_Row_CMS_Factor(4)
        ClassStage.UpdateUserJiring(dr(4), Session("MY-UsErNaMe"))
        ClassStage.InsertCycleJiring(4, Session("MY-UsErNaMe"))
        'برای شخصیت سوم
        ClassCharacter3.Insert_Charaacter3_Users(Session("MY-UsErNaMe"), ClassCharacter3.Get_Text_Character3_Cut_Relationship(Session("ID_Relation"), True), "CF", 1)
        ClassCharacter3.Insert_Charaacter3_Users(Session("User_Relation"), ClassCharacter3.Get_Text_Character3_Cut_Relationship(Session("MY-UsErNaMe"), False), "CF", 1)
        'برای حذف درخواست فامیلی احتمالی، چون معنی نمی دهد مثلا درخواست برادری آمده و شما آن شخص را کلا از لسیتتان حذف میکنید ،درصورتی که شرط فامیلی ابتدا دوستی است
        'ClassHomeSetting.DeleteTempFamily(Session("ID_Relation"), Session("MY-UsErNaMe"))
        Dl_TempFamily.DataBind()
        '
        Session.Remove("ID_Relation")
        Session.Remove("User_Relation")
        DL_OK.DataBind()
        Dl_TempFamily.DataBind()
        DG_Family_Wait.DataBind()
        MultiView1.ActiveViewIndex = 0

    End Sub
    '
    Public Sub SendFamily(ByVal sender As Object, ByVal e As CommandEventArgs)

        Dim s() As String = e.CommandArgument.ToString.Split("|")
        If ClassHomeSetting.DuplicateRequestFamily(Session("MY-UsErNaMe"), s(0)) Then
            DIV_User.Visible = True
            DIV_Duplicate.Visible = False
            Session("ID_Relation") = s(1)
            Session("UserFamily") = s(0)
            lblfamilyName.Text = ClassProfile_Section.GetFnLn(s(0))

            ImgfamilyName.ImageUrl = "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(s(0)) + "&W=60&H=60"

            lblType.Text = s(2) 'type
            lblEmpty.Text = ""
            cmb.SelectedIndex = 0
            MultiView1.ActiveViewIndex = 2
        Else
            DIV_User.Visible = False
            DIV_Duplicate.Visible = True
            MultiView1.ActiveViewIndex = 2
        End If
        '

    End Sub

    Protected Sub btnSendFamily_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSendFamily.Click

        '''''''''''''''''
        If cmb.SelectedValue = "-" Then
            lblEmpty.Text = "لطفا درجه فامیلی را انتخاب کنید."
            Exit Sub
        End If
        '''''''''''''''''
        If cmb.SelectedValue = lblType.Text Then
            lblEmpty.Text = "هم اکنون این رابطه برقرار می باشد."
            Exit Sub
        End If
        ''''''''''''''''' نسب های مرد با مرد
        If ClassProfile.getSex(Session("MY-UsErNaMe")) And ClassProfile.getSex(Session("UserFamily")) Then
            If cmb.SelectedValue = 1 _
            Or cmb.SelectedValue = 2 _
            Or cmb.SelectedValue = 4 _
            Or cmb.SelectedValue = 5 _
            Or cmb.SelectedValue = 7 _
            Or cmb.SelectedValue = 8 _
            Or cmb.SelectedValue = 10 _
            Or cmb.SelectedValue = 11 _
            Or cmb.SelectedValue = 12 _
            Or cmb.SelectedValue = 15 _
            Or cmb.SelectedValue = 16 _
            Or cmb.SelectedValue = 19 _
            Or cmb.SelectedValue = 20 _
            Or cmb.SelectedValue = 21 _
            Or cmb.SelectedValue = 22 _
            Or cmb.SelectedValue = 23 _
            Or cmb.SelectedValue = 25 _
            Then
                cmb.SelectedValue = "-"
                lblEmpty.Text = "درخواست داده شده قابل پذیرش نمی باشد."
                Exit Sub
            End If
        End If
        '''''''''''''''''' نسب های زن با زن
        If Not ClassProfile.getSex(Session("MY-UsErNaMe")) And Not ClassProfile.getSex(Session("UserFamily")) Then
            If cmb.SelectedValue = 1 _
            Or cmb.SelectedValue = 2 _
            Or cmb.SelectedValue = 3 _
            Or cmb.SelectedValue = 5 _
            Or cmb.SelectedValue = 6 _
            Or cmb.SelectedValue = 7 _
            Or cmb.SelectedValue = 9 _
            Or cmb.SelectedValue = 10 _
            Or cmb.SelectedValue = 13 _
            Or cmb.SelectedValue = 14 _
            Or cmb.SelectedValue = 15 _
            Or cmb.SelectedValue = 17 _
            Or cmb.SelectedValue = 18 _
            Or cmb.SelectedValue = 19 _
            Or cmb.SelectedValue = 20 _
            Or cmb.SelectedValue = 24 _
            Or cmb.SelectedValue = 26 _
            Then
                cmb.SelectedValue = "-"
                lblEmpty.Text = "درخواست داده شده قابل پذیرش نمی باشد."
                Exit Sub
            End If
        End If
        ''''''''''''''''' نسب های زن با مرد و مرد با زن
        If (Not ClassProfile.getSex(Session("MY-UsErNaMe")) And ClassProfile.getSex(Session("UserFamily"))) Or _
           (ClassProfile.getSex(Session("MY-UsErNaMe")) And Not ClassProfile.getSex(Session("UserFamily"))) Then
            If cmb.SelectedValue = 3 _
            Or cmb.SelectedValue = 4 _
            Or cmb.SelectedValue = 6 _
            Or cmb.SelectedValue = 8 _
            Or cmb.SelectedValue = 9 _
            Or cmb.SelectedValue = 11 _
            Or cmb.SelectedValue = 14 _
            Or cmb.SelectedValue = 16 _
            Or cmb.SelectedValue = 18 _
            Or cmb.SelectedValue = 21 Then
                cmb.SelectedValue = "-"
                lblEmpty.Text = "درخواست داده شده قابل پذیرش نمی باشد."
                Exit Sub
            End If
        End If
        '''''''''''''''''
        If cmb.SelectedValue = 1 And ClassProfile.GetCheckMarried(Session("MY-UsErNaMe"), Session("UserFamily")) Then
            lblEmpty.Text = "کاربر محترم برای ایجاد رابطه ی زن و شوهری نباید طرفین ازدواج کرده باشند."
            Exit Sub
        End If
        '''''''''''''''''
        If Session("UserFamily") <> "" And cmb.Text <> "-" Then
            ClassHomeSetting.InsertTempFlamily(Session("MY-UsErNaMe"), Session("UserFamily"), cmb.SelectedValue, Session("ID_Relation"))
            DG_Family_Wait.DataBind()
            lblFamilyWait.Text = ""
            Session.Remove("UserFamily")
            MultiView1.ActiveViewIndex = 0
        Else
            lblEmpty.Text = "درجه فامیلی را انتخاب کنید"
        End If

    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCancel.Click
        MultiView1.ActiveViewIndex = 0
        Session.Remove("UserFamily")
    End Sub

    Public Function ControlText(ByVal emailfrom As Object, ByVal type As Object) As String
        Return String.Format("{0} شما را بعنوان {1} برگزیده اند .", "" + _
                             "<b>" + ClassProfile_Section.GetFnLn(emailfrom.ToString) + "</b>" + "", "" + ClassHomeProfile.WhichFamily(type.ToString) + "")
    End Function

    Public Sub DeleteTempFamily(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassHomeSetting.DeleteTempFamily(e.CommandArgument)
        Dl_TempFamily.DataBind()
        If Dl_TempFamily.Items.Count = 0 Then lblReqFamily.Text = "<div style='padding:6px;'>درخواستی وجود ندارد.</div>"
    End Sub

    Public Sub UpdateRelation(ByVal sender As Object, ByVal e As CommandEventArgs)

        's(0) > type
        's(1) > ID_Relation
        's(2) > ID
        's(3) > EmailFrom (فرستنده درخواست)
        Dim s() As String = e.CommandArgument.ToString.Split("|")

        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        '''''''''' بررسی درخواست های زن و شوهری آمده ''''''''''''''''
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        If s(0) = 1 Then 'اگر نوع ارتباط زن و شوهری بود

            ClassProfile.DeleteReciveMarried(Session("MY-UsErNaMe"))
            ClassProfile.DeleteSendMarried(Session("MY-UsErNaMe"))
            '><><><><><><><><><><><><><><><><><><><><><><><><><><><
            ClassProfile.DeleteReciveMarried(s(3))
            ClassProfile.DeleteSendMarried(s(3))

        End If
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        ClassHomeSetting.UpdateRelationType(s(0), s(1))
        ClassHomeSetting.DeleteTempFamily(s(2))
        Dl_TempFamily.DataBind()
        DL_OK.DataBind()
        If Dl_TempFamily.Items.Count = 0 Then lblReqFamily.Text = "<div style='padding:6px;'>درخواستی وجود ندارد.</div>"

    End Sub

    Public Sub Redirect(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~\user\default.aspx?user=" + ClassProfile.getUsernameByEmail(e.CommandArgument))
    End Sub

    Public Function GetFnLn(ByVal email As Object) As String
        Return ClassProfile_Section.GetFnLn(email)
    End Function

    Public Function TextFriend(ByVal email As Object) As String
        Return String.Format("شما برای {0} درخواست دوستی داده اید.", "<b>" + ClassProfile_Section.GetFnLn(email) + "</b>")
    End Function
    Public Function TextFamily(ByVal email As Object, ByVal type As Object) As String
        Return String.Format("شما برای {0} درخواست {1} داده اید.", "<b>" + ClassProfile_Section.GetFnLn(email) + _
                             "</b>", "<b>" + ClassHomeProfile.WhichFamily(Val(type.ToString)) + "</b>")
    End Function

    Public Sub DeleteRelationWaiting(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassProfile.DeleteRelationshipWaiting(e.CommandArgument)
        DG_Relation_Wait.DataBind()
        If DG_Relation_Wait.Rows.Count = 0 Then lbl_Relation_Wait.Text = "<div style='padding:6px;'>درخواستی وجود ندارد.</div>"
    End Sub
    Public Sub DeleteFamilyWaiting(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassProfile.DeleteFamilyWaiting(e.CommandArgument)
        DG_Family_Wait.DataBind()
        If DG_Family_Wait.Rows.Count = 0 Then lblFamilyWait.Text = "<div style='padding:6px;'>درخواستی وجود ندارد.</div>"
    End Sub

End Class