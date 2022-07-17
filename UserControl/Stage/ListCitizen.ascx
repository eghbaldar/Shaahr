<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ListCitizen.ascx.vb"
    Inherits="UserControl_Stage_ListCitizen" %>
<asp:DataList ID="DG_Citizen" runat="server" RepeatColumns="3" RepeatDirection="Horizontal">
    <ItemTemplate>
        <table class="s1">
            <tr>
                <td class="s2">
                    <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton2" runat="server"
                        Height="90px" ImageUrl='<%# SetAvatar(DataBinder.Eval(Container.DataItem,"email")) %>'
                        Width="90px" />
                </td>
                <td>
                    <div style="text-align: right; width: 125px;">
                        <table class="s1">
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text='<%# SetTitle(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblDateBirth" runat="server" Style="color: #1a6788;" Text='<%# SetBirthDate(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblLocation" runat="server" Text='<%# SetLocation(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>
<asp:Button ID="btn_next" runat="server" Text="btn_next" />
<asp:Button ID="btn_pre" runat="server" Text="btn_pre" />
<asp:Button ID="btn_last" runat="server" Text="btn_last" />
<asp:Button ID="btn_frist" runat="server" Text="btn_frist" />