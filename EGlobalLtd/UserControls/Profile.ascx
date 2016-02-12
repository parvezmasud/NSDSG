<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Profile.ascx.cs" Inherits="EGlobalLtd.UserControls.Profile" %>
    <style type="text/css">
        .auto-style1 {
            text-align: right;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            width: 19px;
        }
        .auto-style4 {
            width: 18px;
        }
        .auto-style5 {
            width: 2px;
        }
        .auto-style6 {
            width: 338px;
        }
        .auto-style7 {
            text-align: right;
            width: 338px;
        }
    </style>
    <table style="width:100%;">

        <tr>
         <td class="auto-style2" colspan="5"><strong>
                <asp:Label ID="Label7" runat="server" BackColor="#1880A5" BorderStyle="None" Font-Size="Medium" Height="22px" Width="818px" ForeColor="White">Welcome to my Profile Page!</asp:Label>
                </strong></td>
        </tr>
        <tr>
        <td  style="width:120px">

        </td>            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style1">&nbsp;</td>
        </tr>
        <tr>
                    <td  style="width:120px">

        </td><td class="auto-style7">
                <asp:Label ID="lblUserName" runat="server" Text="User Name :"></asp:Label>
            </td>
            <td class="auto-style5">&nbsp;</td>
            <td colspan="2">
                <asp:TextBox ID="txtUserName" runat="server" CssClass="auto-style9" Width="400px" Enabled="False" ></asp:TextBox>
            </td>
        </tr>
        <tr>
                    <td  style="width:120px">

        </td><td class="auto-style7">
                &nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td colspan="2" class="auto-style2">
                &nbsp;</td>
        </tr>
        <tr>
                    <td  style="width:120px">

        </td><td class="auto-style7">
                <asp:Label ID="lblEmail" runat="server" Text="Your email address"></asp:Label>
&nbsp;: </td>
            <td class="auto-style5">&nbsp;</td>
            <td colspan="2">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="auto-style9" Width="400px" TextMode="Email" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
                    <td  style="width:120px">

        </td><td class="auto-style7">
                </td>
            <td class="auto-style5"></td>
            <td colspan="2" class="auto-style4">
                </td>
        </tr>
        <tr>
                    <td  style="width:120px">

        </td><td class="auto-style7">&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
        </tr>
        <tr>
                    <td  style="width:120px">

        </td><td class="auto-style7">
                <asp:Label ID="lblFirstName" runat="server" Text="First name :"></asp:Label>
            </td>
            <td class="auto-style5">&nbsp;</td>
            <td colspan="2" class="auto-style14">
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="auto-style9" Width="400px" Visible="False"></asp:TextBox>
                <asp:Label ID="lblFName" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
                    <td  style="width:120px">

        </td><td class="auto-style7">
                &nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td colspan="2" class="auto-style2">
                &nbsp;</td>
        </tr>
        <tr>
                    <td  style="width:120px">

        </td><td class="auto-style7">
                <asp:Label ID="lblLastName" runat="server" Text="Last/Family Name :"></asp:Label>
            </td>
            <td class="auto-style5">&nbsp;</td>
            <td colspan="2" class="auto-style14">
                <asp:TextBox ID="txtLastName" runat="server" CssClass="auto-style9" Width="400px" Visible="False"></asp:TextBox>
                <asp:Label ID="lbllName" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
                    <td  style="width:120px">

        </td><td class="auto-style7">
                &nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td colspan="2" class="auto-style1">
                &nbsp;</td>
        </tr>
        <tr>
                    <td  style="width:120px">

        </td><td class="auto-style7">
                <asp:Label ID="lblUserId" runat="server" Visible="False"></asp:Label>
            </td>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style3">
                <asp:Button ID="btnEditProfile" runat="server" OnClick="btnEditProfile_Click" Text="Edit Profile Info" Width="180px" />
                <asp:Button ID="btnUpdate" runat="server" Text="Update" Width="180px" OnClick="btnUpdate_Click" />
            </td>
            <td class="auto-style2">
                &nbsp;</td>
        </tr>
        <tr>
                    <td  style="width:120px">

        </td><td class="auto-style6">&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style1">&nbsp;</td>
        </tr>
        <tr>
             <td class="auto-style2" colspan="5">
                <asp:Label ID="lblMessage" runat="server" BackColor="#1880A5" BorderStyle="None" Height="22px" Width="818px" ForeColor="White"></asp:Label>
            </td>
        </tr>
    </table>