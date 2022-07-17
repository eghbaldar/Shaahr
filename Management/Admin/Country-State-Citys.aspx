<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false" CodeFile="Country-State-Citys.aspx.vb" Inherits="Management_Admin_Country_State_Citys" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style13
        {
            width: 61px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style13">
                            نام کشور:</td>
                        <td>
                            <asp:TextBox ID="txtCountry" runat="server" Width="363px"></asp:TextBox>
                            <asp:Button ID="btnInsertCountry" runat="server" 
                                style="font-family: Tahoma; font-size: 11px" Text="ثبت" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_Country" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="code" 
                    DataSourceID="SDS_Country" ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="code" HeaderText="code" InsertVisible="False" 
                            ReadOnly="True" SortExpression="code" Visible="False" />
                        <asp:BoundField DataField="NameCountry" HeaderText="نام کشور" 
                            SortExpression="NameCountry" />
                        <asp:CommandField CancelText="لغو" EditText="ویرایش" SelectText="انتخاب" 
                            ShowEditButton="True" ShowSelectButton="True" UpdateText="بروزرسانی" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" 
                                OnCommand="DeleteCountry"
                                CommandArgument='<%# Eval("code","{0}") %>'
                                OnClientClick="return confirm('آیا از حذف مطمئن هستید؟');"
                                ImageUrl="~/Management/Content/Images/close.jpg" />
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        <span class="style14">ر</span><span class="style14">کوردی برای نمایش وجود ندارد.</span>
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:SqlDataSource ID="SDS_Country" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:shaahrConnectionString %>" 
                    SelectCommand="SELECT * FROM [tbl_CMS_Country] ORDER BY [code] DESC" 
                    UpdateCommand="UPDATE tbl_CMS_Country SET NameCountry = @NameCountry WHERE (code = @code)">
                    <UpdateParameters>
                        <asp:Parameter Name="NameCountry" />
                        <asp:Parameter Name="code" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style13">
                            نام استان:</td>
                        <td>
                            <asp:TextBox ID="txtState" runat="server" Width="363px"></asp:TextBox>
                            <asp:Button ID="btnInsertState" runat="server" 
                                style="font-family: Tahoma; font-size: 11px" Text="ثبت" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_State" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="code" 
                    DataSourceID="SDS_State" ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="code" HeaderText="code" InsertVisible="False" 
                            ReadOnly="True" SortExpression="code" Visible="False" />
                        <asp:BoundField DataField="code_country" HeaderText="code_country" 
                            SortExpression="code_country" Visible="False" />
                        <asp:BoundField DataField="NameState" HeaderText="نام استان ها (ایالت ها)" 
                            SortExpression="NameState" />
                        <asp:CommandField CancelText="لغو" EditText="ویرایش" SelectText="انتخاب" 
                            ShowSelectButton="True" UpdateText="بروزرسانی" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" 
                                                                OnCommand="DeleteState"
                                CommandArgument='<%# Eval("code","{0}") %>'
                                    ImageUrl="~/Management/Content/Images/close.jpg" 
                                    OnClientClick="return confirm('آیا از حذف مطمئن هستید؟');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        <span class="style14">ر</span><span class="style14">کوردی برای نمایش وجود ندارد.</span>
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:SqlDataSource ID="SDS_State" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:shaahrConnectionString %>" 
                    SelectCommand="SELECT * FROM [tbl_CMS_State] WHERE ([code_country] = @code_country) ORDER BY [code] DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DG_Country" Name="code_country" 
                            PropertyName="SelectedValue" Type="Int64" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style13">
                            نام شهر:</td>
                        <td>
                            <asp:TextBox ID="txtCity" runat="server" Width="363px"></asp:TextBox>
                            <asp:Button ID="btnInsertCity" runat="server" 
                                style="font-family: Tahoma; font-size: 11px" Text="ثبت" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_Citys" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataKeyNames="code" DataSourceID="SDS_Citys" 
                    ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="code" HeaderText="code" InsertVisible="False" 
                            ReadOnly="True" SortExpression="code" Visible="False" />
                        <asp:BoundField DataField="code_state" HeaderText="code_state" 
                            SortExpression="code_state" Visible="False" />
                        <asp:BoundField DataField="NameCity" HeaderText="نام شهر" 
                            SortExpression="NameCity" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" 
                                                                OnCommand="DeleteCity"
                                CommandArgument='<%# Eval("code","{0}") %>'
                                    ImageUrl="~/Management/Content/Images/close.jpg" 
                                    OnClientClick="return confirm('آیا از حذف مطمئن هستید؟');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        <span class="style14">ر</span><span class="style14">کوردی برای نمایش وجود ندارد.</span>
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:SqlDataSource ID="SDS_Citys" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:shaahrConnectionString %>" 
                    SelectCommand="SELECT * FROM [tbl_CMS_City] WHERE ([code_state] = @code_state) ORDER BY [code] DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DG_State" Name="code_state" 
                            PropertyName="SelectedValue" Type="Int64" />
                    </SelectParameters>
                </asp:SqlDataSource>
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

