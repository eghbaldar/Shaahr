<%@ Page Language="VB" MasterPageFile="~/Home/Home.master" AutoEventWireup="false"
    CodeFile="MoreShaahr.aspx.vb" Inherits="Home_MoreShaahr" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .PicFrame
        {
            width: 200px;
        }
        .style6
        {
            width: 100%;
        }
        .style7
        {
            width: 24px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 727px;">
            شهرهای اقامت گرفته
        </div>
        <table class="style6">
            <tr>
                <td>
                    <asp:DataList ID="DataList2" runat="server" DataKeyField="ID" DataSourceID="ODS_UsersMoreShaahrs"
                        Width="79px" RepeatColumns="4" RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <div class="PicFrame">
                                <table class="style6">
                                    <tr>
                                        <td class="style7">
                                            <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("id","{0}") %>'
                                                ForeColor="Transparent" Height="66px" ImageUrl='<%# iif(Eval("logo")="","~\Content\images\Shaahrs\Root\LogoShaahr.png",Eval("logo","~\Content\images\Shaahrs\Shaahrs_Logo\{0}")) %>'
                                                OnCommand="GotoShaahr" Width="66px" />
                                        </td>
                                        <td>
                                            <table class="style6">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name", "{0}") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:ObjectDataSource ID="ODS_UsersMoreShaahrs" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Users_MoreShaahrsTableAdapter">
                        <SelectParameters>
                            <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
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
