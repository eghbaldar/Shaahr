Imports System.Data

Partial Class Management_Admin_newsCom
    Inherits System.Web.UI.Page

    Dim ClassNews As New CMS_News
    Private Shared ID As Long

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Try
            If Not IsPostBack Then
                Title = "جزییات خبر"
                Dim dr As DataRow = ClassNews.SelectRowNews(Request.QueryString("id"))
                ID = dr(0)
                Title = dr(1)
                txtTitle.Text = dr(1)
                txtBreif.Text = dr(2)
                FCKeditor.Value = dr(3)
                lblDate.Text = dr(4)
                lblTime.Text = dr(5)
                chk.Checked = IIf(dr(6) = False, False, True)
                lblUsername.Text = dr(7)

                Select Case dr(9)
                    Case 0
                        rbType.Items(0).Selected = True
                    Case 1
                        rbType.Items(1).Selected = True
                End Select

            End If
        Catch ex As Exception
        End Try

    End Sub

    Protected Sub btnInsertNews_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnInsertNews.Click
        ClassNews.UpdateNews(txtTitle.Text, txtBreif.Text, FCKeditor.Value, chk.Checked, cmb_Category.SelectedValue, ID, rbType.SelectedValue)
    End Sub

End Class