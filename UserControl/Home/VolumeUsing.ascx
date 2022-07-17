<%@ Control Language="VB" AutoEventWireup="false" CodeFile="VolumeUsing.ascx.vb"
    Inherits="UserControl_Home_VolumeUsing" %>
<!-- Talk -->
<link href="../Content/js/Talk_Register/jquery.tooltip.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="../jquery.min.js"></script>

<script src="../Content/js/Talk_Register/jquery.tooltip.js" type="text/javascript"></script>

<style type="text/css">
    div.item
    {
        width: 100px;
    }
    div#item_1
    {
        position: absolute;
        top: 50px;
        left: 50px;
    }
    div#item_2
    {
        position: absolute;
        top: 500px;
        left: 0px;
    }
    div#item_3
    {
        position: absolute;
        top: 0px;
        left: 500px;
    }
    div#item_4
    {
        position: absolute;
        top: 500px;
        left: 500px;
    }
</style>

<script type="text/javascript">
      $j = jQuery.noConflict();
      $j(document).ready(function(){
        $j("div.item").tooltip();
      });
</script>

<!-- Talk -->
<table style="width: 100%;">
    <tr>
        <td>
            <div class="item">
                <asp:Literal ID="LProgress" runat="server"></asp:Literal>
                <div class="tooltip_description" style="display: none;">
                    <div style="direction: rtl;" >
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <asp:Label ID="lblAllVolume" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblUseVolume" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblRemainVolume" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </td>
    </tr>
</table>
