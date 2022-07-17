<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ButtonShaahr.ascx.vb"
    Inherits="UserControl_Root_ButtonShaahr" %>
<%----------------------BtnShaahr------------------------%>

<script type="text/javascript">

 function move(t){
                document.getElementById(t).style.backgroundColor="#eaeaea";
                document.getElementById(t).style.border="1px solid #848484";
                document.getElementById(t).style.boxShadow="2px 2px 2px #eaeaea";

               }
               function out(t)
               {
                document.getElementById(t).style.backgroundColor="#f4f4f4";
                document.getElementById(t).style.border="1px solid #CCC";
                document.getElementById(t).style.boxShadow="0px 0px 0px #eaeaea";
               }

</script>

<style type="text/css">
    .BtnShaahr
    {
        background-color: #f4f4f4;
        border: 1px solid #ccc;
        padding: 5px;
        color: Black;
        font-family: Tahoma;
        font-size: 11px;
        cursor: pointer;
        -moz-border-radius: 4px;
    }
</style>
<%--    -----------------------------------------------%>
<asp:Button ID="ButtonShaahr" CssClass="BtnShaahr" runat="server" />