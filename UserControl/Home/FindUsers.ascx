<%@ Control Language="VB" AutoEventWireup="false" CodeFile="FindUsers.ascx.vb" Inherits="UserControl_Home_FindUsers" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="DelayedSubmit" Namespace="DelayedSubmit" TagPrefix="cc1" %>
<style type="text/css">
    .txt
    {
        border-top: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
        border-left: 1px solid #ccc;
        height: 23px; /*width: 462px;*/
        width: 442px;
        font-family: Tahoma;
        font-size: 11px; /*background-color:Maroon;*/
    }
    .Div
    {
        width: 492px;
        height: 210px;
        border-bottom: 1px solid #999999;
        border-left: 1px solid #999999;
        border-right: 1px solid #999999;
        background-color: White;
        position: absolute;
        margin-top: 27px;
    }
    .Footer
    {
        margin-top: 4px;
        padding: 2px;
        border-top: 1px solid #ccc;
        background-color: #f9f9f9;
    }
    .s1
    {
        font-family: Tahoma;
        font-size: 11px;
        width: 100%;
    }
    .s2
    {
        width: 18px;
    }
    .Search1
    {
        width: 100%;
    }
    .Search4
    {
        width: 37px;
    }
    .Boundry
    {
        width: 165px;
        height: 100%;
        padding-top: 5px;
    }
    .GotoSearch
    {
        float: right;
        border-top: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
        border-right: 1px solid #ccc;
        padding-right: 2px;
        padding-left: 6px;
        padding-top: 2px;
        padding-bottom: 2px;
        background-color: White;
    }
</style>
<cc1:DelayedSubmitExtender ID="DisableButtonExtender1" runat="server" Timeout="1"
    TargetControlID="txtSearch" />
<div style="width: 552px; height: 32px; padding-top: 10px;">
    <div class="GotoSearch">
        <asp:ImageButton ForeColor="Transparent" AlternateText="" ID="btnGotoSearch" ImageUrl="~/content/images/Home/searchUsers.png"
            runat="server" />
    </div>
    <div style="float: right;">
        <div style="float: right;">
            <asp:TextBox ID="txtSearch" runat="server" class="txt" AutoPostBack="True" />
        </div>
        <div style="float: right; padding-top: 5px; padding-right: 1px;">
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" >
                <ProgressTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Content/images/Profile_View_Users/Loading_0.gif" />
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
    </div>
    <asp:UpdatePanel ID="Up_Search" runat="server" UpdateMode="Conditional">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="txtSearch" />
        </Triggers>
        <ContentTemplate>
            <div runat="server" id="DivResult" class="Div" visible="false" style="height: 280px;">
                <div>
                    <div style="height: 122px;">
                        <asp:Label ID="lblEmptyUser" runat="server" Style="font-family: Tahoma; font-size: 11px;"></asp:Label>
                        <asp:DataList ID="DL_Users" runat="server" DataSourceID="ObjectDataSource1" RepeatColumns="3"
                            RepeatDirection="Horizontal" Height="16px">
                            <ItemTemplate>
                                <div class="Boundry">
                                    <table class="s1">
                                        <tr>
                                            <td class="s2">
                                                <%--  <asp:ImageButton OnCommand="RedirectFriend" CommandArgument='<%# Eval("email","{0}") %>'
                                                ImageUrl='<%# SetAvatar(DataBinder.Eval(Container.DataItem,"email"),DataBinder.Eval(Container.DataItem,"TYPE")) %>'
                                                ID="ImageButton1" runat="server" Height="40px" Width="40px" />        
                                                    </asp:LinkButton>--%>
                                                <asp:LinkButton ID="LinkButton1" OnCommand="RedirectFriend" CommandArgument='<%# Eval("email","{0}") %>'
                                                    runat="server">
                                                    <img id="Img1" runat="server" height="40" width="40" src='<%# SetAvatar(DataBinder.Eval(Container.DataItem,"email"),DataBinder.Eval(Container.DataItem,"TYPE")) %>' />
                                                </asp:LinkButton>
                                            </td>
                                            <td>
                                                <div style="text-align: right; width: 125px;">
                                                    <table class="s1">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label1" runat="server" Text='<%# SetTitle(DataBinder.Eval(Container.DataItem,"email"),DataBinder.Eval(Container.DataItem,"TYPE")) %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblDateBirth" runat="server" Style="color: #1a6788;" Text='<%# SetBirthDate(DataBinder.Eval(Container.DataItem,"email"),DataBinder.Eval(Container.DataItem,"TYPE")) %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblLocation" runat="server" Text='<%# SetLocation(DataBinder.Eval(Container.DataItem,"email"),DataBinder.Eval(Container.DataItem,"TYPE")) %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="DS_HomeProfileTableAdapters.Home_SearchUserShaahrTableAdapter">
                            <SelectParameters>
                                <asp:SessionParameter Name="TEXT" SessionField="TEXT" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                    <hr style="border-bottom: 0; border-left: 0; border-right: 0; border-top: 1px solid #ccc;" />
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                    <div style="height: 120px;">
                        <asp:Label ID="lblEmptyShaahr" runat="server" Style="font-family: Tahoma; font-size: 11px;"></asp:Label>
                        <asp:DataList ID="DL_Shaahrs" runat="server" DataKeyField="id" DataSourceID="ODS"
                            RepeatColumns="3" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <div class="Boundry">
                                    <table class="Search1">
                                        <tr>
                                            <td class="Search4">
                                                <%--<asp:ImageButton ID="ImageButton2" runat="server" CommandArgument='<%# Eval("id","{0}") %>'
                                                Height="40px" 
                                                ImageUrl='<%# iif(Eval("logo")="","~\Content\images\Shaahrs\Root\LogoShaahr.png",Eval("logo","~\Content\images\Shaahrs\Shaahrs_Logo\{0}")) %>'
                                                OnCommand="GotoShaahr" Width="40px" />
                                           --%>
                                                <asp:LinkButton ID="LinkButton1" CommandArgument='<%# Eval("id","{0}") %>' OnCommand="GotoShaahr"
                                                    runat="server">
                                            <img runat="server" height="40" width="40"
                                            
                                                src='<%# iif(Eval("logo")="","~\Content\images\Shaahrs\Root\LogoShaahr.png",Eval("logo","~\Content\images\Shaahrs\Shaahrs_Logo\{0}")) %>'
                                                 />
                                                </asp:LinkButton>
                                            </td>
                                            <td>
                                                <table class="Search1">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="nameLabel" runat="server" Style="font-family: Tahoma; font-size: 11px;"
                                                                Text='<%# Eval("name") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="titleLabel" runat="server" Style="font-size: 11px; color: #1A6788;
                                                                font-family: Tahoma;" Text='<%# Eval("title") %>' />
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
                            SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Shaahr_ShaahrSearch_TopMenuTableAdapter">
                            <SelectParameters>
                                <asp:SessionParameter Name="text" SessionField="TEXT" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                </div>
                <div class="Footer">
                    <asp:LinkButton ID="btnGoSearch" Style="font-family: Tahoma; font-size: 11px; color: gray;
                        text-decoration: none;" runat="server">جستجوی پیشرفته کاربران و شهرها</asp:LinkButton>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
