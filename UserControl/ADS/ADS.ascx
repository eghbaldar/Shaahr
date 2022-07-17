<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ADS.ascx.vb" Inherits="UserControl_ADS_ADS" %>
<style type="text/css">
    .PHeader
    {
        font-family: Tahoma, Geneva, sans-serif;
        font-size: 11px;
        color: #577F8B;
        border: 1px solid #D6E1E7;
        height: 14px;
        -moz-border-radius: 4px;
        -webkit-border-radius: 4px;
        border-radius: 5px;
        width: 132px;
        margin-top: 3px;
        background-color: #EDEDED;
        padding-bottom: 4px;
        padding-top: 2px;
        padding-right: 4px;
    }
    #Apanel
    {
        float: right;
        margin-top: 3.5px;
        height: 100%;
    }
    #AD
    {
        padding-right: 3px;
        padding-left: 3px;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        border-radius: 5px;
        border: 1px solid #CCC;
        float: right;
        width: 139px;
        margin-left: 3px;
        height: 100%;
        margin-top: 3px;
    }
    .Ads_Frame
    {
        font-family: Tahoma;
        font-size: 11px;
        padding: 3px;
    }
    .Ads_Flash
    {
        font-family: Tahoma;
        font-size: 11px;
        padding-top: 5px;
        text-align: center;
    }
</style>
<%--<div id="Apanel">--%>
<div id="AD">
    <div class="PHeader">
        تبلیغات متنی</div>
    <div class="Ads_Frame">
        <div style="padding: 3px;">
            عنوان1</div>
        <div style="text-align: right;">
            <asp:Image ID="Image1" ImageUrl="~/Ads__!.png" runat="server" /></div>
        تبل یغات تب لیغات تبلی غات تبل یغات تبل یغات تبل یغات تبل یغات
    </div>
    <hr style="width: 100px;" />
    <div class="Ads_Frame">
        <div style="padding: 3px;">
            عنوان1</div>
        <div style="text-align: right;">
            <asp:Image ID="Image2" ImageUrl="~/Ads__!.png" runat="server" /></div>
        تبل یغات تب لیغات تبلی غات تبل یغات تبل یغات تبل یغات تبل یغات
    </div>
    <div class="PHeader">
        برد تبلیغی</div>
    <div class="Ads_Flash">
        <asp:Image ID="Image3" ImageUrl="~/tabligh.jpg" runat="server" />
        <asp:Image ID="Image4" ImageUrl="~/tabligh.jpg" runat="server" Style="margin-top: 2px;" />
    </div>
</div>
