<%@ Page Language="VB" MasterPageFile="~/home/Menu/Setting/Home.master" AutoEventWireup="false"
    CodeFile="setting.aspx.vb" Inherits="home_Menu_Setting_setting" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        @font-face
        {
            font-family: koodak;
            src: url(      "../../../content/font/W_koodak.TTF" );
        }
        .style6
        {
            width: 387px;
        }
        .style7
        {
            width: 165px;
        }
        .style8
        {
            width: 100px;
        }
    </style>

    <script language="javascript" type="text/javascript">
    function OpenFileUpload()
    { 
        document.getElementById('<%= FileUpload1.ClientID%>').click();
    }    
    </script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 729px;">
            مدیریت مشخصات فردی
        </div>
        <div style="border-bottom: 1px solid #ccc; height: 14px; padding: 2px; float: right;
            color: Black; margin-top: 2px; width: 733px;">
            تغییر عکس سرآمد پروفایل</div>
        <div style="float: right; width: 733px; padding: 3px;">
            <ul style="margin-right: 20px;">
                <li>نکات زیر را در ارسال آواتار رعایت کنید
                    <ul style="margin-right: 10px;">
                        <li>طول عکس ارسالی باید بین 964px تا 970px باشد</li>
                        <li>ارتفاع عکس ارسالی باید بین 88px تا 94px باشد</li>
                        <li>حجم عکس باید کمتر از 90 کیلوبایت باشد</li>
                    </ul>
                </li>
            </ul>
        </div>
        <div style="float: right; text-align: center; width: 743px;">
            <table style="width: 100%;">
                <tr>
                    <td style="text-align: left;" class="style6">
                        <asp:FileUpload ID="FileUpload1" runat="server" Style="display: none;" />
                        <a href="javascript:void(0)" onclick="OpenFileUpload()" style="font-family: koodak;
                            font-size: 12px; color: #000; text-decoration: none; margin-right: 2px; text-shadow: 0.2em 0.2em #DFDFDF;">
                            ( فایل خود را از اینجا انتخاب کنید )</a>
                    </td>
                    <td style="text-align: right;">
                        <asp:ImageButton  runat="server"
                                    ForeColor="Transparent"
                                    ID="btnUpload" ImageUrl="~/content/images/Home/UploadPhoto.jpg"
                            runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="float: right; width: 733px;">
            <asp:Label ID="lblUpload" runat="server" Style="color: Red;"></asp:Label>
        </div>
        <div style="float: right; width: 84px; color: Gray;">
        </div>
        <div style="float: right;">
            <asp:Image  runat="server"
                                    ForeColor="Transparent"
                                    ID="imgBG" runat="server" Height="88px" Width="733px" Style="border: 1px solid #ccc;
                margin-top: 3px; -moz-border-radius: 2px;" />
        </div>
        <div style="float: right; width: 733px;">
            <asp:LinkButton ID="btnClassic" runat="server" Style="text-decoration: none;">(انتخاب حالت کلاسیک)</asp:LinkButton>
        </div>
        <div style="float: right; width: 733px; color: Gray;">
            در این حالت صفحه پروفایل بالا تر میرود و حالت کلاسیکتری وجود می آید مانند سرآمد
            همین صفحه.
        </div>
        <div style="float: right; width: 733px;">
            <asp:LinkButton ID="btnDefault" runat="server" Style="text-decoration: none;">(انتخاب حالت پیش فرض)</asp:LinkButton>
        </div>
        <div style="float: right; width: 733px; color: Gray; height: 30px;">
            در این حالت تصویر پیش فرض شهر ظاهر خواهد شد.
        </div>
        <div style="border-bottom: 1px solid #ccc; height: 14px; padding: 2px; float: right;
            color: Black; width: 733px;">
            وضعیت نمایش پنل های خانه</div>
        <div style="float: right; width: 733px;">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table style="width: 100%;">
                        <tr>
                            <td class="style7">
                                پنل درجه شهروندی
                            </td>
                            <td class="style8">
                                <asp:RadioButton ID="Rb_ShaahrVandi_Yes" runat="server" AutoPostBack="true" GroupName="Rb_ShaahrVandi_"
                                    Text="نمایش داده شود" />
                            </td>
                            <td>
                                <asp:RadioButton ID="Rb_ShaahrVandi_No" runat="server" AutoPostBack="true" GroupName="Rb_ShaahrVandi_"
                                    Text="نمایش داده نشود" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                پنل بازدیدکنندگان خانه
                            </td>
                            <td class="style8">
                                <asp:RadioButton ID="Rb_Visit_Yes" runat="server" GroupName="Rb_Visit_" AutoPostBack="true"
                                    Text="نمایش داده شود" />
                            </td>
                            <td>
                                <asp:RadioButton ID="Rb_Visit_No" runat="server" GroupName="Rb_Visit_" AutoPostBack="true"
                                    Text="نمایش داده نشود" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                پنل آخرین بروزرسانی
                            </td>
                            <td class="style8">
                                <asp:RadioButton ID="Rb_Update_Yes" runat="server" GroupName="Rb_Update_" AutoPostBack="true"
                                    Text="نمایش داده شود" />
                            </td>
                            <td>
                                <asp:RadioButton ID="Rb_Update_No" runat="server" GroupName="Rb_Update_" AutoPostBack="true"
                                    Text="نمایش داده نشود" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                پنل رویدادهای کشور و روز
                            </td>
                            <td class="style8">
                                <asp:RadioButton ID="Rb_Event_Yes" runat="server" GroupName="Rb_Event_" AutoPostBack="true"
                                    Text="نمایش داده شود" />
                            </td>
                            <td>
                                <asp:RadioButton ID="Rb_Event_No" runat="server" GroupName="Rb_Event_" AutoPostBack="true"
                                    Text="نمایش داده نشود" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                پنل افراد آشنا
                            </td>
                            <td class="style8">
                                <asp:RadioButton ID="Rb_Know_Yes" runat="server" GroupName="Rb_Know_" AutoPostBack="true"
                                    Text="نمایش داده شود" />
                            </td>
                            <td>
                                <asp:RadioButton ID="Rb_Know_No" runat="server" GroupName="Rb_Know_" AutoPostBack="true"
                                    Text="نمایش داده نشود" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                پنل شهر های اقامت گرفته شده
                            </td>
                            <td class="style8">
                                <asp:RadioButton ID="Rb_Citizen_Yes" runat="server" GroupName="Rb_Citizen_" AutoPostBack="true"
                                    Text="نمایش داده شود" />
                            </td>
                            <td>
                                <asp:RadioButton ID="Rb_Citizen_No" runat="server" GroupName="Rb_Citizen_" AutoPostBack="true"
                                    Text="نمایش داده نشود" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                پنل لیست کاری
                            </td>
                            <td class="style8">
                                <asp:RadioButton ID="Rb_Work_Yes" runat="server" GroupName="Rb_Work_" AutoPostBack="true"
                                    Text="نمایش داده شود" />
                            </td>
                            <td>
                                <asp:RadioButton ID="Rb_Work_No" runat="server" GroupName="Rb_Work_" AutoPostBack="true"
                                    Text="نمایش داده نشود" />
                            </td>
                        </tr>
                    </table>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                        <ProgressTemplate>
                            <img src="../../../content/images/Profile_View_Users/Loading_0.gif" />
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </ContentTemplate>
            </asp:UpdatePanel>
            &nbsp;</div>
    </div>
</asp:Content>
