<%@ Page Language="VB" MasterPageFile="~/Stage/Search/Home.master" AutoEventWireup="false"
    CodeFile="SearchResult.aspx.vb" Inherits="Stage_Search_SearchResult" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style7
        {
            width: 15px;
        }
        .style6
        {
            width: 548px;
        }
        .style8
        {
            width: 100%;
        }
        .style9
        {
            width: 3px;
        }
        .s1
        {
            width: 100%:;
        }
        .style10
        {
            width: 223px;
        }
        .style11
        {
            width: 1px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 729px;">
            نتیجه ی جستجو
        </div>
        <div style="padding: 2px;">
            <asp:ImageButton runat="server" ForeColor="Transparent" ImageUrl="~/Content/images/Stage/search/BackSearch.png"
                ID="btnBack" runat="server" />
        </div>
        <asp:MultiView ID="MultiView" runat="server">
            <asp:View ID="V_AllSearch" runat="server">
                <div style="padding: 3px; color: Gray;">
                    <asp:Label ID="lblAllSearch" runat="server" Text="Label"></asp:Label></div>
                <asp:ObjectDataSource ID="OSD_AllSearch" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_StageTableAdapters.Stage_SearchResultTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="text" QueryStringField="factor" Type="String" />
                        <asp:Parameter Name="index" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:GridView ID="DG" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    DataKeyNames="code" DataSourceID="OSD_AllSearch" GridLines="None" PageSize="25"
                    ShowHeader="False" Width="739px">
                    <Columns>
                        <asp:TemplateField HeaderText="code" InsertVisible="False" SortExpression="code">
                            <EditItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("code") %>'></asp:Label></EditItemTemplate>
                            <ItemTemplate>
                                <div style="background-color: #e6f0f3; -moz-border-radius: 3px; border: 1px solid #ccc;">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td class="style7">
                                                <asp:Image runat="server" ForeColor="Transparent" ID="Image1" runat="server" ImageUrl='<%# ControlImage(DataBinder.Eval(Container.DataItem,"type")) %>' />
                                            </td>
                                            <td class="style6">
                                                <asp:LinkButton ID="btnDetailPost" runat="server" CommandArgument='<%# Eval("code","{0}")+"|"+Eval("email","{0}") %>'
                                                    OnCommand="DetailPost" Style="color: #2D515D; text-decoration: none;" Text='<%# ControlText(DataBinder.Eval(Container.DataItem,"string_factor")) %>'> </asp:LinkButton>
                                            </td>
                                            <td style="text-align: left">
                                                <asp:Label ID="Label5" runat="server" Style="color: #666666" Text='<%# Eval("date", "{0}") %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                    <table class="style8">
                                        <tr>
                                            <td style="text-align: left">
                                                <asp:Label ID="lblUrl" runat="server" Text='<%# setUrl(DataBinder.Eval(Container.DataItem,"code"),DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="string_factor" SortExpression="string_factor">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("string_factor") %>'></asp:TextBox></EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="date" SortExpression="date">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("date") %>'></asp:TextBox></EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:View>
            <asp:View ID="V_Subject" runat="server">
                <div style="padding: 3px; color: Gray;">
                    <asp:Label ID="lblSubject" runat="server" Text="Label"></asp:Label></div>
                <asp:GridView ID="DG_Subject" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    DataKeyNames="code" DataSourceID="OSD_AllSearch" GridLines="None" PageSize="25"
                    ShowHeader="False" Width="739px">
                    <Columns>
                        <asp:TemplateField HeaderText="code" InsertVisible="False" SortExpression="code">
                            <EditItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("code") %>'></asp:Label></EditItemTemplate>
                            <ItemTemplate>
                                <div style="background-color: #e6f0f3; -moz-border-radius: 3px; border: 1px solid #ccc;">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td class="style7">
                                                <asp:Image runat="server" ForeColor="Transparent" ID="Image2" runat="server" ImageUrl='<%# ControlImage(DataBinder.Eval(Container.DataItem,"type")) %>' />
                                            </td>
                                            <td class="style6">
                                                <asp:LinkButton ID="btnDetailPost0" runat="server" CommandArgument='<%# Eval("code","{0}")+"|"+Eval("email","{0}") %>'
                                                    OnCommand="DetailPost" Style="color: #2D515D; text-decoration: none;" Text='<%# ControlText(DataBinder.Eval(Container.DataItem,"string_factor")) %>'> </asp:LinkButton>
                                            </td>
                                            <td style="text-align: left">
                                                <asp:Label ID="Label8" runat="server" Style="color: #666666" Text='<%# Eval("date", "{0}") %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                    <table class="style8">
                                        <tr>
                                            <td style="text-align: left">
                                                <asp:Label ID="lblUrl0" runat="server" Text='<%# setUrl(DataBinder.Eval(Container.DataItem,"code"),DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="string_factor" SortExpression="string_factor">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("string_factor") %>'></asp:TextBox></EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="date" SortExpression="date">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("date") %>'></asp:TextBox></EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:View>
            <asp:View ID="V_Images" runat="server">
                <div style="padding: 3px; color: Gray;">
                    <asp:Label ID="lblImage" runat="server" Text="Label"></asp:Label></div>
                <asp:GridView ID="DG_Images" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    DataKeyNames="code" DataSourceID="OSD_AllSearch" GridLines="None" PageSize="25"
                    ShowHeader="False" Width="739px">
                    <Columns>
                        <asp:TemplateField HeaderText="code" InsertVisible="False" SortExpression="code">
                            <EditItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("code") %>'></asp:Label></EditItemTemplate>
                            <ItemTemplate>
                                <div style="background-color: #e6f0f3; -moz-border-radius: 3px; border: 1px solid #ccc;">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td class="style7">
                                                <asp:Image ID="Image3" runat="server" ImageUrl='<%# ControlImage(DataBinder.Eval(Container.DataItem,"type")) %>' />
                                            </td>
                                            <td style="text-align: left;">
                                                <asp:LinkButton ID="btnDetailPost1" runat="server" CommandArgument='<%# Eval("code","{0}")+"|"+Eval("email","{0}") %>'
                                                    OnCommand="DetailPost" Style="color: #2D515D; text-decoration: none;">
                                                    <asp:Image runat="server" ForeColor="Transparent" ID="ImageButton1" runat="server"
                                                        AlternateText="عکسی موجود نمی باشد." Height="96px" ImageUrl='<%# "~/user/CropPhoto.aspx?P="+Eval("string_factor", "{0}")+"&W=127&H=96" %>'
                                                        Style="border: 1px solid #DFDFDF; padding: 2px; -moz-border-radius: 4px; -webkit-border-radius: 4px;
                                                        border-radius: 4px;" Width="127px" />
                                                </asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                    <table class="style8">
                                        <tr>
                                            <td style="text-align: left">
                                                <asp:Label ID="lblUrl1" runat="server" Text='<%# setUrl(DataBinder.Eval(Container.DataItem,"code"),DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left">
                                                <asp:Label ID="Label10" runat="server" Style="color: #666666" Text='<%# Eval("date", "{0}") %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="string_factor" SortExpression="string_factor">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("string_factor") %>'></asp:TextBox></EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="date" SortExpression="date">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("date") %>'></asp:TextBox></EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:View>
            <asp:View ID="V_Links" runat="server">
                <div style="padding: 3px; color: Gray;">
                    <asp:Label ID="lblLink" runat="server" Text="Label"></asp:Label></div>
                <asp:GridView ID="DG_Links" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    DataKeyNames="code" DataSourceID="OSD_AllSearch" GridLines="None" PageSize="25"
                    ShowHeader="False" Width="739px">
                    <Columns>
                        <asp:TemplateField HeaderText="code" InsertVisible="False" SortExpression="code">
                            <EditItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("code") %>'></asp:Label></EditItemTemplate>
                            <ItemTemplate>
                                <div style="background-color: #e6f0f3; -moz-border-radius: 3px; border: 1px solid #ccc;">
                                    <table class="style8">
                                        <tr>
                                            <td style="text-align: left" class="style9">
                                                <asp:Image runat="server" ForeColor="Transparent" ID="Image2" runat="server" Height="16px"
                                                    ImageUrl='<%# ControlImage(DataBinder.Eval(Container.DataItem,"type")) %>' />
                                            </td>
                                            <td style="text-align: left">
                                                <asp:LinkButton ID="btnDetailPost0" runat="server" CommandArgument='<%# Eval("code","{0}")+"|"+Eval("email","{0}") %>'
                                                    OnCommand="DetailPost" Style="color: #2D515D; text-decoration: none;" Text='<%# ControlText(DataBinder.Eval(Container.DataItem,"string_factor")) %>'> </asp:LinkButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style9" style="text-align: left">
                                                &nbsp;&nbsp;
                                            </td>
                                            <td style="text-align: left">
                                                <asp:Label ID="Label8" runat="server" Style="color: #666666" Text='<%# Eval("date", "{0}") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style9" style="text-align: left">
                                                &nbsp;&nbsp;
                                            </td>
                                            <td style="text-align: left">
                                                <asp:Label ID="lblUrl0" runat="server" Text='<%# setUrl(DataBinder.Eval(Container.DataItem,"code"),DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="string_factor" SortExpression="string_factor">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("string_factor") %>'></asp:TextBox></EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="date" SortExpression="date">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("date") %>'></asp:TextBox></EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:View>
            <asp:View ID="Citizen" runat="server">
                <div style="padding: 3px; color: Gray;">
                    <asp:Label ID="lblCitizen" runat="server" Text="Label"></asp:Label></div>
                <asp:GridView ID="DG_citizen" runat="server" AutoGenerateColumns="False" GridLines="None"
                    ShowHeader="False" AllowPaging="True" Width="669px" DataSourceID="ODS_Citizen">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div style="background-color: #f9f9f9; height: 100%; width: 740px; border-bottom: 1px solid #e1e1e1;">
                                    <table class="s1">
                                        <tr>
                                            <td class="s2">
                                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton2" OnCommand="RedirectFriend"
                                                    CommandArgument='<%# Eval("email","{0}") %>' runat="server" Height="45px" ImageUrl='<%# SetAvatar(DataBinder.Eval(Container.DataItem,"email")) %>'
                                                    Width="45px" />
                                            </td>
                                            <td>
                                                <table class="s1">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# SetTitle(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblDateBirth" runat="server" Style="color: #1a6788;" Text='<%# SetBirthDate(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label><asp:Label
                                                                ID="lblLocation" runat="server" Text='<%# SetLocation(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;&nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        شهروندی پیدا نشده است .
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Citizen" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_StageTableAdapters.Search_CitizenTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="fn_f" QueryStringField="factor" Type="String" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Fn_F" Type="String" />
                        <asp:Parameter Name="Ln_F" Type="String" />
                        <asp:Parameter Name="Fn_E" Type="String" />
                        <asp:Parameter Name="Ln_E" Type="String" />
                        <asp:Parameter Name="_Alias" Type="String" />
                        <asp:Parameter Name="Education" Type="String" />
                        <asp:Parameter Name="Birth_year" Type="Int32" />
                        <asp:Parameter Name="Birth_Month" Type="Int32" />
                        <asp:Parameter Name="Birth_Day" Type="Int32" />
                        <asp:Parameter Name="Birth_Time" Type="String" />
                        <asp:Parameter Name="Code_Country" Type="Int32" />
                        <asp:Parameter Name="Code_State" Type="Int32" />
                        <asp:Parameter Name="Code_City" Type="Int32" />
                        <asp:Parameter Name="None_Location" Type="Boolean" />
                        <asp:Parameter Name="Location" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="sex" Type="Boolean" />
                        <asp:Parameter Name="Marrid_Single" Type="Boolean" />
                        <asp:Parameter Name="Dodi" Type="String" />
                        <asp:Parameter Name="Religion" Type="String" />
                        <asp:Parameter Name="Mazhab" Type="String" />
                        <asp:Parameter Name="Foriegn_lanuage" Type="String" />
                        <asp:Parameter Name="Poletic" Type="String" />
                        <asp:Parameter Name="WebPage" Type="String" />
                        <asp:Parameter Name="BlogPage" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </asp:View>
            <asp:View ID="V_friends" runat="server">
                <div style="padding: 3px; color: Gray;">
                    <asp:Label ID="lblfriends" runat="server" Text="Label"></asp:Label></div>
                <asp:GridView ID="DG_friends" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    DataSourceID="ODS_friends" GridLines="None" ShowHeader="False" Width="669px">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div style="background-color: #f9f9f9; height: 100%; width: 740px; border-bottom: 1px solid #e1e1e1;">
                                    <table class="s1">
                                        <tr>
                                            <td class="s2">
                                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton3" runat="server"
                                                    Height="45px" OnCommand="RedirectFriend" CommandArgument='<%# Eval("email","{0}") %>'
                                                    ImageUrl='<%# SetAvatar(DataBinder.Eval(Container.DataItem,"email")) %>' Width="45px" />
                                            </td>
                                            <td>
                                                <table class="s1">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label11" runat="server" Text='<%# SetTitle(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblDateBirth0" runat="server" Style="color: #1a6788;" Text='<%# SetBirthDate(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label><asp:Label
                                                                ID="lblLocation0" runat="server" Text='<%# SetLocation(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;&nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        شهروندی پیدا نشده است .
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_friends" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_StageTableAdapters.Search_FriendsTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="name" QueryStringField="factor" Type="String" />
                        <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Fn_F" Type="String" />
                        <asp:Parameter Name="Ln_F" Type="String" />
                        <asp:Parameter Name="Fn_E" Type="String" />
                        <asp:Parameter Name="Ln_E" Type="String" />
                        <asp:Parameter Name="_Alias" Type="String" />
                        <asp:Parameter Name="Education" Type="String" />
                        <asp:Parameter Name="Birth_year" Type="Int32" />
                        <asp:Parameter Name="Birth_Month" Type="Int32" />
                        <asp:Parameter Name="Birth_Day" Type="Int32" />
                        <asp:Parameter Name="Birth_Time" Type="String" />
                        <asp:Parameter Name="Code_Country" Type="Int32" />
                        <asp:Parameter Name="Code_State" Type="Int32" />
                        <asp:Parameter Name="Code_City" Type="Int32" />
                        <asp:Parameter Name="None_Location" Type="Boolean" />
                        <asp:Parameter Name="Location" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="sex" Type="Boolean" />
                        <asp:Parameter Name="Marrid_Single" Type="Boolean" />
                        <asp:Parameter Name="Dodi" Type="String" />
                        <asp:Parameter Name="Religion" Type="String" />
                        <asp:Parameter Name="Mazhab" Type="String" />
                        <asp:Parameter Name="Foriegn_lanuage" Type="String" />
                        <asp:Parameter Name="Poletic" Type="String" />
                        <asp:Parameter Name="WebPage" Type="String" />
                        <asp:Parameter Name="BlogPage" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </asp:View>
            <asp:View ID="V_familys" runat="server">
                <div style="padding: 3px; color: Gray;">
                    <asp:Label ID="lblFamilys" runat="server" Text="Label"></asp:Label></div>
                <asp:GridView ID="DG_Familys" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    DataSourceID="ODS_Familys" GridLines="None" ShowHeader="False" Width="669px">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div style="background-color: #f9f9f9; height: 100%; width: 740px; border-bottom: 1px solid #e1e1e1;">
                                    <table class="s1">
                                        <tr>
                                            <td class="s2">
                                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton4" runat="server"
                                                    Height="45px" OnCommand="RedirectFriend" CommandArgument='<%# Eval("email","{0}") %>'
                                                    ImageUrl='<%# SetAvatar(DataBinder.Eval(Container.DataItem,"email")) %>' Width="45px" />
                                            </td>
                                            <td>
                                                <table class="s1">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label12" runat="server" Text='<%# SetTitle(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblDateBirth1" runat="server" Style="color: #1a6788;" Text='<%# SetBirthDate(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label><asp:Label
                                                                ID="lblLocation1" runat="server" Text='<%# SetLocation(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;&nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        شهروندی پیدا نشده است .
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Familys" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_StageTableAdapters.Search_FamilysTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="name" QueryStringField="factor" Type="String" />
                        <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Fn_F" Type="String" />
                        <asp:Parameter Name="Ln_F" Type="String" />
                        <asp:Parameter Name="Fn_E" Type="String" />
                        <asp:Parameter Name="Ln_E" Type="String" />
                        <asp:Parameter Name="_Alias" Type="String" />
                        <asp:Parameter Name="Education" Type="String" />
                        <asp:Parameter Name="Birth_year" Type="Int32" />
                        <asp:Parameter Name="Birth_Month" Type="Int32" />
                        <asp:Parameter Name="Birth_Day" Type="Int32" />
                        <asp:Parameter Name="Birth_Time" Type="String" />
                        <asp:Parameter Name="Code_Country" Type="Int32" />
                        <asp:Parameter Name="Code_State" Type="Int32" />
                        <asp:Parameter Name="Code_City" Type="Int32" />
                        <asp:Parameter Name="None_Location" Type="Boolean" />
                        <asp:Parameter Name="Location" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="sex" Type="Boolean" />
                        <asp:Parameter Name="Marrid_Single" Type="Boolean" />
                        <asp:Parameter Name="Dodi" Type="String" />
                        <asp:Parameter Name="Religion" Type="String" />
                        <asp:Parameter Name="Mazhab" Type="String" />
                        <asp:Parameter Name="Foriegn_lanuage" Type="String" />
                        <asp:Parameter Name="Poletic" Type="String" />
                        <asp:Parameter Name="WebPage" Type="String" />
                        <asp:Parameter Name="BlogPage" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </asp:View>
            <asp:View ID="V_Shaahrs" runat="server">
                <div style="padding: 3px; color: Gray;">
                    <asp:Label ID="lblShaahrs" runat="server" Text="Label"></asp:Label></div>
                <asp:DataList ID="DL_Shaahr" runat="server" DataKeyField="id" DataSourceID="OSD_AllSearch"
                    RepeatColumns="4" RepeatDirection="Horizontal" Width="736px">
                    <ItemTemplate>
                        <div style="width: 181px; height: 75px; border: 1px solid #ccc; -moz-border-radius: 5px;
                            margin-bottom: 2px; padding-top: 5px;">
                            <table class="style1">
                                <tr>
                                    <td class="style4">
                                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton1" runat="server"
                                            CommandArgument='<%# Eval("id","{0}") %>' Height="65px" ImageUrl='<%# iif(Eval("logo")="","~\Content\images\Shaahrs\Root\LogoShaahr.png",Eval("logo","~\Content\images\Shaahrs\Shaahrs_Logo\{0}")) %>'
                                            OnCommand="GotoShaahr" Width="65px" />
                                    </td>
                                    <td>
                                        <table class="style1">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="nameLabel" runat="server" Style="font-weight: 700" Text='<%# Eval("name") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="subnameLabel" runat="server" Style="color: #0066CC" Text='<%# Eval("subname") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="titleLabel" runat="server" Style="font-size: 10px" Text='<%# Eval("title") %>' />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </asp:View>
            <asp:View ID="V_MayorShaahr" runat="server">
                <div style="padding: 3px; color: Gray;">
                    <asp:Label ID="lblMayor" runat="server" Text="Label"></asp:Label></div>
                <asp:GridView ID="DG_Mayor" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="id" DataSourceID="OSD_AllSearch" ForeColor="#333333" GridLines="None">
                    <FooterStyle BackColor="#929DA3" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                            SortExpression="id" Visible="False" />
                        <asp:TemplateField HeaderText="شهر" SortExpression="name">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" OnCommand="GotoShaahr" CommandArgument='<%# Eval("id","{0}") %>'
                                    runat="server" Text='<%# Bind("name") %>' Style="text-decoration: none; color: #577F8B;" /></ItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" Width="550px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Column1" HeaderText="نام شهردار" ReadOnly="True" SortExpression="Column1">
                            <HeaderStyle Width="170px" HorizontalAlign="Right" />
                        </asp:BoundField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#DFDFDF" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#DFDFDF" Font-Bold="True" ForeColor="#929DA3" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
            </asp:View>
            <asp:View ID="CitizenShaahrs" runat="server">
                <div style="padding: 3px; color: Gray;">
                    <asp:Label ID="lblCitizenShaahrs" runat="server" Text="Label"></asp:Label>
                    <asp:GridView ID="DG_CitizenShaahrs" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        DataSourceID="OSD_AllSearch" GridLines="None" ShowHeader="False" Width="669px">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <div style="background-color: #f9f9f9; height: 100%; width: 740px; border-bottom: 1px solid #e1e1e1;">
                                        <table class="style8">
                                            <tr>
                                                <td class="style10">
                                                    <table class="s1">
                                                        <tr>
                                                            <td class="s2">
                                                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton5" runat="server"
                                                                    CommandArgument='<%# Eval("email","{0}") %>' Height="45px" ImageUrl='<%# SetAvatar(DataBinder.Eval(Container.DataItem,"email")) %>'
                                                                    OnCommand="RedirectFriend" Width="45px" />
                                                            </td>
                                                            <td>
                                                                <table class="s1">
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label13" runat="server" Text='<%# SetTitle(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="lblDateBirth2" runat="server" Style="color: #1a6788;" Text='<%# SetBirthDate(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label><asp:Label
                                                                                ID="lblLocation2" runat="server" Text='<%# SetLocation(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="email" runat="server" Text='<%# Eval("Email", "{0}") %>' Visible="False"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td>
                                                    <asp:DataList ID="DataList1" runat="server" DataKeyField="id" DataSourceID="ODS_Shaahr"
                                                        RepeatColumns="2" Width="504px">
                                                        <ItemTemplate>
                                                            <div style="width: 250px;">
                                                                <table class="style8">
                                                                    <tr>
                                                                        <td class="style11">
                                                                            <img alt="" src="../../Content/images/Shaahrs/Root/ShaahrIcon.png" style="width: 16px;
                                                                                height: 16px" />
                                                                        </td>
                                                                        <td>
                                                                            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("id","{0}") %>'
                                                                                OnCommand="GotoShaahr" Style="color: #000000; text-decoration: none;" Text='<%# Eval("name") %>' />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:DataList><asp:ObjectDataSource ID="ODS_Shaahr" runat="server" DeleteMethod="Delete"
                                                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                                                        TypeName="DS_StageTableAdapters.Shaahrs_Users_By_EmailTableAdapter" UpdateMethod="Update">
                                                        <DeleteParameters>
                                                            <asp:Parameter Name="Original_id" Type="Int64" />
                                                        </DeleteParameters>
                                                        <UpdateParameters>
                                                            <asp:Parameter Name="name" Type="String" />
                                                            <asp:Parameter Name="Original_id" Type="Int64" />
                                                        </UpdateParameters>
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="email" Name="email" PropertyName="Text" Type="String" />
                                                        </SelectParameters>
                                                        <InsertParameters>
                                                            <asp:Parameter Name="name" Type="String" />
                                                        </InsertParameters>
                                                    </asp:ObjectDataSource>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            شهروندی پیدا نشده است .
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </asp:View>
            <asp:View ID="V_PostShaahr" runat="server">
                <div style="padding: 3px; color: Gray;">
                    <asp:Label ID="lblPostShaahr" runat="server" Text="Label"></asp:Label></div>
                <asp:GridView ID="DG_PostSHaahr" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="Code" DataSourceID="OSD_AllSearch" ForeColor="#333333" GridLines="None"
                    ShowHeader="False">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="Code" HeaderText="Code" InsertVisible="False" ReadOnly="True"
                            SortExpression="Code" Visible="False" />
                        <asp:BoundField DataField="CodeCategory" HeaderText="CodeCategory" SortExpression="CodeCategory"
                            Visible="False" />
                        <asp:TemplateField HeaderText="عنوان" SortExpression="Subject">
                            <ItemTemplate>
                                <table class="style8">
                                    <tr>
                                        <td class="style11">
                                            ●
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument='<%# Eval("code","{0}")+"|"+Eval("codeshaahr","{0}") %>'
                                                OnCommand="GotoShowThread" Style="text-decoration: none; color: #1093C7;" Text='<%# Bind("Subject") %>'></asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" Width="500px" />
                            <ItemStyle Width="449px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Text" HeaderText="Text" SortExpression="Text" Visible="False" />
                        <asp:TemplateField HeaderText="گذارنده" SortExpression="email">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("email") %>'></asp:TextBox></EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label15" runat="server" Style="color: #808080" Text='<%# GetFN(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label></ItemTemplate>
                            <ItemStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Visit" HeaderText="Visit" SortExpression="Visit" Visible="False" />
                        <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" Visible="False" />
                        <asp:TemplateField HeaderText="تاریخ" SortExpression="date">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("date") %>'></asp:TextBox></EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label16" runat="server" Style="color: #808080" Text='<%# Bind("date") %>'></asp:Label></ItemTemplate>
                            <ItemStyle Width="120px" />
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="Luck" HeaderText="Luck" SortExpression="Luck" Visible="False" />
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        موردی یافت نشده است.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
