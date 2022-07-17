<%@ Page Language="VB" MasterPageFile="~/Management/Admin/Shaahr/CMS.master" AutoEventWireup="false"
    CodeFile="DetailShaahr.aspx.vb" Inherits="Management_Admin_Shaahr_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        @font-face
        {
            font-family: koodak;
            src: url(                    "../../content/font/W_koodak.TTF" );
        }
    </style>
    <style type="text/css">
        .style15
        {
            height: 28px;
        }
        .style16
        {
            color: #CC0000;
        }
        .style17
        {
            width: 86px;
        }
        .style19
        {
            width: 119px;
            font-weight: bold;
        }
        .style20
        {
            height: 39px;
        }
        .style21
        {
            height: 32px;
        }
        .style22
        {
            height: 31px;
        }
        .style23
        {
            height: 30px;
        }
        .style24
        {
            height: 27px;
        }
        .style25
        {
            width: 73px;
        }
        .style3
        {
            width: 81px;
        }
        .style4
        {
            width: 207px;
        }
        .style5
        {
            width: 56px;
        }
        .style11
        {
            color: #FF0000;
        }
        .style6
        {
            width: 199px;
        }
        .style7
        {
            width: 79px;
        }
        .style10
        {
            width: 161px;
        }
        .style9
        {
            width: 88px;
        }
        .style26
        {
            height: 29px;
        }
        .style27
        {
            color: #FFFFFF;
            font-weight: bold;
        }
        .style28
        {
            width: 103px;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td class="style15">
                <asp:Label ID="lblNameSHaahr" Style="font-family: Koodak; font-size: 30px; color: #003300;"
                    runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: left">
                <asp:Button ID="Button9" runat="server" BackColor="Red" ForeColor="White" Style="font-family: Tahoma;
                    font-size: 20px; margin-bottom: 0px" Text="حذف کامل شهر" />
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style28">
                            رتبه شهری:
                        </td>
                        <td>
                            &nbsp;
                            <asp:Label ID="lblRank" runat="server" style="font-weight: 700; color: #FF0000"></asp:Label>
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
            <td class="style24" style="background-color: #99CC00">
                <b>مشخصات اصلی&nbsp;</b>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DgShaahr" runat="server" AutoGenerateColumns="False" BackColor="White"
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ID"
                    DataSourceID="SDS_ShaahrByID" GridLines="Vertical">
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <RowStyle ForeColor="#000066" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="CodeState" HeaderText="کد استان" SortExpression="CodeState">
                            <ItemStyle BackColor="#FF9966" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CodeCategory" HeaderText="کد زیر گروه" SortExpression="CodeCategory">
                            <ItemStyle BackColor="#FF6666" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Name" HeaderText="نام شهر" SortExpression="Name" />
                        <asp:BoundField DataField="CuaseFundation" HeaderText="دلیل تاسیس" SortExpression="CuaseFundation" />
                        <asp:TemplateField HeaderText="شهردار" SortExpression="Funder">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Funder") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <table class="style1">
                                    <tr>
                                        <td class="style13">
                                            <asp:Image ID="Image1" ImageUrl='<%# GetAvatar(DataBinder.Eval(Container.DataItem,"funder")) %>'
                                                runat="server" Height="70px" Width="70px" />
                                        </td>
                                        <td>
                                            <table class="style1">
                                                <tr>
                                                    <td class="style14">
                                                        نام:
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label2" runat="server" Style="font-weight: 700; color: #CC0066;" Text='<%# GetFN(DataBinder.Eval(Container.DataItem,"funder")) %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style14">
                                                        ایمیل:
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Funder") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:Button ID="Button1" runat="server" Style="font-family: Tahoma; font-size: 10px"
                                                Text="پروفایل" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="EnableGovernor" HeaderText="EnableGovernor" SortExpression="EnableGovernor"
                            Visible="False" />
                        <asp:BoundField DataField="CuaseGovernor" HeaderText="CuaseGovernor" SortExpression="CuaseGovernor"
                            Visible="False" />
                        <asp:BoundField DataField="EnablePresedentNazmie" HeaderText="EnablePresedentNazmie"
                            SortExpression="EnablePresedentNazmie" Visible="False" />
                        <asp:BoundField DataField="Time" HeaderText="زمان تاسیس" SortExpression="Time" />
                        <asp:BoundField DataField="Date" HeaderText="تاریخ تاسیس" SortExpression="Date" />
                        <asp:BoundField DataField="CodePeygiriJiring" HeaderText="کدجیرینگ-پیگیری" SortExpression="CodePeygiriJiring">
                            <ItemStyle BackColor="#FFFF99" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="تعلیق/عدم تعلیق" SortExpression="Suspention">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# iif(Eval("Suspention","{0}")=True,"تعلیق","فعال") %>'
                                    Style="font-weight: 700; font-size: medium">
                                </asp:Label>
                                <br />
                                <br />
                                <asp:Button ID="Button7" runat="server" OnCommand="Suspention_Yes" CommandArgument='<%# Eval("id","{0}") %>'
                                    Style="font-family: Tahoma; font-size: 10px" Text="تعلیق" />
                                <asp:Button ID="Button8" runat="server" OnCommand="Suspention_No" CommandArgument='<%# Eval("id","{0}") %>'
                                    Style="font-family: Tahoma; font-size: 10px" Text="رفع تعلیق" />
                            </ItemTemplate>
                            <ItemStyle BackColor="#CCCCCC" />
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" EditText="ویرایش" />
                    </Columns>
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:Button ID="Button6" runat="server" Style="font-family: Tahoma; font-size: 13px"
                    Text="ارسال پیام به شهردار" />
                <asp:SqlDataSource ID="SDS_ShaahrByID" runat="server" ConnectionString="<%$ ConnectionStrings:shaahrConnectionString %>"
                    SelectCommand="SELECT * FROM [tbl_Shaahr_Request_FundationShaahr] WHERE ([ID] = @ID)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ID" QueryStringField="id" Type="Int64" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style21" style="background-color: #999999">
                <b>تاییدیه ها</b>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_StateShaahrs" runat="server" AutoGenerateColumns="False" BackColor="White"
                    BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="ODS_shaahrByID">
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:BoundField DataField="CodeState" HeaderText="CodeState" SortExpression="CodeState"
                            Visible="False" />
                        <asp:BoundField DataField="CodeCategory" HeaderText="CodeCategory" SortExpression="CodeCategory"
                            Visible="False" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" Visible="False" />
                        <asp:BoundField DataField="CuaseFundation" HeaderText="CuaseFundation" SortExpression="CuaseFundation"
                            Visible="False" />
                        <asp:BoundField DataField="Funder" HeaderText="Funder" SortExpression="Funder" Visible="False" />
                        <asp:TemplateField HeaderText="تایید/عدم تایید شهردار" SortExpression="EnableGovernor">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# GetType_(DataBinder.Eval(Container.DataItem,"EnableGovernor")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CuaseGovernor" HeaderText="علت عدم تایید شهردار" SortExpression="CuaseGovernor" />
                        <asp:TemplateField HeaderText="تایید/عدو تیید نظمیه رئیس جمهور" SortExpression="EnablePresedentNazmie">
                            <ItemTemplate>
                                <asp:Label ID="Label21" runat="server" Text='<%# GetType_(DataBinder.Eval(Container.DataItem,"EnablePresedentNazmie")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" Visible="False" />
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" Visible="False" />
                        <asp:BoundField DataField="CodePeygiriJiring" HeaderText="CodePeygiriJiring" SortExpression="CodePeygiriJiring"
                            Visible="False" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="Button2" runat="server" OnCommand="Req_Governor_YES" CommandArgument='<%# Eval("id","{0}") %>'
                                    BorderColor="#009933" Style="font-family: Tahoma; font-size: 10px" Text="تایید شهرداری" />
                                <asp:Button ID="Button3" OnCommand="Req_Governor_NO" CommandArgument='<%# Eval("id","{0}") %>'
                                    runat="server" BorderColor="Red" Height="20px" Style="font-family: Tahoma; font-size: 10px"
                                    Text="رد شهرداری" Width="46px" />
                                <br />
                                <asp:Button ID="Button4" OnCommand="Req_Presedent_YES" CommandArgument='<%# Eval("id","{0}") %>'
                                    runat="server" BorderColor="#009933" Style="font-family: Tahoma; font-size: 10px"
                                    Text="تایید رئیس جمهوری" />
                                <asp:Button ID="Button5" runat="server" OnCommand="Req_Presedent_NO" CommandArgument='<%# Eval("id","{0}") %>'
                                    BorderColor="Red" Style="font-family: Tahoma; font-size: 10px" Text="رد رئیس جمهوری" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_shaahrByID" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_CMS_Shaahr_ManagementTableAdapters.Shaahrs_ByIDTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int64" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CodeState" Type="String" />
                        <asp:Parameter Name="CodeCategory" Type="Int64" />
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="CuaseFundation" Type="String" />
                        <asp:Parameter Name="Funder" Type="String" />
                        <asp:Parameter Name="EnableGovernor" Type="String" />
                        <asp:Parameter Name="CuaseGovernor" Type="String" />
                        <asp:Parameter Name="EnablePresedentNazmie" Type="String" />
                        <asp:Parameter Name="Time" Type="String" />
                        <asp:Parameter Name="_Date" Type="String" />
                        <asp:Parameter Name="CodePeygiriJiring" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td class="style16">
                *** نکته : موقعی شهر فعال است 1: معلق نبوده 2:هم تایید نظمیه ریاست جمهوری و هم تاییدیه
                شهرداری مربوطه را داشته باشد.
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style23" style="background-color: #FF6699">
                <b>مسئولین شهر</b>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style16">
                    <tr>
                        <td class="style19">
                            <table class="style16">
                                <tr>
                                    <td class="style20">
                                        <asp:Image ID="imgMayor" runat="server" Height="100px" Style="-moz-border-radius: 5px"
                                            Width="100px" />
                                    </td>
                                    <td>
                                        <div style="height: 100px;">
                                            <table class="style16">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblNameMayor" runat="server" Style="font-weight: 700"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style22">
                                                        شهردار
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table class="style16">
                                <tr>
                                    <td>
                                        <table class="style16">
                                            <tr>
                                                <td class="style21">
                                                    <asp:Image ID="imgAssist_1" runat="server" Height="45px" Style="-moz-border-radius: 5px"
                                                        Width="45px" />
                                                </td>
                                                <td>
                                                    <table class="style16">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblNameAs1" runat="server" Style="font-weight: 700"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style22">
                                                                معاون اول
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table class="style16">
                                            <tr>
                                                <td class="style21">
                                                    <asp:Image ID="imgAssist_2" runat="server" Height="45px" Style="-moz-border-radius: 5px"
                                                        Width="45px" />
                                                </td>
                                                <td>
                                                    <table class="style16">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblNameAs2" runat="server" Style="font-weight: 700"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style22">
                                                                معاون دوم
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <b>انتخاب</b>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style25">
                            معاون اول:
                        </td>
                        <td>
                            <asp:TextBox ID="txtUser1" runat="server" Width="200px" Style="font-family: Tahoma;
                                font-size: 11px; text-align: left;"></asp:TextBox>
                            <asp:ImageButton ID="btnUser1" runat="server" ImageUrl="~/Content/images/Home/addWork.png" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style25">
                            معاون دوم:
                        </td>
                        <td>
                            <asp:TextBox ID="txtUser2" runat="server" Width="200px" Style="font-family: Tahoma;
                                font-size: 11px; text-align: left;"></asp:TextBox>
                            <asp:ImageButton ID="btnUser2" runat="server" ImageUrl="~/Content/images/Home/addWork.png" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style25">
                            &nbsp;
                        </td>
                        <td>
                            برای حذف معاونی اگر فیلد خالی باشد و دگمه زده شود، آن معاون حذف می شود.
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
            <td class="style22" style="background-color: #99FFCC">
                <b>شهروندان </b>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style17">
                            تعداد شهروندان:
                        </td>
                        <td>
                            &nbsp;
                            <asp:Label ID="lblCountShaahrUsers" runat="server" Style="font-weight: 700; font-size: x-large"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_ShaahrUser" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px"
                    CellPadding="4" DataSourceID="ODS_Detail_Users" GridLines="Horizontal">
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" Visible="False" />
                        <asp:TemplateField HeaderText="کاربر" SortExpression="Email">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# GetFN(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="code_shaahr" HeaderText="code_shaahr" SortExpression="code_shaahr"
                            Visible="False" />
                        <asp:CheckBoxField DataField="flag" HeaderText="فعال/غیرفعال" SortExpression="flag" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="Button10" runat="server" CommandArgument='<%# Eval("id","{0}") %>'
                                OnCommand="DeleteUser"
                                OnClientClick="return confirm('sure?');"
                                    Style="font-family: Tahoma; font-size: 11px" Text="حذف" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Detail_Users" runat="server" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_CMS_Shaahr_ManagementTableAdapters.Shaahr_Detail_ShaahrUsersTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="code_shaahr" QueryStringField="id" Type="Int64" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="code_shaahr" Type="Int64" />
                        <asp:Parameter Name="flag" Type="Boolean" />
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
            <td class="style21" style="background-color: #333399">
                <span class="style27">آمارهای بازدید</span>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style17">
                            تعداد بازدید ها:
                        </td>
                        <td>
                            <asp:Label ID="lblVisit" runat="server" Style="font-weight: 700"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style17">
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
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style26" style="background-color: #CC9900">
                <b>تنظیمات شهر</b>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="style3">
                            نام شهر:
                        </td>
                        <td>
                            <asp:TextBox ID="txtName" runat="server" Style="font-family: Tahoma; font-size: 11px;
                                padding: 5px;" Width="600px" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            توضیح کوتاه:
                        </td>
                        <td>
                            <asp:TextBox ID="txtSubName" runat="server" Style="font-family: Tahoma; font-size: 11px;
                                padding: 5px; color: #FFFFFF;" Width="600px"></asp:TextBox>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                        </td>
                        <td>
                            <div style="background-color: #F8F8F8; width: 614px;">
                                <asp:RadioButtonList ID="rbFormat" runat="server" AutoPostBack="True" RepeatDirection="Horizontal"
                                    ValidationGroup="3">
                                    <asp:ListItem Selected="True" Value="rtl">قالب فارسی</asp:ListItem>
                                    <asp:ListItem Value="ltr">English Format</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                        </td>
                        <td>
                            <div style="border-bottom: 1px solid #ccc; width: 604px; background-color: #f8f8f8;
                                text-align: left; padding: 5px;">
                                <asp:LinkButton ID="btnUpdateSubName" runat="server" Style="color: #587E8B; text-decoration: none;">ثبت 
                                اطلاعات</asp:LinkButton>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            لوگو:
                        </td>
                        <td>
                            <table class="style1">
                                <tr>
                                    <td class="style4">
                                        <asp:FileUpload ID="FU_Logo" runat="server" />
                                    </td>
                                    <td class="style5">
                                        <asp:ImageButton ID="btnLogo" runat="server" ImageUrl="~/Content/images/Home/UploadPhoto.jpg" />
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="btnDefaultLogo" runat="server" Font-Underline="False">(انتخاب 
                                        تصویر پیش فرض)</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                        </td>
                        <td>
                            <div style="background-color: #F8F8F8; width: 614px;">
                                <asp:RadioButtonList ID="rbLogoAlign" runat="server" AutoPostBack="True" RepeatDirection="Horizontal"
                                    ValidationGroup="2">
                                    <asp:ListItem Selected="True" Value="0">سمت راست</asp:ListItem>
                                    <asp:ListItem Value="1">وسط</asp:ListItem>
                                    <asp:ListItem Value="2">سمت چپ</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                        </td>
                        <td>
                            <span class="style11">نکته: حداکثر حجم تصویر لوگو 30 کیلوبایت می باشد.</span><br
                                class="style11" />
                            <span class="style11">نکته: ابعاد تصویر : طول بین 50 پیکسل و&nbsp; 108 پیکسل - ارتفاع
                                بین 50&nbsp; پیکسل و 108 پیکسل</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td>
                            <asp:Image ID="imgLogo" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td>
                            <asp:Label ID="lblCheck_Logo" runat="server" Style="color: #FF0000; direction: ltr;"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            تصویر پیشانی:
                        </td>
                        <td>
                            <table class="style1">
                                <tr>
                                    <td class="style6">
                                        <asp:FileUpload ID="FU_Header" runat="server" />
                                    </td>
                                    <td class="style7">
                                        <asp:ImageButton ID="btnHeader" runat="server" ImageUrl="~/Content/images/Home/UploadPhoto.jpg" />
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="btnDefaultHeader" runat="server" Font-Underline="False">(انتخاب 
                                        تصویر پیش فرض)</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td>
                            <span class="style11">نکته: حداکثر حجم تصویر لوگو 130 کیلوبایت می باشد.</span><br
                                class="style11" />
                            <span class="style11">نکته: ابعاد تصویر : طول بین 892 پیکسل و&nbsp;&nbsp; 906 پیکسل
                                - ارتفاع بین&nbsp; 68&nbsp; پیکسل و&nbsp; 223 پیکسل</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td>
                            <asp:Image ID="imgHeader" runat="server" Width="645px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td>
                            <asp:Label ID="lblCheck_Header" runat="server" Style="color: #FF0000"></asp:Label>
                        </td>
                    </tr>
                    &nbsp;<tr>
                        <td class="style3">
                            کادر تبلیغاتی:
                        </td>
                        <td>
                            <table class="style1">
                                <tr>
                                    <td class="style10">
                                        <asp:FileUpload ID="FU_Ads" runat="server" />
                                    </td>
                                    <td class="style9">
                                        <asp:ImageButton ID="btnAds" runat="server" ImageUrl="~/Content/images/Home/UploadPhoto.jpg" />
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="btnDefaultAds" runat="server" Font-Underline="False">(انتخاب 
                                        تصویر پیش فرض)</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td>
                            <span class="style11">نکته: حداکثر حجم تصویر لوگو 30 کیلوبایت می باشد.</span><br
                                class="style11" />
                            <span class="style11">نکته: ابعاد تصویر : طول بین&nbsp; 742 پیکسل و&nbsp;740 پیکسل -
                                ارتفاع بین&nbsp; 62&nbsp; پیکسل و&nbsp; 68 پیکسل</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td>
                            <asp:Image ID="imgAds" runat="server" Height="60px" Width="645px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;
                        </td>
                        <td>
                            <asp:Label ID="lblCheck_Ads" runat="server" Style="color: #FF0000"></asp:Label>
                        </td>
                    </tr>
            </td>
        </tr>
        <tr>
            <td class="style3">
            </td>
        </tr>
    </table>
    </td> </tr>
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
        <td class="style21" style="background-color: #CCCCFF">
            <b>اخبار</b>
        </td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="DG_NEWS" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84"
                BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2"
                DataSourceID="ODS_Detail_ShaahrNews">
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                        SortExpression="ID" Visible="False" />
                    <asp:BoundField DataField="CodeShaahr" HeaderText="CodeShaahr" SortExpression="CodeShaahr"
                        Visible="False" />
                    <asp:BoundField DataField="Subject" HeaderText="موضوع" SortExpression="Subject" />
                    <asp:BoundField DataField="text" HeaderText="متن" SortExpression="text" />
                    <asp:TemplateField HeaderText="گذارنده" SortExpression="email">
                        <ItemTemplate>
                            <asp:Label ID="Label21" runat="server" Style="font-weight: 700" Text='<%# GetFN(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="visit" HeaderText="تعداد بازدید" SortExpression="visit" />
                    <asp:CheckBoxField DataField="flag" SortExpression="flag" />
                    <asp:TemplateField HeaderText="time" SortExpression="time" Visible="False">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("time") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField SortExpression="date">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("date") %>'></asp:Label>
                            <br />
                            <asp:Label ID="Label1" runat="server" Style="font-weight: 700" Text='<%# Bind("time") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" OnClientClick="return confirm('sure?');"
                                CommandArgument='<%# Eval("id","{0}") %>' ImageUrl="~\content/images/Stage/Jiring/remove.png"
                                OnCommand="DeleteNews" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <asp:ObjectDataSource ID="ODS_Detail_ShaahrNews" runat="server" InsertMethod="Insert"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_CMS_Shaahr_ManagementTableAdapters.Shaahr_Detail_ShaahrNewsTableAdapter">
                <SelectParameters>
                    <asp:QueryStringParameter Name="codeshaahr" QueryStringField="id" Type="Int64" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="CodeShaahr" Type="Int64" />
                    <asp:Parameter Name="Subject" Type="String" />
                    <asp:Parameter Name="text" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="visit" Type="Int64" />
                    <asp:Parameter Name="flag" Type="Boolean" />
                    <asp:Parameter Name="time" Type="String" />
                    <asp:Parameter Name="_date" Type="String" />
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
        <td class="style20" style="background-color: #CCFFFF">
            <b>پست ها</b>
        </td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="DgCategory" runat="server" AutoGenerateColumns="False" DataKeyNames="Code"
                DataSourceID="SDS_Cat" CellPadding="4" ForeColor="#333333" GridLines="None">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="Code" HeaderText="Code" InsertVisible="False" ReadOnly="True"
                        SortExpression="Code" Visible="False" />
                    <asp:BoundField DataField="CodeShaahr" HeaderText="CodeShaahr" SortExpression="CodeShaahr"
                        Visible="False" />
                    <asp:TemplateField SortExpression="Subject" HeaderText="عنوان و توضیحات">
                        <EditItemTemplate>
                            <table class="style1">
                                <tr>
                                    <td class="style4">
                                        عنوان طبقه:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox4" runat="server" Style="font-family: Tahoma; font-size: 11px;"
                                            Text='<%# Bind("Subject") %>' Width="500px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style4">
                                        توضیحات:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox3" runat="server" Style="font-family: Tahoma; font-size: 11px;"
                                            Text='<%# Bind("Detail") %>' Width="500px" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <table class="style1">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label22" runat="server" Style="font-weight: 700" Text='<%# Bind("Subject") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label23" runat="server" Style="font-size: 10px" Text='<%# Bind("Detail") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <HeaderStyle Width="567px" HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Detail" SortExpression="Detail" Visible="False">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Detail") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CheckBoxField DataField="Luck" HeaderText="باز / بسته" SortExpression="Luck">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:CheckBoxField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                                Text="تایید"></asp:LinkButton>
                            /
                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                Text="لغو"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton11" runat="server" ImageUrl="~/Content/images/Shaahrs/Root/edit.png"
                                CommandName="Edit" />
                        </ItemTemplate>
                        <ControlStyle Font-Underline="False" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton41" runat="server" OnClientClick="return confirm('sure?');"
                                CommandArgument='<%# Eval("code","{0}") %>' ImageUrl="~\content/images/Stage/Jiring/remove.png"
                                OnCommand="DeleteCateogry" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <EmptyDataTemplate>
                    طبقه ای وجود ندارد.
                </EmptyDataTemplate>
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#929DA3" />
                <HeaderStyle BackColor="#DEDEDE" BorderColor="#cccccc" BorderStyle="Solid" BorderWidth="1px"
                    Font-Bold="false" ForeColor="#567D8C" />
                <EditRowStyle BackColor="#D9E4E8" />
                <AlternatingRowStyle BackColor="#E6E6E6" ForeColor="#284775" />
            </asp:GridView>
            <asp:SqlDataSource ID="SDS_Cat" runat="server" ConnectionString="<%$ ConnectionStrings:shaahrConnectionString %>"
                SelectCommand="SELECT * FROM [tbl_Shaahr_ShaahrCategoryPost] WHERE ([CodeShaahr] = @CodeShaahr) ORDER BY [Code] DESC"
                UpdateCommand="UPDATE tbl_Shaahr_ShaahrCategoryPost SET Subject = @Subject, Detail = @Detail, Luck = @Luck WHERE (Code = @code)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="CodeShaahr" QueryStringField="id" Type="Int64" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Subject" />
                    <asp:Parameter Name="Detail" />
                    <asp:Parameter Name="Luck" />
                    <asp:Parameter Name="code" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td>
            <asp:DropDownList Style="padding: 5px; width: 680px; font-family: Tahoma; font-size: 11px;"
                ID="cmbCat" runat="server" AutoPostBack="True" DataSourceID="SDS_Cat" DataTextField="Subject"
                DataValueField="Code">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="Dg_Post" runat="server" AutoGenerateColumns="False" DataKeyNames="Code"
                DataSourceID="SDS_Posts" CellPadding="4" ForeColor="#333333" GridLines="None"
                AllowPaging="True" PageSize="25">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Code" HeaderText="Code" InsertVisible="False" ReadOnly="True"
                        SortExpression="Code" Visible="False" />
                    <asp:BoundField DataField="CodeCategory" HeaderText="CodeCategory" SortExpression="CodeCategory"
                        Visible="False" />
                    <asp:TemplateField HeaderText="عنوان پست" SortExpression="Subject">
                        <ItemTemplate>
                            <asp:Label ID="Label24" runat="server" Text='<%# Bind("Subject") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Right" Width="380px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Text" SortExpression="Text" Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="Label25" runat="server" Text='<%# Bind("Text") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" Visible="False" />
                    <asp:TemplateField HeaderText="بازدید" SortExpression="Visit">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Visit") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField SortExpression="Time">
                        <ItemTemplate>
                            <asp:Label ID="Label26" runat="server" Text='<%# Bind("Time") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField SortExpression="date">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("date") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="باز / بسته" SortExpression="Luck">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Luck") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("Luck") %>' Enabled="false" />
                        </ItemTemplate>
                        <HeaderStyle Font-Size="11px" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="True" CommandName="Update"
                                Text="تایید"></asp:LinkButton>
                            &nbsp;/&nbsp;<asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text="لغو"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton112" runat="server" CommandName="Edit" ImageUrl="~/Content/images/Shaahrs/Root/edit.png" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton14" runat="server" OnClientClick="return confirm('sure?');"
                                CommandArgument='<%# Eval("code","{0}") %>' ImageUrl="~\content/images/Stage/Jiring/remove.png"
                                OnCommand="DeletePost" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" OnCommand="ShowPost" CommandArgument='<%# Eval("code","{0}") %>'
                                Text="مشاهده"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField></asp:TemplateField>
                </Columns>
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#929DA3" />
                <HeaderStyle BackColor="#DEDEDE" BorderColor="#cccccc" BorderStyle="Solid" BorderWidth="1px"
                    Font-Bold="false" ForeColor="#567D8C" />
                <EditRowStyle BackColor="#D9E4E8" />
                <AlternatingRowStyle BackColor="#E6E6E6" ForeColor="#284775" />
            </asp:GridView>
            <asp:SqlDataSource ID="SDS_Posts" runat="server" ConnectionString="<%$ ConnectionStrings:shaahrConnectionString %>"
                SelectCommand="SELECT * FROM [tbl_Shaahr_ShaahrPost] WHERE ([CodeCategory] = @CodeCategory) ORDER BY [Code] DESC"
                UpdateCommand="UPDATE tbl_Shaahr_ShaahrPost SET Luck = @luck WHERE (Code = @code)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="cmbCat" Name="CodeCategory" PropertyName="SelectedValue"
                        Type="Int64" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="luck" />
                    <asp:Parameter Name="code" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="DG_AnswerPost" runat="server" AutoGenerateColumns="False" CellPadding="4"
                DataSourceID="ODS_Detail_ShaahrAnswerPost" ForeColor="#333333" GridLines="None">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                        SortExpression="ID" Visible="False" />
                    <asp:BoundField DataField="CodePost" HeaderText="CodePost" SortExpression="CodePost"
                        Visible="False" />
                    <asp:BoundField DataField="Subject" HeaderText="عنوان" SortExpression="Subject" />
                    <asp:BoundField DataField="text" HeaderText="متن" SortExpression="text" />
                    <asp:TemplateField HeaderText="گذارنده" SortExpression="email">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# GetFN(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField SortExpression="date">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("date") %>'></asp:Label><br />
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("time") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton14" runat="server" OnClientClick="return confirm('sure?');"
                                CommandArgument='<%# Eval("id","{0}") %>' ImageUrl="~\content/images/Stage/Jiring/remove.png"
                                OnCommand="DeleteAnswerPost" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
            <asp:ObjectDataSource ID="ODS_Detail_ShaahrAnswerPost" runat="server" InsertMethod="Insert"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_CMS_Shaahr_ManagementTableAdapters.Shaahr_Detail_ShaahrAnswerPostTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Dg_Post" Name="codepost" PropertyName="SelectedValue"
                        Type="Int64" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="CodePost" Type="Int64" />
                    <asp:Parameter Name="Subject" Type="String" />
                    <asp:Parameter Name="text" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="time" Type="String" />
                    <asp:Parameter Name="_date" Type="String" />
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
