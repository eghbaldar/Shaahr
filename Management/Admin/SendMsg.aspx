<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="SendMsg.aspx.vb" Inherits="Management_Admin_SendMsg" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">

        .style13
        {
            width: 70px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <b>ارسال پیام</b></td>
        </tr>
        <tr>
            <td>
    <table class="style1">
        <tr>
            <td class="style13">
                ارسال برای:
            </td>
            <td>
                <asp:Label ID="lblTo" runat="server" Style="color: #006600; font-size: 15px; font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style13">
                &nbsp;
            </td>
            <td>
                <asp:Image ID="imgAvatar" runat="server" Height="50px" Width="50px" />
            </td>
        </tr>
        <tr>
            <td class="style13">
                موضوع: پیام:
            </td>
            <td>
                <asp:TextBox ID="txtSubject" runat="server" Style="font-family: Tahoma; font-size: 11px"
                    Width="382px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSubject"
                    ErrorMessage="*" ValidationGroup="3"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style13">
                متن پیام:
            </td>
            <td>
                <asp:TextBox ID="txtMSG" runat="server" Height="273px" Style="font-family: Tahoma;
                    font-size: 11px" TextMode="MultiLine" Width="723px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMSG"
                    ErrorMessage="*" ValidationGroup="3"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style13">
                &nbsp;
            </td>
            <td>
                <asp:Button ID="btnSend" runat="server" Style="font-family: Tahoma; font-size: 11px"
                    Text="ارسال" ValidationGroup="3" />
                <asp:Label ID="lbl" runat="server" Style="color: #FF0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style13">
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
            <td>
                <b>لیست پیام های ارسالی برای این کاربر</b></td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataSourceID="ODS" ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="subject" HeaderText="موضوع" 
                            SortExpression="subject" />
                        <asp:BoundField DataField="message" HeaderText="پیام" 
                            SortExpression="message" />
                        <asp:BoundField DataField="date" HeaderText="تاریخ" SortExpression="date" />
                        <asp:BoundField DataField="time" HeaderText="زمان" SortExpression="time" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" 
                                OnClientClick="return confirm('آیا از حذف این پیام مطمئن هستید؟');"
                                OnCommand="DeleteMSG"
                                CommandArgument='<%# Eval("id","{0}") %>'
                                    ImageUrl="~/Content/images/Home/deleteWork.jpg" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        پیامی برای نمایش وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS" runat="server" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="DS_CMS_UserManagementTableAdapters.Profile_InboxSystemTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="email" QueryStringField="email" Type="String" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="time" Type="String" />
                        <asp:Parameter Name="subject" Type="String" />
                        <asp:Parameter Name="message" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
