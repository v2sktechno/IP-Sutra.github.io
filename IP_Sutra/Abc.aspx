<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Abc.aspx.cs" Inherits="IP_Sutra.Abc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="dashboard-wrapper">
        <div class="dashboard-ecommerce">
            <div class="container-fluid dashboard-content">
                <div class="row">
                    <div class="form-group col-md-6">
            <asp:Button ID="BtnAdd" runat="server" Text="Add Vehicle" OnClick="BtnAdd_Click" />
            <div id="Rpt1">
                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                    <ItemTemplate>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Registration No </th>                                    
                                    <th>Category of Vehicle</th>
                                    <th>Insurance Cover Note No</th>
                                    <th>Fitness Certificate</th>                                    
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td align="center">
                                        <asp:TextBox autocomplete="off" ID="txtRegNo1" Width="200" runat="server" placeholder="Enter registration no"></asp:TextBox>

                                    </td>                                    

                                    <td align="center">
                                        <asp:DropDownList ID="DdlVehclCatgry1" Width="200" runat="server">
                                            <asp:ListItem Value="0">Vehicle Category 1</asp:ListItem>
                                            <asp:ListItem Value="1">Vehicle Category 2</asp:ListItem>
                                            <asp:ListItem Value="2">Vehicle Category 3</asp:ListItem>
                                            <asp:ListItem Value="3">Vehicle Category 4</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td align="center">
                                        <asp:TextBox autocomplete="off" ID="txtInsrncCovrNo1" Width="200" runat="server" placeholder="Enter insurance cover note no"></asp:TextBox>
                                    </td>

                                    <td align="center">
                                        <asp:FileUpload ID="flupldftnsCert1" runat="server" />
                                    </td>
                                    <td align="center">
                                        <asp:Button ID="BtnDelete" runat="server" Text="Delete Row" />

                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <br />
            <asp:Button runat="server" ID="btnShow" Text="Show data from Repeater" OnClick="btnShow_Click" />
        </div>
                     </div>
                 </div>
             </div>
 

</asp:Content>
