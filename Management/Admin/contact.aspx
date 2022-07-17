<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="contact.aspx.vb" Inherits="Management_Admin_Default2" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                تمام پیام های دریافتی
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="dg1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="ODS_All" ForeColor="#333333" GridLines="None" Width="899px" AllowPaging="True">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="FnLn" HeaderText="نام و نام خانواداگی" SortExpression="FnLn">
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="email" HeaderText="پست اکترونیکی" SortExpression="email">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="tell" HeaderText="تلفن" SortExpression="tell">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="group" HeaderText="برای کدام گروه" SortExpression="group">
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="cuase" HeaderText="متن پیام" SortExpression="cuase">
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:CheckBoxField DataField="flag" HeaderText="flag" SortExpression="flag" Visible="False" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="Button314" runat="server" OnCommand="ShowMSG" CommandArgument='<%# Eval("id","{0}") %>'
                                    Style="font-family: Tahoma; font-size: 11px" Text="مشاهده" />
                                <asp:ImageButton ID="ImageButton1" runat="server" OnCommand="DeleteContact" OnClientClick="return confirm('آیا از حذف این پیام مطئن هستید؟');"
                                    CommandArgument='<%# Eval("id","{0}") %>' ImageUrl="~/Management/Content/Images/close.jpg" />
                            </ItemTemplate>
                            <ItemStyle Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" BackColor='<%# CheckColorPanel(Databinder.Eval(Container.DataItem,"flag")) %>'
                                    Style="color: white; padding: 2px;" Text='<%# Check(Databinder.Eval(Container.DataItem,"flag")) %>' />
                            </ItemTemplate>
                            <ItemStyle Width="80px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ت - ز" SortExpression="Date">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("Time") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Date") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        پیامی برای مشاهده وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_All" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" 
                    TypeName="DS_CMS_ContactTableAdapters.CMS_ContactTableAdapter">
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td style="color: #FF0000">
                پیام های بررسی نشده
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;<asp:ObjectDataSource ID="ODS_Not" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_CMS_ContactTableAdapters.CMS_Contact_NotTableAdapter">
                    <InsertParameters>
                        <asp:Parameter Name="FnLn" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="tell" Type="String" />
                        <asp:Parameter Name="group" Type="String" />
                        <asp:Parameter Name="cuase" Type="String" />
                        <asp:Parameter Name="flag" Type="Boolean" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:GridView ID="dg2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="ODS_Ok" ForeColor="#333333" GridLines="None" Width="899px" 
                    AllowPaging="True">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="FnLn" HeaderText="نام و نام خانواداگی" SortExpression="FnLn">
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="email" HeaderText="پست اکترونیکی" SortExpression="email">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="tell" HeaderText="تلفن" SortExpression="tell">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="group" HeaderText="برای کدام گروه" SortExpression="group">
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="cuase" HeaderText="متن پیام" SortExpression="cuase">
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:CheckBoxField DataField="flag" HeaderText="flag" SortExpression="flag" Visible="False" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="Button316" runat="server" OnCommand="ShowMSG" CommandArgument='<%# Eval("id","{0}") %>'
                                    Style="font-family: Tahoma; font-size: 11px" Text="مشاهده" />
                                <asp:ImageButton ID="ImageButton3" runat="server" OnCommand="DeleteContact" OnClientClick="return confirm('آیا از حذف این پیام مطئن هستید؟');"
                                    CommandArgument='<%# Eval("id","{0}") %>' 
                                    ImageUrl="~/Management/Content/Images/close.jpg" />
                            </ItemTemplate>
                            <ItemStyle Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" BackColor='<%# CheckColorPanel(Databinder.Eval(Container.DataItem,"flag")) %>'
                                    Style="color: white; padding: 2px;" 
                                    Text='<%# Check(Databinder.Eval(Container.DataItem,"flag")) %>' />
                            </ItemTemplate>
                            <ItemStyle Width="80px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ت - ز" SortExpression="Date">
                            <ItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("Time") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Date") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        پیامی برای مشاهده وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:GridView ID="dg3" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="ODS_Not" ForeColor="#333333" GridLines="None" Width="899px" 
                    AllowPaging="True">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="FnLn" HeaderText="نام و نام خانواداگی" SortExpression="FnLn">
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="email" HeaderText="پست اکترونیکی" SortExpression="email">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="tell" HeaderText="تلفن" SortExpression="tell">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="group" HeaderText="برای کدام گروه" SortExpression="group">
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="cuase" HeaderText="متن پیام" SortExpression="cuase">
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:CheckBoxField DataField="flag" HeaderText="flag" SortExpression="flag" Visible="False" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="Button315" runat="server" OnCommand="ShowMSG" CommandArgument='<%# Eval("id","{0}") %>'
                                    Style="font-family: Tahoma; font-size: 11px" Text="مشاهده" />
                                <asp:ImageButton ID="ImageButton2" runat="server" OnCommand="DeleteContact" OnClientClick="return confirm('آیا از حذف این پیام مطئن هستید؟');"
                                    CommandArgument='<%# Eval("id","{0}") %>' 
                                    ImageUrl="~/Management/Content/Images/close.jpg" />
                            </ItemTemplate>
                            <ItemStyle Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" BackColor='<%# CheckColorPanel(Databinder.Eval(Container.DataItem,"flag")) %>'
                                    Style="color: white; padding: 2px;" 
                                    Text='<%# Check(Databinder.Eval(Container.DataItem,"flag")) %>' />
                            </ItemTemplate>
                            <ItemStyle Width="80px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ت - ز" SortExpression="Date">
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("Time") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Date") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        پیامی برای مشاهده وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="color: #009933">
                پیام های بررسی شده
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;<asp:ObjectDataSource ID="ODS_Ok" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_CMS_ContactTableAdapters.CMS_Contact_OkTableAdapter">
                    <InsertParameters>
                        <asp:Parameter Name="FnLn" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="tell" Type="String" />
                        <asp:Parameter Name="group" Type="String" />
                        <asp:Parameter Name="cuase" Type="String" />
                        <asp:Parameter Name="flag" Type="Boolean" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                تاریخ:
                <asp:Label ID="lblDate" runat="server" style="font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                زمان:
                <asp:Label ID="lblTime" runat="server" style="font-weight: 700"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
