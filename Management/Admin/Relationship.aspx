<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="Relationship.aspx.vb" Inherits="Management_Admin_Relationship" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td style="background-color: #FFFF99">
                لیست&nbsp; تمام ارتباطات
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td>
                            <asp:Label ID="lblCountAll" runat="server" Style="font-weight: 700"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="dg_All" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                DataSourceID="ODS_All" ForeColor="#333333" GridLines="None">
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#E3EAEB" />
                                <Columns>
                                    <asp:TemplateField HeaderText="نام و نام خانوادگی" SortExpression="user">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# getFnLn(Eval("user","{0}")) %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="user" HeaderText="پست الکترونیکی" SortExpression="user" />
                                    <asp:TemplateField SortExpression="user">
                                        <ItemTemplate>
                                            <asp:Button ID="Button1" OnCommand="ShowAttrib" CommandArgument='<%# Eval("user","{0}") %>'
                                                runat="server" Style="font-family: Tahoma" Text="مشخصات" />
                                            <asp:Button ID="Button2" runat="server" OnClientClick="return confirm('آیا از حذف این ارتباط مطمئن هستید؟');"
                                                CommandArgument='<%# Eval("user","{0}") %>' OnCommand="DeleteRelation" Style="color: #FFFFFF;
                                                font-family: Tahoma; font-size: 11px; font-weight: 700; background-color: #FF0000"
                                                Text="حذف ارتباط" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#7C6F57" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                            <asp:ObjectDataSource ID="ODS_All" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="DS_CMS_UserManagementTableAdapters.Relationship_AllTableAdapter">
                                <SelectParameters>
                                    <asp:QueryStringParameter DefaultValue="" Name="email" QueryStringField="email" Type="String" />
                                </SelectParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="user" Type="String" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="background-color: #FFFF99">
                لیست دوستان
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td>
                            <asp:Label ID="lblCountFriends" runat="server" Style="font-weight: 700"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="dg_Friends" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                DataSourceID="ODS_Friends" ForeColor="#333333" GridLines="None">
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <Columns>
                                    <asp:TemplateField HeaderText="نام و نام خانوادگی" SortExpression="user">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# getFnLn(Eval("user","{0}")) %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="user" HeaderText="پست الکترونیکی" SortExpression="user" />
                                    <asp:TemplateField SortExpression="user">
                                        <ItemTemplate>
                                            <asp:Button ID="Button1" OnCommand="ShowAttrib" CommandArgument='<%# Eval("user","{0}") %>'
                                                runat="server" Style="font-family: Tahoma" Text="مشخصات" />
                                            <asp:Button ID="Button2" runat="server" OnClientClick="return confirm('آیا از حذف این ارتباط مطمئن هستید؟');"
                                                CommandArgument='<%# Eval("user","{0}") %>' OnCommand="DeleteRelation" Style="color: #FFFFFF;
                                                font-family: Tahoma; font-size: 11px; font-weight: 700; background-color: #FF0000"
                                                Text="حذف ارتباط" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField SortExpression="user">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("user") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            </asp:GridView>
                            <asp:ObjectDataSource ID="ODS_Friends" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="DS_CMS_UserManagementTableAdapters.Relationship_FriendsTableAdapter">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="email" QueryStringField="email" Type="String" />
                                </SelectParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="user" Type="String" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="background-color: #FFFF99">
                لیست بستگان
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td>
                            <asp:Label ID="lblCountFamily" runat="server" Style="font-weight: 700"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="dg_Family" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                DataSourceID="ODS_Familys" ForeColor="#333333" GridLines="None">
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <Columns>
                                    <asp:TemplateField HeaderText="نام و نام خانوادگی" SortExpression="user">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# getFnLn(Eval("user","{0}")) %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="user" HeaderText="پست الکترونیکی" SortExpression="user" />
                                    <asp:TemplateField SortExpression="user">
                                        <ItemTemplate>
                                            <asp:Button ID="Button1" OnCommand="ShowAttrib" CommandArgument='<%# Eval("user","{0}") %>'
                                                runat="server" Style="font-family: Tahoma" Text="مشخصات" />
                                            <asp:Button ID="Button2" runat="server" OnClientClick="return confirm('آیا از حذف این ارتباط مطمئن هستید؟');"
                                                CommandArgument='<%# Eval("user","{0}") %>' OnCommand="DeleteRelation" Style="color: #FFFFFF;
                                                font-family: Tahoma; font-size: 11px; font-weight: 700; background-color: #FF0000"
                                                Text="حذف ارتباط" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            </asp:GridView>
                            <asp:ObjectDataSource ID="ODS_Familys" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="DS_CMS_UserManagementTableAdapters.Relationship_FamilyTableAdapter">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="email" QueryStringField="email" Type="String" />
                                </SelectParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="user" Type="String" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="background-color: #FFFF99">
                همسر
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="dg_Wife" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="ODS_Wife" ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField HeaderText="نام و نام خانوادگی" SortExpression="user">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# getFnLn(Eval("user","{0}")) %>'>
                                </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="user" HeaderText="پست الکترونیکی" SortExpression="user" />
                        <asp:TemplateField SortExpression="user">
                            <ItemTemplate>
                                <asp:Button ID="Button1" OnCommand="ShowAttrib" CommandArgument='<%# Eval("user","{0}") %>'
                                    runat="server" Style="font-family: Tahoma" Text="مشخصات" />
                                <asp:Button ID="Button2" runat="server" OnClientClick="return confirm('آیا از حذف این ارتباط مطمئن هستید؟');"
                                    CommandArgument='<%# Eval("user","{0}") %>' OnCommand="DeleteRelation" Style="color: #FFFFFF;
                                    font-family: Tahoma; font-size: 11px; font-weight: 700; background-color: #FF0000"
                                    Text="حذف ارتباط" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Wife" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_CMS_UserManagementTableAdapters.Relationship_WifeTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="email" QueryStringField="email" Type="String" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="user" Type="String" />
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
