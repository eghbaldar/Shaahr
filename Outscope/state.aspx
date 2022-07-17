<%@ Page Language="VB" MasterPageFile="~/outscope/Home.master" AutoEventWireup="false"
    CodeFile="state.aspx.vb" Inherits="outscope_state" Title="Untitled Page" %>

<%@ Register Src="../UserControl/Root/Captcha.ascx" TagName="Captcha" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style6
        {
            height: 50px;
        }
        .style7
        {
            width: 100%;
        }
        .style9
        {
            width: 244px;
        }
        .style10
        {
            width: 112px;
        }
        .style11
        {
            width: 31px;
        }
    </style>
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
        .style12
        {
            width: 34px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="float: right; margin-top: 2px;">
        <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="-1">
            <asp:View ID="V_NotRegisterOrEnter" runat="server">
                <div style="border-top: 1px solid #d9ebf5; border-bottom: 1px solid #d9ebf5; height: 100%;
                    background-color: #eff7fc; padding: 5px; width: 734px;">
                    <table>
                        <tr>
                            <td>
                                <img src="../content/images/Home/stop.png" />
                            </td>
                            <td>
                                کاربر محترم ، به دلایلی تا اطلاع ثانویه حق ورود و یا ساخت حساب شهروندی جدید امکان
                                پذیر نمی باشد.<br />
                                از صبر و شکیبایی شما متشکریم.<br />
                                با تشکر مدیریت شهر دات کام
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:View>
            <asp:View ID="V_notMatchComputerName" runat="server">
                <div style="border-top: 1px solid #d9ebf5; border-bottom: 1px solid #d9ebf5; height: 100%;
                    background-color: #eff7fc; padding: 5px; width: 734px;">
                    <table>
                        <tr>
                            <td>
                                <img src="../content/images/Home/stop.png" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                کاربر محترم;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                سیستم تایید همشهری برای پروفایل شما فعال می باشد.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                برای رفع مشکل بالا باید یکی از روش های زیر را انتخاب کنید:
                                <div style="padding: 14px;">
                                    <ul>
                                        <li>انتخاب عکس امنیتی خود از بین عکس های آلبوم های خودتان</li>
                                        <li>انتخاب جمله امنیتی از بین جملات</li>
                                        <li>تماس با واحد پشتیبانی شهر</li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="color: Red;">
                                در هر کدام از روش های بالا شما فقط سه بار حق امتحان آن روش را دارید و در غیر این
                                صورت پروفایل شما بلاک شده و باید با واحد پشتیبانی سایت برای رفع آن تماس حاصل فرمایید.<br />
                                بنابراین در انتخاب روش های امنیتی فوق دقت کنید.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="border: 1px solid #ccc; width: 732px; height: 100%; -moz-border-radius: 5px;">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td class="style6">
                                                        <img src="../content/images/Home/1.png" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        عکس امنیتی خود را با دقت انتخاب کنید.
                                                    </td>
                                                </tr>
                                                <tr style="text-align: center;">
                                                    <td style="text-align: right">
                                                        <asp:DataList ID="DL_CitizenPhoto" runat="server" DataKeyField="code" DataSourceID="ODS_Select_CitizenPictures"
                                                            RepeatColumns="4" RepeatDirection="Horizontal">
                                                            <ItemTemplate>
                                                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton1" runat="server"
                                                                    CommandArgument='<%# Eval("string_factor","{0}") %>' Height="126px" ImageUrl='<%# "~/user/CropPhoto.aspx?P="+Eval("string_factor", "{0}")+"&W=156&H=170" %>'
                                                                    name="modal" OnCommand="SelectCitizenPhoto" Style="border: 1px solid #ccc; -moz-border-radius: 5px;
                                                                    -webkit-border-radius: 5px; border-radius: 5px;" Width="150px" />
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                        <asp:ObjectDataSource ID="ODS_Select_CitizenPictures" runat="server" DeleteMethod="Delete"
                                                            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                                                            TypeName="DS_EnterUsersTableAdapters.Select_CitizenPicturesTableAdapter" UpdateMethod="Update">
                                                            <DeleteParameters>
                                                                <asp:Parameter Name="Original_code" Type="Int64" />
                                                            </DeleteParameters>
                                                            <UpdateParameters>
                                                                <asp:Parameter Name="string_factor" Type="String" />
                                                                <asp:Parameter Name="Original_code" Type="Int64" />
                                                            </UpdateParameters>
                                                            <SelectParameters>
                                                                <asp:Parameter Name="email" Type="String" />
                                                            </SelectParameters>
                                                            <InsertParameters>
                                                                <asp:Parameter Name="string_factor" Type="String" />
                                                            </InsertParameters>
                                                        </asp:ObjectDataSource>
                                                    </td>
                                                </tr>
                                            </table>
                                            <div style="color: Green; padding: 5px; font-size: 12px;">
                                                کاربر محترم, در صورت انتخاب صحیح ، به مرحله بعد هدایت خواهید شد.</div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="border: 1px solid #ccc; width: 732px; height: 100%; -moz-border-radius: 5px;">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td>
                                                <img src="../content/images/Home/2.png" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="DG_Secure" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_StatementSecurity"
                                                    GridLines="None" ShowHeader="False" Width="735px">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="text" SortExpression="text">
                                                            <ItemTemplate>
                                                                <div style="padding-bottom: 2px;">
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("text") %>'></asp:Label>
                                                                    <asp:LinkButton ID="LinkButton4" OnCommand="CheckCorrectSecureStatement" CommandArgument='<%# Eval("id","{0}") %>'
                                                                        Style="text-decoration: none;" runat="server">(انتخاب)</asp:LinkButton>
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:ObjectDataSource ID="ODS_StatementSecurity" runat="server" OldValuesParameterFormatString="original_{0}"
                                                    SelectMethod="GetData" TypeName="DS_SettingTableAdapters.StatementSecurityTableAdapter">
                                                    <SelectParameters>
                                                        <asp:Parameter Name="email" Type="String" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                    <div style="color: Green; padding: 5px; font-size: 12px;">
                                        کاربر محترم, در صورت انتخاب صحیح جمله امنیتی توسط شما ابتدا نام سیستم جدید شما با
                                        نام سیستم ثبت شده در سیستم ویرایش شده و سپس شما به صفحه نخست بازگردانده خواهید شد,
                                        و دوباره عملیات لاگین را انجام خواهید داد.
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="border: 1px solid #ccc; width: 732px; height: 100%; -moz-border-radius: 5px;">
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td>
                                                        <img src="../content/images/Home/3.png" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <table class="style7">
                                                            <tr>
                                                                <td class="style9">
                                                                    پست الکترونیکی:
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtEmail" runat="server" Enabled="False" Style="text-align: left"
                                                                        Width="208px"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail"
                                                                        ErrorMessage="الزامی می باشد." ValidationGroup="2"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style9">
                                                                    حدس شما در مورد <b>ج</b><b>مله امنیتی</b> ثبت شده در شهر:
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtG_Statement" runat="server" Height="47px" Style="font-family: Tahoma;
                                                                        font-size: 11px" TextMode="MultiLine" Width="405px"></asp:TextBox>
                                                                    <br />
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtG_Statement"
                                                                        ErrorMessage="الزامی می باشد." ValidationGroup="2"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <uc1:Captcha ID="Captcha" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr style="text-align: center;">
                                                    <td style="text-align: right">
                                                        <table class="style7">
                                                            <tr>
                                                                <td class="style12">
                                                                    &nbsp;
                                                                    <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnAuth_com_2" runat="server"
                                                                        ImageUrl="~/content/images/Home/auth.png" Style="width: 21px; height: 21px;"
                                                                        ValidationGroup="2" Width="21px" />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblComputerName2" runat="server" Style="color: #FF0000"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                            <div style="color: Green; padding: 5px; font-size: 12px;">
                                                کاربر محترم, با ارسال مواردی که شما پر کرده اید گروه پشتیبانی شهر دات کام را در
                                                جریان فراموشی لایه ی امنیتی قرار خواهید داد .
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:View>
            <asp:View ID="V_Band" runat="server">
                <div style="border-top: 1px solid #d9ebf5; border-bottom: 1px solid #d9ebf5; height: 100%;
                    background-color: #eff7fc; padding: 5px; width: 734px;">
                    <table>
                        <tr>
                            <td>
                                <img src="../content/images/Home/stop.png" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblBand" runat="server" Style="color: #FF0000"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDetailBand" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:View>
            <asp:View ID="V_Password" runat="server">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:MultiView ID="MultiPassword" runat="server" ActiveViewIndex="0">
                            <asp:View ID="View1" runat="server">
                                <div style="border-top: 1px solid #d9ebf5; border-bottom: 1px solid #d9ebf5; height: 100%;
                                    background-color: #eff7fc; padding: 5px; width: 734px;">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td>
                                                <img src="../content/images/Home/key.png" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                کاربر محترم ;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                در صورت مطابقت نام-کاربری و پست الکترونیکی شما , پسورد به پست الکترونیکی شما ارسال
                                                خواهد شد.
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td class="style10">
                                                            نام کاربری:
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtF_User" runat="server" Style="text-align: left"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtF_User"
                                                                EnableViewState="False" ErrorMessage="الزامی می باشد." ValidationGroup="3"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style10">
                                                            &nbsp;
                                                        </td>
                                                        <td style="color: Green;">
                                                            نام کاربری قبلا توسط شما در پروفایل شما ثبت شده است.
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style10">
                                                            پست الکترونیکی:
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtF_Email_1" runat="server" Style="text-align: left"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtF_Email_1"
                                                                ErrorMessage="الزامی می باشد." ValidationGroup="3"></asp:RequiredFieldValidator><br />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style10">
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtF_Email_1"
                                                                ErrorMessage="فرمت پست الکترونیکی وارده نادرست می باشد." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                                ValidationGroup="3"></asp:RegularExpressionValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style10">
                                                            تکرار پست الکترونیکی:
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtF_Email_2" runat="server" Style="text-align: left"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtF_Email_2"
                                                                ErrorMessage="الزامی می باشد." ValidationGroup="3"></asp:RequiredFieldValidator><br />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style10">
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtF_Email_2"
                                                                ErrorMessage="فرمت پست الکترونیکی وارده نادرست می باشد." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                                ValidationGroup="3"></asp:RegularExpressionValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style10">
                                                            کد امنیتی:
                                                        </td>
                                                        <td>
                                                            <uc1:Captcha ID="Captcha_" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style10">
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnSendEmail" runat="server"
                                                                ImageUrl="~/content/images/Home/auth.png" Style="width: 21px" ValidationGroup="3" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style10">
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtF_Email_1"
                                                                ControlToValidate="txtF_Email_2" ErrorMessage="پست الکترونکی های وارد شده یکسان نیستند."
                                                                ValidationGroup="3"></asp:CompareValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style10">
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblPassword" runat="server" Style="color: #FF0000"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </asp:View>
                            <asp:View ID="View2" runat="server">
                                <div style="border-top: 1px solid #d9ebf5; border-bottom: 1px solid #d9ebf5; height: 100%;
                                    background-color: #eff7fc; padding: 5px; width: 734px;">
                                    <table>
                                        <tr>
                                            <td>
                                                <img src="../content/images/Home/Accept.png" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                کاربر محترم ;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                پسورد شما به پست الکترونیکی شما ارسال شد.
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </asp:View>
                        </asp:MultiView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:View>
            <asp:View ID="V_Create" runat="server">
                <div style="border-top: 1px solid #d9ebf5; border-bottom: 1px solid #d9ebf5; height: 100%;
                    background-color: #eff7fc; padding: 5px; width: 734px;">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <img src="../content/images/Home/Accept.png" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                کاربر محترم ;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                حساب کاربری شما با موفقیت ایجاد شده است.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                مشخصات شما به پست الکترونیکی شما ارسال شده است.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                بعد از اولین ورود به سیستم لطفا هر چه سریعتر به پر کردن اطلاعات فردی خود اقدام کنید.
                            </td>
                        </tr>
                        <tr style="text-align: left;">
                            <td>
                                <a href="../">
                                    <asp:Button ID="BtnGotoLogin" CssClass="BtnShaahr" runat="server" />
                                </a>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:View>
            <asp:View ID="V_Statement" runat="server">
                <div style="border-top: 1px solid #d9ebf5; border-bottom: 1px solid #d9ebf5; height: 100%;
                    background-color: #eff7fc; padding: 5px; width: 734px;">
                    <table>
                        <tr>
                            <td>
                                <img src="../content/images/Home/stop.png" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                کاربر محترم;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                سیستم جمله امنیتی برای پروفایل شما فعال می باشد.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                شما تا سه مرتبه حق انتخاب جمله امنیتی خود را از لیست جملات زیر دارید در صورت سه
                                بار اشتباه پروفایل شما قفل خواهد شد.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="DG_Secure2" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_StatementSecurity"
                                    GridLines="None" ShowHeader="False" Width="735px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="text" SortExpression="text">
                                            <ItemTemplate>
                                                <div style="padding-bottom: 2px;">
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("text") %>'></asp:Label>
                                                    <asp:LinkButton ID="LinkButton5" runat="server" CommandArgument='<%# Eval("id","{0}") %>'
                                                        OnCommand="CheckCorrectSecureStatement2" Style="text-decoration: none;">(انتخاب)</asp:LinkButton>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:View>
            <asp:View ID="V_NoExsistUser" runat="server">
                <div style="border-top: 1px solid #d9ebf5; border-bottom: 1px solid #d9ebf5; height: 100%;
                    background-color: #eff7fc; padding: 5px; width: 734px;">
                    <table class="style7">
                        <tr>
                            <td class="style11">
                                <img alt="" src="../content/images/Stage/Jiring/help.jpg" style="width: 35px; height: 35px" />
                            </td>
                            <td>
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            کاربر محترم;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            کاربری با این مشخصات وجود ندارد.
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:View>
            <asp:View ID="V_EndSession" runat="server">
                <div style="border-top: 1px solid #d9ebf5; border-bottom: 1px solid #d9ebf5; height: 100%;
                    background-color: #eff7fc; padding: 5px; width: 734px;">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <img alt="" src="../content/images/Stage/Jiring/help.jpg" style="width: 35px; height: 35px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                کاربر محترم;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                شما حق دسترسی به این بخش را ندارید.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                لطفا در سایت ورود کرده یا جهت ثبت نام در شهر دات کام اقدام کنید.
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left;">
                                <asp:Button ID="btnLogin" CssClass="BtnShaahr" runat="server" />
                                <asp:Button ID="btnRegister" CssClass="BtnShaahr" runat="server" />
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:View>
            <asp:View ID="V_UserNotPermissionAboutThisPart" runat="server">
                <div style="border-top: 1px solid #d9ebf5; border-bottom: 1px solid #d9ebf5; height: 100%;
                    background-color: #eff7fc; padding: 5px; width: 734px;">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <img alt="" src="../content/images/Stage/Jiring/help.jpg" style="width: 35px; height: 35px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                کاربر محترم;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                شما حق دسترسی به این بخش را ندارید.
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
