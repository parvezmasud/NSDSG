<%@ Page Title="" Language="C#" MasterPageFile="~/EGlobalAdmin.Master" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="EGlobalLtd.Students" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderAdmin" runat="server">
    <table style="width:100%;">
        <tr>
            <td colspan="3" class="auto-style4">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" class="auto-style6"><strong>NTec Student Information Page</strong></td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="lblStudentId" runat="server"></asp:Label>
            </td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblStdName" runat="server" Text="Student Name :"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="txtStdName" runat="server" Width="299px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Student Name is necessary"></asp:RequiredFieldValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                &nbsp;</td>
            <td class="auto-style3">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblAdd" runat="server" Text="Address :"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="txtAdd" runat="server" Width="299px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                &nbsp;</td>
            <td class="auto-style3">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblDOB" runat="server" Text="DOB :"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="txtDob" runat="server" Width="299px"></asp:TextBox></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                &nbsp;</td>
            <td class="auto-style3">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblEmail" runat="server" Text="Email :"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="txtEmail" runat="server" Width="299px" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email Required" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                &nbsp;</td>
            <td class="auto-style3">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblContact" runat="server" Text="Contact :"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="txtContact" runat="server" Width="299px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblStatus" runat="server" Text="Status :"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:CheckBox ID="chkStatus" runat="server" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style4">
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" Width="87px" />
            </td>
            <td>
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" Width="87px" />
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
                <asp:Label ID="lblMessage" runat="server" CssClass="auto-style5"></asp:Label>
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
                <asp:GridView ID="GridViewEmpList" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="139px" Width="615px" OnSelectedIndexChanged="GridViewEmpList_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" /> <%--OnSelectedIndexChanged="GridViewEmpList_SelectedIndexChanged" --%>
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
