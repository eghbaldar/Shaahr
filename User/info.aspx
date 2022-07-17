<%@ Page Language="VB" MasterPageFile="~/user/User.master" AutoEventWireup="false"
    CodeFile="info.aspx.vb" Inherits="user_info" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style38
        {
            color: #405866;
            width: 108px;
        }
        .style41
        {
            width: 100%;
            font-family: Tahoma;
            font-size: 11px;
        }
        .style42
        {
            width: 100%;
        }
        .style43
        {
            color: #405866;
            width: 76px;
        }
        .style44
        {
            width: 24px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div id="Div_InfoPersonal" runat="server" style="color: Gray; float: right; width: 268px;
            height: 220px; padding: 3px; height: 100%; border: solid #dedede 1px; -moz-border-radius: 5px;
            font-family: Tahoma; font-size: 11px;">
            <div class="DivTop">
                مشخصات فردی
            </div>
            <div style="height: 100%; float: right;">
                <table class="style41">
                    <tr>
                        <td class="style38">
                            نام:
                        </td>
                        <td>
                            <asp:Label ID="lblFn_f" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style38">
                            نام خانوادگی:
                        </td>
                        <td>
                            <asp:Label ID="lblLn_f" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style38">
                            نام انگلیسی:
                        </td>
                        <td>
                            <asp:Label ID="lblFn_E" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style38">
                            نام خانوادگی انگلیسی:
                        </td>
                        <td>
                            <asp:Label ID="lblLn_E" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style38">
                            نام مستعار:
                        </td>
                        <td>
                            <asp:Label ID="lblAlias" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style38">
                            جنسیت:
                        </td>
                        <td>
                            <asp:Label ID="lblSex" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style38">
                            وضعیت تاهل:
                        </td>
                        <td>
                            <asp:Label ID="lblMarrid" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style38">
                            تاریخ تولد:
                        </td>
                        <td>
                            <asp:Label ID="lblDateBirth" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style38">
                            ساعت تولد:
                        </td>
                        <td>
                            <asp:Label ID="lblTimeBirth" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style38">
                            دین:
                        </td>
                        <td>
                            <asp:Label ID="lblReligion" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style38">
                            مذهب:
                        </td>
                        <td>
                            <asp:Label ID="lblMazhab" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style38">
                            تحصیلات:
                        </td>
                        <td>
                            <asp:Label ID="lblEcuation" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style38">
                            کشور:
                        </td>
                        <td>
                            <asp:Label ID="lblCountry" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style38">
                            استان (ایالت):
                        </td>
                        <td>
                            <asp:Label ID="lblState" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style38">
                            شهر:
                        </td>
                        <td>
                            <asp:Label ID="lblCity" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style38">
                            خارج از محدوده:
                        </td>
                        <td>
                            <asp:Label ID="lblNoneLocation" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style38">
                            آدرس:
                        </td>
                        <td>
                            <asp:Label ID="lblAddress" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style38">
                            زبان خارجی:
                        </td>
                        <td>
                            <asp:Label ID="lblForeignLanguage" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style38">
                            سیاست:
                        </td>
                        <td>
                            <asp:Label ID="lblPolctic" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style38">
                            دودی:
                        </td>
                        <td>
                            <asp:Label ID="lblDodi" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style38">
                            وب سایت:
                        </td>
                        <td>
                            <div style="width: 150px; text-align: left;">
                                <asp:HyperLink ID="lblWebPage" runat="server" Style="color: Black; font-size: 10px;"
                                    Target="_blank" Font-Underline="False"></asp:HyperLink>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="style38">
                            وبلاگ:
                        </td>
                        <td>
                            <div style="width: 150px; text-align: left;">
                                <asp:HyperLink ID="lblBlogPage" runat="server" Style="color: Black; font-size: 10px;"
                                    Target="_blank" Font-Underline="False"></asp:HyperLink>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="Div_InfoOutWard" runat="server" style="color: Gray; float: right; width: 265px;
            height: 220px; padding: 3px; height: 100%; border: solid #dedede 1px; -moz-border-radius: 5px;
            font-family: Tahoma; font-size: 11px;">
            <div class="DivTop">
                مشخصات ظاهری
            </div>
            <div style="height: 100%; float: right;">
                <table class="style42">
                    <tr>
                        <td class="style43">
                            قد:
                        </td>
                        <td>
                            <asp:Label ID="lblHeight" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style43">
                            وزن:
                        </td>
                        <td>
                            <asp:Label ID="lblWieght" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style43">
                            اخلاق:
                        </td>
                        <td>
                            <asp:Label ID="lblMorality" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style43">
                            رفتار:
                        </td>
                        <td>
                            <asp:Label ID="lblBehaviour" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style43">
                            نوع پوشش:
                        </td>
                        <td>
                            <asp:Label ID="lblCover" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style43">
                            رنگ پوست:
                        </td>
                        <td>
                            <asp:Label ID="lblColorSkin" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style43">
                            اندام:
                        </td>
                        <td>
                            <asp:Label ID="lblOrgan" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style43">
                            وضعیت مو:
                        </td>
                        <td>
                            <asp:Label ID="lblStatusHeair" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style43">
                            رنگ مو:
                        </td>
                        <td>
                            <asp:Label ID="lblColorHeair" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style43">
                            رنگ چشم:
                        </td>
                        <td>
                            <asp:Label ID="lblColorEyes" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="Div_InfoFavorit" runat="server" style="color: Gray; float: right; width: 542px;
            height: 220px; padding: 3px; height: 100%; margin-top: 3px; border: solid #dedede 1px;
            -moz-border-radius: 5px; font-family: Tahoma; font-size: 11px;">
            <div class="DivTop">
                علاقمندی ها
            </div>
            <div style="height: 100%; float: right; color: Black; margin-top: 3px;">
                <asp:DataList ID="DataList1" runat="server" DataKeyField="code" DataSourceID="ODS_FavortisCat"
                    Width="540px">
                    <ItemTemplate>
                        <div style="background-color: #efefef; padding-right: 3px; padding-bottom: 3px; color: Gray;
                            width: 538px; border-bottom: 1px solid #c9c9c9;">
                            <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                            <asp:Label ID="lblCodeCategory" runat="server" Text='<%# Eval("code") %>' Visible="false" />
                        </div>
                        <div style="padding: 3px;">
                            <asp:DataList ID="DataList2" runat="server" DataSourceID="ODS_Favorits" DataKeyField="code"
                                Width="270px" RepeatColumns="3" RepeatDirection="Horizontal">
                                <ItemTemplate>
                                    <div style="border: 1px solid #ccc; width: 150px; height: 50px; padding: 3px; margin-right: 3px;
                                        -moz-border-radius: 5px;">
                                        <table class="style42">
                                            <tr>
                                                <td class="style44">
                                                    <asp:ImageButton ID="ImageButton1" runat="server" ForeColor="Transparent" runat="server"
                                                        Height="47px" ImageUrl='<%# Eval("Logo", "~\content\images\Shaahrs\Favorits\Favorits\{0}") %>'
                                                        Width="47px" />
                                                </td>
                                                <td>
                                                    <table class="style42">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("title", "{0}") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label4" runat="server" Text='<%# CountFavoritsUsers(DataBinder.Eval(Container.DataItem,"code")) %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                            <asp:ObjectDataSource ID="ODS_Favorits" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                OldValuesParameterFormatString="original_{0}" OnSelecting="ODS_Favorits_Selecting"
                                SelectMethod="GetData" TypeName="DS_View_Users_SectionsTableAdapters.Favorits_userTableAdapter"
                                UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_code" Type="Int64" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="code_category" Type="Int64" />
                                    <asp:Parameter Name="title" Type="String" />
                                    <asp:Parameter Name="Logo" Type="String" />
                                    <asp:Parameter Name="Original_code" Type="Int64" />
                                </UpdateParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblCodeCategory" Name="code_category" PropertyName="Text"
                                        Type="Int64" />
                                    <asp:Parameter Name="email" Type="String" />
                                </SelectParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="code_category" Type="Int64" />
                                    <asp:Parameter Name="title" Type="String" />
                                    <asp:Parameter Name="Logo" Type="String" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:ObjectDataSource ID="ODS_FavortisCat" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_View_Users_SectionsTableAdapters.Favorits_CategoryTableAdapter"
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_code" Type="Int64" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="title" Type="String" />
                        <asp:Parameter Name="Logo" Type="String" />
                        <asp:Parameter Name="Original_code" Type="Int64" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:Parameter Name="email" Type="String" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="title" Type="String" />
                        <asp:Parameter Name="Logo" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
    </div>
</asp:Content>
