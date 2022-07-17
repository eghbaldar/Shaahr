<%@ Page Language="VB" MasterPageFile="~/Management/Admin/Shaahr/CMS.master" AutoEventWireup="false"
    CodeFile="MasolinShaahr.aspx.vb" Inherits="Management_Admin_Shaahr_MasolinShaahr"
    Title="Untitled Page" %>

<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style13
        {
            width: 183px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <b>اضافه کردن مسئول</b>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style13">
                            نوع پست:
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbType" runat="server" Height="16px" Style="font-family: Tahoma;
                                font-size: 11px">
                                <asp:ListItem Value="0">رئیس جمهور</asp:ListItem>
                                <asp:ListItem Value="01">معاون اول رئیس جمهور</asp:ListItem>
                                <asp:ListItem Value="02">معاون دوم رئیس جمهور</asp:ListItem>
                                <asp:ListItem Value="1">استاندار استان اول</asp:ListItem>
                                <asp:ListItem Value="11">معاون اول استاندار استان اول</asp:ListItem>
                                <asp:ListItem Value="12">معاون دوم استاندار استان اول</asp:ListItem>
                                <asp:ListItem Value="2">استاندار استان دوم</asp:ListItem>
                                <asp:ListItem Value="21">معاون اول استاندار استان دوم</asp:ListItem>
                                <asp:ListItem Value="22">معاون دوم استاندار استان دوم</asp:ListItem>
                                <asp:ListItem Value="3">استاندار استان سوم</asp:ListItem>
                                <asp:ListItem Value="31">معاون اول استاندار استان سوم</asp:ListItem>
                                <asp:ListItem Value="32">معاون دوم استاندار استان سوم</asp:ListItem>
                                <asp:ListItem Value="4">استاندار استان چهارم</asp:ListItem>
                                <asp:ListItem Value="41">معاون اول استاندار استان چهارم</asp:ListItem>
                                <asp:ListItem Value="42">معاون دوم استاندار استان چهارم</asp:ListItem>
                                <asp:ListItem Value="5">استاندار استان پنجم</asp:ListItem>
                                <asp:ListItem Value="51">معاون اول استاندار استان پنجم</asp:ListItem>
                                <asp:ListItem Value="52">معاون دوم استاندار استان پنجم</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            کاربر: (ایمیل)
                        </td>
                        <td>
                            <asp:TextBox ID="txtInsertAuthEmail" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtInsertAuthEmail"
                                ErrorMessage="فرمت" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ValidationGroup="1"></asp:RegularExpressionValidator>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtInsertAuthEmail"
                                ErrorMessage="پر کنید" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            عنوان پست:
                        </td>
                        <td>
                            <asp:TextBox ID="txtInsertAuthTitle" runat="server" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtInsertAuthTitle"
                                ErrorMessage="پر کنید" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            سابقه: (CV)
                        </td>
                        <td>
                            <FCKeditorV2:FCKeditor ID="txtInsertAuthCV" runat="server" 
                                BasePath="~/Management/content/fckeditor/" Height="500px">
                            </FCKeditorV2:FCKeditor>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtInsertAuthCV"
                                ErrorMessage="پر کنید" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            مسئولیت:
                        </td>
                        <td>
                            <FCKeditorV2:FCKeditor ID="txtInsertAuthRes" runat="server" 
                                BasePath="~/Management/content/fckeditor/" Height="500px">
                            </FCKeditorV2:FCKeditor>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtInsertAuthRes"
                                ErrorMessage="پر کنید" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            زمان مسئولیت:
                        </td>
                        <td>
                            <asp:TextBox ID="txtInsertAuthTimeRe" runat="server" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtInsertAuthTimeRe"
                                ErrorMessage="پر کنید" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            دوره چندم انتخاب شده است: (عدد)
                        </td>
                        <td>
                            <asp:TextBox ID="txtInsertAuthPriode" runat="server" Width="50px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtInsertAuthPriode"
                                ErrorMessage="پر کنید" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            تاریخ شروع مسئولیت:
                        </td>
                        <td>
                            <asp:TextBox ID="txtInsertAuthDateStart" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtInsertAuthDateStart"
                                ErrorMessage="پر کنید" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            تاریخ پایان مسئولیت:
                        </td>
                        <td>
                            <asp:TextBox ID="txtInsertAuthDateEnd" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtInsertAuthDateEnd"
                                ErrorMessage="پر کنید" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            فعال/غیر فعال:
                        </td>
                        <td>
                            <asp:RadioButtonList ID="RbInsertAuthFlag" runat="server">
                                <asp:ListItem Selected="True" Value="1">فعال</asp:ListItem>
                                <asp:ListItem Value="0">غیر فعال</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            &nbsp;
                        </td>
                        <td>
                            <asp:Button ID="btnInsertAuth" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                Text="ثبت" ValidationGroup="1" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="ChkShowAuth" runat="server" Text="مشاهده مسئولین" AutoPostBack="True" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DgAtuh" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="ODS_Auth" ForeColor="#333333" GridLines="None" Visible="False">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField SortExpression="picpath">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("picpath") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" ImageUrl='<%# "~/user/Crop.aspx?P="+ Eval("PicPath", "{0}") +"&W=60&H=60" %>'
                                    runat="server" Height="50px" Width="50px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:CheckBoxField DataField="Which" HeaderText="Which" SortExpression="Which" Visible="False" />
                        <asp:TemplateField HeaderText="نام" SortExpression="Type">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# GetFN(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="نوع" SortExpression="Email">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# GetType_(DataBinder.Eval(Container.DataItem,"type")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Title_Post" HeaderText="عنوان پست" SortExpression="Title_Post" />
                        <asp:BoundField DataField="CV" HeaderText="CV" SortExpression="CV" Visible="False" />
                        <asp:TemplateField HeaderText="مسئولیت" SortExpression="Responsibilty">
                            <ItemTemplate>
                                <asp:Button ID="Button3" runat="server" CommandArgument='<%# Eval("id","{0}") %>'
                                    OnCommand="GotoDetailAuth" Style="font-size: 10px; font-family: Tahoma" Text="مشاهده جزییات" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Time_Responsibilty" HeaderText="زمان مسئولیت" SortExpression="Time_Responsibilty" />
                        <asp:BoundField DataField="Priode_Responsibilty" HeaderText="دوره چندم" SortExpression="Priode_Responsibilty" />
                        <asp:BoundField DataField="Date_Start_Responsibilty" HeaderText="تاریخ شروع" SortExpression="Date_Start_Responsibilty" />
                        <asp:BoundField DataField="Date_End_Responsibilty" HeaderText="تاریخ پایان" SortExpression="Date_End_Responsibilty" />
                        <asp:TemplateField HeaderText="فعال/غیرفعال" SortExpression="Flag">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# iif(Eval("flag")=0,"غیرفعال"," فعال")%>'></asp:Label>
                                <br />
                                <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("id","{0}") %>'
                                    OnCommand="EnableFlagAuthorities" Style="font-family: Tahoma; font-size: 11px"
                                    Text="فعال" BackColor="#99FF33" />
                                <br />
                                <asp:Button ID="Button2" runat="server" CommandArgument='<%# Eval("id","{0}") %>'
                                    OnCommand="DisableFlagAuthorities" Style="font-family: Tahoma; font-size: 11px"
                                    Text="غیرفعال" BackColor="#CC3300" />
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument='<%# Eval("id","{0}") %>'
                                    OnCommand="DeleteAuthorities" OnClientClick="return confirm('sure?');" ImageUrl="~/Content/images/Home/Delete.png" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Auth" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_CMS_Shaahr_ManagementTableAdapters.Shaahr_AuthoritiesTableAdapter">
                </asp:ObjectDataSource>
            </td>
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
