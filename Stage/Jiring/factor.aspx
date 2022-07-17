<%@ Page Language="VB" MasterPageFile="~/Stage/Jiring/Home.master" AutoEventWireup="false"
    CodeFile="factor.aspx.vb" Inherits="Stage_Jiring_Default2" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style3
        {
            width: 227px;
        }
        .style4
        {
            width: 410px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 729px;">
            عوامل افزایش و کاهش جیرینگ
        </div>
        <div style="width: 733px;">
            <div style="width: 744px; height: 50px;">
                <div style="float: right;">
                    <img src="../../content/images/Stage/Jiring/in_de.jpg" />
                </div>
                <div style="float: right; height: 50px; color: Black;">
                    <table class="style1">
                        <tr>
                            <td>
                                جزییات
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div style="width: 733px; border-bottom: 1px solid #ccc; height: 1px; float: right;">
            </div>
            <asp:DataList ID="DataList1" runat="server" DataSourceID="ODS" Width="746px">
                <ItemTemplate>
                    <table class="style1">
                        <tr>
                            <td class="style3">
                                <asp:Label ID="SubjectLabel" runat="server" Text='<%# Eval("Subject") %>' />
                            </td>
                            <td class="style4">
                                <asp:Label ID="TimePeriodLabel" runat="server" Text='<%# Eval("TimePeriod") %>' />
                            </td>
                            <td>
                                <asp:Image ID="Image1"  runat="server"
                                    ForeColor="Transparent"
                                    ImageUrl='<%# IIF(Eval("type")=0,"~\content\images\stage\jiring\decrease.jpg","~\content\images\stage\jiring\increase.jpg") %>'
                                    runat="server" />
                                <asp:Label ID="jiringLabel" runat="server" Text='<%# Eval("jiring") %>' />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            <asp:ObjectDataSource ID="ODS" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" TypeName="DS_StageTableAdapters.CMS_Factor_JiringTableAdapter">
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
