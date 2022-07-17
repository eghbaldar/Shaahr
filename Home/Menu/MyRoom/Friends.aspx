<%@ Page Language="VB" MasterPageFile="~/home/Menu/MyRoom/Home.master" AutoEventWireup="false"
    CodeFile="Friends.aspx.vb" Inherits="home_Menu_MyRoom_Friends" Title="Untitled Page" %>

<%@ Register Assembly="DelayedSubmit" Namespace="DelayedSubmit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style6
        {
            width: 100%;
            height: 33px;
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
        .style8
        {
            width: 384px;
        }
        .style9
        {
            width: 6px;
        }
    </style>
     <style type="text/css">
        .PageS, PageS td
        {
            font-size: 11px;
            text-decoration: none;
            color: #687680;
            font-weight: bold;
        }
        .PageS a
        {
            font-size: 11px;
            text-decoration: none;
            color: #A9A9A9;
            padding: 1px;
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
        <div class="DivTop" style="width: 729px;">
            لیست دوستان
        </div>
        <div style="background-color: #ececec; border-bottom: 1px solid #ccc; height: 100%;
            padding: 2px; color: gray; float: right; margin-top: 3px; width: 732px;">
            <table class="style6">
                <tr>
                    <td class="style8">
                        <asp:RadioButton ID="RB_Farsi" runat="server" Text="براساس نام و نام خانوادگی فارسی"
                            Checked="True" GroupName="1" />
                        <asp:RadioButton ID="RB_Engilis" runat="server" Text="براساس نام و نام خانوادگی انگلیسی"
                            GroupName="1" />
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style8">
                        <asp:TextBox ID="txtSearch" Style="border: 1px solid #ccc; font-family: Tahoma; font-size: 11px;"
                            runat="server" Width="428px" AutoPostBack="True"></asp:TextBox>
                    </td>
                    <td>
                        <img alt="" src="../../../content/images/Home/Search.jpg" style="width: 26px; height: 17px" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="height: 100%; padding: 2px; float: right; margin-top: 1px; width: 732px;">
            <cc1:DelayedSubmitExtender ID="DisableButtonExtender1" runat="server" Timeout="1"
                TargetControlID="txtSearch" />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="DG" runat="server" AutoGenerateColumns="False" GridLines="None"
                        ShowHeader="False" AllowPaging="True" Width="732px" PageSize="30">
                        <PagerStyle CssClass="PageS" />
                        <Columns>
                            <asp:TemplateField HeaderText="user" SortExpression="user">
                                <ItemTemplate>
                                    <div style="border-bottom: 1px solid #ccc; width: 732px;">
                                        <table style="width: 100%">
                                            <tr>
                                                <td class="style9">
                                                    <asp:ImageButton  runat="server"
                                    ForeColor="Transparent"
                                    ID="ImageButton1" ImageUrl='<%# SetAvatar(DataBinder.Eval(Container.DataItem,"user")) %>'
                                                        runat="server" Height="60px" Width="60px" />
                                                </td>
                                                <td>
                                                    <div style="float: right;">
                                                        <div style="float: right; width: 700px;">
                                                            <asp:Label ID="Label1" runat="server" Text='<%# SetName(DataBinder.Eval(Container.DataItem,"user")) %>'></asp:Label>
                                                            <asp:Label ID="lblUser" runat="server" Text='<%# Eval("user","{0}") %>' Visible="False"></asp:Label>
                                                        </div>
                                                        <div style="float: right; padding-top: 4px;">
                                                            <asp:DataList ID="DataList1" runat="server" DataSourceID="ODS_Friends" RepeatColumns="10"
                                                                RepeatDirection="Horizontal">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="ImageButton2"  runat="server"
                                    ForeColor="Transparent"
                                    runat="server" Height="25px" ImageUrl='<%# "~/user/Crop.aspx?P=" + Eval("picpath","{0}") + "&W=30&H=30" %>'
                                                                        Width="25px" />
                                                                    <br />
                                                                    <br />
                                                                </ItemTemplate>
                                                            </asp:DataList>
                                                            <asp:ObjectDataSource ID="ODS_Friends" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                SelectMethod="GetData" TypeName="DS_SettingTableAdapters.MyFriendsTableAdapter">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="lblUser" Name="email" PropertyName="Text" Type="String" />
                                                                </SelectParameters>
                                                            </asp:ObjectDataSource>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="txtSearch" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
