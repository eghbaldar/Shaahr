<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="news.aspx.vb" Inherits="Management_Admin_Default2" Title="Untitled Page" %>

<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style13
        {
            width: 54px;
        }
        .style14
        {
            width: 127px;
        }
        .style15
        {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                گروهبندی خبر ها
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style13">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            نام دسته:
                        </td>
                        <td>
                            <asp:TextBox ID="txtNameCategory" runat="server" Style="text-align: right; font-family: Tahoma;
                                font-size: 11px" Width="370px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNameCategory"
                                ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            &nbsp;
                        </td>
                        <td>
                            <asp:ImageButton ID="btnInsertCategory" runat="server" ImageUrl="~/Management/Content/Images/btnSend.jpg"
                                ValidationGroup="1" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="Code_Category" DataSourceID="Sql_CategoryNews" ForeColor="#333333"
                    GridLines="None" Width="899px" AllowPaging="True">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="Code_Category" HeaderText="Code_Category" InsertVisible="False"
                            ReadOnly="True" SortExpression="Code_Category" Visible="False" />
                        <asp:BoundField DataField="Name_Category" HeaderText="نام دسته" SortExpression="Name_Category">
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" Width="800px" />
                        </asp:BoundField>
                        <asp:CommandField CancelText="لغو" EditText="ویرایش" ShowEditButton="True" UpdateText="بروزرسانی" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# eval("code_category","{0}") %>'
                                    OnCommand="DeleteCategory" ImageUrl="~/Management/Content/Images/close.jpg" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        دسته ای برای نمایش وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:SqlDataSource ID="Sql_CategoryNews" runat="server" ConnectionString="<%$ ConnectionStrings:shaahrConnectionString %>"
                    SelectCommand="SELECT * FROM [tbl_CMS_NewsCategory] ORDER BY [Code_Category] DESC"
                    UpdateCommand="UPDATE tbl_CMS_NewsCategory
 SET Name_Category = @Name_Category
WHERE (Code_Category = @code_category)">
                    <UpdateParameters>
                        <asp:Parameter Name="code_category" />
                        <asp:Parameter Name="Name_Category" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="PnlDeletecategory" runat="server" Visible="False">
                    <table class="style1">
                        <tr>
                            <td>
                                با حذف هر دسته ، تمام خبر های زیر گروه آن نیز حذف خواهد شد. آیا مطمئن هستید؟
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:ImageButton ID="BtnCancelCat" runat="server" ImageUrl="~/Management/Content/Images/button_nok.jpeg" />
                                <asp:ImageButton ID="BtnDelCat" runat="server" ImageUrl="~/Management/Content/Images/button_ok.png" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                خبر ها
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style14">
                            خبر برای کجا؟</td>
                        <td>
                            <asp:RadioButtonList ID="rbType" runat="server">
                                <asp:ListItem Selected="True" Value="0">خبر سایت (اصلی)</asp:ListItem>
                                <asp:ListItem Value="1">خبر صفحه اول شهر (ساختمان مدیریتی)</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            دسته خبر:
                        </td>
                        <td>
                            <asp:DropDownList ID="cmb_Category" runat="server" DataSourceID="ODS_Category" DataTextField="Name_Category"
                                DataValueField="Code_Category" Style="font-family: Tahoma; font-size: 12px" Width="385px">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ODS_Category" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_CMS_NewsTableAdapters.CMS_NewsCategoryTableAdapter"
                                UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_Code_Category" Type="Int64" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Name_Category" Type="String" />
                                    <asp:Parameter Name="Original_Code_Category" Type="Int64" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Name_Category" Type="String" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            عنوان خبر:
                        </td>
                        <td>
                            <asp:TextBox ID="txtTitle" runat="server" Width="380px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            خلاصه&nbsp; خبر:
                        </td>
                        <td>
                            <asp:TextBox ID="txtBreif" runat="server" Height="56px" TextMode="MultiLine" 
                                Width="380px"></asp:TextBox>
                            &nbsp;<span class="style15">از 20 کلمه تجاوز نکند.</span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtBreif" ErrorMessage="تکمیل نشده است" ValidationGroup="2"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            خبر کامل:<asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
                                runat="server" ControlToValidate="FCKeditor" ErrorMessage="*" 
                                ValidationGroup="2"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <FCKeditorV2:FCKeditor ID="FCKeditor" runat="server" 
                                BasePath="~/Management/content/fckeditor/" Height="500px">
                            </FCKeditorV2:FCKeditor>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            قابلیت نمایش:
                        </td>
                        <td>
                            <asp:CheckBox ID="chk" runat="server" Checked="True" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;
                        </td>
                        <td>
                            <asp:ImageButton ID="btnInsertNews" runat="server" 
                                ImageUrl="~/Management/Content/Images/btnSend.jpg" ValidationGroup="2" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
                لیست خبر ها</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_News" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" CellPadding="4" DataSourceID="ODS_News" 
                    ForeColor="#333333" GridLines="None" Width="900px">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="title_news" HeaderText="عنوان خبر" 
                            SortExpression="title_news">
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="lid_news" HeaderText="خلاصه خبر" 
                            SortExpression="lid_news">
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="news" HeaderText="خبر کامل" SortExpression="news" 
                            Visible="False">
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="tarikh" HeaderText="تاریخ خبر" 
                            SortExpression="tarikh">
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="time" HeaderText="زمان خبر" SortExpression="time">
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:CheckBoxField DataField="Flag" HeaderText="Flag" SortExpression="Flag" 
                            Visible="False" />
                        <asp:BoundField DataField="Username" HeaderText="گذارنده خبر" 
                            SortExpression="Username">
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Code_Category" HeaderText="Code_Category" 
                            SortExpression="Code_Category" Visible="False" />
                        <asp:TemplateField>
                            <ItemTemplate>
                            
                                <asp:Button 
                                CommandArgument='<%# Eval("id","{0}") %>'
                                OnCommand="EditShow"
                                ID="Button1" runat="server" 
                                    style="font-family: Tahoma; font-size: 11px" Text="مشاهده و ویرایش" />
                                    
                                <asp:ImageButton 
                                CommandArgument='<%# Eval("id","{0}") %>'
                                OnCommand="Delete"
                                OnClientClick="return confirm('آیا از حذف این خبر مطمئن هستید؟');"
                                ID="ImageButton2" runat="server" 
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
                <asp:ObjectDataSource ID="ODS_News" runat="server" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="DS_CMS_NewsTableAdapters.CMS_NewsTableAdapter">
                    <InsertParameters>
                        <asp:Parameter Name="title_news" Type="String" />
                        <asp:Parameter Name="lid_news" Type="String" />
                        <asp:Parameter Name="news" Type="String" />
                        <asp:Parameter Name="tarikh" Type="String" />
                        <asp:Parameter Name="time" Type="String" />
                        <asp:Parameter Name="Flag" Type="Boolean" />
                        <asp:Parameter Name="Username" Type="String" />
                        <asp:Parameter Name="Code_Category" Type="Int64" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
