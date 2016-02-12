<%@ Page Title="" Language="C#" MasterPageFile="~/EGlobalLtd.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="EGlobalLtd.ResetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            text-align: right;
        }
        .auto-style4 {
            text-align: right;
            width: 390px;
        }
        .auto-style5 {
            width: 247px;
        }
        .auto-style7 {
            width: 390px;
        }
        .auto-style8 {
            width: 246px;
        }
        .auto-style9 {
            width: 1px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="auto-style2" colspan="4">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1" colspan="4"><strong>
                <asp:Label ID="Label7" runat="server" BackColor="#1880A5" BorderStyle="None" Font-Size="Medium" Height="22px" Width="818px" ForeColor="White" Font-Bold="False">Reset password</asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style8">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lblUserName" runat="server" Text="Your email address/user name"></asp:Label>
&nbsp;: </td>
            <td class="auto-style9">&nbsp;</td>
            <td colspan="2">
                <asp:TextBox ID="txtUserName" runat="server" CssClass="auto-style5" Width="400px"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" ErrorMessage="User Email/UserName is required to login"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style8">
                <asp:Button ID="btnResetPassword" runat="server" Text="Send me a Reset Password Link" Width="405px" OnClick="btnResetPassword_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style8">&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1" colspan="4">
                <asp:Label ID="lblComment" runat="server" BackColor="#1880A5" BorderStyle="None" Height="22px" Width="818px" ForeColor="White"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style8">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
