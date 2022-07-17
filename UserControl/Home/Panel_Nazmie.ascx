<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Panel_Nazmie.ascx.vb"
    Inherits="UserControl_Home_Panel_Nazmie" %>
<style type="text/css">
    .style111
    {
        width: 100%;
        direction: ltr;
        text-align: right;
        color: #3B6475;
    }
    .style233
    {
        width: 194px;
        text-align: right;
    }
</style>
<div style="width: 210px;">
    <table class="style111">
        <tr>
            <td class="style233">
                <table class="style1">
                    <tr>
                        <td style="text-align: right">
                            <asp:ImageButton ID="imgNazmie" runat="server" ImageUrl="~/content/images/Stage/Nazmie/textNazmie.png" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="P_1" runat="server" Visible="false">
                                نظمیه واقعا چیزه خوبیه &nbsp;«
                            </asp:Panel>
                            <asp:Panel ID="P_2" runat="server" Visible="false">
                                واقعا چیزه خوبیه &nbsp;«
                            </asp:Panel>
                            <asp:Panel ID="P_3" runat="server" Visible="false">
                                نظمیه چیزه خوبیه &nbsp;«
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <asp:ImageButton ForeColor="Transparent" AlternateText="" ID="btnNazmie" runat="server"
                    ImageUrl="~/content/images/Stage/Nazmie/LogoNazmie.png" />
            </td>
        </tr>
    </table>
</div>
