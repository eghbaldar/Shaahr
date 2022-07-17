Imports Microsoft.VisualBasic

Public Class CMS_Login

    'Dim DS_Admin As New DS_CMS_LoginTableAdapters.CMS_AdminTableAdapter
    Dim DS_Admin As New DS_CMS_LoginTableAdapters.CMS_AdminTableAdapter

    Public Function CheckUsernamePassword(ByVal user As String, ByVal pass As String) As Boolean
        Try
            Dim Encrypt As New Encryptor
            Dim Password As String = Encrypt.EncryptText(pass, "GOD_mohammad_60592110128")
            If DS_Admin.CheckUsernamePassword(user, Password) > 0 Then
                Return True
            Else
                Return False
            End If
        Catch ex As Exception
            Return False
        End Try
    End Function

End Class
