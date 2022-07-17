<%@ Page Language="VB" MasterPageFile="~/Shaahr/Subshaahr.master" AutoEventWireup="false"
    CodeFile="newThread.aspx.vb" Inherits="Shaahr_Default2" ValidateRequest="false"
    Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        @font-face
        {
            font-family: koodak;
            src: url(                            "../content/font/W_koodak.TTF" );
        }
        .style3
        {
            width: 359px;
        }
        .style4
        {
            width: 226px;
        }
        .style5
        {
            width: 53px;
        }
    </style>
    <%-------------------------------Editor---------------------------------%>

    <script type="text/javascript" src="../Content/Other/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>

    <script type="text/javascript">
	tinyMCE.init({
		// General options
		setup : function(ed) {
      ed.onInit.add(function(ed, evt) {

          var new_val = '300px';

          // adjust table element
          var elem = document.getElementById(ed.id + '_tbl');
          elem.style.height = new_val;

          // adjust iframe element
          var iframe = document.getElementById(ed.id + '_ifr');
          iframe.style.height = new_val;
      });
   },
   
   
		mode : "textareas",//exact
		theme : "advanced",		
		plugins : "",
        
		// Theme options
		theme_advanced_buttons1 : "justifyleft,justifyright,image",
		theme_advanced_buttons2 : "",
		theme_advanced_buttons3 : "",
		theme_advanced_buttons4 : "",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "right",
		theme_advanced_statusbar_location : "",//top//
		theme_advanced_resizing : false,
		
force_br_newlines:true,
force_p_newlines:false,
forced_root_block:'',
theme_advanced_source_editor_wrap:false,

		// Example content CSS (should be your site CSS)
		content_css : "../Content/Other/tinymce/css/content.css",

		// Drop lists for link/image/media/template dialogs
		template_external_list_url : "../Content/Other/tinymce/lists/template_list.js",
		external_link_list_url : "../Content/Other/tinymce/lists/link_list.js",
		external_image_list_url : "../Content/Other/tinymce/lists/image_list.js",
		media_external_list_url : "../Content/Other/tinymce/lists/media_list.js",

		// Style formats
		style_formats : [
			{title : 'Bold text', inline : 'b'},
			{title : 'Red text', inline : 'span', styles : {color : '#ff0000'}},
			{title : 'Red header', block : 'h1', styles : {color : '#ff0000'}},
			{title : 'Example 1', inline : 'span', classes : 'example1'},
			{title : 'Example 2', inline : 'span', classes : 'example2'},
			{title : 'Table styles'},
			{title : 'Table row 1', selector : 'tr', classes : 'tablerow1'}
		],

		// Replace values for the template plugin
		template_replace_values : {
			username : "Some User",
			staffid : "991234"
		}
		
	});



    </script>

    <%----------------------------------------------------------------------%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CenterContent" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
                    <asp:View ID="V_OK" runat="server">
                        <table class="style1">
                            <tr>
                                <td style="font-family: koodak; font-size: 14px;">
                                    ایجاد پست جدید
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table class="style1">
                                        <tr>
                                            <td class="style5">
                                                عنوان:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtSubjectInser" runat="server" Style="padding: 2px; border: 1px solid #929DA3;
                                                    font-family: Tahoma; font-size: 11px;" Width="676px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style5">
                                                <div style="height: 318px;">
                                                    متن:</div>
                                            </td>
                                            <td>
                                                <textarea id="txtTextInsert" runat="server" cols="20" name="elm1" rows="1" style="width: 682px;"> 
				
			</textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style5">
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ID="rbInsert" runat="server" RepeatDirection="Horizontal">
                                                    <asp:ListItem Selected="True" Value="1">نمایش</asp:ListItem>
                                                    <asp:ListItem Value="0">عدم نمایش</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style5">
                                            </td>
                                            <td>
                                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnInsert" runat="server"
                                                    ImageUrl="~/Content/images/Profile_View_Users/btnSend.jpg" ValidationGroup="1" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style5">
                                                &nbsp;
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSubjectInser"
                                                    ErrorMessage="عنوان پست را پر کنید." ValidationGroup="1"></asp:RequiredFieldValidator>
                                                <br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTextInsert"
                                                    ErrorMessage="متن را پر کنید." ValidationGroup="1"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="V_Nok" runat="server">
                        <table style="width: 100%;">
                            <tr>
                                <td style="width: 5px;">
                                    <img alt="" src="../Content/images/Home/info.gif" style="width: 14px; height: 14px" />
                                </td>
                                <td>
                                    کاربر محترم برای استفاده از امکانات این شهر باید عضو شوید.
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
    </table>
</asp:Content>
