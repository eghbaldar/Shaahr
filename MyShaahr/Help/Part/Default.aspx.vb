
Partial Class MyShaahr_Help_Part_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Select Case Request.QueryString("Part")
            Case "DUsers"
                Title = "راهنمای بخش درجه شهروندی"
                lblTitle.Text = "بخش درجه شهروندی"
        End Select

    End Sub

End Class
