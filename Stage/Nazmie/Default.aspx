<%@ Page Language="VB" MasterPageFile="~/Stage/Nazmie/Home.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="Stage_Nazmie_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style6
        {
            width: 100%;
        }
        .style7
        {
            width: 48px;
        }
        .style8
        {
            text-align: center;
            width: 57px;
        }
        .style9
        {
            width: 44px;
        }
        .style10
        {
            width: 27px;
        }
        .style11
        {
            width: 6px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <img src="../../content/images/Stage/Nazmie/TopNazmie.png" />
    </div>
    <div style="padding-top: 4px;">
        <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
            <asp:View ID="V" runat="server">
                <div style="float: right; width: 367px;">
                    <img src="../../content/images/Stage/Nazmie/NazmieP.png" />
                    <div style="border: 1px solid #ccc; -moz-border-radius: 5px; padding: 2px;">
                        <div>
                            <img src="../../content/images/Stage/Nazmie/LogoNazmie.png" />
                        </div>
                        <div style="padding: 2px;">
                            گروهي از دانشمندان 5 ميمون را در قفسي قرار دادند. در وسط قفس يك نردبان
                        </div>
                    </div>
                    <div style="border: 1px solid #ccc; -moz-border-radius: 5px; padding: 2px; margin-top: 4px;">
                        <table class="style6">
                            <tr>
                                <td class="style7">
                                    <img src="../../content/images/Stage/Nazmie/Raw.png" />
                                </td>
                                <td>
                                    <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton1" runat="server"
                                        ImageUrl="~/content/images/Stage/Nazmie/TextRaw.png" PostBackUrl="~/Stage/Nazmie/law.aspx?law=law" />
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div style="border: 1px solid #ccc; -moz-border-radius: 5px; padding: 2px; margin-top: 4px;">
                        <table class="style6">
                            <tr>
                                <td class="style8">
                                    <img src="../../content/images/Stage/Nazmie/wrong.png" />
                                </td>
                                <td>
                                    <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton2" runat="server"
                                        ImageUrl="~/content/images/Stage/Nazmie/TextWorng.png" PostBackUrl="~/Stage/Nazmie/law.aspx?law=warring" />
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div style="float: right; width: 367px; margin-right: 6px;">
                    <img src="../../content/images/Stage/Nazmie/DetectiveP.png" />
                    <div style="border: 1px solid #ccc; -moz-border-radius: 5px; padding: 2px;">
                        <div>
                            <img src="../../content/images/Stage/Nazmie/hat.png" />
                        </div>
                        <div style="padding: 2px;">
                            گروههيچ عل از نردبان را به خود نمي‌داد. دانشمندان تصميم گرفتند كه يكي از م
                        </div>
                        <div style="border-top: 2px dashed #848484; border-bottom: 2px dashed #848484; margin-top: 4px;
                            padding: 5px;">
                            <asp:Button ID="btnDeleteDetective" runat="server" Width="350px" Height="40px" Style="font-family: Tahoma;
                                font-size: 12px; border: 1px solid #ccc; background-color: #DE7139; color: White;
                                cursor: pointer;" Text="لغو عضویت" Visible="False" />
                            <asp:Button ID="btnRegisterDetective" Width="350px" Height="40px" runat="server"
                                Text="عضویت در کارگاهان" Style="font-family: Tahoma; font-size: 12px; border: 1px solid #ccc;
                                background-color: #4CA3A8; color: White;" />
                        </div>
                        <div style="padding: 5px; font-size: 13px; color: #0081ad;">
                            &nbsp;<asp:Label ID="lblCountDetective" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div style="border: 1px solid #ccc; -moz-border-radius: 5px; padding: 2px; margin-top: 4px;">
                        <table class="style6">
                            <tr>
                                <td class="style9">
                                    <img src="../../content/images/Stage/Nazmie/Detective.png" />
                                </td>
                                <td style="text-align: center;">
                                    <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton3" runat="server"
                                        ImageUrl="~/content/images/Stage/Nazmie/Report.png" PostBackUrl="~/Stage/Nazmie/report.aspx" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="V_Success" runat="server">
                <div id="Div1" style="float: right; margin-top: 5px; border-top: 1px solid #b4cfde;
                    border-bottom: 1px solid #b4cfde; width: 743px; height: 100%; background-color: #f3fbff;"
                    runat="server">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <img src="../../content/images/Home/Accept.png" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                کاربر محترم;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                شما با موفقیت عضو گروه کاراگاهان شهر شدید.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                با تشکر مدیریت نظمیه.
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:View>
            <asp:View ID="V_Delete" runat="server">
                <div id="Div2" style="float: right; margin-top: 5px; border-top: 1px solid #b4cfde;
                    border-bottom: 1px solid #b4cfde; width: 743px; height: 100%; background-color: #f3fbff;"
                    runat="server">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <img src="../../content/images/Home/Accept.png" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                کاربر محترم;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                عضویت شما با موفقیت از گروه کارگاهان لغو شد.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                با تشکر مدیریت نظمیه.
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:View>
        </asp:MultiView>
        <div style="float: right; width: 737px; margin-top: 8px;">
            <table class="style6">
                <tr>
                    <td>
                        <table class="style6">
                            <tr>
                                <td class="style10">
                                    <img src="../../content/images/MyShaahr/news.png" />
                                </td>
                                <td>
                                    خبرهای نظمیه
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_News"
                            GridLines="None" ShowHeader="False" Width="740px" AllowPaging="True" PageSize="5">
                            <Columns>
                                <asp:TemplateField HeaderText="title_news" SortExpression="title_news">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="lid_news" SortExpression="lid_news">
                                    <ItemTemplate>
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="style11">
                                                    <img alt="" src="../../content/images/MyShaahr/PLUS.GIF" style="width: 13px; height: 9px" />
                                                </td>
                                                <td>
                                                    <a href='<%# Eval("id","news.aspx?IDnews={0}") %>' style="text-decoration: none;">
                                                        <asp:Label ID="Label1" runat="server" Style="color: #663300" Text='<%# Bind("title") %>'></asp:Label>
                                                    </a>&nbsp; (
                                                    <asp:Label ID="Label3" runat="server" Style="color: #CC9900; font-size: 10px" Text='<%# Bind("date") %>'></asp:Label>
                                                    )
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style11">
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Style="color: #000000; font-style: italic;"
                                                        Text='<%# Bind("lid_news") %>'></asp:Label>
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
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("date") %>'></asp:TextBox>
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
                            SelectMethod="GetData" TypeName="DS_StageTableAdapters.Nazmie_NewsTableAdapter">
                            <InsertParameters>
                                <asp:Parameter Name="CodeCategory" Type="Int64" />
                                <asp:Parameter Name="title" Type="String" />
                                <asp:Parameter Name="lid_news" Type="String" />
                                <asp:Parameter Name="news" Type="String" />
                                <asp:Parameter Name="_date" Type="String" />
                                <asp:Parameter Name="time" Type="String" />
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
            </table>
        </div>
    </div>
</asp:Content>
