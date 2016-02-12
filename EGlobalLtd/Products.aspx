<%@ Page Title="" Language="C#" MasterPageFile="~/EGlobalCustomer.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="EGlobalLtd.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--    <link href="css2/pikaday.css" rel="stylesheet" />
    <script src="css2/pikaday.js"></script>
    <link href="css2/site.css" rel="stylesheet" />
    <link href="css2/theme.css" rel="stylesheet" />--%>
    <style type="text/css">

        .auto-style1 {
            text-align: center;
        }
        .auto-style5 {
            height: 21px;
        }
        .auto-style43 {
            margin-left: 0;
        }
        .auto-style45 {
            width: 480px;
        }
        .auto-style46 {
            width: 151px;
        }
        .auto-style47 {
            text-align: center;
        }
        .auto-style48 {
            width: 151px;
            text-align: right;
        }
        .auto-style49 {
            width: 220px;
        }
        .auto-style50 {
            width: 220px;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderCustomer" runat="server">
    <div id="mainWrapper">

    <table style="width:100%;">
                    <tr>
                        <td colspan="4" class="auto-style47">
                
                <strong>
                <asp:Label ID="Label7" runat="server" BackColor="#1880A5" BorderStyle="None" Font-Size="Medium" Height="22px" Width="1000px" CssClass="auto-style43" ForeColor="White">Adding a Product</asp:Label>
                </strong></td>
                    </tr>
                    <tr>
                        <td class="auto-style49">&nbsp;</td>
                        <td class="auto-style45">&nbsp;</td>
                        <td class="auto-style46">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style50">
                <asp:Label ID="lblProductCategory" runat="server" Text="Product Category :"></asp:Label>
                        </td>
                        <td class="auto-style45">
                <asp:DropDownList ID="ddLstProductCategory" runat="server" AutoPostBack="True" Height="20px" Width="400px" OnSelectedIndexChanged="ddLstProductCategory_SelectedIndexChanged">
                </asp:DropDownList>
                        </td>
                        <td class="auto-style48">
                <asp:Label ID="lblNewOrUsed" runat="server" Text="New/Used :"></asp:Label>
                        </td>
                        <td>
                <asp:DropDownList ID="ddLstNewOrUsed" runat="server" Width="160px" Height="20px">
                    <asp:ListItem>New</asp:ListItem>
                    <asp:ListItem>Used</asp:ListItem>
                </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style50">
                <asp:Label ID="lblProductSubCategory" runat="server" Text="Product Sub-Category :"></asp:Label>
                        </td>
                        <td class="auto-style45">
                <asp:DropDownList ID="ddLstProductSubCategory" runat="server" Height="20px" Width="400px">
                </asp:DropDownList>
                        </td>
                        <td class="auto-style48">
                <asp:Label ID="lblPrdId" runat="server"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style50">
                <asp:Label ID="lblProductName" runat="server" Text="Product Name :"></asp:Label>
                        </td>
                        <td class="auto-style45">
                <asp:TextBox ID="txtProductName" runat="server" CssClass="auto-style5" Width="400px"></asp:TextBox>
                        </td>
                        <td class="auto-style46">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style50">
                <asp:Label ID="lblDescription" runat="server" Text="Description :"></asp:Label>
                        </td>
                        <td class="auto-style45">
                <asp:TextBox ID="txtDescription" runat="server" Width="400px" Height="76px" MaxLength="250" TextMode="MultiLine"></asp:TextBox>
                        </td>
                        <td colspan="2">
                            <asp:Image ID="ImagePrd" runat="server" Height="80px" Width="70px" />
                <asp:FileUpload ID="uploadProductPhoto" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style50">
                <asp:Label ID="lblQnty" runat="server" Text="Quantity :"></asp:Label>
                        </td>
                        <td class="auto-style45">
                <asp:TextBox ID="txtQnty" runat="server" CssClass="auto-style5" Width="400px"></asp:TextBox>
                        </td>
                        <td class="auto-style48">
                <asp:Label ID="lblUPrice" runat="server" Text="Unit price : NZD"></asp:Label>
                        </td>
                        <td>
                <asp:TextBox ID="txtUPrice" runat="server" Width="160px" TextMode="Number"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style50">
                <asp:Label ID="lblPubDate" runat="server" Text="Publish Date :"></asp:Label>
                        </td>
                        <td class="auto-style45">
                <asp:TextBox ID="txtPubDate" runat="server" CssClass="auto-style5" Width="400px"></asp:TextBox>
                        </td>
                        <td class="auto-style48">
                <asp:Label ID="lblPubPeriod" runat="server" Text="Publish Period :"></asp:Label>
                        </td>
                        <td>
                <asp:DropDownList ID="ddLstPubPeriod" runat="server" Width="160px" Height="20px">
                    <asp:ListItem Value="3">3 days</asp:ListItem>
                    <asp:ListItem Value="7">7 days</asp:ListItem>
                    <asp:ListItem Value="14">14 days</asp:ListItem>
                    <asp:ListItem Value="21">21 days</asp:ListItem>
                    <asp:ListItem Value="30">30 days/a Month</asp:ListItem>
                </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style50">
                <asp:Label ID="lblIsPublish" runat="server" Text="Publish the product :"></asp:Label>
                        </td>
                        <td class="auto-style45">
                            <asp:CheckBox ID="chkBoxStatus" runat="server" />
                        </td>
                        <td class="auto-style46">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style49">&nbsp;</td>
                        <td class="auto-style45">&nbsp;</td>
                        <td class="auto-style46">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style49">&nbsp;</td>
                        <td class="auto-style45">
                <asp:Button ID="btnSave" runat="server" Text="Save &amp; Publish" Width="160px" OnClick="btnSave_Click" />
                        </td>
                        <td class="auto-style46">
                <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update &amp; Publish" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style49">&nbsp;</td>
                        <td class="auto-style45">&nbsp;</td>
                        <td class="auto-style46">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="4" class="auto-style47">
                <asp:Label ID="lblMessage" runat="server" BackColor="#1880A5" BorderStyle="None" Height="22px" Width="1000px" ForeColor="White"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style49">&nbsp;</td>
                        <td class="auto-style45">&nbsp;</td>
                        <td class="auto-style46">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="4">

    <asp:GridView ID="GridViewProductList" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="140px" OnSelectedIndexChanged="GridViewProductList_SelectedIndexChanged" Width="1026px">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>

                        </td>
                    </tr>
    </table>
    </div>
</asp:Content>
