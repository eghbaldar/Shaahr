<%@ Page Language="VB" MasterPageFile="~/home/Menu/Setting/Home.master" AutoEventWireup="false"
    CodeFile="attrib.aspx.vb" Inherits="home_Menu_Setting_attrib" Title="Untitled Page" %>

<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="DelayedSubmit" Namespace="DelayedSubmit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Dropdownlist  -->
    <link href="../../../content/js/Dropdownlist/Styles/Selectbox.css" rel="stylesheet"
        type="text/css" />

    <script src="../../../content/js/Dropdownlist/Scripts/jquery-1.5.1.js" type="text/javascript"
        charset="utf-8"></script>

    <script type="text/javascript" src="../../../content/js/Dropdownlist/Scripts/jquery.selectbox-0.5.js"></script>

    <script type="text/javascript">
	    $(document).ready(function () {
	        $('.selectbox').selectbox();
	    });
    </script>

    <!-- End  -->
    <style type="text/css">
        .style6
        {
            width: 100%;
        }
        .style7
        {
            width: 55px;
        }
        .style8
        {
            width: 80px;
        }
        .style9
        {
            width: 304px;
        }
        .style10
        {
            color: #174658;
        }
        .style11
        {
            width: 115px;
        }
        .stPersianField
        {
            text-align: right;
            border: 1px solid #ccc;
            font-family: Tahoma;
            font-size: 11px;
        }
        .stEnglishField
        {
            text-align: left;
            border: 1px solid #ccc;
            font-family: Tahoma;
            font-size: 11px;
        }
        .style12
        {
            width: 108px;
        }
        .style13
        {
            width: 100px;
        }
        .style14
        {
            width: 177px;
        }
        .style15
        {
            font-weight: bold;
            width: 365px;
        }
        .style16
        {
            text-align: left;
            font-weight: bold;
        }
        .style17
        {
            width: 103px;
        }
        .style18
        {
            color: #666666;
            font-size: 10px;
        }
        .style19
        {
            width: 40px;
        }
        .style20
        {
            width: 102px;
        }
        .style21
        {
            width: 136px;
        }
        .style22
        {
            color: #666666;
        }
        .cmd
        {
            font-size: 11px;
            font-family: Tahoma;
            padding: 2px;
            border: 1px solid #898989;
        }
        .style23
        {
            width: 162px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <table style="width: 100%;">
        <tr>
            <td style="width: 13px;">
                <img alt="" src="../../../content/images/Home/attrib_Org.jpg" style="width: 22px;
                    height: 18px" />
            </td>
            <td>
                <asp:LinkButton Style="color: Black; text-decoration: none;" ID="btnOrginalInfo"
                    runat="server" Text="اطلاعات اصلی" OnClick="btnOrginalInfo_Click" />
            </td>
        </tr>
        <tr>
            <td style="width: 13px;">
                <img alt="" src="../../../content/images/Home/attrib_Per.jpg" style="width: 22px;
                    height: 18px" />
            </td>
            <td>
                <asp:LinkButton Style="color: Black; text-decoration: none;" ID="btnPersonalInfo"
                    runat="server" Text="اطلاعات فردی" OnClick="btnPersonalInfo_Click" />
            </td>
        </tr>
        <tr>
            <td style="width: 13px;">
                <img alt="" src="../../../content/images/Home/attrib_fav.jpg" style="width: 22px;
                    height: 23px" />
            </td>
            <td>
                <asp:LinkButton Style="color: Black; text-decoration: none;" ID="btnFavoritInfo"
                    runat="server" Text="علاقه مندی ها" OnClick="btnFavoritInfo_Click" />
            </td>
        </tr>
        <tr>
            <td style="width: 13px;">
                <img alt="" src="../../../content/images/Home/attrib_cont.jpg" style="width: 22px;
                    height: 18px" />
            </td>
            <td>
                <asp:LinkButton Style="color: Black; text-decoration: none;" ID="btnContactInfo"
                    runat="server" Text="اطلاعات ارتباطی" OnClick="btnContactInfo_Click" />
            </td>
        </tr>
        <tr>
            <td style="width: 13px;">
                <img alt="" src="../../../content/images/Home/attrib_out.jpg" style="width: 22px;
                    height: 18px" />
            </td>
            <td>
                <asp:LinkButton Style="color: Black; text-decoration: none;" ID="btnOutwardInfo"
                    runat="server" Text="اطلاعات ظاهری" OnClick="btnOutwardInfo_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 727px;">
            مدیریت مشخصات فردی
        </div>
        <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
            <asp:View ID="V_OrginalInfo" runat="server">
                <div>
                    <div style="width: 290px; height: 100px; float: right;">
                        <table style="width: 100%;">
                            <tr>
                                <td style="width: 135px;">
                                    نام کاربری :
                                </td>
                                <td style="text-align: right; color: #9c9c9c;">
                                    <asp:Label ID="lblUsername_org" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 135px;">
                                    پست الکترونیکی ثبت شده :
                                </td>
                                <td style="text-align: right; color: #9c9c9c;">
                                    <asp:Label ID="lblEmail_org" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 135px;">
                                    تاریخ عضویت در شهر :
                                </td>
                                <td style="text-align: right; color: #9c9c9c;">
                                    <asp:Label ID="lblRegDate_org" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 135px;">
                                    مدت عضویت&nbsp; در شهر :
                                </td>
                                <td style="text-align: right;" class="style10">
                                    <asp:Label ID="lblDateReg" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div style="width: 447px; height: 100%; float: right;">
                        <div style="background-color: #e9f2f5; height: 14px; padding: 2px; color: #6c6c6c;
                            float: right; width: 443px; margin-top: 2px;">
                            تغییر نام کاربری
                        </div>
                        <div style="height: 100%; float: right;">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <table class="style6">
                                        <tr>
                                            <td>
                                                <table class="style6">
                                                    <tr>
                                                        <td style="font-style: italic;">
                                                            اعتبار سنجی
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <table class="style6">
                                                                <tr>
                                                                    <td class="style7">
                                                                        کلمه عبور :
                                                                    </td>
                                                                    <td style="direction: ltr;">
                                                                        <asp:TextBox ID="txtPass_User" Style="border: 1px solid #ccc; text-align: left;"
                                                                            runat="server" Width="341px" TextMode="Password"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnAuthUser" runat="server"
                                                                            ImageUrl="~/content/images/Home/attrib_auth.jpg" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Panel ID="Pnl_ChangeUsername" runat="server" Enabled="False">
                                                    <table class="style6">
                                                        <tr>
                                                            <td>
                                                                <ul style="margin-right: 14px; color: #575757;">
                                                                    <li>نام کاربری مانند ایمیل شما منحصر بفرد است.</li><li>اولین حرف آن نباید با عدد شروع
                                                                        شود.</li><li>فقط از حروف فارسی استفاده کنید.</li><li>در نام کاربری از کارکتر های استاندارد
                                                                            زیر استفاده کنید:
                                                                            <ul style="margin-right: 10px;">
                                                                                <li>حروف مانند a,b,c,d,..</li><li>اعداد مانند 1,2,3,4,...</li><li>کارکتر ویژه زیرخط
                                                                                    ( _ )</li></ul>
                                                                        </li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <table class="style6">
                                                                    <tr>
                                                                        <td class="style8">
                                                                            نام کاربری جدید :
                                                                        </td>
                                                                        <td class="style9">
                                                                            <asp:TextBox ID="txtNewUsername" 
                                                                            runat="server" 
                                                                            Style="border: 1px solid #ccc;text-align:left;direction:ltr;" Width="317px"></asp:TextBox>
                                                                        </td>
                                                                        <td>
                                                                            <asp:ImageButton ID="btnUpdateUsername" runat="server" ForeColor="Transparent" runat="server"
                                                                                ImageUrl="~/content/images/Home/Register.jpg" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblUserName_auth" runat="server" Style="color: red;"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                                                    <ProgressTemplate>
                                                                        <img alt="" src="../../../content/images/Profile_View_Users/Loading_0.gif" style="width: 18px;
                                                                            height: 17px" /></ProgressTemplate>
                                                                </asp:UpdateProgress>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div style="background-color: #e9f2f5; height: 14px; padding: 2px; color: #6c6c6c;
                            float: right; width: 443px; margin-top: 2px;">
                            تغییر کلمه عبور
                        </div>
                        <div style="height: 100%; float: right;">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <table class="style6">
                                        <tr>
                                            <td>
                                                <table class="style6">
                                                    <tr>
                                                        <td style="font-style: italic;">
                                                            اعتبار سنجی
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <table class="style6">
                                                                <tr>
                                                                    <td class="style7">
                                                                        کلمه عبور :
                                                                    </td>
                                                                    <td style="direction: ltr;">
                                                                        <asp:TextBox ID="txtPass_Pass" Style="border: 1px solid #ccc; text-align: left;"
                                                                            runat="server" Width="341px" TextMode="Password"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:ImageButton ID="btnAuthPass" runat="server" ForeColor="Transparent" runat="server"
                                                                            ImageUrl="~/content/images/Home/attrib_auth.jpg" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Panel ID="Pnl_ChangePassword" runat="server" Enabled="False">
                                                    <table class="style6">
                                                        <tr>
                                                            <td>
                                                                <ul style="margin-right: 14px; color: #575757;">
                                                                    <li>به نکات زیر در انتخاب کلمه عبور توجه کنید:
                                                                        <ul style="margin-right: 10px;">
                                                                            <li>بهتر است از عبارت های پیچیده استفاده کنید</li><li>از کارکر فاصله استفاده نکنید</li><li>
                                                                                بعد از انتخاب کلمه عبور را در جایی یادداشت کنید</li></ul>
                                                                    </li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <table class="style6">
                                                                    <tr>
                                                                        <td class="style8">
                                                                            کلمه عبور جدید :
                                                                        </td>
                                                                        <td class="style9" style="direction: ltr;">
                                                                            <asp:TextBox ID="txtNewPassword" runat="server" Style="border: 1px solid #ccc;" Width="317px"
                                                                                TextMode="Password"></asp:TextBox>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;&nbsp;
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="style8">
                                                                            تکرار کلمه عبور :
                                                                        </td>
                                                                        <td class="style9" style="direction: ltr;">
                                                                            <asp:TextBox ID="txtNewPasswordReapet" runat="server" Style="border: 1px solid #ccc;"
                                                                                Width="317px" TextMode="Password"></asp:TextBox>
                                                                        </td>
                                                                        <td>
                                                                            <asp:ImageButton ID="btnUpdatePassword" runat="server" ForeColor="Transparent" runat="server"
                                                                                ImageUrl="~/content/images/Home/Register.jpg" ValidationGroup="1" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblPassword_auth" runat="server" Style="color: red;"></asp:Label><asp:CompareValidator
                                                                    ID="CompareValidator1" runat="server" ControlToCompare="txtNewPassword" ControlToValidate="txtNewPasswordReapet"
                                                                    ErrorMessage="دو کلمه عبور با یکدیگر هم خوانی ندارند" Style="color: #666666"
                                                                    ValidationGroup="1"></asp:CompareValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                                                    <ProgressTemplate>
                                                                        <img alt="" src="../../../content/images/Profile_View_Users/Loading_0.gif" style="width: 18px;
                                                                            height: 17px" /></ProgressTemplate>
                                                                </asp:UpdateProgress>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div style="background-color: #ffcaca; height: 14px; padding: 2px; color: #000; float: right;
                            width: 443px; margin-top: 2px;">
                            کلمه عبور خود را فراموش کرده ام
                        </div>
                        <div style="height: 100%; float: right;">
                            <table class="style6">
                                <tr>
                                    <td>
                                        <table class="style6">
                                            <tr>
                                                <td>
                                                    <table class="style6">
                                                        <tr>
                                                            <td>
                                                                پست الکترونیکی خود را برای ارسال جدید کلمه عبور وارد کنید:
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="direction: ltr;">
                                                                <asp:TextBox ID="txtSendPass" runat="server" Style="border: 1px solid #ccc; text-align: left;"
                                                                    Width="400px"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:ImageButton ID="ImageButton2" runat="server" runat="server" ForeColor="Transparent"
                                                                    ImageUrl="~/content/images/Home/Register.jpg" ValidationGroup="send" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtSendPass"
                                                                    ErrorMessage="پست الکترونیکی را وارد کنید" ValidationGroup="send"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtSendPass"
                                                                    ErrorMessage="فرمت پست اکترونیکی درست نمی باشد" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                                    ValidationGroup="send"></asp:RegularExpressionValidator>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Panel ID="Panel1" runat="server" Enabled="False">
                                            <table class="style6">
                                                <tr>
                                                    <td>
                                                        <ul style="margin-right: 14px; color: red;">
                                                            <li>توجه:
                                                                <ul style="margin-right: 10px;">
                                                                    <li>کلمه عبور به پست الکترونیکی شما ارسال خواهد شد</li>
                                                                    <li>کلمه عبور ارسالی بصورت تصادفی انتخاب خواهد شد</li>
                                                                    <li>بعد از وارد شدن با کلمه عبور جدید هرچه سریعتر برای تغییر آن اقدام فرمایید</li>
                                                                </ul>
                                                            </li>
                                                        </ul>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="V_PersonalInfo" runat="server">
                <div style="float: right;">
                    <table style="width: 100%;">
                        <tr>
                            <td class="style11">
                                نام:
                            </td>
                            <td class="style12">
                                <asp:TextBox ID="txtNameFN" runat="server" class="stPersianField" Width="198px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNameFN"
                                    ErrorMessage="●" ValidationGroup="2"></asp:RequiredFieldValidator>
                                <span style="color: Gray">فقط از حروف فارسی استفاده شود.</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                نام خانوادگی:
                            </td>
                            <td class="style12">
                                <asp:TextBox ID="txtFamilyFN" runat="server" class="stPersianField" Width="198px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFamilyFN"
                                    ErrorMessage="●" ValidationGroup="2"></asp:RequiredFieldValidator>
                                <span style="color: Gray">فقط از حروف فارسی استفاده شود.</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                نام انگلیسی:
                            </td>
                            <td class="style12">
                                <asp:TextBox ID="txtNameEN" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNameEN"
                                    ErrorMessage="●" ValidationGroup="2"></asp:RequiredFieldValidator>
                                <span style="color: Gray">فقط از حروف انگلیسی استفاده شود.</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                نام خانوادگی انگلیسی:
                            </td>
                            <td class="style12">
                                <asp:TextBox ID="txtFamilyEn" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFamilyEn"
                                    ErrorMessage="●" ValidationGroup="2"></asp:RequiredFieldValidator>
                                <span style="color: Gray">فقط از حروف انگلیسی استفاده شود.</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                نام مستعار:
                            </td>
                            <td class="style12">
                                <asp:TextBox ID="txtAlias" runat="server" Style="border: 1px solid #ccc; font-family: Tahoma;
                                    font-size: 11px" Width="198px"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                جنسیت:
                            </td>
                            <td class="style12">
                                <asp:DropDownList runat="server" Width="198px" name="Items" ID="cmbSex" ClientIDMode="Static"
                                    class="selectbox">
                                    <asp:ListItem Value="0">مرد</asp:ListItem>
                                    <asp:ListItem Value="1">زن</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="color: Red;">
                                با تغییر جنسیت ، تمام رابطه های فامیلی شما به حالت دوست تغییر خواهد کرد و همچنین
                                تمام درخواست های فامیلی ارسال شده و دریافت شده حذف میگردد.
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                وضعیت تاهل:
                            </td>
                            <td class="style12">
                                <asp:DropDownList ID="cmbMarrid" runat="server" class="selectbox" ClientIDMode="Static"
                                    name="Items" Width="198px">
                                    <asp:ListItem Value="0">مجرد</asp:ListItem>
                                    <asp:ListItem Value="1">متاهل</asp:ListItem>
                                    <asp:ListItem Value="2">طلاق گرفته</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                تاریخ تولد:
                            </td>
                            <td class="style12">
                                <div>
                                    <div style="float: right;">
                                        <asp:DropDownList ID="cmbDay" runat="server" class="cmd">
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                            <asp:ListItem>7</asp:ListItem>
                                            <asp:ListItem>8</asp:ListItem>
                                            <asp:ListItem>9</asp:ListItem>
                                            <asp:ListItem>10</asp:ListItem>
                                            <asp:ListItem>11</asp:ListItem>
                                            <asp:ListItem>12</asp:ListItem>
                                            <asp:ListItem>13</asp:ListItem>
                                            <asp:ListItem>14</asp:ListItem>
                                            <asp:ListItem>15</asp:ListItem>
                                            <asp:ListItem>16</asp:ListItem>
                                            <asp:ListItem>17</asp:ListItem>
                                            <asp:ListItem>18</asp:ListItem>
                                            <asp:ListItem>19</asp:ListItem>
                                            <asp:ListItem>20</asp:ListItem>
                                            <asp:ListItem>21</asp:ListItem>
                                            <asp:ListItem>22</asp:ListItem>
                                            <asp:ListItem>23</asp:ListItem>
                                            <asp:ListItem>24</asp:ListItem>
                                            <asp:ListItem>25</asp:ListItem>
                                            <asp:ListItem>26</asp:ListItem>
                                            <asp:ListItem>27</asp:ListItem>
                                            <asp:ListItem>28</asp:ListItem>
                                            <asp:ListItem>28</asp:ListItem>
                                            <asp:ListItem>30</asp:ListItem>
                                            <asp:ListItem>31</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div style="float: right; margin-right: 12px;">
                                        <asp:DropDownList ID="cmbMonth" runat="server" class="cmd">
                                            <asp:ListItem Value="1">فروردین</asp:ListItem>
                                            <asp:ListItem Value="2">اردیبهشت</asp:ListItem>
                                            <asp:ListItem Value="3">خرداد</asp:ListItem>
                                            <asp:ListItem Value="4">تیر</asp:ListItem>
                                            <asp:ListItem Value="5">مرداد</asp:ListItem>
                                            <asp:ListItem Value="6">شهریور</asp:ListItem>
                                            <asp:ListItem Value="7">مهر</asp:ListItem>
                                            <asp:ListItem Value="8">آبان</asp:ListItem>
                                            <asp:ListItem Value="9">آذر</asp:ListItem>
                                            <asp:ListItem Value="10">دی</asp:ListItem>
                                            <asp:ListItem Value="11">بهمن</asp:ListItem>
                                            <asp:ListItem Value="12">اسفند</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div style="float: right; margin-right: 12px;">
                                        <asp:DropDownList ID="cmbYears" runat="server" class="cmd">
                                            <asp:ListItem>1390</asp:ListItem>
                                            <asp:ListItem>1389</asp:ListItem>
                                            <asp:ListItem>1388</asp:ListItem>
                                            <asp:ListItem>1387</asp:ListItem>
                                            <asp:ListItem>1386</asp:ListItem>
                                            <asp:ListItem>1385</asp:ListItem>
                                            <asp:ListItem>1384</asp:ListItem>
                                            <asp:ListItem>1383</asp:ListItem>
                                            <asp:ListItem>1382</asp:ListItem>
                                            <asp:ListItem>1381</asp:ListItem>
                                            <asp:ListItem>1380</asp:ListItem>
                                            <asp:ListItem>1379</asp:ListItem>
                                            <asp:ListItem>1378</asp:ListItem>
                                            <asp:ListItem>1377</asp:ListItem>
                                            <asp:ListItem>1376</asp:ListItem>
                                            <asp:ListItem>1375</asp:ListItem>
                                            <asp:ListItem>1374</asp:ListItem>
                                            <asp:ListItem>1373</asp:ListItem>
                                            <asp:ListItem>1372</asp:ListItem>
                                            <asp:ListItem>1371</asp:ListItem>
                                            <asp:ListItem>1370</asp:ListItem>
                                            <asp:ListItem>1369</asp:ListItem>
                                            <asp:ListItem>1368</asp:ListItem>
                                            <asp:ListItem>1367</asp:ListItem>
                                            <asp:ListItem>1366</asp:ListItem>
                                            <asp:ListItem>1365</asp:ListItem>
                                            <asp:ListItem>1364</asp:ListItem>
                                            <asp:ListItem>1363</asp:ListItem>
                                            <asp:ListItem>1362</asp:ListItem>
                                            <asp:ListItem>1361</asp:ListItem>
                                            <asp:ListItem>1360</asp:ListItem>
                                            <asp:ListItem>1359</asp:ListItem>
                                            <asp:ListItem>1358</asp:ListItem>
                                            <asp:ListItem>1357</asp:ListItem>
                                            <asp:ListItem>1356</asp:ListItem>
                                            <asp:ListItem>1355</asp:ListItem>
                                            <asp:ListItem>1354</asp:ListItem>
                                            <asp:ListItem>1353</asp:ListItem>
                                            <asp:ListItem>1352</asp:ListItem>
                                            <asp:ListItem>1351</asp:ListItem>
                                            <asp:ListItem>1350</asp:ListItem>
                                            <asp:ListItem>1349</asp:ListItem>
                                            <asp:ListItem>1348</asp:ListItem>
                                            <asp:ListItem>1347</asp:ListItem>
                                            <asp:ListItem>1346</asp:ListItem>
                                            <asp:ListItem>1345</asp:ListItem>
                                            <asp:ListItem>1344</asp:ListItem>
                                            <asp:ListItem>1343</asp:ListItem>
                                            <asp:ListItem>1342</asp:ListItem>
                                            <asp:ListItem>1341</asp:ListItem>
                                            <asp:ListItem>1340</asp:ListItem>
                                            <asp:ListItem>1339</asp:ListItem>
                                            <asp:ListItem>1338</asp:ListItem>
                                            <asp:ListItem>1337</asp:ListItem>
                                            <asp:ListItem>1336</asp:ListItem>
                                            <asp:ListItem>1335</asp:ListItem>
                                            <asp:ListItem>1334</asp:ListItem>
                                            <asp:ListItem>1333</asp:ListItem>
                                            <asp:ListItem>1332</asp:ListItem>
                                            <asp:ListItem>1331</asp:ListItem>
                                            <asp:ListItem>1330</asp:ListItem>
                                            <asp:ListItem>1329</asp:ListItem>
                                            <asp:ListItem>1328</asp:ListItem>
                                            <asp:ListItem>1327</asp:ListItem>
                                            <asp:ListItem>1326</asp:ListItem>
                                            <asp:ListItem>1325</asp:ListItem>
                                            <asp:ListItem>1324</asp:ListItem>
                                            <asp:ListItem>1323</asp:ListItem>
                                            <asp:ListItem>1322</asp:ListItem>
                                            <asp:ListItem>1321</asp:ListItem>
                                            <asp:ListItem>1320</asp:ListItem>
                                            <asp:ListItem>1319</asp:ListItem>
                                            <asp:ListItem>1318</asp:ListItem>
                                            <asp:ListItem>1317</asp:ListItem>
                                            <asp:ListItem>1316</asp:ListItem>
                                            <asp:ListItem>1315</asp:ListItem>
                                            <asp:ListItem>1314</asp:ListItem>
                                            <asp:ListItem>1313</asp:ListItem>
                                            <asp:ListItem>1312</asp:ListItem>
                                            <asp:ListItem>1311</asp:ListItem>
                                            <asp:ListItem>1310</asp:ListItem>
                                            <asp:ListItem>1309</asp:ListItem>
                                            <asp:ListItem>1308</asp:ListItem>
                                            <asp:ListItem>1307</asp:ListItem>
                                            <asp:ListItem>1306</asp:ListItem>
                                            <asp:ListItem>1305</asp:ListItem>
                                            <asp:ListItem>1304</asp:ListItem>
                                            <asp:ListItem>1303</asp:ListItem>
                                            <asp:ListItem>1302</asp:ListItem>
                                            <asp:ListItem>1301</asp:ListItem>
                                            <asp:ListItem>1300</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                ساعت تولد:
                            </td>
                            <td class="style12">
                                <asp:TextBox ID="txtTimeBirth" runat="server" Style="border: 1px solid #ccc; font-family: Tahoma;
                                    font-size: 11px" Width="39px"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;
                                <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="txtTimeBirth"
                                    ErrorMessage="ساعت مورد نظر قابل قبول نمی باشد." MaximumValue="24" MinimumValue="0"
                                    Type="Integer" ValidationGroup="33"></asp:RangeValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                دین:
                            </td>
                            <td class="style12">
                                <asp:DropDownList ID="cmbDin" runat="server" Width="198px" name="Items" ClientIDMode="Static"
                                    class="selectbox">
                                    <asp:ListItem Value="1">-</asp:ListItem>
                                    <asp:ListItem Value="2">اسلام</asp:ListItem>
                                    <asp:ListItem Value="3">مسیحی</asp:ListItem>
                                    <asp:ListItem Value="4">زرتشتی</asp:ListItem>
                                    <asp:ListItem Value="5">یهودی</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                مذهب:
                            </td>
                            <td class="style12">
                                <asp:DropDownList ID="cmbMazhab" runat="server" Width="198px" name="Items" ClientIDMode="Static"
                                    class="selectbox">
                                    <asp:ListItem Value="0">-</asp:ListItem>
                                    <asp:ListItem Value="1">شیعی</asp:ListItem>
                                    <asp:ListItem Value="2">سنی</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                تحصیلات:
                            </td>
                            <td class="style12">
                                <asp:DropDownList ID="cmbTahsilat" runat="server" Width="198px" class="selectbox"
                                    DataSourceID="ODS_Education" DataTextField="Education" DataValueField="Code_Education"
                                    ClientIDMode="Static" name="Items">
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="ODS_Education" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="DS_SettingTableAdapters.CMS_EducationTableAdapter">
                                    <InsertParameters>
                                        <asp:Parameter Name="Education" Type="String" />
                                    </InsertParameters>
                                </asp:ObjectDataSource>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                کشور:
                            </td>
                            <td class="style12">
                                <asp:DropDownList ID="cmbCountry" runat="server" Width="200px" class="stPersianField"
                                    DataSourceID="ODS_Country" DataTextField="NameCountry" DataValueField="code"
                                    AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="ODS_Country" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_SettingTableAdapters.Tbl_CMS_CountryTableAdapter"
                                    UpdateMethod="Update">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Original_code" Type="Int64" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="NameCountry" Type="String" />
                                        <asp:Parameter Name="Original_code" Type="Int64" />
                                    </UpdateParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="NameCountry" Type="String" />
                                    </InsertParameters>
                                </asp:ObjectDataSource>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                استان (ایالت):
                            </td>
                            <td class="style12">
                                <asp:DropDownList ID="cmbState" runat="server" Width="200px" class="stPersianField"
                                    DataSourceID="ODS_State" DataTextField="NameState" DataValueField="code" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="ODS_State" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_SettingTableAdapters.Tbl_CMS_StateTableAdapter"
                                    UpdateMethod="Update">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Original_code" Type="Int64" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="code_country" Type="Int64" />
                                        <asp:Parameter Name="NameState" Type="String" />
                                        <asp:Parameter Name="Original_code" Type="Int64" />
                                    </UpdateParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="cmbCountry" Name="code_country" PropertyName="SelectedValue"
                                            Type="Int64" />
                                    </SelectParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="code_country" Type="Int64" />
                                        <asp:Parameter Name="NameState" Type="String" />
                                    </InsertParameters>
                                </asp:ObjectDataSource>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                شهر:
                            </td>
                            <td class="style12">
                                <asp:DropDownList ID="cmbCity" runat="server" class="stPersianField" DataSourceID="OSD_City"
                                    DataTextField="NameCity" DataValueField="code" Width="200px">
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="OSD_City" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_SettingTableAdapters.Tbl_CMS_CityTableAdapter"
                                    UpdateMethod="Update">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Original_code" Type="Int64" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="code_state" Type="Int64" />
                                        <asp:Parameter Name="NameCity" Type="String" />
                                        <asp:Parameter Name="Original_code" Type="Int64" />
                                    </UpdateParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="cmbState" Name="code" PropertyName="SelectedValue"
                                            Type="Int64" />
                                    </SelectParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="code_state" Type="Int64" />
                                        <asp:Parameter Name="NameCity" Type="String" />
                                    </InsertParameters>
                                </asp:ObjectDataSource>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                خارج از محدوده:
                            </td>
                            <td class="style12">
                                <asp:TextBox ID="txtNoneAddress" runat="server" class="stPersianField" Width="198px"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                آدرس:
                            </td>
                            <td class="style12">
                                <asp:TextBox Style="resize: none;" ID="txtAddress" runat="server" class="stPersianField"
                                    Height="88px" TextMode="MultiLine" Width="198px"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                زبان خارجی:
                            </td>
                            <td class="style12">
                                <asp:DropDownList ID="cmbLanguage" runat="server" Width="198px" name="Items" ClientIDMode="Static"
                                    class="selectbox" AutoPostBack="True">
                                    <asp:ListItem Value="0">-</asp:ListItem>
                                    <asp:ListItem Value="1">انگلیسی</asp:ListItem>
                                    <asp:ListItem Value="2">فرانسه</asp:ListItem>
                                    <asp:ListItem Value="3">آلمانی</asp:ListItem>
                                    <asp:ListItem Value="4">ایتالیایی</asp:ListItem>
                                    <asp:ListItem Value="5">عربی</asp:ListItem>
                                    <asp:ListItem Value="6">اسپانیایی</asp:ListItem>
                                    <asp:ListItem Value="7">پرتقالی</asp:ListItem>
                                    <asp:ListItem Value="8">اردو</asp:ListItem>
                                    <asp:ListItem Value="9">مالایی</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                سیاست:
                            </td>
                            <td class="style12">
                                <asp:DropDownList ID="cmbPoletic" runat="server" Width="198px" name="Items" ClientIDMode="Static"
                                    class="selectbox">
                                    <asp:ListItem Value="0">-</asp:ListItem>
                                    <asp:ListItem Value="1">سیاست بی سیاست</asp:ListItem>
                                    <asp:ListItem Value="2">راستی</asp:ListItem>
                                    <asp:ListItem Value="3">چپی</asp:ListItem>
                                    <asp:ListItem Value="4">نه راست نه چپ</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                دودی:
                            </td>
                            <td class="style12">
                                <asp:DropDownList ID="cmbDodi" runat="server" class="selectbox" ClientIDMode="Static"
                                    name="Items" Width="198px">
                                    <asp:ListItem Value="0">-</asp:ListItem>
                                    <asp:ListItem Value="1">سیگاری</asp:ListItem>
                                    <asp:ListItem Value="2">قلیونی</asp:ListItem>
                                    <asp:ListItem Value="3">متنفرم..!!</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                وب سایت:
                            </td>
                            <td class="style12">
                                <asp:TextBox ID="txtWebsite" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                            </td>
                            <td class="style22">
                                //:http&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                وبلاگ:
                            </td>
                            <td class="style12">
                                <asp:TextBox ID="txtWeblog" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                            </td>
                            <td class="style22">
                                //:http
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                &nbsp;
                            </td>
                            <td class="style12">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                                <asp:Label ID="lblError" runat="server" Style="color: #FF0000"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                &nbsp;
                            </td>
                            <td class="style12">
                                &nbsp;
                            </td>
                            <td>
                                <asp:ImageButton ID="btnUpdateInfo" runat="server" runat="server" ForeColor="Transparent"
                                    ImageUrl="~/content/images/Home/Register.jpg" ValidationGroup="33" />
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:View>
            <asp:View ID="V_FavoritesInfo" runat="server">
                <div style="padding: 4px; border: 1px solid #C9C9C9; margin-top: 3px;">
                    <table>
                        <tr>
                            <td>
                                <b>جستجوی علاقه مندی ها:</b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <cc1:DelayedSubmitExtender ID="DisableButtonExtender1" runat="server" Timeout="1"
                                                TargetControlID="txtSearch" />
                                            <asp:TextBox ID="txtSearch" AutoPostBack="True" Style="width: 300px; font-family: Tahoma;
                                                font-size: 11px;" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <img src="../../../Content/images/Shaahrs/Root/find.png" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel" runat="server">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="txtSearch" />
                                    </Triggers>
                                    <ContentTemplate>
                                        <asp:DataList ID="DL_Search" runat="server" DataSourceID="ODS_Search" DataKeyField="code"
                                            Width="270px" RepeatColumns="4" RepeatDirection="Horizontal">
                                            <ItemTemplate>
                                                <asp:Panel BackColor='<%# BC_Panel(DataBinder.Eval(Container.DataItem,"code")) %>'
                                                    ID="Panel2" runat="server" Style="border: 1px solid #ccc; width: 167px; height: 50px;
                                                    padding: 3px; margin-right: 3px; -moz-border-radius: 5px;">
                                                    <table style="width: 100%;">
                                                        <tr>
                                                            <td style="width: 24px;">
                                                                <asp:ImageButton ID="ImageButton1" runat="server" ForeColor="Transparent" OnCommand="InsertOrDeleteFavorit"
                                                                    CommandArgument='<%# Eval("code","{0}") %>' runat="server" Height="47px" ImageUrl='<%# Eval("Logo", "~\content\images\Shaahrs\Favorits\Favorits\{0}") %>'
                                                                    Width="47px" />
                                                            </td>
                                                            <td>
                                                                <table style="width: 100%;">
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("title", "{0}") %>'></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label4" runat="server" Text='<%# CountFavoritsUsers(DataBinder.Eval(Container.DataItem,"code")) %>'></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </ItemTemplate>
                                        </asp:DataList>
                                        <asp:ObjectDataSource ID="ODS_Search" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_SettingTableAdapters.FavoritsBySearchTableAdapter"
                                            UpdateMethod="Update">
                                            <DeleteParameters>
                                                <asp:Parameter Name="Original_code" Type="Int64" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="code_category" Type="Int64" />
                                                <asp:Parameter Name="title" Type="String" />
                                                <asp:Parameter Name="Logo" Type="String" />
                                                <asp:Parameter Name="detail" Type="String" />
                                                <asp:Parameter Name="Original_code" Type="Int64" />
                                            </UpdateParameters>
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="txtSearch" Name="title" PropertyName="Text" Type="String" />
                                            </SelectParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="code_category" Type="Int64" />
                                                <asp:Parameter Name="title" Type="String" />
                                                <asp:Parameter Name="Logo" Type="String" />
                                                <asp:Parameter Name="detail" Type="String" />
                                            </InsertParameters>
                                        </asp:ObjectDataSource>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="border: 1px solid #ccc; padding: 3px; margin-top: 4px; float: right;">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <div style="font-weight: bold; float: right; padding-bottom: 2px;">
                                دسته بندی علاقه مندی ها:
                            </div>
                            <div style="float: right; margin-top: 2px;">
                                <div style="float: right; width: 160px; height: 100%;">
                                    <asp:DataList ID="Dl_Favorit" runat="server" DataKeyField="code" DataSourceID="ODS_Favorit_Category">
                                        <ItemTemplate>
                                            <div style="width: 159px; border: 1px solid #ccc; height: 50px;">
                                                <table class="style6">
                                                    <tr>
                                                        <td class="style19">
                                                            <asp:ImageButton ID="ImageButton3" runat="server" ForeColor="Transparent" OnCommand="setSubSet"
                                                                CommandArgument='<%# Eval("code","{0}") %>' runat="server" Height="45px" ImageUrl='<%# Eval("Logo", "~\content\images\Shaahrs\Favorits\FavoritCategory\{0}") %>'
                                                                Width="45px" />
                                                        </td>
                                                        <td>
                                                            <table class="style6">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("title", "{0}") %>'></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label2" runat="server" Text='<%# CountFavorits(DataBinder.Eval(Container.DataItem,"code")) %>'></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                &nbsp;</div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:ObjectDataSource ID="ODS_Favorit_Category" runat="server" DeleteMethod="Delete"
                                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                                        TypeName="DS_SettingTableAdapters.Favorits_CategoryTableAdapter" UpdateMethod="Update">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Original_code" Type="Int64" />
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="title" Type="String" />
                                            <asp:Parameter Name="Logo" Type="String" />
                                            <asp:Parameter Name="Original_code" Type="Int64" />
                                        </UpdateParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="title" Type="String" />
                                            <asp:Parameter Name="Logo" Type="String" />
                                        </InsertParameters>
                                    </asp:ObjectDataSource>
                                </div>
                                <div style="float: right; width: 532px; height: 100%; padding: 3px;">
                                    <asp:DataList ID="DL_Favorits" runat="server" DataKeyField="code" DataSourceID="ODS_FavortisCat"
                                        Width="566px">
                                        <ItemTemplate>
                                            <div style="background-color: #fff; padding-right: 3px; padding-bottom: 3px; color: Gray;
                                                width: 560px; border-bottom: 1px solid #c9c9c9;">
                                                <asp:Label ID="titleLabel" Style="font-weight: bold;" runat="server" Text='<%# Eval("title") %>' />
                                                <asp:Label ID="lblCodeCategory" runat="server" Text='<%# Eval("code") %>' Visible="False" />
                                            </div>
                                            <div style="padding: 3px;">
                                                <asp:DataList ID="DataList2" runat="server" DataSourceID="ODS_Favorits" DataKeyField="code"
                                                    Width="270px" RepeatColumns="3" RepeatDirection="Horizontal">
                                                    <ItemTemplate>
                                                        <asp:Panel BackColor='<%# BC_Panel(DataBinder.Eval(Container.DataItem,"code")) %>'
                                                            ID="Panel2" runat="server" Style="border: 1px solid #ccc; width: 173px; height: 50px;
                                                            padding: 3px; margin-right: 3px; -moz-border-radius: 5px;">
                                                            <table style="width: 100%;">
                                                                <tr>
                                                                    <td style="width: 24px;">
                                                                        <asp:ImageButton ID="ImageButton1" runat="server" ForeColor="Transparent" OnCommand="InsertOrDeleteFavorit"
                                                                            CommandArgument='<%# Eval("code","{0}") %>' runat="server" Height="47px" ImageUrl='<%# Eval("Logo", "~\content\images\Shaahrs\Favorits\Favorits\{0}") %>'
                                                                            Width="47px" />
                                                                    </td>
                                                                    <td>
                                                                        <table style="width: 100%;">
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("title", "{0}") %>'></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label4" runat="server" Text='<%# CountFavoritsUsers(DataBinder.Eval(Container.DataItem,"code")) %>'></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </asp:Panel>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                                <asp:ObjectDataSource ID="ODS_Favorits" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_SettingTableAdapters.FavoritsTableAdapter"
                                                    UpdateMethod="Update">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="Original_code" Type="Int64" />
                                                    </DeleteParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="code_category" Type="Int64" />
                                                        <asp:Parameter Name="title" Type="String" />
                                                        <asp:Parameter Name="Logo" Type="String" />
                                                        <asp:Parameter Name="detail" Type="String" />
                                                        <asp:Parameter Name="Original_code" Type="Int64" />
                                                    </UpdateParameters>
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="code_category" SessionField="FavoritCode" Type="Int64" />
                                                    </SelectParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="code_category" Type="Int64" />
                                                        <asp:Parameter Name="title" Type="String" />
                                                        <asp:Parameter Name="Logo" Type="String" />
                                                        <asp:Parameter Name="detail" Type="String" />
                                                    </InsertParameters>
                                                </asp:ObjectDataSource>
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:ObjectDataSource ID="ODS_FavortisCat" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="DS_SettingTableAdapters.Favorit_CategoryTableAdapter"
                                        InsertMethod="Insert" UpdateMethod="Update">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Original_code" Type="Int64" />
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="title" Type="String" />
                                            <asp:Parameter Name="Logo" Type="String" />
                                            <asp:Parameter Name="detail" Type="String" />
                                            <asp:Parameter Name="Original_code" Type="Int64" />
                                        </UpdateParameters>
                                        <SelectParameters>
                                            <asp:SessionParameter Name="code" SessionField="FavoritCode" Type="Int64" />
                                        </SelectParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="title" Type="String" />
                                            <asp:Parameter Name="Logo" Type="String" />
                                            <asp:Parameter Name="detail" Type="String" />
                                        </InsertParameters>
                                    </asp:ObjectDataSource>
                                </div>
                            </div>
                            <div style="float: right;">
                                <asp:UpdateProgress ID="UpdateProgress3" runat="server">
                                    <ProgressTemplate>
                                        <img src="../../../content/images/Profile_View_Users/Loading_0.gif" />
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </asp:View>
            <asp:View ID="V_ContactInfo" runat="server">
                <table class="style6">
                    <tr>
                        <td>
                            <table class="style6">
                                <tr>
                                    <td class="style20">
                                        ابتدایی:
                                    </td>
                                    <td class="style21">
                                        <asp:TextBox ID="txtSchool" runat="server" class="stPersianField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style20">
                                        راهنمایی:
                                    </td>
                                    <td class="style21">
                                        <asp:TextBox ID="txtMiddle_school" runat="server" class="stPersianField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style20">
                                        دبیرستان:
                                    </td>
                                    <td class="style21">
                                        <asp:TextBox ID="txtHighShcool" runat="server" class="stPersianField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style20">
                                        پیش دانشگاهی:
                                    </td>
                                    <td class="style21">
                                        <asp:TextBox ID="txtPreUniversity" runat="server" class="stPersianField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style20">
                                        دانشگاه:
                                    </td>
                                    <td class="style21">
                                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                            <ContentTemplate>
                                                <div style="border: 1px solid #9dbbc4; padding: 3px; -moz-border-radius: 5px;">
                                                    <asp:Label ID="lblUniversity" runat="server" Style="color: #333333; font-size: 12px"></asp:Label>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
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
                            <asp:UpdatePanel ID="UpUni" runat="server">
                                <ContentTemplate>
                                    <table class="style6">
                                        <tr>
                                            <td>
                                                <asp:CheckBox ID="ChkUni" runat="server" AutoPostBack="True" Text="انتخاب جدید دانشگاه" />
                                                <asp:UpdateProgress ID="UpdateProgress4" runat="server" AssociatedUpdatePanelID="UpUni">
                                                    <ProgressTemplate>
                                                        <img alt="" src="../../../Content/images/Profile_View_Users/Loading_0.gif" style="width: 18px;
                                                            height: 17px" />
                                                    </ProgressTemplate>
                                                </asp:UpdateProgress>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Panel ID="PnlUni" runat="server" Visible="False">
                                                    <div style="-moz-border-radius: 3px; border: 1px solid #ccc;">
                                                        <table class="style6">
                                                            <tr>
                                                                <td>
                                                                    <div style="-moz-border-radius: 3px; background-color: #D6E1E7; padding: 3px; color: gray;">
                                                                        انتخاب نوع دانشگاه</div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:DataList ID="Dl_catUni" runat="server" DataKeyField="Code" DataSourceID="ODS_CatUni"
                                                                        RepeatColumns="8" RepeatDirection="Horizontal">
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton I runat="server" ForeColor="Transparent" D="ImageButton4" runat="server"
                                                                                Height="40px" OnCommand="University" CommandArgument='<%# Eval("code","{0}") %>'
                                                                                ImageUrl='<%# Eval("Logo", "~\Content\images\Shaahrs\University\UniversityCat\{0}") %>'
                                                                                Width="40px" ToolTip='<%# Eval("Name", "{0}") %>' />
                                                                            &nbsp;<br />
                                                                        </ItemTemplate>
                                                                    </asp:DataList>
                                                                    <asp:ObjectDataSource ID="ODS_CatUni" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_SettingTableAdapters.CMS_Category_UniversityTableAdapter"
                                                                        UpdateMethod="Update">
                                                                        <DeleteParameters>
                                                                            <asp:Parameter Name="Original_Code" Type="Int64" />
                                                                        </DeleteParameters>
                                                                        <UpdateParameters>
                                                                            <asp:Parameter Name="Name" Type="String" />
                                                                            <asp:Parameter Name="Logo" Type="String" />
                                                                            <asp:Parameter Name="Original_Code" Type="Int64" />
                                                                        </UpdateParameters>
                                                                        <InsertParameters>
                                                                            <asp:Parameter Name="Name" Type="String" />
                                                                            <asp:Parameter Name="Logo" Type="String" />
                                                                        </InsertParameters>
                                                                    </asp:ObjectDataSource>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div style="-moz-border-radius: 3px; background-color: #D6E1E7; padding: 3px; color: gray;">
                                                                        انتخاب دانشگاه</div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:GridView ID="DG_Uni" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                        DataSourceID="ODS_Uni" ForeColor="#333333" GridLines="None" ShowHeader="False"
                                                                        Width="720px">
                                                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                                        <Columns>
                                                                            <asp:BoundField DataField="code" HeaderText="code" InsertVisible="False" ReadOnly="True"
                                                                                SortExpression="code" Visible="False" />
                                                                            <asp:TemplateField HeaderText="name" SortExpression="name">
                                                                                <EditItemTemplate>
                                                                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                                                                                </EditItemTemplate>
                                                                                <ItemTemplate>
                                                                                    <asp:LinkButton ID="LinkButton1" runat="server" Style="color: #000; text-decoration: none;"
                                                                                        OnCommand="SetUniversity" CommandArgument='<%# Eval("code","{0}") %>' Text='<%# Bind("name") %>' />
                                                                                    <asp:Label ID="Label2" runat="server" Style="color: #999999" Text='<%# Bind("address") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="address" SortExpression="address">
                                                                                <EditItemTemplate>
                                                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                                                                                </EditItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" Visible="False" />
                                                                            <asp:TemplateField HeaderText="picture" SortExpression="picture" Visible="False">
                                                                                <EditItemTemplate>
                                                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("picture") %>'></asp:TextBox>
                                                                                </EditItemTemplate>
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("picture") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:BoundField DataField="address" HeaderText="address" SortExpression="address"
                                                                                Visible="False" />
                                                                        </Columns>
                                                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                                        <EmptyDataTemplate>
                                                                            دانشگاهی وجود ندارد.
                                                                        </EmptyDataTemplate>
                                                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                        <EditRowStyle BackColor="#999999" />
                                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                                    </asp:GridView>
                                                                    <asp:ObjectDataSource ID="ODS_Uni" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                                                                        SelectMethod="GetData" TypeName="DS_SettingTableAdapters.CMS_UniversityTableAdapter">
                                                                        <SelectParameters>
                                                                            <asp:Parameter Name="CodeCategory" Type="Int64" />
                                                                        </SelectParameters>
                                                                        <InsertParameters>
                                                                            <asp:Parameter Name="name" Type="String" />
                                                                            <asp:Parameter Name="address" Type="String" />
                                                                            <asp:Parameter Name="LinkWebsite" Type="String" />
                                                                            <asp:Parameter Name="picture" Type="String" />
                                                                            <asp:Parameter Name="CodeCategory" Type="Int64" />
                                                                        </InsertParameters>
                                                                    </asp:ObjectDataSource>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table style="width: 100%;">
                                <tr>
                                    <td class="style13">
                                        شغل:
                                    </td>
                                    <td class="style14">
                                        <asp:TextBox ID="txtJob" runat="server" class="stPersianField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15">
                                        <div style="direction: ltr;">
                                        </div>
                                    </td>
                                    <td class="style16">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        آدرس محل کار:
                                    </td>
                                    <td class="style14">
                                        <asp:TextBox ID="txtAddressJob" runat="server" class="stPersianField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15">
                                        <div style="direction: ltr;">
                                        </div>
                                    </td>
                                    <td class="style16">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        تلفن محل کار:
                                    </td>
                                    <td class="style14">
                                        <asp:TextBox ID="txtTellJob" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15">
                                        <div style="direction: ltr;">
                                        </div>
                                    </td>
                                    <td class="style16">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        تلفن اضطراری:
                                    </td>
                                    <td class="style14">
                                        <asp:TextBox ID="txtTellEmergncy" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15">
                                        <div style="direction: ltr;">
                                        </div>
                                    </td>
                                    <td class="style16">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        نام شرکت:
                                    </td>
                                    <td class="style14">
                                        <asp:TextBox ID="txtCompany" runat="server" class="stPersianField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15">
                                        <div style="direction: ltr;">
                                        </div>
                                    </td>
                                    <td class="style16">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        محل شرکت:
                                    </td>
                                    <td class="style14">
                                        <asp:TextBox ID="txtAddressCompany" runat="server" class="stPersianField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15">
                                        <div style="direction: ltr;">
                                        </div>
                                    </td>
                                    <td class="style16">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        درباره شرکت:
                                    </td>
                                    <td class="style14">
                                        <asp:TextBox ID="txtAboutCompany" runat="server" class="stPersianField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15">
                                        <div style="direction: ltr;">
                                        </div>
                                    </td>
                                    <td class="style16">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        وب سایت شرکت:
                                    </td>
                                    <td class="style14">
                                        <asp:TextBox ID="txtWebsiteJob" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15">
                                        &nbsp;
                                    </td>
                                    <td class="style16">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        وضعیت ایمیل اصلی:
                                    </td>
                                    <td class="style14">
                                        <asp:RadioButton ID="rbEmailShow" runat="server" GroupName="1" Text="نمایش برای عموم" />
                                        <br />
                                        <asp:RadioButton ID="rbDontShowEmail" runat="server" GroupName="1" Text="غیر قابل نمایش برای عموم" />
                                    </td>
                                    <td class="style15">
                                        &nbsp;
                                    </td>
                                    <td class="style16">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        ایمیل فرعی:
                                    </td>
                                    <td class="style14">
                                        <asp:TextBox ID="txtSecondEmail" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15">
                                        &nbsp;&nbsp;
                                    </td>
                                    <td class="style16">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        &nbsp;
                                    </td>
                                    <td class="style14">
                                        <asp:TextBox ID="txtYahoo" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15">
                                        : Yahoo
                                    </td>
                                    <td class="style16">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        &nbsp;
                                    </td>
                                    <td class="style14">
                                        <asp:TextBox ID="txtGmail" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15">
                                        : Gmail
                                    </td>
                                    <td class="style16">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        &nbsp;
                                    </td>
                                    <td class="style14">
                                        <asp:TextBox ID="txtFacebook" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15">
                                        : Facebook
                                    </td>
                                    <td class="style16">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        &nbsp;
                                    </td>
                                    <td class="style14">
                                        <asp:TextBox ID="txtTwitter" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15">
                                        : Twitter
                                    </td>
                                    <td class="style16">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        &nbsp;
                                    </td>
                                    <td class="style14">
                                        <asp:TextBox ID="txtHotmail" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15">
                                        : Hotmail
                                    </td>
                                    <td class="style16">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        &nbsp;
                                    </td>
                                    <td class="style14">
                                        <asp:TextBox ID="txtooVoo" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15">
                                        : ooVoo
                                    </td>
                                    <td class="style16">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        &nbsp;
                                    </td>
                                    <td class="style14">
                                        <asp:TextBox ID="txtSkype" runat="server" class="stEnglishField" Width="198px"></asp:TextBox>
                                    </td>
                                    <td class="style15">
                                        : Skype
                                    </td>
                                    <td class="style16">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style13">
                                        &nbsp;
                                    </td>
                                    <td class="style14">
                                        &nbsp;
                                    </td>
                                    <td class="style15">
                                        &nbsp;<asp:ImageButton runat="server" ForeColor="Transparent" ID="btnUpdateContact"
                                            runat="server" ImageUrl="~/content/images/Home/Register.jpg" />
                                    </td>
                                    <td class="style16">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="V_OutwardInfo" runat="server">
                <table class="style6">
                    <tr>
                        <td class="style17">
                            قد:
                        </td>
                        <td>
                            <asp:TextBox ID="txtHeight" runat="server" class="stEnglishField" Width="40px"></asp:TextBox>
                            <span class="style18">سانتیمتر</span><asp:RangeValidator ID="RangeValidator2" runat="server"
                                ControlToValidate="txtHeight" ErrorMessage="/ قد در محدوده نمی باشد" MaximumValue="300"
                                MinimumValue="50" Type="Integer" ValidationGroup="44"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            وزن:
                        </td>
                        <td>
                            <asp:TextBox ID="txtWeight" runat="server" class="stEnglishField" Width="40px"></asp:TextBox>
                            <span class="style18">کیلوگرم</span><asp:RangeValidator ID="RangeValidator1" runat="server"
                                ControlToValidate="txtWeight" ErrorMessage=" / وزن در محدوده نمی باشد" MaximumValue="300"
                                MinimumValue="50" Type="Integer" ValidationGroup="44"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            اخلاق:
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbMorality" runat="server" class="selectbox" ClientIDMode="Static"
                                name="Items" Width="198px">
                                <asp:ListItem Value="0">-</asp:ListItem>
                                <asp:ListItem Value="1">جدی</asp:ListItem>
                                <asp:ListItem Value="2">شوخ طبع</asp:ListItem>
                                <asp:ListItem Value="3">دوستانه</asp:ListItem>
                                <asp:ListItem Value="4">شلوغ</asp:ListItem>
                                <asp:ListItem Value="5">تیزهوش</asp:ListItem>
                                <asp:ListItem Value="6">گوشه گیر</asp:ListItem>
                                <asp:ListItem Value="7">خشک</asp:ListItem>
                                <asp:ListItem Value="8">بداخلاق</asp:ListItem>
                                <asp:ListItem Value="9">سایر</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            رفتار:
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbBehaviour" runat="server" class="selectbox" ClientIDMode="Static"
                                name="Items" Width="198px">
                                <asp:ListItem Value="0">-</asp:ListItem>
                                <asp:ListItem Value="1">مهربان</asp:ListItem>
                                <asp:ListItem Value="2">آرام</asp:ListItem>
                                <asp:ListItem Value="3">خونسرد</asp:ListItem>
                                <asp:ListItem Value="4">قاطع</asp:ListItem>
                                <asp:ListItem Value="5">مدعی</asp:ListItem>
                                <asp:ListItem Value="6">عصبانی</asp:ListItem>
                                <asp:ListItem Value="7">پرخاشگرانه</asp:ListItem>
                                <asp:ListItem Value="8">تهاجمی</asp:ListItem>
                                <asp:ListItem Value="9">پرجنب و جوش</asp:ListItem>
                                <asp:ListItem Value="10">سایر</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            نوع پوشش:
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbCover" runat="server" class="selectbox" ClientIDMode="Static"
                                name="Items" Width="198px">
                                <asp:ListItem Value="0">-</asp:ListItem>
                                <asp:ListItem Value="1">سنگین</asp:ListItem>
                                <asp:ListItem Value="2">راحت</asp:ListItem>
                                <asp:ListItem Value="3">معمولی</asp:ListItem>
                                <asp:ListItem Value="4">کت و شلواری (مجلسی)</asp:ListItem>
                                <asp:ListItem Value="5">چادری (حجاب برتر)</asp:ListItem>
                                <asp:ListItem Value="6">اسپرت</asp:ListItem>
                                <asp:ListItem Value="7">مد روز (متغییر)</asp:ListItem>
                                <asp:ListItem Value="8">مارکدار</asp:ListItem>
                                <asp:ListItem Value="9">جین</asp:ListItem>
                                <asp:ListItem Value="10">سایر</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            رنگ پوست:
                        </td>
                        <td>

                            <script type="text/javascript">
                        function sett(st){document.getElementById('div_skin').innerHTML=st;}
                        function gett(){document.getElementById('div_skin').innerHTML='';}
                            </script>

                            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                <ContentTemplate>
                                    <table style="width: 100%">
                                        <tr>
                                            <td style="width: 150px;">
                                                <a onmousemove="return sett('بسیار روشن (سفید)');" onmouseout="return gett();">
                                                    <asp:ImageButton runat="server" ForeColor="Transparent" ID="img_color_skin_1" runat="server"
                                                        ImageUrl="~/Content/images/Home/color_skin_1.gif" />
                                                </a><a onmousemove="return sett('زیتون پوستی یا مدیترانه ای یا آُسیایی (مایل به زرد)');"
                                                    onmouseout="return gett();">
                                                    <asp:ImageButton runat="server" ForeColor="Transparent" ID="img_color_skin_2" runat="server"
                                                        ImageUrl="~/Content/images/Home/color_skin_2.gif" />
                                                </a><a onmousemove="return sett('سبزه (برنزه روشن)');" onmouseout="return gett();">
                                                    <asp:ImageButton runat="server" ForeColor="Transparent" ID="img_color_skin_3" runat="server"
                                                        ImageUrl="~/Content/images/Home/color_skin_3.gif" />
                                                </a><a onmousemove="return sett('قهوه ای روشن (برنزه تیره)');" onmouseout="return gett();">
                                                    <asp:ImageButton runat="server" ForeColor="Transparent" ID="img_color_skin_4" runat="server"
                                                        ImageUrl="~/Content/images/Home/color_skin_4.gif" />
                                                </a><a onmousemove="return sett(' قهوه ای تیره (سیاه – تیره)');" onmouseout="return gett();">
                                                    <asp:ImageButton runat="server" ForeColor="Transparent" ID="img_color_skin_5" runat="server"
                                                        ImageUrl="~/Content/images/Home/color_skin_5.gif" />
                                                </a>
                                                <div id="div_skin" style="width: 250px; height: 10px;">
                                                </div>
                                            </td>
                                            <td>
                                                <asp:UpdateProgress ID="UpdateProgress5" runat="server" AssociatedUpdatePanelID="UpdatePanel5">
                                                    <ProgressTemplate>
                                                        <img src="../../../Content/images/Profile_View_Users/Loading_0.gif" />
                                                    </ProgressTemplate>
                                                </asp:UpdateProgress>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            اندام:
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbOrgan" runat="server" class="selectbox" ClientIDMode="Static"
                                name="Items" Width="198px">
                                <asp:ListItem Value="0">-</asp:ListItem>
                                <asp:ListItem Value="1">چاق</asp:ListItem>
                                <asp:ListItem Value="2">لاغر</asp:ListItem>
                                <asp:ListItem Value="3">معمولی</asp:ListItem>
                                <asp:ListItem Value="4">ورزشکاری</asp:ListItem>
                                <asp:ListItem Value="5">سایر</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            وضعیت مو:
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbStatusH" runat="server" class="selectbox" ClientIDMode="Static"
                                name="Items" Width="198px">
                                <asp:ListItem Value="0">-</asp:ListItem>
                                <asp:ListItem Value="1">صاف</asp:ListItem>
                                <asp:ListItem Value="2">فر</asp:ListItem>
                                <asp:ListItem Value="3">بی مو</asp:ListItem>
                                <asp:ListItem Value="4">کم مو</asp:ListItem>
                                <asp:ListItem Value="5">پر پشت</asp:ListItem>
                                <asp:ListItem Value="6">سایر</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            رنگ مو:
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbHcolor" runat="server" class="selectbox" ClientIDMode="Static"
                                name="Items" Width="198px">
                                <asp:ListItem Value="0">-</asp:ListItem>
                                <asp:ListItem Value="1">مشکی</asp:ListItem>
                                <asp:ListItem Value="2">قهوه ای</asp:ListItem>
                                <asp:ListItem Value="3">بور</asp:ListItem>
                                <asp:ListItem Value="4">طلایی</asp:ListItem>
                                <asp:ListItem Value="5">جو گندمی</asp:ListItem>
                                <asp:ListItem Value="6">سفید</asp:ListItem>
                                <asp:ListItem Value="7">سایر</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            رنگ چشم:
                        </td>
                        <td>
                            <table class="style6">
                                <tr>
                                    <td class="style23">
                                        <asp:DropDownList ID="cmbEyesColor" runat="server" class="selectbox" ClientIDMode="Static"
                                            name="Items" Width="198px">
                                            <asp:ListItem Value="0">-</asp:ListItem>
                                            <asp:ListItem Value="1">مشکی</asp:ListItem>
                                            <asp:ListItem Value="2">قهوه ای
                                            </asp:ListItem>
                                            <asp:ListItem Value="3">آبی</asp:ListItem>
                                            <asp:ListItem Value="4">سبز</asp:ListItem>
                                            <asp:ListItem Value="5">خاکستری</asp:ListItem>
                                            <asp:ListItem Value="6">سایر</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style23">
                                        &nbsp;
                                    </td>
                                    <td>
                                        <asp:ImageButton ID="btnUpdateOutward" runat="server" ForeColor="Transparent" runat="server"
                                            ImageUrl="~/content/images/Home/Register.jpg" ValidationGroup="44" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="V_Success" runat="server">
                <div style="padding: 5px; border: 1px solid #86c97d; -moz-border-radius: 5px; -webkit-border-radius: 5px;
                    margin-top: 3px; background-color: #e9f5e6; border-radius: 5px; height: 15px;
                    color: #2a821d;">
                    اطلاعات با موفقیت ثبت شد.
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
