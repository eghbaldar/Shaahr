<%@ Page Language="VB" MasterPageFile="~/home/Home.master" AutoEventWireup="false"
    CodeFile="AllObj.aspx.vb" Inherits="home_AllObj" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .PageS, PageS td
        {
            text-decoration: none;
            color: #687680;
            font-weight: bold;
            background-color: #E4E4E4;
        }
        .PageS a
        {
            font-size: 11px;
            text-decoration: none;
            color: #A9A9A9;
            background-color: #E9E9E9;
            padding: 1px;
        }
    </style>
    <%----------------------BtnShaahr------------------------%>
    <style type="text/css">
        .BtnShaahr
        {
            background-color: #f4f4f4;
            border: 1px solid #ccc;
            padding: 5px;
            color: Black;
            font-family: Tahoma;
            font-size: 11px;
            cursor: pointer;
            -moz-border-radius: 4px;
        }
    </style>
    <%--    -----------------------------------------------%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 729px;">
            همه مطالب اشتراکی
        </div>
        <div style="float: right; margin-top: 2px;">
            <asp:GridView ID="DG" runat="server" AutoGenerateColumns="False" DataKeyNames="code"
                DataSourceID="ODS" AllowPaging="True" GridLines="None" ShowHeader="False">
                <PagerStyle CssClass="PageS" />
                <Columns>
                    <asp:TemplateField HeaderText="code" InsertVisible="False" SortExpression="code">
                        <ItemTemplate>
                            <div style="background-color: #F7F7F7; border-bottom: 2px solid #e9e9e9;">
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="width: 20px;">
                                            <asp:ImageButton ID="imgAvatar" runat="server" ForeColor="Transparent" OnCommand="RedirectFriend"
                                                CommandArgument='<%# Eval("email","{0}") %>' runat="server" Height="40px" ImageUrl='<%# "~/user/Crop.aspx?P="+ Eval("PicPath","{0}")+"&W=45&H=45" %>'
                                                Style="-moz-border-radius: 5px;" Width="40px" />
                                        </td>
                                        <td style="width: 700px;">
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label3" runat="server" Style="font-family: Tahoma; font-size: 12px;
                                                            color: #457387" Text='<%# PostName(DataBinder.Eval(Container.DataItem,"Email"),DataBinder.Eval(Container.DataItem,"For_who")) %>'>
                                                        </asp:Label>
                                                        <asp:Label ID="lblCode_Object" runat="server" Text='<%# Eval("code", "{0}") %>' Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                                                        (<asp:Label ID="Label4" runat="server" Text='<%# Eval("time", "{0}") %>'></asp:Label>
                                                        )
                                                        <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email", "{0}") %>' Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Image ID="Image1" runat="server" ForeColor="Transparent" ImageUrl='<%# ControlImage(DataBinder.Eval(Container.DataItem,"type")) %>'
                                                            runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                                <div style="text-align: left; padding: 5px;">
                                    <asp:Button ID="ButtonShaahr" CssClass="BtnShaahr" Text="نمایش پست" runat="server"
                                        OnCommand="RecirectPost" CommandArgument='<%# Eval("email","{0}")+"|"+Eval("code","{0}") %>' />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ODS" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" TypeName="DS_HomeProfileTableAdapters.Home_UpdateNewsAllTableAdapter">
                <SelectParameters>
                    <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
