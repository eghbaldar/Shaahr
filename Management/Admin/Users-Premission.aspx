<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="Users-Premission.aspx.vb" Inherits="Management_Admin_Users_Premission"
    Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table class="style1">
        <tr>
            <td>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>تنظیمات حق دسترسی کاربر
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div style="width: 718px; height: 100%; float: right;">
                <table style="width: 100%;">
                    
                    <tr>
                        <td style="width: 17px;">
                            <img src="../../../content/images/Home/question.jpeg" />
                        </td>
                        <td class="style18">
                            آیا همیشه جمله امنیتی بعد از ورود ظاهر شود؟
                        </td>
                        <td style="width: 54px;">
                            <asp:RadioButton AutoPostBack="True" ID="RB_Statement_Yes" runat="server" Text="بلی"
                                GroupName="statement" />
                        </td>
                        <td>
                            <asp:RadioButton AutoPostBack="True" ID="RB_Statement_No" runat="server" Text="خیر"
                                GroupName="statement" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 17px;">
                            <img src="../../../content/images/Home/question.jpeg" />
                        </td>
                        <td class="style18">
                            آیا تایید همشهری بعد از ورود انجام شود؟
                        </td>
                        <td style="width: 54px;">
                            <asp:RadioButton AutoPostBack="True" ID="RB_Auth_Yes" runat="server" Text="بلی" GroupName="auth_" />
                        </td>
                        <td>
                            <asp:RadioButton AutoPostBack="True" ID="RB_Auth_No" runat="server" Text="خیر" GroupName="auth_" />
                        </td>
                    </tr>
                </table>
            </div>
            <div style="width: 718px; height: 100%; float: right;">
                <table style="width: 100%;">
                    <tr>
                        <td class="style2">
                            <img src="../../../content/images/Home/shareSet.jpg" />
                        </td>
                        <td class="style16">
                            به اشتراک گزاری اطلاعات در شهر
                        </td>
                        <td style="width: 50px;">
                            &nbsp; همه
                        </td>
                        <td style="width: 72px;">
                            &nbsp; دوستانم
                        </td>
                        <td class="style21">
                            &nbsp; بستگان
                        </td>
                        <td class="style14">
                            &nbsp; همسرم
                        </td>
                        <td class="style15">
                            &nbsp; فقط من
                        </td>
                        <td>
                            &nbsp; هیچکس
                        </td>
                    </tr>
                    <tr>
                        <td class="style25">
                            <img src="../../../content/images/Home/question.jpeg" />
                        </td>
                        <td class="style24">
                            نمایش لیست دوستان
                        </td>
                        <td style="width: 50px;" class="style22">
                            <asp:RadioButton ID="RB_FriendList_All" runat="server" AutoPostBack="True" GroupName="ListFriends" />
                        </td>
                        <td style="width: 72px;" class="style22">
                            <asp:RadioButton AutoPostBack="True" ID="RB_FriendList_Friends" runat="server" GroupName="ListFriends" />
                        </td>
                        <td class="style23">
                            <asp:RadioButton AutoPostBack="True" ID="RB_FriendList_FamilyList" runat="server"
                                GroupName="ListFriends" />
                        </td>
                        <td class="style22">
                            <asp:RadioButton AutoPostBack="True" ID="RB_FriendList_Wife" runat="server" GroupName="ListFriends" />
                        </td>
                        <td class="style22">
                            <asp:RadioButton AutoPostBack="True" ID="RB_FriendList_My" runat="server" GroupName="ListFriends" />
                        </td>
                        <td class="style22">
                            <asp:RadioButton AutoPostBack="True" ID="RB_FriendList_AnyOne" runat="server" GroupName="ListFriends" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <img src="../../../content/images/Home/question.jpeg" />
                        </td>
                        <td class="style20">
                            نمایش لیست بستگان
                        </td>
                        <td style="width: 50px;">
                            <asp:RadioButton AutoPostBack="True" GroupName="FamilyList" ID="RB_FamilyList_All"
                                runat="server" />
                        </td>
                        <td style="width: 72px;">
                            <asp:RadioButton AutoPostBack="True" GroupName="FamilyList" ID="RB_FamilyList_Friends"
                                runat="server" />
                        </td>
                        <td class="style21">
                            <asp:RadioButton AutoPostBack="True" GroupName="FamilyList" ID="RB_FamilyList_FamilyList"
                                runat="server" />
                        </td>
                        <td class="style14">
                            <asp:RadioButton AutoPostBack="True" GroupName="FamilyList" ID="RB_FamilyList_Wife"
                                runat="server" />
                        </td>
                        <td class="style15">
                            <asp:RadioButton AutoPostBack="True" GroupName="FamilyList" ID="RB_FamilyList_MY"
                                runat="server" />
                        </td>
                        <td>
                            <asp:RadioButton AutoPostBack="True" GroupName="FamilyList" ID="RB_FamilyList_AnyOne"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style25">
                            <img src="../../../content/images/Home/question.jpeg" />
                        </td>
                        <td class="style24">
                            نمایش لیست شهرها
                        </td>
                        <td style="width: 50px;" class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="ShaahrList" ID="RB_ShaahrList_All"
                                runat="server" />
                        </td>
                        <td style="width: 72px;" class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="ShaahrList" ID="RB_ShaahrList_Friends"
                                runat="server" />
                        </td>
                        <td class="style23">
                            <asp:RadioButton AutoPostBack="True" GroupName="ShaahrList" ID="RB_ShaahrList_FamilyList"
                                runat="server" />
                        </td>
                        <td class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="ShaahrList" ID="RB_ShaahrList_Wife"
                                runat="server" />
                        </td>
                        <td class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="ShaahrList" ID="RB_ShaahrList_My"
                                runat="server" />
                        </td>
                        <td class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="ShaahrList" ID="RB_ShaahrList_AnyOne"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <img src="../../../content/images/Home/question.jpeg" />
                        </td>
                        <td class="style20">
                            نمایش آلبوم تصاویر
                        </td>
                        <td style="width: 50px;">
                            <asp:RadioButton AutoPostBack="True" GroupName="Album" ID="RB_Album_All" runat="server" />
                        </td>
                        <td style="width: 72px;">
                            <asp:RadioButton AutoPostBack="True" GroupName="Album" ID="RB_Album_Friends" runat="server" />
                        </td>
                        <td class="style21">
                            <asp:RadioButton AutoPostBack="True" GroupName="Album" ID="RB_Album_FamilyList" runat="server" />
                        </td>
                        <td class="style14">
                            <asp:RadioButton AutoPostBack="True" GroupName="Album" ID="RB_Album_Wife" runat="server" />
                        </td>
                        <td class="style15">
                            <asp:RadioButton AutoPostBack="True" GroupName="Album" ID="RB_Album_My" runat="server" />
                        </td>
                        <td>
                            <asp:RadioButton AutoPostBack="True" GroupName="Album" ID="RB_Album_AnyOne" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style25">
                            <img src="../../../content/images/Home/question.jpeg" />
                        </td>
                        <td class="style24">
                            نمایش نظرسنجی ها
                        </td>
                        <td style="width: 50px;" class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="Polling" ID="RB_Polling_All" runat="server" />
                        </td>
                        <td style="width: 72px;" class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="Polling" ID="RB_Polling_Friends"
                                runat="server" />
                        </td>
                        <td class="style23">
                            <asp:RadioButton AutoPostBack="True" GroupName="Polling" ID="RB_Polling_FamilyList"
                                runat="server" />
                        </td>
                        <td class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="Polling" ID="RB_Polling_Wife" runat="server" />
                        </td>
                        <td class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="Polling" ID="RB_Polling_MY" runat="server" />
                        </td>
                        <td class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="Polling" ID="RB_Polling_AnyOne" runat="server"
                                Style="direction: ltr" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <img src="../../../content/images/Home/question.jpeg" />
                        </td>
                        <td class="style20">
                            نمایش اطلاعات شخصی
                        </td>
                        <td style="width: 50px;">
                            <asp:RadioButton AutoPostBack="True" GroupName="InfoPersonal" ID="RB_InfoPerson_All"
                                runat="server" />
                        </td>
                        <td style="width: 72px;">
                            <asp:RadioButton AutoPostBack="True" GroupName="InfoPersonal" ID="RB_InfoPerson_Firneds"
                                runat="server" />
                        </td>
                        <td class="style21">
                            <asp:RadioButton AutoPostBack="True" GroupName="InfoPersonal" ID="RB_InfoPerson_FamilyList"
                                runat="server" />
                        </td>
                        <td class="style14">
                            <asp:RadioButton AutoPostBack="True" GroupName="InfoPersonal" ID="RB_InfoPerson_Wife"
                                runat="server" />
                        </td>
                        <td class="style15">
                            <asp:RadioButton AutoPostBack="True" GroupName="InfoPersonal" ID="RB_InfoPerson_My"
                                runat="server" />
                        </td>
                        <td>
                            <asp:RadioButton AutoPostBack="True" GroupName="InfoPersonal" ID="RB_InfoPerson_AnyOne"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style25">
                            <img src="../../../content/images/Home/question.jpeg" />
                        </td>
                        <td class="style24">
                            نمایش اطلاعات ظاهری
                        </td>
                        <td style="width: 50px;" class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="InfoOutward" ID="RB_InfoOut_All"
                                runat="server" />
                        </td>
                        <td style="width: 72px;" class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="InfoOutward" ID="RB_InfoOut_Friends"
                                runat="server" />
                        </td>
                        <td class="style23">
                            <asp:RadioButton AutoPostBack="True" GroupName="InfoOutward" ID="RB_InfoOut_FamilyList"
                                runat="server" />
                        </td>
                        <td class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="InfoOutward" ID="RB_InfoOut_Wife"
                                runat="server" />
                        </td>
                        <td class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="InfoOutward" ID="RB_InfoOut_My" runat="server" />
                        </td>
                        <td class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="InfoOutward" ID="RB_InfoOut_AnyOne"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <img src="../../../content/images/Home/question.jpeg" />
                        </td>
                        <td class="style20">
                            نمایش علاقمندی ها
                        </td>
                        <td style="width: 50px;">
                            <asp:RadioButton AutoPostBack="True" GroupName="infoForvarit" ID="RB_InfoFavorit_All"
                                runat="server" />
                        </td>
                        <td style="width: 72px;">
                            <asp:RadioButton AutoPostBack="True" GroupName="infoForvarit" ID="RB_InfoFavorit_Friends"
                                runat="server" />
                        </td>
                        <td class="style21">
                            <asp:RadioButton AutoPostBack="True" GroupName="infoForvarit" ID="RB_InfoFavorit_FamilyList"
                                runat="server" />
                        </td>
                        <td class="style14">
                            <asp:RadioButton AutoPostBack="True" GroupName="infoForvarit" ID="RB_InfoFavorit_Wife"
                                runat="server" />
                        </td>
                        <td class="style15">
                            <asp:RadioButton AutoPostBack="True" GroupName="infoForvarit" ID="RB_InfoFavorit_My"
                                runat="server" />
                        </td>
                        <td>
                            <asp:RadioButton AutoPostBack="True" GroupName="infoForvarit" ID="RB_InfoFavorit_AnyOne"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style25">
                            <img src="../../../content/images/Home/question.jpeg" />
                        </td>
                        <td class="style24">
                            نمایش اطلاعات ارتباطی
                        </td>
                        <td style="width: 50px;" class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="infoContact" ID="RB_InfoContact_All"
                                runat="server" />
                        </td>
                        <td style="width: 72px;" class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="infoContact" ID="RB_InfoContact_Friends"
                                runat="server" />
                        </td>
                        <td class="style23">
                            <asp:RadioButton AutoPostBack="True" GroupName="infoContact" ID="RB_InfoContact_FamilyList"
                                runat="server" />
                        </td>
                        <td class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="infoContact" ID="RB_InfoContact_Wife"
                                runat="server" />
                        </td>
                        <td class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="infoContact" ID="RB_InfoContact_My"
                                runat="server" />
                        </td>
                        <td class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="infoContact" ID="RB_InfoContact_AnyOne"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <img src="../../../content/images/Home/question.jpeg" />
                        </td>
                        <td class="style20">
                            گرفتن عکس از
                        </td>
                        <td style="width: 50px;">
                            <asp:RadioButton AutoPostBack="True" GroupName="getPhoto" ID="RB_getPhoto_All" runat="server" />
                        </td>
                        <td style="width: 72px;">
                            <asp:RadioButton AutoPostBack="True" GroupName="getPhoto" ID="RB_getPhoto_Firends"
                                runat="server" />
                        </td>
                        <td class="style21">
                            <asp:RadioButton AutoPostBack="True" GroupName="getPhoto" ID="RB_getPhoto_FamilyList"
                                runat="server" />
                        </td>
                        <td class="style14">
                            <asp:RadioButton AutoPostBack="True" GroupName="getPhoto" ID="RB_getPhoto_wife" runat="server" />
                        </td>
                        <td class="style15">
                            <asp:RadioButton AutoPostBack="True" GroupName="getPhoto" ID="RB_getPhoto_my" runat="server" />
                        </td>
                        <td>
                            <asp:RadioButton AutoPostBack="True" GroupName="getPhoto" ID="RB_getPhoto_anyone"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style25">
                            <img src="../../../content/images/Home/question.jpeg" />
                        </td>
                        <td class="style24">
                            گرفتن لینک از
                        </td>
                        <td style="width: 50px;" class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="getLink" ID="RB_getLink_All" runat="server" />
                        </td>
                        <td style="width: 72px;" class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="getLink" ID="RB_getLink_firneds"
                                runat="server" />
                        </td>
                        <td class="style23">
                            <asp:RadioButton AutoPostBack="True" GroupName="getLink" ID="RB_getLink_FamilyList"
                                runat="server" />
                        </td>
                        <td class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="getLink" ID="RB_getLink_wife" runat="server" />
                        </td>
                        <td class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="getLink" ID="RB_getLink_my" runat="server" />
                        </td>
                        <td class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="getLink" ID="RB_getLink_anyone" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <img src="../../../content/images/Home/question.jpeg" />
                        </td>
                        <td class="style20">
                            گرفتن نوشته از
                        </td>
                        <td style="width: 50px;">
                            <asp:RadioButton AutoPostBack="True" GroupName="getText" ID="RB_getText_All" runat="server" />
                        </td>
                        <td style="width: 72px;">
                            <asp:RadioButton AutoPostBack="True" GroupName="getText" ID="RB_getText_friends"
                                runat="server" />
                        </td>
                        <td class="style21">
                            <asp:RadioButton AutoPostBack="True" GroupName="getText" ID="RB_getText_FamilyList"
                                runat="server" />
                        </td>
                        <td class="style14">
                            <asp:RadioButton AutoPostBack="True" GroupName="getText" ID="RB_getText_wife" runat="server" />
                        </td>
                        <td class="style15">
                            <asp:RadioButton AutoPostBack="True" GroupName="getText" ID="RB_getText_my" runat="server" />
                        </td>
                        <td>
                            <asp:RadioButton AutoPostBack="True" GroupName="getText" ID="RB_getText_anyone" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style25">
                            <img src="../../../content/images/Home/question.jpeg" />
                        </td>
                        <td class="style24">
                            گرفتن پیام فردی از
                        </td>
                        <td style="width: 50px;" class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="MSG" ID="RB_Message_All" runat="server" />
                        </td>
                        <td style="width: 72px;" class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="MSG" ID="RB_Message_friends" runat="server" />
                        </td>
                        <td class="style23">
                            <asp:RadioButton AutoPostBack="True" GroupName="MSG" ID="RB_Message_FamilyList" runat="server" />
                        </td>
                        <td class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="MSG" ID="RB_Message_wife" runat="server" />
                        </td>
                        <td class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="MSG" ID="RB_Message_my" runat="server" />
                        </td>
                        <td class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="MSG" ID="RB_Message_anyone" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <img src="../../../content/images/Home/question.jpeg" />
                        </td>
                        <td class="style20">
                            گرفتن پیام گروهی از
                        </td>
                        <td style="width: 50px;">
                            <asp:RadioButton AutoPostBack="True" GroupName="MSG_Group" ID="RB_MsgGroup_All" runat="server" />
                        </td>
                        <td style="width: 72px;">
                            <asp:RadioButton AutoPostBack="True" GroupName="MSG_Group" ID="RB_MsgGroup_Friends"
                                runat="server" />
                        </td>
                        <td class="style21">
                            <asp:RadioButton AutoPostBack="True" GroupName="MSG_Group" ID="RB_MsgGroup_FamilyList"
                                runat="server" />
                        </td>
                        <td class="style14">
                            <asp:RadioButton AutoPostBack="True" GroupName="MSG_Group" ID="RB_MsgGroup_wife"
                                runat="server" />
                        </td>
                        <td class="style15">
                            <asp:RadioButton AutoPostBack="True" GroupName="MSG_Group" ID="RB_MsgGroup_my" runat="server" />
                        </td>
                        <td>
                            <asp:RadioButton AutoPostBack="True" GroupName="MSG_Group" ID="RB_MsgGroup_anyone"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style25">
                            <img src="../../../content/images/Home/question.jpeg" style="width: 16px" />
                        </td>
                        <td class="style24">
                            نمایش بروزرسانی برای
                        </td>
                        <td style="width: 50px;" class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="ShowUpdateNews" ID="RB_ShowUpdateNews_All"
                                runat="server" />
                        </td>
                        <td style="width: 72px;" class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="ShowUpdateNews" ID="RB_ShowUpdateNews_friends"
                                runat="server" />
                        </td>
                        <td class="style23">
                            <asp:RadioButton AutoPostBack="True" GroupName="ShowUpdateNews" ID="RB_ShowUpdateNews_FamilyList"
                                runat="server" />
                        </td>
                        <td class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="ShowUpdateNews" ID="RB_ShowUpdateNews_wife"
                                runat="server" />
                        </td>
                        <td class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="ShowUpdateNews" ID="RB_ShowUpdateNews_my"
                                runat="server" />
                        </td>
                        <td class="style22">
                            <asp:RadioButton AutoPostBack="True" GroupName="ShowUpdateNews" ID="RB_ShowUpdateNews_anyone"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <img src="../../../content/images/Home/question.jpeg" style="width: 16px" />
                        </td>
                        <td class="style20">
                            گفتگوی آنلاین با
                        </td>
                        <td style="width: 50px;">
                            <asp:RadioButton ID="RB_AllowUpdateChat_All" runat="server" AutoPostBack="True" GroupName="ShowUpdateChat" />
                        </td>
                        <td style="width: 72px;">
                            <asp:RadioButton ID="RB_AllowUpdateChat_friends" runat="server" AutoPostBack="True"
                                GroupName="ShowUpdateChat" />
                        </td>
                        <td class="style21">
                            <asp:RadioButton ID="RB_AllowUpdateChat_FamilyList" runat="server" AutoPostBack="True"
                                GroupName="ShowUpdateChat" />
                        </td>
                        <td class="style14">
                            <asp:RadioButton ID="RB_AllowUpdateChat_wife" runat="server" AutoPostBack="True"
                                GroupName="ShowUpdateChat" />
                        </td>
                        <td class="style15">
                            <asp:RadioButton ID="RB_AllowUpdateChat_my" runat="server" AutoPostBack="True" GroupName="ShowUpdateChat"
                                Enabled="False" />
                        </td>
                        <td>
                            <asp:RadioButton ID="RB_AllowUpdateChat_anyone" runat="server" AutoPostBack="True"
                                GroupName="ShowUpdateChat" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <img src="../../../content/images/Home/question.jpeg" style="width: 16px" />
                        </td>
                        <td class="style20">
                            نمایش آلبوم ها در آلبوم های مشترک
                        </td>
                        <td style="width: 50px;">
                            <asp:RadioButton ID="RB_CommonAlbum_Yes" runat="server" AutoPostBack="True" GroupName="auth"
                                Text="بلی" />
                        </td>
                        <td style="width: 72px;">
                            <asp:RadioButton ID="RB_CommonAlbum_No" runat="server" AutoPostBack="True" GroupName="auth"
                                Text="خیر" />
                        </td>
                        <td class="style21">
                            &nbsp;
                        </td>
                        <td class="style14">
                            &nbsp;
                        </td>
                        <td class="style15">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <img src="../../../content/images/Home/question.jpeg" style="width: 16px" />
                        </td>
                        <td class="style20">
                            مخفی ماندن تاریخ آخرین لاگین
                        </td>
                        <td style="width: 50px;">
                            <asp:RadioButton ID="RB_LastLgoin_Yes" runat="server" AutoPostBack="True" GroupName="last"
                                Text="بلی" />
                        </td>
                        <td style="width: 72px;">
                            <asp:RadioButton ID="RB_LastLgoin_No" runat="server" AutoPostBack="True" GroupName="last"
                                Text="خیر" />
                        </td>
                        <td class="style21">
                            &nbsp;
                        </td>
                        <td class="style14">
                            &nbsp;
                        </td>
                        <td class="style15">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </div>
            <div style="float: right; width: 743px;">
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <img src="../../../content/images/Profile_View_Users/Loading_0.gif" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel></td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <b>جمله امنیتی</b></td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtStatement" runat="server" Height="35px" Style="border: 1px solid #ccc; font-family: Tahoma;
                                                            font-size: 11px;" 
                    TextMode="MultiLine" ValidationGroup="1" Width="611px"></asp:TextBox>
                <asp:Button ID="btnUpdateStatementSecure" runat="server" 
                    style="font-family: Tahoma; font-size: 11px" Text="ثبت" ValidationGroup="1" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtStatement" ErrorMessage="*" ValidationGroup="1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblUserName_auth" runat="server" style="color: #FF0000"></asp:Label>
            </td>
        </tr>
    </table>

</asp:Content>
