<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="Nazmie.aspx.vb" Inherits="Management_Admin_Nazmie" Title="Untitled Page" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style13
        {
            width: 72px;
        }
        .style14
        {
            width: 158px;
        }
        .style15
        {
            width: 78px;
        }
        .style16
        {
            width: 85px;
        }
        .style17
        {
            font-size: 13px;
            font-weight: bold;
        }
        .style18
        {
            width: 75px;
        }
        .style19
        {
            background-color: #66FFFF;
        }
        .style20
        {
            width: 187px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <div style="-moz-border-radius: 3px; padding: 20px; text-shadow: 0.2em 0.2em #ccc;
                    text-align: center; font-size: 20px; border: 2px dotted #ccc; box-shadow: 10px 10px 5px #ccc;
                    background-color: #CCDB8A">
                    <a href="Reports_And_Detectives.aspx" style="color: blue; text-decoration: none;">ورود
                         به بخش کارگاهان و مدیریت گزارشات کارگاهان</a>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <div style="-moz-border-radius: 3px; padding: 20px; text-shadow: 0.2em 0.2em #ccc;
                    text-align: center; font-size: 20px; border: 2px dotted #ccc; box-shadow: 10px 10px 5px #ccc;
                    background-color: #B0CAE6">
                    <a href="Reports_And_Users.aspx" style="color: blue; text-decoration: none;">ورود
                        به بخش گزارشات کاربران و مهمانان</a>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            </tr>
            <tr>
                <td>
                    <div style="-moz-border-radius: 3px; background-color: #ccc; padding: 5px; color: #000;">
                        تنظیمات کلی نظمیه</div>
                </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style20">
                            فعال/غیرفعال بودن ثبت نام کارگاهان:
                        </td>
                        <td>
                            <asp:RadioButtonList ID="Rb_Status_Detective_Register" runat="server">
                                <asp:ListItem Value="1">فعال</asp:ListItem>
                                <asp:ListItem Value="0">غیر فعال</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style20">
                            <span id="ctl00_ContentPlaceHolder1_lblReportUser">مقدار جیرینگ پاداش جهت اعلام صحیح
                                تخلف برای کاربران عادی:</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtJiring_ReportUsers" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style20">
                            <span id="ctl00_ContentPlaceHolder1_lblReportDetective">مقدار جیرینگ پاداش جهت اعلام
                                صحیح تخلف برای کاربران ویژه(کارگاهان):</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtJiring_ReportDetectice" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style20">
                            <asp:Button ID="btnUpdateSetting" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                Text="ثبت" />
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <div style="-moz-border-radius: 3px; background-color: #2F78B6; padding: 5px; color: White;">
                    بخش اخبار
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <b>گروهبندی&nbsp; </b>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="Chk_CategoryNazmie" runat="server" Text="نمایش گروهبندی" AutoPostBack="True" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_Category" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="CodeCategory" DataSourceID="ODS_Category_Nazmie" ForeColor="#333333"
                    GridLines="None" Visible="False">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="CodeCategory" HeaderText="CodeCategory" InsertVisible="False"
                            ReadOnly="True" SortExpression="CodeCategory" Visible="False" />
                        <asp:BoundField DataField="NameCategory" HeaderText="نام گروه" SortExpression="NameCategory" />
                        <asp:TemplateField HeaderText="ویرایش">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" OnCommand="EditCategoryNews" CommandArgument='<%# Eval("CodeCategory","{0}") %>'
                                    Style="font-size: 11px; font-family: Tahoma" Text="ویرایش" />
                                <asp:ImageButton ID="ImageButton1" runat="server" OnCommand="DeleteCategoryNews"
                                    OnClientClick="return confirm('مطمئن؟ با حذف گروه تمام خبرهای زیر گروه آن نیز حذف می گردند.');"
                                    CommandArgument='<%# Eval("CodeCategory","{0}") %>' ImageUrl="~/Content/images/Home/Delete.png" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Category_Nazmie" runat="server" DeleteMethod="Delete"
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                    TypeName="DS_CMS_NazmieTableAdapters.Nazmie_Category_NewsTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_CodeCategory" Type="Int64" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="NameCategory" Type="String" />
                        <asp:Parameter Name="Original_CodeCategory" Type="Int64" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="NameCategory" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="Pnl_UpdateCategory" runat="server" BorderStyle="Dotted" Visible="False">
                    <table class="style1">
                        <tr>
                            <td class="style13">
                                نام گروه:
                            </td>
                            <td>
                                <asp:TextBox ID="txtUpdateCategoryName" runat="server" Width="456px" Style="font-family: Tahoma;
                                    font-size: 11px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUpdateCategoryName"
                                    ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                <asp:Button ID="btnUpdateCategory" runat="server" Style="font-size: 11px; font-family: Tahoma"
                                    Text="ثبت" ValidationGroup="1" />
                                <asp:Button ID="CancelUpdateCategory" runat="server" Style="font-family: Tahoma;
                                    font-size: 11px" Text="لغو" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="Chk_InsertCategoryNazmie" runat="server" Text="درج گروهبندی" AutoPostBack="True" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="PnlInsertCategory" runat="server" BorderColor="#3333FF" BorderStyle="Dotted"
                    Visible="False">
                    <table class="style1">
                        <tr>
                            <td class="style13">
                                نام گروه:
                            </td>
                            <td>
                                <asp:TextBox ID="txtInsertCategoryName" runat="server" Width="456px" Style="font-family: Tahoma;
                                    font-size: 11px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUpdateCategoryName"
                                    ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                <asp:Button ID="btnInsertCategory" runat="server" Style="font-size: 11px; font-family: Tahoma"
                                    Text="ثبت" ValidationGroup="1" />
                                <asp:Button ID="CancelInsertCategory" runat="server" Style="font-family: Tahoma;
                                    font-size: 11px" Text="لغو" />
                            </td>
                            <td>
                                &nbsp;
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
                <b>خبرها </b>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="Chk_News" runat="server" Text="نمایش خبر ها" AutoPostBack="True" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_NewsNazmie" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="ODS_News_Nazmie" ForeColor="#333333" GridLines="None" Visible="False">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                            SortExpression="id" Visible="False" />
                        <asp:BoundField DataField="codecategory" HeaderText="codecategory" SortExpression="codecategory"
                            Visible="False" />
                        <asp:BoundField DataField="namecategory" HeaderText="نام گروه-----" SortExpression="namecategory" />
                        <asp:BoundField DataField="title" HeaderText="عنوان خبر" SortExpression="title" />
                        <asp:BoundField DataField="lid_news" HeaderText="خبر کوتاه" SortExpression="lid_news" />
                        <asp:BoundField DataField="news" HeaderText="news" SortExpression="news" Visible="False" />
                        <asp:BoundField DataField="date" HeaderText="تاریخ" SortExpression="date" />
                        <asp:BoundField DataField="time" HeaderText="زمان" SortExpression="time" />
                        <asp:CheckBoxField DataField="flag" HeaderText="وضعیت نمایش" SortExpression="flag" />
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("id","{0}") %>'
                                    OnCommand="EditNews" Style="font-size: 11px; font-family: Tahoma" Text="ویرایش" />
                                <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("id","{0}") %>'
                                    ImageUrl="~/Content/images/Home/Delete.png" OnClientClick="return confirm('مطمئن؟ .');"
                                    OnCommand="DeleteNews" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:Panel ID="PnlEditNews" runat="server" BorderStyle="Dotted" Visible="False">
                    <table class="style1">
                        <tr>
                            <td class="style14">
                                نام گروه:
                            </td>
                            <td>
                                <asp:DropDownList ID="cmbUpdateNews" runat="server" DataSourceID="ODS_Category_Nazmie"
                                    DataTextField="NameCategory" DataValueField="CodeCategory" Style="font-family: Tahoma;
                                    font-size: 11px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                عنوان خبر:
                            </td>
                            <td>
                                <asp:TextBox ID="txtUpdateTitleNews" runat="server" Style="font-family: Tahoma; font-size: 11px;
                                    text-align: right" Width="410px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                خبر کوتاه:
                            </td>
                            <td>
                                <asp:TextBox ID="txtUpdateLidNews" runat="server" Height="158px" Style="font-family: Tahoma;
                                    font-size: 11px; text-align: right" TextMode="MultiLine" Width="677px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                خبر کامل:
                            </td>
                            <td>
                                <FCKeditorV2:FCKeditor ID="txtUpdateNews" runat="server" BasePath="~/Management/content/fckeditor/"
                                    Height="500px">
                                </FCKeditorV2:FCKeditor>
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                وضعیت نمایش:
                            </td>
                            <td>
                                <asp:RadioButtonList ID="Rb_UpdateNews" runat="server">
                                    <asp:ListItem Value="1">نمایش</asp:ListItem>
                                    <asp:ListItem Value="0">عدم نمایش</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                <asp:Button ID="btnUpdateNews" runat="server" Style="font-size: 11px; font-family: Tahoma"
                                    Text="ثبت" ValidationGroup="1" />
                                <asp:Button ID="CancelUpdateNews" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                    Text="لغو" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:ObjectDataSource ID="ODS_News_Nazmie" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_CMS_NazmieTableAdapters.Nazmie_NewsTableAdapter">
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="Chk_InsertNews" runat="server" Text="درج خبر" AutoPostBack="True" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="PnlInsertNews" runat="server" BorderColor="Blue" BorderStyle="Dotted"
                    Visible="False">
                    <table class="style1">
                        <tr>
                            <td class="style14">
                                نام گروه:
                            </td>
                            <td>
                                <asp:DropDownList ID="cmbInsertNews" runat="server" DataSourceID="ODS_Category_Nazmie"
                                    DataTextField="NameCategory" DataValueField="CodeCategory" Style="font-family: Tahoma;
                                    font-size: 11px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                عنوان خبر:
                            </td>
                            <td>
                                <asp:TextBox ID="txtInsertTitleNews" runat="server" Style="font-family: Tahoma; font-size: 11px;"
                                    Width="410px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                خبر کوتاه:
                            </td>
                            <td>
                                <asp:TextBox ID="txtInsertLidNews" runat="server" Height="158px" Style="font-family: Tahoma;
                                    font-size: 11px; text-align: right" TextMode="MultiLine" Width="677px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                خبر کامل:
                            </td>
                            <td>
                                <FCKeditorV2:FCKeditor ID="txtInsertNews" runat="server" BasePath="~/Management/content/fckeditor/"
                                    Height="500px">
                                </FCKeditorV2:FCKeditor>
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                <asp:Button ID="btnInsertNews" runat="server" Style="font-size: 11px; font-family: Tahoma"
                                    Text="ثبت" ValidationGroup="1" />
                                <asp:Button ID="CancelInsertNews" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                    Text="لغو" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style14">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <div style="-moz-border-radius: 3px; background-color: #2F78B6; padding: 5px; color: White;">
                    قوانین نظمیه
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="Chk_Law" runat="server" Text="نمایش قوانین" AutoPostBack="True" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_Law" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="ODS_Law" ForeColor="#333333" GridLines="None" Visible="False">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="code" HeaderText="code" InsertVisible="False" ReadOnly="True"
                            SortExpression="code" Visible="False" />
                        <asp:BoundField DataField="subject" HeaderText="موضوع" SortExpression="subject" />
                        <asp:BoundField DataField="detail" HeaderText="توضیحات" SortExpression="detail" Visible="False" />
                        <asp:BoundField DataField="date" HeaderText="تاریخ" SortExpression="date" />
                        <asp:TemplateField HeaderText="نوع قانون" SortExpression="type">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("type") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Panel ID="Panel1" runat="server" Style="padding: 4px; -moz-border-radius: 3px;
                                    color: White;" BackColor='<%# CheckBGLaw(DataBinder.Eval(Container.DataItem,"type"))  %>'>
                                    <asp:Label ID="Label1" runat="server" Text='<%# CheckTypeLaw(DataBinder.Eval(Container.DataItem,"type")) %>'></asp:Label>
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("code","{0}") %>'
                                    OnCommand="EditLaw" Style="font-size: 11px; font-family: Tahoma" Text="ویرایش" />
                                <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("code","{0}") %>'
                                    ImageUrl="~/Content/images/Home/Delete.png" OnClientClick="return confirm('مطمئن؟ .');"
                                    OnCommand="DeleteLaw" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:Panel ID="PnlUpdateLaw" runat="server" BorderStyle="Dotted" Visible="False">
                    <table class="style1">
                        <tr>
                            <td class="style15">
                                موضوع:
                            </td>
                            <td>
                                <asp:TextBox ID="txtUpdateSubjectLaw" runat="server" Style="font-family: Tahoma;
                                    font-size: 11px;" Width="410px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style15">
                                توضیحات:
                            </td>
                            <td>
                                <FCKeditorV2:FCKeditor ID="txtUpdateDetailLaw" runat="server" BasePath="~/Management/content/fckeditor/"
                                    Height="500px">
                                </FCKeditorV2:FCKeditor>
                            </td>
                        </tr>
                        <tr>
                            <td class="style15">
                                نوع قانون:
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RbUpdateLaw" runat="server">
                                    <asp:ListItem Selected="True" Value="1">قانون کلی (قوانین کلی نظارت و بازدارندگی 
                                    نظمیه)</asp:ListItem>
                                    <asp:ListItem Value="2">عناوین جرم و تخلفات</asp:ListItem>
                                    <asp:ListItem Value="3">هشدار های پیشگیرانه</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style15">
                                <asp:Button ID="btnUpdateLaw" runat="server" Style="font-size: 11px; font-family: Tahoma"
                                    Text="ثبت" ValidationGroup="1" />
                                <asp:Button ID="CancelUpdateLaw" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                    Text="لغو" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:ObjectDataSource ID="ODS_Law" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_CMS_NazmieTableAdapters.Nazmie_LawTableAdapter">
                    <InsertParameters>
                        <asp:Parameter Name="subject" Type="String" />
                        <asp:Parameter Name="detail" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="type" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="Chk_InsertLaw" runat="server" Text="درج قانون" AutoPostBack="True" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="PnlInsertLaw" runat="server" BorderColor="Blue" BorderStyle="Dotted"
                    Visible="False">
                    <table class="style1">
                        <tr>
                            <td class="style16">
                                موضوع:
                            </td>
                            <td>
                                <asp:TextBox ID="txtInsertSubjectLaw" runat="server" Style="font-family: Tahoma;
                                    font-size: 11px;" Width="410px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style16">
                                توضیحات:
                            </td>
                            <td>
                                <FCKeditorV2:FCKeditor ID="txtInsertDetailLaw" runat="server" BasePath="~/Management/content/fckeditor/"
                                    Height="500px">
                                </FCKeditorV2:FCKeditor>
                            </td>
                        </tr>
                        <tr>
                            <td class="style16">
                                نوع قانون:
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RbInsertLaw" runat="server">
                                    <asp:ListItem Selected="True" Value="1">قانون کلی (قوانین کلی نظارت و بازدارندگی 
                                    نظمیه)</asp:ListItem>
                                    <asp:ListItem Value="2">عناوین جرم و تخلفات</asp:ListItem>
                                    <asp:ListItem Value="3">هشدار های پیشگیرانه</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style16">
                                <asp:Button ID="btnInsertLaw" runat="server" Style="font-size: 11px; font-family: Tahoma"
                                    Text="ثبت" ValidationGroup="1" />
                                <asp:Button ID="CancelInsertLaw" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                    Text="لغو" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <div style="-moz-border-radius: 3px; background-color: red; padding: 5px; color: White;">
                    مدیریت توبیخ ها و تعلیق ها
                </div>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style17">
                لیست توبیخ های انجام شده:
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;<table class="style1">
                    <tr>
                        <td class="style18">
                            <span class="style19">تعداد توبیخ ها:</span>
                        </td>
                        <td>
                            <asp:Label ID="lblCountERails" runat="server" Style="background-color: #66FFFF"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_Rails" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="ODS_RailUsers" ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:TemplateField HeaderText="نام و نام خانوادگی" SortExpression="email">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Style="font-weight: 700" Text='<%# GetFnLn(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CodeCrime" HeaderText="CodeCrime" SortExpression="CodeCrime"
                            Visible="False" />
                        <asp:BoundField DataField="cuase" HeaderText="دلیل" SortExpression="cuase" />
                        <asp:BoundField DataField="date" HeaderText="تاریخ" SortExpression="date" />
                        <asp:BoundField DataField="ByHow" HeaderText="ByHow" SortExpression="ByHow" Visible="False" />
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button2" runat="server" OnCommand="RedirectToRail" CommandArgument='<%# Eval("email","{0}") %>'
                                    Style="font-family: Tahoma; font-size: 11px" Text="جزییات توبیخ" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        رکوردی وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_RailUsers" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_CMS_NazmieTableAdapters.Nazmie_RailUsers_AdminTableAdapter">
                    <InsertParameters>
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="CodeCrime" Type="Int64" />
                        <asp:Parameter Name="cuase" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="ByHow" Type="String" />
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
                <b>لیست تعلیق ها:</b>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style18">
                            <span class="style19">تعداد&nbsp; تعلیق ها:</span>
                        </td>
                        <td>
                            <asp:Label ID="lblCountSuspention" runat="server" Style="background-color: #66FFFF"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_Suspention" runat="server" AutoGenerateColumns="False" BackColor="White"
                    BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="ODS_Suspention"
                    ForeColor="Black" GridLines="Vertical">
                    <FooterStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:TemplateField HeaderText="نام و نام خانوادگی" SortExpression="email">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Style="font-weight: 700" Text='<%# GetFnLn(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="نوع تعلــــــــــیق" SortExpression="type">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("type") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# GetTypeSuspention(DataBinder.Eval(Container.DataItem,"type")) %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle BackColor="#009933" BorderColor="#FF3300" BorderStyle="Dotted" />
                            <ItemStyle BackColor="#FFFF99" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="ByHow" HeaderText="ByHow" SortExpression="ByHow" Visible="False" />
                        <asp:BoundField DataField="DateStart" HeaderText="تاریخ شروع" SortExpression="DateStart" />
                        <asp:BoundField DataField="DateEnd" HeaderText="تاریخ پایان" SortExpression="DateEnd" />
                        <asp:BoundField DataField="cuase" HeaderText="علت" SortExpression="cuase" />
                        <asp:CheckBoxField DataField="flag" HeaderText="flag" SortExpression="flag" Visible="False" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button2" runat="server" CommandArgument='<%# Eval("email","{0}") %>'
                                    OnCommand="RedirectToRail" Style="font-family: Tahoma; font-size: 11px" Text="جزییات توبیخ" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        رکوردی وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Suspention" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_CMS_NazmieTableAdapters.Nazmie_Suspension_Users_AdminTableAdapter">
                    <InsertParameters>
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="type" Type="Int32" />
                        <asp:Parameter Name="ByHow" Type="String" />
                        <asp:Parameter Name="DateStart" Type="String" />
                        <asp:Parameter Name="DateEnd" Type="String" />
                        <asp:Parameter Name="cuase" Type="String" />
                        <asp:Parameter Name="flag" Type="Boolean" />
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
</asp:Content>
