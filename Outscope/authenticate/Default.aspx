<%@ Page Language="VB" MasterPageFile="~/outscope/authenticate/Home.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="outscope_authenticate_Default" Title="Untitled Page" %>

<%@ Register Src="../../UserControl/Root/Captcha.ascx" TagName="Captcha" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- /////////////////////////////////////////// Te Le Ke //////////////////////////////////////////////// -->

    <script type="text/javascript" src="../../content/js/jquery-1.2.2.pack.js"></script>

    <style type="text/css">
        div.htmltooltip
        {
            position: absolute; /*leave this and next 3 values alone*/
            z-index: 1000; /* left:-1000px; */
            top: -1000px;
            background: #999;
            border: 5px double #999;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            color: white;
            padding: 3px;
            width: 150px; /*width of tooltip*/
        }
        .style1
        {
            width: 100%;
        }
        .style6
        {
            height: 27px;
        }
    </style>
    <%--    <script type="text/javascript" src="../../content/js/htmltooltip.js" />--%>
    <!-- /////////////////////////////////////////////////////////////////////////////////////////// -->
    <!-- Enter -->

    <script type="text/javascript">
    
        function Btn_Click(e,objBtnID)
        {
            var evt = e ? e : window.event;
            var bt = document.getElementById(objBtnID);
            if(bt)
            {
                if(evt.keyCode == 13)
                    {
                        bt.click();
                        return false ;
                    }
            }
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="float: right;">
        <img src="../../tablighOnline.jpg" />
    </div>
    <div id="Div1" style="border-top: 1px solid #b4cfde; border-bottom: 1px solid #b4cfde;
        margin-top: 2px; width: 743px; height: 100%; background-color: #f3fbff;" runat="server">
        <table style="width: 100%;">
            <tr>
                <td>
                    کاربر محترم;
                </td>
            </tr>
            <tr>
                <td style="color: Red;">
                    <asp:Label ID="lblCapacityInbox" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblExtra" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
        </table>
    </div>
    <div style="float: right;">
        <table class="style1">
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table class="style1">
                                <tr>
                                    <td>
                                        نام کاربری
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="padding: 3px; border: 4px solid #ccc; -moz-border-radius: 5px; width: 220px;">
                                            <asp:TextBox ID="txtEmail" runat="server" Style="border: none; text-align: left;
                                                direction: ltr;" Width="220px"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail"
                                            ErrorMessage="●" ValidationGroup="1"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        کلمه عبور
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="padding: 3px; border: 4px solid #ccc; -moz-border-radius: 5px; width: 220px;">
                                            <asp:TextBox ID="txtPassword" runat="server" Style="border: none; text-align: left;
                                                direction: ltr;" TextMode="Password" Width="220px"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                                            ErrorMessage="●" ValidationGroup="1"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%--<cc1:CaptchaControl ID="ccJoi" runat="server" CaptchaFontWarping="Extreme" CaptchaLineNoise="Medium"
                                            CaptchaWidth="235" FontColor="Black" />--%>
                                        <uc1:Captcha ID="Captcha" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%--<div style="padding: 3px; -moz-border-radius: 5px; width: 228px; background-color: #9FBFC8;">
                                            <table class="style6">
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtCaptcha" runat="server" Style="text-align: center; direction: ltr;
                                                            font-weight: bold;" Width="218px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtCaptcha"
                                                            ErrorMessage="●" Font-Size="20px" ValidationGroup="1"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>--%>
                                        <%--<div style="padding: 3px;">
                                            <asp:ImageButton ID="btnRefreshCap" runat="server" Height="16px" ImageUrl="~/content/images/Home/refresh.png"
                                                Style="width: 16px" /></div>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnEnter" runat="server"
                                            ImageUrl="~/content/images/HomePage/vorod.jpg" ValidationGroup="1" />
                                        <a href="#" rel="htmltooltip" style="color: #FFF; text-decoration: none;">
                                            <asp:Image runat="server" ForeColor="Transparent" ID="imgErr" runat="server" ImageUrl="~/content/images/HomePage/err.gif"
                                                Visible="False" />
                                            <div class="htmltooltip" style="background-color: Red; border: none; text-align: center;
                                                width: 220px; height: 20px;">
                                                <pre style="font-family: Tahoma, Geneva, sans-serif; font-size: 10px; margin-top: -7px;">مشخصه های وارده اشتباه می باشد
</pre>
                                            </div>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="chkRemember" runat="server" Text=" نگهداری اطلاعات ورودی" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="../CreateAccount/" style="color: #466ab6; font-weight: bold; text-decoration: none;">
                                            ساخت حساب کاربری جدید</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="../state.aspx?state=Password" style="color: Black; text-decoration: none;">
                                            کلمه عبور را فراموش کرده ام</a>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
