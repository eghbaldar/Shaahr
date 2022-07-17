<%@ Page Language="VB" MasterPageFile="~/Stage/Jiring/Home.master" AutoEventWireup="false"
    CodeFile="J-card-to-card.aspx.vb" Inherits="Stage_Jiring_J_kart_to_kart" Title="Untitled Page" %>

<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Dropdownlist  -->
    <link href="../../content/js/Dropdownlist/Styles/Selectbox.css" rel="stylesheet"
        type="text/css" />

    <script src="../../content/js/Dropdownlist/Scripts/jquery-1.5.1.js" type="text/javascript"
        charset="utf-8"></script>

    <script type="text/javascript" src="../../content/js/Dropdownlist/Scripts/jquery.selectbox-0.5.js"></script>

    <script type="text/javascript">
	    $(document).ready(function () {
	        $('.selectbox').selectbox();
	    });
    </script>

    <!-- End  -->
    <style type="text/css">
        .style3
        {
            text-align: center;
        }
        .style4
        {
            font-size: 20pt;
        }
        .style5
        {
            width: 99px;
        }
        .style6
        {
            width: 206px;
        }
        .style7
        {
            color: #FF0000;
        }
        .style8
        {
            color: #666666;
        }
        .font
        {
            font-family: Tahoma;
            font-size: 11px;
        }
        .style9
        {
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 729px;">
            پرداخت آنلاین بصورت کارت به کارت
        </div>
        <div style="width: 733px; float: right;">
            <img src="../../content/images/Stage/Jiring/card-to-card.png" />
        </div>
        <div style="width: 733px; float: right;">
            <table class="style1">
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        1: ابتدا برای واریز مبلغ مورد نظر&nbsp; یکی از بانک های زیر را انتخاب کنید:
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="https://ebank.ansarbank.com/customermanager/viewLogin.html" target="_blank"
                            style="text-decoration: none;">
                            <img alt="" border="0" src="../../content/images/Stage/Jiring/Bank/bank_ansar.png"
                                style="width: 36px; height: 36px" />
                        </a><a href="https://modern.enbank.net/CustomerService/jsp/Login.jsp" target="_blank"
                            style="text-decoration: none;">
                            <img alt="" border="0" src="../../content/images/Stage/Jiring/Bank/bank_eghtesad.png"
                                style="width: 36px; height: 36px" />
                        </a><a href="https://pg.agri-bank.com/User/AuthenticateCardHolder.aspx" target="_blank"
                            style="text-decoration: none;">
                            <img alt="" border="0" src="../../content/images/Stage/Jiring/Bank/bank_keshavarzi.png"
                                style="width: 38px; height: 38px" />
                        </a><a href="http://www.parsian-bank.com/homebanking.html" target="_blank" style="text-decoration: none;">
                            <img alt="" border="0" src="../../content/images/Stage/Jiring/Bank/bank_parsian.png"
                                style="width: 35px; height: 35px" />
                        </a><a href="https://epayment.bankpasargad.com/PayOrder.aspx" target="_blank" style="text-decoration: none;">
                            <img alt="" border="0" src="../../content/images/Stage/Jiring/Bank/bank_pasargad.png"
                                style="width: 36px; height: 36px" />
                        </a><a href="http://www.postbank.ir/farazz/service-card2card.html" target="_blank"
                            style="text-decoration: none;">
                            <img alt="" border="0" src="../../content/images/Stage/Jiring/Bank/bank_post.png"
                                style="width: 34px; height: 36px" />
                        </a><a href="https://acquirer.sb24.com/CustomerService/jsp/Login.jsp" target="_blank"
                            style="text-decoration: none;">
                            <img alt="" border="0" src="../../content/images/Stage/Jiring/Bank/bank_saman.png"
                                style="width: 35px; height: 38px" />
                        </a><a href="https://cis.sarmayebank.com/" target="_blank" style="text-decoration: none;">
                            <img alt="" border="0" src="../../content/images/Stage/Jiring/Bank/bank_sarmaye.png"
                                style="width: 35px; height: 36px" />
                        </a><a href="https://ebank.city-bank.net/customermanager/viewLogin.html" target="_blank"
                            style="text-decoration: none;">
                            <img alt="" border="0" src="../../content/images/Stage/Jiring/Bank/bank_shaahr.png"
                                style="width: 36px; height: 34px" />
                        </a><a href="https://esinabank.com/CustomerService/jsp/Login.jsp" target="_blank"
                            style="text-decoration: none;">
                            <img alt="" border="0" src="../../content/images/Stage/Jiring/Bank/bank_sina.png"
                                style="width: 35px; height: 36px" />
                        </a><a href="https://pg.tejaratbank.net/paymentGateway/moneyTransfer" target="_blank"
                            style="text-decoration: none;">
                            <img alt="" border="0" src="../../content/images/Stage/Jiring/Bank/bank_tejarat.png"
                                style="width: 35px; height: 36px" />
                        </a><a href="https://epayment.ttbank.ir/PayOrder.aspx" target="_blank" style="text-decoration: none;">
                            <img alt="" border="0" src="../../content/images/Stage/Jiring/Bank/bank_tosee_taavon.png"
                                style="width: 34px; height: 36px" />
                        </a>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        شماره حساب ها:
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center; background-color: #FFFFCC;">
                        <span class="style4">&nbsp;6385 - 5410 - 4948 - 8454<br />
                        </span>بنام&nbsp; : علیمحمد اقبالدار
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center; background-color: #FFFFCC;">
                        <span class="style4">6585 - 5410 - 4000 - 9954</span><br />
                        بنام : امیر حسین کارگر
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center; background-color: #FFFFCC;">
                        <span class="style4">7175 - 5700 - 4548 - 1454</span><br />
                        بنام : شرکت دهکده مجازی کاسپین
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        <span class="style9">2: پر کردن فرم واریزی زیر:</span><br />
                        *** توجه فرمائید: به هیج عنوان قبل از واریز مبلغ فرم زیر را پر نفرمائید.
                    </td>
                </tr>
                <tr>
                    <td>
                        <table class="style1">
                            <tr>
                                <td class="style5">
                                    برای حساب:
                                </td>
                                <td class="style6">
                                    <asp:Label ID="lblFnLn" runat="server" Style="font-size: 12px"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    تاریخ پرداخت:
                                </td>
                                <td class="style6">
                                    <asp:TextBox ID="txtDate" runat="server" Width="198px" class="font"></asp:TextBox>
                                </td>
                                <td class="style8">
                                    مانند : 1390/01/01
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDate"
                                        ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    ساعت پرداخت:
                                </td>
                                <td class="style6">
                                    <asp:TextBox ID="txtTime" runat="server" Width="198px" class="font"></asp:TextBox>
                                </td>
                                <td class="style8">
                                    مانند :&nbsp; 18:50
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTime"
                                        ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    پرداخت به حساب:
                                </td>
                                <td class="style6">
                                    <asp:DropDownList ID="cmbBank" class="selectbox" ClientIDMode="Static" name="Items"
                                        runat="server">
                                        <asp:ListItem>علیمحمد اقبال دار</asp:ListItem>
                                        <asp:ListItem>امیر حسین کاگر نیاول</asp:ListItem>
                                        <asp:ListItem>شرکت دهکده مجازی کاسپین</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    کد پیگیری:
                                </td>
                                <td class="style6">
                                    <asp:TextBox ID="txtCodePeygiri" runat="server" Width="198px" class="font"></asp:TextBox>
                                </td>
                                <td class="style8">
                                    کد ارجاع یا شماره بازیابی
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCodePeygiri"
                                        ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    شماره کارت:
                                </td>
                                <td class="style6">
                                    <asp:TextBox ID="txtCardNum" runat="server" Width="198px" class="font"></asp:TextBox>
                                </td>
                                <td class="style8">
                                    4 رقم آخر کارت شما (&nbsp; اگر کل شماره باشد بهتر است)
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCardNum"
                                        ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    نام پرداخت کننده:
                                </td>
                                <td class="style6">
                                    <asp:TextBox ID="txtName" runat="server" Width="198px" class="font"></asp:TextBox>
                                </td>
                                <td class="style8">
                                    نام صاحب حساب
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtName"
                                        ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    توضیحات:
                                </td>
                                <td class="style6">
                                    <asp:TextBox ID="txtDetail" runat="server" Width="198px" class="font" Height="80px"
                                        TextMode="MultiLine"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
                            <asp:View ID="View1" runat="server">
                                <asp:ImageButton  runat="server"
                                    ForeColor="Transparent"
                                    ID="btnInsert" runat="server" ImageUrl="~/content/images/Profile_View_Users/btnSend.jpg"
                                    ValidationGroup="1" />
                            </asp:View>
                            <asp:View ID="View2" runat="server">
                                <div style="margin-top: 5px; height: 100px; padding: 5px; background-color: #f6f6f6;
                                    margin-right: 110px; border-bottom: 1px solid #84949a; border-top: 1px solid #84949a;
                                    width: 520px;">
                                    <div style="float: right; margin-top: 8px;">
                                        <img src="../../content/images/Home/info.gif" />
                                    </div>
                                    <div style="float: right; margin-right: 5px;">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="style11">
                                                    آیا از ارسال اطلاعات بالا مطمئن هستید؟
                                                </td>
                                                <td class="style12">
                                                    <asp:ImageButton  runat="server"
                                    ForeColor="Transparent"
                                    ID="btnAcceptToDelete" runat="server" ImageUrl="~/content/images/Home/AcceptIt.jpg"
                                                        ValidationGroup="2" />
                                                </td>
                                                <td>
                                                    <asp:ImageButton  runat="server"
                                    ForeColor="Transparent"
                                    ID="btnCancelToDelete" runat="server" ImageUrl="~/content/images/Home/CancelIt.jpg" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style11">
                                                    <cc1:CaptchaControl ID="ccJoin" runat="server" CaptchaBackgroundNoise="Extreme" CaptchaFontWarping="High"
                                                        CaptchaLineNoise="Medium" />
                                                    <asp:TextBox ID="txtCap" runat="server" Style="border-top: none; border-bottom: 1px solid #ccc;
                                                        border-right: 1px solid #ccc; border-left: 1px solid #ccc; text-align: left;"
                                                        Width="177px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCap"
                                                        ErrorMessage="*" ValidationGroup="2"></asp:RequiredFieldValidator>
                                                </td>
                                                <td class="style12">
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div style="margin-top: 50px; float: right;">
                                    </div>
                                    <br />
                                </div>
                            </asp:View>
                        </asp:MultiView>
                    </td>
                </tr>
            </table>
        </div>
        <div style="width: 731px; border-bottom: 1px solid #ccc; height: 10px; float: right;">
        </div>
        <div style="width: 711px; border-bottom: 1px solid #ccc; float: right; text-align: center;
            background-color: #E8E8E8; padding: 10px; -moz-border-radius: 3px; color: #CC0000;">
            <asp:Label ID="lblCode" runat="server"></asp:Label>
        </div>
        <div style="width: 733px; float: right; background-color: #e0ebf0;">
            <table class="style1">
                <tr>
                    <td class="style3">
                        <img alt="" src="../../content/images/Stage/Jiring/help.jpg" style="width: 35px;
                            height: 35px" />
                    </td>
                    <td>
                    پرداخت آنلاین بصورت فیش بانکی پرداخت آنلاین بصورت فیش بانکی پرداخت آنلاین بصورت
                    فیش بانکی پرداخت آنلاین بصورت فیش بانکی پرداخت آنلاین بصورت فیش بانکی پرداخت آنلاین
                    بصورت فیش بانکی پرداخت آنلاین بصورت فیش بانکی پرداخت آنلاین بصورت فیش بانکی پرداخت
                    آنلاین بصورت فیش بانکی پرداخت آنلاین بصورت فیش بانکی پرداخت آنلاین بصورت فیش بانکی
                    بصورت فیش بانکی
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
