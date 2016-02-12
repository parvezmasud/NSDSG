<%@ Page Title="" Language="C#" MasterPageFile="~/EGlobalLtd.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="EGlobalLtd.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            text-align: right;
        }
        .auto-style3 {
            text-align: center;
            width: 49px;
        }
        .auto-style4 {
            width: 289px;
        }
        .auto-style5 {
            width: 2px;
        }
        .auto-style6 {
            width: 15px;
        }
        .auto-style8 {
            width: 641px;
        }
        .auto-style9 {
            text-align: right;
            width: 289px;
        }
    .auto-style10 {
        text-align: center;
        width: 49px;
        height: 13px;
    }
    .auto-style11 {
        width: 289px;
        height: 13px;
    }
    .auto-style12 {
        width: 15px;
        height: 13px;
    }
    .auto-style13 {
        height: 13px;
    }
        .auto-style14 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">

        <div id="mainWrapper" class="container">

        <table style="width:100%;">
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style2" colspan="4">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1" colspan="6"><strong>
                <asp:Label ID="Label7" runat="server" BackColor="#1880A5" BorderStyle="None" Font-Size="Medium" Height="22px" Width="818px" ForeColor="White" Font-Bold="False">Sign in to your account</asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style8">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style9">
                <asp:Label ID="lblUserName" runat="server" Text="User Name or Email"></asp:Label>
&nbsp;: </td>
            <td class="auto-style6">&nbsp;</td>
            <td colspan="2">
                <asp:TextBox ID="txtUserName" runat="server" CssClass="auto-style5" Width="400px"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" ErrorMessage="User Email/UserName is required to login"></asp:RequiredFieldValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style9">
                <asp:Label ID="lblPassword" runat="server" Text="Password :"></asp:Label>
            </td>
            <td class="auto-style6">&nbsp;</td>
            <td colspan="2">
                <asp:TextBox ID="txtPassword" runat="server" Width="400px" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="User Password is required to login" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style9">
                &nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td colspan="2">
                <asp:CheckBox ID="chkKeepSigned" runat="server" Text="Keep me signed in" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style10"></td>
            <td class="auto-style11">
                </td>
            <td class="auto-style12"></td>
            <td colspan="2" class="auto-style13">
                </td>
            <td class="auto-style13"></td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style8">
                <asp:Button ID="btnLogIn" runat="server" Text="Sign in" Width="180px" OnClick="btnLogIn_Click" />
            </td>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style8">&nbsp;</td>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1" colspan="6">
                <asp:Label ID="lblComment" runat="server" BackColor="#1880A5" BorderStyle="None" Height="22px" Width="818px" ForeColor="White"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style8">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>

    </div>
    <div class="auto-style14">
        <asp:HyperLink ID="hprLnkCantAccessAcc" runat="server" NavigateUrl="~/UserPassword/ResetPassword.aspx" ForeColor="#0066CC">Can&#39;t access my account?</asp:HyperLink>
    </div>
</asp:Content>
