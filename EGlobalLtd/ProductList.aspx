<%@ Page Title="" Language="C#" MasterPageFile="~/EGlobalAdmin.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="EGlobalLtd.ProductList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 444px;
        }
        .auto-style3 {
            text-align: right;
            width: 175px;
        }
        .auto-style4 {
            width: 175px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderAdmin" runat="server">
    <table style="width:100%;">
                    <tr>
                        <td colspan="4" class="auto-style1">
                
                <strong>
                <asp:Label ID="Label7" runat="server" BackColor="#1880A5" BorderStyle="None" Font-Size="Medium" Height="22px" Width="1000px" CssClass="auto-style43" ForeColor="White">Adding a Product</asp:Label>
                </strong></td>
                    </tr>
                    <tr>
                        <td class="auto-style4">&nbsp;</td>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style46">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                <asp:Label ID="lblProductCategory" runat="server" Text="Product Category :"></asp:Label>
                        </td>
                        <td class="auto-style2">
                <asp:DropDownList ID="ddLstProductCategory" runat="server" AutoPostBack="True" Height="20px" Width="400px" OnSelectedIndexChanged="ddLstProductCategory_SelectedIndexChanged">
                </asp:DropDownList>
                        </td>
                        <td class="auto-style48">
                <asp:Label ID="lblNewOrUsed" runat="server" Text="New/Used :"></asp:Label>
                        </td>
                        <td>
                <asp:DropDownList ID="ddLstNewOrUsed" runat="server" Width="160px" Height="20px" OnSelectedIndexChanged="ddLstNewOrUsed_SelectedIndexChanged">
                    <asp:ListItem Selected="True">Any</asp:ListItem>
                    <asp:ListItem>New</asp:ListItem>
                    <asp:ListItem>Used</asp:ListItem>
                </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                <asp:Label ID="lblProductSubCategory" runat="server" Text="Product Sub-Category :"></asp:Label>
                        </td>
                        <td class="auto-style2">
                <asp:DropDownList ID="ddLstProductSubCategory" runat="server" Height="20px" Width="400px">
                </asp:DropDownList>
                        </td>
                        <td class="auto-style48">
                <asp:Label ID="lblPrdId" runat="server" Visible="False"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                <asp:Label ID="lblProductName" runat="server" Text="Product Name :"></asp:Label>
                        </td>
                        <td class="auto-style2">
                <asp:TextBox ID="txtProductName" runat="server" CssClass="auto-style5" Width="400px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtProductName" ErrorMessage="RequiredField Product Name"></asp:RequiredFieldValidator>
                        </td>
                        <td class="auto-style46">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                <asp:Label ID="lblDescription" runat="server" Text="Description :"></asp:Label>
                        </td>
                        <td class="auto-style2">
                <asp:TextBox ID="txtDescription" runat="server" Width="400px" Height="76px" MaxLength="250" TextMode="MultiLine"></asp:TextBox>
                        </td>
                        <td colspan="2">
                            <asp:Image ID="ImagePrd" runat="server" Height="80px" Width="70px" />
                <asp:FileUpload ID="uploadProductPhoto" runat="server" EnableTheming="True" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                <asp:Label ID="lblQnty" runat="server" Text="Quantity :"></asp:Label>
                        </td>
                        <td class="auto-style2">
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
                        <td class="auto-style3">
                <asp:Label ID="lblPubDate" runat="server" Text="Publish Date :"></asp:Label>
                        </td>
                        <td class="auto-style2">
                <asp:TextBox ID="txtPubDate" runat="server" ReadOnly="true" CssClass="auto-style5" Width="400px"></asp:TextBox>
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
                        <td class="auto-style3">
                <asp:Label ID="lblIsPublish" runat="server" Text="Publish the product :"></asp:Label>
                        </td>
                        <td class="auto-style2">
                            <asp:CheckBox ID="chkBoxStatus" runat="server" />
                        </td>
                        <td class="auto-style46">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style4">&nbsp;</td>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style46">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style4">&nbsp;</td>
                        <td class="auto-style2">
                <asp:Button ID="btnSave" runat="server" Text="Save &amp; Publish" Width="160px" OnClick="btnSave_Click" />
                        </td>
                        <td class="auto-style46">
                <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update &amp; Publish" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
         </table>
       <div><br />    </div>
      <div class="auto-style1"><asp:Label ID="lblMessage" runat="server" BackColor="#1880A5" BorderStyle="None" Height="22px" Width="1000px" ForeColor="White"></asp:Label>    </div>
      
    <div><br />    </div>
    <div  class="auto-style1">

        <table>                  
                    <tr>
                        <td class="auto-style4">
                            <asp:Label ID="lblSearch" runat="server" Text="Enter item name to search"></asp:Label>
                        </td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtSearch" runat="server" Width="400px"></asp:TextBox>
                        </td>
                        <td class="auto-style46">
                            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" class="auto-style1">

                            <asp:GridView ID="GridViewProductList" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="140px" OnSelectedIndexChanged="GridViewProductList_SelectedIndexChanged" Width="994px">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
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
