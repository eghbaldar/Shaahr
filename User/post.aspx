<%@ Page Language="VB" MasterPageFile="~/user/User.master" AutoEventWireup="false"
    CodeFile="post.aspx.vb" Inherits="user_post" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="Div_InfoPersonal" runat="server" style="color: Gray; float: right; width: 540px;
        height: 220px; padding: 3px; height: 100%; border: solid #dedede 1px; -moz-border-radius: 5px;
        font-family: Tahoma; font-size: 11px;">
        <div class="DivTop">
            پست ها
        </div>
        <div style="font-family: Tahoma; font-size: 11px; padding-top: 2px;">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="DG" runat="server" DataKeyNames="code" DataSourceID="ODS" ShowHeader="False"
                        AutoGenerateColumns="False" GridLines="None" Width="550px" AllowPaging="True"
                        PageSize="25">
                        <PagerStyle CssClass="PageS" />
                        <Columns>
                            <asp:TemplateField HeaderText="code" InsertVisible="False" SortExpression="code">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("code") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <div style="background-color: #e6f0f3; -moz-border-radius: 4px; border: 1px solid #ccc;height:100%;">
                                        <table class="style5">
                                            <tr>
                                                <td class="style7">
                                                    <h1 style="font-weight: normal; font-size: 11px;">
                                                        <asp:Image ID="Image1" runat="server" ForeColor="Transparent" ImageUrl='<%# ControlImage(DataBinder.Eval(Container.DataItem,"type")) %>'
                                                            runat="server" />
                                                        <h1 style="font-weight: normal; font-size: 11px;">
                                                </td>
                                                <td class="style6">
                                                    <h1 style="font-weight: normal; font-size: 11px;">
                                                        <asp:LinkButton ID="btnDetailPost" Style="color: #2D515D; text-decoration: none;"
                                                            OnCommand="DetailPost" CommandArgument='<%# Eval("code","{0}") %>' Text='<%# ControlText(DataBinder.Eval(Container.DataItem,"string_factor")) %>'
                                                            runat="server">LinkButton</asp:LinkButton>
                                                    </h1>
                                                </td>
                                                <td>
                                                    <h1 style="font-weight: normal; font-size: 11px;">
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("date", "{0}") %>' Style="color: #666666;
                                                            font-size: 10px;"></asp:Label>
                                                        <h1 style="font-weight: normal; font-size: 11px;">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="string_factor" SortExpression="string_factor">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("string_factor") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="date" SortExpression="date">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("date") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            پستی برای این کاربر وجود ندارد.
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <asp:UpdateProgress AssociatedUpdatePanelID="UpdatePanel1" ID="UpdateProgress1" runat="server">
                        <ProgressTemplate>
                            <img src="../content/images/Profile_View_Users/Loading_0.gif" />
                            پست ها در حال بارگذاری هستند...
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:ObjectDataSource ID="ODS" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_View_Users_SectionsTableAdapters.Profile_PostsTableAdapter"
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_code" Type="Int64" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="string_factor" Type="String" />
                    <asp:Parameter Name="_date" Type="String" />
                    <asp:Parameter Name="type" Type="Int32" />
                    <asp:Parameter Name="Original_code" Type="Int64" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="for_who" Type="String" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="string_factor" Type="String" />
                    <asp:Parameter Name="_date" Type="String" />
                    <asp:Parameter Name="type" Type="Int32" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
