Imports System.Data
Partial Class home_Menu_Fund_msg
    Inherits System.Web.UI.Page

    Dim ClassHome As New HomeProfile
    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassStage As New Stage
    Dim ClassCharacter3 As New Character3

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Title = String.Format("صندوق پستی - {0}", ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe")))
        If Not ClassCharacter3.Get_CountRelate(Session("MY-UsErNaMe")) Then
            Div_Sender.Visible = False
            Div_SenderGroup.Visible = False
        End If
        Update_Recive()
        Update_Send()
        Update_ReciveGroup()

    End Sub

    Protected Sub btnResiveMsg_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnResiveMsg.Click
        MultiView.ActiveViewIndex = 0
        MV_Send_TakMSG.ActiveViewIndex = 0
        DG_ReciveMSG.DataBind()
        Update_Recive()
    End Sub

    Protected Sub btnMsgSend_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMsgSend.Click
        MultiView.ActiveViewIndex = 1
        MV_Send_TakMSG.ActiveViewIndex = 0
        DG_SendMSG.DataBind()
        Update_Send()
    End Sub

    Protected Sub btnMsgResiveGroup_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMsgResiveGroup.Click
        MultiView.ActiveViewIndex = 2
        MV_Send_TakMSG.ActiveViewIndex = 0
        DG_ReciveMSG_Group.DataBind()
        Update_ReciveGroup()
    End Sub

    Protected Sub btnMsgSenderGroup_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMsgSenderGroup.Click
        MultiView.ActiveViewIndex = 3
        MV_Send_TakMSG.ActiveViewIndex = 0
        DG_SendMSG_Group.DataBind()
        Update_SendGroup()
    End Sub

    Protected Sub btnSendMsg_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSendMsg.Click

        If DL_User_TakMSG.Items.Count = 0 Then lblNotAllow.Text = "کاربری برای انتخاب وجود ندارد."
        MultiView.ActiveViewIndex = 4
        MV_Send_TakMSG.ActiveViewIndex = 0
        lblWrong.Text = ""
        txtMessage.Text = "پیام . . ."
        txtSender.Text = "گیرنده . . ."
        txtSubject.Text = "عنوان پیام . . ."
        lblNotAllow.Text = ""

    End Sub

    Protected Sub btnSendMsgGroup_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSendMsgGroup.Click

        MultiView.ActiveViewIndex = 5
        MV_Send_TakMSG.ActiveViewIndex = 0
        LstUsers.Items.Clear()
        lblWrongGroup.Text = ""
        txtMessage_Group.Text = "پیام . . ."
        LstUsers.Rows = 1
        txtSubject_Group.Text = "عنوان پیام . . ."
        lblNotAllowGroup.Text = ""
        Div_Jiring.Visible = False

    End Sub

    Private Function Permission(ByVal USER As String, ByVal Index As Boolean) As Boolean

        Select Case Index
            Case True 'پیام های فردی
                Dim dr As DataRow = ClassHomeSetting.Permission(USER)
                Select Case dr(17)
                    Case 0 'نمایش برای همه
                        Return True
                    Case 1 'نمایش برای دوستانم
                        If ClassHomeSetting.Check_FriendFamilyWife(USER, Session("MY-UsErNaMe"), 1) Then
                            Return False
                        Else
                            Return True
                        End If
                    Case 2 'نمایش برای بستگان
                        If ClassHomeSetting.Check_FriendFamilyWife(USER, Session("MY-UsErNaMe"), 2) Then
                            Return False
                        Else
                            Return True
                        End If
                    Case 3 'نمایش برای همسرم
                        If ClassHomeSetting.Check_FriendFamilyWife(USER, Session("MY-UsErNaMe"), 3) Then
                            Return False
                        Else
                            Return True
                        End If
                    Case 4 'فقط من
                        If Not (Session("MY-UsErNaMe") = USER) Then
                            Return False
                        Else
                            Return True
                        End If
                    Case 5 'هیچکس
                        Return False
                End Select
            Case False ' پیام های گروهی
                Dim dr As DataRow = ClassHomeSetting.Permission(USER)
                Select Case dr(18)
                    Case 0 'نمایش برای همه
                        Return True
                    Case 1 'نمایش برای دوستانم
                        If ClassHomeSetting.Check_FriendFamilyWife(USER, Session("MY-UsErNaMe"), 1) Then
                            Return False
                        Else
                            Return True
                        End If
                    Case 2 'نمایش برای بستگان
                        If ClassHomeSetting.Check_FriendFamilyWife(USER, Session("MY-UsErNaMe"), 2) Then
                            Return False
                        Else
                            Return True
                        End If
                    Case 3 'نمایش برای همسرم
                        If ClassHomeSetting.Check_FriendFamilyWife(USER, Session("MY-UsErNaMe"), 3) Then
                            Return False
                        Else
                            Return True
                        End If
                    Case 4 'فقط من
                        If Not (Session("MY-UsErNaMe") = USER) Then
                            Return False
                        Else
                            Return True
                        End If
                    Case 5 'هیچکس
                        Return False
                End Select
        End Select


    End Function

    Public Function GetAvatar(ByVal user As Object) As String
        Return "~/user/Crop.aspx?P=" + ClassProfile.getOrginalAvatar(user.ToString) + "&W=45&H=45"
    End Function

    Protected Sub RedirectFriend(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~/user/?user=" + ClassProfile.getUsernameByEmail(e.CommandArgument))
    End Sub
    Protected Sub RedirectFriend_Whitout(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("~/user/?user=" + e.CommandArgument)
    End Sub

    'MSG Update
    Private Sub Update_Recive()

        'Recive
        lblCountMsg.Text = ClassHome.getCountMessagesRecived(Session("MY-UsErNaMe"), 0)
        lblCountRead.Text = ClassHome.getCountMessagesRecived(Session("MY-UsErNaMe"), 1)
        lblCountUnRead.Text = ClassHome.getCountMessagesRecived(Session("MY-UsErNaMe"), 2)
        If DG_ReciveMSG.Rows.Count > 1 Then
            Div_Delete_Selected_Recive.Visible = True
        ElseIf DG_ReciveMSG.Rows.Count = 0 Then
            Div_Delete_Selected_Recive.Visible = False
        End If

        'Load ProgressBar
        Dim Acc, AccShow As Integer
        Dim CountMSG As Integer = Val(ClassHome.getCountMessagesRecived(Session("MY-UsErNaMe"), 0))
        If ClassStage.CheckServiceExsistUsersByType(2, Session("MY-UsErNaMe")) Then
            'صندوق 100 تایی است
            Acc = (340 * CountMSG) / 100
            AccShow = (100 * CountMSG) / 100
            litProgress.Text = "<div style='background-color:#BED3EB; width:" + Acc.ToString + "px; height: 12px; font-size: 10px; color: black;border-left:1px solid #609DCA; padding-left: 2px;'>" + AccShow.ToString + "%</div>"
            lblCapacityInbox.Text = "صندوق پیام های دریافتی ظرفیت گنجایش 100 پیام را دارد و در صورت پر بودن آن پیام جدیدی وارد صندوق نخواهد شد."
            lblExtra.Text = ""
        Else
            'صندوق 20 تایی است
            CountMSG = IIf(CountMSG >= 20, 20, CountMSG) 'اگر کاربر قبلا سرویس 100 پیام را خردیداری کرده بود ولی تمدید نکرد و تعداد پیام های صندوق بیشتر از 20تا بود مشکلی پیش نیاید.
            Acc = (340 * CountMSG) / 20
            AccShow = (100 * CountMSG) / 20
            litProgress.Text = "<div style='background-color:#BED3EB; width:" + Acc.ToString + "px; height: 12px; font-size: 10px; color: black;border-left:1px solid #609DCA;padding-left: 2px;'>" + AccShow.ToString + "%</div>"
            lblCapacityInbox.Text = "صندوق پیام های دریافتی ظرفیت گنجایش 20 پیام را دارد و در صورت پر بودن آن پیام جدیدی وارد صندوق نخواهد شد."
            lblExtra.Text = "در صورت تمایل می توانید آنرا به 100 پیام ارتقا دهید.برای انجام این ارتقا باید سرویس مورد نظر را خریداری کنید.از لینک زیر می توانید وارد لیست سرویس ها جیرینگی شوید.<a href='../../../Stage/Jiring/Services.aspx' target='_blank' style='text-decoration:none;color:Blue;'>سرویس های جیرینگی</a>"
        End If

    End Sub

    Private Sub Update_Send()
        'Send
        lblCountMsgSend.Text = ClassHome.getCountMessagesSend(Session("MY-UsErNaMe"), 0)
        lblCountDeliverd.Text = ClassHome.getCountMessagesSend(Session("MY-UsErNaMe"), 1)
        lblCountNotDeliverd.Text = ClassHome.getCountMessagesSend(Session("MY-UsErNaMe"), 2)
        If DG_SendMSG.Rows.Count > 1 Then
            Div_Delete_Selected_Send.Visible = True
        ElseIf DG_SendMSG.Rows.Count = 0 Then
            Div_Delete_Selected_Send.Visible = False
        End If
    End Sub
    Private Sub Update_ReciveGroup()
        lblCountReciveGroup.Text = ClassHome.getCountMessagesRecive_Group(Session("MY-UsErNaMe"), 0)
        lblReadReciveGroup.Text = ClassHome.getCountMessagesRecive_Group(Session("MY-UsErNaMe"), 1)
        lblUnReadReciveGroup.Text = ClassHome.getCountMessagesRecive_Group(Session("MY-UsErNaMe"), 2)
        If DG_ReciveMSG_Group.Rows.Count > 1 Then
            Div_Delete_Selected_Recive_Group.Visible = True
        ElseIf DG_ReciveMSG_Group.Rows.Count = 0 Then
            Div_Delete_Selected_Recive_Group.Visible = False
        End If
    End Sub
    Private Sub Update_SendGroup()
        If DG_SendMSG_Group.Rows.Count > 1 Then
            Div_Delete_Selected_Send_Group.Visible = True
        ElseIf DG_SendMSG_Group.Rows.Count = 0 Then
            Div_Delete_Selected_Send_Group.Visible = False
        End If
        lblCountSendGroup.Text = ClassHome.getCountAllSendGroup(Session("MY-UsErNaMe"))
    End Sub

    Public Function CheckSubject(ByVal subject As Object, ByVal ID As Object) As String

        Dim TEXT As String = ""
        If ClassHome.getDeliverd(ID) = 0 Then
            If subject.ToString.Length > 30 Then
                TEXT = subject.ToString.Substring(0, 30) + " . . ."
            Else
                TEXT = subject.ToString
            End If
            Return "<b><span style='color:black'>" + TEXT + "</span></b>"
        Else
            If subject.ToString.Length > 30 Then
                TEXT = subject.ToString.Substring(0, 30) + " . . ."
            Else
                TEXT = subject.ToString
            End If
            Return "<span style='color:#838383'>" + TEXT + "</span>"
        End If

    End Function

    Public Sub ShowMSG_Recive(ByVal sender As Object, ByVal e As CommandEventArgs)

        Dim dr As DataRow = ClassHome.SelectInboxByID(e.CommandArgument)
        tMSG.Text = dr(5)
        ClassHome.UpdateDeliverdByID(e.CommandArgument)
        DG_ReciveMSG.DataBind()
        DG_SendMSG.DataBind()
        DG_ReciveMSG_Group.DataBind()
        DG_SendMSG_Group.DataBind()
        Update_Recive()
        Update_Send()
        Update_ReciveGroup()
        Update_SendGroup()
        'Page.ClientScript.RegisterStartupScript(Me.GetType, "alert", "Modal('dialog2');", True) 'Run JQuery Function
        ScriptManager.RegisterStartupScript(Me, Me.GetType, "", "Modal('dialog2');", True)

    End Sub

    Public Sub ShowMSGSystem(ByVal sender As Object, ByVal e As CommandEventArgs)

        tMSG.Text = ClassHomeSetting.GetMessage(e.CommandArgument.ToString)
        'Page.ClientScript.RegisterStartupScript(Me.GetType, "alert", "Modal('dialog2');", True) 'Run JQuery Function
        ScriptManager.RegisterStartupScript(Me, Me.GetType, "", "Modal('dialog2');", True)

    End Sub

    Public Sub DeleteMSGSystem(ByVal sender As Object, ByVal e As CommandEventArgs)
        ClassHomeSetting.DeleteInboxSystem(e.CommandArgument)
        DG_InboxSystem.DataBind()
    End Sub

    Public Sub ShowMSG_Send(ByVal sender As Object, ByVal e As CommandEventArgs)

        Dim dr As DataRow = ClassHome.SelectInboxByID(e.CommandArgument)
        tMSG.Text = dr(5)
        'Page.ClientScript.RegisterStartupScript(Me.GetType, "alert", "Modal('dialog2');", True) 'Run JQuery Function
        ScriptManager.RegisterStartupScript(Me, Me.GetType, "", "Modal('dialog2');", True)

    End Sub

    Public Sub ShowDialogDeleteOneOnOneRecive(ByVal sender As Object, ByVal e As CommandEventArgs)
        Session("ID_MSG") = e.CommandArgument
        'Page.ClientScript.RegisterStartupScript(Me.GetType, "alert", "Modal('dialog3');", True) 'Run JQuery Function
        ScriptManager.RegisterStartupScript(Me, Me.GetType, "", "Modal('dialog3');", True)
    End Sub
    Public Sub ShowDialogDeleteOneOnOneSend(ByVal sender As Object, ByVal e As CommandEventArgs)
        Session("ID_MSG") = e.CommandArgument
        'Page.ClientScript.RegisterStartupScript(Me.GetType, "alert", "Modal('dialog3');", True) 'Run JQuery Function
        ScriptManager.RegisterStartupScript(Me, Me.GetType, "", "Modal('dialog3');", True)
    End Sub
    Public Sub btnDeleteOneOnOne(ByVal sender As Object, ByVal e As CommandEventArgs)
        If Session("ID_MSG") <> "" Then
            ClassHome.DeleteMsgByID(Val(Session("ID_MSG")))
            Update_Recive()
            Update_Send()
            Update_ReciveGroup()
            Update_SendGroup()
            Session.Remove("ID_MSG")
            DG_ReciveMSG.DataBind()
            DG_SendMSG.DataBind()
            DG_ReciveMSG_Group.DataBind()
            DG_SendMSG_Group.DataBind()
            ScriptManager.RegisterStartupScript(Me, Me.GetType, "", "Close();", True)
        End If
    End Sub


    Public Sub ShowDialogDeleteGroup_Recive(ByVal sender As Object, ByVal e As CommandEventArgs) Handles btnDeleteReciveMsg.Command

        Session.Remove("ID_MSG")
        For Each rowItem As GridViewRow In DG_ReciveMSG.Rows
            Dim ch As CheckBox = CType(rowItem.Cells(0).FindControl("Chk_Recive"), CheckBox)
            If ch.Checked Then
                Session("ID_MSG") = Session("ID_MSG") + ch.Text + ","
            End If
        Next
        'Page.ClientScript.RegisterStartupScript(Me.GetType, "alert", "Modal('dialog4');", True) 'Run JQuery Function
        ScriptManager.RegisterStartupScript(Me, Me.GetType, "", "Modal('dialog4');", True)

    End Sub
    Public Sub ShowDialogDeleteGroup_Send(ByVal sender As Object, ByVal e As CommandEventArgs) Handles btnDeleteSendMsg.Command
        Session.Remove("ID_MSG")
        For Each rowItem As GridViewRow In DG_SendMSG.Rows
            Dim ch As CheckBox = CType(rowItem.Cells(0).FindControl("Chk_Send"), CheckBox)
            If ch.Checked Then
                Session("ID_MSG") = Session("ID_MSG") + ch.Text + ","
            End If
        Next
        'Page.ClientScript.RegisterStartupScript(Me.GetType, "alert", "Modal('dialog4');", True) 'Run JQuery Function
        ScriptManager.RegisterStartupScript(Me, Me.GetType, "", "Modal('dialog4');", True)
    End Sub
    Public Sub ShowDialogDeleteGroup_ReciveGroup(ByVal sender As Object, ByVal e As CommandEventArgs) Handles LinkButton1.Command
        Session.Remove("ID_MSG")
        For Each rowItem As GridViewRow In DG_ReciveMSG_Group.Rows
            Dim ch As CheckBox = CType(rowItem.Cells(0).FindControl("Chk_Recive"), CheckBox)
            If ch.Checked Then
                Session("ID_MSG") = Session("ID_MSG") + ch.Text + ","
            End If
        Next
        'Page.ClientScript.RegisterStartupScript(Me.GetType, "alert", "Modal('dialog4');", True) 'Run JQuery Function
        ScriptManager.RegisterStartupScript(Me, Me.GetType, "", "Modal('dialog4');", True)
    End Sub
    Public Sub ShowDialogDeleteGroup_SendGroup(ByVal sender As Object, ByVal e As CommandEventArgs) Handles LinkButton2.Command
        Session.Remove("ID_MSG")
        For Each rowItem As GridViewRow In DG_SendMSG_Group.Rows
            Dim ch As CheckBox = CType(rowItem.Cells(0).FindControl("Chk_SendGroup"), CheckBox)
            If ch.Checked Then
                Session("ID_MSG") = Session("ID_MSG") + ch.Text + ","
            End If
        Next
        'Page.ClientScript.RegisterStartupScript(Me.GetType, "alert", "Modal('dialog4');", True) 'Run JQuery Function
        ScriptManager.RegisterStartupScript(Me, Me.GetType, "", "Modal('dialog4');", True)
    End Sub
    Public Sub btnDeleteGroup(ByVal sender As Object, ByVal e As CommandEventArgs)

        If Session("ID_MSG") <> "" Then
            Session("ID_MSG") = Session("ID_MSG").ToString.Substring(0, Session("ID_MSG").ToString.Length - 1)
            Dim s() As String = Session("ID_MSG").ToString.Split(",")
            For i As Long = 0 To s.Length - 1
                ClassHome.DeleteMsgByID(Val(s(i)))
            Next
            Session.Remove("ID_MSG")
            Update_Recive()
            Update_Send()
            Update_ReciveGroup()
            Update_SendGroup()
            DG_ReciveMSG.DataBind()
            DG_SendMSG.DataBind()
            DG_ReciveMSG_Group.DataBind()
            DG_SendMSG_Group.DataBind()
            ScriptManager.RegisterStartupScript(Me, Me.GetType, "", "Close();", True)
        End If

    End Sub

    'MSG Sender Message

    Public Function GetFnLn(ByVal user As Object) As String
        Return ClassProfile_Section.GetFnLn(user.ToString)
    End Function

    'SetSenderUser
    Public Sub SetSenderUser(ByVal sender As Object, ByVal e As CommandEventArgs)

        'آیا کاربر جاری مجاز اجازه ارسال پیام به کابر انتخاب شده را دارد
        If Permission(e.CommandArgument, True) Then
            'چک کردن پر بودن صندوق پستی کاربر
            If ClassStage.CheckServiceExsistUsersByType(2, e.CommandArgument) Then
                If ClassHome.getCountMessagesRecived(e.CommandArgument, 0) >= 100 Then
                    lblNotAllow.Text = "صندوق پستی کاربر مورد نظر پر می باشد. لطفا در زمان دیگری اقدام کنید."
                    Exit Sub
                End If
            Else
                If ClassHome.getCountMessagesRecived(e.CommandArgument, 0) >= 20 Then
                    lblNotAllow.Text = "صندوق پستی کاربر مورد نظر پر می باشد. لطفا در زمان دیگری اقدام کنید."
                    Exit Sub
                End If
            End If
            '
            Session("UserSender") = e.CommandArgument
            txtSender.Text = String.Format("{0} ({1})", ClassProfile_Section.GetFnLn(e.CommandArgument), ClassProfile.getUsernameByEmail(e.CommandArgument))
            MV_Send_TakMSG.ActiveViewIndex = 1
            lblNotAllow.Text = ""
        Else
            lblNotAllow.Text = "شما مجاز به ارسال پیام برای این شخص نیستید"
        End If

    End Sub

    Protected Sub brnSendMSG_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles brnSendMSG.Click

        If txtSender.Text <> "" And txtSubject.Text <> "" And txtMessage.Text <> "" And Session("UserSender") <> "" Then
            If txtSender.Text <> "گیرنده . . ." And txtSubject.Text <> "عنوان پیام . . ." And txtMessage.Text <> "پیام . . ." Then
                ClassHome.InsertInbox(Session("MY-UsErNaMe"), Session("UserSender"), txtSubject.Text, txtMessage.Text, 0, 0, True)
                ClassHome.InsertInbox(Session("MY-UsErNaMe"), Session("UserSender"), txtSubject.Text, txtMessage.Text, 0, 0, False)
                lblWrong.Text = ""
                MultiView.ActiveViewIndex = 6
                '''''''''''''''''
                'شخصیت سوم و بررسی پر بودن صندوق پستی
                If ClassStage.CheckServiceExsistUsersByType(2, Session("UserSender")) Then
                    'صندوق 100 تایی است
                    If Val(ClassHome.getCountMessagesRecived(Session("UserSender"), 0)) > 99 Then
                        ClassCharacter3.Insert_Charaacter3_Users(Session("UserSender"), String.Format("دوست من {0} خوبی؟ باید بگم صندوق پستیت متاسفانه پر شده ، بهتره چنتا از پیاماتو پاک کنی تا پیام بقیه بهت برسه", ClassProfile_Section.GetFnLn(Session("UserSender"))), "FF", True)
                    End If
                Else
                    'صندوق 20 تایی است
                    If Val(ClassHome.getCountMessagesRecived(Session("UserSender"), 0)) > 19 Then
                        ClassCharacter3.Insert_Charaacter3_Users(Session("UserSender"), String.Format("دوست من {0} انشالله که حالت خوب باشه. صندوق پستیت متاسفانه پر شده ، بهت پیشنهاد میکنم که از سرویس افزایش صندوق پستی به 100 پیام استفاده کنی و یا چنتا از پیاماتو پاک کنی تا پیام بقیه بهت برسه", ClassProfile_Section.GetFnLn(Session("UserSender"))), "FF", True)
                    End If
                End If
                '''''''''''''''''
                Session.Remove("UserSender")
            Else
                lblWrong.Text = "تمام مشخصه ها باید تکمیل شود."
            End If
        Else
            lblWrong.Text = "تمام مشخصه ها باید تکمیل شود."
        End If

    End Sub

    Public Function ReciveUsers(ByVal other_email As Object) As String

        Dim s() As String = other_email.ToString().Split(",")
        Dim Users As String = ""
        For i As Integer = 0 To s.Length - 1
            Users += ClassProfile_Section.GetFnLn(s(i)) + " , "
        Next
        Return "<i>" + Users.Substring(0, Users.Length - 2) + "</i>"

    End Function

    'SetSender(s) User
    Public Sub SetSenderUsers(ByVal sender As Object, ByVal e As CommandEventArgs)

        'آیا کاربر جاری مجاز اجازه ارسال پیام به کابر انتخاب شده را دارد
        If Permission(e.CommandArgument, False) Then
            'چک کردن پر بودن صندوق پستی کاربر
            If ClassHome.getCountMessagesRecive_Group(e.CommandArgument, 0) > "9" Then
                lblNotAllowGroup.Text = "صندوق پستی کاربر مورد نظر پر می باشد. لطفا در زمان دیگری اقدام کنید."
                Exit Sub
            End If
            '
            For i As Integer = 0 To LstUsers.Items.Count - 1
                If e.CommandArgument = LstUsers.Items(i).Value Then
                    LstUsers.Items.Remove(LstUsers.Items(i))
                    LstUsers.Rows = LstUsers.Items.Count + 1
                    Exit Sub
                End If
            Next
            Dim LstItem As New ListItem(String.Format("{0}    ({1})", ClassProfile_Section.GetFnLn(e.CommandArgument), ClassProfile.getUsernameByEmail(e.CommandArgument)), e.CommandArgument)
            LstUsers.Items.Add(LstItem)
            LstUsers.Rows = LstUsers.Items.Count + 1
            lblNotAllowGroup.Text = ""
        Else
            lblNotAllowGroup.Text = "شما مجاز به ارسال پیام برای این شخص نیستید"
        End If

    End Sub

    Protected Sub brnSendMSG_Group_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles brnSendMSG_Group.Click

        If txtSubject_Group.Text <> "" And txtMessage_Group.Text <> "" And LstUsers.Items.Count > 0 Then
            If txtSubject_Group.Text <> "عنوان پیام . . ." And txtMessage_Group.Text <> "پیام . . ." Then
                If LstUsers.Items.Count < 4 Then
                    lblWrongGroup.Text = "پیام گروهی ، باید برای بیش از 3 نفر ارسال شود."
                    Exit Sub
                End If
                '----- اگر تعداد کاربران بیش از 10 نفر باشد باید جیرینگ پرداخت کنند
                If LstUsers.Items.Count > 3 Then
                    Dim dr As DataRow = ClassStage.Select_Row_CMS_Factor(15)
                    lblJiring.Text = String.Format("هزینه این سرویس {0} جیرینگ می باشد.", "<span style='font-size:20px;'><b>" + dr(4) + "</b></span>")
                    Div_Jiring.Visible = True
                    Exit Sub
                End If
                '-----------------------
                Dim Users As String = String.Empty
                For i As Integer = 0 To LstUsers.Items.Count - 1
                    ClassHome.InsertInbox(Session("MY-UsErNaMe"), LstUsers.Items(i).Value, txtSubject_Group.Text, txtMessage_Group.Text, 1, 0, False)
                    Users += LstUsers.Items(i).Value + ","
                Next
                ClassHome.InsertInbox(Session("MY-UsErNaMe"), Users.Substring(0, Users.ToString.Length - 1), txtSubject_Group.Text, txtMessage_Group.Text, 1, 0, True)

                lblWrongGroup.Text = ""
                MultiView.ActiveViewIndex = 6
            Else
                lblWrongGroup.Text = "تمام مشخصه ها باید تکمیل شود."
            End If
        Else
            lblWrongGroup.Text = "تمام مشخصه ها باید تکمیل شود."
        End If

    End Sub

    Protected Sub btnKasrJiring_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnKasrJiring.Click

        Dim dr As DataRow = ClassStage.Select_Row_CMS_Factor(15)
        'آیا کاربر موجودی کافی را برای خریدن سرویس را دارد
        If Val(ClassStage.GetJiringByEmail(Session("MY-UsErNaMe"))) < Val(dr(4)) Then
            lblJiring.Text = "<span style='font-size:15px;color:red;'>" + String.Format("هزینه این سرویس {0} جیرینگ می باشد.و موجودی شما برای استفاده از این سرویس کافی نمی باشد لطفا موجوی خود ا افزایش داده و دوباره اقدام کنید.", "<span style='font-size:20px;'><b>" + dr(4) + "</b></span>") + "</span>"
            Exit Sub
        End If
        'کسر مبلغ از موجودی کاربر  و ثبت در گردش حساب 
        ClassStage.UpdateUserJiring(dr(4), Session("MY-UsErNaMe"))
        ClassStage.InsertCycleJiring(15, Session("MY-UsErNaMe"))
        '----------------
        If txtSubject_Group.Text <> "" And txtMessage_Group.Text <> "" And LstUsers.Items.Count > 0 Then
            If txtSubject_Group.Text <> "عنوان پیام . . ." And txtMessage_Group.Text <> "پیام . . ." Then

                Dim Users As String = String.Empty
                For i As Integer = 0 To LstUsers.Items.Count - 1
                    ClassHome.InsertInbox(Session("MY-UsErNaMe"), LstUsers.Items(i).Value, txtSubject_Group.Text, txtMessage_Group.Text, 1, 0, False)
                    Users += LstUsers.Items(i).Value + ","
                Next
                ClassHome.InsertInbox(Session("MY-UsErNaMe"), Users.Substring(0, Users.ToString.Length - 1), txtSubject_Group.Text, txtMessage_Group.Text, 1, 0, True)
                'ثبت برای شخصیت سوم
                ClassCharacter3.Insert_Charaacter3_Users(Session("MY-UsErNaMe"), "دوست گرامی من، بابت استفاده از ارسال گروهی لحظه ای ، مقدار جیرینگ اشاره شده در هنگام ارسال،از حسابت کسر شد.با آرزوی موفقیت برایت ", "DJ", True)
                '
                lblWrongGroup.Text = ""
                MultiView.ActiveViewIndex = 6
            Else
                lblWrongGroup.Text = "تمام مشخصه ها باید تکمیل شود."
            End If
        Else
            lblWrongGroup.Text = "تمام مشخصه ها باید تکمیل شود."
        End If

    End Sub

    'Reply MSG
    Public Sub ReplyMSG(ByVal sender As Object, ByVal e As CommandEventArgs)
        MultiView.ActiveViewIndex = 4
        txtMessage.Text = ClassHome.getMessageByID(e.CommandArgument)
    End Sub

    Protected Sub btnGotoSelectUser_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGotoSelectUser.Click
        MV_Send_TakMSG.ActiveViewIndex = 0
    End Sub

    Protected Sub btnBackup_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnBackup.Click
        MSG_Backup1.Visible = True
    End Sub

End Class
