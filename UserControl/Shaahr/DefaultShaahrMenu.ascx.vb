
Partial Class UserControl_Shaahr_DefaultShaahrMenu
    Inherits System.Web.UI.UserControl

    Public Function TextMenu(ByVal index As String) As String
        Select Case index
            Case "ADD"
                Return "<div >درخواست تاسیس شهر خود را از این قسمت مطرح کنید</div>"
            Case "LAW"
                Return "<div >قوانین مربوط به شهرداری ها را می توانید از این بخش ملاحضه بفرمایید.</div>"
            Case "Rank"
                Return "<div >رتبه بندی شهر ها در این بخش قرار دارد.</div>"
            Case "SEARCH"
                Return "<div >در این بخش می توانید شهر های مورد نظر خود را جستجو کنید.</div>"
            Case "ENTER"
                Return "<div >ورود به پنل مدیریتی.</div>"
            Case "SHAAHRS"
                Return "<div >شهرداری های شهر دات کام.</div>"
        End Select
    End Function

    Protected Sub btnADD_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnADD.Click
        Response.Redirect("Admin\Establish.aspx")
    End Sub
    Protected Sub btnLaw_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnLaw.Click
        Response.Redirect("Admin/laws.aspx")
    End Sub
    Protected Sub btnRank_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnRank.Click
        Response.Redirect("Admin/rank.aspx")
    End Sub
    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSearch.Click
        Response.Redirect("Admin/SearchShaahrs.aspx")
    End Sub
    Protected Sub btnShaahr_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnShaahr.Click
        Response.Redirect("Admin/CategoryShaahrs.aspx")
    End Sub
    Protected Sub btnEnter_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnEnter.Click
        Response.Redirect("Admin/")
    End Sub

End Class
