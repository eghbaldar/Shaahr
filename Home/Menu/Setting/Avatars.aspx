<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Avatars.aspx.vb" Inherits="home_Menu_Setting_Avatars" %>

<%@ Register Src="../../../UserControl/Home/FindUsers.ascx" TagName="FindUsers" TagPrefix="uc1" %>
<%@ Register Src="../../../UserControl/Home/GuidMenu.ascx" TagName="GuidMenu" TagPrefix="uc2" %>
<%@ Register Src="../../../UserControl/Home/NavRightTop.ascx" TagName="NavRightTop"
    TagPrefix="uc3" %>
<%@ Register Src="../../../UserControl/Root/LeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc4" %>
<%@ Register Src="~/UserControl/Root/Footer_other.ascx" TagName="Footer" TagPrefix="uc6" %>
<%@ Register Src="~/UserControl/Root/TopTextLogo.ascx" TagName="TopTextLogo" TagPrefix="uc41" %>
<%@ Register Src="../../../UserControl/ADS/ADS.ascx" TagName="ADS" TagPrefix="uc5" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="SHORTCUT ICON" href="../../../content/images/Home/ShaahrFavorite.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../../../content/css/Home/css_OtherPage.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../Content/Crop/jquery.min.js"></script>

    <link href="../../Content/Crop/jquery.Jcrop.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../Content/Crop/jquery.Jcrop.pack.js"></script>

    <script type="text/javascript">
  jQuery(document).ready(function() {
    jQuery('#imgCrop').Jcrop({
    onChange: showPreview,
      onSelect: storeCoords,
      aspectRatio: 1
    });

  });
  function storeCoords(c) {
    jQuery('#X').val(c.x);
    jQuery('#Y').val(c.y);
    jQuery('#W').val(c.w);
    jQuery('#H').val(c.h);
    
    document.getElementById('W_').innerHTML="عرض: "+c.w +"  "+"ارتفاع: "+c.h;
    //if (c.w > 294 && c.w < 331)
    if (c.w > 294 )
            document.getElementById('W_').style.color='#16ab16';
        else
            document.getElementById('W_').style.color='#ff0000';     
      };
  
  
function showPreview(coords)
{
	var rx = 100 / coords.w;
	var ry = 100 / coords.h;

	$('#preview').css({
		width: Math.round(rx * 500) + 'px',
		height: Math.round(ry * 370) + 'px',
		marginLeft: '-' + Math.round(rx * coords.x) + 'px',
		marginTop: '-' + Math.round(ry * coords.y) + 'px'
	});
};
    </script>

    <script language="javascript" type="text/javascript">
    function OpenFileUpload()
    { 
     document.getElementById('<%= Upload.ClientID%>').click();
    }    
    </script>

    <!-- -->
    <style type="text/css">
        .style6
        {
            width: 393px;
            text-align: left;
        }
        @font-face
        {
            font-family: koodak;
            src: url(          "../../../content/font/W_koodak.TTF" );
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="body">
        <div id="header">
            <!--Start Header-->
            <div id="Guid">
                <uc2:GuidMenu ID="GuidMenu1" runat="server" />
            </div>
            <div id="Nav">
                <uc41:TopTextLogo ID="TopTextLogo1" runat="server" />
                <div id="searchNav">
                    <uc1:FindUsers ID="FindUsers1" runat="server" />
                </div>
                <div id="Offer">
                </div>
            </div>
        </div>
        <!-- End Heeader -->
        <div id="master">
            <div id="RightMaster">
                <div id="Information">
                    <div style="width: 160px;">
                        <uc3:NavRightTop ID="NavRightTop1" runat="server" />
                    </div>
                    <div style="width: 160px;">
                        <!-- -->
                        <!-- -->
                    </div>
                </div>
                <uc5:ADS ID="ADS1" runat="server" />
            </div>
            <div id="CenterMaster">
                <!-- -->
                <div class="DivTopContext" style="width: 737px;">
                    <div class="DivTop" style="width: 729px;">
                        آواتار
                    </div>
                    <div style="float: right; width: 743px;">
                        <div style="float: right; width: 743px;">
                            <asp:MultiView ID="M_Avatars" runat="server" ActiveViewIndex="0">
                                <asp:View ID="V_Upload" runat="server">
                                    <div style="text-align: center;">
                                    </div>
                                    <asp:Panel ID="pnlUpload" runat="server">
                                        <div style="width: 743px; padding: 3px;">
                                            <ul style="margin-right: 20px;">
                                                <li>نکات زیر را در ارسال آواتار رعایت کنید
                                                    <ul style="margin-right: 10px;">
                                                        <li style="font-size: 12px;">فرمت تصویر شما بهتر است از نوع JPEG یا JPG باشد.</li>
                                                        <li style="font-size: 12px;">تا بارگزاری کامل تصویر و نمایش برش عکس منتظر بمانید.</li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="style6">
                                                    <asp:FileUpload ID="Upload" runat="server" Style="display: none;" />
                                                    <a href="javascript:void(0)" onclick="OpenFileUpload()" style="font-family: koodak;
                                                        font-size: 12px; color: #000; text-decoration: none; margin-right: 2px; text-shadow: 0.2em 0.2em #DFDFDF;">
                                                        ( فایل خود را از اینجا انتخاب کنید )</a>
                                                </td>
                                                <td style="text-align: right">
                                                    <asp:ImageButton ID="btnUpload" runat="server" ForeColor="Transparent" runat="server"
                                                        ImageUrl="~/content/images/Home/UploadPhoto.jpg" Height="22px" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:Label ID="lblError" runat="server" Style="color: Red;" />
                                        <br />
                                        <br />
                                    </asp:Panel>
                                    <asp:Panel ID="pnlCrop" runat="server" Visible="false" Style="padding: 10px;">
                                        <div style="padding-right: 5px;">
                                            <ul>
                                                <li>اندازه عکس شما باید از 295*295 پیکسل بزرگتر باشد..</li>
                                                <li style="color: Red;">رنگ قرمز: اندازه تعیین شده صحیح نمی باشد.</li>
                                                <li style="color: Green;">رنگ سبز: اندازه تعیین شده صحیح می باشد.</li>
                                                <br />
                                            </ul>
                                            <div id="W_" style="padding: 3px; font-size: 13px; font-weight: bold;">
                                            </div>
                                            <br />
                                        </div>
                                        <asp:Image runat="server" ForeColor="Transparent" ID="imgCrop" runat="server" />
                                        <br />
                                        <asp:HiddenField ID="X" runat="server" />
                                        <asp:HiddenField ID="Y" runat="server" />
                                        <asp:HiddenField ID="W" runat="server" />
                                        <asp:HiddenField ID="H" runat="server" />
                                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnCrop" runat="server"
                                            ImageUrl="~/content/images/Home/crop.png" />
                                        <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnCancelCrop" runat="server"
                                            ImageUrl="~/content/images/Home/cancel_crop.png" />
                                        <br />
                                        <asp:Label ID="lblError2" runat="server" Style="color: Red;" />
                                    </asp:Panel>
                                    <asp:Panel ID="pnlCropped" runat="server" Visible="false">
                                        <asp:Image runat="server" ForeColor="Transparent" ID="imgCropped" runat="server" />
                                    </asp:Panel>
                                </asp:View>
                            </asp:MultiView>
                        </div>
                    </div>
                    <div style="border-bottom: 1px solid #DEDEDE; height: 16px; padding: 2px; color: #6c6c6c;
                        float: right; width: 733px;">
                        انتخاب آواتار اصلی پروفایل
                    </div>
                    <div style="float: right;">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:MultiView ID="M_ShowAvatars" runat="server" ActiveViewIndex="0">
                                    <asp:View ID="V_ShowAvatar" runat="server">
                                        <asp:DataList ID="DL_Avatars" runat="server" DataSourceID="ODS_Avatars" Width="16px"
                                            RepeatDirection="Horizontal" RepeatColumns="7">
                                            <ItemTemplate>
                                                <table class="style7">
                                                    <tr>
                                                        <td>
                                                            <asp:ImageButton
                                                             runat="server"
                                                              ForeColor="Transparent" ID="ImageButton3"
                                                               OnCommand="DeleteAvatar"
                                                                CommandArgument='<%# Eval("ID","{0}") %>' 
                                                                Visible='<%# VisibleDelete(DataBinder.Eval(Container.DataItem,"ID")) %>'
                                                                
                                                                ImageUrl="~/content/images/Home/deleteWork.jpg" 
                                                                 />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Panel ID="Panel1" BorderStyle="Solid" BorderColor='<%# BorderColorPanel(DataBinder.Eval(Container.DataItem,"flag")) %>'
                                                                BorderWidth="1" runat="server" Style="padding: 5px;">
                                                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton2" runat="server"
                                                                    Height="85px" Width="85px" OnCommand="UpdateFlag" CommandArgument='<%# Eval("ID","{0}") %>'
                                                                    ImageUrl='<%# "~/user/Crop.aspx?P=" + Eval("PicPath", "{0}")+ "&W=100&H=100" %>'
                                                                    AlternateText="تصویر غیر قابل دسترسی" />
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:DataList>
                                        <asp:ObjectDataSource ID="ODS_Avatars" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetData" TypeName="DS_SettingTableAdapters.Profile_AvatarsTableAdapter">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="email" SessionField="MY-UsErNaMe" Type="String" />
                                            </SelectParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="Email" Type="String" />
                                                <asp:Parameter Name="PicPath" Type="String" />
                                                <asp:Parameter Name="Flag" Type="Boolean" />
                                            </InsertParameters>
                                        </asp:ObjectDataSource>
                                    </asp:View>
                                    <asp:View ID="V_Delete" runat="server">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td style="width: 162px;">
                                                    آیا با حذف تصویر موافق هستید؟
                                                </td>
                                                <td style="width: 37px;">
                                                    <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnAcceptToDelete" runat="server"
                                                        ImageUrl="~/content/images/Home/AcceptIt.jpg" />
                                                </td>
                                                <td>
                                                    <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnCancelToDelete" runat="server"
                                                        ImageUrl="~/content/images/Home/CancelIt.jpg" />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:View>
                                </asp:MultiView>
                                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                    <ProgressTemplate>
                                        <img src="../../../content/images/Profile_View_Users/Loading_0.gif" />
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <!-- -->
            </div>
            <div id="LeftMaster">
                <uc4:LeftMenu ID="LeftMenu1" runat="server" />
            </div>
        </div>
        <uc6:Footer ID="Footer1" runat="server" />
    </div>
    </form>
</body>
</html>
