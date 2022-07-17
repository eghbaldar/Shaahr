<%@ Page Language="VB" MasterPageFile="~/home/Menu/Setting/Home.master" AutoEventWireup="false"
    CodeFile="security.aspx.vb" Inherits="home_Menu_Setting_security" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style8
        {
            width: 642px;
        }
        .style9
        {
            width: 473px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 729px;">
            تنظیمات امنیتی ورودی
        </div>
        <div style="width: 743px; height: 100%; float: right;">
            <div style="float: right; width: 60px; height: 50px;">
                <img src="../../../content/images/Home/luck.gif" /></div>
            <div style="float: right; width: 683px; height: 100%;">
                شما با استفاده از این بخش می توانید محدودیت در انجام کارهای خود اعم از نمایش و 
                یا دریافت اصلاعات انجام دهید. کرک جدید Office 2010 (ساخته‌شده در 18 آذر 89) در 
                صفحه‌ی دانلود Microsoft Office 2010 RTM Volume x86 Final Complete قرار گرفت. 
                سرور آپدیت رایگان محصولات Kaspersky راه اندازی و بعد از چند روز تست کامل فعال 
                شد. توضیحات را اینجا ببینید..
            </div>
        </div>
        <div style="border-bottom: 1px solid #ccc; height: 14px; padding: 2px; color: #000;
            float: right; width: 731px;">
            جمله امنیتی</div>
        <div style="float: right;">
            <table style="width: 100%">
                <tr>
                    <td style="font-style: italic;">
                        اعتبار سنجی
                    </td>
                </tr>
                <tr>
                    <td style="color: red;">
                        جمله جمله امنیتی خود را از بین جملات زیر انتخاب کنید (نکته : فقط دو بار می 
                        توانید امتحان کنید در غیر اینصورت حساب کاربری شده قفل خواهد شد )
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCounter" runat="server" Style="font-size: 20px;" Text="3"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="DG_Secure" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_StatementSecurity"
                            GridLines="None" ShowHeader="False" Width="735px">
                            <Columns>
                                <asp:TemplateField HeaderText="text" SortExpression="text">
                                    <ItemTemplate>
                                        <div style="border-bottom: 1px solid #E7E7E7; padding-bottom: 2px;">
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
                                <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
            </table>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <asp:Panel ID="Pnl_ChangeUsername" runat="server" Enabled="False" style=" -moz-border-radius: 5px;	-webkit-border-radius: 5px;	 border-radius:5px; ">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td>
                                                <ul style="margin-right: 14px; color: #575757;">
                                                    <li>تا جایکه می توانید از یک سطر تجاوز نکنید.</li>
                                                    <li>از کلمات کلیدی در جمله استفاده کنید تا هرچه بیشتر از تشابه پرهیز کنید.</li>
                                                    <li>بعد از ثبت جمله را در ذهن خود نگهداری کنید.</li>
                                                    <li>در مواقعی که به تایید جمله نیاز دارید فقط سه بار حق تکرار تشخیص جمله را دارید.</li>
                                                </ul>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td class="style8">
                                                            جمله امنیتی شما:
                                                        </td>
                                                        <td class="style9">
                                                            <asp:TextBox ID="txtStatement" runat="server" 
                                                            Style="border: 1px solid #ccc; font-family: Tahoma;padding:2px;
                                                                -moz-border-radius: 5px;	-webkit-border-radius: 5px;	 border-radius:5px; 
                                                                resize: none; font-size: 11px;" Width="586px" Height="35px" 
                                                                TextMode="MultiLine"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnUpdateStatement" runat="server"
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
                                                            height: 17px" />
                                                        <br />
                                                    </ProgressTemplate>
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
        <div style="height: 100%; padding: 2px; color: #000; float: right; width: 743px;">
            تایید همشهری
            <div style="float: right; width: 734px; border-top: 1px solid #ccc; margin-top: 4px;">
                <asp:Panel ID="Pnl_ComputerName" runat="server" Enabled="False" Style="margin-top: 4px; -moz-border-radius: 5px;	-webkit-border-radius: 5px;	 border-radius:5px; ">
                    <table style="width: 100%">
                        <tr>
                            <td style="direction: ltr; text-align: right; color: #575757;">
                                &nbsp; با استفاده از این لایه امنیتی شهروندان می توانند، با فعال کردن گزینه ی تایید 
                                همشهری از بخش حق دسترسی ، هنگام ورود عکس انتخاب شده خود را انتخاب کنند تا از 
                                دسترسی غیر مجاز جلوگری شود
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DataList ID="DL_CitizenPhoto" runat="server" DataKeyField="code" DataSourceID="ODS_Citizen_Picture"
                                    RepeatColumns="4" RepeatDirection="Horizontal">
                                    <ItemTemplate>
                                        <asp:Panel ID="PnlCitizen" runat="server" BorderStyle="Solid" BorderWidth="2px" Style="-moz-border-radius: 5px;
                                            -webkit-border-radius: 5px; border-radius: 5px;" BorderColor='<%# BorderColorPanel(DataBinder.Eval(Container.DataItem,"string_factor")) %>'>
                                            <div style="position: absolute; padding: 40px;" runat="server" visible='<%# VisibleLock(DataBinder.Eval(Container.DataItem,"string_factor")) %>'>
                                                <img src="../../../Content/images/Home/lock.png" />
                                            </div>
                                            <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton1" runat="server"
                                                CommandArgument='<%# Eval("string_factor","{0}") %>' Style="-moz-border-radius: 5px;
                                                -webkit-border-radius: 5px; border-radius: 5px;" Height="126px" ImageUrl='<%# "~/user/CropPhoto.aspx?P="+Eval("string_factor", "{0}")+"&W=156&H=170" %>'
                                                name="modal" OnCommand="UpdateCitizenPhoto" Width="150px" />
                                        </asp:Panel>
                                    </ItemTemplate>
                                </asp:DataList>
                                <asp:ObjectDataSource ID="ODS_Citizen_Picture" runat="server" DeleteMethod="Delete"
                                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                                    TypeName="DS_SettingTableAdapters.Citizen_PicturesTableAdapter" UpdateMethod="Update">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Original_code" Type="Int64" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="string_factor" Type="String" />
                                        <asp:Parameter Name="Original_code" Type="Int64" />
                                    </UpdateParameters>
                                    <SelectParameters>
                                        <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                                    </SelectParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="string_factor" Type="String" />
                                    </InsertParameters>
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                    <div style="float: right;">
                        <asp:Label ID="lblAuth" runat="server" Style="color: red;"></asp:Label>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
