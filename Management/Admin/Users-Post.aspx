<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="Users-Post.aspx.vb" Inherits="Management_Admin_Users_Post" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <b>کاربر بعنوان فرستنده:</b>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="dgPost" runat="server" AutoGenerateColumns="False" DataKeyNames="code"
                    DataSourceID="ODS_sender" CellPadding="4" ForeColor="#333333" 
                    GridLines="None" AllowPaging="True">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="code" HeaderText="code" InsertVisible="False" ReadOnly="True"
                            SortExpression="code" Visible="False" />
                        <asp:TemplateField HeaderText="فرستنده" SortExpression="Email">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# getFnLn(DataBinder.Eval(Container.DataItem,"email")) %>'
                                    Style="font-size: 13px; color: #FF0000;"></asp:Label>
                                <br />
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Email") %>' Style="font-weight: 700"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle Width="200px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="گیرنده" SortExpression="for_who">
                            <ItemTemplate>
                                <asp:Label ID="Label34" runat="server" Text='<%# getFnLn(DataBinder.Eval(Container.DataItem,"for_who")) %>'
                                    Style="font-size: 13px; color: #006600;"></asp:Label>
                                <br />
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("for_who") %>' Style="font-weight: 700"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("for_who") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle Width="200px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" Visible="False">
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="string_factor" HeaderText="string_factor" SortExpression="string_factor"
                            Visible="False" />
                        <asp:BoundField DataField="date" HeaderText="تاریخ" SortExpression="date" />
                        <asp:BoundField DataField="time" HeaderText="زمان" SortExpression="time">
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="detail" HeaderText="detail" SortExpression="detail" Visible="False" />
                        <asp:BoundField DataField="OrgDate" HeaderText="OrgDate" SortExpression="OrgDate"
                            Visible="False" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" CommandArgument='<%# Eval("code","{0}")+"|"+Eval("email","{0}") %>'
                                    OnCommand="DetailPost" runat="server">جزییات</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" OnClientClick="return confirm('آیا از حذف مطمئن هستید؟');"
                                    OnCommand="DeletePost" CommandArgument='<%# Eval("code","{0}") %>' runat="server"
                                    ImageUrl="~/Management/Content/Images/close.jpg" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" OnCommand="RedirectUser" CommandArgument='<%# Eval("email","{0}") %>'
                                    BackColor="#66CCFF" BorderStyle="None" Style="font-family: Tahoma; font-size: 11px"
                                    Text="فرستنده" />
                                <asp:Button ID="Button2" runat="server" BackColor="#AEC554" OnCommand="RedirectUser"
                                    CommandArgument='<%# Eval("for_who","{0}") %>' BorderStyle="None" Style="font-family: Tahoma;
                                    font-size: 11px" Text="گیرنده" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="نوع">
                            <ItemTemplate>
                                <asp:Image ID="Image1" ImageUrl='<%# ControlImage(DataBinder.Eval(Container.DataItem,"type")) %>'
                                                                                    runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_sender" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_CMS_PostTableAdapters.Post_SenderTableAdapter"
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_code" Type="Int64" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="for_who" Type="String" />
                        <asp:Parameter Name="type" Type="Int32" />
                        <asp:Parameter Name="string_factor" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="time" Type="String" />
                        <asp:Parameter Name="detail" Type="String" />
                        <asp:Parameter Name="OrgDate" Type="String" />
                        <asp:Parameter Name="Original_code" Type="Int64" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Email" QueryStringField="email" Type="String" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="for_who" Type="String" />
                        <asp:Parameter Name="type" Type="Int32" />
                        <asp:Parameter Name="string_factor" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="time" Type="String" />
                        <asp:Parameter Name="detail" Type="String" />
                        <asp:Parameter Name="OrgDate" Type="String" />
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
                <b>کاربر بعنوان&nbsp; گیرنده:</b>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="dgPost0" runat="server" AutoGenerateColumns="False" DataKeyNames="code"
                    DataSourceID="ODS_Recive" CellPadding="4" ForeColor="#333333" 
                    GridLines="None" AllowPaging="True">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="code" HeaderText="code" InsertVisible="False" ReadOnly="True"
                            SortExpression="code" Visible="False" />
                        <asp:TemplateField HeaderText="فرستنده" SortExpression="Email">
                            <ItemTemplate>
                                <asp:Label ID="Label35" runat="server" Text='<%# getFnLn(DataBinder.Eval(Container.DataItem,"email")) %>'
                                    Style="font-size: 13px; color: #FF0000;"></asp:Label>
                                <br />
                                <asp:Label ID="Label36" runat="server" Text='<%# Bind("Email") %>' Style="font-weight: 700"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle Width="200px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="گیرنده" SortExpression="for_who">
                            <ItemTemplate>
                                <asp:Label ID="Label37" runat="server" Text='<%# getFnLn(DataBinder.Eval(Container.DataItem,"for_who")) %>'
                                    Style="font-size: 13px; color: #006600;"></asp:Label>
                                <br />
                                <asp:Label ID="Label38" runat="server" Text='<%# Bind("for_who") %>' Style="font-weight: 700"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("for_who") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle Width="200px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" Visible="False">
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="string_factor" HeaderText="string_factor" SortExpression="string_factor"
                            Visible="False" />
                        <asp:BoundField DataField="date" HeaderText="تاریخ" SortExpression="date" />
                        <asp:BoundField DataField="time" HeaderText="زمان" SortExpression="time">
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="detail" HeaderText="detail" SortExpression="detail" Visible="False" />
                        <asp:BoundField DataField="OrgDate" HeaderText="OrgDate" SortExpression="OrgDate"
                            Visible="False" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton3" CommandArgument='<%# Eval("code","{0}")+"|"+Eval("email","{0}") %>'
                                    OnCommand="DetailPost" runat="server">جزییات</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton2" OnClientClick="return confirm('آیا از حذف مطمئن هستید؟');"
                                    OnCommand="DeletePost" CommandArgument='<%# Eval("code","{0}") %>' runat="server"
                                    ImageUrl="~/Management/Content/Images/close.jpg" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" OnCommand="RedirectUser" CommandArgument='<%# Eval("email","{0}") %>'
                                    BackColor="#66CCFF" BorderStyle="None" Style="font-family: Tahoma; font-size: 11px"
                                    Text="فرستنده" />
                                <asp:Button ID="Button2" runat="server" BackColor="#AEC554" OnCommand="RedirectUser"
                                    CommandArgument='<%# Eval("for_who","{0}") %>' BorderStyle="None" Style="font-family: Tahoma;
                                    font-size: 11px" Text="گیرنده" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="نوع">
                            <ItemTemplate>
                                <asp:Image ID="Image1" ImageUrl='<%# ControlImage(DataBinder.Eval(Container.DataItem,"type")) %>'
                                                                                    runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Recive" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_CMS_PostTableAdapters.Post_ReciveTableAdapter"
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_code" Type="Int64" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="for_who" Type="String" />
                        <asp:Parameter Name="type" Type="Int32" />
                        <asp:Parameter Name="string_factor" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="time" Type="String" />
                        <asp:Parameter Name="detail" Type="String" />
                        <asp:Parameter Name="OrgDate" Type="String" />
                        <asp:Parameter Name="Original_code" Type="Int64" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="for_who" QueryStringField="email" Type="String" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="for_who" Type="String" />
                        <asp:Parameter Name="type" Type="Int32" />
                        <asp:Parameter Name="string_factor" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="time" Type="String" />
                        <asp:Parameter Name="detail" Type="String" />
                        <asp:Parameter Name="OrgDate" Type="String" />
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
    </table>
</asp:Content>
