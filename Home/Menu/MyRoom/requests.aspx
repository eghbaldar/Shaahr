<%@ Page Language="VB" MasterPageFile="~/home/Menu/MyRoom/Home.master" AutoEventWireup="false"
    CodeFile="requests.aspx.vb" Inherits="home_Menu_MyRoom_requests" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Dropdownlist  -->
    <link href="../../../content/js/Dropdownlist/Styles/Selectbox.css" rel="stylesheet"
        type="text/css" />

    <script src="../../../content/js/Dropdownlist/Scripts/jquery-1.5.1.js" type="text/javascript"
        charset="utf-8"></script>

    <script type="text/javascript" src="../../../content/js/Dropdownlist/Scripts/jquery.selectbox-0.5.js"></script>

    <script type="text/javascript">
	    $(document).ready(function () {
	        $('.selectbox').selectbox();
	    });
    </script>

    <style type="text/css">
        .style6
        {
            width: 100%;
        }
        .s
        {
            color: Black;
            text-decoration: none;
        }
        .style7
        {
            width: 7px;
        }
        .style10
        {
            height: 15px;
        }
        .style11
        {
            width: 64px;
        }
        .style12
        {
            height: 15px;
            width: 64px;
        }
        .style13
        {
            width: 23px;
        }
        .style14
        {
            width: 650px;
        }
        .title
        {
            height: 18px;
            color: #567E8A;
            font-family: koodak;
            font-size: 12px;
            border-right: 5px solid #B4D8EE;
            float: right;
            width: 730px;
            margin-top: 2px;
            padding-bottom: 3px;
            padding-right: 4px;
        }
        .frame
        {
            border: 1px solid #ccc;
            width: 362px;
            margin-right: 2px;
            background-image: url(                                                  '../../../content/images/Profile_View_Users/bgDiv.png' );
            background-repeat: repeat-x;
        }
        .visualize
        {
            float: right;
            padding-top: 2px;
            padding-bottom: 2px;
            margin-bottom: 5px;
        }
        .DIVDuplicate
        {
            float: right;
            padding: 4px;
            background-color: #F8E0DE;
            margin-top: 3px;
            border: 1px solid #F0C7CB;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            width: 728px;
            border-radius: 5px;
        }
        .subTitle
        {
            background-color: #DBEDF7;
            width: 716px;
            height: 15px;
            padding: 3px;
            border: 2px dotted #B4D8EE;
        }
    </style>
    <style type="text/css">
        @font-face
        {
            font-family: koodak;
            src: url(                                                           "../../../content/font/W_koodak.TTF" );
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <table class="style6">
        <tr>
            <td class="style7">
                <img alt="" src="../../../content/images/Home/request.jpg" style="width: 22px; height: 18px" />
            </td>
            <td>
                <asp:HyperLink ID="HyperLink1" class="s" NavigateUrl="~/home/Menu/MyRoom/requests.aspx"
                    runat="server">درخواست ها</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td class="style7">
                <img alt="" src="../../../content/images/Home/friends.jpg" style="width: 22px; height: 18px" />
            </td>
            <td>
                <asp:HyperLink ID="HyperLink2" class="s" NavigateUrl="~/home/Menu/MyRoom/Friends.aspx"
                    runat="server">دوستان</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td class="style7">
                <img alt="" src="../../../content/images/Home/family_1.jpg" style="width: 22px; height: 18px" />
            </td>
            <td>
                <asp:HyperLink ID="HyperLink3" class="s" NavigateUrl="~/home/Menu/MyRoom/Familys.aspx"
                    runat="server">بستگان</asp:HyperLink>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 727px;">
            درخواست ها
        </div>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="V_Show" runat="server">
                <div class="title">
                    درخواست های تایید شده</div>
                <div class="visualize">
                    <asp:DataList ID="DL_OK" runat="server" DataSourceID="ODS_OK" RepeatColumns="2" RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <div class="frame">
                                <table style="width: 126%;">
                                    <tr>
                                        <td style="width: 45px;">
                                            <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton1" Style="border: 1px dotted #ccc;"
                                                OnCommand="Redirect" CommandArgument='<%# Eval("user","{0}") %>' ImageUrl='<%# UserImage(DataBinder.Eval(Container.DataItem,"user")) %>'
                                                Height="80px" Width="80px" />
                                        </td>
                                        <td>
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td>
                                                        <asp:ImageButton runat="server" ForeColor="Transparent" OnCommand="DeleteRelation"
                                                            CommandArgument='<%# Eval("id","{0}")+"|"+Eval("user","{0}") %>' ID="ImageButton2"
                                                            ImageUrl="~/content/images/Home/deleteWork.jpg" />
                                                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton4" OnCommand="SendFamily"
                                                            CommandArgument='<%# Eval("user","{0}")+"|"+Eval("id","{0}")+"|"+Eval("type","{0}") %>'
                                                            ImageUrl="~/content/images/Home/family_.jpg" Width="16px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblName" runat="server" Text='<%# Name(DataBinder.Eval(Container.DataItem,"user")) %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblRequestDate" Text='<%# RequestDate(DataBinder.Eval(Container.DataItem,"DateRequest")) %>'
                                                            runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblAcceptDate" Text='<%# AcceptDenyDate(DataBinder.Eval(Container.DataItem,"DateResponse"),DataBinder.Eval(Container.DataItem,"flag")) %>'
                                                            runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblRelationType" Text='<%# Family(DataBinder.Eval(Container.DataItem,"type")) %>'
                                                            runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:Label ID="lblReqOk" runat="server"></asp:Label>
                    <asp:ObjectDataSource ID="ODS_OK" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="DS_SettingTableAdapters.Home_RequestTableAdapter">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="" Name="email" SessionField="MY-UsErNaMe" Type="String" />
                            <asp:Parameter DefaultValue="1" Name="index" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
                <div class="title">
                    درخواست های دوستی تایید نشده</div>
                <div class="visualize">
                    <asp:DataList ID="Dl_Nok" runat="server" DataSourceID="ODS_Nok" RepeatColumns="2"
                        RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <div class="frame">
                                <table style="width: 126%;">
                                    <tr>
                                        <td style="width: 45px;">
                                            <asp:ImageButton Style="border: 1px dotted #ccc;" ID="ImageButton1" OnCommand="Redirect"
                                                CommandArgument='<%# Eval("user","{0}") %>' ImageUrl='<%# UserImage(DataBinder.Eval(Container.DataItem,"user")) %>'
                                                runat="server" Height="80px" Width="80px" />
                                        </td>
                                        <td>
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td>
                                                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton2" OnCommand="DeleteRequest"
                                                            CommandArgument='<%# Eval("id","{0}") %>' ImageUrl="~/content/images/Home/deleteWork.jpg" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblName" runat="server" Text='<%# Name(DataBinder.Eval(Container.DataItem,"user")) %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblRequestDate" Text='<%# RequestDate(DataBinder.Eval(Container.DataItem,"DateRequest")) %>'
                                                            runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblAcceptDate" Text='<%# AcceptDenyDate(DataBinder.Eval(Container.DataItem,"DateResponse"),DataBinder.Eval(Container.DataItem,"flag")) %>'
                                                            runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblFamily" runat="server" Text='<%# Family(DataBinder.Eval(Container.DataItem,"type")) %>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:Label ID="lblReqNot" runat="server"></asp:Label>
                    <asp:ObjectDataSource ID="ODS_Nok" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="DS_SettingTableAdapters.Home_RequestTableAdapter">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="" Name="email" SessionField="MY-UsErNaMe" Type="String" />
                            <asp:Parameter DefaultValue="2" Name="index" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
                <div class="title">
                    درخواست های در حال انتظار</div>
                <div style="float: right;">
                    <div style="border: 1px solid #ccc; -moz-border-radius: 5px; -webkit-border-radius: 5px;
                        margin-top: 2px; border-radius: 5px; width: 733px;">
                        <table class="style6">
                            <tr style="color: #397D8B;">
                                <td>
                                    <div class="subTitle">
                                        در خواست های دوستی آمده
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:ObjectDataSource ID="ODS_Request" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="DS_SettingTableAdapters.Home_RequestTableAdapter">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                                            <asp:Parameter DefaultValue="3" Name="index" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                    <asp:Label ID="lblReqFriends" runat="server"></asp:Label>
                                    <asp:DataList ID="Dl_Request" runat="server" DataSourceID="ODS_Request" RepeatColumns="1"
                                        RepeatDirection="Horizontal" Width="721px">
                                        <ItemTemplate>
                                            <div style="width: 725px;">
                                                <div style="float: right; width: 680px;">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton1" runat="server"
                                                                    CommandArgument='<%# Eval("user","{0}") %>' Height="35px" Width="35px" ImageUrl='<%# UserImage(DataBinder.Eval(Container.DataItem,"user")) %>'
                                                                    OnCommand="Redirect" Style="border: 1px dotted #ccc;" />
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblName" runat="server" Text='<%# Name_(DataBinder.Eval(Container.DataItem,"user")) %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div style="float: right; padding-top: 10px;">
                                                    <table style="width: 100%;">
                                                        <tr>
                                                            <td>
                                                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton3" runat="server"
                                                                    CommandArgument='<%# Eval("id","{0}")+"|"+Eval("user","{0}") %>' ImageUrl="~/content/images/Home/dot.gif"
                                                                    OnCommand="AcceptFlag" />
                                                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton2" runat="server"
                                                                    CommandArgument='<%# Eval("id","{0}") %>' ImageUrl="~/content/images/Home/deleteWork.jpg"
                                                                    OnCommand="DenyFlag" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblAcceptDate" runat="server" Text='<%# AcceptDenyDate(DataBinder.Eval(Container.DataItem,"DateResponse"),DataBinder.Eval(Container.DataItem,"flag")) %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </td>
                            </tr>
                            <tr style="color: #397D8B;">
                                <td>
                                    <div class="subTitle">
                                        در خواست های دوستی ارسال شده
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="DG_Relation_Wait" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                        DataSourceID="ODS_RelationWaiting" ForeColor="#333333" GridLines="None" ShowHeader="False">
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <div style="border-bottom: 1px solid #E6E6E6; -moz-border-radius: 7px; margin-top: 2px;
                                                        width: 717px;">
                                                        <table class="style6">
                                                            <tr>
                                                                <td class="style13">
                                                                    <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton5" OnCommand="Redirect"
                                                                        CommandArgument='<%# Eval("user","{0}") %>' Style="border: 1px dotted #ccc;"
                                                                        ImageUrl='<%# UserImage(DataBinder.Eval(Container.DataItem,"user")) %>' runat="server"
                                                                        Height="35px" Width="35px" />
                                                                </td>
                                                                <td class="style14">
                                                                    <asp:Label ID="Label11" runat="server" Text='<%# TextFriend(DataBinder.Eval(Container.DataItem,"user")) %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton7" OnCommand="DeleteRelationWaiting"
                                                                        CommandArgument='<%# Eval("id","{0}") %>' runat="server" ImageUrl="~/content/images/Home/deleteWork.jpg" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#999999" />
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    </asp:GridView>
                                    <asp:Label ID="lbl_Relation_Wait" runat="server"></asp:Label>
                                    <asp:ObjectDataSource ID="ODS_RelationWaiting" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="DS_View_UsersTableAdapters.Relationship_WaitingTableAdapter">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div style="border: 1px solid #ccc; -moz-border-radius: 5px; -webkit-border-radius: 5px;
                        border-radius: 5px; margin-top: 3px; width: 733px;">
                        <table class="style6">
                            <tr style="color: #397D8B;">
                                <td>
                                    <div class="subTitle">
                                        در خواست های فامیلی آمده
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:ObjectDataSource ID="ODS_Family" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="DS_SettingTableAdapters.Profile_TempFamily_SelectTableAdapter">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="emailto" SessionField="MY-UsErNaMe" Type="String" />
                                        </SelectParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="EmailFrom" Type="String" />
                                            <asp:Parameter Name="EmailTo" Type="String" />
                                            <asp:Parameter Name="Type" Type="Int32" />
                                        </InsertParameters>
                                    </asp:ObjectDataSource>
                                    <asp:Label ID="lblReqFamily" runat="server"></asp:Label>
                                    <asp:DataList ID="Dl_TempFamily" runat="server" DataSourceID="ODS_Family" Width="714px">
                                        <ItemTemplate>
                                            <div style="border-bottom: 1px solid #E6E6E6; -moz-border-radius: 5px; -webkit-border-radius: 5px;
                                                border-radius: 5px; margin-top: 2px;">
                                                <table class="style6">
                                                    <tr>
                                                        <td class="style13">
                                                            <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton5" OnCommand="Redirect"
                                                                CommandArgument='<%# Eval("emailfrom","{0}") %>' runat="server" Height="35px"
                                                                ImageUrl='<%# UserImage(DataBinder.Eval(Container.DataItem,"emailfrom")) %>'
                                                                Style="border: 1px dotted #ccc;" Width="35px" />
                                                        </td>
                                                        <td class="style14">
                                                            <asp:Label ID="lblTextfamily" runat="server" Style="font-weight: normal;" Text='<%# ControlText(DataBinder.Eval(Container.DataItem,"emailfrom"),DataBinder.Eval(Container.DataItem,"type")) %>'></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton6" runat="server"
                                                                CommandArgument='<%# Eval("type","{0}")+"|"+Eval("ID_Relation","{0}")+"|"+Eval("id","{0}")+"|"+Eval("emailfrom","{0}") %>'
                                                                ImageUrl="~/content/images/Home/dot.gif" OnCommand="UpdateRelation" />
                                                        </td>
                                                        <td>
                                                            <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton7" runat="server"
                                                                CommandArgument='<%# Eval("id","{0}") %>' ImageUrl="~/content/images/Home/deleteWork.jpg"
                                                                OnCommand="DeleteTempFamily" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </td>
                            </tr>
                            <tr style="color: #397D8B;">
                                <td>
                                    <div class="subTitle">
                                        در خواست های فامیلی ارسال شده
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblFamilyWait" runat="server"></asp:Label>
                                    <asp:ObjectDataSource ID="ODS_FamilyWaiting" runat="server" InsertMethod="Insert"
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_View_UsersTableAdapters.Family_WaitingTableAdapter">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="emailfrom" SessionField="MY-UsErNaMe" Type="String" />
                                        </SelectParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="emailto" Type="String" />
                                            <asp:Parameter Name="type" Type="Int32" />
                                        </InsertParameters>
                                    </asp:ObjectDataSource>
                                    <asp:GridView ID="DG_Family_Wait" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                        DataSourceID="ODS_FamilyWaiting" ForeColor="#333333" GridLines="None" ShowHeader="False">
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <div style="border-bottom: 1px solid #E6E6E6; -moz-border-radius: 5px; -webkit-border-radius: 5px;
                                                        border-radius: 5px; margin-top: 2px; width: 717px;">
                                                        <table class="style6">
                                                            <tr>
                                                                <td class="style13">
                                                                    <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton5" OnCommand="Redirect"
                                                                        CommandArgument='<%# Eval("emailto","{0}") %>' Style="border: 1px dotted #ccc;"
                                                                        ImageUrl='<%# UserImage(DataBinder.Eval(Container.DataItem,"emailto")) %>' runat="server"
                                                                        Height="35px" Width="35px" />
                                                                </td>
                                                                <td class="style14">
                                                                    <asp:Label ID="Label11" runat="server" Text='<%# TextFamily(DataBinder.Eval(Container.DataItem,"emailto"),DataBinder.Eval(Container.DataItem,"type")) %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton7" OnCommand="DeleteFamilyWaiting"
                                                                        CommandArgument='<%# Eval("id","{0}") %>' runat="server" ImageUrl="~/content/images/Home/deleteWork.jpg" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#999999" />
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="V_Delete" runat="server">
                <div style="background-color: #F2F2F2; height: 14px; padding: 2px; float: right;color:#4A4A4A;
                    width: 727px; margin-top: 3px; -moz-border-radius: 3px; -webkit-border-radius: 3px;border:1px solid #E4E4E4;
                    border-radius: 3px; padding: 4px;">
                    حذف ارتباط</div>
                <div style="float: right; width: 100%;">
                    <table>
                        <tr>
                            <td>
                                کاربر محترم;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDecrease" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="color: red;">
                                <asp:Label ID="lblDelete" runat="server" Text="مبلغ فوق بلافاصله پس از قطع ارتباط از موجودی شما کسر می شود. "></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="float: right; text-align: center;">
                    <table style="width: 100%;">
                        <tr>
                            <td style="width: 162px;">
                                آیا با قطع این ارتباط هستید؟
                            </td>
                            <td style="width: 37px;">
                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnAcceptToDelete" runat="server"
                                    ImageUrl="~/content/images/Home/AcceptIt.jpg" />
                            </td>
                            <td>
                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnCancelToDelete" runat="server"
                                    ImageUrl="~/content/images/Home/CancelIt.jpg" />
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:View>
            <asp:View ID="View1" runat="server">
                <div id="DIV_User" runat="server" style="float: right;">
                    <table class="style6">
                        <tr>
                            <td class="style11">
                                درجه فامیلی:
                            </td>
                            <td>
                                <asp:DropDownList ID="cmb" runat="server" class="selectbox" ClientIDMode="Static"
                                    name="Items" Style="font-family: Tahoma; font-size: 11px">
                                    <asp:ListItem>-</asp:ListItem>
                                    <asp:ListItem Value="0">دوست</asp:ListItem>
                                    <asp:ListItem Value="1">زن و شوهر</asp:ListItem>
                                    <asp:ListItem Value="2">پدر و دختر</asp:ListItem>
                                    <asp:ListItem Value="3">پدر و پسر</asp:ListItem>
                                    <asp:ListItem Value="4">مادر و دختر</asp:ListItem>
                                    <asp:ListItem Value="5">مادر و پسر</asp:ListItem>
                                    <asp:ListItem Value="6">برادر و برادر</asp:ListItem>
                                    <asp:ListItem Value="7">برادر و خواهر</asp:ListItem>
                                    <asp:ListItem Value="8">خواهر و خواهر</asp:ListItem>
                                    <asp:ListItem Value="9">پسر خاله و پسر خاله</asp:ListItem>
                                    <asp:ListItem Value="10">پسر خاله و دختر خاله</asp:ListItem>
                                    <asp:ListItem Value="11">دختر خاله و دختر خاله</asp:ListItem>
                                    <asp:ListItem Value="12">خاله و خواهرزاده</asp:ListItem>
                                    <asp:ListItem Value="13">دایی و خواهرزاده</asp:ListItem>
                                    <asp:ListItem Value="14">پسرعمو و پسرعمو</asp:ListItem>
                                    <asp:ListItem Value="15">پسرعمو و دخترعمو</asp:ListItem>
                                    <asp:ListItem Value="16">دخترعمو و دخترعمو</asp:ListItem>
                                    <asp:ListItem Value="17">عمو و برادرزاده</asp:ListItem>
                                    <asp:ListItem Value="18">پسرعمه و پسردایی</asp:ListItem>
                                    <asp:ListItem Value="19">پسرعمه و دختردایی</asp:ListItem>
                                    <asp:ListItem Value="20">دخترعمه و پسردایی</asp:ListItem>
                                    <asp:ListItem Value="21">دخترعمه و دختردایی</asp:ListItem>
                                    <asp:ListItem Value="22">عمه و برادرزاده</asp:ListItem>
                                    <asp:ListItem Value="23">مادبزرگ مادری و نوه</asp:ListItem>
                                    <asp:ListItem Value="24">پدربزرگ مادری و نوه</asp:ListItem>
                                    <asp:ListItem Value="25">مادربزرگ پدری و نوه</asp:ListItem>
                                    <asp:ListItem Value="26">پدربزرگ پدری و نوه</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style12">
                                &nbsp;
                            </td>
                            <td class="style10">
                                <asp:Image runat="server" ForeColor="Transparent" ID="ImgfamilyName" runat="server"
                                    Height="60px" Width="60px" />
                                <asp:Label runat="server" ForeColor="Transparent" ID="lblType" runat="server" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                برای کاربر:
                            </td>
                            <td>
                                <asp:Label ID="lblfamilyName" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                            </td>
                            <td>
                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnSendFamily" runat="server"
                                    ImageUrl="~/content/images/Profile_View_Users/btnSend.jpg" Style="height: 21px" />
                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnCancel" runat="server"
                                    ImageUrl="~/content/images/Profile_View_Users/cancelSend.jpg" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                &nbsp;
                            </td>
                            <td>
                                <asp:Label ID="lblEmpty" runat="server" Style="color: #CC0000; direction: ltr"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="DIV_Duplicate" runat="server" class="DIVDuplicate">
                    <asp:Label ID="lblDuplicate" runat="server" Style="color: #CC0000" Text="شما قبلا برای این کاربر درخواست فرستاده اید لطفا تا پاسخ این کاربر صبر کنید."></asp:Label>
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
