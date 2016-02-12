<%@ Page Title="" Language="C#" MasterPageFile="~/EGlobalAdmin.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="EGlobalLtd.Customers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            text-align: left;
        }
        .auto-style3 {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderAdmin" runat="server">
    <table style="width:100%;">
        <tr>
            <td colspan="3" class="auto-style1"><strong>
                <asp:Label ID="lblTitle" runat="server" Text="User or Customer Information Page" BackColor="#1880A5" BorderStyle="None" Font-Size="Medium" Height="22px" Width="818px" ForeColor="White" Font-Bold="False"></asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="lblCustomerId" runat="server" Visible="False"></asp:Label>
            </td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lblFirstName" runat="server" Text="First Name :"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtFirstName" runat="server" Width="299px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lblLastName" runat="server" Text="Last Name :"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtLastName" runat="server" Width="299px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lblUserName" runat="server" Text="User Name :"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtUserName" runat="server" Width="299px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" ErrorMessage="User Name is require to update."></asp:RequiredFieldValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lblUserType" runat="server" Text="User Type :"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:DropDownList ID="DDListUserType" runat="server" Height="29px" Width="304px">
                    <asp:ListItem Value="0">Select User Type</asp:ListItem>
                    <asp:ListItem Value="1">Admin</asp:ListItem>
                    <asp:ListItem Selected="True" Value="2">BuyerOrSeller</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lblUserStatus" runat="server" Text="User Status :"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:CheckBox ID="chkBoxStatus" runat="server" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lblEmail" runat="server" Text="Email :"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtEmail" runat="server" Width="299px" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="User Email is require to update."></asp:RequiredFieldValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lblMobileNo" runat="server" Text="Mobile No :"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtMobileNo" runat="server" Width="299px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style1">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" Width="87px" />
            </td>
            <td>
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" Width="87px" />
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" class="auto-style1">
                <asp:Label ID="lblMessage" runat="server" CssClass="auto-style5" BackColor="#1880A5" BorderStyle="None" Font-Size="Medium" Height="22px" Width="818px" ForeColor="White" Font-Bold="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" class="auto-style4">
                <asp:GridView ID="GridViewCustomers" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="139px" OnSelectedIndexChanged="GridViewCustomers_SelectedIndexChanged" Width="979px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
