<%@ Page Title="" Language="C#" MasterPageFile="~/EGlobalAdmin.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="EGlobalLtd.Employee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 271px;
        }
        .auto-style2 {
            width: 271px;
            text-align: right;
        }
        .auto-style3 {
            width: 344px;
        }
        .auto-style4 {
            text-align: center;
        }
        .auto-style5 {
            color: #009933;
        }
        .auto-style6 {
            text-align: center;
            color: #336699;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderAdmin" runat="server">


    <table style="width:100%;">
        <tr>
            <td class="auto-style1" style="width:120px">&nbsp;</td>
            <td colspan="3" class="auto-style4">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="4" class="auto-style6"><strong>NTec Employee Information Page</strong></td>
        </tr>
        <tr>
                <td class="auto-style1" style="width:120px">&nbsp;</td>
            <td class="auto-style1">
                <asp:Label ID="lblEmpId" runat="server"></asp:Label>
            </td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1" style="width:120px">&nbsp;</td>
            <td class="auto-style2">
                <asp:Label ID="lblEmpName" runat="server" Text="Employee Name :"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="txtEmpName" runat="server" Width="299px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
                <td class="auto-style1" style="width:120px">&nbsp;</td>

            <td class="auto-style2">
                &nbsp;</td>
            <td class="auto-style3">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
                <td class="auto-style1" style="width:120px">&nbsp;</td>

            <td class="auto-style2">
                <asp:Label ID="lblDept" runat="server" Text="Department :"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="txtDept" runat="server" Width="299px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
                <td class="auto-style1" style="width:120px">&nbsp;</td>

            <td class="auto-style2">
                &nbsp;</td>
            <td class="auto-style3">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
                <td class="auto-style1" style="width:120px">&nbsp;</td>

            <td class="auto-style2">
                <asp:Label ID="lblEmail" runat="server" Text="Email :"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="txtEmail" runat="server" Width="299px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
                <td class="auto-style1" style="width:120px">&nbsp;</td>

            <td class="auto-style2">
                &nbsp;</td>
            <td class="auto-style3">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
                <td class="auto-style1" style="width:120px">&nbsp;</td>

            <td class="auto-style2">
                <asp:Label ID="lblMobileNo" runat="server" Text="Mobile No :"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="txtMobileNo" runat="server" Width="299px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
                            <td class="auto-style1" style="width:120px">&nbsp;</td>

            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
                <td class="auto-style1" style="width:120px">&nbsp;</td>

            <td colspan="2" class="auto-style4">
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" Width="87px" />
            </td>
            <td>
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" Width="87px" />
            </td>
        </tr>
        <tr>
                <td class="auto-style1" style="width:120px">&nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4" class="auto-style4">
                <asp:Label ID="lblMessage" runat="server" CssClass="auto-style5" BackColor="#1880A5" BorderStyle="None" ForeColor="White"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" style="width:120px">&nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
                <td class="auto-style1" style="width:120px">&nbsp;</td>
                        <td colspan="3" class="auto-style4">
                <asp:GridView ID="GridViewEmpList" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="139px" OnSelectedIndexChanged="GridViewEmpList_SelectedIndexChanged" Width="615px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
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
