<%@ Page Language="VB" MasterPageFile="~/user/User.master" AutoEventWireup="false"
    CodeFile="DetailPost.aspx.vb" Inherits="user_DetailPost" Title="Untitled Page" %>

<%@ Register Src="../UserControl/Profile/Panel_BigUpdateProfileOne.ascx" TagName="Panel_BigUpdateProfileOne"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Like Menu -->
    <link href="../Content/js/LikeMenu/menu.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:Panel_BigUpdateProfileOne ID="Panel_BigUpdateProfileOne" runat="server" />
</asp:Content>
