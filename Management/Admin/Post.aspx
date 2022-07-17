<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="Post.aspx.vb" Inherits="Management_Admin_Post" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                پست های امروز:
            </td>
        </tr>
        <tr>
            <td>
                <asp:RadioButtonList ID="Rbl_Type" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="0">عکس ها</asp:ListItem>
                    <asp:ListItem Value="1">لینک ها</asp:ListItem>
                    <asp:ListItem Value="2">مطالب</asp:ListItem>
                    <asp:ListItem Value="3">نظرسنجی ها</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                موارد یافت شده:
                <asp:Label ID="lblPost" runat="server" Style="font-weight: 700; color: #FF0000" Text="0"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="dgPost" runat="server" AutoGenerateColumns="False" DataKeyNames="code"
                    DataSourceID="OSD_POST_TODAY" CellPadding="4" ForeColor="#333333" GridLines="None">
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
                                <asp:Button ID="Button1" runat="server" BackColor="#66CCFF" BorderStyle="None" Style="font-family: Tahoma;
                                    font-size: 11px" Text="فرستنده" />
                                <asp:Button ID="Button2" runat="server" BackColor="#AEC554" BorderStyle="None" Style="font-family: Tahoma;
                                    font-size: 11px" Text="گیرنده" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="OSD_POST_TODAY" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_CMS_PostTableAdapters.Profile_Objects_byTypeTableAdapter"
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
                        <asp:ControlParameter ControlID="Rbl_Type" Name="type" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:Parameter Name="_date" Type="String" />
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
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                پست بر اساس&nbsp; تاریخ:</td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td>
                            نوع پست:</td>
                    </tr>
                    <tr>
                        <td>
                <asp:RadioButtonList ID="Rbl_TypeCustomize" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="0">عکس ها</asp:ListItem>
                    <asp:ListItem Value="1">لینک ها</asp:ListItem>
                    <asp:ListItem Value="2">مطالب</asp:ListItem>
                    <asp:ListItem Value="3">نظرسنجی ها</asp:ListItem>
                </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            تاریخ:</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                            <asp:Button ID="Button5" runat="server" 
                                style="font-family: Tahoma; font-size: 11px" Text="بگرد" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;<asp:GridView ID="dgPostDate" runat="server" AutoGenerateColumns="False" DataKeyNames="code"
                    DataSourceID="OSD_POST_Date" CellPadding="4" ForeColor="#333333" 
                    GridLines="None">
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
                                <asp:Label ID="Label36" runat="server" Text='<%# Bind("Email") %>' 
                                    Style="font-weight: 700"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle Width="200px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="گیرنده" SortExpression="for_who">
                            <ItemTemplate>
                                <asp:Label ID="Label37" runat="server" Text='<%# getFnLn(DataBinder.Eval(Container.DataItem,"for_who")) %>'
                                    Style="font-size: 13px; color: #006600;"></asp:Label>
                                <br />
                                <asp:Label ID="Label38" runat="server" Text='<%# Bind("for_who") %>' 
                                    Style="font-weight: 700"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("for_who") %>'></asp:TextBox>
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
                                <asp:Button ID="Button3" runat="server" BackColor="#66CCFF" BorderStyle="None" Style="font-family: Tahoma;
                                    font-size: 11px" Text="فرستنده" />
                                <asp:Button ID="Button4" runat="server" BackColor="#AEC554" BorderStyle="None" Style="font-family: Tahoma;
                                    font-size: 11px" Text="گیرنده" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;<asp:ObjectDataSource ID="OSD_POST_Date" runat="server" 
                    DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_CMS_PostTableAdapters.Profile_Objects_byTypeTableAdapter"
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
                        <asp:ControlParameter ControlID="Rbl_TypeCustomize" Name="type" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="txtDate" Name="_date" PropertyName="Text" 
                            Type="String" />
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
    </table>
</asp:Content>
