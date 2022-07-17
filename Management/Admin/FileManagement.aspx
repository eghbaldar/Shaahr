<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="FileManagement.aspx.vb" Inherits="Management_Admin_FileManagement"
    Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script src="../Content/JS/Talk/jquery.js" type="text/javascript"></script>

    <script src="../Content/JS/Talk/main.js" type="text/javascript"></script>

    <style type="text/css">
        /**/#screenshot
        {
            position: absolute;
            border: 1px solid #ccc;
            background: #333;
            padding: 5px;
            display: none;
            color: #fff;
        }
        /**/.style13
        {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <b>آواتار های کاربران</b>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td>
                            <asp:Label ID="lblCountAvatars" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox ID="ChkSHowAvatars" runat="server" Text="مشاهده آواتارها" AutoPostBack="True" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DataList ID="DG_Avatars" runat="server" DataSourceID="ODS_Avatar" RepeatColumns="8"
                                Visible="False" Width="579px">
                                <ItemTemplate>
                                    <div style="border: 3px dotted #ccc;">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td>
                                                    <asp:ImageButton ID="ImageButton5" OnCommand="DeleteAvatar" OnClientClick="return confirm('مطمئن؟');"
                                                        CommandArgument='<%# Eval("ID","{0}")+"|"+Eval("PicPath","{0}") %>' runat="server"
                                                        ImageUrl="~/content/images/Home/deleteWork.jpg" />
                                                    <%--<br />
                                                <asp:Label ID="Label2" runat="server" Text='<%# GetName(DataBinder.Eval(Container.DataItem,"email")) %>'
                                                    Style="color: #800000"></asp:Label>--%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("email","{0}") %>'
                                                        OnCommand="ShowAttrib" Style="font-family: Tahoma; font-size: 10px" Text="دیدن مشخصات" />
                                                </td>
                                            </tr>
                                            <%--<tr>
                                            <td>
                                                <asp:Panel ID="Panel1" BorderStyle="Solid" BorderColor='<%# BorderColorPanel(DataBinder.Eval(Container.DataItem,"flag")) %>'
                                                    BorderWidth="1" runat="server" Style="padding: 5px;">
                                                    <asp:ImageButton ID="ImageButton2" runat="server" Height="80px" Width="80px"
                                                     ImageUrl='<%# "~/user/Crop.aspx?P=" + Eval("PicPath", "{0}")+ "&W=100&H=100" %>'
                                                        AlternateText="تصویر غیر قابل دسترسی" />
                                                </asp:Panel>
                                            </td>
                                        </tr>--%>
                                            <tr>
                                                <td>
                                                    <a style="color: Black; text-decoration: none;" href='<%# Eval("picpath","..\..\Content\images\Profile\Avatars\{0}") %>'
                                                        target="_blank">دیدن تصویر</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                            <asp:ObjectDataSource ID="ODS_Avatar" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="DS_CMS_FileManagementTableAdapters.Profile_AvatarsTableAdapter">
                                <InsertParameters>
                                    <asp:Parameter Name="Email" Type="String" />
                                    <asp:Parameter Name="PicPath" Type="String" />
                                    <asp:Parameter Name="Flag" Type="Boolean" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <div style="border: 1px solid #BED5D4; -moz-border-radius: 9px;">
                    <table class="style1">
                        <tr>
                            <td class="style13">
                                فایل های که معادلی دیتابیسی برای آن وجود ندارد و باید حذف شوند.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnAccExpireFile" runat="server" Style="font-size: 10px; font-family: Tahoma"
                                    Text="محاسبه فایل ها" />
                                &nbsp;. . .
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <asp:Label ID="lblExpireAvatars" runat="server" Style="font-weight: 700; color: #333333"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <asp:Button ID="btnDeleteExpireAvatars" runat="server" OnClientClick="return confirm('مطمئن؟');"
                                    Style="font-size: 11px; font-family: Tahoma" Text="پاک شدن همه ی آواتار های اضافی"
                                    Enabled="False" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <b>عکس های آلبوم ها</b>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblCountPhotoAlbum" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="ChkSHowPhoto" runat="server" Text="مشاهده تصاویر" AutoPostBack="True" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="DG_Pictures" runat="server" DataSourceID="ODS_Pictures" RepeatColumns="8"
                    Visible="False" Width="579px">
                    <ItemTemplate>
                        <div style="border: 3px dotted #ccc;">
                            <table style="width: 100%;">
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="ImageButton5" OnCommand="DeleteAvatar" OnClientClick="return confirm('مطمئن؟');"
                                            CommandArgument='<%# Eval("ID","{0}")+"|"+Eval("string_factor","{0}") %>' runat="server"
                                            ImageUrl="~/content/images/Home/deleteWork.jpg" />
                                        <%--<br />
                                                <asp:Label ID="Label2" runat="server" Text='<%# GetName(DataBinder.Eval(Container.DataItem,"email")) %>'
                                                    Style="color: #800000"></asp:Label>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("email","{0}") %>'
                                            OnCommand="ShowAttrib" Style="font-family: Tahoma; font-size: 10px" Text="دیدن مشخصات" />
                                    </td>
                                </tr>
                                <%--<tr>
                                            <td>
                                                <asp:Panel ID="Panel1" BorderStyle="Solid" BorderColor='<%# BorderColorPanel(DataBinder.Eval(Container.DataItem,"flag")) %>'
                                                    BorderWidth="1" runat="server" Style="padding: 5px;">
                                                    <asp:ImageButton ID="ImageButton2" runat="server" Height="80px" Width="80px"
                                                     ImageUrl='<%# "~/user/Crop.aspx?P=" + Eval("PicPath", "{0}")+ "&W=100&H=100" %>'
                                                        AlternateText="تصویر غیر قابل دسترسی" />
                                                </asp:Panel>
                                            </td>
                                        </tr>--%>
                                <tr>
                                    <td>
                                        <a style="color: Black; text-decoration: none;" href='<%# Eval("string_factor","..\..\Content\images\Profile\Photo\{0}") %>'
                                            target="_blank">دیدن تصویر</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:ObjectDataSource ID="ODS_Pictures" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_CMS_FileManagementTableAdapters.Picture_AlbumTableAdapter">
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <div style="border: 1px solid #BED5D4; -moz-border-radius: 9px;">
                    <table class="style1">
                        <tr>
                            <td class="style13">
                                &nbsp;فایل های که معادلی دیتابیسی برای آن وجود ندارد و باید حذف شوند.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnAccExpirePhoto" runat="server" Style="font-size: 10px; font-family: Tahoma"
                                    Text="محاسبه فایل ها" />
                                &nbsp;. . .
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <asp:Label ID="lblExpirePhoto" runat="server" Style="font-weight: 700; color: #333333"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnDeleteExpirePhoto" runat="server" OnClientClick="return confirm('مطمئن؟');"
                                    Style="font-size: 11px; font-family: Tahoma" Text="پاک شدن همه ی عکس های اضافی"
                                    Enabled="False" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <b>عکس های کارهای فوق اجباری شخصیت سوم (عملیات متنی - خبر - اطلاعیه و ... )</b></td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
