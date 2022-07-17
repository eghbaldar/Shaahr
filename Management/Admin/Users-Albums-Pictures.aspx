<%@ Page Language="VB" MasterPageFile="~/Management/Admin/CMS.master" AutoEventWireup="false"
    CodeFile="Users-Albums-Pictures.aspx.vb" Inherits="Management_Admin_Users_Albums_Pictures"
    Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <b>آلبوم ها</b>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_Album" runat="server" AutoGenerateColumns="False" BackColor="White"
                    BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1"
                    DataKeyNames="Code" DataSourceID="ODS_Album" GridLines="None">
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                    <Columns>
                        <asp:BoundField DataField="Code" HeaderText="Code" InsertVisible="False" ReadOnly="True"
                            SortExpression="Code" Visible="False" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" Visible="False" />
                        <asp:BoundField DataField="AlbumName" HeaderText="نام آلبوم" SortExpression="AlbumName" />
                        <asp:BoundField DataField="date" HeaderText="تاریخ درج آلبوم" SortExpression="date" />
                        <asp:TemplateField FooterText="تعداد عکس ها" HeaderText="تعداد عکس های آلبوم">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="" Text='<%# GetCountPhoto(DataBinder.Eval(Container.DataItem,"code")) %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton3" runat="server" OnCommand="DeleteAlbum" OnClientClick="return confirm('مطمئن؟');"
                                    CommandArgument='<%# Eval("code","{0}") %>' ImageUrl="~/Content/images/Home/Delete.png" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                    <EmptyDataTemplate>
                        رکوردی وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Album" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_CMS_PostTableAdapters.Profile_AlbumTableAdapter"
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_Code" Type="Int64" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="AlbumName" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="Original_Code" Type="Int64" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="email" QueryStringField="email" Type="String" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="AlbumName" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <b>عکس های آلبوم&nbsp; نشده</b>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="DG_PhotoNotAlbum" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84"
                    BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2"
                    DataKeyNames="code" DataSourceID="ODS_PhotoNotAlbum">
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <Columns>
                        <asp:BoundField DataField="code" HeaderText="code" InsertVisible="False" ReadOnly="True"
                            SortExpression="code" Visible="False" />
                        <asp:TemplateField HeaderText="نام و نام خانوادگی فرسنده" SortExpression="Email">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# getFnLn(DataBinder.Eval(Container.DataItem,"email")) %>'
                                    Style="font-size: 13px; color: #FF0000;"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="for_who" HeaderText="for_who" SortExpression="for_who"
                            Visible="False" />
                        <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" Visible="False" />
                        <asp:TemplateField HeaderText="/////////////////////////" SortExpression="string_factor">
                            <ItemTemplate>
                                <asp:Image ID="Image3" runat="server" ImageUrl='<%#"~/user/CropPhoto.aspx?P=" +Eval("string_factor", "{0}")+ "&W=127&H=96" %>'
                                    Height="140px" Width="183px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="date" HeaderText="تاریخ" SortExpression="date" />
                        <asp:BoundField DataField="time" HeaderText="زمان" SortExpression="time" />
                        <asp:BoundField DataField="detail" HeaderText="جزییات" SortExpression="detail" />
                        <asp:BoundField DataField="OrgDate" HeaderText="OrgDate" SortExpression="OrgDate"
                            Visible="False" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton4" runat="server" OnCommand="DeletePhoto" OnClientClick="return confirm('مطمئن؟');"
                                    CommandArgument='<%# Eval("code","{0}") %>' ImageUrl="~/Content/images/Home/Delete.png" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        رکوردی وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_PhotoNotAlbum" runat="server" DeleteMethod="Delete"
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                    TypeName="DS_CMS_PostTableAdapters.Profile_Photo_Not_AlbumTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_code" Type="Int64" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="for_who" Type="String" />
                        <asp:Parameter Name="type" Type="Int32" />
                        <asp:Parameter Name="string_factor" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="time" Type="String" />
                        <asp:Parameter Name="detail" Type="String" />
                        <asp:Parameter Name="OrgDate" Type="String" />
                        <asp:Parameter Name="Original_code" Type="Int64" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="email" QueryStringField="email" Type="String" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="for_who" Type="String" />
                        <asp:Parameter Name="type" Type="Int32" />
                        <asp:Parameter Name="string_factor" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="time" Type="String" />
                        <asp:Parameter Name="detail" Type="String" />
                        <asp:Parameter Name="OrgDate" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <b>عکس هایی که خودش گذاشته است.</b>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="dgPost" runat="server" AutoGenerateColumns="False" DataKeyNames="code"
                    DataSourceID="ODS_Himself" CellPadding="4" ForeColor="#333333" GridLines="None"
                    AllowPaging="True">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="code" HeaderText="code" InsertVisible="False" ReadOnly="True"
                            SortExpression="code" Visible="False" />
                        <asp:TemplateField HeaderText="فرستنده" SortExpression="Email">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# getFnLn(DataBinder.Eval(Container.DataItem,"email")) %>'
                                    Style="font-size: 13px; color: #FF0000;"></asp:Label>
                                <br />
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Email") %>' Style="font-weight: 700"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle Width="200px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="گیرنده" SortExpression="for_who">
                            <ItemTemplate>
                                <asp:Label ID="Label34" runat="server" Text='<%# getFnLn(DataBinder.Eval(Container.DataItem,"for_who")) %>'
                                    Style="font-size: 13px; color: #006600;"></asp:Label>
                                <br />
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("for_who") %>' Style="font-weight: 700"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("for_who") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle Width="200px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" Visible="False">
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="string_factor" HeaderText="string_factor" SortExpression="string_factor"
                            Visible="False" />
                        <asp:BoundField DataField="date" HeaderText="تاریخ" SortExpression="date" />
                        <asp:BoundField DataField="time" HeaderText="زمان" SortExpression="time">
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="detail" HeaderText="detail" SortExpression="detail" Visible="False" />
                        <asp:BoundField DataField="OrgDate" HeaderText="OrgDate" SortExpression="OrgDate"
                            Visible="False" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" CommandArgument='<%# Eval("code","{0}")+"|"+Eval("email","{0}") %>'
                                    OnCommand="DetailPost" runat="server">جزییات</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" OnClientClick="return confirm('آیا از حذف مطمئن هستید؟');"
                                    OnCommand="DeletePost" CommandArgument='<%# Eval("code","{0}") %>' runat="server"
                                    ImageUrl="~/Management/Content/Images/close.jpg" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" OnCommand="RedirectUser" CommandArgument='<%# Eval("email","{0}") %>'
                                    BackColor="#66CCFF" BorderStyle="None" Style="font-family: Tahoma; font-size: 11px"
                                    Text="فرستنده" />
                                <asp:Button ID="Button2" runat="server" BackColor="#AEC554" OnCommand="RedirectUser"
                                    CommandArgument='<%# Eval("for_who","{0}") %>' BorderStyle="None" Style="font-family: Tahoma;
                                    font-size: 11px" Text="گیرنده" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="نوع">
                            <ItemTemplate>
                                <asp:Image ID="Image1" ImageUrl='<%# ControlImage(DataBinder.Eval(Container.DataItem,"type")) %>'
                                    runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        رکوردی وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Himself" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="DS_CMS_PostTableAdapters.Pictures_By_HimselfTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Email" QueryStringField="email" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <b>عکس هایی که دیگران فرستاده اند.</b>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="dgPost0" runat="server" AutoGenerateColumns="False" DataKeyNames="code"
                    DataSourceID="ODS_Other" CellPadding="4" ForeColor="#333333" GridLines="None"
                    AllowPaging="True">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="code" HeaderText="code" InsertVisible="False" ReadOnly="True"
                            SortExpression="code" Visible="False" />
                        <asp:TemplateField HeaderText="فرستنده" SortExpression="Email">
                            <ItemTemplate>
                                <asp:Label ID="Label35" runat="server" Text='<%# getFnLn(DataBinder.Eval(Container.DataItem,"email")) %>'
                                    Style="font-size: 13px; color: #FF0000;"></asp:Label>
                                <br />
                                <asp:Label ID="Label36" runat="server" Text='<%# Bind("Email") %>' Style="font-weight: 700"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle Width="200px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="گیرنده" SortExpression="for_who">
                            <ItemTemplate>
                                <asp:Label ID="Label37" runat="server" Text='<%# getFnLn(DataBinder.Eval(Container.DataItem,"for_who")) %>'
                                    Style="font-size: 13px; color: #006600;"></asp:Label>
                                <br />
                                <asp:Label ID="Label38" runat="server" Text='<%# Bind("for_who") %>' Style="font-weight: 700"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("for_who") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle Width="200px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" Visible="False">
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="string_factor" HeaderText="string_factor" SortExpression="string_factor"
                            Visible="False" />
                        <asp:BoundField DataField="date" HeaderText="تاریخ" SortExpression="date" />
                        <asp:BoundField DataField="time" HeaderText="زمان" SortExpression="time">
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="detail" HeaderText="detail" SortExpression="detail" Visible="False" />
                        <asp:BoundField DataField="OrgDate" HeaderText="OrgDate" SortExpression="OrgDate"
                            Visible="False" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton3" CommandArgument='<%# Eval("code","{0}")+"|"+Eval("email","{0}") %>'
                                    OnCommand="DetailPost" runat="server">جزییات</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton2" OnClientClick="return confirm('آیا از حذف مطمئن هستید؟');"
                                    OnCommand="DeletePost" CommandArgument='<%# Eval("code","{0}") %>' runat="server"
                                    ImageUrl="~/Management/Content/Images/close.jpg" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button3" runat="server" OnCommand="RedirectUser" CommandArgument='<%# Eval("email","{0}") %>'
                                    BackColor="#66CCFF" BorderStyle="None" Style="font-family: Tahoma; font-size: 11px"
                                    Text="فرستنده" />
                                <asp:Button ID="Button4" runat="server" BackColor="#AEC554" OnCommand="RedirectUser"
                                    CommandArgument='<%# Eval("for_who","{0}") %>' BorderStyle="None" Style="font-family: Tahoma;
                                    font-size: 11px" Text="گیرنده" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="نوع">
                            <ItemTemplate>
                                <asp:Image ID="Image2" ImageUrl='<%# ControlImage(DataBinder.Eval(Container.DataItem,"type")) %>'
                                    runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        رکوردی وجود ندارد.
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ODS_Other" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DS_CMS_PostTableAdapters.Pictures_By_OtherTableAdapter"
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_code" Type="Int64" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="for_who" Type="String" />
                        <asp:Parameter Name="type" Type="Int32" />
                        <asp:Parameter Name="string_factor" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="time" Type="String" />
                        <asp:Parameter Name="detail" Type="String" />
                        <asp:Parameter Name="OrgDate" Type="String" />
                        <asp:Parameter Name="Original_code" Type="Int64" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Email" QueryStringField="email" Type="String" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="for_who" Type="String" />
                        <asp:Parameter Name="type" Type="Int32" />
                        <asp:Parameter Name="string_factor" Type="String" />
                        <asp:Parameter Name="_date" Type="String" />
                        <asp:Parameter Name="time" Type="String" />
                        <asp:Parameter Name="detail" Type="String" />
                        <asp:Parameter Name="OrgDate" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
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
