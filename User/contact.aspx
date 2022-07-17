<%@ Page Language="VB" MasterPageFile="~/user/User.master" AutoEventWireup="false"
    CodeFile="contact.aspx.vb" Inherits="user_contact" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
            height: 68px;
        }
        .style2
        {
            width: 90px;
            color: #405866;
        }
        .style5
        {
            width: 100%;
            height: 65px;
        }
        .style6
        {
            width: 88px;
        }
        .style7
        {
            color: #405866;
            width: 93px;
        }
        .style9
        {
            width: 165px;
        }
        .style10
        {
            width: 87px;
            color: #405866;
        }
        .style11
        {
            width: 20px;
        }
        .Uni
        {
            background-color: #EFF4F7;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            border: 1px solid #a1ccd4;
            width: 537px;
            height: 60px;
            margin-top: 2px;
            padding: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="Div_Panel_Contact" runat="server">
        <div id="Div_InfoPersonal" runat="server" style="color: Gray; float: right; width: 540px;
            height: 220px; padding: 3px; height: 100%; border: solid #dedede 1px; -moz-border-radius: 5px;
            font-family: Tahoma; font-size: 11px;">
            <div class="DivTop">
                ارتباطات
            </div>
            <div style="font-family: Tahoma; font-size: 11px; float: right;">
                <table class="style5">
                    <tr>
                        <td class="style7">
                            ابتدایی:
                        </td>
                        <td>
                            <asp:Label ID="lblShcool" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            راهنمایی:
                        </td>
                        <td>
                            <asp:Label ID="lblMiddle_school" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            دبیرستان:
                        </td>
                        <td>
                            <asp:Label ID="lblHigh_school" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            پیش دانشگاهی:
                        </td>
                        <td>
                            <asp:Label ID="lbl_PreUniversity" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            شغل:
                        </td>
                        <td>
                            <asp:Label ID="lblJob" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            آدرس محل کار:
                        </td>
                        <td>
                            <asp:Label ID="lblJob_location" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            تلفن محل کار:
                        </td>
                        <td>
                            <asp:Label ID="lblJob_Tell" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            تلفن اضطراری:
                        </td>
                        <td>
                            <asp:Label ID="lblEmergncyTell" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            نام شرکت:
                        </td>
                        <td>
                            <asp:Label ID="lblComapny_Name" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            محل شرکت:
                        </td>
                        <td>
                            <asp:Label ID="lbl_LocationCompany" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            درباره شرکت:
                        </td>
                        <td>
                            <asp:Label ID="lbl_CompanyDetail" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            وب سایت شرکت:
                        </td>
                        <td>
                            <asp:Label ID="lbl_WebsiteCompany" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="margin-right: -2px; margin-top: 2px; width: 549px; float: right; height: 14px;">
            </div>
            <div style="font-family: Tahoma; font-size: 11px; float: right;">
                <table class="style5">
                    <tr>
                        <td class="style10">
                            ایمیل اصلی:
                        </td>
                        <td>
                            <asp:Label ID="lblPrimaryEmail" runat="server" Style="font-weight: 700"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style10">
                            ایمیل فرعی:
                        </td>
                        <td>
                            <asp:Label ID="lblSecondEmail" runat="server" Style="font-weight: 700"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="margin-right: -2px; margin-top: 2px; width: 549px; float: right; height: 14px;">
            </div>
            <div style="font-family: Tahoma; font-size: 11px; float: right;">
                <table class="style5">
                    <tr>
                        <td class="style6">
                            <img alt="" src="../content/images/Profile_View_Users/yahoo.jpg" style="width: 36px;
                                height: 23px" title="آیدی یاهو مسنجر" />
                        </td>
                        <td>
                            <b>
                                <asp:Label ID="lblYahoo" runat="server"></asp:Label>
                            </b>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            <img alt="" src="../content/images/Profile_View_Users/gmail.jpg" style="width: 28px;
                                height: 21px" title="آیدی جی یمیل" />
                        </td>
                        <td>
                            <b>
                                <asp:Label ID="lblGmail" runat="server"></asp:Label>
                            </b>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            <img alt="" src="../content/images/Profile_View_Users/facebook.jpg" style="width: 59px;
                                height: 22px" title="آیدی فیسبوک" />
                        </td>
                        <td>
                            <b>
                                <asp:Label ID="lblFacebook" runat="server"></asp:Label>
                            </b>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            <img alt="" src="../content/images/Profile_View_Users/twitter.jpg" style="width: 28px;
                                height: 28px" title="آیدی تویتر" />
                        </td>
                        <td>
                            <b>
                                <asp:Label ID="lblTwitter" runat="server"></asp:Label>
                            </b>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            <img alt="" src="../content/images/Profile_View_Users/hotmail.jpg" style="width: 28px;
                                height: 29px" title="آیدی هات میل" />
                        </td>
                        <td>
                            <b>
                                <asp:Label ID="lblHomail" runat="server"></asp:Label>
                            </b>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            <img alt="" src="../content/images/Profile_View_Users/oovoo.jpg" style="width: 29px;
                                height: 28px" title="آیدی اوو مسنجر" />
                        </td>
                        <td>
                            <b>
                                <asp:Label ID="lbloovoo" runat="server"></asp:Label>
                            </b>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            <img alt="" src="../content/images/Profile_View_Users/skype.jpg" style="width: 28px;
                                height: 28px" title="آیدی اسکایپ" />
                        </td>
                        <td>
                            <b>
                                <asp:Label ID="lblSkype" runat="server"></asp:Label>
                            </b>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div style="font-family: Tahoma; font-size: 11px; float: right;">
            <asp:Panel ID="PnlUniversity" runat="server">
                <div class="Uni">
                    <table style="width: 100%">
                        <tr>
                            <td class="style11">
                                <asp:Image runat="server" ForeColor="Transparent" ID="imgUniversity" runat="server"
                                    Height="50px" Width="50px" BorderColor="#F6F6F6" BorderWidth="1px" />
                            </td>
                            <td>
                                <asp:Label ID="lblUniversity" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
