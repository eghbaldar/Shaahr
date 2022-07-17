<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false" CodeFile="Management.aspx.vb" Inherits="Management_Admin_Management" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style13
        {
            width: 162px;
            background-color: #FFD697;
        }
        .style14
        {
            width: 97px;
            background-color: #FFCCFF;
        }
        .style15
        {
            width: 105px;
            background-color: #A6FFA6;
        }
        .style16
        {
            width: 118px;
        }
        .style17
        {
            color: #FF0000;
            background-color: #A6FFA6;
        }
        .style18
        {
            background-color: #FFFFCC;
        }
        .style19
        {
            width: 118px;
            background-color: #FFFFCC;
        }
        .style20
        {
            background-color: #66FFFF;
        }
        .style21
        {
            background-color: #CCFFFF;
        }
        .style22
        {
            background-color: #FFCCFF;
        }
        .style23
        {
            background-color: #A6FFA6;
        }
        .style24
        {
            background-color: #FFD697;
        }
        .style25
        {
            color: #FFFFFF;
            background-color: #FF0000;
        }
        .style26
        {
            width: 118px;
            color: #FFFFFF;
            background-color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                <b>تنظیمات ورودی</b></td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style13">
                            وضعیت ورودی:</td>
                        <td class="style24">
                            <asp:CheckBox ID="chkDontEnter" runat="server" Text="غیر قابل ورود" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            اطلاعیه منع ورود:</td>
                        <td class="style24">
                            <asp:TextBox ID="txtDontEnterText" runat="server" 
                                style="font-family: Tahoma; font-size: 11px" Width="789px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            &nbsp;</td>
                        <td class="style24">
                            <asp:Button ID="btnUpdateDontEnter" runat="server" 
                                style="font-family: Tahoma; font-size: 11px" Text="ثبت اطلاعات" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="background-color: #CC99FF">
                تنظیمات ثبت نام</td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style14">
                            حق ثبت نام:</td>
                        <td class="style22">
                            <asp:CheckBox ID="chkDontReg" runat="server" Text="ندارند" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td class="style22">
                            <asp:Button ID="btnUpdateDontReg" runat="server" 
                                style="font-family: Tahoma; font-size: 11px" Text="ثبت اطلاعات" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="color: #FFFFFF; background-color: #006666">
                Header صفحه اصلی</td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style15">
                            تصویر فعلی:</td>
                        <td class="style23">
                            <asp:Image ID="imgHeaderHome" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style15">
                            بارگزاری تصویر جدید:</td>
                        <td class="style23">
                            <asp:FileUpload ID="FileUp_Header" runat="server" />
&nbsp;نوع فایل حتما JPEG یا JPG باید باشد.</td>
                    </tr>
                    <tr>
                        <td class="style15">
                            &nbsp;</td>
                        <td class="style17">
                            حداکثر:&nbsp; width: 956px -&nbsp;&nbsp; height: 58px</td>
                    </tr>
                    <tr>
                        <td class="style15">
                            &nbsp;</td>
                        <td class="style23">
                            <asp:Button ID="btnUpdateHeaderHome" runat="server" 
                                style="font-family: Tahoma; font-size: 11px" Text="ثبت اطلاعات" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="background-color: #66FFFF">
                Header صفحات پروفایل</td>
        </tr>
        <tr>
            <td style="background-color: #CCFFFF">
                <span class="style20">
                <asp:Image ID="imgHeaderProfile" runat="server" Height="90px" Width="900px" />
                </span>
            </td>
        </tr>
        <tr>
            <td style="background-color: #CCFFFF">
                <span class="style20">
                <asp:FileUpload ID="FileUp_Profile" runat="server" />
                </span>نو<span class="style21">ع فایل حتما JPEG یا JPG باید باشد.</span></td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnUpdateHeaderProfile" runat="server" 
                    style="font-family: Tahoma; font-size: 11px" Text="ثبت اطلاعات" />
            </td>
        </tr>
        <tr>
            <td style="background-color: #FFFF99">
                اطلاعات بالا صفحه</td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style19">
                            متن بالای صفحه:</td>
                                            <td class="style18">
                                                <asp:TextBox ID="txtTopText" runat="server" 
                                                    style="font-family: Tahoma; font-size: 11px" Width="789px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style19">
                                                &nbsp;</td>
                                            <td class="style18">
                                                <asp:Button ID="btnUpdateTextTop" runat="server" 
                                                    style="font-family: Tahoma; font-size: 11px" Text="ثبت اطلاعات" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style19">
                                                تصویر فعلی:</td>
                        <td class="style18">
                            <asp:Image ID="ImgTopLogo" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style19">
                            بارگزاری تصویر فعلی:</td>
                        <td class="style18">
                            <asp:FileUpload ID="FileUp_TopLogo" runat="server" />
                            نوع فایل حتما JPEG یا JPG باید باشد.</td>
                    </tr>
                    <tr>
                        <td class="style19">
                        </td>
                        <td class="style18">
                            <asp:Button ID="btnUpdateTopLogo" runat="server" 
                                style="font-family: Tahoma; font-size: 11px; height: 21px" Text="ثبت اطلاعات" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style26">
                            عکس و متن روز:</td>
                        <td class="style25">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style16">
                            تصویر روز:</td>
                        <td>
                            <asp:FileUpload ID="FileUp_PicDay" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style16">
                            &nbsp;</td>
                        <td>
                            <asp:Image ID="imgPicDay" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style16">
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="btnSendDayPic" runat="server" 
                                style="font-family: Tahoma; font-size: 11px" Text="ارسال تصویر" />
                                            </td>
                    </tr>
                    <tr>
                        <td class="style16">
                            متن روز:</td>
                        <td>
                            <asp:TextBox ID="txtTextDay" runat="server" Height="93px" 
                                style="font-family: Tahoma; font-size: 11px" TextMode="MultiLine" Width="320px"></asp:TextBox>
                                            </td>
                    </tr>
                    <tr>
                        <td class="style16">
                            لینک:</td>
                        <td>
                            <asp:TextBox ID="txtDayLink" runat="server" style="text-align: left" 
                                Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style16">
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="btnDay" runat="server" 
                                style="font-family: Tahoma; font-size: 11px" Text="ارسال" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style16">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

