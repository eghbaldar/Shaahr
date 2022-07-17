Imports Microsoft.VisualBasic

Public Class CMS_Location

    Dim DS_Location_Country As New DS_CMS_LocationTableAdapters.CMS_CountryTableAdapter
    Dim DS_Location_State As New DS_CMS_LocationTableAdapters.CMS_StateTableAdapter
    Dim DS_Location_City As New DS_CMS_LocationTableAdapters.CMS_CityTableAdapter

    Public Function InsertCountry(ByVal NameCountry As String) As Boolean
        DS_Location_Country.InsertQuery(NameCountry)
    End Function

    Public Function InsertState(ByVal code_country As String, ByVal NameState As String) As Boolean
        DS_Location_State.InsertQuery(code_country, NameState)
    End Function

    Public Function InsertCity(ByVal code_state As String, ByVal NameCity As String) As Boolean
        DS_Location_City.InsertQuery(code_state, NameCity)
    End Function

    Public Function DeleteLocation(ByVal code As Long, ByVal index As Byte) As Boolean
        '1:country
        '2:state
        '3:citys
        Select Case index
            Case 1
                DS_Location_Country.DeleteQuery(code)
            Case 2
                DS_Location_State.DeleteQuery(code)
            Case 3
                DS_Location_City.DeleteQuery(code)
        End Select
    End Function

End Class
