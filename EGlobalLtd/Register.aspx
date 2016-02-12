<%@ Page Title="" Language="C#" MasterPageFile="~/EGlobalLtd.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="EGlobalLtd.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            text-align: center;
        }
        .auto-style4 {
            width: 265px;
        }
        .auto-style5 {
            margin-left: 0px;
        }
        .auto-style6 {
            width: 10px;
        }
        .auto-style7 {
            width: 265px;
            text-align: right;
        }
        .auto-style8 {
            width: 333px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">

    <div id="mainWrapper" class="container">

        <table style="width:100%;">
        <tr>
            <td class="auto-style2" colspan="4"><strong>
                <asp:Label ID="Label7" runat="server" BackColor="#1880A5" BorderStyle="None" Font-Size="Medium" Height="22px" Width="818px" ForeColor="White">Welcome to Registration!</asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="lblUserName" runat="server" Text="User Name :"></asp:Label>
            </td>
            <td class="auto-style6">&nbsp;</td>
            <td colspan="2">
                <asp:TextBox ID="txtUserName" runat="server" CssClass="auto-style5" Width="400px" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" ErrorMessage="Username is required for registration"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                &nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="lblEmail" runat="server" Text="Your email address"></asp:Label>
&nbsp;: </td>
            <td class="auto-style6">&nbsp;</td>
            <td colspan="2">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="auto-style5" Width="400px" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required for registration"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                &nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="lblPassword" runat="server" Text="Password :"></asp:Label>
            </td>
            <td class="auto-style6">&nbsp;</td>
            <td colspan="2">
                <asp:TextBox ID="txtPassword" runat="server" CssClass="auto-style5" Width="400px" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required for registration"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                &nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="lblRetypePass" runat="server" Text="Retype password :"></asp:Label>
            </td>
            <td class="auto-style6">&nbsp;</td>
            <td colspan="2">
                <asp:TextBox ID="txtRetypePass" runat="server" CssClass="auto-style5" Width="400px" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtRetypePass" ErrorMessage="Your retype password does not match"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                &nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="lblFirstName" runat="server" Text="First name :"></asp:Label>
            </td>
            <td class="auto-style6">&nbsp;</td>
            <td colspan="2">
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="auto-style5" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                &nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="lblLastName" runat="server" Text="Last/Family Name :"></asp:Label>
            </td>
            <td class="auto-style6">&nbsp;</td>
            <td colspan="2">
                <asp:TextBox ID="txtLastName" runat="server" CssClass="auto-style5" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                &nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td>
                <asp:Button ID="btnRegister" runat="server" Text="Register me" Width="180px" OnClick="btnRegister_Click" />
            </td>
            <td class="auto-style8">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2" colspan="4">
                <asp:Label ID="lblMessage" runat="server" BackColor="#1880A5" BorderStyle="None" Font-Size="Medium" Height="22px" Width="818px" ForeColor="White"></asp:Label>
            </td>
        </tr>
        </table>

    </div>

</asp:Content>
