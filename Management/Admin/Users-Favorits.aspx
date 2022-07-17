<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false" CodeFile="Users-Favorits.aspx.vb" Inherits="Management_Admin_Users_Favorits" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                <asp:MultiView ID="MultiView" runat="server">
                    <asp:View ID="ViewCat" runat="server">
                        <asp:GridView ID="DG_U1" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" DataSourceID="ODS_Cat" ForeColor="#333333" 
                            GridLines="None">
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="ID" Visible="False" />
                                <asp:BoundField DataField="code_favorit" HeaderText="code_favorit" 
                                    SortExpression="code_favorit" Visible="False" />
                                <asp:TemplateField>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                    
                                        <asp:Label ID="Label2" runat="server" style="font-weight: 700; font-size: 13px" 
                                           Text='<%# getFnLn(DataBinder.Eval(Container.DataItem,"email")) %>' >
                                            </asp:Label>
                                            
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Email" HeaderText="پست الکترونیکی" 
                                    SortExpression="Email" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="Button1" runat="server" 
                                            style="font-family: Tahoma; font-size: 11px" Text="مشاهده کاربر" />
                                        <asp:ImageButton ID="ImageButton1" runat="server" 
                                        OnClientClick="return confirm('آیا مطمئن هستید؟');"
                                         OnCommand="DeleteUser" CommandArgument='<%# Eval("ID","{0}") %>'
                                            ImageUrl="~/Management/Content/Images/close.jpg" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <EmptyDataTemplate>
                                کاربی وجود ندارد.
                            </EmptyDataTemplate>
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        </asp:GridView>
                        <asp:ObjectDataSource ID="ODS_Cat" runat="server" InsertMethod="Insert" 
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                            TypeName="DS_CMS_FavoritsTableAdapters.FavoritsCat_UsersTableAdapter">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="code" QueryStringField="code" Type="Int64" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:Parameter Name="code_favorit" Type="Int64" />
                                <asp:Parameter Name="Email" Type="String" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                    </asp:View>
                    <asp:View ID="ViewFav" runat="server">
                        <asp:GridView ID="DG_U2" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" DataSourceID="ODS_Fav" ForeColor="#333333" 
                            GridLines="None">
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="ID" Visible="False" />
                                <asp:BoundField DataField="code_favorit" HeaderText="code_favorit" 
                                    SortExpression="code_favorit" Visible="False" />
                                <asp:TemplateField>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" style="font-weight: 700; font-size: 13px" 
                                            Text='<%# getFnLn(DataBinder.Eval(Container.DataItem,"email")) %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Email" HeaderText="پست الکترونیکی" 
                                    SortExpression="Email" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="Button2" runat="server" 
                                            style="font-family: Tahoma; font-size: 11px" Text="مشاهده کاربر" />
                                        <asp:ImageButton ID="ImageButton2" runat="server" 
                                            ImageUrl="~/Management/Content/Images/close.jpg" 
                                            OnCommand="DeleteUser" CommandArgument='<%# Eval("ID","{0}") %>'
                                            OnClientClick="return confirm('آیا مطمئن هستید؟');" />
                                            
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <EmptyDataTemplate>
                                کاربی وجود ندارد.
                            </EmptyDataTemplate>
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        </asp:GridView>
                        <asp:ObjectDataSource ID="ODS_Fav" runat="server" InsertMethod="Insert" 
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                            TypeName="DS_CMS_FavoritsTableAdapters.Favorits_UsersTableAdapter">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="code" QueryStringField="code" Type="Int64" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:Parameter Name="code_favorit" Type="Int64" />
                                <asp:Parameter Name="Email" Type="String" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

