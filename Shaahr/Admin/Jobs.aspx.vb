
Partial Class Shaahr_Admin_Default2
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage
    Dim ClassShaahr As New Shaahr

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Select Case Request.QueryString("job")

            Case "0"
                MultiView.ActiveViewIndex = 0
                Title = String.Format("پنل ریاست جمهوری - {0}", ClassProfile_Section.GetFnLn(ClassProfile.getEmailByUsername(Request.QueryString("user"))))
            Case "01"
                MultiView.ActiveViewIndex = 1
                Title = String.Format("پنل معاونین ریاست جمهوری - {0}", ClassProfile_Section.GetFnLn(ClassProfile.getEmailByUsername(Request.QueryString("user"))))
            Case "02"
                MultiView.ActiveViewIndex = 1
                Title = String.Format("پنل معاونین ریاست جمهوری - {0}", ClassProfile_Section.GetFnLn(ClassProfile.getEmailByUsername(Request.QueryString("user"))))

            Case "1"
                MultiView.ActiveViewIndex = 2
                Title = String.Format("پنل استانداری استان اول - {0}", ClassProfile_Section.GetFnLn(ClassProfile.getEmailByUsername(Request.QueryString("user"))))
            Case "11"
                MultiView.ActiveViewIndex = 3
                Title = String.Format("پنل معاونین استانداری استان اول - {0}", ClassProfile_Section.GetFnLn(ClassProfile.getEmailByUsername(Request.QueryString("user"))))
            Case "12"
                MultiView.ActiveViewIndex = 3
                Title = String.Format("پنل معاونین استانداری استان اول - {0}", ClassProfile_Section.GetFnLn(ClassProfile.getEmailByUsername(Request.QueryString("user"))))

            Case "2"
                MultiView.ActiveViewIndex = 2
                Title = String.Format("پنل استانداری استان دوم - {0}", ClassProfile_Section.GetFnLn(ClassProfile.getEmailByUsername(Request.QueryString("user"))))
            Case "21"
                MultiView.ActiveViewIndex = 3
                Title = String.Format("پنل معاونین استانداری استان دوم - {0}", ClassProfile_Section.GetFnLn(ClassProfile.getEmailByUsername(Request.QueryString("user"))))
            Case "22"
                MultiView.ActiveViewIndex = 3
                Title = String.Format("پنل معاونین استانداری استان دوم - {0}", ClassProfile_Section.GetFnLn(ClassProfile.getEmailByUsername(Request.QueryString("user"))))

            Case "3"
                MultiView.ActiveViewIndex = 2
                Title = String.Format("پنل استانداری استان سوم - {0}", ClassProfile_Section.GetFnLn(ClassProfile.getEmailByUsername(Request.QueryString("user"))))
            Case "31"
                MultiView.ActiveViewIndex = 3
                Title = String.Format("پنل معاونین استانداری استان سوم - {0}", ClassProfile_Section.GetFnLn(ClassProfile.getEmailByUsername(Request.QueryString("user"))))
            Case "32"
                MultiView.ActiveViewIndex = 3
                Title = String.Format("پنل معاونین استانداری استان سوم - {0}", ClassProfile_Section.GetFnLn(ClassProfile.getEmailByUsername(Request.QueryString("user"))))

            Case "4"
                MultiView.ActiveViewIndex = 2
                Title = String.Format("پنل استانداری استان چهارم - {0}", ClassProfile_Section.GetFnLn(ClassProfile.getEmailByUsername(Request.QueryString("user"))))
            Case "41"
                MultiView.ActiveViewIndex = 3
                Title = String.Format("پنل معاونین استانداری استان چهارم - {0}", ClassProfile_Section.GetFnLn(ClassProfile.getEmailByUsername(Request.QueryString("user"))))
            Case "42"
                MultiView.ActiveViewIndex = 3
                Title = String.Format("پنل معاونین استانداری استان چهارم - {0}", ClassProfile_Section.GetFnLn(ClassProfile.getEmailByUsername(Request.QueryString("user"))))

            Case "5"
                MultiView.ActiveViewIndex = 2
                Title = String.Format("پنل استانداری استان پنجم - {0}", ClassProfile_Section.GetFnLn(ClassProfile.getEmailByUsername(Request.QueryString("user"))))
            Case "51"
                MultiView.ActiveViewIndex = 3
                Title = String.Format("پنل معاونین استانداری استان پنجم - {0}", ClassProfile_Section.GetFnLn(ClassProfile.getEmailByUsername(Request.QueryString("user"))))
            Case "52"
                MultiView.ActiveViewIndex = 3
                Title = String.Format("پنل معاونین استانداری استان پنجم - {0}", ClassProfile_Section.GetFnLn(ClassProfile.getEmailByUsername(Request.QueryString("user"))))

        End Select
    End Sub

End Class
