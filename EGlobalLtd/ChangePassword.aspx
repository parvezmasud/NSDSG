<%@ Page Title="" Language="C#" MasterPageFile="~/EGlobalCustomer.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="EGlobalLtd.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            text-align: left;
        }
        .auto-style3 {
            text-align: right;
            width: 359px;
        }
        .auto-style4 {
            text-align: center;
            width: 28px;
        }
        .auto-style6 {
            text-align: center;
            width: 3px;
        }
        .auto-style7 {
            text-align: right;
            width: 3px;
        }
        .auto-style8 {
            text-align: center;
            width: 359px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCustomer" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="auto-style1" colspan="4"><strong>
                <asp:Label ID="Label7" runat="server" BackColor="#1880A5" BorderStyle="None" Font-Size="Medium" Height="22px" Width="818px" ForeColor="White" Font-Bold="False">Welcome to change your current password</asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style1">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lblUserName" runat="server" Text="User Name :"></asp:Label>
            </td>
            <td class="auto-style6">&nbsp;</td>
            <td colspan="2">
                <asp:TextBox ID="txtUserName" runat="server" CssClass="auto-style9" Width="400px" Enabled="False" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                &nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td colspan="2" class="auto-style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lblEmail" runat="server" Text="Your email address"></asp:Label>
&nbsp;: </td>
            <td class="auto-style6">&nbsp;</td>
            <td colspan="2">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="auto-style9" Width="400px" TextMode="Email" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                </td>
            <td class="auto-style7"></td>
            <td colspan="2" class="auto-style4">
                </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lblOldPass" runat="server" Text="Current (Old) password :"></asp:Label>
            </td>
            <td class="auto-style6">&nbsp;</td>
            <td colspan="2" class="auto-style9">
                <asp:TextBox ID="txtOldPass" runat="server" CssClass="auto-style9" Width="400px" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                &nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td colspan="2" class="auto-style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lblNewPass" runat="server" Text="New Password :"></asp:Label>
            </td>
            <td class="auto-style6">&nbsp;</td>
            <td colspan="2" class="auto-style9">
                <asp:TextBox ID="txtNewPass" runat="server" CssClass="auto-style9" Width="400px" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                &nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td colspan="2" class="auto-style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lblNewPassRetype" runat="server" Text="Retype your New Password :"></asp:Label>
            </td>
            <td class="auto-style6">&nbsp;</td>
            <td colspan="2" class="auto-style2">
                <asp:TextBox ID="txtNewPassRetype" runat="server" CssClass="auto-style9" Width="400px" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                &nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td colspan="2" class="auto-style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lblUserId" runat="server" Visible="False"></asp:Label>
            </td>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style2">
                <asp:Button ID="btnUpdate" runat="server" Text="Change my password" Width="180px" OnClick="btnUpdate_Click" />
            </td>
            <td class="auto-style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style1">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1" colspan="4">
                <asp:Label ID="lblMessage" runat="server" BackColor="#1880A5" BorderStyle="None" Font-Size="Medium" Height="22px" Width="818px" ForeColor="White" Font-Bold="False"></asp:Label>
            </td>
        </tr>
        </table>
</asp:Content>
