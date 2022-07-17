Imports System.Data

Partial Class Stage_Jiring_Services
    Inherits System.Web.UI.Page

    Dim ClassStage As New Stage
    Dim ClassCharacter3 As New Character3
    Dim ClassProfile_Section As New View_Users_Sections

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "خرید سرویس های جیرینگی - شهر"
        If Session("MY-UsErNaMe") <> "" Then lblJiring.Text = String.Format(" {0}", "<b><span style='font-family:titr;font-size:25px;' >" + ClassStage.GetJiringByEmail(Session("MY-UsErNaMe")) + "</span></b>")
    End Sub

    Public Function Month_(ByVal Month As Object) As String
        Select Case Month.ToString
            Case 1
                Return String.Format("سرویس {0} ماهه", "<b>یک</b>")
            Case 2
                Return String.Format("سرویس {0} ماهه", "<b>دو</b>")
        End Select
    End Function

    Public Sub Buy(ByVal sender As Object, ByVal e As CommandEventArgs)

        If ClassStage.CheckExsitsService(Session("MY-UsErNaMe"), e.CommandArgument) Then
            MultiView.ActiveViewIndex = 2
            'Page.ClientScript.RegisterStartupScript(Me.GetType, "alert", "Modal();", True) 'Run JQuery Function
            ScriptManager.RegisterStartupScript(Me, Me.GetType, "", "Modal();", True)
            Exit Sub
        End If
        '--------------------------------
        Dim dr As DataRow = ClassStage.SelectRow_Jiring_Service(e.CommandArgument)
        Session("CodeService") = dr(0)
        Select Case dr(4)
            Case True 'سرویس رایگان
                MultiView.ActiveViewIndex = 0
                lblServicNotJiring.Text = "نوع سرویس: <b>" + dr(1) + "</b>"
                lblTimeServiceNotJiring.Text = "<b>" + "زمان سرویس: " + "</b>" + String.Format("سرویس {0} ماهه", dr(3))
                lblDetailServiceNotJiring.Text = "<b>" + "توضیحات سرویس:" + "</b><br/><br/>" + dr(2)
            Case False 'سرویس پولی
                MultiView.ActiveViewIndex = 1

                lblServicJiring.Text = "نوع سرویس: <b>" + dr(1) + "</b>"
                lblTimeServiceJiring.Text = "<b>" + "زمان سرویس: " + "</b>" + String.Format("سرویس {0} ماهه", dr(3))
                lblDiscountJiring.Text = "<span style='color:green;'>" + "تخفیف ویژه: <b>" + dr(8) + "</b> جیرینگ" + "</span>"
                lblDetailServiceJiring.Text = "<b>" + "توضیحات سرویس:" + "</b><br/><br/>" + dr(2)
                lblJiringJiring.Text = "<span style='color:red;'>" + " مبلغ سرویس: <b>" + dr(5) + "</b> جیرینگ" + "</span>"
                lblFullJiring.Text = "<span style='color:#286cb8;font-size:13px;'>" + " مبلغ قابل پرداخت به کسر تخفیف: <b>" + Str(Val(dr(5)) - Val(dr(8))) + "</b> جیرینگ" + "</span>"

                'آیا کاربر موجودی کافی را برای خریدن سرویس را دارد
                If Val(ClassStage.GetJiringByEmail(Session("MY-UsErNaMe"))) < Val(Val(dr(5)) - Val(dr(8))) Then
                    btnBuyService.Visible = False
                    PnlKasreMojodi.Visible = True
                    'Page.ClientScript.RegisterStartupScript(Me.GetType, "alert", "Modal();", True) 'Run JQuery Function
                    ScriptManager.RegisterStartupScript(Me, Me.GetType, "", "Modal();", True)
                    Exit Sub
                Else
                    btnBuyService.Visible = True
                    PnlKasreMojodi.Visible = False
                End If

        End Select
        'Page.ClientScript.RegisterStartupScript(Me.GetType, "alert", "Modal();", True) 'Run JQuery Function
        ScriptManager.RegisterStartupScript(Me, Me.GetType, "", "Modal();", True)

    End Sub

    Protected Sub btnEnableService_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnEnableService.Click
        'سرویس های رایگان
        Dim dr As DataRow = ClassStage.SelectRow_Jiring_Service(Session("CodeService"))
        ClassStage.InsertServiceUsers(Session("CodeService"), Session("MY-UsErNaMe"), ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate), ClassStage.EndDateService, dr(5), True)
        Session.Remove("CodeService")
    End Sub

    Protected Sub btnBuyService_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnBuyService.Click
        'سرویس های پولی
        Dim dr As DataRow = ClassStage.SelectRow_Jiring_Service(Session("CodeService"))
        ClassStage.InsertServiceUsers(Session("CodeService"), Session("MY-UsErNaMe"), ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate), ClassStage.EndDateService, Str(Val(dr(5)) - Val(dr(8))).Trim, True)
        ClassStage.UpdateUserJiring(Str(Val(dr(5)) - Val(dr(8))).Trim, Session("MY-UsErNaMe"))
        'درج در جدول گردش جیرینگی کاربران
        ClassStage.InsertCycleJiring(Session("CodeService"), Session("MY-UsErNaMe"))
        Session.Remove("CodeService")
        'شخصیت سوم
        ClassCharacter3.Insert_Charaacter3_Users(Session("CodeService"), String.Format("{0}  با خرید سرویس حسابت به مبلغ {1} کاهش پیدا کرد و مانده حسابت در حال حاضر {2} جیرینگ می باشه. موفق باشی رفیق من ", ClassProfile_Section.GetFnLn(Session("MY-UsErNaMe")), Str(Val(dr(5)) - Val(dr(8))).Trim, ClassStage.GetJiringByEmail(Session("MY-UsErNaMe"))), "DJ", True)
        ''''''''' 
        ScriptManager.RegisterStartupScript(Me, Me.GetType, "", "Close();", True)

    End Sub

    Public Sub Detail(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim dr As DataRow = ClassStage.SelectRow_Jiring_Service(e.CommandArgument)
        lblDetailService.Text = dr(2)
        'Page.ClientScript.RegisterStartupScript(Me.GetType, "alert", "Modal2();", True) 'Run JQuery Function
        ScriptManager.RegisterStartupScript(Me, Me.GetType, "", "Modal2();", True)
    End Sub

End Class
