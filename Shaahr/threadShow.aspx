<%@ Page Language="VB" MasterPageFile="~/Shaahr/Subshaahr.master" AutoEventWireup="false"
    CodeFile="threadShow.aspx.vb" Inherits="Shaahr_Default2" ValidateRequest="false"
    Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        @font-face
        {
            font-family: koodak;
            src: url(                                       "../content/font/W_koodak.TTF" );
        }
        .style5
        {
            width: 592px;
        }
        .style6
        {
            width: 54px;
        }
        .style7
        {
            width: 57px;
        }
        .style8
        {
            width: 57px;
            height: 26px;
        }
        .style9
        {
            height: 26px;
        }
        .style10
        {
            width: 52px;
        }
        .style11
        {
            width: 627px;
        }
        .style12
        {
            width: 60px;
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
    <table class="style3">
        <tr>
            <td>
                <div style="-moz-border-radius: 5px; border: 3px solid #ccc;">
                    <asp:DataList ID="DL_Post" runat="server" DataKeyField="Code" DataSourceID="ODS_Post"
                        Width="726px">
                        <ItemTemplate>
                            <table class="style3">
                                <tr>
                                    <td>
                                        <h1 style="font-weight: normal;">
                                            <div style="background-color: #587E8B; padding: 4px; color: White; font-family: koodak;
                                                font-size: 14px;">
                                                <asp:Label ID="SubjectLabel" runat="server" Text='<%# Eval("Subject") %>' />
                                            </div>
                                        </h1>
                                        <hr style="border-bottom: 1px Solid #ccc; border-top: 0; border-left: 0; border-right: 0;" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <h1 style="font-weight: normal;">
                                            <asp:Label ID="TextLabel" runat="server" Text='<%# Eval("Text") %>' />
                                        </h1>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="background-color: #D9EBE4; -moz-border-radius: 5px; padding: 5px; border: 2px solid #D9E4E8;">
                                            <table class="style3">
                                                <tr>
                                                    <td class="style11">
                                                        <table class="style3">
                                                            <tr>
                                                                <td class="style12">
                                                                    زیر گروه:
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label2" runat="server" Style="color: #CC0000; font-style: italic;"
                                                                        Text='<%# GetCategory(DataBinder.Eval(Container.DataItem,"CodeCategory")) %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style12">
                                                                    گذارنده:
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label1" runat="server" Style="color: #00538A" Text='<%# GetFN(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style12">
                                                                    تاریخ:
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="dateLabel" runat="server" Style="color: #0033CC" Text='<%# Eval("date") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style12">
                                                                    زمان:
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="TimeLabel" runat="server" Style="color: #0099CC" Text='<%# Eval("Time") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style12">
                                                                    بازدید ها:
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="VisitLabel" runat="server" Style="font-weight: 700" Text='<%# Eval("Visit") %>' />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td>
                                                        <asp:Image runat="server" ForeColor="Transparent" ID="ImageButton5" runat="server"
                                                            ImageUrl="~/Content/images/Shaahrs/Root/lock.png" Visible='<%# CheckLuckPost(DataBinder.Eval(Container.DataItem,"code")) %>' />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:ObjectDataSource ID="ODS_Post" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Shaahr_ShaahrPost_ShowThreadTableAdapter"
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
                            <asp:QueryStringParameter Name="code" QueryStringField="cdP" Type="Int64" />
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
            </td>
        </tr>
        <tr>
            <td>
                <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnNewAnswer" runat="server"
                    ImageUrl="~/Content/images/Shaahrs/Root/answer.png" />
                <div runat="server" id="NotUser" visible="false">
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
                </div>
                <asp:Panel ID="PnlAnswer" runat="server" Visible="False" Style="padding: 3px; background-color: #F1F1F1;
                    border: 3px solid #e0e0e0;">
                    <table class="style3">
                        <tr>
                            <td class="style7">
                                عنوان:
                            </td>
                            <td>
                                <asp:TextBox ID="txtSubject" runat="server" Style="width: 675px; border: 1px solid #CCCCCC;
                                    font-family: Tahoma; font-size: 11px; padding: 2px;"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style8">
                                <div style="height: 318px;">
                                    متن:</div>
                            </td>
                            <td class="style9">
                                <textarea id="txtText" runat="server" cols="20" name="elm1" rows="1" style="width: 682px;"> 
				
			</textarea>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                &nbsp;
                            </td>
                            <td>
                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnInsert" runat="server"
                                    Height="21px" ImageUrl="~/Content/images/Profile_View_Users/btnSend.jpg" ValidationGroup="1" />
                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="btnCancel" runat="server"
                                    ImageUrl="~/Content/images/Home/btnCancel.jpg" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                &nbsp;
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSubject"
                                    ErrorMessage="عنوان خبر را وارد کنید." ValidationGroup="1"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtText"
                                    ErrorMessage="متن خبر را وارد کنید." ValidationGroup="1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <div style="-moz-border-radius: 3px; border: 2px solid #ccc; padding: 3px;">
                    <asp:DataList ID="DL_Answer" runat="server" DataSourceID="ODS_Answer" Width="725px">
                        <ItemTemplate>
                            <table class="style3">
                                <tr>
                                    <td>
                                        <div style="background-color: #89acb8; padding-right: 4px; color: White; font-family: koodak;
                                            font-size: 14px; -moz-border-radius: 3px;">
                                            <table class="style3">
                                                <tr>
                                                    <td>
                                                        <table class="style3">
                                                            <tr>
                                                                <td class="style10">
                                                                    <asp:Image runat="server" ForeColor="Transparent" ID="Image1" runat="server" Height="70px"
                                                                        Style="-moz-border-radius: 5px" ImageUrl='<%# GetAvatar(DataBinder.Eval(Container.DataItem,"email")) %>'
                                                                        Width="70px" />
                                                                </td>
                                                                <td>
                                                                    <table class="style3">
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="Label1" runat="server" Style="color: #000000; font-weight: 700;" Text='<%# GetFN(DataBinder.Eval(Container.DataItem,"email")) %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="Label4" runat="server" Text='<%# GetUser(DataBinder.Eval(Container.DataItem,"email")) %>'
                                                                                    Style="font-weight: 700"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                &nbsp;
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:ImageButton runat="server" ForeColor="Transparent" ID="ImageButton41" runat="server"
                                                                                    CommandArgument='<%# Eval("id","{0}") %>' Visible='<%# CheckVisibleDelete(DataBinder.Eval(Container.DataItem,"id")) %>'
                                                                                    ImageUrl="~\content/images/Stage/Jiring/remove.png" OnCommand="Delete" />
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
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <h1 style="font-weight: normal;">
                                            <asp:Label ID="Label3" runat="server" Style="font-family: koodak; font-size: 14px;
                                                font-weight: 700;" Text='<%# Eval("Subject") %>' />
                                        </h1>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <h1 style="font-weight: normal;">
                                            <asp:Label ID="textLabel" runat="server" Text='<%# Eval("text") %>' />
                                        </h1>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' Style="color: #0066CC" />
                                        / &nbsp;
                                        <asp:Label ID="timeLabel" runat="server" Text='<%# Eval("time") %>' Style="color: #0066CC" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:ObjectDataSource ID="ODS_Answer" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="DS_ShaahrTableAdapters.Shaahr_AnswerPostTableAdapter">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="codepost" QueryStringField="cdP" Type="Int64" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="CodePost" Type="Int64" />
                            <asp:Parameter Name="Subject" Type="String" />
                            <asp:Parameter Name="text" Type="String" />
                            <asp:Parameter Name="email" Type="String" />
                            <asp:Parameter Name="time" Type="String" />
                            <asp:Parameter Name="_date" Type="String" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                    <asp:Label ID="lblNotAnswer" runat="server" Style="color: #666666"></asp:Label>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
