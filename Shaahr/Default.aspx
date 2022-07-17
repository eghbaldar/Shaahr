<%@ Page Language="VB" MasterPageFile="~/Shaahr/Home.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="Shaahr_Default" Title="Untitled Page" %>

<%@ Register Src="../UserControl/Shaahr/BilboardOstan.ascx" TagName="BilboardOstan"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/Shaahr/DefaultShaahrMenu.ascx" TagName="DefaultShaahrMenu"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript" src="../jquery.min.js"></script>

    <style type="text/css">
        .style6
        {
            width: 100%;
        }
        .style7
        {
            width: 196px;
        }
        .style8
        {
            width: 24px;
        }
    </style>
    <style type="text/css">
        @font-face
        {
            font-family: koodak;
            src: url(                          "../content/font/W_koodak.TTF" );
        }
        .style9
        {
            width: 1px;
        }
        .style10
        {
            font-size: 10px;
        }
        .style11
        {
            width: 60px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 895px; height: 100%;">
        <table class="style6">
            <tr>
                <td class="style7">
                    <img alt="" src="../Content/images/Shaahrs/Root/map.png" style="width: 262px; height: 253px" />
                </td>
                <td>
                    <table class="style6">
                        <tr>
                            <td>
                                <table class="style6">
                                    <tr>
                                        <td class="style8">
                                            <img alt="" src="../Content/images/Shaahrs/Root/ShaahrLogo.png" style="width: 58px;
                                                height: 58px" />
                                        </td>
                                        <td>
                                            از اساتیدمون میگفت: &quot;یه استاد داشتیم هر سری دیر میومد سر کلاس. یه روز دخترا
                                            تصمیم گرفتند اولین باری که استاد دیر اومد سر کلاس از کلاس برن بیرون.... قضیه به
                                            گوش استاد رسید (میدونید که، توسط عده ای از آقا پسرهای جان بر کف!!!!!)، جلسه بعد
                                            استاد کمی دیر اومد سر کلاس و برای توجیه دیر آمدنش گفت: از انقلاب داشتم میومدم، دیدم
                                            یه صف طولانی از دخترا تشکیل شده، رفتم جلو پرسیدم، گفتند با کارت دانشجویی شوهر میدن!
                                            دخترا پا شدند که برن بیرون،
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <uc1:BilboardOstan ID="BilboardOstan1" runat="server" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div style="width: 895px; height: 100%; float: right;">
        <div style="width: 230px; float: right; height: 100%;">
            <table class="style6">
                <tr>
                    <td>
                        <uc2:DefaultShaahrMenu ID="DefaultShaahrMenu1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="background-color: #f3f3f3; border: 2px dotted #c9c9c9; width: 212px;
                            -moz-border-radius: 3px; padding: 4px; color: Gray;">
                            پربازدیدترین شهرها</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DataList ID="DataList1" runat="server" DataKeyField="id" DataSourceID="ODS_10Visit"
                            RepeatColumns="5" RepeatDirection="Horizontal" Width="28px">
                            <ItemTemplate>
                                <div style="border: 1px solid #ccc;">
                                    <table class="style6">
                                        <tr>
                                            <td>
                                                <asp:ImageButton ID="ImageButton1" runat="server" ForeColor="Transparent" runat="server"
                                                    CommandArgument='<%# Eval("id","{0}") %>' Height="33px" ImageUrl='<%# iif(Eval("logo")="","~\Content\images\Shaahrs\Root\LogoShaahr.png",Eval("logo","~\Content\images\Shaahrs\Shaahrs_Logo\{0}")) %>'
                                                    OnCommand="GotoShaahr" Width="33px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("visit") %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:ObjectDataSource ID="ODS_10Visit" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Shaahrs_10VisitTableAdapter">
                        </asp:ObjectDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="background-color: #f3f3f3; border: 2px dotted #c9c9c9; width: 212px;
                            -moz-border-radius: 3px; padding: 4px; color: Gray;">
                            پرشهروندترین شهرها</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DataList ID="DataList2" runat="server" DataSourceID="ODS_TopUsers" RepeatColumns="5"
                            RepeatDirection="Horizontal" Width="28px">
                            <ItemTemplate>
                                <div style="border: 1px solid #ccc;">
                                    <table class="style6">
                                        <tr>
                                            <td>
                                                <asp:ImageButton ID="ImageButton1" runat="server" ForeColor="Transparent" runat="server"
                                                    CommandArgument='<%# Eval("code_shaahr","{0}") %>' Height="33px" ImageUrl='<%# GetShaahrLogo(DataBinder.Eval(Container.DataItem,"code_shaahr")) %>'
                                                    OnCommand="GotoShaahr" Width="33px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Users", "{0}") %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:ObjectDataSource ID="ODS_TopUsers" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Shaahrs_TopUsersTableAdapter">
                        </asp:ObjectDataSource>
                    </td>
                </tr>
            </table>
        </div>
        <div style="width: 231px; float: right; height: 100%;">
            <table class="style6">
                <tr>
                    <td>
                        <div style="background-color: #f3f3f3; border: 2px dotted #c9c9c9; width: 212px;
                            -moz-border-radius: 3px; padding: 4px; color: Gray;">
                            اخبار</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="dg_News" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_News"
                            GridLines="None" ShowHeader="False" Width="222px" AllowPaging="True" PageSize="5">
                            <Columns>
                                <asp:TemplateField HeaderText="title_news" SortExpression="title_news">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("title_news") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="lid_news" SortExpression="lid_news">
                                    <ItemTemplate>
                                        <table class="style6">
                                            <tr>
                                                <td class="style9">
                                                    <img alt="" src="../Content/images/MyShaahr/PLUS.GIF" style="width: 13px; height: 9px" />
                                                </td>
                                                <td>
                                                    <asp:HyperLink ID="HyperLink1" Style="text-decoration: none;" NavigateUrl='<%# Eval("id","~\MyShaahr\news\news.aspx?IDnews={0}") %>'
                                                        runat="server">
                                                        <asp:Label ID="Label1" runat="server" Style="color: #247C9D" Text='<%# Bind("title_news") %>'></asp:Label>
                                                    </asp:HyperLink>
                                                    &nbsp; (
                                                    <asp:Label ID="Label3" runat="server" Style="color: #3399FF; font-size: 10px" Text='<%# Bind("tarikh") %>'></asp:Label>
                                                    )
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style9">
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Style="color: #666666" Text='<%# Bind("lid_news") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("lid_news") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="tarikh" SortExpression="tarikh">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("tarikh") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="time" SortExpression="time">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("time") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:ObjectDataSource ID="ODS_News" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="DS_MyShaahrTableAdapters.FristPageShaahr_NewsTableAdapter">
                            <InsertParameters>
                                <asp:Parameter Name="title_news" Type="String" />
                                <asp:Parameter Name="lid_news" Type="String" />
                                <asp:Parameter Name="news" Type="String" />
                                <asp:Parameter Name="tarikh" Type="String" />
                                <asp:Parameter Name="time" Type="String" />
                                <asp:Parameter Name="Flag" Type="Boolean" />
                                <asp:Parameter Name="Username" Type="String" />
                                <asp:Parameter Name="Code_Category" Type="Int64" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="background-color: #f3f3f3; border: 2px dotted #c9c9c9; width: 212px;
                            -moz-border-radius: 3px; padding: 4px; color: Gray;">
                            مسئولین</div>
                    </td>
                </tr>
                <tr>
                    <td class="style10" style="background-color: #CCCCCC">
                        دپارتمان ریاست جمهوری
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DataList ID="DL_Presedent" runat="server" DataSourceID="ODS_Presedent" Width="215px">
                            <ItemTemplate>
                                <table class="style6">
                                    <tr>
                                        <td class="style11">
                                            <div style="-moz-border-radius: 3px; border: 3px dotted #ccc; padding: 1px;">
                                                <asp:ImageButton ID="ImageButton1" runat="server" ForeColor="Transparent" CommandArgument='<%# Eval("email","{0}") %>'
                                                    OnCommand="GotoDetailAuth" ImageUrl='<%# "~/user/Crop.aspx?P="+ Eval("PicPath", "{0}") +"&W=60&H=60" %>'
                                                    runat="server" Height="50px" Width="50px" />
                                            </div>
                                        </td>
                                        <td>
                                            <table class="style6">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# GetType_(DataBinder.Eval(Container.DataItem,"type")) %>'
                                                            Style="font-weight: 700"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# GetFN(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Title_PostLabel" runat="server" Text='<%# Eval("Title_Post") %>' Style="font-size: 10px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:ObjectDataSource ID="ODS_Presedent" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Group_PresedentTableAdapter">
                        </asp:ObjectDataSource>
                        <asp:Label ID="lblPresedent" runat="server" Text='<%# Eval("Title_Post") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style10" style="background-color: #8CC07E">
                        دپارتمان استان اول
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DataList ID="DL_Group1" runat="server" DataSourceID="ODS_Ostan_1" Width="215px">
                            <ItemTemplate>
                                <table class="style6">
                                    <tr>
                                        <td class="style11">
                                            <div style="-moz-border-radius: 3px; border: 3px dotted #ccc; padding: 1px;">
                                                <asp:ImageButton runat="server" ForeColor="Transparent" CommandArgument='<%# Eval("email","{0}") %>'
                                                    OnCommand="GotoDetailAuth" ID="ImageButton1" ImageUrl='<%# "~/user/Crop.aspx?P="+ Eval("PicPath", "{0}") +"&W=60&H=60" %>'
                                                    runat="server" Height="50px" Width="50px" />
                                        </td>
                                        </div>
                                        <td>
                                            <table class="style6">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# GetType_(DataBinder.Eval(Container.DataItem,"type")) %>'
                                                            Style="font-weight: 700"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# GetFN(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Title_PostLabel" runat="server" Text='<%# Eval("Title_Post") %>' Style="font-size: 10px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:Label ID="lblGroup1" runat="server" Text='<%# Eval("Title_Post") %>' />
                        <asp:ObjectDataSource ID="ODS_Ostan_1" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Group_Ostan_1TableAdapter">
                        </asp:ObjectDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style10" style="background-color: #8DDDE9">
                        دپارتمان استان دوم
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DataList ID="DL_Group2" runat="server" DataSourceID="ODS_Ostan_2" Width="215px">
                            <ItemTemplate>
                                <table class="style6">
                                    <tr>
                                        <td class="style11">
                                            <div style="-moz-border-radius: 3px; border: 3px dotted #ccc; padding: 1px;">
                                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton1" CommandArgument='<%# Eval("email","{0}") %>'
                                                    OnCommand="GotoDetailAuth" ImageUrl='<%# "~/user/Crop.aspx?P="+ Eval("PicPath", "{0}") +"&W=60&H=60" %>'
                                                    runat="server" Height="50px" Width="50px" />
                                        </td>
                                        </div>
                                        <td>
                                            <table class="style6">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# GetType_(DataBinder.Eval(Container.DataItem,"type")) %>'
                                                            Style="font-weight: 700"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# GetFN(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Title_PostLabel" runat="server" Text='<%# Eval("Title_Post") %>' Style="font-size: 10px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:Label ID="lblGroup2" runat="server" Text='<%# Eval("Title_Post") %>' />
                        <asp:ObjectDataSource ID="ODS_Ostan_2" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Group_Ostan_2TableAdapter">
                        </asp:ObjectDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style10" style="background-color: #F7F56D">
                        دپارتمان استان سوم
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DataList ID="DL_Group3" runat="server" DataSourceID="ODS_Ostan_3" Width="215px">
                            <ItemTemplate>
                                <table class="style6">
                                    <tr>
                                        <td class="style11">
                                            <div style="-moz-border-radius: 3px; border: 3px dotted #ccc; padding: 1px;">
                                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton1" CommandArgument='<%# Eval("email","{0}") %>'
                                                    OnCommand="GotoDetailAuth" ImageUrl='<%# "~/user/Crop.aspx?P="+ Eval("PicPath", "{0}") +"&W=60&H=60" %>'
                                                    runat="server" Height="50px" Width="50px" />
                                        </td>
                                        </div>
                                        <td>
                                            <table class="style6">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# GetType_(DataBinder.Eval(Container.DataItem,"type")) %>'
                                                            Style="font-weight: 700"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# GetFN(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Title_PostLabel" runat="server" Text='<%# Eval("Title_Post") %>' Style="font-size: 10px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:Label ID="lblGroup3" runat="server" Text='<%# Eval("Title_Post") %>' />
                        <asp:ObjectDataSource ID="ODS_Ostan_3" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Group_Ostan_3TableAdapter">
                        </asp:ObjectDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style10" style="background-color: #F5AB69">
                        دپارتمان&nbsp; استان چهارم
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DataList ID="DL_Group4" runat="server" DataSourceID="ODS_Ostan_4" Width="215px">
                            <ItemTemplate>
                                <table class="style6">
                                    <tr>
                                        <td class="style11">
                                            <div style="-moz-border-radius: 3px; border: 3px dotted #ccc; padding: 1px;">
                                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton1" CommandArgument='<%# Eval("email","{0}") %>'
                                                    OnCommand="GotoDetailAuth" ImageUrl='<%# "~/user/Crop.aspx?P="+ Eval("PicPath", "{0}") +"&W=60&H=60" %>'
                                                    runat="server" Height="50px" Width="50px" />
                                        </td>
                                        </div>
                                        <td>
                                            <table class="style6">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# GetType_(DataBinder.Eval(Container.DataItem,"type")) %>'
                                                            Style="font-weight: 700"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# GetFN(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Title_PostLabel" runat="server" Text='<%# Eval("Title_Post") %>' Style="font-size: 10px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:Label ID="lblGroup4" runat="server" Text='<%# Eval("Title_Post") %>' />
                        <asp:ObjectDataSource ID="ODS_Ostan_4" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Group_Ostan_4TableAdapter">
                        </asp:ObjectDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style10" style="background-color: #E57CC9">
                        دپارتمان استان پنجم
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DataList ID="DL_Group5" runat="server" DataSourceID="ODS_Ostan_5" Width="215px">
                            <ItemTemplate>
                                <table class="style6">
                                    <tr>
                                        <td class="style11">
                                            <div style="-moz-border-radius: 3px; border: 3px dotted #ccc; padding: 1px;">
                                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton1" CommandArgument='<%# Eval("email","{0}") %>'
                                                    OnCommand="GotoDetailAuth" ImageUrl='<%# "~/user/Crop.aspx?P="+ Eval("PicPath", "{0}") +"&W=60&H=60" %>'
                                                    runat="server" Height="50px" Width="50px" />
                                        </td>
                                        </div>
                                        <td>
                                            <table class="style6">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# GetType_(DataBinder.Eval(Container.DataItem,"type")) %>'
                                                            Style="font-weight: 700"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# GetFN(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Title_PostLabel" runat="server" Text='<%# Eval("Title_Post") %>' Style="font-size: 10px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:Label ID="lblGroup5" runat="server" Text='<%# Eval("Title_Post") %>' />
                        <asp:ObjectDataSource ID="ODS_Ostan_5" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Group_Ostan_5TableAdapter">
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
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
            </td> </tr> </table>
        </div>
        <div style="width: 434px; float: right; height: 100%;">
            <table class="style6">
                <tr>
                    <td>
                        <div style="background-color: #f3f3f3; border: 2px dotted #c9c9c9; width: 420px;
                            -moz-border-radius: 3px; padding: 4px; color: Gray;">
                            چارت مدیریتی
                            <td>
                                &nbsp;&nbsp;
                            </td>
                </tr>
                <tr>
                    <td>
                        <img src="../Content/images/Shaahrs/Root/Chart.png" />
                    </td>
                </tr>
            </table>
            </td> </tr> </table>
        </div>
        <div style="width: 434px; float: right; height: 100%;">
            <table class="style6">
                <tr>
                    <td>
                        <div style="background-color: #f3f3f3; border: 2px dotted #c9c9c9; width: 420px;
                            -moz-border-radius: 3px; padding: 4px; color: Gray;">
                            صد سال تصادفی</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DataList ID="DataList3" runat="server" DataKeyField="id" DataSourceID="ODS_100Random"
                            RepeatColumns="10" RepeatDirection="Horizontal" Width="28px">
                            <ItemTemplate>
                                <div style="border: 1px solid #ccc;">
                                    <table class="style6">
                                        <tr>
                                            <td>
                                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton1" runat="server"
                                                    CommandArgument='<%# Eval("id","{0}") %>' Height="33px" ImageUrl='<%# iif(Eval("logo")="","~\Content\images\Shaahrs\Root\LogoShaahr.png",Eval("logo","~\Content\images\Shaahrs\Shaahrs_Logo\{0}")) %>'
                                                    OnCommand="GotoShaahr" Width="33px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("visit") %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:ObjectDataSource ID="ODS_100Random" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Shaahr_100RandomTableAdapter">
                        </asp:ObjectDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="background-color: #f3f3f3; border: 2px dotted #c9c9c9; width: 420px;
                            -moz-border-radius: 3px; padding: 4px; color: Gray;">
                        آخرین شهرهای تاسیس شده
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DataList ID="DataList4" runat="server" DataKeyField="id" DataSourceID="ODS_20Last"
                            RepeatColumns="10" RepeatDirection="Horizontal" Width="28px">
                            <ItemTemplate>
                                <div style="border: 1px solid #ccc;">
                                    <table class="style6">
                                        <tr>
                                            <td>
                                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton1" runat="server"
                                                    CommandArgument='<%# Eval("id","{0}") %>' OnCommand="GotoShaahr" Height="33px"
                                                    ImageUrl='<%# iif(Eval("logo")="","~\Content\images\Shaahrs\Root\LogoShaahr.png",Eval("logo","~\Content\images\Shaahrs\Shaahrs_Logo\{0}")) %>'
                                                    Width="33px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("visit") %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:ObjectDataSource ID="ODS_20Last" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Shaahrs_20LastTableAdapter">
                        </asp:ObjectDataSource>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
