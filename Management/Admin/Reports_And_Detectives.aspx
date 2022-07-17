<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="Reports_And_Detectives.aspx.vb" Inherits="Management_Admin_Reports_And_Detectives"
    Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style13
        {
            color: #009933;
        }
        .style14
        {
            color: #FF0000;
        }
        .style15
        {
            width: 43px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <b>لیست کارگاهان (اهم از تایید شده و نشده):</b>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                بعد از تایید یا عدم تایید متن زیر برای کاربر ارسال می شود:<br />
                با عنوان های:<br />
                <span class="style13">صلاحیت شما برای پست کارگاهی تایید شده است.</span><br />
                <span class="style14">صلاحیت شما برای پست کارگاهی تایید نشده است.</span>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtMessage" runat="server" Height="155px" Style="font-family: Tahoma;
                    font-size: 11px; text-align: right" TextMode="MultiLine" Width="842px">پیام شما...</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_Detective" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="ODS_Detective" ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:TemplateField HeaderText="نام و نام خانوادگی" SortExpression="email">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# GetFnLn(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="تایید شده /تایید نشده" SortExpression="allow">
                            <ItemTemplate>
                                <asp:Panel ID="Panel1" runat="server" Style="-moz-border-radius: 3px; padding: 3px;
                                    color: White;" BackColor='<%# GetBG_Allow(DataBinder.Eval(Container.DataItem,"allow")) %>'>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Get_Allow(DataBinder.Eval(Container.DataItem,"allow")) %>'></asp:Label>
                                </asp:Panel>
                            </ItemTemplate>
                            <HeaderStyle BackColor="#009900" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="تعداد گزارشات آمده توسط این کارگاه" 
                            SortExpression="finded">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("finded") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Style="font-weight: 700; font-size: 15px" Text='<%# Bind("finded") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" OnClientClick="return confirm('مطمئن؟');"
                                    CommandArgument='<%# Eval("id","{0}") %>' OnCommand="DeleteDetective" ImageUrl="~/Content/images/Home/Delete.png" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="Button1" OnClientClick="return confirm('مطمئن؟');" CommandArgument='<%# Eval("email","{0}") %>'
                                    OnCommand="AcceptDetective" runat="server" BorderColor="#009933" BorderStyle="Solid"
                                    Style="font-family: Tahoma; font-size: 11px" Text="تایید" />
                                <asp:Button ID="Button2" OnClientClick="return confirm('مطمئن؟');" CommandArgument='<%# Eval("email","{0}") %>'
                                    OnCommand="DenyDetective" runat="server" BorderColor="Red" BorderStyle="Solid"
                                    Style="font-family: Tahoma; font-size: 11px" Text="عدم تایید" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        رکوردی موجود نیست.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Detective" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_CMS_NazmieTableAdapters.Nazmie_DetectiveTableAdapter">
                    <InsertParameters>
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="allow" Type="Boolean" />
                        <asp:Parameter Name="finded" Type="Int32" />
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
                <b>لیست گزارشات کارگاهان:</b>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style15">
                            <asp:Button ID="Button7" runat="server" BackColor="Yellow" ToolTip="تخلف نادرست است" />
                        </td>
                        <td>
                            بررسی نشده
                        </td>
                    </tr>
                    <tr>
                        <td class="style15">
                            <asp:Button ID="Button5" runat="server" BackColor="#009933" ToolTip="تخلف درست است" />
                        </td>
                        <td>
                            تخلف دست است
                        </td>
                    </tr>
                    <tr>
                        <td class="style15">
                            <asp:Button ID="Button6" runat="server" BackColor="Red" ToolTip="تخلف نادرست است" />
                        </td>
                        <td>
                            تخلف نادرست است
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp; منظور از &quot;&quot; یعنی کاربران عادی آیا می تواند در لیست تخلفات آن تخلف
                را مشاهده کنند یا خیر؟
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_ReportDetective" runat="server" AutoGenerateColumns="False"
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                    CellPadding="3" DataSourceID="ODS_Report_Detective">
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <RowStyle ForeColor="#000066" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:TemplateField HeaderText="نام و نام خانوادگی" SortExpression="email">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# GetFnLn(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="date" HeaderText="تاریخ ارسال" SortExpression="date" />
                        <asp:TemplateField HeaderText="وضعیت" SortExpression="checked">
                            <ItemTemplate>
                                <asp:Panel ID="Panel1" runat="server" Style="-moz-border-radius: 3px; padding: 3px;
                                    color: #000;" BackColor='<%# GetBG_Checked(DataBinder.Eval(Container.DataItem,"checked")) %>'>
                                    ×</asp:Panel>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="قابل نمایش برای کاربران" SortExpression="visible">
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("visible") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("visible") %>' Enabled="false" />
                                <asp:Button ID="Button9" runat="server" CommandArgument='<%# Eval("id","{0}") %>'
                                    OnCommand="EnableShow" Style="font-size: 9px; font-family: Tahoma" Text="نمایش" />
                                <asp:Button ID="Button91" runat="server" Height="19px" CommandArgument='<%# Eval("id","{0}") %>'
                                    OnCommand="DisableShow" Style="font-family: Tahoma; font-size: 9px" Text="عدم نمایش" />
                            </ItemTemplate>
                            <ItemStyle Font-Bold="False" Font-Names="Tahoma" Font-Size="5px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="cause" HeaderText="توضیح" SortExpression="cause" />
                        <asp:BoundField DataField="level" HeaderText="سطح تخلف" SortExpression="level" />
                        <asp:TemplateField HeaderText="نوع تخلف" SortExpression="CodeCrime">
                            <ItemTemplate>
                                <asp:Label ID="Label2" Style="font-weight: bold;" runat="server" Text='<%# GetSubjectCrime(DataBinder.Eval(Container.DataItem,"CodeCrime")) %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle BackColor="#FFCCFF" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="لینک تخلف" SortExpression="ViolationLink">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" Target="_blank" Style="color: Blue; text-decoration: none;"
                                    NavigateUrl='<%# Bind("ViolationLink") %>' runat="server">لینک</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="اعمال نظر">
                            <ItemTemplate>
                                <asp:Button ID="Button3" runat="server" CommandArgument='<%# Eval("id","{0}") %>'
                                    OnCommand="RightCrime" BackColor="#009933" ToolTip="تخلف درست است" />
                                <asp:Button ID="Button4" runat="server" CommandArgument='<%# Eval("id","{0}") %>'
                                    OnCommand="NotRightCrime" BackColor="Red" ToolTip="تخلف نادرست است" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="اعمال جیرینگ">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button8" runat="server" CommandArgument='<%# Eval("email","{0}") %>'
                                    OnCommand="RediretToJiring" Style="font-family: Tahoma; font-size: 9px" Text="اعمال جیرینگ" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton2" runat="server" OnClientClick="return confirm('مطمئن؟');"
                                    CommandArgument='<%# Eval("id","{0}") %>' OnCommand="DeleteReportDetective" ImageUrl="~/Content/images/Home/Delete.png" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <EmptyDataTemplate>
                        رکوردی موجود نیست.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Report_Detective" runat="server" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_CMS_NazmieTableAdapters.Nazmie_Report_DetectiveTableAdapter">
                    <InsertParameters>
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="checked" Type="Int32" />
                        <asp:Parameter Name="visible" Type="Boolean" />
                        <asp:Parameter Name="cause" Type="String" />
                        <asp:Parameter Name="level" Type="String" />
                        <asp:Parameter Name="CodeCrime" Type="Int64" />
                        <asp:Parameter Name="ViolationLink" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <blink>
                    <span style="color:Red;">
                    &nbsp;ادمین&nbsp; محترم بعد از دیدن تخلف از آن صفحه&nbsp; عکس گرفته و در جایی 
                نگهداری کنید ممکن است احتیاج شود.
                    </span>
                </blink>
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
