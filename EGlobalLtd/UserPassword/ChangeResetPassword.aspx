<%@ Page Title="" Language="C#" MasterPageFile="~/EGlobalLtd.Master" AutoEventWireup="true" CodeBehind="ChangeResetPassword.aspx.cs" Inherits="EGlobalLtd.UserPassword.ChangeResetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            text-align: right;
        }
        .auto-style3 {
            text-align: left;
        }
        .auto-style4 {
            text-align: left;
            width: 333px;
        }
        .auto-style5 {
            text-align: right;
            width: 333px;
        }
        .auto-style7 {
            width: 333px;
        }
        .auto-style8 {
            width: 1px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="auto-style1" colspan="4"><strong>
                <asp:Label ID="Label7" runat="server" BackColor="#1880A5" BorderStyle="None" Font-Size="Medium" Height="22px" Width="818px" ForeColor="White" Font-Bold="False">Welcome to change your current password</asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style8">&nbsp;</td>
            <td colspan="2" class="auto-style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lblNewPass" runat="server" Text="New Password :"></asp:Label>
            </td>
            <td class="auto-style8">&nbsp;</td>
            <td colspan="2" class="auto-style3">
                <asp:TextBox ID="txtNewPass" runat="server" CssClass="auto-style9" Width="400px" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style8">&nbsp;</td>
            <td colspan="2" class="auto-style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lblNewPassRetype" runat="server" Text="Retype your New Password :"></asp:Label>
            </td>
            <td class="auto-style8">&nbsp;</td>
            <td colspan="2" class="auto-style3">
                <asp:TextBox ID="txtNewPassRetype" runat="server" CssClass="auto-style9" Width="400px" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style8">&nbsp;</td>
            <td colspan="2" class="auto-style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lblUserId" runat="server" Visible="False"></asp:Label>
            </td>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style3">
                <asp:Button ID="btnUpdate" runat="server" Text="Change password" Width="180px" OnClick="btnUpdate_Click" />
            </td>
            <td class="auto-style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style8">&nbsp;</td>
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
