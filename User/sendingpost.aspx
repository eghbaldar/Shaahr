<%@ Page Language="VB" AutoEventWireup="false" CodeFile="sendingpost.aspx.vb" Inherits="user_sendingpost" %>

<%@ Register Src="../UserControl/Home/GuidMenu.ascx" TagName="GuidMenu" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/Root/TopTextLogo.ascx" TagName="TopTextLogo" TagPrefix="uc4" %>
<%@ Register Src="../UserControl/Home/FindUsers.ascx" TagName="FindUsers" TagPrefix="uc10" %>
<%@ Register Src="../UserControl/Home/Plus.ascx" TagName="Plus" TagPrefix="uc2" %>
<%@ Register Src="../UserControl/ADS/ADS.ascx" TagName="ADS" TagPrefix="uc5" %>
<%@ Register Src="~/UserControl/Root/LeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc3" %>
<%@ Register Src="../UserControl/Root/Footer_other.ascx" TagName="Footer" TagPrefix="uc6" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>پروفایل</title>
    <link href="../content/css/Profile_View_Users/css.css" rel="stylesheet" type="text/css" />
    <!-- File Jquery Key -->

    <script type="text/javascript" src="../content/js/Profile_View_Users/jquery.min.js"></script>

    <style type="text/css">
        .BtnShaahr
        {
            background-color: #f4f4f4;
            border: 1px solid #ccc;
            padding: 5px;
            color: Black;
            font-family: Tahoma;
            font-size: 11px;
            cursor: pointer;
            -moz-border-radius: 4px;
        }
        .style1
        {
            width: 98%;
        }
        .style2
        {
            width: 121px;
            font-family: Tahoma;
            font-size: 11px;
        }
        .style3
        {
            font-family: Tahoma;
            font-size: 11px;
        }
        .style5
        {
            width: 161px;
        }
        .style6
        {
            width: 32px;
            font-family: Tahoma;
            font-size: 11px;
        }
        .Div_
        {
            margin-top: 5px;
            border: 5px solid #e3e3e3;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            width: 635px;
            height: 180px;
            padding:5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="body">
        <div id="header">
            <!--Start Header-->
            <div id="Guid">
                <uc1:GuidMenu ID="GuidMenu1" runat="server" />
            </div>
            <div id="headerPic">
                <asp:Image ID="imgHeader" runat="server" />
            </div>
            <div id="Nav">
                <uc4:TopTextLogo ID="TopTextLogo1" runat="server" />
                <div id="searchNav">
                    <uc10:FindUsers ID="FindUsers1" runat="server" />
                </div>
                <div id="Offer">
                </div>
            </div>
        </div>
        <!-- End Heeader -->
        <div id="master">
            <div id="RightMaster" style="width: 200px;">
                <div id="ads_panel">
                    <uc5:ADS ID="ADS1" runat="server" />
                </div>
            </div>
            <div id="CenterMaster" style="width: 703px;">
                <div class="Div_">
                    <table class="style1">
                        <tr>
                            <td class="style3">
                                <table class="style1">
                                    <tr>
                                        <td class="style2">
                                            <asp:ImageButton ID="imgFrom" runat="server" Height="100px" Width="100px" />
                                        </td>
                                        <td class="style5">
                                            <table class="style1">
                                                <tr>
                                                    <td class="style3">
                                                        <asp:Label ID="lblNameFrom" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style3">
                                                        <asp:Label ID="lblNameTo" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style3">
                                                        <asp:Label ID="lblType" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style3">
                                                        <asp:Label ID="lblDate" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style3">
                                                        <asp:Label ID="lblTime" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="style6">
                                            <img alt="" src="../content/images/Profile_View_Users/curosr.jpg" style="width: 49px;
                                                height: 53px" />
                                        </td>
                                        <td class="style3">
                                            <asp:ImageButton ID="imgTo" runat="server" Height="100px" Width="100px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                <asp:Label ID="lblSuccess" runat="server" Style="color: #009933"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                <asp:HyperLink ID="HyperLink1" runat="server" Style="color: #7C929C">قبل از هر 
                                گونه ارسالی قوانین ارسال پست به دوستان را بطور کامل مطالعه کنید.</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                <asp:Button ID="BacktoProfile" CssClass="BtnShaahr" runat="server" 
                                    Text="مشاهده شد" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="margin-top: 5px; width: 637px; height: 100%;">
                    <table class="style1">
                        <tr>
                            <td>
                                <img alt="" src="../content/images/Profile_View_Users/sendPost.jpg" style="width: 53px;
                                    height: 45px" />
                            </td>
                            <td>
                                <asp:Label ID="Label1" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                    Text="ارسال متن چگونه باید باشد ؟ارسال متن در این نوع پست هرچقدر کوتاهتر و مفهموی تر باشد قابل فهم تر خواهد بود"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img alt="" src="../content/images/Profile_View_Users/sendImage.jpg" style="width: 46px;
                                    height: 45px" />
                            </td>
                            <td>
                                <asp:Label ID="Label2" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                    Text="ارسال متن چگونه باید باشد ؟ارسال متن در این نوع پست هرچقدر کوتاهتر و مفهموی تر باشد قابل فهم تر خواهد بود"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img alt="" src="../content/images/Profile_View_Users/sendLink.jpg" style="width: 43px;
                                    height: 44px" />
                            </td>
                            <td>
                                <asp:Label ID="Label3" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                    Text="ارسال متن چگونه باید باشد ؟ارسال متن در این نوع پست هرچقدر کوتاهتر و مفهموی تر باشد قابل فهم تر خواهد بود"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="LeftMaster">
                <uc3:LeftMenu ID="LeftMenu1" runat="server" />
            </div>
        </div>
        <uc6:Footer ID="Footer1" runat="server" />
    </div>
    </form>
</body>
</html>
