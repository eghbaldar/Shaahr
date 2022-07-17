<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="DetailPolling.aspx.vb" Inherits="Management_Admin_DetailPolling" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style13
        {
            height: 49px;
        }
        .style14
        {
            color: #FF0000;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td class="style13">
                                                <asp:Label ID="lblCountAllVoter" runat="server" 
                    style="font-size: x-large"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <b>نتیجه:</b>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ObjectDataSource ID="ODS_Vote" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" 
                    TypeName="DS_CMS_Character3TableAdapters.CMS_Character3_UsersPollingTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="codepoll" QueryStringField="CodePolling" Type="Int64" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:GridView ID="DG_Vote" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_Vote"
                    GridLines="None" ShowHeader="False" Width="530px">
                    <Columns>
                        <asp:TemplateField HeaderText="Column1" SortExpression="Column1">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%#  Perect(DataBinder.Eval(Container.DataItem,"Column1"),DataBinder.Eval(Container.DataItem,"option")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="option" SortExpression="option" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("option") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <b>کاربران شرکت کرده:</b>&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:ObjectDataSource ID="ODS_Voter" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_CMS_Character3TableAdapters.VotersPollingTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="codepoll" QueryStringField="CodePolling" Type="Int64" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                    BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4"
                    DataSourceID="ODS_Voter" GridLines="Horizontal">
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="Column1" HeaderText="نام و نام خانوادگی رای دهنده" ReadOnly="True"
                            SortExpression="Column1" />
                        <asp:BoundField DataField="option" HeaderText="گزینه انتخاب شده" SortExpression="option" />
                        <asp:BoundField DataField="codeoption" HeaderText="کد گزینه انتخاب شده" SortExpression="codeoption" />
                        <asp:BoundField DataField="codepoll" HeaderText="کد نظرسنجی" SortExpression="codepoll" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" OnCommand="GotoToUser" CommandArgument='<%# Eval("email","{0}") %>'
                                    Style="font-size: 10px; font-family: Tahoma" Text="جزییات کاربر" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        رای ای ثبت نشده است.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style14">
                نظرسنجی:</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" DataKeyNames="Code" DataSourceID="SDS_Polling" 
                    GridLines="Vertical">
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <Columns>
                        <asp:CommandField EditText="ویرایش" ShowEditButton="True" />
                        <asp:BoundField DataField="Code" HeaderText="Code" InsertVisible="False" 
                            ReadOnly="True" SortExpression="Code" Visible="False" />
                        <asp:BoundField DataField="title" HeaderText="عنوان" SortExpression="title" />
                        <asp:BoundField DataField="detail" HeaderText="توضیح" SortExpression="detail" />
                        <asp:BoundField DataField="date" HeaderText="تاریخ" SortExpression="date" />
                        <asp:BoundField DataField="time" HeaderText="زمان" SortExpression="time" />
                    </Columns>
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                </asp:GridView>
                <asp:SqlDataSource ID="SDS_Polling" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:shaahrConnectionString %>" 
                    SelectCommand="SELECT * FROM [tbl_CMS_Character3_Polling] WHERE ([Code] = @Code)" 
                    UpdateCommand="UPDATE tbl_CMS_Character3_Polling SET title = @title, detail = @detail WHERE (Code = @code)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Code" QueryStringField="CodePolling" 
                            Type="Int64" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="title" />
                        <asp:Parameter Name="detail" />
                        <asp:Parameter Name="code" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style14">
                گزینه های نظرسنجی:</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
                    CellPadding="3" CellSpacing="1" DataKeyNames="Code" 
                    DataSourceID="SDS_OptionPolling" GridLines="None">
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                    <Columns>
                        <asp:CommandField EditText="ویرایش" ShowEditButton="True" />
                        <asp:BoundField DataField="Code" HeaderText="Code" InsertVisible="False" 
                            ReadOnly="True" SortExpression="Code" Visible="False" />
                        <asp:BoundField DataField="CodePoll" HeaderText="CodePoll" 
                            SortExpression="CodePoll" Visible="False" />
                        <asp:BoundField DataField="Option" HeaderText="گزینه" SortExpression="Option" />
                    </Columns>
                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                </asp:GridView>
                <asp:SqlDataSource ID="SDS_OptionPolling" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:shaahrConnectionString %>" 
                    SelectCommand="SELECT * FROM [tbl_CMS_Character3_PollingOption] WHERE ([CodePoll] = @CodePoll)" 
                    UpdateCommand="UPDATE tbl_CMS_Character3_PollingOption SET [Option] = @option WHERE (Code = @code)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="CodePoll" QueryStringField="CodePolling" 
                            Type="Int64" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="option" />
                        <asp:Parameter Name="code" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
