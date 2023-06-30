<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Designation.aspx.cs" Inherits="IP_Sutra.Designation" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .gridSize {
            max-width: 100%;
            width: 60%;
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
            $("[id*=grdfile] td").hover(function () {
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dashboard-wrapper">
        <div class="dashboard-ecommerce">
            <div class="container-fluid dashboard-content">
                <h4 class="auto-style1">Designation Entry :</h4>
                <hr style="border-bottom: 1px thin; border-bottom-color: crimson; width: 100%; height: 5px" />
                <div class="MsgStyle">
                    <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Text="" Visible="false" CssClass="MsgStyle"></asp:Label>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <asp:Label ID="lbl_Designation" runat="server" Text="Designation"></asp:Label>
                        <asp:TextBox ID="txt_Designation" CssClass="form-control" runat="server" placeholder=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDesig" runat="server" ControlToValidate="txt_Designation" ErrorMessage="* Designation Name required"
                            ForeColor="Red" ValidationGroup="dsg"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-6">
                        <asp:Button ID="btn_save" Text="Save" runat="server" CssClass="btn btn-primary" OnClick="btn_save_Click" ValidationGroup="dsg"></asp:Button>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <asp:GridView ID="grddesig" runat="server" AutoGenerateColumns="false" OnRowCommand="grddesig_RowCommand"
                            OnPageIndexChanging="grddesig_PageIndexChanging"
                            BackColor="White" BorderColor="#EEF2F5" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CssClass="gridSize" ShowFooter="false" AllowPaging="True"
                            GridLines="None" Font-Bold="False" FooterStyle-Wrap="True"
                            PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" PagerSettings-PageButtonCount="4"
                            PagerStyle-VerticalAlign="Bottom" PagerStyle-HorizontalAlign="Center" PageSize="15" HorizontalAlign="Left"
                            RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Height="50px">
                            <Columns>
                                <asp:TemplateField HeaderText="Id" HeaderStyle-Width="8%">
                                    <ItemTemplate>
                                        <%#Eval("Id") %>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="gridheader"></HeaderStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText=" Designation">
                                    <ItemTemplate>
                                        <%#Eval(" designation") %>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action" HeaderStyle-Width="4%">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnedit" ImageUrl="~/assests/images/icon_edit.png" Height="20px" Width="20px" runat="server" Text="edit" ForeColor="black" CommandName="abc1" CommandArgument='<%#Eval("id") %>' />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="grdHeadVLine"></HeaderStyle>

                                    <ItemStyle CssClass="grdVLine"></ItemStyle>
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText=" Delete" HeaderStyle-Width="4%">
                                    <ItemTemplate>
                                        <%-- <asp:LinkButton ID="btnSubmit" runat="server" Text="Submit" ValidationGroup="tinku" CommandName="abc2" CommandArgument='<%#Eval("id") %>'></asp:LinkButton>--%>
                                        <asp:ImageButton ID="btndelet" ImageUrl="~/assests/images/delete.png" Height="20px" Width="20px" runat="server" ForeColor="black" CommandName="abc" CommandArgument='<%#Eval("id") %>' />
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


