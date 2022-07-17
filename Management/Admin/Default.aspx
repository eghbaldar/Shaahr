<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="Management_Admin_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 121px;
        }
        .style12
        {
            width: 18px;
        }
        .style18
        {
            width: 100%;
        }
        .style14
        {
            width: 128px;
            height: 114px;
            text-align: center;
        }
        .style8
        {
            width: 126px;
            height: 114px;
            text-align: center;
        }
        .style16
        {
            width: 127px;
            height: 114px;
            text-align: center;
        }
        .style10
        {
            width: 131px;
            height: 114px;
            text-align: center;
        }
        .style11
        {
            height: 114px;
            text-align: center;
        }
        .style13
        {
            width: 128px;
            text-align: center;
        }
        .style4
        {
            width: 126px;
            text-align: center;
        }
        .style15
        {
            width: 127px;
            text-align: center;
        }
        .style6
        {
            width: 131px;
            text-align: center;
        }
        .style17
        {
            text-align: center;
        }
        .style19
        {
            width: 17px;
        }
        .style20
        {
            width: 61px;
        }
        .style21
        {
            width: 120px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style18">
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style14">
                            &nbsp;<asp:ImageButton ID="btnSystemControl" runat="server" ImageUrl="~/Management/Content/Images/controlSystem.png" />
                            &nbsp;
                        </td>
                        <td class="style8">
                            <asp:ImageButton ID="btnAmar" runat="server" ImageUrl="~/Management/Content/Images/amar.jpg" />
                        </td>
                        <td class="style16">
                            <asp:ImageButton ID="btnNews" runat="server" ImageUrl="~/Management/Content/Images/news.jpg" />
                        </td>
                        <td class="style10">
                            <asp:ImageButton ID="btnFavorits" runat="server" ImageUrl="~/Management/Content/Images/Favorite.jpg" />
                            &nbsp;
                        </td>
                        <td class="style14">
                            <asp:ImageButton ID="btnUniversity" runat="server" ImageUrl="~/Management/Content/Images/university.jpg" />
                            &nbsp;
                        </td>
                        <td class="style16">
                            <asp:ImageButton ID="btnLocation" runat="server" ImageUrl="~/Management/Content/Images/location.jpg" />
                            &nbsp;
                        </td>
                        <td class="style11">
                            <asp:ImageButton ID="btnCharacter3" runat="server" ImageUrl="~/Management/Content/Images/character3.jpg" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            <asp:ImageButton ID="btnContact" runat="server" ImageUrl="~/Management/Content/Images/contact.jpg" />
                        </td>
                        <td class="style4">
                            <asp:ImageButton ID="btnFile" runat="server" ImageUrl="~/Management/Content/Images/file.jpg" />
                        </td>
                        <td class="style15">
                            <asp:ImageButton ID="btnJiring" runat="server" ImageUrl="../Content/Images/jiring.jpg" />
                            &nbsp;
                        </td>
                        <td class="style6">
                            <asp:ImageButton ID="btnPost" runat="server" ImageUrl="~/Management/Content/Images/Post.png" />
                            &nbsp;
                        </td>
                        <td class="style13">
                            &nbsp;<asp:ImageButton ID="btnIP" runat="server" ImageUrl="~/Management/Content/Images/IP.jpg" />
                        </td>
                        <td class="style15">
                            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Management/Content/Images/Chat.jpg" />
                        </td>
                        <td class="style17">
                            <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Management/Content/Images/ads.jpg" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            <img alt="" src="../Content/Images/managementManagers.jpg" style="width: 109px; height: 107px" />
                        </td>
                        <td class="style4">
                            <asp:ImageButton ID="btnUsers" runat="server" ImageUrl="~/Management/Content/Images/managementUsers.jpg" />
                        </td>
                        <td class="style15">
                            <asp:ImageButton ID="btnOnlineUser" runat="server" ImageUrl="~/Management/Content/Images/OnlineUsers.jpg" />
                        </td>
                        <td class="style6">
                            &nbsp;
                            <asp:ImageButton ID="btnGroupMsg" runat="server" ImageUrl="~/Management/Content/Images/GroupMSG.png" />
                        </td>
                        <td class="style13">
                            &nbsp;
                            <asp:ImageButton ID="btnTodayBirth" runat="server" ImageUrl="~/Management/Content/Images/birthday.jpg" />
                        </td>
                        <td class="style15">
                            &nbsp;<asp:ImageButton ID="btnEvents" runat="server" ImageUrl="~/Management/Content/Images/events.jpg" />
                            &nbsp;
                        </td>
                        <td class="style17">
                            &nbsp;<asp:ImageButton ID="btnForget" runat="server" ImageUrl="~/Management/Content/Images/forget.jpg" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            <asp:ImageButton ID="btnNazmie" ImageUrl="../Content/Images/nazmie.jpg" runat="server" />
                        </td>
                        <td class="style4">
                            <asp:ImageButton ID="btnStatementSecure" runat="server" ImageUrl="~/Management/Content/Images/statementScure.jpg" />
                        </td>
                        <td class="style15">
                            &nbsp;
                            <asp:ImageButton ID="btnCaptcha" runat="server" ImageUrl="~/Management/Content/Images/captcha.jpg" />
                        </td>
                        <td class="style6">
                            &nbsp;
                            <asp:ImageButton ID="btnHazfVisit" runat="server" 
                                ImageUrl="~/Management/Content/Images/hazfVisit.jpg" />
                        </td>
                        <td class="style13">
                            &nbsp;<asp:ImageButton ID="btnLoyaltyReward" runat="server" 
                                ImageUrl="~/Management/Content/Images/loyalty_reward.jpg" />
&nbsp;</td>
                        <td class="style15">
                            &nbsp;
                        </td>
                        <td class="style17">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            &nbsp;
                        </td>
                        <td class="style4">
                            &nbsp;
                        </td>
                        <td class="style15">
                            &nbsp;
                        </td>
                        <td class="style6">
                            &nbsp;
                        </td>
                        <td class="style13">
                            &nbsp;
                        </td>
                        <td class="style15">
                            &nbsp;
                        </td>
                        <td class="style17">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            &nbsp;
                        </td>
                        <td class="style4">
                            &nbsp;
                        </td>
                        <td class="style15">
                            &nbsp;
                        </td>
                        <td class="style6">
                            &nbsp;
                        </td>
                        <td class="style13">
                            &nbsp;
                        </td>
                        <td class="style15">
                            &nbsp;
                        </td>
                        <td class="style17">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <hr />
            </td>
        </tr>
        <tr>
            <td>
                <table class="style18">
                    <tr>
                        <td class="style19">
                            <asp:ImageButton ID="btnMasolinShaahr" runat="server" ImageUrl="~/Management/Content/Images/masolin_shaahr.jpg" />
                        </td>
                        <td class="style20">
                            <asp:ImageButton ID="btnSettingShaahr" runat="server" ImageUrl="~/Management/Content/Images/settingShaahr.png" />
                        </td>
                        <td class="style21">
                            &nbsp;<asp:ImageButton ID="btnReqFundationShaahr" runat="server" ImageUrl="~/Management/Content/Images/RequestFundation.png" />
                        </td>
                        <td>
                            <asp:ImageButton ID="btnShaahrLaw" runat="server" ImageUrl="~/Management/Content/Images/ShaahrLaw.jpg" />
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td class="style19">
                            &nbsp;
                        </td>
                        <td class="style20">
                            &nbsp;
                        </td>
                        <td class="style21">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style19">
                            &nbsp;
                        </td>
                        <td class="style20">
                            &nbsp;
                        </td>
                        <td class="style21">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
