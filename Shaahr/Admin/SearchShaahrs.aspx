<%@ Page Language="VB" MasterPageFile="~/Shaahr/Admin/Home.master" AutoEventWireup="false"
    CodeFile="SearchShaahrs.aspx.vb" Inherits="Shaahr_Admin_Default2" Title="Untitled Page" %>

<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="DelayedSubmit" Namespace="DelayedSubmit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        @font-face
        {
            font-family: koodak;
            src: url(            "../../content/font/W_koodak.TTF" );
        }
        .style3
        {
            width: 33px;
        }
        .style4
        {
            width: 62px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <cc1:DelayedSubmitExtender ID="DisableButtonExtender1" runat="server" Timeout="1"
        TargetControlID="txtSearch" />
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 729px;">
            جستجوی شهر
        </div>
        <table class="style1">
            <tr>
                <td>
                    <table class="style1">
                        <tr>
                            <td class="style3">
                                <img alt="" src="../../Content/images/Shaahrs/Root/search2.png" style="width: 82px;
                                    height: 81px" />
                            </td>
                            <td>
                                <div style="padding: 2px;">
                                    سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس
                                    های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال
                                    سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس
                                    های فعال سرویس های فعال سرویس های فعال سرویس های فعال سرویس های فعال</div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <div style="width: 720px; height: 20px; border: 1px solid #ccc; -moz-border-radius: 5px;
                        padding: 5px; background-color: #f4f4f4;">
                        <asp:TextBox ID="txtSearch" AutoPostBack="true" Width="710px" Style="border-style: none;
                            border-color: inherit; border-width: 0px; background-color: #f4f4f4; font-family: Tahoma;
                            font-size: 12px;" runat="server"> </asp:TextBox>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel" runat="server">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="txtSearch" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:DataList ID="DataList1" runat="server" DataKeyField="id" DataSourceID="ODS"
                                RepeatColumns="2" RepeatDirection="Horizontal" Width="736px">
                                <ItemTemplate>
                                    <div style="width: 361px; height: 75px; border: 1px solid #ccc; -moz-border-radius: 5px;
                                        margin-bottom: 2px; padding-top: 5px;">
                                        <table class="style1">
                                            <tr>
                                                <td class="style4">
                                                    <asp:ImageButton  runat="server"
                                    ForeColor="Transparent"
                                    ID="ImageButton1" OnCommand="GotoShaahr" CommandArgument='<%# Eval("id","{0}") %>'
                                                        runat="server" Height="65px" ImageUrl='<%# iif(Eval("logo")="","~\Content\images\Shaahrs\Root\LogoShaahr.png",Eval("logo","~\Content\images\Shaahrs\Shaahrs_Logo\{0}")) %>'
                                                        Width="65px" />
                                                </td>
                                                <td>
                                                    <table class="style1">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' Style="font-weight: 700" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="subnameLabel" runat="server" Text='<%# Eval("subname") %>' Style="color: #0066CC" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' Style="font-size: 10px" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                            <asp:ObjectDataSource ID="ODS" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.ShaahrSearchedTableAdapter">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtSearch" Name="text" PropertyName="Text" Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
