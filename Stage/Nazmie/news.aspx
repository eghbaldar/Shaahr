<%@ Page Language="VB" MasterPageFile="~/Stage/Nazmie/Home.master" AutoEventWireup="false"
    CodeFile="news.aspx.vb" Inherits="Stage_Nazmie_news" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style7
        {
            width: 14px;
        }
        .style8
        {
            width: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 729px;">
            جزییات خبر
        </div>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="ODS" Width="739px">
            <ItemTemplate>
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <table class="style6">
                                <tr>
                                    <td class="style7">
                                        <img alt="" src="../../content/images/MyShaahr/note.gif" style="width: 16px; height: 16px" />
                                    </td>
                                    <td>
                                        <asp:Label ID="title_newsLabel" runat="server" Style="font-size: 13px" Text='<%# Eval("title") %>' />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="border: 2px solid #bad1e5; padding: 5px; -moz-border-radius: 5px;">
                                <asp:Label ID="newsLabel" runat="server" Text='<%# Eval("news") %>' Style="color: #3e3e3e;" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="style6">
                                <tr>
                                    <td class="style8">
                                        <img alt="" src="../../content/images/MyShaahr/date.png" style="width: 18px; height: 19px" />
                                    </td>
                                    <td>
                                        <asp:Label ID="tarikhLabel" runat="server" Style="color: #276F8A" Text='<%# Eval("date") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style8">
                                        <img alt="" src="../../content/images/MyShaahr/time.png" style="width: 16px; height: 16px" />
                                    </td>
                                    <td>
                                        <asp:Label ID="timeLabel" runat="server" Style="color: #1D95B6" Text='<%# Eval("time", "{0}") %>' />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
        <asp:ObjectDataSource ID="ODS" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="DS_StageTableAdapters.Nazmie_SelectNewsTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="IDnews" Type="Int64" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
