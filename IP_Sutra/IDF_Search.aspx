<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="IDF_Search.aspx.cs" Inherits="IP_Sutra.IDF_Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        
    </style>

    <script type="text/javascript">

         <%--function to show mouse hove on grid--%>
        function pageLoad() {
            $("[id*=grd_CRSearch] td").hover(function () {
                $("td", $(this).closest("tr")).addClass("gridhover_row");
            }, function () {
                $("td", $(this).closest("tr")).removeClass("gridhover_row");
                });
            $("[id*=grd_DGSearch] td").hover(function () {
                $("td", $(this).closest("tr")).addClass("gridhover_row");
            }, function () {
                $("td", $(this).closest("tr")).removeClass("gridhover_row");
                });
            $("[id*=grd_TMSearch] td").hover(function () {
                $("td", $(this).closest("tr")).addClass("gridhover_row");
            }, function () {
                $("td", $(this).closest("tr")).removeClass("gridhover_row");
                });
            $("[id*=grd_PTSearch] td").hover(function () {
                $("td", $(this).closest("tr")).addClass("gridhover_row");
            }, function () {
                $("td", $(this).closest("tr")).removeClass("gridhover_row");
            });

        }
        

         <%--function to auto hide msg label--%>
        function HideLabel() {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1500);
        };

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManagerFES" EnablePageMethods="true" ScriptMode="Release" EnableCdn="true"></asp:ScriptManager>
    <div class="dashboard-wrapper">
        <div class="dashboard-ecommerce">
            <div class="container-fluid dashboard-content">
                <h4 class="auto-style1">IDF Search: </h4>
                <hr style="border-bottom: 1px thin; border-bottom-color: crimson; width: 100%; height: 5px" />
                <asp:UpdatePanel runat="server">

                    <ContentTemplate>
                        <div class="MsgStyle">

                            <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Text="" Visible="false" CssClass="MsgS"></asp:Label>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSearch_copyright" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnSearch_Tradmark" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnSearch_Design" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnSearch_Patent" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <div class="row">
                    <div class="form-group col-md-6"></div>
                </div>
                <asp:UpdatePanel runat="server">

                    <ContentTemplate>
                        <div class="row">
                            <div class="form-group col-4"></div>

                            <div class="form-group col-4 rb">

                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="rbl" RepeatDirection="Horizontal"
                                    OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="true" RepeatLayout="Table">

                                    <asp:ListItem Text="Copyright" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Tradmark" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Design" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="Patent" Value="4"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                            <div class="form-group col-4"></div>
                        </div>
                        <%--<div class="row">
                    <div class="form-group col-md-3"></div>
                    <div class="form-group col-md-3"></div>


                    <div class="form-group col-md-3"></div>
                    <div class="form-group col-md-3"></div>
                </div>--%>
                        <%--<asp:UpdatePanel runat="server">

                            <ContentTemplate>--%>

                        <asp:Panel runat="server" ID="pnlCopyright" Visible="false">

                            <div class="row">
                                <div class="form-group col-md-3"></div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">

                                    <asp:DropDownList ID="ddlcopyrith1" CssClass="form-control" runat="server" Enabled="false">
                                    </asp:DropDownList>

                                </div>
                                <div class="form-group col-md-6">
                                    <asp:TextBox ID="txtcr1" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">

                                    <asp:DropDownList ID="ddlcopyrith2" CssClass="form-control" runat="server" Enabled="false">
                                    </asp:DropDownList>

                                </div>
                                <div class="form-group col-md-6">
                                    <asp:TextBox ID="txtcr2" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">

                                    <asp:DropDownList ID="ddlcopyrith3" CssClass="form-control" runat="server" Enabled="false">
                                    </asp:DropDownList>

                                </div>
                                <div class="form-group col-md-3">
                                    <asp:TextBox ID="txtcr3" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                </div>

                                <div class="form-group col-md-3">
                                    <asp:TextBox ID="txtcr4" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">
                                    <asp:Label ID="Label1" runat="server" Visible="true"></asp:Label>
                                    <asp:Button ID="btnSearch_copyright" Text="Search" runat="server" CssClass="btn btn-primary" OnClick="btnSearch_copyright_Click"></asp:Button>
                                    <%--<asp:Label ID="lblmsg" runat="server"></asp:Label>--%>
                                </div>
                            </div>

                            <asp:Panel Visible="false" runat="server" ID="pnlCRSearch">
                                <div class="gridDivRow">
                                    <div class="form-group col-md-12 gridBody">
                                        <asp:GridView ID="grd_CRSearch" runat="server"
                                            AutoGenerateColumns="False" OnRowCommand="grd_CRSearch_RowCommand" OnPageIndexChanging="grd_CRSearch_PageIndexChanging"
                                            CellPadding="4" CssClass="gridSize" ShowFooter="true" AllowPaging="True"
                                            GridLines="None" Font-Bold="False" FooterStyle-Wrap="True"
                                            PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" PagerSettings-PageButtonCount="4"
                                            PagerStyle-VerticalAlign="Bottom" PagerStyle-HorizontalAlign="Center" PageSize="1" HorizontalAlign="Left"
                                            RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Height="50px"
                                            OnRowCreated="grd_CRSearch_RowCreated">

                                            <Columns>
                                                <asp:TemplateField HeaderText="Id" Visible="false">
                                                    <ItemTemplate>
                                                        <%#Eval("ID") %>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="gridheader"></HeaderStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="#" HeaderStyle-Width="2%">
                                                    <ItemTemplate>
                                                        <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="gridheader"></HeaderStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Reference No." HeaderStyle-Width="8%" HeaderStyle-Wrap="true">
                                                    <ItemTemplate>
                                                        <%#Eval("Ref_No") %>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText=" Date of Publication " HeaderStyle-Width="8%" HeaderStyle-Wrap="true">
                                                    <ItemTemplate>
                                                        <%#Eval("Dateof_Publication", "{0:dd-MM-yyyy}") %>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Title" HeaderStyle-Width="30%">
                                                    <ItemTemplate>
                                                        <%#Eval("Title") %>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Category" HeaderStyle-Width="8%">
                                                    <ItemTemplate>
                                                        <%#Eval("Category") %>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Original Work" HeaderStyle-Width="6%">
                                                    <ItemTemplate>
                                                        <%#Eval("Original_Work") %>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Edit" HeaderStyle-Width="4%">
                                                    <ItemTemplate>

                                                        <asp:ImageButton ID="btnedit" ImageUrl="~/assests/images/icon_edit.png" Height="20px" Width="20px"
                                                            runat="server" Text="edit" ForeColor="black" CommandName="CRedit" CommandArgument='<%#Eval("id") %>' />

                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText=" Action" HeaderStyle-Width="6%">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" Text="Move To FileEntry" CommandName="CRfile" CommandArgument=' <%#Eval("ID") %>'></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>


                                            </Columns>

                                            <FooterStyle ForeColor="#003399" CssClass="gridfooter" BackColor="#ffffff" />
                                            <HeaderStyle ForeColor="#202060" Font-Names="Rubik,sans-serif,'Circular Std Book'" />
                                            <PagerSettings Mode="NumericFirstLast" />
                                            <PagerStyle BackColor="White" ForeColor="#003399" HorizontalAlign="Center" VerticalAlign="Bottom" CssClass="gridPager" />
                                            <RowStyle CssClass="gridrowstyle" ForeColor="#003399" BackColor="#ffffff" />
                                            <SelectedRowStyle BackColor="#ABC8F3" Font-Bold="True" ForeColor="#CCFF99" />
                                            <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                            <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                            <SortedDescendingHeaderStyle BackColor="#002876" />
                                        </asp:GridView>
                                    </div>
                                </div>
                            </asp:Panel>
                        </asp:Panel>

                        <%--</ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSearch_copyright" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="RadioButtonList1" EventName="SelectedIndexChanged" />

                            </Triggers>
                        </asp:UpdatePanel>

                        <asp:UpdatePanel runat="server">

                            <ContentTemplate>--%>
                        <asp:Panel runat="server" ID="pnlTrademark" Visible="false">
                            <div class="row">
                                <div class="form-group col-md-3"></div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">

                                    <asp:DropDownList ID="ddltradmark1" CssClass="form-control" runat="server" Enabled="false">
                                    </asp:DropDownList>

                                </div>
                                <div class="form-group col-md-6">
                                    <asp:TextBox ID="txttrdmsrk1" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">

                                    <asp:DropDownList ID="ddltradmark2" CssClass="form-control" runat="server" Enabled="false">
                                    </asp:DropDownList>

                                </div>
                                <div class="form-group col-md-6">
                                    <asp:TextBox ID="txttrdmsrk2" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">

                                    <asp:DropDownList ID="ddltradmark3" CssClass="form-control" runat="server" Enabled="false">
                                    </asp:DropDownList>

                                </div>
                                <div class="form-group col-md-6">
                                    <asp:TextBox ID="txttrdmsrk3" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">

                                    <asp:DropDownList ID="ddltradmark4" CssClass="form-control" runat="server" Enabled="false">
                                    </asp:DropDownList>

                                </div>
                                <div class="form-group col-md-6">
                                    <asp:TextBox ID="txttrdmsrk4" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">

                                    <asp:DropDownList ID="ddltradmark5" CssClass="form-control" runat="server" Enabled="false">
                                    </asp:DropDownList>

                                </div>
                                <div class="form-group col-md-6">
                                    <asp:TextBox ID="txttrdmsrk5" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">
                                    <asp:Label ID="Label2" runat="server" Visible="true"></asp:Label>
                                    <asp:Button ID="btnSearch_Tradmark" Text="Search" runat="server" CssClass="btn btn-primary" OnClick="btnSearch_Tradmark_Click"></asp:Button>
                                    <asp:Label ID="Label3" runat="server"></asp:Label>
                                </div>
                            </div>

                            <asp:Panel Visible="false" runat="server" ID="pnlTMSearch">
                                <div class="gridDivRow">
                                    <div class="form-group col-md-12 gridBody">
                                        <asp:GridView ID="grd_TMSearch" runat="server"
                                            AutoGenerateColumns="False" OnRowCommand="grd_TMSearch_RowCommand" OnPageIndexChanging="grd_TMSearch_PageIndexChanging"
                                            CellPadding="4" CssClass="gridSize" ShowFooter="true" AllowPaging="True"
                                            GridLines="None" Font-Bold="False" FooterStyle-Wrap="True"
                                            PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" PagerSettings-PageButtonCount="4"
                                            PagerStyle-VerticalAlign="Bottom" PagerStyle-HorizontalAlign="Center" PageSize="1" HorizontalAlign="Left"
                                            RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Height="50px"
                                            OnRowCreated="grd_TMSearch_RowCreated">

                                            <Columns>
                                                <asp:TemplateField HeaderText="Id" Visible="false">
                                                    <ItemTemplate>
                                                        <%#Eval("Id") %>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="gridheader"></HeaderStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="#" HeaderStyle-Width="2%">
                                                    <ItemTemplate>
                                                        <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="gridheader"></HeaderStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Reference No." HeaderStyle-Width="8%">
                                                    <ItemTemplate>
                                                        <%#Eval("Ref_No") %>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Applicant Name(s)" HeaderStyle-Width="15%">
                                                    <ItemTemplate>
                                                        <%#Eval("App_Name_Log") %>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText=" Contributor Name" HeaderStyle-Width="10%">
                                                    <ItemTemplate>
                                                        <%#Eval("Com_Name") %>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Title" HeaderStyle-Width="45%">
                                                    <ItemTemplate>
                                                        <%#Eval("Title") %>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Type Of Tradmark" HeaderStyle-Width="10%">
                                                    <ItemTemplate>
                                                        <%#Eval("WordMarkLogo") %>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Action" HeaderStyle-Width="2%">
                                                    <ItemTemplate>

                                                        <asp:ImageButton ID="btnedit" ImageUrl="~/assests/images/icon_edit.png" Height="20px" Width="20px"
                                                            runat="server" Text="edit" ForeColor="black" CommandName="TMedit" CommandArgument='<%#Eval("id") %>' />

                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText=" Action" HeaderStyle-Width="6%">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" Text="Move To FileEntry" CommandName="TMfile" CommandArgument=' <%#Eval("ID") %>'></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>


                                            </Columns>

                                            <FooterStyle ForeColor="#003399" CssClass="gridfooter" BackColor="#ffffff" />
                                            <HeaderStyle ForeColor="#202060" Font-Names="Rubik,sans-serif,'Circular Std Book'" />
                                            <PagerSettings Mode="NumericFirstLast" />
                                            <PagerStyle BackColor="White" ForeColor="#003399" HorizontalAlign="Center" VerticalAlign="Bottom" CssClass="gridPager" />
                                            <RowStyle CssClass="gridrowstyle" ForeColor="#003399" BackColor="#ffffff" />
                                            <SelectedRowStyle BackColor="#ABC8F3" Font-Bold="True" ForeColor="#CCFF99" />
                                            <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                            <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                            <SortedDescendingHeaderStyle BackColor="#002876" />
                                        </asp:GridView>
                                    </div>
                                </div>
                            </asp:Panel>
                        </asp:Panel>

                        <%--</ContentTemplate>
                            <Triggers>

                                <asp:AsyncPostBackTrigger ControlID="btnSearch_Tradmark" EventName="Click" />

                                <asp:AsyncPostBackTrigger ControlID="RadioButtonList1" EventName="SelectedIndexChanged" />
                            </Triggers>
                        </asp:UpdatePanel>

                        <asp:UpdatePanel runat="server">

                            <ContentTemplate>--%>
                        <asp:Panel runat="server" ID="pnlDesign" Visible="false">

                            <div class="row">
                                <div class="form-group col-md-3"></div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">

                                    <asp:DropDownList ID="ddldesign1" CssClass="form-control" runat="server" Enabled="false">
                                    </asp:DropDownList>

                                </div>
                                <div class="form-group col-md-6">
                                    <asp:TextBox ID="txtdesign1" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>


                            <div class="row">
                                <div class="form-group col-md-6">

                                    <asp:DropDownList ID="ddldesign2" CssClass="form-control" runat="server" Enabled="false">
                                    </asp:DropDownList>

                                </div>
                                <div class="form-group col-md-6">
                                    <asp:TextBox ID="txtdesign2" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">

                                    <asp:DropDownList ID="ddldesign3" CssClass="form-control" runat="server" Enabled="false">
                                    </asp:DropDownList>

                                </div>
                                <div class="form-group col-md-6">
                                    <asp:TextBox ID="txtdesign3" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">

                                    <asp:DropDownList ID="ddldesign4" CssClass="form-control" runat="server" Enabled="false">
                                    </asp:DropDownList>

                                </div>
                                <div class="form-group col-md-6">
                                    <asp:TextBox ID="txtdesign4" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <asp:Label ID="Label5" runat="server" Visible="true"></asp:Label>
                                    <asp:Button ID="btnSearch_Design" Text="Search" runat="server" CssClass="btn btn-primary" OnClick="btnSearch_Design_Click"></asp:Button>
                                    <asp:Label ID="Label6" runat="server"></asp:Label>
                                    <%--<asp:Button ID="Button1" Text="CHeck" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click"></asp:Button>--%>
                                </div>
                            </div>

                            <asp:Panel Visible="false" runat="server" ID="pnlDGSearch">
                                <div class="gridDivRow">
                                    <div class="form-group col-md-12 gridBody">
                                        <asp:GridView ID="grd_DGSearch" runat="server"
                                            AutoGenerateColumns="False" OnRowCommand="grd_DGSearch_RowCommand" OnPageIndexChanging="grd_DGSearch_PageIndexChanging"
                                            CellPadding="4" CssClass="gridSize" ShowFooter="true" AllowPaging="True"
                                            GridLines="None" Font-Bold="False" FooterStyle-Wrap="True"
                                            PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" PagerSettings-PageButtonCount="4"
                                            PagerStyle-VerticalAlign="Bottom" PagerStyle-HorizontalAlign="Center" PageSize="1" HorizontalAlign="Left"
                                            RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Height="50px"
                                            OnRowCreated="grd_DGSearch_RowCreated">

                                            <Columns>
                                                <%--<asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <asp:CheckBox ID="CheckBoxSelectAll" runat="server" onclick="SelectAllRows(this)" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                <asp:TemplateField HeaderText="Id" Visible="false">
                                                    <ItemTemplate>
                                                        <%#Eval("ID") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="#" HeaderStyle-Width="2%">
                                                    <ItemTemplate>
                                                        <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="gridheader"></HeaderStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Reference No." HeaderStyle-Width="8%">
                                                    <ItemTemplate>
                                                        <%#Eval("Ref_No") %>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Applicant Name" HeaderStyle-Width="15%">
                                                    <ItemTemplate>
                                                        <%#Eval("App_Name_log") %>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText=" Contributor Name" HeaderStyle-Width="10%">
                                                    <ItemTemplate>
                                                        <%#Eval("Con_Name_log") %>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Contact Person" HeaderStyle-Width="10%">
                                                    <ItemTemplate>
                                                        <%#Eval("Com_Name") %>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Title" HeaderStyle-Width="35%">
                                                    <ItemTemplate>
                                                        <%#Eval("Title") %>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Action" HeaderStyle-Width="4%">
                                                    <ItemTemplate>

                                                        <asp:ImageButton ID="btnedit" ImageUrl="~/assests/images/icon_edit.png" Height="20px" Width="20px"
                                                            runat="server" Text="edit" ForeColor="black" CommandName="DGedit" CommandArgument='<%#Eval("id") %>' />

                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText=" Action" HeaderStyle-Width="6%">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" Text="Move To FileEntry" ForeColor="black" CommandName="DGfile" CommandArgument=' <%#Eval("ID") %>'></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>


                                            </Columns>

                                            <FooterStyle ForeColor="#003399" CssClass="gridfooter" BackColor="#ffffff" />
                                            <HeaderStyle ForeColor="#202060" Font-Names="Rubik,sans-serif,'Circular Std Book'" />
                                            <PagerSettings Mode="NumericFirstLast" />
                                            <PagerStyle BackColor="White" ForeColor="#003399" HorizontalAlign="Center" VerticalAlign="Bottom" CssClass="gridPager" />
                                            <RowStyle CssClass="gridrowstyle" ForeColor="#003399" BackColor="#ffffff" />
                                            <SelectedRowStyle BackColor="#ABC8F3" Font-Bold="True" ForeColor="#CCFF99" />
                                            <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                            <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                            <SortedDescendingHeaderStyle BackColor="#002876" />

                                        </asp:GridView>
                                    </div>
                                </div>
                            </asp:Panel>
                        </asp:Panel>


                        <%-- </ContentTemplate>
                            <Triggers>

                                <asp:AsyncPostBackTrigger ControlID="btnSearch_Design" EventName="Click" />


                                <asp:AsyncPostBackTrigger ControlID="RadioButtonList1" EventName="SelectedIndexChanged" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <asp:UpdatePanel runat="server">

                            <ContentTemplate>--%>
                        <asp:Panel runat="server" ID="pnlPatent" Visible="false">

                            <div class="row">
                                <div class="form-group col-md-3"></div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">

                                    <asp:DropDownList ID="ddlpatent1" CssClass="form-control" runat="server" Enabled="false">
                                    </asp:DropDownList>

                                </div>
                                <div class="form-group col-md-6">
                                    <asp:TextBox ID="txtpatent1" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>


                            <div class="row">
                                <div class="form-group col-md-6">

                                    <asp:DropDownList ID="ddlpatent2" CssClass="form-control" runat="server" Enabled="false">
                                    </asp:DropDownList>

                                </div>
                                <div class="form-group col-md-6">
                                    <asp:TextBox ID="txtpatent2" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">

                                    <asp:DropDownList ID="ddlpatent3" CssClass="form-control" runat="server" Enabled="false">
                                    </asp:DropDownList>

                                </div>
                                <div class="form-group col-md-6">
                                    <asp:TextBox ID="txtpatent3" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">

                                    <asp:DropDownList ID="ddlpatent4" CssClass="form-control" runat="server" Enabled="false">
                                    </asp:DropDownList>

                                </div>
                                <div class="form-group col-md-6">
                                    <asp:TextBox ID="txtpatent4" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">

                                    <asp:DropDownList ID="ddlpatent5" CssClass="form-control" runat="server" Enabled="false">
                                    </asp:DropDownList>

                                </div>
                                <div class="form-group col-md-6">
                                    <asp:TextBox ID="txtpatent5" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">

                                    <asp:DropDownList ID="ddlpatent6" CssClass="form-control" runat="server" Enabled="false">
                                    </asp:DropDownList>

                                </div>
                                <div class="form-group col-md-3">
                                    <asp:TextBox ID="txtpatent6" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-3">
                                    <asp:TextBox ID="txtpatent7" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">
                                    <asp:Label ID="Label7" runat="server" Visible="true"></asp:Label>
                                    <asp:Button ID="btnSearch_Patent" Text="Search" runat="server" CssClass="btn btn-primary" OnClick="btnSearch_Patent_Click" />
                                    <asp:Label ID="Label8" runat="server"></asp:Label>
                                    
                                </div>

                            </div>

                            <asp:Panel Visible="false" runat="server" ID="pnlPTSearch">
                                <div class="gridDivRow">
                                    <div class="form-group col-md-12 gridBody">
                                        <asp:GridView ID="grd_PTSearch" runat="server"
                                            AutoGenerateColumns="False" OnRowCommand="grd_PTSearch_RowCommand" OnPageIndexChanging="grd_PTSearch_PageIndexChanging"
                                            CellPadding="4" CssClass="gridSize" ShowFooter="true" AllowPaging="True"
                                            GridLines="None" Font-Bold="False" FooterStyle-Wrap="True"
                                            PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" PagerSettings-PageButtonCount="4"
                                            PagerStyle-VerticalAlign="Bottom" PagerStyle-HorizontalAlign="Center" PageSize="1" HorizontalAlign="Left"
                                            RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Height="50px"
                                            OnRowCreated="grd_PTSearch_RowCreated">

                                            <Columns>
                                                <asp:TemplateField HeaderText="Id" Visible="false">
                                                    <ItemTemplate>
                                                        <%#Eval("ID") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="#" HeaderStyle-Width="2%">
                                                    <ItemTemplate>
                                                        <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="gridheader"></HeaderStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Reference No." HeaderStyle-Width="8%">
                                                    <ItemTemplate>
                                                        <%#Eval("Ref_No") %>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText=" Inventor Name" HeaderStyle-Width="10%">
                                                    <ItemTemplate>
                                                        <%#Eval("Inventor_Name") %>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Contributor Name" HeaderStyle-Width="10%">
                                                    <ItemTemplate>
                                                        <%#Eval("Com_Name") %>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Acession Number" HeaderStyle-Width="10%">
                                                    <ItemTemplate>
                                                        <%#Eval("Accession_Number") %>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="File Creation Date" HeaderStyle-Width="10%">
                                                    <ItemTemplate>
                                                        <%#Eval("File_creation_date") %>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Title" HeaderStyle-Width="35%">
                                                    <ItemTemplate>
                                                        <%#Eval("Title") %>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText="Action" HeaderStyle-Width="4%">
                                                    <ItemTemplate>

                                                        <asp:ImageButton ID="btnedit" ImageUrl="~/assests/images/icon_edit.png" Height="20px" Width="20px"
                                                            runat="server" Text="edit" ForeColor="black" CommandName="PTedit" CommandArgument='<%#Eval("id") %>' />

                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText=" Action" HeaderStyle-Width="6%">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" Text="Move To FileEntry" CommandName="PTfile" CommandArgument=' <%#Eval("ID") %>'></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                                </asp:TemplateField>

                                            </Columns>

                                            <FooterStyle ForeColor="#003399" CssClass="gridfooter" BackColor="#ffffff" />
                                            <HeaderStyle ForeColor="#202060" Font-Names="Rubik,sans-serif,'Circular Std Book'" />
                                            <PagerSettings Mode="NumericFirstLast" />
                                            <PagerStyle BackColor="White" ForeColor="#003399" HorizontalAlign="Center" VerticalAlign="Bottom" CssClass="gridPager" />
                                            <RowStyle CssClass="gridrowstyle" ForeColor="#003399" BackColor="#ffffff" />
                                            <SelectedRowStyle BackColor="#ABC8F3" Font-Bold="True" ForeColor="#CCFF99" />
                                            <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                            <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                            <SortedDescendingHeaderStyle BackColor="#002876" />
                                        </asp:GridView>
                                    </div>
                                </div>
                            </asp:Panel>
                        </asp:Panel>


                    </ContentTemplate>
                    <Triggers>
                        <%--<asp:AsyncPostBackTrigger ControlID="btnSearch_Patent" EventName="Click" />--%>
                        <asp:AsyncPostBackTrigger ControlID="RadioButtonList1" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>


        </div>
    </div>



</asp:Content>
