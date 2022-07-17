Imports System.Data.SqlClient
Imports System.Data

Partial Class Management_Admin_StatementSecurity
    Inherits System.Web.UI.Page

    Dim ClassProfile As New View_Users
    Dim ClassProfile_Section As New View_Users_Sections
    Dim ClassProfileHome As New HomeProfile
    Dim ClassHomeSetting As New HomeSetting
    Dim ClassOnline As New Online
    Dim ClassStage As New Stage
    Dim ClassUserManagement As New CMS_UserManagement

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "مدیریت شهر دات کام - مدیریت جملات امنیتی"
        fill()
    End Sub

    Private Sub fill()

        Dim sqlconn As New SqlConnection(ConfigurationManager.ConnectionStrings("shaahrConnectionString").ConnectionString)
        Dim sqlcom As New SqlCommand
        sqlcom.Connection = sqlconn
        If txt.Text = "" Then
            sqlcom.CommandText = "select * from tbl_Profile_Scure_Statement"
        ElseIf txt.Text <> "" Then
            sqlcom.CommandText = "select * from tbl_Profile_Scure_Statement where cast([text] as nvarchar) like '%" & txt.Text & "%' order by id desc"
        End If
        Dim sqlda As New SqlDataAdapter(sqlcom)
        Dim ds As New DataSet
        sqlconn.Open()
        sqlda.Fill(ds)
        Dg.DataSource = ds.Tables(0)
        Dg.DataBind()
        sqlconn.Close()

    End Sub

    Protected Sub btn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn.Click
        fill()
    End Sub

End Class
