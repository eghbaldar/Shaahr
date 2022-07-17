<%@ Page Language="VB" MasterPageFile="~/Stage/Jiring/Home.master" AutoEventWireup="false"
    CodeFile="CycleJiring.aspx.vb" Inherits="Stage_Jiring_Default2" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        @font-face
        {
            font-family: titr;
            src: url(    "./../../content/font/BTitrBd.ttf" );
        }
        .style3
        {
            width: 97px;
        }
        .style3
        {
            color: #FF0000;
        }
        .style4
        {
            color: #006600;
        }
        .style5
        {
            width: 141px;
        }
        .style6
        {
            width: 55px;
            text-align: left;
        }
        .style7
        {
            color: #FF0000;
            width: 637px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="DivTopContext" style="width: 737px;">
        <div class="DivTop" style="width: 729px;">
            گردش حساب کاربران
        </div>
        <div style="width: 744px; float: right;">
            <div style="width: 744px; height: 50px; margin-top: 3px;">
                <div style="float: right;">
                    <img src="../../content/images/Stage/Jiring/MyJiring.jpg" />
                </div>
                <div style="float: right; height: 50px;">
                    <table class="style1">
                        <tr>
                            <td>
                                اعتبار شما:<br />
                                <a href="pay.aspx" style="color: Gray; text-decoration: none;">( افزایش موجودی )</a>
                            </td>
                            <td>
                                <asp:Label ID="lblJiring" runat="server" ForeColor="Black"></asp:Label>
                                <img alt="" src="../../Content/images/Stage/Jiring/JiringSymbol.png" style="width: 9px;
                                    height: 9px" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div style="width: 731px; border-bottom: 1px solid #ccc; height: 1px;">
            </div>
        </div>
        <div style="width: 744px; padding: 5px; float: right;">
            <table class="style1">
                <tr>
                    <td class="style5">
                        کل جیرینگ <span class="style4">افزایش</span> داده شده:
                    </td>
                    <td class="style6">
                        <asp:Label ID="lblSumIncrease" runat="server"></asp:Label>
                    </td>
                    <td>
                        <img alt="" src="../../Content/images/Stage/Jiring/JiringSymbol.png" style="width: 9px;
                            height: 9px" />
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        کل جیرینگ <span class="style3">کاهش</span> یافته شده:
                    </td>
                    <td class="style6">
                        <asp:Label ID="lblSumDecrease" runat="server"></asp:Label>
                    </td>
                    <td>
                        <img alt="" src="../../Content/images/Stage/Jiring/JiringSymbol.png" style="width: 9px;
                            height: 9px" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="width: 731px; border-bottom: 1px solid #ccc; height: 1px; float: right;">
        </div>
        <div style="width: 744px; padding: 5px; float: right;">
            <asp:DataList ID="Dl" runat="server" DataSourceID="ODS" Width="744px">
                <ItemTemplate>
                    <table class="style1">
                        <tr>
                            <td class="style7">
                                <asp:Label ID="SubjectLabel" runat="server" Text='<%# Eval("Subject") %>' Style="color: #000000" />
                            </td>
                            <td>
                                <asp:Image ID="Image1" runat="server" ForeColor="Transparent" ImageUrl='<%# IIF(Eval("type")=0,"~\content\images\stage\jiring\decrease.jpg","~\content\images\stage\jiring\increase.jpg") %>'
                                    runat="server" />
                                <asp:Label ID="jiringLabel" runat="server" Text='<%# Eval("jiring") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                <asp:Label ID="Label1" runat="server" Style="color: #666666; font-style: italic"
                                    Text='<%# Eval("date", "{0}") %>'></asp:Label>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            <asp:ObjectDataSource ID="ODS" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" TypeName="DS_StageTableAdapters.Factor_Jiring_UsersTableAdapter">
                <SelectParameters>
                    <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:Label ID="lbl" runat="server"></asp:Label>
        </div>
        <div style="width: 731px; border-bottom: 1px solid #ccc; height: 1px; float: right;">
        </div>
        <div style="width: 744px; padding: 5px; float: right;">
            <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnClear" runat="server"
                        ImageUrl="~/content/images/Stage/Jiring/ClearList.jpg" />
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <div style="margin-top: 5px; height: 25px; padding: 5px; background-color: #f6f6f6;
                        margin-right: 110px; border-bottom: 1px solid #84949a; border-top: 1px solid #84949a;
                        width: 520px;">
                        <div style="float: right; margin-top: 8px;">
                            <img src="../../content/images/Home/info.gif" />
                        </div>
                        <div style="float: right; margin-right: 5px;">
                            <table style="width: 100%;">
                                <tr>
                                    <td class="style11">
                                        آیا با پاکسازی این لیست موافق هستید؟
                                    </td>
                                    <td class="style12">
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
                        <div style="margin-top: 50px; float: right;">
                        </div>
                    </div>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
</asp:Content>
