<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="IP_Sutra.User" %>


<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">

    <style>
        .gridSize {
            max-width: 100%;
            width: 90%;
        }

        td {
            cursor: default;
        }

        .hover_row {
            background-color: #A1DCF2;
        }
    </style>

    <script type="text/javascript">

         <%--function to show mouse hove on grid--%>
        $(function () {
            $("[id*=grduser] td").hover(function () {
                $("td", $(this).closest("tr")).addClass("hover_row");
            }, function () {
                $("td", $(this).closest("tr")).removeClass("hover_row");
            });
        });

         <%--function to auto hide msg label--%>
        function HideLabel() {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };

    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dashboard-wrapper">
        <div class="dashboard-ecommerce">
            <div class="container-fluid dashboard-content">
                <h4 class="auto-style1">User Details Entry :</h4>
                <hr style="border-bottom: 1px thin; border-bottom-color: crimson; width: 100%; height: 5px" />
                <div class="MsgStyle">
                    <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Text="" Visible="false" CssClass="MsgStyle"></asp:Label>
                    <%--<asp:ValidationSummary runat="server" ShowMessageBox="false" ShowSummary="true" ValidationGroup="usr" />--%>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">

                        <asp:Label ID="lbl_UserName" runat="server" Text="User Name"></asp:Label>
                        &nbsp;
                        <asp:RequiredFieldValidator ID="rfvUName" runat="server" ControlToValidate="txt_UserName" CssClass="MsgStyle"
                            ErrorMessage="(*) Required field" ValidationGroup="usr" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txt_UserName" CssClass="form-control" runat="server" placeholder="" ValidationGroup="usr"></asp:TextBox>

                    </div>

                    <div class="form-group col-md-6">
                        <asp:Label ID="lbl_Password" runat="server" Text="Password"></asp:Label>&nbsp;
                        <asp:RequiredFieldValidator ID="rvfPassword" runat="server" ControlToValidate="txt_Password" CssClass="MsgStyle"
                            ErrorMessage="(*) Required field" ValidationGroup="usr" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txt_Password" CssClass="form-control" runat="server" placeholder="" TextMode="Password" ValidationGroup="usr"></asp:TextBox>
                        
                    </div>
                </div>


                <div class="row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lbl_department" runat="server" Text="Department"></asp:Label>
                        <asp:DropDownList ID="ddl_department" CssClass="form-control" runat="server">
                            <asp:ListItem Text="--Select--" Value="Select"></asp:ListItem>
                            <asp:ListItem Text="A1" Value="A1"></asp:ListItem>
                            <asp:ListItem Text="A2" Value="A2"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                        </asp:DropDownList>

                    </div>

                    <div class="form-group col-md-6">
                        <asp:Label ID="lbl_designation" runat="server" Text="Designation"></asp:Label>
                        <asp:DropDownList ID="ddl_designation" CssClass="form-control" runat="server">
                            <asp:ListItem Text="--Select--" Value="Select"></asp:ListItem>
                            <asp:ListItem Text="D1" Value="D1"></asp:ListItem>
                            <asp:ListItem Text="D2" Value="D2"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="Other"></asp:ListItem>

                        </asp:DropDownList>

                    </div>
                </div>


                <div class="row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lbl_Role" runat="server" Text="Role"></asp:Label>
                        <asp:DropDownList ID="ddl_Role" CssClass="form-control" runat="server">
                            <asp:ListItem Text="--Select--" Value="Select"></asp:ListItem>
                            <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                            <asp:ListItem Text="Manager" Value="Manager"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="Other"></asp:ListItem>

                        </asp:DropDownList>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-6">
                        <asp:Button ID="btn_save" Text="Save" runat="server" CssClass="btn btn-primary" OnClick="btn_save_Click" ValidationGroup="usr"></asp:Button>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <asp:GridView ID="grduser" runat="server" AutoGenerateColumns="false" OnRowCommand="grduser_RowCommand"
                            OnPageIndexChanging="grduser_PageIndexChanging"
                            BackColor="White" BorderColor="#EEF2F5" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CssClass="gridSize" ShowFooter="false" AllowPaging="True"
                            GridLines="None" Font-Bold="False" FooterStyle-Wrap="True"
                            PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" PagerSettings-PageButtonCount="4"
                            PagerStyle-VerticalAlign="Bottom" PagerStyle-HorizontalAlign="Center" PageSize="15" HorizontalAlign="Left"
                            RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Height="50px">
                            <Columns>
                                <asp:TemplateField HeaderText="User Id" HeaderStyle-Width="6%">
                                    <ItemTemplate>
                                        <%#Eval("UserId") %>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="gridheader"></HeaderStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="User Name">
                                    <ItemTemplate>
                                        <%#Eval("UserName") %>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Password">
                                    <ItemTemplate>
                                        <%#Eval("Password") %>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Designation">
                                    <ItemTemplate>
                                        <%#Eval("Designation") %>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText=" Department">
                                    <ItemTemplate>
                                        <%#Eval(" Department") %>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Role">
                                    <ItemTemplate>
                                        <%#Eval("Role") %>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Action" HeaderStyle-Width="4%">
                                    <ItemTemplate>

                                        <asp:ImageButton ID="btnedit" ImageUrl="~/assests/images/icon_edit.png" Height="20px" Width="20px" runat="server" Text="edit" ForeColor="black" CommandName="abc1" CommandArgument='<%#Eval("UserId") %>' />

                                    </ItemTemplate>
                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                    <ItemStyle CssClass="grdVLine"></ItemStyle>

                                </asp:TemplateField>


                                <asp:TemplateField HeaderText=" Delete" HeaderStyle-Width="4%">
                                    <ItemTemplate>

                                        <asp:ImageButton ID="btndelet" ImageUrl="~/assests/images/delete.png" Height="20px" Width="20px" runat="server" ForeColor="black" CommandName="abc" CommandArgument='<%#Eval("UserId") %>' />
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
                            <SelectedRowStyle BackColor="#ABC8F3" Font-Bold="True" ForeColor="#CCFF99" />
                            <SortedAscendingCellStyle BackColor="#EDF6F6" />
                            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                            <SortedDescendingCellStyle BackColor="#D6DFDF" />
                            <SortedDescendingHeaderStyle BackColor="#002876" />
                        </asp:GridView>
                    </div>
                </div>
            </div>

        </div>
    </div>


</asp:Content>




