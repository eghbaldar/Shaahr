
Partial Class Management_Admin_Country_State_Citys
    Inherits System.Web.UI.Page

    Dim ClassLocation As New CMS_Location

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "مدیریت شهر دات کام - مدیریت مناطق"
    End Sub

    Protected Sub btnInsertCountry_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertCountry.Click
        If txtCountry.Text <> "" Then
            ClassLocation.InsertCountry(txtCountry.Text)
            DG_Country.DataBind()
        End If
    End Sub

    Protected Sub btnInsertState_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertState.Click
        Try
            If DG_Country.SelectedValue.ToString <> "" And txtState.Text <> "" Then
                ClassLocation.InsertState(DG_Country.SelectedValue, txtState.Text)
                DG_State.DataBind()
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub btnInsertCity_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertCity.Click
        Try
            If DG_State.SelectedValue.ToString <> "" And txtCity.Text <> "" Then
                ClassLocation.InsertCity(DG_State.SelectedValue, txtCity.Text)
                DG_Citys.DataBind()
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DeleteCountry(ByVal Sender As Object, ByVal e As CommandEventArgs)
        ClassLocation.DeleteLocation(e.CommandArgument, 1)
        DG_Country.DataBind()
    End Sub

    Protected Sub DeleteState(ByVal Sender As Object, ByVal e As CommandEventArgs)
        ClassLocation.DeleteLocation(e.CommandArgument, 2)
        DG_State.DataBind()
    End Sub

    Protected Sub DeleteCity(ByVal Sender As Object, ByVal e As CommandEventArgs)
        ClassLocation.DeleteLocation(e.CommandArgument, 3)
        DG_Citys.DataBind()
    End Sub

End Class
