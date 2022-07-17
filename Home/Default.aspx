<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="home_Default" %>

<%@ Register Src="../UserControl/Home/Panel_Visit.ascx" TagName="Panel_Visit" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/Home/Panel_SmallUpdate.ascx" TagName="Panel_SmallUpdate"
    TagPrefix="uc2" %>
<%@ Register Src="../UserControl/Home/Panel_Events.ascx" TagName="Panel_Events" TagPrefix="uc3" %>
<%@ Register Src="../UserControl/Home/SetObject.ascx" TagName="SetObject" TagPrefix="uc4" %>
<%@ Register Src="../UserControl/Home/Think.ascx" TagName="Think" TagPrefix="uc5" %>
<%@ Register Src="../UserControl/Home/Panel_FriendsKnowing.ascx" TagName="Panel_FriendsKnowing"
    TagPrefix="uc6" %>
<%@ Register Src="../UserControl/Home/Panel_BigUpdate.ascx" TagName="Panel_BigUpdate"
    TagPrefix="uc7" %>
<%@ Register Src="../UserControl/Home/Panel_WorkList.ascx" TagName="Panel_WorkList"
    TagPrefix="uc8" %>
<%@ Register Src="../UserControl/Home/Panel_Notifications.ascx" TagName="Panel_Notifications"
    TagPrefix="uc9" %>
<%@ Register Src="../UserControl/Home/FindUsers.ascx" TagName="FindUsers" TagPrefix="uc10" %>
<%@ Register Src="../UserControl/Home/Character3.ascx" TagName="Character3" TagPrefix="uc11" %>
<%@ Register Src="../UserControl/Home/GuidMenu.ascx" TagName="GuidMenu" TagPrefix="uc12" %>
<%@ Register Src="../UserControl/Home/DegreeUser.ascx" TagName="DegreeUser" TagPrefix="uc13" %>
<%@ Register Src="../UserControl/Home/Avatars.ascx" TagName="Avatars" TagPrefix="uc14" %>
<%@ Register Src="../UserControl/Root/TopTextLogo.ascx" TagName="TopTextLogo" TagPrefix="uc4" %>
<%@ Register Src="../UserControl/Home/Panel_Nazmie.ascx" TagName="Panel_Nazmie" TagPrefix="uc15" %>
<%@ Register Src="../UserControl/Root/LeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc16" %>
<%@ Register Src="../UserControl/Root/Footer_Other.ascx" TagName="Footer" TagPrefix="uc6" %>
<%@ Register Src="../UserControl/ADS/ADS.ascx" TagName="ADS" TagPrefix="uc17" %>
<%@ Register Src="../UserControl/Home/VolumeUsing.ascx" TagName="VolumeUsing" TagPrefix="uc18" %>
<%@ Register Src="../UserControl/Home/Panel_InhabitShaahr.ascx" TagName="Panel_InhabitShaahr"
    TagPrefix="uc19" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="SHORTCUT ICON" href="../content/images/Home/ShaahrFavorite.png" />
    <!-- CenterMenu -->
    <link href="../content/css/Home/HomeMenu.css" rel="stylesheet" type="text/css" />
    <!-- -->
    <link href="../content/css/Home/css.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
            font-family: Tahoma;
            font-size: 11px;
        }
        .style2
        {
            width: 248px;
        }
        .style8
        {
            width: 132px;
        }
    </style>
    <!-- Confirm -->
    <link href="../Content/js/confirm/impromptu/impromptu.css" rel="stylesheet" type="text/css" />

    <script src="../Content/js/confirm/impromptu/jquery.js" type="text/javascript"></script>

    <script src="../Content/js/confirm/impromptu/jquery-impromptu.2.6.min.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">
    function confirmDeleteResult(v,m,f)
    {
        if(v) //user clicked OK 
            $('#' + f.hidID).click();
    }  
    </script>

    <!-- Like Menu -->
    <link href="../Content/js/LikeMenu/menu.css" rel="stylesheet" type="text/css" />
    <link href="../Content/js/LikeMenu/menuNotification.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="body">
        <div id="header">
            <!--Start Header-->
            <div id="Guid">
                <uc12:GuidMenu ID="GuidMenu1" runat="server" />
            </div>
            <div id="headerPic">
            </div>
            <div id="Nav">
                <uc4:TopTextLogo ID="TopTextLogo1" runat="server" />
                <div id="searchNav">
                    <uc10:FindUsers ID="FindUsers1" runat="server" />
                </div>
            </div>
        </div>
        <!-- End Heeader -->
        <div id="master">
            <div id="CenterMaster">
                <div id="desktop">
                    <div id="Top_desktop">
                        <div id="desktop_think">
                            <uc5:Think ID="Think1" runat="server" />
                        </div>
                        <div id="desktop_avatars">
                            <uc14:Avatars ID="Avatars1" runat="server" />
                        </div>
                        <div id="desktop_3shakhs">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                        <ProgressTemplate>
                                            <img src="../Content/images/Profile_View_Users/Loading_0.gif" /></ProgressTemplate>
                                    </asp:UpdateProgress>
                                    <uc11:Character3 ID="Character31" runat="server" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                    <style type="text/css">
                        .StaticHoverStyle
                        {
                        }
                        .StaticMenuItemStyle
                        {
                            margin-right: 4px;
                        }
                        .DynamicMenuStyle
                        {
                            padding-left: 3px;
                            padding-right: 3px;
                            padding-top: 3px;
                            border: 1px solid #ccc;
                            margin-top: 4px;
                            background-color: #f3f7f9;
                            width: 160px;
                            margin-left: -60px;
                        }
                        .DynamicHoverStyle
                        {
                            background-color: #f3f3f3;
                            font-size: 11px;
                        }
                        .DynamicSelectedStyle
                        {
                        }
                        .DynamicMenuItemStyle
                        {
                            padding-left: 3px;
                            padding-right: 3px;
                            padding-top: 3px;
                            margin-bottom: 5px;
                        }
                        .style9
                        {
                            width: 100%;
                            font-family: Tahoma;
                            font-size: 11px;
                        }
                        .style10
                        {
                            width: 37px;
                        }
                        .style11
                        {
                            width: 100%;
                        }
                        .style12
                        {
                            height: 17px;
                        }
                    </style>
                    <div id="menu">
                        <asp:Menu ID="Mnu" runat="server" Orientation="Horizontal" Font-Names="Tahoma" StaticEnableDefaultPopOutImage="false"
                            Font-Size="11px" ForeColor="#333333">
                            <StaticHoverStyle CssClass="StaticHoverStyle" />
                            <StaticMenuItemStyle CssClass="StaticMenuItemStyle" />
                            <DynamicHoverStyle CssClass="DynamicHoverStyle" />
                            <DynamicSelectedStyle CssClass="DynamicSelectedStyle" />
                            <DynamicMenuStyle CssClass="DynamicMenuStyle" />
                            <DynamicMenuItemStyle CssClass="DynamicMenuItemStyle" />
                            <Items>
                                <asp:MenuItem Text="خانه" Value="New Item">
                                    <asp:MenuItem Text="خانه" Value="خانه" NavigateUrl="~/Home/"></asp:MenuItem>
                                    <asp:MenuItem Text="پروفایل" Value="Profile"></asp:MenuItem>
                                </asp:MenuItem>
                                <asp:MenuItem Text="اتاق کارمن" Value="New Item">
                                    <asp:MenuItem Text="مطالب من" Value="مطالب من" NavigateUrl="~/Home/Menu/MyRoom/obj.aspx?type=2">
                                    </asp:MenuItem>
                                    <asp:MenuItem Text="لینک های من" Value="لینک های من" NavigateUrl="~/Home/Menu/MyRoom/obj.aspx?type=1">
                                    </asp:MenuItem>
                                    <asp:MenuItem Text="عکس های من" Value="عکس های من" NavigateUrl="~/Home/Menu/MyRoom/obj.aspx?type=0">
                                    </asp:MenuItem>
                                    <asp:MenuItem Text="نظرسنجی های من" Value="نظرسنجی های من" NavigateUrl="~/Home/Menu/MyRoom/obj.aspx?type=3">
                                    </asp:MenuItem>
                                    <asp:MenuItem Text="آلبوم تصاویر من" Value="آلبوم تصاویر من" NavigateUrl="~/Home/Album.aspx">
                                    </asp:MenuItem>
                                    <asp:MenuItem Text="آلبوم های مشترک" Value="آلبوم های مشترک" NavigateUrl="~/Home/Menu/MyRoom/CommonAlbums.aspx">
                                    </asp:MenuItem>
                                    <asp:MenuItem Text="درخواست ها" Value="درخواست ها" NavigateUrl="~/Home/Menu/MyRoom/requests.aspx">
                                    </asp:MenuItem>
                                    <asp:MenuItem Value="Split" Text="adas" Selectable="false"></asp:MenuItem>
                                    <asp:MenuItem Text="پنل مدیریتی مسئولیت ها" Value="New Item" NavigateUrl="~/Shaahr/Admin/">
                                    </asp:MenuItem>
                                </asp:MenuItem>
                                <asp:MenuItem Text="صندوق پستی" Value="New Item">
                                    <asp:MenuItem Text="صندوق پستی" Value="صندوق پستی" NavigateUrl="~/Home/Menu/Fund/msg.aspx">
                                    </asp:MenuItem>
                                </asp:MenuItem>
                                <asp:MenuItem Text="ردپا" Value="New Item">
                                    <asp:MenuItem Text="ردپای شهرها" Value="ردپای شهرها"></asp:MenuItem>
                                    <asp:MenuItem Text="ردپای کتاب ها" Value="ردپای کتاب ها"></asp:MenuItem>
                                    <asp:MenuItem Text="ردپای نرم افزار ها" Value="ردپای نرم افزار ها"></asp:MenuItem>
                                    <asp:MenuItem Text="ردپای شارژها" Value="ردپای شارژها"></asp:MenuItem>
                                </asp:MenuItem>
                                <asp:MenuItem Text="تنظیمات خانه" Value="New Item">
                                    <asp:MenuItem Text="مدیریت مشخصات فردی" Value="مدیریت مشخصات فردی" NavigateUrl="~/Home/Menu/Setting/attrib.aspx">
                                    </asp:MenuItem>
                                    <asp:MenuItem Text="تنظیمات آواتار" Value="تنظیمات آواتار" NavigateUrl="~/Home/Menu/Setting/Avatars.aspx">
                                    </asp:MenuItem>
                                    <asp:MenuItem Text="تنظیمات حق دسترسی" Value="تنظیمات حق دسترسی" NavigateUrl="~/Home/Menu/Setting/permisson.aspx">
                                    </asp:MenuItem>
                                    <asp:MenuItem Text="تنظیمات امنیتی و ورودی" Value="تنظیمات امنیتی و ورودی" NavigateUrl="~/Home/Menu/Setting/security.aspx">
                                    </asp:MenuItem>
                                    <asp:MenuItem Text="تنظیمات نمایشی خانه" Value="تنظیمات نمایشی خانه" NavigateUrl="~/Home/Menu/Setting/setting.aspx">
                                    </asp:MenuItem>
                                </asp:MenuItem>
                                <asp:MenuItem Text="جیرینگ من" Value="New Item">
                                    <asp:MenuItem Text="جیرینگ" Value="جیرینگ" NavigateUrl="~/Stage/Jiring/"></asp:MenuItem>
                                    <asp:MenuItem Text="گردش حساب" Value="گردش حساب" NavigateUrl="~/Stage/Jiring/CycleJiring.aspx">
                                    </asp:MenuItem>
                                    <asp:MenuItem Text="خرید جیرینگ" Value="خرید جیرینگ" NavigateUrl="~/Stage/Jiring/pay.aspx">
                                    </asp:MenuItem>
                                    <asp:MenuItem Text="انتقال جیرینگ" Value="انتقال جیرینگ" NavigateUrl="~/Stage/Jiring/J-transfer.aspx">
                                    </asp:MenuItem>
                                    <asp:MenuItem Text="سرویس های فعال" Value="سرویس های فعال" NavigateUrl="~/Stage/Jiring/UsersServices.aspx">
                                    </asp:MenuItem>
                                    <asp:MenuItem Text="خرید سرویس" Value="خرید سرویس" NavigateUrl="~/Stage/Jiring/Services.aspx">
                                    </asp:MenuItem>
                                </asp:MenuItem>
                                <asp:MenuItem Text="دعوت نامه" Value="invitation" NavigateUrl="~/Home/invitation.aspx">
                                </asp:MenuItem>
                                <asp:MenuItem Text="خروج از شهر" Value="ExitShaahr"></asp:MenuItem>
                            </Items>
                        </asp:Menu>
                    </div>
                    <div id="Down_Desltop">
                        <uc17:ADS ID="ADS1" runat="server" />
                        <div id="notification_object_update">
                            <div id="notification">
                                <div>
                                    <uc9:Panel_Notifications ID="Panel_Notifications1" runat="server" />
                                </div>
                            </div>
                            <div>
                                <uc4:SetObject ID="SetObject" runat="server" />
                            </div>
                            <div>
                                <uc7:Panel_BigUpdate ID="Panel_BigUpdate1" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
                <div id="panels">
                    <div id="Panel__Sharvandi" runat="server" class="PanelFormat">
                        <div class="panel_header">
                            درجه شهروندی</div>
                        <div style="height: 100%;">
                            <uc13:DegreeUser ID="DegreeUser1" runat="server" />
                        </div>
                    </div>
                    <div id="panel_work" class="PanelFormat">
                        <div class="panel_header" style="background-color: #F3F3F3;">
                            تبلیغات</div>
                        <div style="height: 100%;">
                            <span style="font-family: Tahoma; font-size: 11px;">تبلیغی وجود ندارد.</span>
                        </div>
                    </div>
                    <div id="panel_work" class="PanelFormat">
                        <div class="panel_header">
                            حجم خانه شما</div>
                        <div style="height: 100%;">
                            <uc18:VolumeUsing ID="VolumeUsing2" runat="server" />
                        </div>
                    </div>
                    <div id="panel_work" class="PanelFormat">
                        <div class="panel_header" class="PanelFormat">
                            نظمیه</div>
                        <div style="height: 100%;">
                            <uc15:Panel_Nazmie ID="Panel_Nazmie1" runat="server" />
                        </div>
                    </div>
                    <div id="Panel__Visit" runat="server" class="PanelFormat">
                        <div id="panel_ads">
                            <div class="panel_header">
                                بازدید کنندگان خانه شما تنظیمات</div>
                            <div style="height: 100%; margin-top: 2px;">
                                <uc1:Panel_Visit ID="Panel_Visit" runat="server" />
                            </div>
                        </div>
                    </div>
                    <div id="Panel__Update" runat="server" class="PanelFormat">
                        <div id="panel_lastNews">
                            <div class="panel_header">
                                آخرین بروزرسانی های شهرها</div>
                            <div style="height: 100%;">
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Code"
                                    DataSourceID="ODS_PostShaahrs" GridLines="None" ShowHeader="False" Width="206px">
                                    <Columns>
                                        <asp:BoundField DataField="Code" HeaderText="Code" InsertVisible="False" ReadOnly="True"
                                            SortExpression="Code" Visible="False" />
                                        <asp:BoundField DataField="CodeCategory" HeaderText="CodeCategory" SortExpression="CodeCategory"
                                            Visible="False" />
                                        <asp:TemplateField HeaderText="Subject" SortExpression="Subject">
                                            <ItemTemplate>
                                                »&nbsp;&nbsp;<asp:LinkButton OnCommand="GotoThread" CommandArgument='<%# Eval("code","{0}")+"|"+Eval("codecategory","{0}") %>'
                                                    Style="font-family: Tahoma; font-size: 11px; text-decoration: none; color: #587D8D;"
                                                    Text='<%# Eval("Subject") %>' ID="LinkButton1" runat="server">
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Text" HeaderText="Text" SortExpression="Text" Visible="False" />
                                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" Visible="False" />
                                        <asp:BoundField DataField="Visit" HeaderText="Visit" SortExpression="Visit" Visible="False" />
                                        <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" Visible="False" />
                                        <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" Visible="False" />
                                        <asp:CheckBoxField DataField="Luck" HeaderText="Luck" SortExpression="Luck" Visible="False" />
                                    </Columns>
                                </asp:GridView>
                                <asp:ObjectDataSource ID="ODS_PostShaahrs" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.UsersShaahrPostTableAdapter"
                                    UpdateMethod="Update">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Original_Code" Type="Int64" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="CodeCategory" Type="Int64" />
                                        <asp:Parameter Name="Subject" Type="String" />
                                        <asp:Parameter Name="Text" Type="String" />
                                        <asp:Parameter Name="email" Type="String" />
                                        <asp:Parameter Name="Visit" Type="Int32" />
                                        <asp:Parameter Name="Time" Type="String" />
                                        <asp:Parameter Name="_date" Type="String" />
                                        <asp:Parameter Name="Luck" Type="Boolean" />
                                        <asp:Parameter Name="Original_Code" Type="Int64" />
                                    </UpdateParameters>
                                    <SelectParameters>
                                        <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                                    </SelectParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="CodeCategory" Type="Int64" />
                                        <asp:Parameter Name="Subject" Type="String" />
                                        <asp:Parameter Name="Text" Type="String" />
                                        <asp:Parameter Name="email" Type="String" />
                                        <asp:Parameter Name="Visit" Type="Int32" />
                                        <asp:Parameter Name="Time" Type="String" />
                                        <asp:Parameter Name="_date" Type="String" />
                                        <asp:Parameter Name="Luck" Type="Boolean" />
                                    </InsertParameters>
                                </asp:ObjectDataSource>
                            </div>
                        </div>
                    </div>
                    <div id="Panel__Event" runat="server" class="PanelFormat">
                        <div id="panel_eventShaahr">
                            <div class="panel_header">
                                رویداد های کشور و روز
                            </div>
                            <div style="height: 100%;">
                                <uc3:Panel_Events ID="Panel_Events1" runat="server" />
                            </div>
                        </div>
                    </div>
                    <div id="Panel__Know" runat="server" class="PanelFormat">
                        <div id="panel_knowPeople">
                            <div class="panel_header">
                                افراد آشنا</div>
                            <div style="height: 100%;">
                                <uc6:Panel_FriendsKnowing ID="Panel_FriendsKnowing1" runat="server" />
                            </div>
                        </div>
                    </div>
                    <div id="Panel__shaahr" runat="server" class="PanelFormat">
                        <div id="panel_Shaahr">
                            <div class="panel_header">
                                شهر های اقامت گرفته</div>
                            <div style="height: 100%;">
                                <uc19:Panel_InhabitShaahr ID="Panel_InhabitShaahr1" runat="server" />
                            </div>
                        </div>
                    </div>
                    <div id="Panel__Work" runat="server" class="PanelFormat">
                        <div id="panel_work">
                            <div class="panel_header">
                                لیست کارها</div>
                            <div style="height: 100%;">
                                <uc8:Panel_WorkList ID="Panel_WorkList1" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Panels -->
            </div>
            <div id="LeftMaster">
                <uc16:LeftMenu ID="LeftMenu1" runat="server" />
            </div>
        </div>
        <uc6:Footer ID="Footer1" runat="server" />
    </div>
    </form>
</body>
</html>
