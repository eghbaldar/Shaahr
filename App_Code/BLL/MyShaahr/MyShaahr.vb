Imports Microsoft.VisualBasic

Public Class MyShaahr

    Dim DS_CMS_Contact As New DS_MyShaahrTableAdapters.CMS_ContactTableAdapter

    Public Function InsertCMSContact(ByVal FnLn As String, ByVal email As String, _
                                     ByVal tell As String, ByVal Group As String, ByVal cuase As String, ByVal ip As String, ByVal Part As Byte) As Boolean
        Try
            'Part = 0 ---> شهر
            'Part = 1 ---> اس ام اس
            'Part = 2 ---> کتابخانه
            'Part = 3 ---> نرم افزار
            DS_CMS_Contact.InsertContact(FnLn, email, tell, Group, cuase, 0, ip, _
                                         ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate), Now.TimeOfDay.ToString.Substring(0, 8), Part)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

End Class
