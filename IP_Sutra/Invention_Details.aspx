<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Invention_Details.aspx.cs" Inherits="IP_Sutra.Invention_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .gridSize {
            max-width: 100%;
            width: 95%;
        }
    </style>
    <script type="text/javascript">
        
        <%--function to auto hide msg label--%>
        function HideLabel() {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1500);
        };

        <%--function to check blank value of textbox--%>
        function validationRefNo() {
            var a, b;
            a = validateRefNo();
            if (a == true) {

                b = "save";
            }
            else {
                b = "";
                return a;
            }
            $("#<%=hdn.ClientID%>").val(b);
        }

        function validateRefNo() {
            var RefN = document.getElementById("<%=txt_RefNo.ClientID %>").value;
            if (RefN.trim() == "") {
                alert('Please enter Ref. No !!');
                document.getElementById("<%=txt_RefNo.ClientID %>").focus();
                return false;
                <%--document.getElementById("<%=lblMsg.ClientID %>").innerHTML = "Please Select Category Type!!";--%>
            }
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManagerINV" EnablePageMethods="true" ScriptMode="Release"></asp:ScriptManager>
    <div class="dashboard-wrapper">
        <div class="dashboard-ecommerce">
            <div class="container-fluid dashboard-content">
                <h4 class="auto-style1">Invention Entry :</h4>
                <hr style="border-bottom: 1px thin; border-bottom-color: crimson; width: 100%; height: 5px" />
                <div class="MsgStyle">
                    <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Text="" Visible="false" CssClass="MsgStyle"></asp:Label>
                </div>

                <div class="row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lbl_RefNo" runat="server" Text="Ref. No."></asp:Label>
                        <asp:TextBox ID="txt_RefNo" CssClass="form-control" runat="server" placeholder=""></asp:TextBox>
                    </div>

                    <div class="form-group col-md-6">
                        <asp:Label ID="lbl_Title" runat="server" Text="Title of the Invention"></asp:Label>
                        <asp:TextBox ID="txt_Title" CssClass="form-control" runat="server" placeholder=""></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lbl_IpRegdNo" runat="server" Text="IP Regd. No."></asp:Label>
                        <asp:TextBox ID="txt_IpRegdNo" CssClass="form-control" runat="server" placeholder=""></asp:TextBox>
                    </div>


                    <div class="form-group col-md-6">
                        <asp:Label ID="lbl_Status" runat="server" Text="Status"></asp:Label>
                        <asp:DropDownList ID="ddl_Status" CssClass="form-control" runat="server">
                            <%--<asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem>Active</asp:ListItem>
                            <asp:ListItem>Hold</asp:ListItem>
                            <asp:ListItem>Completed</asp:ListItem>--%>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblType" runat="server" Text="Type of License"></asp:Label>
                        <asp:DropDownList ID="ddl_LicenseType" CssClass="form-control" runat="server">
                            <%--<asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem>Licensed</asp:ListItem>
                            <asp:ListItem>Transferred</asp:ListItem>
                            <asp:ListItem>Active</asp:ListItem>--%>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group col-md-6">
                        <asp:Label ID="lbl_Details" runat="server" Text="Details of IP Linked"></asp:Label>
                        <asp:TextBox ID="txt_Details" CssClass="form-control" runat="server" placeholder=""></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lbl_Remarks" runat="server" Text="Remarks:"></asp:Label>
                        <asp:TextBox ID="txt_Remarks" CssClass="form-control" runat="server" TextMode="MultiLine" placeholder="" Height="40px"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lbl_Inv" runat="server" Text="Inventors/Applicants:" ForeColor="Black"></asp:Label>
                    </div>
                </div>

                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <asp:Label ID="Label3" runat="server" Text="Type"></asp:Label>
                                <asp:DropDownList ID="ddl_Type" CssClass="form-control" runat="server">
                                    <%--<asp:ListItem Text="--Select--" Value="--Select--"></asp:ListItem>
                            <asp:ListItem Text="Type_1" Value="Type_1"></asp:ListItem>
                            <asp:ListItem Text="Type_2 " Value="Type_2"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="Other"></asp:ListItem>--%>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group col-md-6">
                                <asp:Label ID="lblApp_Type" runat="server" Text="Inv/App Type"></asp:Label>
                                <asp:DropDownList ID="ddlApp_Type" CssClass="form-control" runat="server">
                                    <%--<asp:ListItem Text="--Select--" Value="--Select--"></asp:ListItem>
                            <asp:ListItem Text="AppType_1" Value="Type_1"></asp:ListItem>
                            <asp:ListItem Text="AppType_2 " Value="Type_2"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="Other"></asp:ListItem>--%>
                                </asp:DropDownList>
                            </div>


                        </div>



                        <div class="row">
                            <div class="form-group col-md-6">
                                <asp:Label ID="lblApp_Name" runat="server" Text="Name"></asp:Label>
                                <asp:TextBox ID="txtApp_Name" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>

                            <div class="form-group col-md-6">
                                <asp:Label ID="lblApp_ContactNo" runat="server" Text="Contact No."></asp:Label>
                                <asp:TextBox ID="txtApp_ContactNo" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-6">
                                <asp:Label ID="lblApp_EmailId" runat="server" Text="Email Id"></asp:Label>
                                <asp:TextBox ID="txtApp_EmailId" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>



                        <div class="row">
                            <div class="form-group col-md-12">
                                <asp:Label ID="lbl" runat="server" Text="*Are there more than one Applicants ?" font="Serif" ForeColor="Black"></asp:Label>
                                &nbsp
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Add More</asp:LinkButton>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-12">


                                <asp:Panel ID="PanelApplicant" runat="server">

                                    <asp:GridView ID="Gridview1" runat="server" AutoGenerateColumns="false"
                                        BackColor="White" BorderColor="#EEF2F5" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CssClass="gridSize" ShowFooter="false" AllowPaging="True"
                                        GridLines="None" Font-Bold="False" FooterStyle-Wrap="True" PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" PagerSettings-PageButtonCount="4"
                                        PagerStyle-VerticalAlign="Bottom" PagerStyle-HorizontalAlign="Center" PageSize="15" HorizontalAlign="Left"
                                        RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Height="50px" OnRowCommand="Gridview1_RowCommand">
                                        <Columns>
                                            <asp:BoundField DataField="ID" HeaderText="ID" ItemStyle-Width="5%" HeaderStyle-CssClass="gridheader" />
                                            <asp:BoundField DataField="Type" HeaderText="Type" ItemStyle-Width="10%" HeaderStyle-CssClass="grdHeadVLine" ItemStyle-CssClass="grdVLine" />
                                            <asp:BoundField DataField="App_Type" HeaderText="App/Inv Type" ItemStyle-Width="20%" HeaderStyle-CssClass="grdHeadVLine" ItemStyle-CssClass="grdVLine" />
                                            
                                            <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="20%" HeaderStyle-CssClass="grdHeadVLine" ItemStyle-CssClass="grdVLine" />
                                            <asp:BoundField DataField="ContactNo" HeaderText="Contact No" ItemStyle-Width="15%" HeaderStyle-CssClass="grdHeadVLine" ItemStyle-CssClass="grdVLine" />
                                            <asp:BoundField DataField="EmailId" HeaderText="Email Id" ItemStyle-Width="22%" HeaderStyle-CssClass="grdHeadVLine" ItemStyle-CssClass="grdVLine" />


                                            <asp:TemplateField HeaderText="Action" HeaderStyle-Width="4%">
                                                <ItemTemplate>

                                                    <asp:ImageButton ID="btnedit" ImageUrl="~/assests/images/icon_edit.png" Height="20px" Width="20px" runat="server" Text="edit" ForeColor="black" CommandName="cmd_edit" CommandArgument='<%#Container.DataItemIndex %>' />

                                                </ItemTemplate>
                                                <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                <ItemStyle CssClass="grdVLine"></ItemStyle>
                                            </asp:TemplateField>


                                            <asp:TemplateField HeaderText=" Delete" HeaderStyle-Width="4%">
                                                <ItemTemplate>

                                                    <asp:ImageButton ID="btndelet" ImageUrl="~/assests/images/delete.png" Height="20px" Width="20px" runat="server" ForeColor="black" CommandName="cmd_delete" CommandArgument='<%#Container.DataItemIndex %>' />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                                <ItemStyle CssClass="grdVLine"></ItemStyle>
                                            </asp:TemplateField>


                                        </Columns>


                                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" CssClass="gridfooter" BorderColor="Aqua" BorderStyle="Solid" BorderWidth="3px" />
                                        <HeaderStyle Font-Bold="True" ForeColor="#003399" />
                                        <PagerSettings Mode="NumericFirstLast" />
                                        <PagerStyle BackColor="White" ForeColor="#003399" HorizontalAlign="Center" VerticalAlign="Bottom" CssClass="gridfooter" />
                                        <RowStyle BackColor="White" ForeColor="#003399" BorderStyle="Solid" BorderWidth="3px" CssClass="gridrowstyle" />

                                    </asp:GridView>

                                </asp:Panel>

                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="LinkButton1" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <div class="row">
                    <div class="form-group col-md-12">
                    </div>
                </div>


                <div class="row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lblContactInfo" runat="server" Text="Contact Information:" ForeColor="Black"></asp:Label>
                    </div>
                </div>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <asp:Label ID="lblContactName" runat="server" Text="Name"></asp:Label>
                                <asp:TextBox ID="txt_ContactName" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>

                            <div class="form-group col-md-6">
                                <asp:Label ID="lblContactNo" runat="server" Text="Contact No."></asp:Label>
                                <asp:TextBox ID="txt_ContactNo" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>


                        <div class="row">
                            <div class="form-group col-md-6">
                                <asp:Label ID="lblContactEmailId" runat="server" Text="Email Id"></asp:Label>
                                <asp:TextBox ID="txt_ContactEmailId" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-12">
                                <asp:Label ID="lbl_addCont" runat="server" Text="  *Are there more than one Contact?" ForeColor="Black"></asp:Label>
                                &nbsp
                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Add More</asp:LinkButton>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-12">

                                <asp:Panel ID="PanelContact" runat="server" Visible="true">

                                    <asp:GridView ID="Gridview2" runat="server" ShowFooter="false" AutoGenerateColumns="false"
                                        BackColor="White" BorderColor="#EEF2F5" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CssClass="gridSize" AllowPaging="True"
                                        GridLines="None" Font-Bold="False" FooterStyle-Wrap="True" PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" PagerSettings-PageButtonCount="4"
                                        PagerStyle-VerticalAlign="Bottom" PagerStyle-HorizontalAlign="Center" PageSize="15" HorizontalAlign="Left"
                                        RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Height="50px" OnRowCommand="Gridview2_RowCommand">

                                        <Columns>
                                            <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-Width="5%" HeaderStyle-CssClass="gridheader" />

                                            <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="27%" HeaderStyle-CssClass="grdHeadVLine" ItemStyle-CssClass="grdVLine" />
                                            <asp:BoundField DataField="ContactNo" HeaderText="Contact No" ItemStyle-Width="20%" HeaderStyle-CssClass="grdHeadVLine" ItemStyle-CssClass="grdVLine" />
                                            <asp:BoundField DataField="EmailId" HeaderText="Email Id" ItemStyle-Width="40%" HeaderStyle-CssClass="grdHeadVLine" ItemStyle-CssClass="grdVLine" />


                                            <asp:TemplateField HeaderText="Action" HeaderStyle-Width="4%">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="btnedit" ImageUrl="~/assests/images/icon_edit.png" Height="20px" Width="20px" runat="server"
                                                        Text="edit" ForeColor="black" CommandName="cmd_edit" CommandArgument='<%#Container.DataItemIndex %>' />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>
                                                <ItemStyle CssClass="grdVLine"></ItemStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText=" Delete" HeaderStyle-Width="4%">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="btndelet" ImageUrl="~/assests/images/delete.png" Height="20px" Width="20px" runat="server"
                                                        ForeColor="black" CommandName="cmd_delete" CommandArgument='<%#Container.DataItemIndex %>' />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>
                                                <ItemStyle CssClass="grdVLine"></ItemStyle>
                                            </asp:TemplateField>

                                        </Columns>
                                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" CssClass="gridfooter" BorderColor="Aqua" BorderStyle="Solid" BorderWidth="3px" />
                                        <HeaderStyle Font-Bold="True" ForeColor="#003399" />
                                        <PagerSettings Mode="NumericFirstLast" />
                                        <PagerStyle BackColor="White" ForeColor="#003399" HorizontalAlign="Center" VerticalAlign="Bottom" CssClass="gridfooter" />
                                        <RowStyle BackColor="White" ForeColor="#003399" BorderStyle="Solid" BorderWidth="3px" CssClass="gridrowstyle" />
                                    </asp:GridView>

                                </asp:Panel>


                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="LinkButton2" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <div class="row">
                    <div class="form-group col-md-12">
                    </div>
                </div>


                <asp:Panel ID="PanelDDl" runat="server" Visible="true">
                    <div class="row">
                        <div class="form-group col-md-6">
                            <asp:Label ID="lbl_Company" runat="server" Text="Any Company Interested?"></asp:Label>
                            <%--<asp:DropDownList ID="ddl_Company" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_Company_SelectedIndexChanged">
                                <%--<asp:ListItem Text="--Select--" Value="--Select--"></asp:ListItem>--%
                                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </asp:DropDownList>--%>
                            <asp:RadioButtonList ID="rblCompany" runat="server" DataTextField="" RepeatColumns="2" RepeatDirection="Horizontal"
                                DataValueField="" CssClass="form-control" OnSelectedIndexChanged="rblCompany_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem Text="&nbsp; Yes &nbsp;&nbsp;&nbsp;" Value="Yes"></asp:ListItem>
                                <asp:ListItem Text="&nbsp; No &nbsp;" Value="No"></asp:ListItem>

                            </asp:RadioButtonList>
                        </div>
                    </div>
                </asp:Panel>

                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="PanelComp" runat="server" Visible="false">
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <asp:Label ID="lbl_CompanyName" runat="server" Text="CompanyName"></asp:Label>
                                    <asp:TextBox ID="txt_CompanyName" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>

                                <div class="form-group col-md-6">
                                    <asp:Label ID="lbl_CompPerName" runat="server" Text="Contact Person Name"></asp:Label>
                                    <asp:TextBox ID="txt_CompPerName" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">
                                    <asp:Label ID="lbl_CompContactNo" runat="server" Text="Contact No."></asp:Label>
                                    <asp:TextBox ID="txt_CompContactNo" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-6">
                                    <asp:Label ID="lbl_CompEmailId" runat="server" Text="Email Id"></asp:Label>
                                    <asp:TextBox ID="txt_CompEmailId" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>



                            <div class="row">
                                <div class="form-group col-md-12">
                                    <asp:Label ID="Label5" runat="server" Text="*Are there more than one Company ?" font="Serif" ForeColor="Black"></asp:Label>
                                    &nbsp
                        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">Add More</asp:LinkButton>
                                </div>
                            </div>
                        </asp:Panel>

                        <div class="row">
                            <div class="form-group col-md-12">

                                <asp:GridView ID="Gridview3" runat="server" ShowFooter="false" AutoGenerateColumns="false"
                                    BackColor="White" BorderColor="#EEF2F5" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CssClass="gridSize" AllowPaging="True"
                                    GridLines="None" Font-Bold="False" FooterStyle-Wrap="True" PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" PagerSettings-PageButtonCount="4"
                                    PagerStyle-VerticalAlign="Bottom" PagerStyle-HorizontalAlign="Center" PageSize="15" HorizontalAlign="Left"
                                    RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Height="50px" OnRowCommand="Gridview3_RowCommand">

                                    <Columns>
                                        <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-Width="2%" HeaderStyle-CssClass="gridheader" />

                                        <asp:BoundField DataField="CompanyName" HeaderText="Company Name" ItemStyle-Width="25%" HeaderStyle-CssClass="grdHeadVLine" ItemStyle-CssClass="grdVLine" />
                                        <asp:BoundField DataField="ContactPersonName" HeaderText="Contact Person Name " ItemStyle-Width="25%" HeaderStyle-CssClass="grdHeadVLine" ItemStyle-CssClass="grdVLine" />
                                        <asp:BoundField DataField="ContactNo" HeaderText="Contact No" ItemStyle-Width="20%" HeaderStyle-CssClass="grdHeadVLine" ItemStyle-CssClass="grdVLine" />
                                        <asp:BoundField DataField="EmailId" HeaderText="Email Id" ItemStyle-Width="25%" HeaderStyle-CssClass="grdHeadVLine" ItemStyle-CssClass="grdVLine" />


                                        <asp:TemplateField HeaderText="Action" HeaderStyle-Width="4%">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btnedit" ImageUrl="~/assests/images/icon_edit.png" Height="20px" Width="20px" runat="server"
                                                    Text="edit" ForeColor="black" CommandName="cmd_edit" CommandArgument='<%#Container.DataItemIndex %>' />
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>
                                            <ItemStyle CssClass="grdVLine"></ItemStyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText=" Delete" HeaderStyle-Width="4%">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btndelet" ImageUrl="~/assests/images/delete.png" Height="20px" Width="20px" runat="server"
                                                    ForeColor="black" CommandName="cmd_delete" CommandArgument='<%#Container.DataItemIndex %>' />
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>
                                            <ItemStyle CssClass="grdVLine"></ItemStyle>
                                        </asp:TemplateField>

                                    </Columns>
                                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" CssClass="gridfooter" BorderColor="Aqua" BorderStyle="Solid" BorderWidth="3px" />
                                    <HeaderStyle Font-Bold="True" ForeColor="#003399" />
                                    <PagerSettings Mode="NumericFirstLast" />
                                    <PagerStyle BackColor="White" ForeColor="#003399" HorizontalAlign="Center" VerticalAlign="Bottom" CssClass="gridfooter" />
                                    <RowStyle BackColor="White" ForeColor="#003399" BorderStyle="Solid" BorderWidth="3px" CssClass="gridrowstyle" />
                                </asp:GridView>

                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="LinkButton3" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="rblCompany" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>

                <div class="row">
                    <div class="form-group col-md-6">
                        <asp:Button ID="Button_Submit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="Button_Submit_Click" OnClientClick="return validationRefNo()" />
                    </div>
                </div>

                <asp:UpdatePanel ID="UpnlHidden" runat="server">
                    <ContentTemplate>
                        <asp:HiddenField ID="hdn" Value="0" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
</asp:Content>

