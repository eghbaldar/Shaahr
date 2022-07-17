<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Src="~/UserControl/Root/Footer.ascx" TagName="Footer" TagPrefix="uc6" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link rel="SHORTCUT ICON" href="content/images/Home/ShaahrFavorite.png">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Content/css/Browser/css_default.css" rel="stylesheet" type="text/css" />
    <title>. . . به شهر دات کام خوش آمدید</title>
    <style type="text/css">
        .style4
        {
            width: 100%;
        }
        @font-face
        {
            font-family: koodak;
            src: url(                                                                 "content/font/W_koodak.TTF" );
        }
        .style8
        {
            width: 87px;
        }
        .style9
        {
            width: 67px;
            text-align: left;
        }
        .style10
        {
            width: 87px;
            text-align: left;
        }
        .style11
        {
            width: 32px;
        }
        .News
        {
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            background-color: #b6d5db;
            width: 201px;
            padding: 1px;
        }
        .Login
        {
            background-color: #d7d7d7;
            height: 100%;
            width: 204px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            border: 1px solid #7fbecb;
        }
        .BtnLogin
        {
            background-color: #88BBD0;
            height: 15px;
            width: 38px;
            border: 1px solid #B3B8CC;
            padding: 3px;
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            border-radius: 3px;
        }
        .ADS
        {
            background-color: #afd3da;
            -moz-border-radius: 5px;
            width: 429px;
            height: 430px;
            padding: 5px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }
        .Intt
        {
            background-color: #B0D9E0;
            -moz-border-radius: 5px;
            width: 298px;
            height: 185px;
            padding: 2px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }
    </style>
    <!-- Talk -->
    <link href="Content/js/Talk_Register/jquery.tooltip_Defualt.css" rel="stylesheet"
        type="text/css" />

    <script type="text/javascript" src="jquery.min.js"></script>

    <script src="Content/js/Talk_Register/jquery.tooltip.js" type="text/javascript"></script>

    <script type="text/javascript">
      $j = jQuery.noConflict();
      $j(document).ready(function(){
        $j("div.item").tooltip();
      });
    </script>

    <!-- Enter -->

    <script type="text/javascript">
    
        function Btn_Click(e,objBtnID)
        {
            var evt = e ? e : window.event;
            var bt = document.getElementById(objBtnID);
            if(bt)
            {
                if(evt.keyCode == 13)
                    {
                        bt.click();
                        return false ;
                    }
            }
        }

    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div id="body">
        <div id="master">
            <div id="TopHigh">
                <asp:Image ID="imgHeader" runat="server" />
            </div>
            <div id="Center">
                <div id="Center_Right">
                    <div class="Intt">
                        <table class="style4">
                            <tr>
                                <td>
                                    <samp style="color: #8b8b8b; font-family: Tahoma; font-size: 11px;">
                                        <asp:Label ID="lblDateTime" runat="server" Style="font-size: 10px"></asp:Label>
                                    </samp>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblText" runat="server" Style="color: #2B626D; text-shadow: 2px 2px 0.1em #74aab5;"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table class="style4">
                                        <tr>
                                            <td>
                                                <asp:ImageButton ForeColor="Transparent" AlternateText="" ID="imgPicDay" runat="server" />
                                            </td>
                                            <td>
                                                <asp:Label ID="lblDayText" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div id="Center_Center">
                    <div class="ADS">
                        <div style="opacity: 1;">
                        </div>
                    </div>
                </div>
                <div id="Center_Left">
                    <table class="style4">
                        <tr>
                            <td>
                                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Width="175px">
                                    <ItemTemplate>
                                        <div class="News">
                                            <table style="width: 100%; text-align: right;">
                                                <tr>
                                                    <td>
                                                        <a style="color: #000; text-decoration: none;" target="_blank" href='<%# Eval("ID","MyShaahr/news/news.aspx?IDnews={0}") %>'>
                                                            <asp:Label ID="lid_newsLabel" runat="server" Text='<%# Eval("lid_news") %>' Style="color: #000;
                                                                font-size: 10px;" /></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="tarikhLabel" Style="color: #3997a9; font-size: 11px;" runat="server"
                                                            Text='<%# Eval("tarikh") %>' />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:shaahrConnectionString %>"
                                    SelectCommand="SELECT Top 3 *
FROM [Tbl_CMS_News] 
WHERE ([Flag] = @Flag) and (type=0)
ORDER BY [ID] DESC">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="true" Name="Flag" Type="Boolean" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:MultiView ID="mvLogin" runat="server" ActiveViewIndex="0">
                                    <asp:View ID="vLogin" runat="server">
                                        <div class="Login">
                                            <table class="style4">
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtEmail" runat="server" Style="text-align: left; font-weight: bold;
                                                            padding: 5px; width: 183px; border: 2px solid #cecece;direction:ltr;" Text="           پست اکترونیکی            "
                                                            ForeColor="#999999" onfocus="if(this.value=='           پست اکترونیکی            '){this.value='';}"
                                                            onblur="if(this.value==''){this.value='           پست اکترونیکی            ';}if(this.value=='           پست اکترونیکی            ')this.style.color='#999999';"
                                                            onmousedown="this.style.color='#000000';" onkeydown="if(event.keyCode==13){return InsertComment(this.value);}"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtPassword" runat="server" Style="text-align: left; padding: 5px;direction:ltr;
                                                            width: 183px; border: 2px solid #cecece;" TextMode="Password"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                        <table class="style4">
                                                            <tr>
                                                                <td>
                                                                    <div class="BtnLogin">
                                                                        <asp:LinkButton ID="btnEnter"
                                                                         runat="server" Style="color: #fff; text-decoration: none;"
                                                                            ValidationGroup="1">ادامه...</asp:LinkButton>
                                                                        <a href="#" rel="htmltooltip" style="color: #FFF; text-decoration: none;"></a>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <a href="Outscope/CreateAccount/">
                                                                        <asp:Image ForeColor="Transparent" AlternateText="" ID="imgRegister" ImageUrl="~/Content/images/footer/btnSingIn.png"
                                                                            runat="server" Style="width: 15px; height: 15px" />
                                                                    </a>
                                                                </td>
                                                                <td>
                                                                    <a href="outscope/state.aspx?state=Password" style="text-decoration: none;">
                                                                        <img alt="" src="Content/images/footer/btnRemember.png" style="width: 15px; height: 15px"
                                                                            border="0" />
                                                                    </a>
                                                                </td>
                                                                <td>
                                                                    <div id="item_3" class="item">
                                                                        <asp:Image ForeColor="Transparent" AlternateText="" ID="imgErr" runat="server" ImageUrl="~/content/images/HomePage/err.gif"
                                                                            Visible="False" />
                                                                        <div class="tooltip_description" style="display: none;" title="خطا هنگام ورود">
                                                                            پست الکترونیکی ویا کلمه عبور اشتباه وارد شده است. لطفا دقت کنید
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <asp:CheckBox ID="chkRemember" runat="server" Text="یادآوری" />
                                                                </td>
                                                                <td>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail"
                                                                        ErrorMessage="●" ValidationGroup="1"></asp:RequiredFieldValidator>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                                                                        ErrorMessage="●" ValidationGroup="1"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        
                                                        
                                                        
                                                        
                                                        
                                                        
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </asp:View>
                                    <asp:View ID="vSignture" runat="server" EnableTheming="True">
                                        <div style="background-color: #B6D5DB; -moz-border-radius: 5px; border: 1px solid #B0D9E0;">
                                            <table class="style1">
                                                <tr>
                                                    <td>
                                                        <table class="style4">
                                                            <tr>
                                                                <td>
                                                                    <table class="style4">
                                                                        <tr>
                                                                            <td class="style11">
                                                                                <asp:Image ID="imgSignture" ForeColor="Transparent" AlternateText="" runat="server"
                                                                                    BorderColor="#999999" BorderStyle="Dashed" BorderWidth="2px" Height="60px" Width="60px" />
                                                                            </td>
                                                                            <td>
                                                                                <table class="style4">
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:ImageButton ForeColor="Transparent" AlternateText="" ID="btnGotoHome" runat="server"
                                                                                                ImageUrl="~/content/images/HomePage/GoHome.gif" ToolTip="ورود به خانه" />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:ImageButton ForeColor="Transparent" AlternateText="" ID="btnDeleteCookie" runat="server"
                                                                                                ImageUrl="~/content/images/HomePage/OutHome.gif" ToolTip="خروج از محدوده" />
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="lblFnSignutre" runat="server" Style="font-size: 11px; font-weight: bold;"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="lblLastDate" runat="server" Style="color: Gray;"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label1" runat="server" Text=" نمی توانم دسترسی داشته باشم"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </asp:View>
                                    <asp:View ID="vDontEnter" runat="server">
                                        <table class="style1">
                                            <tr>
                                                <td>
                                                    <img alt="" src="Content/images/Home/DontEnter.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div style="background-color: Red; color: White; padding: 5px; -moz-border-radius: 3px;
                                                        width: 190px;">
                                                        <asp:Label ID="lblDontEnter" runat="server"></asp:Label></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    با تشکر مدیریت شهر دات کام
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:View>
                                </asp:MultiView>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table class="style4">
                                    <tr>
                                        <td class="style8">
                                            <table class="style4">
                                                <tr>
                                                    <td class="style10">
                                                        <asp:Label ID="lblUsers" runat="server" Style="font-family: koodak; font-size: 13px;
                                                            text-align: left;"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <img alt="" src="Content/images/footer/member.png" style="width: 24px; height: 20px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style10">
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            <table class="style4">
                                                <tr>
                                                    <td class="style9">
                                                        <asp:Label ID="lblOnline" runat="server" Style="font-family: koodak; font-size: 13px;
                                                            text-align: left;"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <img src="Content/images/footer/online.gif" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style9">
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <uc6:Footer ID="Footer1" runat="server" />
        </div>
    </div>
    </form>
</body>
</html>
