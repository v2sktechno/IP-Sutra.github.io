<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Patent.aspx.cs" Inherits="IP_Sutra.Patent1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .gridSize {
            max-width: 100%;
            width: 95%;
        }
    </style>

    <script type="text/javascript">
        //$('select').selectpicker();

        //function MutExChkList(chk) {
        //    var chkList = chk.parentNode.parentNode.parentNode;
        //    var chks = chkList.getElementsByTagName("input");
        //    for (var i = 0; i < chks.length; i++) {
        //        if (chks[i] != chk && chk.checked) {
        //            chks[i].checked = false;
        //        }
        //    }
        //}

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
    <asp:ScriptManager runat="server" ID="ScriptManager1" EnablePageMethods="true" ScriptMode="Release"></asp:ScriptManager>

    <div class="dashboard-wrapper">
        <div class="dashboard-ecommerce">
            <div class="container-fluid dashboard-content">

                <h4 class="auto-style1">Patent Form :</h4>
                <hr style="border-bottom: 1px thin; border-bottom-color: crimson; width: 100%; height: 5px" />
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="MsgStyle">
                            <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Text="" Visible="false" CssClass="MsgStyle"></asp:Label>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Buttonsubmit" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <div class="row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lbl_select" runat="server" Text="Select the Appropriate form :" ForeColor="Black" Font-Size="15px"></asp:Label>
                    </div>

                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <asp:Label ID="Label3" runat="server" Text="*If you are not sure, please fill the patent form and someone from the team will connect to reconfirm" ForeColor="#003366"></asp:Label>
                    </div>


                </div>

                <div class="row">
                    <div class="form-group col-md-2">
                        <asp:Button ID="Butt_Patent" CssClass="form-control" runat="server" Text="1. Patent" BackColor="#CCCCFF" ForeColor="#003366" OnClick="Butt_Patent_Click" />
                    </div>
                    <div class="form-group col-md-2">
                        <asp:Button ID="Butt_Copy" CssClass="form-control" runat="server" Text="2. Copyright" OnClick="Butt_Copy_Click" />
                    </div>
                    <div class="form-group col-md-2">
                        <asp:Button ID="Butt_Design" CssClass="form-control" runat="server" Text="3. Design" OnClick="Butt_Design_Click" />
                    </div>
                    <div class="form-group col-md-2">
                        <asp:Button ID="Butt_Trade" CssClass="form-control" runat="server" Text="4. Trademark" OnClick="Butt_Trade_Click" />
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                    </div>
                </div>
                <div class="pnlBorder">
                    <div class="row">
                        <div class="form-group col-md-6">
                            <h4 style="background-color: #CCCCFF; color: #000000; border-bottom: 1px solid #A6A6B7">&nbsp;Section I: Bibliographic Details </h4>
                        </div>

                    </div>

                    <div class="row">
                        <div class="form-group col-md-12">
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-md-6">
                            <asp:Label ID="lbl_RefNo" runat="server" Text="Ref. No"></asp:Label>
                            <asp:TextBox ID="txt_RefNo" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-6">
                            <asp:Label ID="lbl_Title" runat="server" Text="Title of the Invention"></asp:Label>
                            <asp:TextBox ID="txt_Title" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-md-12">
                            <asp:Label ID="lbldetailsofapplicant" runat="server" Text="Details of Applicant(s)* :" ForeColor="Black"></asp:Label>
                        </div>
                    </div>

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <asp:Label ID="lblApp_Name" runat="server" Text="Name"></asp:Label>
                                    <asp:TextBox ID="txtApp_Name" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>

                                <div class="form-group col-md-6">
                                    <asp:Label ID="lblApp_Nationality" runat="server" Text="Nationality"></asp:Label>
                                    <asp:TextBox ID="txtApp_Nationality" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">

                                <div class="form-group col-md-6">
                                    <asp:Label ID="lblApp_Address" runat="server" Text="Address"></asp:Label>
                                    <asp:TextBox ID="txtApp_Address" CssClass="form-control" runat="server" TextMode="MultiLine" Height="40px"></asp:TextBox>
                                </div>

                                <div class="form-group col-md-6">
                                    <asp:Label ID="lblApp_Category" runat="server" Text="Category of Applicant:"></asp:Label>
                                    <asp:DropDownList ID="ddl_AppCategory" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="--Select--" Value="--Select--"></asp:ListItem>
                                        <asp:ListItem Text="StartUp" Value="StartUp"></asp:ListItem>
                                        <asp:ListItem Text="Registered StartUp" Value="Registered StartUp"></asp:ListItem>
                                        <asp:ListItem Text="DPIIT Recognised StartUp" Value="DPIIT Recognised StartUp"></asp:ListItem>
                                        <asp:ListItem Text="Institution" Value="Institution"></asp:ListItem>
                                        <asp:ListItem Text="Company" Value="Company"></asp:ListItem>
                                        <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>


                            </div>

                            <div class="row">
                                <div class="form-group col-md-12">
                                    <asp:Label ID="lbl" runat="server" Text="* Are there more than one applicant? " font="Serif" ForeColor="Black"></asp:Label>
                                    &nbsp
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Add More</asp:LinkButton>

                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-12">

                                    <asp:Panel ID="PanelApplicant" runat="server" Visible="true">
                                        <asp:GridView ID="Gridview1" runat="server" AutoGenerateColumns="false"
                                            BackColor="White" BorderColor="#EEF2F5" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CssClass="gridSize" ShowFooter="false" AllowPaging="True"
                                            GridLines="None" Font-Bold="False" FooterStyle-Wrap="True" PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" PagerSettings-PageButtonCount="4"
                                            PagerStyle-VerticalAlign="Bottom" PagerStyle-HorizontalAlign="Center" PageSize="15" HorizontalAlign="Left"
                                            RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Height="50px" OnRowCommand="Gridview1_RowCommand">
                                            <Columns>
                                                <asp:BoundField DataField="ID" HeaderText="ID" ItemStyle-Width="5%" HeaderStyle-CssClass="gridheader" />

                                                <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="20%" HeaderStyle-CssClass="grdHeadVLine" ItemStyle-CssClass="grdVLine" />
                                                <asp:BoundField DataField="Nationality" HeaderText="Nationality" ItemStyle-Width="15%" HeaderStyle-CssClass="grdHeadVLine" ItemStyle-CssClass="grdVLine" />
                                                <asp:BoundField DataField="Address" HeaderText="Address" ItemStyle-Width="40%" HeaderStyle-CssClass="grdHeadVLine" ItemStyle-CssClass="grdVLine" />
                                                <asp:BoundField DataField="Category" HeaderText="Category" ItemStyle-Width="12%" HeaderStyle-CssClass="grdHeadVLine" ItemStyle-CssClass="grdVLine" />

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
                        <div class="form-group col-md-12">
                            <asp:Label ID="lbldetailsofinventors" runat="server" Text="Details of Inventor(s)* :" ForeColor="Black"></asp:Label>
                        </div>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <asp:Label ID="lbl_FirstName" runat="server" Text="First Name"></asp:Label>
                                    <asp:TextBox ID="txt_FirstName" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-6">
                                    <asp:Label ID="lbl_LastName" runat="server" Text="Last Name"></asp:Label>
                                    <asp:TextBox ID="txt_LastName" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <asp:Label ID="lblInvNationality" runat="server" Text="Nationality"></asp:Label>
                                    <asp:TextBox ID="txt_InvNationality" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>

                                <div class="form-group col-md-6">
                                    <asp:Label ID="lblInvAddress" runat="server" Text="Address"></asp:Label>
                                    <asp:TextBox ID="txt_InvAddress" CssClass="form-control" runat="server" TextMode="MultiLine" Height="40px"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <asp:Label ID="lbl_Invdesignation" runat="server" Text="Designation"></asp:Label>
                                    <asp:TextBox ID="txt_Invdesignation" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-6">
                                    <asp:Label ID="lbl_InvPhoneNo" runat="server" Text="Phone Number"></asp:Label>
                                    <asp:TextBox ID="txt_InvPhoneNo" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <asp:Label ID="lbl_InvEmailId" runat="server" Text="E-mail ID"></asp:Label>
                                    <asp:TextBox ID="txt_InvEmailId" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-12">
                                    <asp:Label ID="lbl_addinvent" runat="server" Text="* Are there more than one inventor? " ForeColor="Black"></asp:Label>
                                    &nbsp;
                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Add More</asp:LinkButton>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-12">

                                    <asp:Panel ID="PanelInventor" runat="server" Visible="true">

                                        <asp:GridView ID="Gridview2" runat="server" ShowFooter="false" AutoGenerateColumns="false"
                                            BackColor="White" BorderColor="#EEF2F5" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CssClass="gridSize" AllowPaging="True"
                                            GridLines="None" Font-Bold="False" FooterStyle-Wrap="True" PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" PagerSettings-PageButtonCount="4"
                                            PagerStyle-VerticalAlign="Bottom" PagerStyle-HorizontalAlign="Center" PageSize="15" HorizontalAlign="Left"
                                            RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Height="50px" OnRowCommand="Gridview2_RowCommand">

                                            <Columns>
                                                <asp:BoundField DataField="Inv_Id" HeaderText="ID" ItemStyle-Width="2%" HeaderStyle-CssClass="gridheader" />

                                                <asp:BoundField DataField="FirstName" HeaderText="First Name" ItemStyle-Width="10%" HeaderStyle-CssClass="grdHeadVLine" ItemStyle-CssClass="grdVLine" />
                                                <asp:BoundField DataField="LastName" HeaderText="Last Name" ItemStyle-Width="10%" HeaderStyle-CssClass="grdHeadVLine" ItemStyle-CssClass="grdVLine" />
                                                <asp:BoundField DataField="Nationality" HeaderText="Nationality" ItemStyle-Width="10%" HeaderStyle-CssClass="grdHeadVLine" ItemStyle-CssClass="grdVLine" />
                                                <asp:BoundField DataField="Address" HeaderText="Address" ItemStyle-Width="32%" HeaderStyle-CssClass="grdHeadVLine" ItemStyle-CssClass="grdVLine" />
                                                <asp:BoundField DataField="Designation" HeaderText="Designation" ItemStyle-Width="8%" HeaderStyle-CssClass="grdHeadVLine" ItemStyle-CssClass="grdVLine" />
                                                <asp:BoundField DataField="PhoneNo" HeaderText="Phone No" ItemStyle-Width="10%" HeaderStyle-CssClass="grdHeadVLine" ItemStyle-CssClass="grdVLine" />
                                                <asp:BoundField DataField="EmailId" HeaderText="Email Id" ItemStyle-Width="12%" HeaderStyle-CssClass="grdHeadVLine" ItemStyle-CssClass="grdVLine" />

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

                    <div class="row">
                        <div class="form-group col-md-6">
                            <asp:Label ID="lbl_comm" runat="server" Text="Communicating Person for the Application :" ForeColor="Black"></asp:Label>
                        </div>



                        <%--<div class="form-group col-md-12">
                        <asp:Label ID="Label31" runat="server" Text=" * Please mention the details of point of contact" ForeColor="Black"></asp:Label>
                    </div>--%>
                    </div>

                    <div class="row">
                        <div class="form-group col-md-6">
                            <asp:Label ID="lbl_ComTitle" runat="server" Text="Title"></asp:Label>
                            <asp:TextBox ID="txt_ComTitle" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group col-md-6">
                            <asp:Label ID="lbl_ComName" runat="server" Text="Name"></asp:Label>
                            <asp:TextBox ID="txt_ComName" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-md-6">
                            <asp:Label ID="lbl_Designation" runat="server" Text="Designation"></asp:Label>
                            <asp:TextBox ID="txt_ComDesignation" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-6">
                            <asp:Label ID="lbl_PhoneNumber" runat="server" Text="Phone Number"></asp:Label>
                            <asp:TextBox ID="txt_ComPhoneNumber" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <asp:Label ID="lbl_Email" runat="server" Text="E-mail ID"></asp:Label>
                            <asp:TextBox ID="txt_ComEmail" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group col-md-6">
                            <asp:Label ID="lbl_Category" runat="server" Text="Category of Invention"></asp:Label>
                            <asp:DropDownList ID="ddl_Category" CssClass="form-control" runat="server">
                                <asp:ListItem Text="--Select--" Value="--Select--"></asp:ListItem>
                                <asp:ListItem Text="A" Value="A"></asp:ListItem>
                                <asp:ListItem Text="B" Value="B"></asp:ListItem>
                                <asp:ListItem Text="Both" Value="Both"></asp:ListItem>
                            </asp:DropDownList>

                        </div>
                    </div>
                </div>

                <%--<div class="row">
                    <div class="form-group col-md-12">
                    </div>
                </div>--%>
                <div class="pnlBorder">
                    <div class="row">
                        <div class="form-group col-md-6">
                            <h4 style="background-color: #ccccFF; color: #000000; border-bottom: 1px solid #A6A6B7">&nbsp;Section II: Public Disclosures </h4>
                        </div>

                    </div>


                    <div class="row">
                        <div class="form-group col-md-6">
                            <asp:Label ID="lblFcDisclosures" runat="server" Text="Forthcoming Disclosures, if any"></asp:Label>
                            <asp:RadioButtonList ID="rblFcDisclosures" runat="server" DataTextField="Past_Disclosure" RepeatColumns="2" RepeatDirection="Horizontal"
                                DataValueField="Past_Disclosure" CssClass="form-control rbl" AutoPostBack="true" OnSelectedIndexChanged="rblFcDisclosures_SelectedIndexChanged">
                                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                <asp:ListItem Text="No" Value="No"></asp:ListItem>

                            </asp:RadioButtonList>
                        </div>
                        <div class="form-group col-md-6">
                            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                <ContentTemplate>
                                    <asp:Panel runat="server" Visible="false" ID="pnlFcDis">
                                        <asp:Label ID="Label4" runat="server" Text="Imminent disclosure details, within the next 3 months"></asp:Label>
                                        <asp:TextBox ID="txt_FcDisclosures" CssClass="form-control" TextMode="MultiLine" runat="server" Height="40px"></asp:TextBox>
                                    </asp:Panel>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="rblFcDisclosures" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-md-6">
                            <asp:Label ID="Label2" runat="server" Text="Past Disclosures, if any"></asp:Label>
                            <asp:RadioButtonList ID="rblDisclosure" runat="server" DataTextField="Past_Disclosure" RepeatColumns="2" RepeatDirection="Horizontal"
                                DataValueField="Past_Disclosure" CssClass="form-control rbl" AutoPostBack="true" OnSelectedIndexChanged="rblDisclosure_SelectedIndexChanged">
                                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                <asp:ListItem Text="No" Value="No"></asp:ListItem>

                            </asp:RadioButtonList>
                        </div>
                        <div class="form-group col-md-6">
                            <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                <ContentTemplate>
                                    <asp:Panel runat="server" Visible="false" ID="pnlPtDis">
                                        <asp:Label ID="Label16" runat="server" Text="Imminent disclosure details, within the next 10 months"></asp:Label>
                                        <asp:TextBox ID="txt_PastDisclosure" CssClass="form-control" TextMode="MultiLine" runat="server" Height="40px"></asp:TextBox>
                                    </asp:Panel>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="rblDisclosure" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                    </div>

                    <%--<div class="row">
                        <div class="form-group col-md-6">
                            <asp:DropDownList CssClass="form-control" ID="ddlForDisclosure" runat="server" multiple data-live-search="true" SelectionMode="multiple" Height="70px">
                                <asp:ListItem>--Select--</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2 </asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                            </asp:DropDownList>


                        </div>


                        <div class="form-group col-md-6">
                            <%--<asp:CheckBox ID="chkyes" runat="server" Text="Yes" CssClass="form-control" onclick="MutExChkList(this);" AutoPostBack="True"></asp:CheckBox>
                        <asp:CheckBox ID="chkno" runat="server" Text="No" CssClass="form-control" onclick="MutExChkList(this);" AutoPostBack="True"></asp:CheckBox>--%
                            
                        </div>
                    </div>--%>
                </div>
                <%--<div class="row">
                    <div class="form-group col-md-6">
                    </div>
                </div>--%>
                <div class="pnlBorder">
                    <div class="row">
                        <div class="form-group col-md-6">
                            <h4 style="background-color: #ccccff; color: #000000; border-bottom: 1px solid #A6A6B7">&nbsp;Section III: Grants/ Funds </h4>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-md-12">
                            <asp:Label ID="lbl_text" runat="server" Text="Was the invention developed using any research grants/ contract/ grant funds? If yes, provide details :"></asp:Label>

                        </div>
                        <div class="form-group col-md-6">
                            <%--<asp:CheckBox ID="Checkyes" runat="server" Text="Yes" CssClass="form-control" onclick="MutExChkList(this);" AutoPostBack="True"></asp:CheckBox>
                        <asp:CheckBox ID="Checkno" runat="server" Text="No" CssClass="form-control" onclick="MutExChkList(this);" AutoPostBack="True"></asp:CheckBox>--%>
                            <asp:RadioButtonList ID="rblGrant" runat="server" DataTextField="Grantchk" RepeatColumns="2" RepeatDirection="Horizontal"
                                DataValueField="Grantchk" CssClass="form-control rbl" OnSelectedIndexChanged="rblGrant_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                <asp:ListItem Text="No" Value="No"></asp:ListItem>

                            </asp:RadioButtonList>

                        </div>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>

                            <asp:Panel runat="server" ID="pnlGrant" Visible="false">

                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <asp:Label ID="lbl_GrantRefNo" runat="server" Text="Grant Reference No."></asp:Label>
                                        <asp:TextBox ID="txt_GrantRefNo" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <asp:Label ID="lbl_GrantTitle" runat="server" Text="Title"></asp:Label>
                                        <asp:TextBox ID="txt_GrantTitle" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <asp:Label ID="lbl_GrantSponsor" runat="server" Text="Sponsor"></asp:Label>
                                        <asp:TextBox ID="txt_GrantSponsor" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <asp:Label ID="lbl_GrantCollaborator" runat="server" Text="Collaborator(s)"></asp:Label>
                                        <asp:TextBox ID="txt_GrantCollaborator" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <asp:Label ID="lbl_GrantStartDate" runat="server" Text="Start Date"></asp:Label>
                                        <asp:TextBox ID="txt_GrantStartDate" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <asp:Label ID="lbl_GrantEndDate" runat="server" Text="End Date"></asp:Label>
                                        <asp:TextBox ID="txt_GrantEndDate" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <asp:Label ID="lbl_GrantIPOwnershipclauses" runat="server" Text="IP Ownership Clauses"></asp:Label>
                                        <asp:TextBox ID="txt_GrantIPOwnershipclauses" CssClass="form-control" TextMode="MultiLine" runat="server" Height="40px"></asp:TextBox>
                                    </div>
                                </div>

                            </asp:Panel>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="rblGrant" EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <div class="row">
                        <div class="form-group col-md-12">
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            <asp:Label ID="lbl_external" runat="server" Text="Provide details of external collaborators who have contributed to the Invention:" ForeColor="Black"></asp:Label>
                        </div>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <asp:Label ID="Label6" runat="server" Text="Start Date"></asp:Label>
                                    <asp:TextBox ID="txt_StartDate" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-6">
                                    <asp:Label ID="Label7" runat="server" Text="End Date"></asp:Label>
                                    <asp:TextBox ID="txt_EndDate" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <asp:Label ID="Label8" runat="server" Text="Collaborator(s)"></asp:Label>
                                    <asp:TextBox ID="txt_Collaborator" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>

                                <div class="form-group col-md-6">
                                    <asp:Label ID="Label9" runat="server" Text="Affiliation"></asp:Label>
                                    <asp:TextBox ID="txt_Affilliation" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">
                                    <asp:Label ID="Label10" runat="server" Text="Contribution of collaborator"></asp:Label>
                                    <asp:TextBox ID="txt_Contribution" CssClass="form-control" TextMode="MultiLine" runat="server" Height="40px"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-12">
                                    <asp:Label ID="Label1" runat="server" Text="  * Are there more than one collaborator?" ForeColor="Black"></asp:Label>
                                    &nbsp
                        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">Add More</asp:LinkButton>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-12">

                                    <asp:Panel ID="Panel3" runat="server" Visible="true">

                                        <asp:GridView ID="Gridview3" runat="server" ShowFooter="false" AutoGenerateColumns="false"
                                            BackColor="White" BorderColor="#EEF2F5" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CssClass="gridSize" AllowPaging="True"
                                            GridLines="None" Font-Bold="False" FooterStyle-Wrap="True" PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" PagerSettings-PageButtonCount="4"
                                            PagerStyle-VerticalAlign="Bottom" PagerStyle-HorizontalAlign="Center" PageSize="15" HorizontalAlign="Left"
                                            RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Height="50px" OnRowCommand="Gridview3_RowCommand">
                                            <Columns>

                                                <asp:BoundField DataField="GrantCollab_Id" HeaderText="ID" ItemStyle-Width="2%" HeaderStyle-CssClass="gridheader" />

                                                <asp:BoundField DataField="StartDate" HeaderText="Start Date" ItemStyle-Width="10%" HeaderStyle-CssClass="grdHeadVLine" ItemStyle-CssClass="grdVLine" />
                                                <asp:BoundField DataField="EndDate" HeaderText="End Date" ItemStyle-Width="10%" HeaderStyle-CssClass="grdHeadVLine" ItemStyle-CssClass="grdVLine" />
                                                <asp:BoundField DataField="Collaborators" HeaderText="Collaborators" ItemStyle-Width="10%" HeaderStyle-CssClass="grdHeadVLine" ItemStyle-CssClass="grdVLine" />
                                                <asp:BoundField DataField="Affilliation" HeaderText="Affilliation" ItemStyle-Width="32%" HeaderStyle-CssClass="grdHeadVLine" ItemStyle-CssClass="grdVLine" />
                                                <asp:BoundField DataField="Contribution" HeaderText="Contribution" ItemStyle-Width="8%" HeaderStyle-CssClass="grdHeadVLine" ItemStyle-CssClass="grdVLine" />

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
                            <asp:AsyncPostBackTrigger ControlID="LinkButton3" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            <%--<div class="row">
                    <div class="form-group col-md-6">
                    </div>
                </div>--%>

                <div class="pnlBorder">
                    <div class="row">
                        <div class="form-group col-md-6">
                            <h4 style="background-color: #ccccFF; color: #000000; border-bottom: 1px solid #A6A6B7">&nbsp;Section IV: Background of the Invention  </h4>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-md-6">
                            <asp:Label ID="lbl_Abstract" runat="server" Text=" Abstract (Atleast 500 words on the Invention )"></asp:Label>
                            <asp:TextBox ID="txt_Abstract" CssClass="form-control" TextMode="MultiLine" runat="server" Height="40px"></asp:TextBox>
                        </div>

                        <div class="form-group col-md-6">
                            <asp:Label ID="lbl_InvApplication" runat="server" Text="What are the direct or indirect applications of the Invention? "></asp:Label>
                            <asp:TextBox ID="txt_InvApplication" CssClass="form-control" TextMode="MultiLine" runat="server" Height="40px"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-md-6">
                            <asp:Label ID="lbl_Problem" runat="server" Text="What were the deficiencies or problems with the existing solution?"></asp:Label>
                            <asp:TextBox ID="txt_Problem" CssClass="form-control" TextMode="MultiLine" runat="server" Height="40px"></asp:TextBox>
                        </div>

                        <div class="form-group col-md-6">
                            <asp:Label ID="lbl_Solution" runat="server" Text="How are you solving these problems?"></asp:Label>
                            <asp:TextBox ID="txt_Solution" CssClass="form-control" TextMode="MultiLine" runat="server" Height="40px"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-md-6">
                            <asp:Label ID="lbl_LiteratureReview" runat="server" Text="Have you conducted the literature review or prior art search? If yes upload the details?"></asp:Label>
                            <asp:TextBox ID="txt_LiteratureReview" CssClass="form-control" TextMode="MultiLine" runat="server" Height="40px"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <%--<div class="row">
                    <div class="form-group col-md-6">
                    </div>
                </div>--%>
                <div class="pnlBorder">
                    <div class="row">
                        <div class="form-group col-md-6">
                            <h4 style="background-color: #ccccFF; color: #000000; border-bottom: 1px solid #A6A6B7">&nbsp;Section V: Details of the Invention </h4>
                        </div>
                    </div>


                    <div class="row">
                        <div class="form-group col-md-6">
                            <asp:Label ID="lbl_InvNovelFeatures" runat="server" Text="What are the novel features of the Invention?"></asp:Label>
                            <asp:TextBox ID="txt_InvNovelFeatures" CssClass="form-control" TextMode="MultiLine" runat="server" Height="40px"></asp:TextBox>
                        </div>

                        <div class="form-group col-md-6">
                            <asp:Label ID="lbl_InvAdvantages" runat="server" Text="What are the advantages of the Invention?"></asp:Label>
                            <asp:TextBox ID="txt_InvAdvantages" CssClass="form-control" TextMode="MultiLine" runat="server" Height="40px"></asp:TextBox>
                        </div>
                    </div>


                    <div class="row">
                        <div class="form-group col-md-6">
                            <asp:Label ID="lbl_InvCategory" runat="server" Text="Is it a product or process or both?"></asp:Label>

                            <asp:DropDownList ID="ddl_InvCategory" CssClass="form-control" runat="server">
                                <asp:ListItem Text="--Select--" Value="--Select--"></asp:ListItem>
                                <asp:ListItem Text="Process" Value="Process"></asp:ListItem>
                                <asp:ListItem Text="Product" Value="Product"></asp:ListItem>
                                <asp:ListItem Text="Both" Value="Both"></asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="form-group col-md-6">
                            <asp:Label ID="lbl_InvExperiment" runat="server" Text="Have you conducted any experiments, do you have any testing data? If yes please upload the details"></asp:Label>
                            <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />
                            <asp:Label ID="Label11" runat="server" Text="" Visible="false"></asp:Label>
                        </div>
                    </div>
                </div>
                <%--<div class="row">
                    <div class="form-group col-md-6">
                    </div>
                </div>--%>
                <div class="pnlBorderEnd">
                    <div class="row">
                        <div class="form-group col-md-6">
                            <h4 style="background-color: #ccccFF; color: #000000; border-bottom: 1px solid #A6A6B7">&nbsp;Section VI: Additional Information  </h4>
                        </div>
                    </div>


                    <div class="row">
                        <div class="form-group col-md-6">
                            <asp:Label ID="Label21" runat="server" Text="If the invention involves use of any biological material/ resources, like plants or seeds or fruit or vegetables or test samples
(from animals, humans, plants), genome (of animals, plants or animals) including amino acid sequences etc"></asp:Label>
                            <%--<asp:CheckBox ID="checkyesresource" CssClass="form-control" Text="Yes" runat="server" onclick="MutExChkList(this);" AutoPostBack="True" />
                        <asp:CheckBox ID="Checknoresource" CssClass="form-control" Text="No" runat="server" onclick="MutExChkList(this);" AutoPostBack="True" />--%>
                            <asp:RadioButtonList ID="rblResource" runat="server" DataTextField="Biological_Resource"
                                DataValueField="Biological_Resource" CssClass="form-control" RepeatDirection="Horizontal" RepeatColumns="2">
                                <asp:ListItem Text="&nbsp; Yes &nbsp;&nbsp;&nbsp;" Value="Yes"></asp:ListItem>
                                <asp:ListItem Text="&nbsp; No &nbsp;" Value="No"></asp:ListItem>

                            </asp:RadioButtonList>
                        </div>

                        <div class="form-group col-md-6">
                            <asp:Label ID="Label22" runat="server" Text="Please select the mode of procurement of the biological material <br />"></asp:Label>
                            <br />
                            <asp:DropDownList ID="ddl_Mode" CssClass="form-control" runat="server">
                                <asp:ListItem Text="--Select--" Value="--Select--"></asp:ListItem>
                                <asp:ListItem Text="Obtained by self" Value="Obtained by self"></asp:ListItem>
                                <asp:ListItem Text="Obtained commercially" Value="Obtained commercially"></asp:ListItem>
                                <asp:ListItem Text="Obtained as a gift " Value="Obtained as a gift "></asp:ListItem>
                            </asp:DropDownList>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 form-group">
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            <asp:Label ID="Label_21" runat="server" Text="If biological material has been procured commercially, kindly mention the following :" ForeColor="Black"></asp:Label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-md-6">
                            <asp:Label ID="lbl_NameofVendor" runat="server" Text="Name of Vendor"></asp:Label>
                            <asp:TextBox ID="txt_NameofVendor" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-6">
                            <asp:Label ID="lbl_AddressofVendor" runat="server" Text="Address of Vendor"></asp:Label>
                            <asp:TextBox ID="txt_AddressofVendor" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <asp:Label ID="lbl_BillReceipts" runat="server" Text="  Bill Receipts of the transaction made for purchase"></asp:Label>
                            <asp:FileUpload ID="FileUpload2" CssClass="form-control" runat="server" />
                            <asp:Label ID="Label12" runat="server" Text=" " Visible="false"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 form-group">
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-md-12">
                            <asp:Label ID="Label_" runat="server" Text="Has biological material deposited with International Depository? If yes, kindly provide the following :" ForeColor="Black"></asp:Label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-md-6">
                            <asp:Label ID="lbl_DateofDeposition" runat="server" Text="Date of Deposition"></asp:Label>
                            <asp:TextBox ID="txt_DateofDeposition" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-6">
                            <asp:Label ID="lbk_AccessionNumber" runat="server" Text="Accession Number"></asp:Label>
                            <asp:TextBox ID="txtAccessionNumber" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>


                    <div class="row">
                        <div class="form-group col-md-6">
                            <asp:Label ID="lbl_NameofDepository" runat="server" Text="Name of Depository"></asp:Label>
                            <asp:TextBox ID="txt_NameofDepository" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-6">
                            <asp:Label ID="lbl_AddressofDepository" runat="server" Text="Address of Depository"></asp:Label>
                            <asp:TextBox ID="txt_AddressofDepository" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 form-group">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 form-group">
                        <asp:Button ID="Buttonsubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="Buttonsubmit_Click" OnClientClick="return validationRefNo()" />
                    </div>
                </div>

            </div>
        </div>
    </div>
    <asp:UpdatePanel ID="UpnlHidden" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="hdn" Value="0" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
