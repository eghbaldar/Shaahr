Imports Microsoft.VisualBasic
Imports System.Data

Public Class CMS_Nazmie

    Dim CMS_Query As New DS_CMS_NazmieTableAdapters.Query
    Dim CMS_CategoryNews As New DS_CMS_NazmieTableAdapters.Nazmie_Category_NewsTableAdapter
    Dim CMS_News As New DS_CMS_NazmieTableAdapters.Nazmie_NewsTableAdapter
    Dim CMS_Law As New DS_CMS_NazmieTableAdapters.Nazmie_LawTableAdapter
    Dim CMS_RailUser As New DS_CMS_NazmieTableAdapters.Nazmie_RailUsersTableAdapter
    Dim CMS_Suspention As New DS_CMS_NazmieTableAdapters.Nazmie_SuspensionUsersTableAdapter
    Dim CMS_Complement As New DS_CMS_NazmieTableAdapters.Nazmie_ComplementTableAdapter
    Dim CMS_Detective As New DS_CMS_NazmieTableAdapters.Nazmie_DetectiveTableAdapter
    Dim CMS_Detective_Report As New DS_CMS_NazmieTableAdapters.Nazmie_Report_DetectiveTableAdapter
    Dim CMS_Report_Guest As New DS_CMS_NazmieTableAdapters.Nazmie_Report_GuestsTableAdapter
    'Category News

    Public Function InsertCategoryNews(ByVal NameCategory As String) As Boolean
        Try
            CMS_CategoryNews.InsertCategory(NameCategory)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteCategoryNews(ByVal CodeCategory As String) As Boolean
        Try
            CMS_CategoryNews.DeleteCategory(CodeCategory)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateCategoryNews(ByVal NameCategory As String, ByVal CodeCategory As Long) As Boolean
        Try
            CMS_CategoryNews.UpdateCategory(NameCategory, CodeCategory)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function SelectRow_CategoryNews(ByVal CodeCategory As Long) As DataTable
        Try
            Return CMS_CategoryNews.Select_Row(CodeCategory)
        Catch ex As Exception
        End Try
    End Function

    'News

    Public Function InsertNews(ByVal CodeCategory As Long, ByVal title As String, ByVal lid_news As String, ByVal news As String) As Boolean
        Try
            CMS_News.InsertNews(CodeCategory, title, lid_news, news, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.LongDate), Now.TimeOfDay.ToString.Substring(0, 8), 1)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteNews(ByVal id As Long) As Boolean
        Try
            CMS_News.DeleteNews(id)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateNews(ByVal CodeCategory As Long, ByVal title As String, ByVal lid_news As String, ByVal news As String, ByVal flag As Boolean _
                               , ByVal id As Long) As Boolean
        Try
            CMS_News.UpdateNews(CodeCategory, title, lid_news, news, flag, id)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function SelectRow_News(ByVal id As Long) As DataTable
        Try
            Return CMS_News.Select_Row(id)
        Catch ex As Exception
        End Try
    End Function

    'Law

    Public Function InsertLaw(ByVal subject As String, ByVal detail As String, ByVal type As Byte) As Boolean
        Try
            CMS_Law.InsertLaw(subject, detail, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate), type)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteLaw(ByVal code As Long) As Boolean
        Try
            CMS_Law.DeleteLaw(code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateLaw(ByVal subject As String, ByVal detail As String, ByVal type As Byte, ByVal code As Long) As Boolean
        Try
            CMS_Law.UpdateLaw(subject, detail, type, code)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function SelectRow_Law(ByVal code As Long) As DataTable
        Try
            Return CMS_Law.Select_Row(code)
        Catch ex As Exception
        End Try
    End Function

    'Rail

    Public Function CountRailsUser(ByVal email As String) As String
        Return CMS_Query.CountRailsUsers(email)
    End Function

    Public Function InsertRailUser(ByVal email As String, ByVal codeCrime As Long, ByVal cuase As String, ByVal byHow As String) As Boolean
        Try
            CMS_RailUser.InsertRailUser(email, codeCrime, cuase, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate), byHow)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetSubjectLawByCode(ByVal code As Long) As String
        Return CMS_Query.GetSubjectLawByCode(code)
    End Function

    Public Function DeleteRailUser(ByVal ID As Long) As Boolean
        Try
            CMS_RailUser.DeleteRailUser(ID)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    'Suspention`

    Public Function InsertSuspention(ByVal email As String, ByVal Type As Byte, ByVal ByHow As String, ByVal DateStart As String, _
                                     ByVal DateEnd As String, ByVal cuase As String, ByVal flag As Boolean) As Boolean
        Try
            CMS_Suspention.InsertSuspension(email, Type, ByHow, DateStart, DateEnd, cuase, flag)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteSuspention(ByVal ID As Long) As Boolean
        Try
            CMS_Suspention.DeleteSuspension(ID)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateBand(ByVal Band As Boolean, ByVal Band_Date As String, ByVal email As String) As Boolean
        Try
            CMS_Query.UpdateBand(Band, Band_Date, email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function Select_RowSuspention(ByVal email As String) As DataTable
        Return CMS_Suspention.Select_Row(email)
    End Function

    Public Function GetBandFromTableOrginal(ByVal email As String) As String
        Return CMS_Query.GetBand_From_TableOrginal(email)
    End Function

    Public Function GetBand(ByVal email As String) As String
        Return CMS_Query.GetBand(email)
    End Function

    'Orginal Setting

    Public Function SelectComplement() As DataTable
        Return CMS_Complement.GetData
    End Function

    Public Function UpdateComplement(ByVal Status_Detective_Register As Boolean, ByVal Jiring_ReportUsers As String, ByVal Jiring_ReportDetectice As String) As Boolean
        Try
            CMS_Complement.UpdateComplement(Status_Detective_Register, Jiring_ReportUsers, Jiring_ReportDetectice)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    'Detective And Reports

    Public Function DeleteDetevtive(ByVal id As Long) As Boolean
        Try
            CMS_Detective.DeleteDetective(id)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateDetevtiveAllow(ByVal Allow As Boolean, ByVal email As String) As Boolean
        Try
            CMS_Detective.UpdateDetectiveAllow(Allow, email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateDetevtiveFinded(ByVal Find As Integer, ByVal email As String) As Boolean
        Try
            CMS_Detective.UpdateDetectiveFinded(Find, email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetSubjectCrime(ByVal code As Long) As String
        Return CMS_Query.GetSubjectCrime(code)
    End Function

    ''' <param name="ID"></param>
    ''' <param name="index">Index=True > Accept Report,Index=False > Deny Report</param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function UpdateCheckedReportDetective(ByVal ID As Long, ByVal index As Boolean) As Boolean
        Try
            Select Case index
                Case True
                    CMS_Detective_Report.UpdateChecked(1, ID)
                Case False
                    CMS_Detective_Report.UpdateChecked(0, ID)
            End Select

            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteReportDetective(ByVal id As Long) As Boolean
        Try
            CMS_Detective_Report.DeleteReport(id)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function UpdateVisibleReportDetective(ByVal ID As Long, ByVal Visible As Boolean) As Boolean
        Try
            CMS_Detective_Report.Updatevisible(Visible, ID)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteDetectiveByEmail(ByVal email As String) As Boolean
        Try
            CMS_Detective.DeleteDetecticeByEmail(email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    'Users and Guset and Reports

    Public Function UpdateCheckedReport(ByVal ID As Long, ByVal flag As Boolean) As Boolean
        Try
            CMS_Report_Guest.UpdateChecked(flag, ID)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteReport(ByVal id As Long) As Boolean
        Try
            CMS_Report_Guest.DeleteReport(id)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

End Class
