<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CheckRequest.aspx.vb" Inherits="user_CheckRequest" %>

<%@ Register Src="~/UserControl/Home/FindUsers.ascx" TagName="FindUsers" TagPrefix="uc10" %>
<%@ Register Src="../UserControl/Home/GuidMenu.ascx" TagName="GuidMenu" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/Home/FindUsers.ascx" TagName="FindUsers" TagPrefix="uc2" %>
<%@ Register Src="~/UserControl/Root/Footer_other.ascx" TagName="Footer" TagPrefix="uc6" %>
<%@ Register Src="~/UserControl/Root/TopTextLogo.ascx" TagName="TopTextLogo" TagPrefix="uc4" %>
<%@ Register Src="../UserControl/Home/Plus.ascx" TagName="Plus" TagPrefix="uc12" %>
<%@ Register Src="~/UserControl/ADS/ADS.ascx" TagName="ADS" TagPrefix="uc5" %>
<%@ Register Src="~/UserControl/Root/LeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc13" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../content/css/Profile_View_Users/css.css" rel="stylesheet" type="text/css" />
    <!-- File Jquery Key -->

    <script type="text/javascript" src="../content/js/Profile_View_Users/jquery.min.js"></script>

    <style type="text/css">
        .style1
        {
            width: 100%;
            height: 38px;
        }
        .style2
        {
            width: 89px;
            font-family: Tahoma;
            font-size: 11px;
        }
        .style3
        {
            font-family: Tahoma;
            font-size: 11px;
        }
        .style6
        {
            font-family: Tahoma;
            font-size: 11px;
            width: 108px;
        }
        .style9
        {
            width: 100%;
        }
        .style10
        {
            width: 12px;
        }
        .style11
        {
            width: 13px;
        }
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
        .Div_
        {
            margin-top: 5px;
            border: 5px solid #e3e3e3;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            width: 635px;
            height: 235px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="body">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div id="header">
            <!--Start Header-->
            <div id="Guid">
                <uc1:GuidMenu ID="GuidMenu1" runat="server" />
            </div>
            <div id="headerPic">
                <asp:Image runat="server" ForeColor="Transparent" ID="imgHeader" runat="server" />
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
                                            <asp:ImageButton runat="server" ForeColor="Transparent" ID="imgFrom" Height="80px"
                                                Width="80px" />
                                        </td>
                                        <td class="style11">
                                            <asp:Image runat="server" ForeColor="Transparent" ID="imgSwitch" />
                                        </td>
                                        <td class="style6">
                                            <asp:ImageButton runat="server" ForeColor="Transparent" ID="imgTo" Height="80px"
                                                Width="80px" />
                                        </td>
                                        <td class="style3">
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                <table>
                                    <tr>
                                        <td>
                                            کاربر محترم;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblIncrease" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="color: Green;">
                                            مبلغ فوق بعداز تایید کاربری که درخواست دوستی را دریافت کرده است به حساب طرفین اضافه
                                            می شود.
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblDecrease" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="color: red;">
                                            مبلغ فوق بلافاصله پس از قطع ارتباط از موجودی شما کسر می شود.
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                <table class="style9">
                                    <tr>
                                        <td class="style10">
                                            <asp:Button ID="btnAccept" CssClass="BtnShaahr" runat="server" Text="تایید" />
                                        </td>
                                        <td>
                                            <asp:Button ID="ImageButton2" CssClass="BtnShaahr" runat="server" Text="لغو و بازگشت به خانه    " />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="margin-top: 5px; width: 637px; height: 100%;">
                                <asp:Label ID="lblDelete" runat="server" 
                        style="color: #FF0000; font-family: Tahoma; font-size: 11px"></asp:Label>
                </div>
            </div>
            <div id="LeftMaster">
                <uc13:LeftMenu ID="LeftMenu1" runat="server" />
            </div>
        </div>
        <uc6:Footer ID="Footer1" runat="server" />
    </div>
    </form>
</body>
</html>
