<%@ Control Language="VB" AutoEventWireup="false" CodeFile="BilboardOstan.ascx.vb"
    Inherits="UserControl_Shaahr_BilboardOstan" %>
<!-- Tooltip Ostan's -->
<style type="text/css">
    #box
    {
        height: 91px;
        width: 190px;
        display: none;
        float: right;
    }
    #boxb
    {
        height: 91px;
        width: 190px;
        display: none;
        float: right;
    }
    #boxc
    {
        height: 91px;
        width: 190px;
        display: none;
        float: right;
    }
    #boxd
    {
        height: 91px;
        width: 190px;
        display: none;
        float: right;
    }
    #boxe
    {
        height: 91px;
        width: 190px;
        display: none;
        float: right;
    }
</style>

<script type="text/javascript">

		   $(function() {
		        $('#a1').click(function() {
				     $('#box').slideDown(1000); 
				   
                     $('#a1').hide();
                     $('#a2').show();
		        });
		   });

		   $(function() {
		        $('#a2').click(function() {
				     $('#box').slideUp(1000); 
				   
				     $('#a1').show();
                     $('#a2').hide();
		        });
		   });
		   
		   
		   $(function() {
		        $('#b1').click(function() {
				     $('#boxb').slideDown(1000); 
				    
                     $('#b1').hide();
                     $('#b2').show();
		        });
		   });

		   $(function() {
		        $('#b2').click(function() {
				     $('#boxb').slideUp(1000); 
				   
				     $('#b1').show();
                     $('#b2').hide();
		        });
		   });
		   
		   
		   
		    $(function() {
		        $('#c1').click(function() {
				     $('#boxc').slideDown(1000); 
				    
                     $('#c1').hide();
                     $('#c2').show();
		        });
		   });

		   $(function() {
		        $('#c2').click(function() {
				     $('#boxc').slideUp(1000); 
				   
				     $('#c1').show();
                     $('#c2').hide();
		        });
		   });
		   
		   
		   
		   
		      $(function() {
		        $('#d1').click(function() {
				     $('#boxd').slideDown(1000); 
				    
                     $('#d1').hide();
                     $('#d2').show();
		        });
		   });

		   $(function() {
		        $('#d2').click(function() {
				     $('#boxd').slideUp(1000); 
				   
				     $('#d1').show();
                     $('#d2').hide();
		        });
		   });
		   
		   
		   
		         $(function() {
		        $('#e1').click(function() {
				     $('#boxe').slideDown(1000); 
				    
                     $('#e1').hide();
                     $('#e2').show();
		        });
		   });

		   $(function() {
		        $('#e2').click(function() {
				     $('#boxe').slideUp(1000); 
				   
				     $('#e1').show();
                     $('#e2').hide();
		        });
		   });
		   
		   
</script>

<!-- End -->
<!-- [1] Ostan -->
<div style="width: 193px; height: 100%; border: 3px solid #ccc; -moz-border-radius: 5px;
    padding: 2px; float: right; margin-left: 3px;">
    <div style="float: right; width: 168px; height: 70px;">
        <table class="style6">
            <tr>
                <td>
                    خراسان شمالی - خراسان جنوبی خراسان رضوی - گلستان - گیلان مازندران - سمنان
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCount_State1" runat="server" Style="color: #0057AE"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div style="float: right; width: 25px; height: 77px; background-color: #8cc07e;">
        <table>
            <tr>
                <td style="font-family: koodak; font-size: 25px;">
                    <asp:Label ID="lblRankState_1" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <a id="a1" href="#">
                        <img border="0" src="../Content/images/Shaahrs/Root/help.png" /></a>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    <div id="box">
        <div style="background-color: #8CC07E; width: 193px;">
            <table style="width: 100%;">
                <tr>
                    <td>
                        جامعه مجازی شهر .... افتخار ما بار علمی و تفاوت محتوی ماست .... جامعه مجازی شهر
                        .... افتخار ما بار علمی و تفاوت محتوی ماست .... جامعه مجازی شهر .... افتخار ما بار
                        ماست ....
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="../MyShaahr/Help/Part/?Part=Shaahr&Ostan=1" style="text-decoration: none; color: #0A5081;">
                            [مشاهده جزییات]</a> <a id="a2" href="#" style="text-decoration: none; color: #E70505;">
                                [بستن]</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<!-- [2] Ostan -->
<div style="width: 193px; border: 3px solid #ccc; height: 100%; -moz-border-radius: 5px;
    padding: 2px; float: right; margin-left: 3px;">
    <div style="float: right; width: 168px; height: 70px;">
        <table class="style6">
            <tr>
                <td>
                    آذربایجان شرقی - آذربایجان غربی اردبیل - زنجان - کردستان - همدان قزوین - لرستان
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCount_State2" runat="server" Style="color: #0057AE"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div style="float: right; width: 25px; height: 77px; background-color: #8ddde9;">
        <table>
            <tr>
                <td style="font-family: koodak; font-size: 25px;">
                    <asp:Label ID="lblRankState_2" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <a id="b1" href="#">
                        <img border="0" src="../Content/images/Shaahrs/Root/help.png" /></a>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    <div id="boxb">
        <div style="background-color: #8DDDE9; width: 193px;">
            <table style="width: 100%;">
                <tr>
                    <td>
                        جامعه مجازی شهر .... افتخار ما بار علمی و تفاوت محتوی ماست .... جامعه مجازی شهر
                        .... افتخار ما بار علمی و تفاوت محتوی ماست .... جامعه مجازی شهر .... افتخار ما بار
                        ماست ....
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="../MyShaahr/Help/Part/?Part=Shaahr&Ostan=2" style="text-decoration: none; color: #0A5081;">
                            [مشاهده جزییات]</a> <a id="b2" href="#" style="text-decoration: none; color: #E70505;">
                                [بستن]</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<!-- [3] Ostan -->
<div style="width: 193px; border: 3px solid #ccc; height: 100%; -moz-border-radius: 5px;
    padding: 2px; float: right; margin-left: 2px;">
    <div style="float: right; width: 168px; height: 70px;">
        <table class="style6">
            <tr>
                <td>
                    اصفهان - قم - مرکزی - خوزستان ایلام
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCount_State3" runat="server" Style="color: #0057AE"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div style="float: right; width: 25px; height: 77px; background-color: #f7f56d;">
        <table>
            <tr>
                <td style="font-family: koodak; font-size: 25px;">
                    <asp:Label ID="lblRankState_3" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <a id="c1" href="#">
                        <img border="0" src="../Content/images/Shaahrs/Root/help.png" /></a>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    <div id="boxc">
        <div style="background-color: #F7F56D; width: 193px;">
            <table style="width: 100%;">
                <tr>
                    <td>
                        جامعه مجازی شهر .... افتخار ما بار علمی و تفاوت محتوی ماست .... جامعه مجازی شهر
                        .... افتخار ما بار علمی و تفاوت محتوی ماست .... جامعه مجازی شهر .... افتخار ما بار
                        ماست ....
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="../MyShaahr/Help/Part/?Part=Shaahr&Ostan=3" style="text-decoration: none; color: #0A5081;">
                            [مشاهده جزییات]</a> <a id="c2" href="#" style="text-decoration: none; color: #E70505;">
                                [بستن]</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<!-- [4] Ostan -->
<div style="width: 193px; border: 3px solid #ccc; height: 100%; -moz-border-radius: 5px;
    padding: 2px; float: right; margin-top: 4px; margin-left: 2px;">
    <div style="float: right; width: 168px; height: 70px;">
        <table class="style6">
            <tr>
                <td>
                    تهران - کرج
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCount_State4" runat="server" Style="color: #0057AE"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div style="float: right; width: 25px; height: 77px; background-color: #f5ab69;">
        <table class="style6">
            <tr>
                <td style="font-family: koodak; font-size: 25px;">
                    <asp:Label ID="lblRankState_4" runat="server"></asp:Label>
                </td>
            </tr>
            <td>
                <a id="d1" href="#">
                    <img border="0" src="../Content/images/Shaahrs/Root/help.png" /></a>
            </td>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    <div id="boxd">
        <div style="background-color: #F5AB69; width: 193px;">
            <table style="width: 100%;">
                <tr>
                    <td>
                        جامعه مجازی شهر .... افتخار ما بار علمی و تفاوت محتوی ماست .... جامعه مجازی شهر
                        .... افتخار ما بار علمی و تفاوت محتوی ماست .... جامعه مجازی شهر .... افتخار ما بار
                        ماست ....
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="../MyShaahr/Help/Part/?Part=Shaahr&Ostan=4" style="text-decoration: none; color: #0A5081;">
                            [مشاهده جزییات]</a> <a id="d2" href="#" style="text-decoration: none; color: #E70505;">
                                [بستن]</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<!-- [5] Ostan -->
<div style="width: 193px; border: 3px solid #ccc; height: 100%; -moz-border-radius: 5px;
    padding: 2px; float: right; margin-top: 4px; margin-left: 2px;">
    <div style="float: right; width: 168px; height: 70px;">
        <table class="style6">
            <tr>
                <td>
                    سیستان و بلوچستان - کرمان یزد - هرمزگان - فارس - بوهشهر چهارمحال و بختیاری موهکلیویه
                    و بویراحمر
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCount_State5" runat="server" Style="color: #0057AE"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div style="float: right; width: 25px; height: 77px; background-color: #e57cc9;">
        <table class="style6">
            <tr>
                <td style="font-family: koodak; font-size: 25px;">
                    <asp:Label ID="lblRankState_5" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <a id="e1" href="#">
                        <img border="0" src="../Content/images/Shaahrs/Root/help.png" /></a>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    <div id="boxe">
        <div style="background-color: #E57CC9; width: 193px;">
            <table style="width: 100%;">
                <tr>
                    <td>
                        جامعه مجازی شهر .... افتخار ما بار علمی و تفاوت محتوی ماست .... جامعه مجازی شهر
                        .... افتخار ما بار علمی و تفاوت محتوی ماست .... جامعه مجازی شهر .... افتخار ما بار
                        ماست ....
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="../MyShaahr/Help/Part/?Part=Shaahr&Ostan=1" style="text-decoration: none; color: #0A5081;">
                            [مشاهده جزییات]</a> <a id="e2" href="#" style="text-decoration: none; color: #E70505;">
                                [بستن]</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
