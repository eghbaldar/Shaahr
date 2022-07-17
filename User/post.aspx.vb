Imports System.Data

Partial Class user_post
    Inherits System.Web.UI.Page
    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHomeSetting As New HomeSetting

    '--------------پاک شدنی ها
    'Dim em_me As String = "ali@y.y" 'karbari k darhale moshahedeye profile mibashad
    Dim em_owner As String  'karbari k dar profileash hastim

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        em_owner = ClassProfile.getEmailByUsername(Request.QueryString("user"))
        If em_owner = Nothing Then Response.Redirect("~\outscope\state.aspx?state=NoUser")
        Permission()
        Title = String.Format("پست های  {0}", ClassProfile_Section.GetFnLn(em_owner))
        'lblTitleInformation.Text = Title

    End Sub

    Private Sub Permission()

        Dim dr As DataRow = ClassHomeSetting.Permission(em_owner)
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        '''''''''''''''''''''''Update News ''''''''''''''''''''''
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Select Case dr(19)
            Case 0 'نمایش برای همه
            Case 1 'نمایش برای دوستانم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 1) And Not Session("MY-UsErNaMe") = em_owner Then
                    Response.Redirect("~\outscope\state.aspx?state=UserNoAllow")
                End If
            Case 2 'نمایش برای بستگان
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 2) And Not Session("MY-UsErNaMe") = em_owner Then
                    Response.Redirect("~\outscope\state.aspx?state=UserNoAllow")
                End If
            Case 3 'نمایش برای همسرم
                If ClassHomeSetting.Check_FriendFamilyWife(em_owner, Session("MY-UsErNaMe"), 3) And Not Session("MY-UsErNaMe") = em_owner Then
                    Response.Redirect("~\outscope\state.aspx?state=UserNoAllow")
                End If
            Case 4 'فقط من
                If Not (Session("MY-UsErNaMe") = em_owner) Then
                    Response.Redirect("~\outscope\state.aspx?state=UserNoAllow")
                End If
            Case 5 'هیچکس    
                Response.Redirect("~\outscope\state.aspx?state=UserNoAllow")
        End Select

    End Sub

    Protected Sub ODS_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS.Selecting
        e.InputParameters("email") = ClassProfile.getEmailByUsername(Request.QueryString("user"))
        e.InputParameters("for_who") = ClassProfile.getEmailByUsername(Request.QueryString("user"))
    End Sub

    Public Function ControlText(ByVal string_factor As Object) As String
        If string_factor.ToString().Length > 65 Then
            Return string_factor.ToString.Substring(0, 65) + "..."
        Else
            Return string_factor.ToString
        End If
    End Function

    Public Function ControlImage(ByVal Type As Object) As String
        Select Case Integer.Parse(Type)
            Case 0
                Return "~/content/images/Profile_View_Users/post_photo.png"
            Case 1
                Return "~/content/images/Profile_View_Users/post_link.png"
            Case 2
                Return "~/content/images/Profile_View_Users/post_post.png"
            Case 3
                Return "~/content/images/Profile_View_Users/post_polling.png"
        End Select
    End Function

    Public Sub DetailPost(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("DetailPost.aspx?code=" + e.CommandArgument + "&user=" + Request.QueryString("user"))
    End Sub

End Class



