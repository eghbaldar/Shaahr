<%@ Page Language="VB" MasterPageFile="~/Stage/Nazmie/Home.master" AutoEventWireup="false"
    CodeFile="law-com.aspx.vb" Inherits="Stage_Nazmie_law_com" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style6
        {
            width: 100%;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="ODS" Width="746px">
        <ItemTemplate>
            <div style="border: 1px solid #1d95b6; -moz-border-radius: 4px;">
                <table class="style6">
                    <tr>
                        <td>
                            <asp:Label ID="subjectLabel" runat="server" Style="font-size: 13px" Text='<%# Eval("subject") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="border: 1px solid #ccc; padding: 4px;">
                                <asp:Label ID="detailLabel" runat="server" Text='<%# Eval("detail") %>' /></div>
                        </td>
                    </tr>
                    <tr>
                        <td style="color: Gray;">
                            (
                            <asp:Label ID="dateLabel" Style="color: #59b2cb;" runat="server" Text='<%# "تاریخ: "+Eval("date") %>' />
                            )
                        </td>
                    </tr>
                </table>
            </div>
        </ItemTemplate>
    </asp:DataList>
    <asp:ObjectDataSource ID="ODS" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="DS_StageTableAdapters.Nazmie_LawByCodeTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="code" QueryStringField="law" Type="Int64" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="subject" Type="String" />
            <asp:Parameter Name="detail" Type="String" />
            <asp:Parameter Name="_date" Type="String" />
            <asp:Parameter Name="type" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>
