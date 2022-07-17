<%@ Control Language="VB" AutoEventWireup="false" CodeFile="DefaultShaahrMenu.ascx.vb"
    Inherits="UserControl_Shaahr_DefaultShaahrMenu" %>
<table style="width: 100%;">
    <tr>
        <td>
            <a class="tooltip_" title='<%= TextMenu("ADD") %>' style="text-decoration: none;
                border: 0px; font-family: Tahoma; color: White;">
                <asp:ImageButton ForeColor="Transparent" 
                        AlternateText=""  ImageUrl="~/Content/images/Shaahrs/Root/mnu_add.png" ID="btnADD"
                    runat="server" />
            </a>
        </td>
        <td>
            <a class="tooltip_" title='<%= TextMenu("LAW") %>' style="text-decoration: none;
                border: 0px; font-family: Tahoma; color: White;">
                <asp:ImageButton ForeColor="Transparent" 
                        AlternateText=""  ImageUrl="~/Content/images/Shaahrs/Root/mnu_law.png" ID="btnLaw"
                    runat="server" />
            </a>
        </td>
        <td>
            <a class="tooltip_" title='<%= TextMenu("Rank") %>' style="text-decoration: none;
                border: 0px; font-family: Tahoma; color: White;">
                <asp:ImageButton ForeColor="Transparent" 
                        AlternateText=""  ImageUrl="~/Content/images/Shaahrs/Root/mnu_star.png" ID="btnRank"
                    runat="server" />
            </a>
        </td>
    </tr>
    <tr>
        <td>
            <a class="tooltip_" title='<%= TextMenu("SEARCH") %>' style="text-decoration: none;
                border: 0px; font-family: Tahoma; color: White;">
                <asp:ImageButton ForeColor="Transparent" 
                        AlternateText=""  ImageUrl="~/Content/images/Shaahrs/Root/mnu_search.png" ID="btnSearch"
                    runat="server" />
            </a>
        </td>
        <td>
            <a class="tooltip_" title='<%= TextMenu("ENTER") %>' style="text-decoration: none;
                border: 0px; font-family: Tahoma; color: White;">
                <asp:ImageButton ForeColor="Transparent" 
                        AlternateText=""  ImageUrl="~/Content/images/Shaahrs/Root/mnu_enterAuth.png" ID="btnEnter"
                    runat="server" />
            </a>
        </td>
        <td>
            <a class="tooltip_" title='<%= TextMenu("SHAAHRS") %>' style="text-decoration: none;
                border: 0px; font-family: Tahoma; color: White;">
                <asp:ImageButton ForeColor="Transparent" 
                        AlternateText=""  ImageUrl="~/Content/images/Shaahrs/Root/mnu_shaahrs.png" ID="btnShaahr"
                    runat="server" />
            </a>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;&nbsp;
        </td>
    </tr>
</table>
