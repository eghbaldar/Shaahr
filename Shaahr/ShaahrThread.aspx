<%@ Page Language="VB" MasterPageFile="~/Shaahr/Subshaahr.master" AutoEventWireup="false"
    CodeFile="ShaahrThread.aspx.vb" Inherits="Shaahr_Default2" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        @font-face
        {
            font-family: koodak;
            src: url(                                   "../content/font/W_koodak.TTF" );
        }
        .style3
        {
            width: 349px;
        }
        .style5
        {
            width: 474px;
        }
        .style6
        {
            width: 44px;
        }
        .style10
        {
            width: 100%;
        }
        .style11
        {
            width: 449px;
        }
        .style12
        {
            width: 193px;
        }
        .style13
        {
            width: 52px;
        }
        .style14
        {
            width: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CenterContent" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <div style="-moz-border-radius: 3px; border: 2px solid #E6E6E6; padding: 3px;">
                    <asp:DataList ID="DL_Post" runat="server" DataKeyField="Code" DataSourceID="ODS_Posts"
                        Width="724px">
                        <ItemTemplate>
                            <div style="background-color: #F8F8F8; border-bottom: 1px solid #ccdbe3;">
                                <table class="style10">
                                    <tr>
                                        <td class="style11">
                                            <table class="style10">
                                                <tr>
                                                    <td class="style14">
                                                        <img alt="" src="../Content/images/Shaahrs/Root/post.png" style="width: 21px; height: 25px" />
                                                    </td>
                                                    <td>
                                                        <h1 style="font-weight: normal;">
                                                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("code","{0}") %>'
                                                                OnCommand="GotoShowThread" Style="font-family: koodak; font-size: 14px; text-decoration: none;
                                                                color: #587D8D;" Text='<%# Eval("Subject") %>'>
                                                            </asp:LinkButton>
                                                        </h1>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style14">
                                                        <img alt="" src="../Content/images/Shaahrs/Root/category.png" />
                                                    </td>
                                                    <td>
                                                        <h1 style="font-weight: normal;">
                                                            <asp:Label ID="Label2" runat="server" Style="color: #5f6162;" Text='<%# GetCat(DataBinder.Eval(Container.DataItem,"CodeCategory")) %>'></asp:Label>
                                                        </h1>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style14">
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="style12">
                                            <table class="style10">
                                                <tr>
                                                    <td>
                                                        <table class="style10">
                                                            <tr>
                                                                <td class="style13">
                                                                    گذارنده:
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label1" runat="server" Style="color: #00538A" Text='<%# GetFN(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style13">
                                                                    بازدیدها:
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="VisitLabel" runat="server" Style="font-weight: 700" Text='<%# GetVisit(DataBinder.Eval(Container.DataItem,"code")) %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style13">
                                                                    جواب ها:
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="VisitLabel0" runat="server" Style="font-weight: 700; color: #003399;"
                                                                        Text='<%# GetCountAnswer(DataBinder.Eval(Container.DataItem,"code")) %>' />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="dateLabel" runat="server" Style="color: #0099FF" Text='<%# Eval("date") %>' />
                                                        &nbsp;/
                                                        <asp:Label ID="TimeLabel" runat="server" Style="color: #0085DD" Text='<%# Eval("Time") %>' />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            <asp:Image runat="server" ForeColor="Transparent" ID="ImageButton5" runat="server"
                                                ImageUrl="~/Content/images/Shaahrs/Root/lock.png" Visible='<%# CheckLuckPost(DataBinder.Eval(Container.DataItem,"code")) %>' />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:ObjectDataSource ID="ODS_Posts" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Shaahr_ShaahrPostTableAdapter"
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
                            <asp:QueryStringParameter Name="codecategory" QueryStringField="cdT" Type="Int64" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Code" Type="Int64" />
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
                    <asp:Label ID="lblNotPost" runat="server" style="color: #666666"></asp:Label>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnNewThread" runat="server"
                    ImageUrl="~/Content/images/Shaahrs/Root/createPost.png" Visible="False" />
                <div runat="server" id="NotUser" visible="false">
                    <table style="width: 100%;">
                        <tr>
                            <td style="width: 5px;">
                                <img alt="" src="../Content/images/Home/info.gif" style="width: 14px; height: 14px" />
                            </td>
                            <td>
                                کاربر محترم برای استفاده از امکانات این شهر باید عضو شوید.
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
