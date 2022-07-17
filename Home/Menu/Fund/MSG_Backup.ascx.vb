Imports System.Data
Imports System.Data.SqlClient
Imports System.Text
Imports System.IO
Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports iTextSharp.text.html
Imports iTextSharp.text.html.simpleparser

Partial Class Home_Menu_Fund_MSG_Backup
    Inherits System.Web.UI.UserControl

    Protected Sub btnAction_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAction.Click

        'baraye har kodom az select ha (4ta select) bayad XSD ezade koni... va bejae [DS_HomeProfileTableAdapters.Message_SendTableAdapter] bezari.
        ''''''''''''''''''''''''''''''''''''''''''''''''''''
        'Dim ds As New DS_HomeProfileTableAdapters.Message_SendTableAdapter
        'Dim dt As DataTable 
        'dt = ds.GetData(Session("MY-UsErNaMe")) 'Receive

        '
        'dt = ds.GetData(Session("MY-UsErNaMe")) 'Send

        '
        'dt = ds.GetData(Session("MY-UsErNaMe")) 'Receive Grouply

        '
        'dt = ds.GetData(Session("MY-UsErNaMe")) 'Send Grouply

        'Dim GridView1 As New GridView()
        'GridView1.AllowPaging = False
        'GridView1.DataSource = dt
        'GridView1.DataBind()

        'Response.Clear()
        'Response.Buffer = True

        '----------------------------------------------Word
        'Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.doc")
        'Response.Charset = ""
        'Response.ContentType = "application/vnd.ms-word "
        'Response.Charset = ""
        'Response.ContentType = "application/vnd.ms-word "
        'Dim sw As New StringWriter()
        'Dim hw As New HtmlTextWriter(sw)
        'GridView1.RenderControl(hw)
        'Response.Output.Write(sw.ToString())
        'Response.Flush()
        'Response.End()
        '----------------------------------------------Exel
        'Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls")
        'Response.Charset = ""
        'Response.ContentType = "application/vnd.ms-excel"
        'Dim sw As New StringWriter()
        'Dim hw As New HtmlTextWriter(sw)

        'For i As Integer = 0 To GridView1.Rows.Count - 1
        '    GridView1.Rows(i).Attributes.Add("class", "textmode")
        'Next
        'GridView1.RenderControl(hw)
        'Dim style As String = "<style> .textmode { mso-number-format:\@; } </style>"
        'Response.Write(style)
        'Response.Output.Write(sw.ToString())
        'Response.Flush()
        'Response.End()
        '---------------------------------------------- PDF
        'Response.ContentType = "application/pdf"
        'Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.pdf")
        'Response.Cache.SetCacheability(HttpCacheability.NoCache)
        'Dim sw As New StringWriter()
        'Dim hw As New HtmlTextWriter(sw)
        'GridView1.RenderControl(hw)
        'Dim sr As New StringReader(sw.ToString())
        'Dim pdfDoc As New Document(PageSize.A4, 10.0F, 10.0F, 10.0F, 0.0F)
        'Dim htmlparser As New HTMLWorker(pdfDoc)
        'PdfWriter.GetInstance(pdfDoc, Response.OutputStream)
        'pdfDoc.Open()
        'htmlparser.Parse(sr)
        'pdfDoc.Close()
        'Response.Write(pdfDoc)
        'Response.End()

    End Sub

End Class
