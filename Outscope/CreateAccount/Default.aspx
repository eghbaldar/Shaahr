<%@ Page Language="VB" MasterPageFile="~/outscope/CreateAccount/Home.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="outscope_CreateAccount_Default" Title="Untitled Page" %>


<%@ Register Src="../../UserControl/Root/Captcha.ascx" TagName="Captcha" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        @font-face
        {
            font-family: KoodakShaahr;
            src: url(                 "./../../content/font/W_Koodak.TTF" );
        }
        .style6
        {
            width: 100%;
        }
        .style7
        {
            width: 238px;
        }
        .style11
        {
            font-size: 20px;
        }
        .style12
        {
            width: 59px;
            color: #1a6f86;
        }
        .style13
        {
            width: 101px;
            color: #1a6f86;
        }
        .style16
        {
            width: 228px;
        }
        p.MsoNormal
        {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 10.0pt;
            margin-left: 0in;
            line-height: 115%;
            font-size: 11.0pt;
            font-family: Calibri;
        }
        p.ListParagraphCxSpFirst
        {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 0in;
            margin-left: .5in;
            margin-bottom: .0001pt;
            line-height: 115%;
            font-size: 11.0pt;
            font-family: Calibri;
        }
        p.ListParagraphCxSpMiddle
        {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 0in;
            margin-left: .5in;
            margin-bottom: .0001pt;
            line-height: 115%;
            font-size: 11.0pt;
            font-family: Calibri;
        }
        p.ListParagraphCxSpLast
        {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 10.0pt;
            margin-left: .5in;
            line-height: 115%;
            font-size: 11.0pt;
            font-family: Calibri;
        }
        .style17
        {
            width: 61px;
        }
    </style>
    <!-- Talk -->
    <link href="../../Content/js/Talk_Register/jquery.tooltip.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../jquery.min.js"></script>

    <script src="../../Content/js/Talk_Register/jquery.tooltip.js" type="text/javascript"></script>

    <script type="text/javascript">
      $j = jQuery.noConflict();
      $j(document).ready(function(){
        $j("div.item").tooltip();
      });
    </script>

    <!-- Talk -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style6">
        <tr>
            <td>
                <img src="../../content/images/Home/Register.gif" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl" runat="server" Style="color: #FF0000; font-size: 12px;"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style6">
                    <tr>
                        <td class="style7">
                            <table class="style6">
                                <tr>
                                    <td>
                                        <span style="font-family: KoodakShaahr; font-size: 22px; color: #1D95B6;">گام اول</span>
                                        <span style="font-family: KoodakShaahr; font-size: 14px; color: #929DA3;">/ پست الکترونیکی
                                        </span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtEmail"
                                            ErrorMessage="●" Font-Size="18px" ToolTip="وارد کردن پست الکترونیکی اجباری است."
                                            ValidationGroup="1"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                                            ErrorMessage="●" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                            ValidationGroup="1" Font-Size="18px"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <div style="background-color: #ccc; width: 495px; height: 30px; -moz-border-radius: 5px;
                                direction: ltr; padding: 5px">
                                <div id="item_3" class="item">
                                    <asp:TextBox ID="txtEmail" runat="server" Style="border: none; width: 495px; text-align: left;
                                        font-size: 20px;" Height="27px"></asp:TextBox>
                                    <div class="tooltip_description" style="display: none" title="پست الکترونیکی">
                                        برای استفاده از تمام سرویس ها و امکانات شهر از یک پست الکتروینیکی مشترک استفاده
                                        می شود. و به هیچ عنوان امکان تغییر آن وجود ندارد. بنابراین در اتخاب آن دقت کنید.
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style6">
                    <tr>
                        <td class="style7">
                            <table class="style6">
                                <tr>
                                    <td>
                                        <span style="font-family: KoodakShaahr; font-size: 22px; color: #1D95B6;">گام دوم</span>
                                        <span style="font-family: KoodakShaahr; font-size: 14px; color: #929DA3;">/ نام کاربری
                                        </span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtUsername"
                                            ErrorMessage="●" Font-Size="18px" ToolTip="وارد کردن نام کاربری اجباری است."
                                            ValidationGroup="1"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <div style="background-color: #cccccc; width: 495px; height: 30px; -moz-border-radius: 5px;
                                padding: 5px; direction: ltr;">
                                <div id="Div1" class="item">
                                    <asp:TextBox ID="txtUsername" runat="server" Style="border: none; width: 495px; text-align: left;
                                        font-size: 20px;" Height="27px"></asp:TextBox>
                                    <div class="tooltip_description" style="display: none" title="نام کاربری">
                                        <span style="color: #fff;">لطفا نام کاربری خود را بر اساس اگوی زیر انتخاب کنید:<br />
                                        </span>
                                        <ul style="margin-right: 14px; color: #fff;">
                                            <li>نام کاربری بعد از پست الکترونیکی مهمترین مشخصه کاربر می باشد.</li>
                                            <li>اولین حرف آن نباید با عدد شروع شود.</li>
                                            <li>فقط از حروف فارسی استفاده کنید.</li>
                                            <li>در نام کاربری از کارکتر های استاندارد زیر استفاده کنید:
                                                <ul style="margin-right: 10px;">
                                                    <li>حروف مانند a,b,c,d,..</li>
                                                    <li>اعداد مانند 1,2,3,4,...</li>
                                                    <li>کارکتر ویژه زیرخط ( _ )</li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style6">
                    <tr>
                        <td class="style7">
                            <table class="style6">
                                <tr>
                                    <td>
                                        <span style="font-family: KoodakShaahr; font-size: 22px; color: #1D95B6;">گام سوم</span>
                                        <span style="font-family: KoodakShaahr; font-size: 14px; color: #929DA3;">/ مشخصات اصلی
                                        </span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFn_F"
                                            ErrorMessage="●" Font-Size="18px" ToolTip="وارد کردن نام فارسی اجباری است." ValidationGroup="1">
                                        </asp:RequiredFieldValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtLn_F"
                                            ErrorMessage="●" Font-Size="18px" ToolTip="وارد کردن نام خانوادگی فارسی اجباری است."
                                            ValidationGroup="1"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <div style="background-color: #cccccc; width: 501px; height: 93px; -moz-border-radius: 5px;
                                padding: 2px;">
                                <table class="style6">
                                    <tr>
                                        <td class="style12">
                                            نام فارسی:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtFn_F" runat="server" Style="border-style: none; border-color: inherit;
                                                border-width: medium; text-align: right; font-size: 20px; font-family: Tahoma;"
                                                Height="28px" Width="431px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <table class="style6">
                                    <tr>
                                        <td class="style13">
                                            نام خانوادگی فارسی:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLn_F" runat="server" Style="border-style: none; border-color: inherit;
                                                border-width: medium; text-align: right; font-size: 20px; font-family: Tahoma;"
                                                Height="28px" Width="390px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <div>
                                    <asp:RadioButton ID="rbMale" runat="server" Text="مرد هستم" Style="color: #1A6F86;"
                                        GroupName="gender" Checked="True" />
                                    <asp:RadioButton ID="rbFamale" runat="server" Text="زن هستم" Style="color: #1A6F86;"
                                        GroupName="gender" /></div>
                                <br />
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style6">
                    <tr>
                        <td class="style7">
                            <table class="style6">
                                <tr>
                                    <td>
                                        <span style="font-family: KoodakShaahr; font-size: 22px; color: #1D95B6;">گام چهارم</span>
                                        <span style="font-family: KoodakShaahr; font-size: 14px; color: #929DA3;">/ کلمه عبور
                                        </span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPassword"
                                            ErrorMessage="●" Font-Size="18px" ToolTip="وارد کردن کلمه عبور اجباری است." ValidationGroup="1"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <div style="background-color: #cccccc; width: 499px; height: 38px; -moz-border-radius: 5px;
                                padding: 3px">
                                <table class="style6">
                                    <tr>
                                        <td>
                                            <div id="item_3" class="item">
                                                <asp:TextBox ID="txtPassword" runat="server" Style="border: none; width: 493px; text-align: left;direction:ltr;
                                                    font-size: 20px;" Height="30px" TextMode="Password"></asp:TextBox>
                                                <div class="tooltip_description" style="display: none" title="رمز عبور">
                                                    در انتخاب عبور خود دقت کنید و از عبارات ساده و همه گیر استفاده نکنید. برای انتخاب
                                                    کلمه عبور خود به نکات زیر دقت کنید.
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                   
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style6">
                    <tr>
                        <td class="style16">
                            <table class="style6">
                                <tr>
                                    <td>
                                        <span style="font-family: KoodakShaahr; font-size: 22px; color: #1D95B6;">گام پنجم</span>
                                        <span style="font-family: KoodakShaahr; font-size: 14px; color: #929DA3;">/ انتخاب جمله امنیتی
                                        </span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtSecurityStatement"
                                            ErrorMessage="●" Font-Size="18px" ToolTip="وارد کردن کلمه عبور دوم اجباری است."
                                            ValidationGroup="1"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <div style="background-color: #cccccc; width: 495px; height: 47px; -moz-border-radius: 5px;
                                padding: 4px">
                                <div id="item_3" class="item">
                                    <asp:TextBox ID="txtSecurityStatement" runat="server" Style="border-style: none;
                                        border-color: inherit; border-width: medium; width: 495px; text-align: right;
                                        font-size: 15px; font-family: Tahoma; resize: none;" Height="45px" TextMode="MultiLine"></asp:TextBox>
                                    <div class="tooltip_description" style="display: none" title="جمله امنیتی ">
                                        یکی از لایه های امنیتی شهر این جمله می باشد که کاربران را از یکدیگر متمایز می کند.
                                        توجه کنید که این جمله درمواقع خاصی ممکن است برای کاربر دیگر به منظور انتخاب جمله
                                        امنیتی خود از بین جملات امنیتی کاربران دیگر به نمایش در بیاید بنابراین در انتخاب
                                        آن دقت فرمایید.
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style6">
                    <tr>
                        <td class="style17">
                            <span style="font-family: KoodakShaahr; font-size: 22px; color: #585858;">قوانین </span>
                        </td>
                        <td>
                            <span style="font-family: KoodakShaahr; font-size: 15px; color: #585858;">
                                <asp:CheckBox ID="Chk_Raw" runat="server" Text="قوانین شهر را می پذیرم." />
                                / </span><a href="../../MyShaahr/Help/Default.aspx" style="color: Gray; text-decoration: none;"
                                    target="_blank">مشاهده قوانین </a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UP_Captcha" runat="server">
                    <ContentTemplate>
                        <uc1:Captcha ID="Captcha" runat="server" />
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UP_Captcha">
                            <ProgressTemplate>
                                <img src="../../Content/images/Profile_View_Users/Loading_0.gif" />
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="text-align: left; padding-left: 4px;">
                <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnRegister" runat="server"
                    ImageUrl="~/content/images/Home/endRegister.png" ValidationGroup="1" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
