<%@ Page Language="VB" MasterPageFile="~/Shaahr/Admin/Home.master" AutoEventWireup="false"
    CodeFile="mayorpanel_CatPost.aspx.vb" Inherits="Shaahr_Admin_Default2" Title="Untitled Page" %>

<%@ Register Src="../../UserControl/Root/ButtonShaahr.ascx" TagName="ButtonShaahr"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        @font-face
        {
            font-family: koodak;
            src: url(               "../../content/font/W_koodak.TTF" );
        }
        .style3
        {
            width: 69px;
        }
        .style4
        {
            width: 4px;
        }
        .style5
        {
            width: 7px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <asp:Label ID="lblNameSHaahr" Style="font-family: Koodak; font-size: 14px; color: #838383;"
                    runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <hr style="border-bottom: 0; border-left: 0; border-right: 0; border-top: 2px dotted #ccc;" />
            </td>
        </tr>
        <tr>
            <td>
                <uc1:ButtonShaahr ID="btnMnu_FristPage" runat="server" />
                <uc1:ButtonShaahr ID="btnMnu_News" runat="server" />
                <uc1:ButtonShaahr ID="btnMnu_Cate" runat="server" />
                <uc1:ButtonShaahr ID="btnMnu_assist" runat="server" />
                <uc1:ButtonShaahr ID="btnMnu_ShowShaahr" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <hr style="border-bottom: 0; border-left: 0; border-right: 0; border-top: 2px dotted #ccc;" />
            </td>
        </tr>
        <tr>
            <td style="font-family: koodak; font-size: 14px;">
                طبقه بندی پست ها
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DgCategory" runat="server" AutoGenerateColumns="False" DataKeyNames="Code"
                    DataSourceID="SDS_Cat" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="Code" HeaderText="Code" InsertVisible="False" ReadOnly="True"
                            SortExpression="Code" Visible="False" />
                        <asp:BoundField DataField="CodeShaahr" HeaderText="CodeShaahr" SortExpression="CodeShaahr"
                            Visible="False" />
                        <asp:TemplateField SortExpression="Subject" HeaderText="عنوان و توضیحات">
                            <EditItemTemplate>
                                <table class="style1">
                                    <tr>
                                        <td class="style4">
                                            عنوان طبقه:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox1" runat="server" Style="font-family: Tahoma; font-size: 11px;"
                                                Text='<%# Bind("Subject") %>' Width="500px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4">
                                            توضیحات:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox3" runat="server" Style="font-family: Tahoma; font-size: 11px;"
                                                Text='<%# Bind("Detail") %>' Width="500px" TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <table class="style1">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Style="font-weight: 700" Text='<%# Bind("Subject") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Style="font-size: 10px" Text='<%# Bind("Detail") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <HeaderStyle Width="567px" HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Detail" SortExpression="Detail" Visible="False">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Detail") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="Luck" HeaderText="باز / بسته" SortExpression="Luck">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:CheckBoxField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="تایید"></asp:LinkButton>
                                /
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="لغو"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton11" runat="server"
                                    ImageUrl="~/Content/images/Shaahrs/Root/edit.png" CommandName="Edit" />
                            </ItemTemplate>
                            <ControlStyle Font-Underline="False" />
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton41" runat="server"
                                    CommandArgument='<%# Eval("code","{0}") %>' ImageUrl="~\content/images/Stage/Jiring/remove.png"
                                    OnCommand="DeleteCateogry" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        طبقه ای وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" ForeColor="#929DA3" />
                    <HeaderStyle BackColor="#DEDEDE" BorderColor="#cccccc" BorderStyle="Solid" BorderWidth="1px"
                        Font-Bold="false" ForeColor="#567D8C" />
                    <EditRowStyle BackColor="#D9E4E8" />
                    <AlternatingRowStyle BackColor="#E6E6E6" ForeColor="#284775" />
                </asp:GridView>
                <asp:SqlDataSource ID="SDS_Cat" runat="server" ConnectionString="<%$ ConnectionStrings:shaahrConnectionString %>"
                    SelectCommand="SELECT * FROM [tbl_Shaahr_ShaahrCategoryPost] WHERE ([CodeShaahr] = @CodeShaahr) ORDER BY [Code] DESC"
                    UpdateCommand="UPDATE tbl_Shaahr_ShaahrCategoryPost SET Subject = @Subject, Detail = @Detail, Luck = @Luck WHERE (Code = @code)">
                    <SelectParameters>
                        <asp:SessionParameter Name="CodeShaahr" SessionField="Mayor" Type="Int64" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Subject" />
                        <asp:Parameter Name="Detail" />
                        <asp:Parameter Name="Luck" />
                        <asp:Parameter Name="code" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style4">
                            <img alt="" src="../../Content/images/Home/info.gif" style="width: 14px; height: 14px" />
                        </td>
                        <td>
                            &nbsp;به محض زدن دکمه حذف، عملیات حذف انجام می شود، دقت کنید.
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            <img alt="" src="../../Content/images/Home/info.gif" style="width: 14px; height: 14px" />
                        </td>
                        <td>
                            با پاک شدن طبقه ای ، تمام پست های زیرگروه آن نیز پاک می گردد.
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="font-family: koodak; font-size: 14px;">
                درج طبقه
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style3">
                            عنوان طبقه:
                        </td>
                        <td>
                            <asp:TextBox ID="txtSubject" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                Width="300px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            توضیحات:
                        </td>
                        <td>
                            <asp:TextBox ID="txtDetail" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                Width="600px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            باز / بسته:
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rbOpenLuck" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1" Selected="True">باز</asp:ListItem>
                                <asp:ListItem Value="0">بسته</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td>
                            <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnInsertCat" runat="server"
                                ImageUrl="~/Content/images/Profile_View_Users/btnSend.jpg" ValidationGroup="1" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSubject"
                                ErrorMessage="عنوان را پر کنید." ValidationGroup="1"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDetail"
                                ErrorMessage="توضیحات را پر کنید." ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="font-family: koodak; font-size: 14px;">
                پست ها
            </td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList Style="padding: 5px; width: 680px; font-family: Tahoma; font-size: 11px;"
                    ID="cmbCat" runat="server" AutoPostBack="True" DataSourceID="SDS_Cat" DataTextField="Subject"
                    DataValueField="Code">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="Dg_Post" runat="server" AutoGenerateColumns="False" DataKeyNames="Code"
                    DataSourceID="SDS_Posts" CellPadding="4" ForeColor="#333333" GridLines="None"
                    AllowPaging="True" PageSize="25">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="Code" HeaderText="Code" InsertVisible="False" ReadOnly="True"
                            SortExpression="Code" Visible="False" />
                        <asp:BoundField DataField="CodeCategory" HeaderText="CodeCategory" SortExpression="CodeCategory"
                            Visible="False" />
                        <asp:TemplateField HeaderText="عنوان پست" SortExpression="Subject">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" OnCommand="ShowPost" Style="text-decoration: none;
                                    color: Gray;" CommandArgument='<%# Eval("code","{0}") %>' Text='<%# Bind("Subject") %>'></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" Width="380px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Text" SortExpression="Text" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Text") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" Visible="False" />
                        <asp:TemplateField HeaderText="بازدید" SortExpression="Visit">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Visit") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField SortExpression="Time">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Time") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField SortExpression="date">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("date") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="باز / بسته" SortExpression="Luck">
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Luck") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Luck") %>' Enabled="false" />
                            </ItemTemplate>
                            <HeaderStyle Font-Size="11px" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="تایید"></asp:LinkButton>
                                &nbsp;/&nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False"
                                    CommandName="Cancel" Text="لغو"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton112" runat="server"
                                    CommandName="Edit" ImageUrl="~/Content/images/Shaahrs/Root/edit.png" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton14" runat="server"
                                    CommandArgument='<%# Eval("code","{0}") %>' ImageUrl="~\content/images/Stage/Jiring/remove.png"
                                    OnCommand="DeletePost" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" ForeColor="#929DA3" />
                    <HeaderStyle BackColor="#DEDEDE" BorderColor="#cccccc" BorderStyle="Solid" BorderWidth="1px"
                        Font-Bold="false" ForeColor="#567D8C" />
                    <EditRowStyle BackColor="#D9E4E8" />
                    <AlternatingRowStyle BackColor="#E6E6E6" ForeColor="#284775" />
                </asp:GridView>
                <asp:SqlDataSource ID="SDS_Posts" runat="server" ConnectionString="<%$ ConnectionStrings:shaahrConnectionString %>"
                    SelectCommand="SELECT * FROM [tbl_Shaahr_ShaahrPost] WHERE ([CodeCategory] = @CodeCategory) ORDER BY [Code] DESC"
                    UpdateCommand="UPDATE tbl_Shaahr_ShaahrPost SET Luck = @luck WHERE (Code = @code)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cmbCat" Name="CodeCategory" PropertyName="SelectedValue"
                            Type="Int64" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="luck" />
                        <asp:Parameter Name="code" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style5">
                            <img alt="" src="../../Content/images/Home/info.gif" style="width: 14px; height: 14px" />
                        </td>
                        <td>
                            &nbsp;به محض زدن دکمه حذف، عملیات حذف انجام می شود، دقت کنید.
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            <img alt="" src="../../Content/images/Home/info.gif" style="width: 14px; height: 14px" />
                        </td>
                        <td>
                            با پاک شدن پست ای ، تمام&nbsp; جوابهای زیرگروه آن نیز پاک می گردد.
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
    </table>
</asp:Content>
