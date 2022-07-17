<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Plus.ascx.vb" Inherits="UserControl_Home_Plus" %>
<asp:Panel ID="PnlRelationship" runat="server">
    <div style="border: 2px solid #c2c2c2; width: 105px; height: 41px; margin-top: 3px;
        margin-right: -4px; -moz-border-radius: 6px; background-color: #e7e7e7;">
        <table class="style2">
            <tr>
                <td>
                    <asp:Image ForeColor="Transparent" AlternateText="" ID="imgOwnerProfile" runat="server"
                        Width="32px" Height="32px" />
                </td>
                <td>
                    <asp:ImageButton ForeColor="Transparent" AlternateText="" ID="imgPlus" runat="server"
                        ImageUrl="~/content/images/Profile_View_Users/plus.png" />
                </td>
                <td>
                    <asp:Image ForeColor="Transparent" AlternateText="" ID="imgViwerProfile" runat="server"
                        Width="32px" Height="32px" />
                </td>
            </tr>
        </table>
    </div>
</asp:Panel>
