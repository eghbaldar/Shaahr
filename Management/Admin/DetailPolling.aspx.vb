
Partial Class Management_Admin_DetailPolling
    Inherits System.Web.UI.Page

    Dim ClassCharacter3 As New Character3

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Title = "مدیریت شهر دات کام - جزییات نظرسنجی"
        lblCountAllVoter.Text = String.Format("تعداد شرکت کنندگان: {0}", ClassCharacter3.GetCountVoting(Request.QueryString("CodePolling")))
    End Sub

    Public Function Perect(ByVal Column1 As Object, ByVal Option_ As String) As String

        Dim perect_ As Integer = Val(Column1.ToString.Substring(0, Column1.ToString.Length - 1))
        Dim ret As String = ""
        If perect_.ToString <> "0" Then
            ret = "<div style='float:right;background-color:white;border:1px solid #ccc;padding:2px;-moz-border-radius: 3px; '>"
            ret += "<div style='padding:3px;height:7px;width:" & Val(perect_ * 2) & "px;background-color:#ACD7F2;color:black;float:right;'>"
            ret += "</div>"
            ret += "<div style='float:right;color:#7F7F7F;'>" & String.Format("{1}  {0}", Option_.ToString, "%" + Str(Val(perect_))) & "</div>"
            ret += "</div>"
        Else
            'صفر درصد
            ret = "<div style='float:right;background-color:white;border:1px solid #ccc;padding:2px;-moz-border-radius: 3px; '>"
            ret += "<div style='padding:3px;height:7px;color:black;float:right;'>"
            ret += "</div>"
            ret += "<div style='float:right;color:#7F7F7F;'>" & String.Format("{1}  {0}", Option_.ToString, "%" + Str(Val(perect_))) & "</div>"
            ret += "</div>"
        End If
        Return ret

    End Function

    Public Sub GotoToUser(ByVal sender As Object, ByVal e As CommandEventArgs)
        Response.Redirect("UserAttrib.aspx?email=" + e.CommandArgument)
    End Sub


End Class
