<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="Reports_And_Users.aspx.vb" Inherits="Management_Admin_Reports_And_Users"
    Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <b>لیست گزارشات کاربران:</b>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_Users" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="ODS_Users" ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:TemplateField HeaderText="نوع تخلف" SortExpression="CodeCrime">
                            <ItemTemplate>
                                <asp:Label ID="Label2" Style="font-weight: bold;" runat="server" Text='<%# GetSubjectCrime(DataBinder.Eval(Container.DataItem,"CodeCrime")) %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle BackColor="#FFFFCC" />
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="type" HeaderText="type" SortExpression="type" Visible="False" />
                        <asp:TemplateField HeaderText="ایمیل" SortExpression="email">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# GetFnLn(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="FnLn" HeaderText="FnLn" SortExpression="FnLn" Visible="False" />
                        <asp:BoundField DataField="emailOut" HeaderText="emailOut" SortExpression="emailOut"
                            Visible="False" />
                        <asp:TemplateField HeaderText="لینک تخلف" SortExpression="ViolationLink">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ViolationLink") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" NavigateUrl='<%# Eval("ViolationLink", "{0}") %>'>لینک</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="LevelViolation" HeaderText="سطح تخلف" SortExpression="LevelViolation" />
                        <asp:BoundField DataField="cuase_complain" HeaderText="دلیل" SortExpression="cuase_complain" />
                        <asp:TemplateField HeaderText="وضعیت" SortExpression="flag">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("flag") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Panel ID="Panel1" runat="server" Style="-moz-border-radius: 3px; padding: 3px;
                                    color: #000;" BackColor='<%# GetBG_Checked(DataBinder.Eval(Container.DataItem,"flag")) %>'>
                                    ×</asp:Panel>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="date" HeaderText="تاریخ" SortExpression="date" />
                        <asp:BoundField DataField="time" HeaderText="زمان" SortExpression="time" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="Button3" runat="server" BackColor="#009933" CommandArgument='<%# Eval("id","{0}") %>'
                                    OnCommand="Accept_Users" ToolTip="تخلف درست است" />
                                <asp:Button ID="Button4" runat="server" BackColor="Red" CommandArgument='<%# Eval("id","{0}") %>'
                                    OnCommand="Deny_Users" ToolTip="تخلف نادرست است" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument='<%# Eval("id","{0}") %>'
                                    ImageUrl="~/Content/images/Home/Delete.png" OnClientClick="return confirm('مطمئن؟');"
                                    OnCommand="DeleteReport" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        رکوردی وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Users" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_CMS_NazmieTableAdapters.Nazmie_Report_UsersTableAdapter">
                    <InsertParameters>
                        <asp:Parameter Name="CodeCrime" Type="Int64" />
                        <asp:Parameter Name="type" Type="Boolean" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="FnLn" Type="String" />
                        <asp:Parameter Name="emailOut" Type="String" />
                        <asp:Parameter Name="ViolationLink" Type="String" />
                        <asp:Parameter Name="LevelViolation" Type="String" />
                        <asp:Parameter Name="cuase_complain" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="time" Type="String" />
                        <asp:Parameter Name="flag" Type="Int64" />
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
                <b>لیست گزارشات مهمانان:</b>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_Guest" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="ODS_Guest" ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:TemplateField HeaderText="نوع تخلف" SortExpression="CodeCrime">
                            <ItemTemplate>
                                <asp:Label ID="Label2" Style="font-weight: bold;" runat="server" Text='<%# GetSubjectCrime(DataBinder.Eval(Container.DataItem,"CodeCrime")) %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle BackColor="#FFFFCC" />
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="type" HeaderText="type" SortExpression="type" Visible="False" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" Visible="False" />
                        <asp:BoundField DataField="FnLn" HeaderText="نام و نام خانوادگی" SortExpression="FnLn" />
                        <asp:BoundField DataField="emailOut" HeaderText="ایمیل" SortExpression="emailOut" />
                        <asp:TemplateField HeaderText="لینک تخلف" SortExpression="ViolationLink">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ViolationLink") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink2" runat="server" Target="_blank" NavigateUrl='<%# Eval("ViolationLink", "{0}") %>'>لینک</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="LevelViolation" HeaderText="سطح" SortExpression="LevelViolation" />
                        <asp:BoundField DataField="cuase_complain" HeaderText="دلیل" SortExpression="cuase_complain" />
                        <asp:TemplateField HeaderText="وضعیت" SortExpression="flag">
                            <ItemTemplate>
                                <asp:Panel ID="Panel1" runat="server" Style="-moz-border-radius: 3px; padding: 3px;
                                    color: #000;" BackColor='<%# GetBG_Checked(DataBinder.Eval(Container.DataItem,"flag")) %>'>
                                    ×</asp:Panel>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="date" HeaderText="تاریخ" SortExpression="date" />
                        <asp:BoundField DataField="time" HeaderText="زمان" SortExpression="time" />
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button3" runat="server" BackColor="#009933" CommandArgument='<%# Eval("id","{0}") %>'
                                    OnCommand="Accept_Guest" ToolTip="تخلف درست است" />
                                <asp:Button ID="Button4" runat="server" BackColor="Red" CommandArgument='<%# Eval("id","{0}") %>'
                                    OnCommand="Deny_Guest" ToolTip="تخلف نادرست است" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument='<%# Eval("id","{0}") %>'
                                    ImageUrl="~/Content/images/Home/Delete.png" OnClientClick="return confirm('مطمئن؟');"
                                    OnCommand="DeleteReport" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        رکوردی وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Guest" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_CMS_NazmieTableAdapters.Nazmie_Report_GuestsTableAdapter">
                    <InsertParameters>
                        <asp:Parameter Name="CodeCrime" Type="Int64" />
                        <asp:Parameter Name="type" Type="Boolean" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="FnLn" Type="String" />
                        <asp:Parameter Name="emailOut" Type="String" />
                        <asp:Parameter Name="ViolationLink" Type="String" />
                        <asp:Parameter Name="LevelViolation" Type="String" />
                        <asp:Parameter Name="cuase_complain" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="time" Type="String" />
                        <asp:Parameter Name="flag" Type="Int64" />
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
    </table>
</asp:Content>
