<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="Captcha.aspx.vb" Inherits="Management_Admin_Captcha" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style13
        {
            width: 17px;
        }
        .style14
        {
            width: 54px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <b>نمایش کپچاها</b>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style13">
                            0
                        </td>
                        <td>
                            آسان
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            1
                        </td>
                        <td>
                            متوسط
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            2
                        </td>
                        <td>
                            سخت
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="SDS_Captcha" ForeColor="#333333" GridLines="None" DataKeyNames="ID">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:TemplateField HeaderText="سطح سوال" SortExpression="Level">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Level") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Level(DataBinder.Eval(Container.DataItem,"Level")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="سوال" SortExpression="question">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("question") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("question") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" Width="500px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="answer" HeaderText="جواب" SortExpression="answer">
                            <HeaderStyle HorizontalAlign="Right" Width="200px" />
                        </asp:BoundField>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:SqlDataSource ID="SDS_Captcha" runat="server" ConnectionString="<%$ ConnectionStrings:shaahrConnectionString %>"
                    SelectCommand="SELECT * FROM [tbl_CMS_Captcha] ORDER BY [ID] DESC" DeleteCommand="delete from tbl_CMS_Captcha
where id=@id" UpdateCommand="UPDATE tbl_CMS_Captcha SET Level = @Level, question = @question, answer = @answer WHERE (ID = @id)">
                    <DeleteParameters>
                        <asp:Parameter Name="id" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Level" />
                        <asp:Parameter Name="question" />
                        <asp:Parameter Name="answer" />
                        <asp:Parameter Name="id" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <b>درج کپچای جدید</b>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style14">
                            سطح:
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbL" runat="server" Style="font-family: Tahoma">
                                <asp:ListItem Value="0">آسان</asp:ListItem>
                                <asp:ListItem Value="1">متوسط</asp:ListItem>
                                <asp:ListItem Value="2">سخت</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            سوال:
                        </td>
                        <td>
                            <asp:TextBox ID="txtQ" runat="server" Style="font-size: tahoma; font-family: Tahoma"
                                Width="400px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtQ"
                                ErrorMessage="الزامی" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            جواب:
                        </td>
                        <td>
                            <asp:TextBox ID="txtA" runat="server" Style="font-family: Tahoma" Width="400px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtA"
                                ErrorMessage="الزامی" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;
                        </td>
                        <td>
                            <asp:Button ID="btnInsert" runat="server" Style="font-family: Tahoma" Text="ارسال"
                                ValidationGroup="1" />
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
