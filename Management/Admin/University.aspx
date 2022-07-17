<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="University.aspx.vb" Inherits="Management_Admin_University" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style13
        {
            width: 48px;
        }
        .style14
        {
            width: 79px;
        }
        .style15
        {
            height: 303px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <asp:CheckBox ID="chkcat" runat="server" AutoPostBack="True" />
                اضافه کردن دسته
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="PanelCat" runat="server" Visible="False">
                    <table class="style1">
                        <tr>
                            <td class="style13">
                                نام:
                            </td>
                            <td>
                                <asp:TextBox ID="txtNameCat" runat="server" Width="251px" Style="font-family: Tahoma;
                                    font-size: 11px; text-align: right"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="txtNameCat" ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                لوگو:
                            </td>
                            <td>
                                <asp:FileUpload ID="FileCat" runat="server" />
                                &nbsp;در ابعاد 40px در 40px
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="FileCat" ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="InsertCat" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                    Text="ارسال" ValidationGroup="1" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                دسته بندی دانشگاهها:
            </td>
        </tr>
        <tr>
            <td class="style15">
                <asp:GridView ID="DG_Cat" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="Code" DataSourceID="OSD_Cat" ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="Code" HeaderText="Code" InsertVisible="False" ReadOnly="True"
                            SortExpression="Code" Visible="False" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Height="40px" ImageUrl='<%# Eval("Logo", "~\Content\images\Shaahrs\University\UniversityCat\{0}") %>'
                                    Width="40px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Logo" SortExpression="Logo" Visible="False">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Logo") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Logo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Name" HeaderText="نام دسته" SortExpression="Name" />
                        <asp:CommandField SelectText="انتخاب" ShowSelectButton="True" />
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" Text='<%# GetCountUniCat(DataBinder.Eval(Container.DataItem,"code")) %>'
                                    OnCommand="RedirectCat" CommandArgument='<%# Eval("code","{0}") %>' Style="font-family: Tahoma;
                                    font-size: 11px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" OnCommand="DeleteCat" CommandArgument='<%# Eval("code","{0}") %>'
                                    OnClientClick="return confirm('با حذف این گروه تمام زیر گرو ها و کاربران زیر گروه آنها نیز حذف میگردد.');"
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
                <asp:ObjectDataSource ID="OSD_Cat" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_CMS_UniversityTableAdapters.CMS_Category_UniversityTableAdapter"
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
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="chkUni" runat="server" AutoPostBack="True" />
                اضافه شدن دانشگاه
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="PanelUni" runat="server" Visible="False">
                    <table class="style1">
                        <tr>
                            <td class="style14">
                                زیر گروه:&nbsp;
                                <img alt="" src="../Content/Images/wrong.gif" style="width: 12px; height: 12px" />
                            </td>
                            <td>
                                <asp:Label ID="lblUni" runat="server" Style="color: #FF0000" Text="{ گروهی انتخاب نشده است }"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                نام دانشگاه:
                            </td>
                            <td>
                                <asp:TextBox ID="txtUni" runat="server" Style="font-family: Tahoma; font-size: 11px;
                                    text-align: right" Width="220px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="txtUni" ErrorMessage="*" ValidationGroup="2"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                آدرس:
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddress" runat="server" Style="font-family: Tahoma; font-size: 11px;
                                    text-align: right" Width="526px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ControlToValidate="txtAddress" ErrorMessage="*" ValidationGroup="2"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                آدرس وبسایت:
                            </td>
                            <td>
                                <asp:TextBox ID="txtWeb" runat="server" Style="font-family: Tahoma; font-size: 11px;
                                    text-align: left" Width="218px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                لوگو:
                            </td>
                            <td>
                                <asp:FileUpload ID="FileUni" runat="server" />
                                &nbsp;در ابعاد 40px در 40px
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                    ControlToValidate="FileUni" ErrorMessage="*" ValidationGroup="2"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="InsertUni" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                    Text="ارسال" ValidationGroup="2" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_Uni" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="SDS_Uni" ForeColor="#333333" GridLines="None" AllowPaging="True"
                    DataKeyNames="code">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="code" HeaderText="code" InsertVisible="False" ReadOnly="True"
                            SortExpression="code" Visible="False" />
                        <asp:TemplateField SortExpression="picture">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("picture") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Height="40px" ImageUrl='<%# Eval("picture", "~\Content\images\Shaahrs\University\University\{0}") %>'
                                    Width="40px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="name" HeaderText="نام دانشگاه" SortExpression="name" />
                        <asp:BoundField DataField="address" HeaderText="آدرس دانشگاه" SortExpression="address" />
                        <asp:BoundField DataField="LinkWebsite" HeaderText="وب سایت" SortExpression="LinkWebsite" />
                        <asp:BoundField DataField="CodeCategory" HeaderText="CodeCategory" SortExpression="CodeCategory"
                            Visible="False" />
                        <asp:CommandField CancelText="لغو" EditText="ویرایش" ShowEditButton="True" UpdateText="بروزرسانی" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                    Text='<%# GetCountUni(DataBinder.Eval(Container.DataItem,"code")) %>' OnCommand="RedirectUni"
                                    CommandArgument='<%# Eval("code","{0}") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("code","{0}") %>'
                                    ImageUrl="~/Management/Content/Images/close.jpg" OnClientClick="return confirm('مطمئن هستید؟.');"
                                    OnCommand="DeleteUni" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:SqlDataSource ID="SDS_Uni" runat="server" ConnectionString="<%$ ConnectionStrings:shaahrConnectionString %>"
                    SelectCommand="SELECT * FROM [tbl_CMS_University] WHERE ([CodeCategory] = @CodeCategory) ORDER BY [code] DESC"
                    UpdateCommand="UPDATE tbl_CMS_University SET name = @name, address = @address, LinkWebsite = @LinkWebsite WHERE (code = @code)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DG_Cat" Name="CodeCategory" PropertyName="SelectedValue"
                            Type="Int64" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name" />
                        <asp:Parameter Name="address" />
                        <asp:Parameter Name="LinkWebsite" />
                        <asp:Parameter Name="code" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
