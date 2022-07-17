<%@ Page Language="VB" MasterPageFile="~/Shaahr/Admin/Home.master" AutoEventWireup="false"
    CodeFile="rank.aspx.vb" Inherits="Shaahr_Admin_Default2" Title="Untitled Page" %>

<%@ Register Src="../../UserControl/Root/ButtonShaahr.ascx" TagName="ButtonShaahr"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        @font-face
        {
            font-family: koodak;
            src: url(            "../../content/font/W_koodak.TTF" );
        }
        .style3
        {
            width: 68px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 729px;">
            قوانین ساختمان مدیریتی
        </div>
        <table class="style1">
            <tr>
                <td>
                    <table class="style1">
                        <tr>
                            <td class="style3">
                                <img alt="" src="../../Content/images/Shaahrs/Root/rank.png" style="width: 82px;
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
                    صد شهر نخست
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DataList ID="DataList2" runat="server" DataSourceID="ODS_100Shaahr" RepeatColumns="15"
                        RepeatDirection="Horizontal" Width="28px">
                        <ItemTemplate>
                            <div style="border: 1px solid #ccc;">
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton1" runat="server"
                                                CommandArgument='<%# Eval("id","{0}") %>' Height="33px" ImageUrl='<%# iif(Eval("logo")="","~\Content\images\Shaahrs\Root\LogoShaahr.png",Eval("logo","~\Content\images\Shaahrs\Shaahrs_Logo\{0}")) %>'
                                                OnCommand="GotoShaahr" Width="33px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;">
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("visit") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;">
                                            <span style="font-family: koodak; font-size: 14px;">
                                                <%#Container.ItemIndex + 1%></span>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:ObjectDataSource ID="ODS_100Shaahr" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Shaahr_100RankTableAdapter">
                    </asp:ObjectDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <uc1:ButtonShaahr ID="btnLawOstan1" runat="server" />
                    <uc1:ButtonShaahr ID="btnLawOstan2" runat="server" />
                    <uc1:ButtonShaahr ID="btnLawOstan3" runat="server" />
                    <uc1:ButtonShaahr ID="btnLawOstan4" runat="server" />
                    <uc1:ButtonShaahr ID="btnLawOstan5" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DataList ID="DataList3" runat="server" DataSourceID="ODS_AllRank" RepeatColumns="15"
                        RepeatDirection="Horizontal" Width="28px">
                        <ItemTemplate>
                            <div style="border: 1px solid #ccc;">
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton1" runat="server"
                                                CommandArgument='<%# Eval("id","{0}") %>' Height="33px" ImageUrl='<%# iif(Eval("logo")="","~\Content\images\Shaahrs\Root\LogoShaahr.png",Eval("logo","~\Content\images\Shaahrs\Shaahrs_Logo\{0}")) %>'
                                                OnCommand="GotoShaahr" Width="33px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;">
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("visit") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;">
                                            <span style="font-family: koodak; font-size: 14px;">
                                                <%#Container.ItemIndex + 1%></span>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:ObjectDataSource ID="ODS_AllRank" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Shaahr_Alllank_ByCodeSateTableAdapter">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="CodeState" QueryStringField="CS" Type="String" DefaultValue="1" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
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
