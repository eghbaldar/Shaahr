<%@ Control Language="VB" AutoEventWireup="false" CodeFile="TopTextLogo.ascx.vb"
    Inherits="UserControl_Root_TopTextLogo" %>
<div id="logoNav">
    <asp:ImageButton ForeColor="Transparent" AlternateText="" ID="img" runat="server"
        Height="38px" Width="80px" />
</div>
<div id="textNav">
    <div style="width: 207px; padding-top: 10px;">
        <asp:Label ID="lbl" runat="server" Style="font: 11px tahoma;" Text="Label"></asp:Label>
    </div>
</div>
