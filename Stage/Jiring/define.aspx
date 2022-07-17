<%@ Page Language="VB" MasterPageFile="~/Stage/Jiring/Home.master" AutoEventWireup="false"
    CodeFile="define.aspx.vb" Inherits="Stage_Jiring_define" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 729px;">
            جزییات و تعاریف جیرینگی
        </div>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="ODS" Width="741px">
            <ItemTemplate>
                <table class="style1">
                    <tr>
                        <td>
                            <div style="-moz-border-radius: 3px; background-color: #E9F4D2; padding: 5px;">
                                <span style="color: #76A517;">■</span>
                                <asp:Label ID="Label1" runat="server" 
                                Style="font-size: 11px;" Text='<%# Eval("Subject", "{0}") %>' ForeColor="Gray"></asp:Label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Text", "{0}") %>' ForeColor="#000"></asp:Label>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
        <asp:ObjectDataSource ID="ODS" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="DS_StageTableAdapters.CMS_DefineJiringTableAdapter">
            <InsertParameters>
                <asp:Parameter Name="Subject" Type="String" />
                <asp:Parameter Name="Text" Type="String" />
                <asp:Parameter Name="_Date" Type="String" />
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="flag" Type="Boolean" />
            </InsertParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
