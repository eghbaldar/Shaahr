Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Partial Class Management_Admin_FileManagement
    Inherits System.Web.UI.Page

    Dim ClassUserM As New CMS_UserManagement
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassProfileHome As New HomeProfile

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "مدیریت شهر دات کام - مدیریت فایل ها"
        AccCountAvatars()
        AccCountPhotoAlbum()
    End Sub

    Private Sub AccCountAvatars()
        Dim Files As New IO.DirectoryInfo(MapPath("~\Content\images\Profile\Avatars\"))
        lblCountAvatars.Text = String.Format("تعداد آواتارها کاربران: {0}", Files.GetFiles().Length.ToString)
    End Sub

    Private Sub AccCountPhotoAlbum()
        Dim Files As New IO.DirectoryInfo(MapPath("~\Content\images\Profile\Photo\"))
        lblCountPhotoAlbum.Text = String.Format("تعداد عکس های آلبوم ها: {0}", Files.GetFiles().Length.ToString)
    End Sub

    Public Function BorderColorPanel(ByVal flag As Object) As System.Drawing.Color
        If flag = 1 Then
            Return System.Drawing.ColorTranslator.FromHtml("#396e83")
        ElseIf flag = 0 Then
            Return System.Drawing.ColorTranslator.FromHtml("#ccc")
        End If
    End Function

    Public Function GetName(ByVal Email As Object) As String
        Return ClassProfile_Section.GetFnLn(Email.ToString)
    End Function

    Public Sub DeleteAvatar(ByVal Sender As Object, ByVal e As CommandEventArgs)

        Dim s() As String = e.CommandArgument.ToString.Split("|")
        File.Delete(MapPath("~\Content\images\Profile\Avatars\" + s(1)))
        ClassHomeSetting.DeleteAvatar(s(0))
        DG_Avatars.DataBind()

    End Sub

    Public Sub ShowAttrib(ByVal sender As Object, ByVal e As CommandEventArgs)
        Redirect("~/Management/Admin/UserAttrib.aspx?email=" + e.CommandArgument.ToString, "_blank", "")
    End Sub

    Public Shared Sub Redirect(ByVal url As String, ByVal target As String, ByVal windowFeatures As String)

        Dim context As HttpContext = HttpContext.Current
        If ([String].IsNullOrEmpty(target) OrElse target.Equals("_self", StringComparison.OrdinalIgnoreCase)) AndAlso [String].IsNullOrEmpty(windowFeatures) Then
            context.Response.Redirect(url)
        Else
            Dim page As Page = DirectCast(context.Handler, Page)
            If page Is Nothing Then
                Throw New InvalidOperationException("Cannot redirect to new window outside Page context.")
            End If
            url = page.ResolveClientUrl(url)
            Dim script As String
            If Not [String].IsNullOrEmpty(windowFeatures) Then
                script = "window.open(""{0}"", ""{1}"", ""{2}"");"
            Else
                script = "window.open(""{0}"", ""{1}"");"
            End If
            script = [String].Format(script, url, target, windowFeatures)
            ScriptManager.RegisterStartupScript(page, GetType(Page), "Redirect", script, True)
        End If

    End Sub

    Protected Sub ChkSHowAvatars_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ChkSHowAvatars.CheckedChanged
        If ChkSHowAvatars.Checked Then
            DG_Avatars.Visible = True
        End If
        If Not ChkSHowAvatars.Checked Then
            DG_Avatars.Visible = Not True
        End If
    End Sub

    Protected Sub ChkSHowPhoto_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ChkSHowPhoto.CheckedChanged
        If ChkSHowPhoto.Checked Then
            DG_Pictures.Visible = True
        End If
        If Not ChkSHowPhoto.Checked Then
            DG_Pictures.Visible = Not True
        End If
    End Sub

    Private Sub FillExpireAvatars()

        lblExpireAvatars.Text = ""
        Dim Files() As String = Directory.GetFiles(MapPath("~\Content\images\Profile\Avatars\"))
        Dim sqlconn As New SqlConnection(ConfigurationManager.ConnectionStrings("shaahrConnectionString").ConnectionString.ToString)
        Dim sqlcom As New SqlCommand("select * from tbl_Profile_Avatars", sqlconn)
        Dim rb As SqlDataReader
        Dim lst_PicPath As New List(Of String)
        sqlconn.Open()
        rb = sqlcom.ExecuteReader
        While rb.Read
            Dim infoPicPath As New FileInfo(rb(2))
            lst_PicPath.Add(infoPicPath.Name)
        End While
        sqlconn.Close()
        ''''''''''''''' 
        Dim lstResult As New List(Of String)
        For i As Long = 0 To Files.Length - 1
            For j As Long = 0 To lst_PicPath.Count - 1
                Dim infoFiles As New FileInfo(Files(i))
                If lst_PicPath(j).Trim.ToUpper = infoFiles.Name.Trim.ToUpper Then GoTo ali
            Next
            lstResult.Add(Files(i))
ali:
        Next
        ''''''''''''' Show
        For j As Long = 0 To lstResult.Count - 1
            Dim infoS As New FileInfo(lstResult(j))
            lblExpireAvatars.Text = lblExpireAvatars.Text + infoS.Name + "<br/>"
        Next
        If lblExpireAvatars.Text = String.Empty Then
            lblExpireAvatars.Text = "فایلی وجود ندارد."
        Else
            btnDeleteExpireAvatars.Enabled = True
        End If

    End Sub

    Protected Sub btnAccExpireFile_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAccExpireFile.Click
        FillExpireAvatars()
    End Sub

    Protected Sub btnDeleteExpireAvatars_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDeleteExpireAvatars.Click
        DeleteExpireAvatars()
    End Sub

    Private Sub DeleteExpireAvatars()

        Dim Files() As String = Directory.GetFiles(MapPath("~\Content\images\Profile\Avatars\"))
        Dim sqlconn As New SqlConnection(ConfigurationManager.ConnectionStrings("shaahrConnectionString").ConnectionString.ToString)
        Dim sqlcom As New SqlCommand("select * from tbl_Profile_Avatars", sqlconn)
        Dim rb As SqlDataReader
        Dim lst_PicPath As New List(Of String)
        sqlconn.Open()
        rb = sqlcom.ExecuteReader
        While rb.Read
            Dim infoPicPath As New FileInfo(rb(2))
            lst_PicPath.Add(infoPicPath.Name)
        End While
        sqlconn.Close()
        ''''''''''''''' 
        Dim lstResult As New List(Of String)
        For i As Long = 0 To Files.Length - 1
            For j As Long = 0 To lst_PicPath.Count - 1
                Dim infoFiles As New FileInfo(Files(i))
                If lst_PicPath(j).Trim.ToUpper = infoFiles.Name.Trim.ToUpper Then GoTo ali
            Next
            lstResult.Add(Files(i))
ali:
        Next
        ''''''''''''' Show
        For j As Long = 0 To lstResult.Count - 1
            Dim infoS As New FileInfo(lstResult(j))
            IO.File.Delete(MapPath("~\Content\images\Profile\Avatars\" + infoS.Name))
        Next
        lblExpireAvatars.Text = ""

    End Sub

    Protected Sub btnAccExpirePhoto_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAccExpirePhoto.Click
        FillExpirePhoto()
    End Sub

    Private Sub FillExpirePhoto()

        lblExpirePhoto.Text = ""
        Dim Files() As String = Directory.GetFiles(MapPath("~\Content\images\Profile\Photo\"))
        Dim sqlconn As New SqlConnection(ConfigurationManager.ConnectionStrings("shaahrConnectionString").ConnectionString.ToString)
        'Dim sqlcom As New SqlCommand("select O.string_factor from tbl_Profile_Picture_Album P,tbl_profile_objects O where O.for_who=P.email and O.type=0 and P.code_object=O.code", sqlconn)
        Dim sqlcom As New SqlCommand("select O.string_factor from tbl_profile_objects O where O.type=0 ", sqlconn)
        Dim rb As SqlDataReader
        Dim lst_PicPath As New List(Of String)
        sqlconn.Open()
        rb = sqlcom.ExecuteReader
        While rb.Read
            Dim infoPicPath As New FileInfo(rb(0))
            lst_PicPath.Add(infoPicPath.Name)
        End While
        sqlconn.Close()
        ''''''''''''''' 
        Dim lstResult As New List(Of String)
        For i As Long = 0 To Files.Length - 1
            For j As Long = 0 To lst_PicPath.Count - 1
                Dim infoFiles As New FileInfo(Files(i))                
                If lst_PicPath(j).Trim.ToUpper = infoFiles.Name.Trim.ToUpper Then GoTo ali
            Next
            lstResult.Add(Files(i))
ali:
        Next
        ''''''''''''' Show
        For j As Long = 0 To lstResult.Count - 1
            Dim infoS As New FileInfo(lstResult(j))
            lblExpirePhoto.Text = lblExpirePhoto.Text + infoS.Name + "<br/>"
        Next
        If lblExpirePhoto.Text = String.Empty Then
            lblExpirePhoto.Text = "فایلی وجود ندارد."
        Else
            btnDeleteExpirePhoto.Enabled = True
        End If

    End Sub

    Protected Sub btnDeleteExpirePhoto_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDeleteExpirePhoto.Click
        DeleteExpirePhoto()
    End Sub

    Private Sub DeleteExpirePhoto()

        Dim Files() As String = Directory.GetFiles(MapPath("~\Content\images\Profile\photo\"))
        Dim sqlconn As New SqlConnection(ConfigurationManager.ConnectionStrings("shaahrConnectionString").ConnectionString.ToString)
        'Dim sqlcom As New SqlCommand("select O.string_factor from tbl_Profile_Picture_Album P,tbl_profile_objects O where O.for_who=P.email and O.type=0 and P.code_object=O.code", sqlconn)
        'Dim sqlcom As New SqlCommand("select O.string_factor from tbl_profile_objects O where O.for_who=O.email and O.type=0 ", sqlconn)
        Dim sqlcom As New SqlCommand("select O.string_factor from tbl_profile_objects O where O.type=0 ", sqlconn)
        Dim rb As SqlDataReader
        Dim lst_PicPath As New List(Of String)
        sqlconn.Open()
        rb = sqlcom.ExecuteReader
        While rb.Read
            Dim infoPicPath As New FileInfo(rb(0))
            lst_PicPath.Add(infoPicPath.Name)
        End While
        sqlconn.Close()
        ''''''''''''''' 
        Dim lstResult As New List(Of String)
        For i As Long = 0 To Files.Length - 1
            For j As Long = 0 To lst_PicPath.Count - 1
                Dim infoFiles As New FileInfo(Files(i))
                If lst_PicPath(j).Trim.ToUpper = infoFiles.Name.Trim.ToUpper Then GoTo ali
            Next
            lstResult.Add(Files(i))
ali:
        Next
        ''''''''''''' Show
        For j As Long = 0 To lstResult.Count - 1
            Dim infoS As New FileInfo(lstResult(j))
            IO.File.Delete(MapPath("~\Content\images\Profile\photo\" + infoS.Name))
        Next
        lblExpirePhoto.Text = ""

    End Sub

End Class
