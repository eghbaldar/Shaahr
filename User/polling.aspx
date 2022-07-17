<%@ Page Language="VB" MasterPageFile="~/user/User.master" AutoEventWireup="false"
    CodeFile="polling.aspx.vb" Inherits="user_polling" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style5
        {
            width: 100%;
        }
        .style6
        {
            height: 17px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="Pnl_polling" runat="server">
        <div id="Div_InfoPersonal" runat="server" style="color: Gray; float: right; width: 540px;
            height: 220px; padding: 3px; height: 100%; border: solid #dedede 1px; -moz-border-radius: 5px;
            font-family: Tahoma; font-size: 11px;">
            <div class="DivTop">
                نظرسنجی ها
            </div>
            <div style="font-family: Tahoma; font-size: 11px;">
                <table class="style5">
                    <tr>
                        <td>
                            <asp:DataList ID="DL_Polloing" runat="server" DataKeyField="code" DataSourceID="ODS_Polling"
                                Width="540px">
                                <ItemTemplate>
                                    <table class="style5">
                                        <tr>
                                            <td class="style6">
                                                <div style="background-color: #f1f6f8; -moz-border-radius: 3px; border: 1px solid #D7E2E8;
                                                    padding: 3px; height: 100%;">
                                                    <div style="float: right; width: 505px; height: 20px;">
                                                        <h1 style="font-weight: normal; font-size: 11px;">
                                                            <asp:Label ID="questionLabel" runat="server" Text='<%# Eval("question") %>' Style="font-size: 12px;
                                                                color: #333333;" />
                                                        </h1>
                                                        <asp:Label ID="codePolling" runat="server" Text='<%# Eval("code", "{0}") %>' Visible="False"></asp:Label>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="pictureLabel" runat="server" Text='<%# Eval("picture") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <h1 style="font-weight: normal; font-size: 10px;">
                                                    <asp:Label ID="detailLabel" runat="server" Text='<%# Eval("detail") %>' />
                                                </h1>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                    <ContentTemplate>
                                                        <asp:DataList ID="Dl_option" runat="server" DataSourceID="ODS_ParticipatePolling"
                                                            Width="512px" RepeatDirection="Vertical">
                                                            <ItemTemplate>
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Literal ID="Literal1" Text='<%# SetPercent(DataBinder.Eval(Container.DataItem,"CodeOption"),DataBinder.Eval(Container.DataItem,"code_polling"),DataBinder.Eval(Container.DataItem,"option")) %>'
                                                                                runat="server"></asp:Literal>
                                                                        </td>
                                                                        <td>
                                                                            <asp:ImageButton runat="server" ForeColor="Transparent" OnCommand="SetOption" CommandArgument='<%# Eval("codeoption","{0}")+"|"+Eval("code_polling","{0}") %>'
                                                                                Visible='<%# iif(Session("MY-UsErNaMe")="",False,True) %>' ImageUrl='<%# IIF(Eval("tik")=1,"~\content\images\Profile_View_Users\Tik_Animation.gif","~\content\images\Profile_View_Users\NotTik.jpg") %>'
                                                                                ID="ImageButton2" runat="server" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                        <asp:ObjectDataSource ID="ODS_ParticipatePolling" runat="server" OldValuesParameterFormatString="original_{0}"
                                                            SelectMethod="GetData" TypeName="DS_View_Users_SectionsTableAdapters.Profile_ShowPollingTableAdapter"
                                                            OnSelecting="ODS_ParticipatePolling_Selecting">
                                                            <SelectParameters>
                                                                <asp:Parameter Name="email" Type="String" />
                                                                <asp:ControlParameter ControlID="codePolling" Name="code_polling" PropertyName="Text"
                                                                    Type="Int64" />
                                                            </SelectParameters>
                                                        </asp:ObjectDataSource>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                                <asp:UpdateProgress AssociatedUpdatePanelID="UpdatePanel1" ID="UpdateProgress1" runat="server">
                                                    <ProgressTemplate>
                                                        <img src="../content/images/Profile_View_Users/Loading_0.gif" />
                                                        نظر شما در حال ثبت شدن است...
                                                    </ProgressTemplate>
                                                </asp:UpdateProgress>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                                <asp:DataList ID="Dl_user" runat="server" DataSourceID="ODS_UserParticipate" RepeatColumns="15"
                                                    RepeatDirection="Horizontal">
                                                    <ItemTemplate>
                                                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton32" runat="server"
                                                            BorderColor="#CCCCCC" BorderWidth="1px" OnCommand="RedirectFriend" CommandArgument='<%# Eval("email","{0}") %>'
                                                            Height="25px" ImageUrl='<%# "~/user/Crop.aspx?P="+Eval("picpath", "{0}")+"&W=30&H=30" %>'
                                                            Width="25px" />
                                                    </ItemTemplate>
                                                </asp:DataList>
                                                <asp:ObjectDataSource ID="ODS_UserParticipate" runat="server" InsertMethod="Insert"
                                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_View_Users_SectionsTableAdapters.Profile_UserParticipatePollingTableAdapter">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="codePolling" Name="code_polling" PropertyName="Text"
                                                            Type="Int64" />
                                                    </SelectParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="email" Type="String" />
                                                        <asp:Parameter Name="picpath" Type="String" />
                                                    </InsertParameters>
                                                </asp:ObjectDataSource>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                            <asp:ObjectDataSource ID="ODS_Polling" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_View_Users_SectionsTableAdapters.Profile_PollingTableAdapter"
                                UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_code" Type="Int64" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="code_object" Type="Int64" />
                                    <asp:Parameter Name="question" Type="String" />
                                    <asp:Parameter Name="picture" Type="String" />
                                    <asp:Parameter Name="detail" Type="String" />
                                    <asp:Parameter Name="flag" Type="Boolean" />
                                    <asp:Parameter Name="cause_disible" Type="String" />
                                    <asp:Parameter Name="Original_code" Type="Int64" />
                                </UpdateParameters>
                                <SelectParameters>
                                    <asp:Parameter Name="email" Type="String" />
                                </SelectParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="code_object" Type="Int64" />
                                    <asp:Parameter Name="question" Type="String" />
                                    <asp:Parameter Name="picture" Type="String" />
                                    <asp:Parameter Name="detail" Type="String" />
                                    <asp:Parameter Name="flag" Type="Boolean" />
                                    <asp:Parameter Name="cause_disible" Type="String" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPolling" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
            <div runat="server" id="Div_Polling" style="-moz-border-radius: 2px; background-color: #f7f7f7;
                margin-top: 2px; border: 1px solid #dbdfe2; margin-right: 7px; width: 520px;
                text-align: center; height: 20px; font-family: Tahoma; font-size: 11px; color: White;
                padding: 3px;">
                <asp:LinkButton ID="btnShowAllPolling" runat="server" Style="text-decoration: none;
                    color: Gray;">مشاهده تمام نظرسنجی ها</asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Content>
