<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="UsersManagement.aspx.vb" Inherits="Management_Admin_UsersManagement"
    Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style13
        {
            width: 120px;
        }
        .style14
        {
            background-color: #CCFFCC;
        }
        .style15
        {
            width: 120px;
            background-color: #CCFFCC;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                لیست کاربران
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style13">
                            نام فارسی:
                        </td>
                        <td>
                            <asp:TextBox ID="txtFnF" runat="server" Style="font-family: Tahoma; font-size: 11px;
                                text-align: right" Width="199px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            نام خانوادگی فارسس:
                        </td>
                        <td>
                            <asp:TextBox ID="txtLnF" runat="server" Style="font-family: Tahoma; font-size: 11px;
                                text-align: right" Width="199px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            نام انگلیسی:
                        </td>
                        <td>
                            <asp:TextBox ID="txtFnE" runat="server" Style="font-family: Tahoma; font-size: 11px;
                                text-align: left" Width="199px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            نام خانوادگی انگلیسی:
                        </td>
                        <td>
                            <asp:TextBox ID="txtLnE" runat="server" Style="font-family: Tahoma; font-size: 11px;
                                text-align: left" Width="199px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            پست الکترونیکی:
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" Style="font-family: Tahoma; font-size: 11px;
                                text-align: left" Width="199px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style13">
                            &nbsp;
                        </td>
                        <td>
                            <asp:Button ID="btnSearchUser" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                Text="بگرد" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style15">
                            تعداد کل کاربران سایت:
                        </td>
                        <td class="style14">
                            <asp:Label ID="lblCountUsers" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_Users" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="ODS_Users" ForeColor="#333333" GridLines="None" AllowPaging="True">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField HeaderText="آواتار" SortExpression="picpath">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("picpath") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" ImageUrl='<%# "~/user/Crop.aspx?P="+ Eval("PicPath", "{0}") +"&W=60&H=60" %>'
                                    runat="server" Height="50px" Width="50px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Fn" HeaderText="نام فارسی" ReadOnly="True" SortExpression="Fn" />
                        <asp:BoundField DataField="En" HeaderText="نام انگلیسی" ReadOnly="True" SortExpression="En">
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" Style="font-family: Tahoma" OnCommand="RedirectAttrib"
                                    CommandArgument='<%# Eval("email","{0}") %>' Text="مشخصات" />
                                    
                                <asp:Button ID="Button2" runat="server" BackColor="#CC0000" BorderStyle="Ridge" ForeColor="White"
                                 CommandArgument='<%# Eval("email","{0}") %>' 
                                 OnCommand="RailUser"
                                    Style="font-family: Tahoma; font-size: 11px" Text="اخطار و محرومیبت" />
                                    
                                <asp:Button ID="Button3" runat="server" Style="font-family: Tahoma; font-size: 11px"
                                OnCommand="RedirectJiring"
                                 CommandArgument='<%# Eval("email","{0}") %>'
                                    Text=" سرویس ها - جیرینگ" />
                                    
                                <asp:Button ID="Button4" 
                                OnCommand="RedirectPost"
                                 CommandArgument='<%# Eval("email","{0}") %>'
                                runat="server" Style="font-family: Tahoma; font-size: 11px"
                                    Text="پست ها" />
                                    
                                <asp:Button ID="Button5" runat="server" 
                                OnCommand="RedirectRelationship" CommandArgument='<%# Eval("email","{0}") %>'
                                    Style="font-family: Tahoma; font-size: 11px" Text="ارتباطات" />
                                    
                                <asp:Button ID="Button6" 
                                OnCommand="RedirectAlbum" CommandArgument='<%# Eval("email","{0}") %>'
                                runat="server" Style="font-family: Tahoma; font-size: 11px"
                                    Text="آلبوم ها" />
                                    
                                <asp:ImageButton ID="ImageButton3" ImageUrl='<%# CheckOnilneImage(DataBinder.Eval(Container.DataItem,"email")) %>'
                                    runat="server" />
                                <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Management/Content/Images/mesaage.jpeg"
                                    OnCommand="SendMSG" CommandArgument='<%# Eval("email","{0}") %>' ToolTip="ارسال پیام سیستمی به کاربر" />
                                    
                                <asp:ImageButton ID="ImageButton5" runat="server" 
                                  OnCommand="GotoPremission" CommandArgument='<%# Eval("email","{0}") %>'
                                    ImageUrl="~/Management/Content/Images/premission.jpeg" />
                                    
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Users" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_CMS_UserManagementTableAdapters.Profile_UsersTableAdapter">
                    <SelectParameters>
                        <asp:Parameter Name="fn_f" Type="String" />
                        <asp:Parameter Name="Ln_f" Type="String" />
                        <asp:Parameter Name="fn_e" Type="String" />
                        <asp:Parameter Name="Ln_e" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="picpath" Type="String" />
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
