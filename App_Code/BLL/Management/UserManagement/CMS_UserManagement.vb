Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class CMS_UserManagement

    Dim DS_Query As New DS_CMS_UserManagementTableAdapters.Query
    Dim DS_Information As New DS_CMS_UserManagementTableAdapters.Profile_InformationTableAdapter
    Dim DS_InboxSystem As New DS_CMS_UserManagementTableAdapters.Profile_InboxSystemTableAdapter
    Dim DS_UsersFiltering As New DS_CMS_UserManagementTableAdapters.CMS_UsersFilteringTableAdapter

    Public Function GetInformaion(ByVal email As String) As DataRow
        Return DS_Information.GetData(email).Rows(0)
    End Function

    Public Function GetCountRelationship(ByVal email As String, ByVal index As Byte) As String
        Select Case index
            Case 0
                Return DS_Query.getCountFriend(email)
            Case 1
                Return DS_Query.getCountBastegan(email)
            Case 2
                Return 0
        End Select
    End Function

    Public Function GetStarNum(ByVal email As String) As String
        Return DS_Query.getStarNum(email)
    End Function

    Public Function UpdateStarNum(ByVal Num As String, ByVal email As String) As Boolean
        Try
            DS_Query.UpdateStarNum(Num, email)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function GetWife(ByVal email As String) As String
        Return DS_Query.getWife(email)
    End Function

    Public Function DeleteRelation(ByVal email As String, ByVal user As String) As Boolean
        DS_Query.Delete_Relation_1(email, user)
        DS_Query.Delete_Relation_2(email, user)
    End Function

    Public Function InsertSystemInbox(ByVal Email As String, ByVal Suject As String, ByVal MSG As String) As Boolean
        Try
            DS_InboxSystem.Insert_SystemInbox(Email, ShamsiDate.Miladi2Shamsi(Now, ShamsiDate.ShowType.ShortDate), Now.TimeOfDay.ToString.Substring(0, 8), Suject, MSG)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Public Function DeleteSystemInbox(ByVal id As Long) As Boolean
        Try
            DS_InboxSystem.DeleteInboxSystem(id)
            Return True
        Catch ex As Exception
            Return False
        End Try

    End Function

    Public Function GetCountUsers() As String
        Return DS_Query.getCountUsers
    End Function

    '--------------------------------------------------------- Filtering User

    Public Function GetEmailByFiltering(ByVal username As String, ByVal email As String, ByVal band As String, ByVal alias_ As String, _
                                        ByVal fn_f As String, ByVal ln_f As String, ByVal fn_e As String, ByVal ln_e As String, _
                                        ByVal sex As String, ByVal marrid_single As String, ByVal birth_year As String, ByVal birth_month As String, _
                                        ByVal birth_day As String, ByVal birth_time As String, ByVal sen As String, ByVal religion As String, _
                                        ByVal mazhab As String, ByVal education As String, ByVal code_country As String, ByVal code_state As String, _
                                        ByVal code_city As String, ByVal Foriegn_lanuage As String, ByVal poletic As String, ByVal dodi As String) As DataSet

        Dim sqlconn As New SqlConnection(ConfigurationManager.ConnectionStrings("shaahrConnectionString").ConnectionString.ToString)
        Dim sqlcom As New SqlCommand("execute CMS_UsersFiltering '" + username + "','" + email + "','" + band + "','" + alias_ + "','" + fn_f + "','" + ln_f + "','" + fn_e + _
                                     "','" + ln_e + "','" + sex + "','" + marrid_single + "','" + birth_year + "','" + birth_month + "','" + birth_day + "','" _
                                     + birth_time + "','" + sen + "','" + religion + "','" + mazhab + _
                                     "','" + education + "','" + code_country + "','" + code_state + "','" + code_city + "','" + Foriegn_lanuage + "','" _
                                     + poletic + "','" + dodi + "'", sqlconn)
        Dim sqlda As New SqlDataAdapter(sqlcom)
        Dim ds As New DataSet
        sqlconn.Open()
        sqlda.Fill(ds)
        Return ds
        sqlconn.Close()

        'Return "execute CMS_UsersFiltering '" + username + "','" + email + "','" + band + "','" + alias_ + "','" + fn_f + "','" + ln_f + "','" + fn_e + _
        '                             "','" + ln_e + "','" + sex + "','" + marrid_single + "','" + birth_year + "','" + birth_month + "','" + birth_day + "','" _
        '                             + birth_time + "','" + sen + "','" + religion + "','" + mazhab + _
        '                             "','" + education + "','" + code_country + "','" + code_state + "','" + code_city + "','" + Foriegn_lanuage + "','" _
        '                             + poletic + "','" + dodi + "'"

    End Function

    Public Function SetBindingByFiltering(ByVal Emails As String) As DataSet

        Dim sqlconn As New SqlConnection(ConfigurationManager.ConnectionStrings("shaahrConnectionString").ConnectionString.ToString)
        Dim sqlcom As New SqlCommand("select I.fn_f+' '+I.ln_f,A.picpath from tbl_Profile_information I,tbl_profile_avatars A where I.email in (" + Emails + ") and A.email in (" + Emails + ") and A.flag=1 and I.email=A.email", sqlconn)
        Dim sqlda As New SqlDataAdapter(sqlcom)
        Dim ds As New DataSet
        sqlconn.Open()
        sqlda.Fill(ds)
        Return ds
        sqlconn.Close()

    End Function
   
    '--------------------------------------------------------- 


End Class
