<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="favorits.aspx.vb" Inherits="Management_Admin_favorits" Title="Untitled Page" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style13
        {
            width: 44px;
        }
        .style14
        {
            width: 81px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <asp:CheckBox ID="ChkAdd" runat="server" AutoPostBack="True" />
                اضافه کردن دسته علاقمندی
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="PanelAdd" runat="server" Style="border-style: solid; border-color: #C0C0C0"
                    Visible="false">
                    <table class="style1">
                        <tr>
                            <td class="style13">
                                عنوان:
                            </td>
                            <td>
                                <asp:TextBox ID="txtTitleCat" runat="server" Width="291px" Style="font-family: Tahoma;
                                    font-size: 11px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                لوگو:
                            </td>
                            <td>
                                <asp:FileUpload ID="FileUpload_Cat" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                &nbsp;
                            </td>
                            <td>
                                ابعاد: 40 پیکسل در 40 پیکسل
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                &nbsp;
                            </td>
                            <td>
                                توضیحات:
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                &nbsp;
                            </td>
                            <td>
                                <FCKeditorV2:FCKeditor ID="FCK_Add" runat="server" BasePath="~/Management/content/fckeditor/"
                                    Height="500px">
                                </FCKeditorV2:FCKeditor>
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="btnAddCat" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                    Text="درج" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                دسته بندی علاقه مندی ها :
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_Category" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="code" DataSourceID="ODS_Category" ForeColor="#333333" GridLines="None"
                    AllowPaging="True" PageSize="20">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="code" HeaderText="code" InsertVisible="False" ReadOnly="True"
                            SortExpression="code" Visible="False" />
                        <asp:TemplateField HeaderText="لوگو" SortExpression="Logo">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Logo") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Logo","~\Content\images\Shaahrs\Favorits\FavoritCategory\{0}") %>'
                                    Height="40px" Width="40px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="title" HeaderText="عنـــــــــــــــــــــوان" SortExpression="title" />
                        <asp:TemplateField SortExpression="detail">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("detail") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" OnCommand="RedirectDetailCat" CommandArgument='<%# Eval("code","{0}") %>'
                                    Style="font-family: Tahoma; font-size: 11px" Text="توضیحات ..." />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField SelectText="انتخاب" ShowSelectButton="True" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="Button2" runat="server" Text='<%# getTextCat(DataBinder.Eval(Container.DataItem,"code")) %>'
                                    OnCommand="RedirectUserCat" CommandArgument='<%# Eval("code","{0}") %>' Style="font-family: Tahoma;
                                    font-size: 11px" />
                                <asp:ImageButton ID="ImageButton1" runat="server" OnCommand="DeleteCat" CommandArgument='<%# Eval("code","{0}") %>'
                                    OnClientClick="return confirm('با حذف این گروه تمام زیر گروه ها و کاربران زیر گروه و همجنین تمام شهرهای زیر گروه آن نیز حذف میگردد.');"
                                    ImageUrl="~/Management/Content/Images/close.jpg" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Category" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_CMS_FavoritsTableAdapters.CMS_Favorits_CategoryTableAdapter"
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_code" Type="Int64" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="title" Type="String" />
                        <asp:Parameter Name="Logo" Type="String" />
                        <asp:Parameter Name="detail" Type="String" />
                        <asp:Parameter Name="Original_code" Type="Int64" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="title" Type="String" />
                        <asp:Parameter Name="Logo" Type="String" />
                        <asp:Parameter Name="detail" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="ChkFav" runat="server" AutoPostBack="True" />
                اضافه کردن علاقمندی
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="Panel_AddFav" runat="server" Style="border-style: solid; border-color: #C0C0C0"
                    Visible="false">
                    <table class="style1">
                        <tr>
                            <td class="style14">
                                دسته مربوطه:
                                <img alt="" src="../Content/Images/wrong.gif" style="width: 12px; height: 12px" />
                            </td>
                            <td>
                                <asp:Label ID="lblCat" runat="server" Style="color: #FF0000" Text="{ دسته ای را انتخاب نکرده اید }"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                عنوان:
                            </td>
                            <td>
                                <asp:TextBox ID="txtTitleFav" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                    Width="291px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                لوگو:
                            </td>
                            <td>
                                <asp:FileUpload ID="FileUpload_Fav" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                &nbsp;
                            </td>
                            <td>
                                ابعاد: 40 پیکسل در 40 پیکسل
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                &nbsp;
                            </td>
                            <td>
                                توضیحات:
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                &nbsp;
                            </td>
                            <td>
                                <FCKeditorV2:FCKeditor ID="FCK_AddFav" runat="server" BasePath="~/Management/content/fckeditor/"
                                    Height="500px">
                                </FCKeditorV2:FCKeditor>
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="btnAddFav" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                    Text="درج" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_Favorits" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="code" DataSourceID="ODS_Favorits" ForeColor="#333333" GridLines="None"
                    AllowPaging="True" PageSize="40">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField HeaderText="لوگو" SortExpression="Logo">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Logo") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Height="40px" ImageUrl='<%# Eval("Logo","~\Content\images\Shaahrs\Favorits\Favorits\{0}") %>'
                                    Width="40px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="code" HeaderText="code" InsertVisible="False" ReadOnly="True"
                            SortExpression="code" Visible="False" />
                        <asp:BoundField DataField="code_category" HeaderText="code_category" SortExpression="code_category"
                            Visible="False" />
                        <asp:BoundField DataField="title" HeaderText="عنـــــــــــــــــــــــوان" SortExpression="title" />
                        <asp:TemplateField SortExpression="detail">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("detail") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("code","{0}") %>'
                                    OnCommand="RedirectDetail" Style="font-family: Tahoma; font-size: 11px" Text="توضیحات ..." />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="Button2" runat="server" CommandArgument='<%# Eval("code","{0}") %>'
                                    OnCommand="RedirectUserFav" Style="font-family: Tahoma; font-size: 11px" Text='<%# getTextFav(DataBinder.Eval(Container.DataItem,"code")) %>' />
                                <asp:ImageButton ID="ImageButton2" runat="server"
                                 OnCommand="DeleteFav" CommandArgument='<%# Eval("code","{0}") %>'
                                 OnClientClick="return confirm('با حذف این علاقمندی تمام کاربران زیر گروه آنهاوتمام شهرهای زیر مجموعه آن نیز حذف میگردد.');"
                                    ImageUrl="~/Management/Content/Images/close.jpg" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Favorits" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_CMS_FavoritsTableAdapters.CMS_FavoritsTableAdapter"
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
                        <asp:ControlParameter ControlID="DG_Category" Name="code" PropertyName="SelectedValue"
                            Type="Int64" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="code_category" Type="Int64" />
                        <asp:Parameter Name="title" Type="String" />
                        <asp:Parameter Name="Logo" Type="String" />
                        <asp:Parameter Name="detail" Type="String" />
                    </InsertParameters>
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
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
