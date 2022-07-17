
Partial Class Stage_Nazmie_raw
    Inherits System.Web.UI.Page

    Protected Sub ODS_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles ODS.Selecting
        Select Case Request.QueryString("law")
            Case "law"
                e.InputParameters("type") = 1
                Title = "قوانین کلی - شهر"
            Case "crime"
                e.InputParameters("type") = 2
                Title = "عناوین جرم و تخلفات - شهر"
            Case "warring"
                e.InputParameters("type") = 3
                Title = "هشدار های پیشگیرانه - شهر"
        End Select
    End Sub

    Public Function SetImg(ByVal type As Object) As String
        Select Case type.ToString
            Case 1
                Return "../../content/images/Stage/Nazmie/Ico_raw.png"
            Case 2
                Return "../../content/images/Stage/Nazmie/Ico_wrong.png"
            Case 3
                Return "../../content/images/Stage/Nazmie/Ico_PreOccure.png"
        End Select
    End Function

End Class

