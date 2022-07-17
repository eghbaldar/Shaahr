<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="forget.aspx.vb" Inherits="Management_forget" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style13
        {
            color: #CC0000;
        }
        .style14
        {
            color: #0000FF;
        }
        .style15
        {
            color: #0033CC;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <b>لیست کاربرانی که نمی توانند وارد پروفایلشان بشوند.(پروفایلشان قفل است)</b>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style14">
                لیست کسانی که سومین را برای ورورد انتخاب کردند ( کاربرانی که &quot;تایید همشهری&quot;&nbsp;
                برایشان فعال است)
            </td>
        </tr>
        <tr>
            <td style="color: #CC0000">
                **** برای فعال کردن »» 1: اگر کاربر پروفایل کاربر بسته است او را از باز میکنید&nbsp;&nbsp;
                2: تایید همشهری او را نیز غیرفعال میکنید<br />
                البته اینها منوط به این است که به قطعیت رسیده باشید او همان کاربر است(با حدس هایش)
            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="SDS_ForgetCitizen" runat="server" ConnectionString="<%$ ConnectionStrings:shaahrConnectionString %>"
                    DeleteCommand="DELETE FROM tbl_CMS_NotMach_ComputerName WHERE (ID = @id)" SelectCommand="SELECT * FROM [tbl_CMS_NotMach_ComputerName] ORDER BY [ID] DESC">
                    <DeleteParameters>
                        <asp:Parameter Name="id" />
                    </DeleteParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="DG1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="SDS_ForgetCitizen" ForeColor="#333333" GridLines="None" 
                    DataKeyNames="ID">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="Email" HeaderText="پست الکترونیکی" SortExpression="Email" />
                        <asp:BoundField DataField="Hads_ComputerName" HeaderText="حدس نام سیستم" SortExpression="Hads_ComputerName" />
                        <asp:BoundField DataField="Hads_Statement" HeaderText="حدس جمله امنیتی" SortExpression="Hads_Statement" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="return confirm('sure?');"
                                    CausesValidation="False" CommandName="Delete" Text="حذف"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# GetBand(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                <asp:Button ID="Button1" runat="server" OnCommand="Band" CommandArgument='<%# Eval("email","{0}") %>'
                                    Style="font-family: Tahoma; font-size: 11px" Text="باز کردن پروفایل" />
                                <asp:Button OnCommand="Citizen" CommandArgument='<%# Eval("email","{0}") %>' ID="Button2"
                                    runat="server" Style="font-family: Tahoma; font-size: 11px" Text="غیرفعال کردن تایید همشهری" />
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
            </td>
        </tr>
        <tr>
            <td>
                <span class="style13">
                <blink>
                بعد از بررسی ، حتما رکورد بررسی شده را حذف کنید.
                </blink>
                </span>&nbsp;
            </td>
        </tr>
        <tr>
            <td>
            <hr />
                </td>
        </tr>
        <tr>
            <td class="style15">
                کاربران غیر فعال (کسانی که خودشان خودشان را غیر فعال کرده اند).</td>
        </tr>
        <tr>
            <td class="style15">
                <asp:DropDownList ID="cmbBand" runat="server" AutoPostBack="True" 
                    style="font-family: Tahoma; font-size: 12px">
                    <asp:ListItem Value="-2">قفل شدن پروفایل توسط خودشان</asp:ListItem>
                    <asp:ListItem Value="0">تعلیق یک</asp:ListItem>
                    <asp:ListItem Value="1">تعلیق دو</asp:ListItem>
                    <asp:ListItem Value="2">تعلیق سوم(اخراج)</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="4" DataKeyNames="username,Email" DataSourceID="ODS_BandWithMySelf">
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="username" HeaderText="نام کاربری" ReadOnly="True" 
                            SortExpression="username" />
                        <asp:BoundField DataField="password" HeaderText="password" 
                            SortExpression="password" Visible="False" />
                        <asp:BoundField DataField="Email" HeaderText="پست الکترونیک" ReadOnly="True" 
                            SortExpression="Email" />
                        <asp:BoundField DataField="starNum" HeaderText="starNum" 
                            SortExpression="starNum" Visible="False" />
                        <asp:BoundField DataField="IP" HeaderText="IP" SortExpression="IP" 
                            Visible="False" />
                        <asp:BoundField DataField="RegDate" HeaderText="RegDate" 
                            SortExpression="RegDate" Visible="False" />
                        <asp:CheckBoxField DataField="Band" HeaderText="Band" SortExpression="Band" 
                            Visible="False" />
                        <asp:BoundField DataField="Band_Date" HeaderText="تاریخ و نوع پسته شدن پروفایل" 
                            SortExpression="Band_Date" />
                    </Columns>
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <EmptyDataTemplate>
                        رکوردی وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_BandWithMySelf" runat="server" 
                    DeleteMethod="Delete" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="DS_CMS_ManagementTableAdapters.Users_BandTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_username" Type="String" />
                        <asp:Parameter Name="Original_Email" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="starNum" Type="Int32" />
                        <asp:Parameter Name="IP" Type="String" />
                        <asp:Parameter Name="RegDate" Type="String" />
                        <asp:Parameter Name="Band" Type="Boolean" />
                        <asp:Parameter Name="Band_Date" Type="String" />
                        <asp:Parameter Name="Original_username" Type="String" />
                        <asp:Parameter Name="Original_Email" Type="String" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cmbBand" DefaultValue="-2" Name="band_date" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="username" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="starNum" Type="Int32" />
                        <asp:Parameter Name="IP" Type="String" />
                        <asp:Parameter Name="RegDate" Type="String" />
                        <asp:Parameter Name="Band" Type="Boolean" />
                        <asp:Parameter Name="Band_Date" Type="String" />
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
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
