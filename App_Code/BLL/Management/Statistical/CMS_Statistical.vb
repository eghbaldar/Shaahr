Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class CMS_Statistical

    Dim DS_Query As New DS_CMS_StatisticalTableAdapters.Query
    Dim DS_Statistical As New DS_CMS_StatisticalTableAdapters.Profile_EnterStatisticalTableAdapter

    Public Function getCountToday(ByVal date_ As String) As String
        Return DS_Query.CountLoginToday(date_)
    End Function

    Public Function DeleteByID(ByVal ID As String) As String
        Return DS_Statistical.DeleteStatistical_ByID(ID)
    End Function

    Public Function SearchToday(ByVal IP As String, ByVal Email As String, ByVal Date_ As String) As DataTable

        Dim sqlconn As New SqlConnection(ConfigurationManager.ConnectionStrings("shaahrConnectionString").ConnectionString.ToString)
        Dim sqlcom As New SqlCommand("select * from tbl_Profile_EnterStatistical where IP like '%" + IP + "%' and Email like '%" + Email + "%' and datestart like '%" + Date_ + "%' ", sqlconn)
        Dim sqlda As New SqlDataAdapter(sqlcom)
        Dim ds As New DataSet
        sqlconn.Open()
        sqlda.Fill(ds)
        Return ds.Tables(0)
        sqlconn.Close()

    End Function

    Public Function getCountPost() As String
        Return DS_Query.getCountPost
    End Function

    Public Function getCountPostToday() As String
        Return DS_Query.getCountPostToday(ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate))
    End Function

    Public Function getCountPostByType(ByVal Type As Byte, ByVal date_ As String) As String
        Return DS_Query.getCountPostByType(Type, date_)
    End Function

    Public Function DeleteAllStaticstical() As Boolean
        Try
            DS_Statistical.DeleteAllStaticstical()
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteStaticsticalByDate(ByVal Date_ As String) As Boolean
        Try
            DS_Statistical.DeleteSpecialDateStaticstical(Date_)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetCountRegisterByDate(ByVal Date_ As String) As String
        Return DS_Query.getCountTodayRegister(Date_)
    End Function

End Class
