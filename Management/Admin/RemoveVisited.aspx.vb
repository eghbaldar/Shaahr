Imports System.Data.SqlClient
Imports System.Data

Partial Class Management_Admin_RemoveVisited
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Title = "حذفیات ملاقات ها"
        lblCount.Text = 0
        lblCountSorena.Text = 0
        '-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'-'

        FillVisit()
        FillSorena()

    End Sub

    Private Sub FillVisit()

        Dim sqlcnn As New SqlConnection(ConfigurationManager.ConnectionStrings("shaahrConnectionString").ConnectionString)
        sqlcnn.Open()
        Dim sqlcom As New SqlCommand("select * from tbl_Profile_visit", sqlcnn)
        Dim r As SqlDataReader
        r = sqlcom.ExecuteReader
        While r.Read
            ''''''''''''''''''''
            Dim S() As String
            S = diffDate(r(3), ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate)).Split(":")
            'S(0) --> Month
            'S(1) --> Day
            If S(0) > 0 Or S(1) > 6 Then 'از یک ماه گذشته   'از یک هفته گذشته
                lblCount.Text += 1
            End If
            ''''''''''''''''''''
        End While
        sqlcnn.Close()

    End Sub

    Private Sub FillSorena()

        Dim lst As String
        Dim sqlda As New SqlDataAdapter
        Dim ds As New DataSet
        Dim sqlcnn As New SqlConnection(ConfigurationManager.ConnectionStrings("shaahrConnectionString").ConnectionString)
        sqlcnn.Open()
        Dim sqlcom As New SqlCommand("select * from tbl_Profile_Orginal", sqlcnn)
        Dim r As SqlDataReader
        r = sqlcom.ExecuteReader
        While r.Read
            ''''''''''''''''''''
            Dim S() As String
            S = diffDate(r(6), ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate)).Split(":")
            'S(0) --> Month
            'S(1) --> Day
            If S(0) > 0 Or S(1) > 6 Then 'از یک ماه گذشته   'از یک هفته گذشته
                lst += "'" + r(3).ToString + "',"
            End If
            ''''''''''''''''''''
        End While
        r.Close()
        lst = lst.Substring(0, lst.Length - 1)

        sqlcom.CommandText = "select count(*) from tbl_Profile_Character3_Users where email in (" + lst + ")"
        sqlda.SelectCommand = sqlcom
        sqlda.Fill(ds)
        lblCountSorena.Text = ds.Tables(0).Rows(0)(0).ToString

        sqlcnn.Close()


    End Sub

    ''' <summary>
    ''' اختلاف بین تاریخ ها
    ''' </summary>
    ''' <param name="DateSmall">تاریخ کوچکتر</param>
    ''' <param name="DateBig">تاریخ بزرگتر مثل تاریخ جاری سیستم</param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function diffDate(ByVal DateSmall As String, ByVal DateBig As String) As String

        Dim ta1, ta2, ta3 As Integer
        Dim tb1, tb2, tb3 As Integer
        Dim s, d As Double
        If Val(DateSmall) = 0 Or DateSmall = "" Or Val(DateBig) = 0 Or DateBig = "" Then diffDate = " " : Exit Function
        s = Val(DateSmall)
        d = Val(DateBig)
        If s > d Then DateBig = s : DateSmall = d 'درصورتيکه تاريخ انتها کوچکتر از ابتدا وارد گردد اين تابع موقتا جاي آنها را بصورت خودکار تغيير و ادامه مراحل محاسبه را انجام مي دهد

        Dim arr1() As String = DateSmall.Split("/")
        Dim arr2() As String = DateBig.Split("/")

        ta1 = arr1(0)
        ta2 = arr1(1)
        ta3 = arr1(2)

        tb1 = arr2(0)
        tb2 = arr2(1)
        tb3 = arr2(2)

        If tb3 < ta3 Then
            tb3 = tb3 + Int(IIf(tb2 < 7, 31, 30))
            tb2 = tb2 - 1
        End If
        If tb2 = 0 Or tb2 < ta2 Then
            tb2 = tb2 + 12
            tb1 = tb1 - 1
        End If

        diffDate = (tb2 - ta2).ToString + ":" + (tb3 - ta3).ToString
        'diffDate = GetFigures((tb1 - ta1)) & "سال و" & GetFigures((tb2 - ta2)) & "ماه و" & GetFigures((tb3 - ta3)) & "روز "

    End Function

    Protected Sub btnRemoveAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRemoveAll.Click

        Try

            Dim lst As String
            Dim sqlda As New SqlDataAdapter
            Dim ds As New DataSet
            Dim sqlcnn As New SqlConnection(ConfigurationManager.ConnectionStrings("shaahrConnectionString").ConnectionString)
            sqlcnn.Open()
            Dim sqlcom As New SqlCommand("select * from tbl_Profile_visit", sqlcnn)
            Dim r As SqlDataReader
            r = sqlcom.ExecuteReader
            While r.Read
                ''''''''''''''''''''
                Dim S() As String
                S = diffDate(r(3), ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate)).Split(":")
                'S(0) --> Month
                'S(1) --> Day
                If S(0) > 0 Or S(1) > 6 Then 'از یک ماه گذشته   'از یک هفته گذشته
                    lst += r(0).ToString + ","
                End If
                ''''''''''''''''''''
            End While
            r.Close()
            lst = lst.Substring(0, lst.Length - 1)

            sqlcom.CommandText = "delete from tbl_Profile_visit where ID in (" + lst + ")"
            sqlda.SelectCommand = sqlcom
            sqlda.Fill(ds)

            sqlcnn.Close()

        Catch ex As Exception
            Response.Write("Errorrrrrrrrrrrrr")
        End Try

    End Sub

    Protected Sub btnRemoveAllSorena_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRemoveAllSorena.Click

        Try

            Dim lst As String
            Dim sqlda As New SqlDataAdapter
            Dim ds As New DataSet
            Dim sqlcnn As New SqlConnection(ConfigurationManager.ConnectionStrings("shaahrConnectionString").ConnectionString)
            sqlcnn.Open()
            Dim sqlcom As New SqlCommand("select * from tbl_Profile_Orginal", sqlcnn)
            Dim r As SqlDataReader
            r = sqlcom.ExecuteReader
            While r.Read
                ''''''''''''''''''''
                Dim S() As String
                S = diffDate(r(6), ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate)).Split(":")
                'S(0) --> Month
                'S(1) --> Day
                If S(0) > 0 Or S(1) > 6 Then 'از یک ماه گذشته   'از یک هفته گذشته
                    lst += "'" + r(3).ToString + "',"
                End If
                ''''''''''''''''''''
            End While
            r.Close()
            lst = lst.Substring(0, lst.Length - 1)

            sqlcom.CommandText = "delete from tbl_Profile_Character3_Users where email in (" + lst + ")"
            sqlda.SelectCommand = sqlcom
            sqlda.Fill(ds)

            sqlcnn.Close()

        Catch ex As Exception
            Response.Write("Errorrrrrrrrrrrrr")
        End Try

    End Sub

End Class

