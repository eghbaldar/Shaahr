<%@ Page Language="VB" MasterPageFile="~/Shaahr/Subshaahr.master" AutoEventWireup="false"
    CodeFile="Shaahr.aspx.vb" Inherits="Shaahr_Default2" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        @font-face
        {
            font-family: koodak;
            src: url(                                                       "../content/font/W_koodak.TTF" );
        }
        .logoR
        {
            padding-right: 15px;
            padding-top: 15px;
            width: 294px;
        }
        .logoC
        {
            width: 296px;
            text-align: center;
            padding-top: 15px;
        }
        .logoL
        {
            padding-left: 15px;
            padding-top: 15px;
            text-align: left;
        }
        .style3
        {
            width: 784px;
        }
        .style5
        {
            width: 703px;
        }
        .style6
        {
            width: 365px;
        }
        .style12
        {
            width: 89px;
        }
        .style13
        {
            width: 457px;
        }
        .style14
        {
            width: 12px;
        }
        .style15
        {
            width: 228px;
        }
        .style16
        {
            width: 100%;
        }
        .style17
        {
            width: 580px;
        }
        .style19
        {
            width: 388px;
        }
        .style20
        {
            width: 94px;
        }
        .style21
        {
            width: 10px;
        }
        .style22
        {
            font-size: 10px;
        }
        .style23
        {
            width: 724px;
        }
        .style24
        {
            width: 2px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CenterContent" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <table class="style16">
                    <tr>
                        <td class="style17">
                            <div style="height: 100%;">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_News"
                                    GridLines="None" ShowHeader="False" Width="375px" AllowPaging="True" PageSize="5">
                                    <Columns>
                                        <asp:TemplateField HeaderText="title_news" SortExpression="title_news">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Subject") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="lid_news" SortExpression="lid_news">
                                            <ItemTemplate>
                                                <table class="style16">
                                                    <tr>
                                                        <td class="style24">
                                                            <img alt="" src="../Content/images/MyShaahr/PLUS.GIF" style="width: 13px; height: 9px" />
                                                        </td>
                                                        <td>
                                                            <h1 style="font-weight: normal;">
                                                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("id","{0}") %>'
                                                                    OnCommand="GotoNews" Style="color: #247C9D; text-decoration: none;" Text='<%# Bind("Subject") %>' />
                                                                &nbsp;( &nbsp;<asp:Label ID="Label3" runat="server" Style="color: #3399FF; font-size: 10px"
                                                                    Text='<%# Bind("date") %>'></asp:Label>
                                                                )
                                                            </h1>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="tarikh" SortExpression="tarikh">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("date") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="time" SortExpression="time">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("time") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        خبری وجود ندارد.
                                    </EmptyDataTemplate>
                                </asp:GridView>
                                <asp:ObjectDataSource ID="ODS_News" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Shaahr_ShaahrNewsByFlagTableAdapter">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="" Name="codeshaahr" Type="Int64" />
                                        <asp:Parameter DefaultValue="True" Name="flag" Type="Boolean" />
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
                            </div>
                        </td>
                        <td>
                            <div style="height: 100%;">
                                <asp:MultiView ID="M_Users" runat="server" ActiveViewIndex="0">
                                    <asp:View ID="V_Register" runat="server">

                                        <script type="text/javascript">
                                                    function OnMouse(str)    { document.getElementById(str).style.opacity="1";     }
                                                    function OnMouseOut(str)    { document.getElementById(str).style.opacity="0.4";     }
                                        </script>

                                        <div style="opacity: 0.4;" id="opacity_" onmousemove="return OnMouse('opacity_');"
                                            onmouseout="return OnMouseOut('opacity_');">
                                            <div style="width: 349px;">
                                                <asp:DataList ID="DL_Registers" runat="server" DataSourceID="ODS_Users" RepeatColumns="10"
                                                    RepeatDirection="Horizontal">
                                                    <ItemTemplate>
                                                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="imgFriends" runat="server"
                                                            CommandArgument='<%# Eval("email","{0}") %>' Height="33px" ImageUrl='<%# "~/user/Crop.aspx?P="+ Eval("PicPath", "{0}") +"&W=40&H=40" %>'
                                                            OnCommand="RedirectUser" Style="margin-top: 2px;" Width="33px" />
                                                    </ItemTemplate>
                                                </asp:DataList>
                                            </div>
                                            <asp:ObjectDataSource ID="ODS_Users" runat="server" OldValuesParameterFormatString="original_{0}"
                                                SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Profile_ShaahrsTableAdapter">
                                                <SelectParameters>
                                                    <asp:Parameter Name="code_shaahr" Type="Int64" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                        </div>
                                    </asp:View>
                                    <asp:View ID="V_Guest" runat="server">
                                        <%--<div style="margin-top: 5px; height: 70px; padding: 5px; background-color: #f6f6f6;
                                            border-bottom: 4px dotted #90C6C3; border-top: 4px dotted #90C6C3; width: 335px;
                                            color: #587C8A; padding-top: 7px;">
                                            کاربر محترم برای استفاده از امکانات شهرعضو شوید.</div>--%>
                                    </asp:View>
                                </asp:MultiView>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Image runat="server" ForeColor="Transparent" ID="imgAds" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <div style="border: 1px solid #c9d5d8; padding: 1px; width: 737px;">
                    <table class="style1">
                        <tr>
                            <td class="style23">
                                <asp:TextBox ID="txtSearch" Style="border: 0px; font-family: Tahoma; font-size: 12px;"
                                    runat="server" Width="690px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnSearch" runat="server"
                                    ImageUrl="~/Content/images/Shaahrs/Root/Search.png" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="DataList2" runat="server" DataKeyField="Code" DataSourceID="ODS_Cat"
                    Width="743px">
                    <ItemTemplate>
                        <div style="background-color: #F5F5F5; border-bottom: 1px solid #ccc;">
                            <table class="style1">
                                <tr>
                                    <td class="style13">
                                        <table class="style1">
                                            <tr>
                                                <td>
                                                    <table class="style1">
                                                        <tr>
                                                            <td class="style14">
                                                                <img alt="" src="../Content/images/Shaahrs/Root/category.png" />
                                                            </td>
                                                            <td>
                                                                <h1>
                                                                    <asp:LinkButton OnCommand="GotoThread" CommandArgument='<%# Eval("code","{0}") %>'
                                                                        Style="font-family: koodak; font-size: 15px; text-decoration: none; color: #587D8D;"
                                                                        Text='<%# Eval("Subject") %>' ID="LinkButton1" runat="server">
                                                                    </asp:LinkButton>
                                                                </h1>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h1 style="font-weight: normal;">
                                                        <asp:Label Style="font-size: 10px;" ID="DetailLabel" runat="server" Text='<%# Eval("Detail") %>' />
                                                    </h1>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="style15">
                                        <table class="style1">
                                            <tr>
                                                <td class="style12">
                                                    کل بازدیدها:
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# GetVisit(DataBinder.Eval(Container.DataItem,"code")) %>'
                                                        Style="font-weight: 700"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style12">
                                                    پست ها:
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label5" runat="server" Text='<%# GetCountPost(DataBinder.Eval(Container.DataItem,"code")) %>'
                                                        Style="font-weight: 700; color: #646464"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style12">
                                                    آخرین بروزرسانی:
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label6" runat="server" Text='<%# GetLastUpdate(DataBinder.Eval(Container.DataItem,"code")) %>'
                                                        Style="color: #0066CC"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <div style="width: 30px;">
                                            <asp:Image ID="ImageButton5" runat="server" ForeColor="Transparent" runat="server"
                                                ImageUrl="~/Content/images/Shaahrs/Root/lock.png" Visible='<%# CheckLuckPost(DataBinder.Eval(Container.DataItem,"code")) %>' />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:ObjectDataSource ID="ODS_Cat" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Shaahr_ShaahrCategoryPostTableAdapter"
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_Code" Type="Int64" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CodeShaahr" Type="Int64" />
                        <asp:Parameter Name="Subject" Type="String" />
                        <asp:Parameter Name="Detail" Type="String" />
                        <asp:Parameter Name="Luck" Type="Boolean" />
                        <asp:Parameter Name="Original_Code" Type="Int64" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:Parameter Name="CodeShaahr" Type="Int64" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CodeShaahr" Type="Int64" />
                        <asp:Parameter Name="Subject" Type="String" />
                        <asp:Parameter Name="Detail" Type="String" />
                        <asp:Parameter Name="Luck" Type="Boolean" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <div style="background-color: #D9E4E8; padding: 5px; -moz-border-radius: 5px; font-family: koodak;
                    color: #577E8D;">
                    مسئولین</div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="border: 2px solid #E7E7E7; -moz-border-radius: 3px;">
                    <table class="style16">
                        <tr>
                            <td class="style19">
                                <table class="style16">
                                    <tr>
                                        <td class="style20">
                                            <asp:Image runat="server" ForeColor="Transparent" ID="imgMayor" runat="server" Height="100px"
                                                Style="-moz-border-radius: 5px" Width="100px" />
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
                                                        <asp:Image runat="server" ForeColor="Transparent" ID="imgAssist_1" runat="server"
                                                            Height="45px" Style="-moz-border-radius: 5px" Width="45px" />
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
                                                        <asp:Image runat="server" ForeColor="Transparent" ID="imgAssist_2" runat="server"
                                                            Height="45px" Style="-moz-border-radius: 5px" Width="45px" />
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
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="background-color: #E6E6E6; padding: 5px; -moz-border-radius: 5px; font-family: koodak;
                    color: gray;">
                    آخرین پست ها</div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="Code" DataSourceID="ODS_LastPost" ForeColor="#333333" GridLines="None"
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
                                <h1 style="font-weight: normal;">
                                    <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# Eval("code","{0}") %>'
                                        OnCommand="GotoShowThread" Style="text-decoration: none; color: #2f2f2f;" Text='<%# Bind("Subject") %>'></asp:LinkButton>
                                </h1>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" Width="250px" />
                            <ItemStyle Width="439px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Text" HeaderText="Text" SortExpression="Text" Visible="False" />
                        <asp:TemplateField HeaderText="گذارنده" SortExpression="email">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Style="color: #808080" Text='<%# GetFN(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Visit" HeaderText="Visit" SortExpression="Visit" Visible="False" />
                        <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" Visible="False" />
                        <asp:TemplateField HeaderText="تاریخ" SortExpression="date">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Style="color: #808080" Text='<%# Bind("date") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="130px" />
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="Luck" HeaderText="Luck" SortExpression="Luck" Visible="False" />
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        پستی وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_LastPost" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Shaahr_ShaahrPost_Last10PostTableAdapter"
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_Code" Type="Int64" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CodeCategory" Type="Int64" />
                        <asp:Parameter Name="Subject" Type="String" />
                        <asp:Parameter Name="Text" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="Visit" Type="Int32" />
                        <asp:Parameter Name="Time" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="Luck" Type="Boolean" />
                        <asp:Parameter Name="Original_Code" Type="Int64" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:Parameter Name="code" Type="Int64" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CodeCategory" Type="Int64" />
                        <asp:Parameter Name="Subject" Type="String" />
                        <asp:Parameter Name="Text" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="Visit" Type="Int32" />
                        <asp:Parameter Name="Time" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="Luck" Type="Boolean" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
