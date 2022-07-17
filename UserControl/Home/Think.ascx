<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Think.ascx.vb" Inherits="UserControl_Home_Think" %>
<asp:UpdatePanel ID="Up_Think" runat="server">
    <ContentTemplate>
        <div id="desktop_think_title">
            <div style="float: right;">
                <img src="../content/images/Home/Talk.png" /></div>
            <table style="width: 100%; color: Black;">
                <tr>
                    <td style="width: 70px;">
                        در ذهن من...
                    </td>
                    <td style="width: 50px; padding: 3px;">
                        <div style="border: 1px solid #dfdfdf; width: 44px; padding-right: 4px; padding-bottom: 4px;
                            -moz-border-radius: 3px;">
                            <asp:LinkButton ID="btnNewThink" Style="text-decoration: none; color: Gray;" runat="server">فکر جدید</asp:LinkButton>
                        </div>
                    </td>
                    <td style="width: 50px;">
                        <div style="border: 1px solid #dfdfdf; width: 35px; padding-right: 4px; padding-bottom: 4px;
                            -moz-border-radius: 3px;">
                            <asp:LinkButton ID="btnEditThink" Style="text-decoration: none; color: Gray;" runat="server">ویرایش</asp:LinkButton>
                        </div>
                    </td>
                    <td>
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="Up_Think">
                            <ProgressTemplate>
                                <img src="../content/images/Profile_View_Users/Loading_0.gif" />
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </td>
                </tr>
            </table>
        </div>
        <div id="desktop_think_content">
            <div style="float: right; width: 457px; margin-right: -28px; margin-top: 5px;">
                <h1 style="font-weight: normal;">
                    <asp:TextBox ID="txtThink" runat="server" Height="30px" Width="445px" TextMode="MultiLine"
                        Style="border: 1px solid #ccc; resize: none; background-color: #FCFCFC; padding: 3px;"
                        Enabled="False" Font-Names="Tahoma" Font-Size="11px" MaxLength="10"></asp:TextBox>
                </h1>
            </div>
            <div style="float: right; width: 6px; margin-top: 6px;">
                <asp:ImageButton ForeColor="Transparent" AlternateText="" ID="btnUpdateThink" runat="server"
                    ImageUrl="~/content/images/Home/EditThink.png" />
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
