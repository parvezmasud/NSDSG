using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using EGlobalLtd.BusinessLayer;
using System.Data;

namespace EGlobalLtd.UserControls
{
    public partial class IndexHome : System.Web.UI.UserControl
    {
        private string connString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["eGlobalDBConn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCategory();
                BindProducts();
                //ddLstProductSubCategory.Items.Insert(0, new ListItem("Please Select a Category to select a Sub-Category", "0"));
                if (Session["EGlobalLtdUserId"] != null)
                {
                    ShowMyCartState();
                }                
            }
        }
        private SqlDataReader rdr;
        protected void BindProducts()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                string sql;
                sql = "Select productId as [Item ID], productName as [Name], ProductDescription as [Description], unitPrice as [Unti Price], newOrUsed";
                sql += " From ProductInfo ";

                if (ddLstProductCategory.SelectedItem.Text != "Select a Product Category")
                {
                    sql += " Where ProductTypeId ='" + ddLstProductCategory.SelectedValue + "' ";
                    if (ddLstNewOrUsed.SelectedItem.Text != "Any")
                    {
                        sql += " And newOrUsed='" + ddLstNewOrUsed.SelectedItem.Text + "'";
                    }
                }
                else
                {
                    if (ddLstNewOrUsed.SelectedItem.Text != "Any")
                    {
                        sql += " Where newOrUsed='" + ddLstNewOrUsed.SelectedItem.Text + "'";
                    }
                }

                SqlCommand cmd = new SqlCommand(sql, conn);
                System.Data.DataTable dtProduct = new System.Data.DataTable();
                rdr = cmd.ExecuteReader();

                if (rdr.HasRows)
                {
                    dtProduct.Load(rdr);
                    GridViewProductList.DataSource = dtProduct;
                    GridViewProductList.DataBind();

                }
                else
                {
                    dtProduct.Load(rdr);
                    GridViewProductList.DataSource = dtProduct;
                    GridViewProductList.EmptyDataText = "No products found";
                    GridViewProductList.DataBind();
                }

                //GridViewProductList.Columns[3].Visible = false;
            }
        }
        protected void BindCategory()
        {
            ClassBusinessLayer k = new ClassBusinessLayer();
            DataTable dt = k.GetAllProductType();
            if (dt.Rows.Count > 0)
            {
                ddLstProductCategory.DataValueField = "productTypeId";
                ddLstProductCategory.DataTextField = "ProductTypeName";
                ddLstProductCategory.DataSource = dt;
                ddLstProductCategory.DataBind();
                ddLstProductCategory.Items.Insert(0, new ListItem("Select a Product Category", "0"));
            }
        }
        protected void GridViewProductList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Session["EGlobalLtdUserId"] == null)
            {
                Response.Redirect(ResolveUrl("~/LoginPage.aspx"));
            }
            else
            {
                AddProductToCart();
                ShowMyCartState();
            }
            //----*** Adding to the Shopping Cart Here
            //Session["MyCart"] = Convert.ToInt32(Session["MyCart"]) + 1;
        }

        private void AddProductToCart()
        {
            try
            {
                SqlConnection conn = new SqlConnection(connString);
                SqlCommand cmd = new SqlCommand("Insert into shoppingCart (productId, userId, quantity, unitPrice) values (@productId, @userId, @quantity, @unitPrice)", conn);
                cmd.Parameters.AddWithValue("@productId", Convert.ToInt32(GridViewProductList.SelectedRow.Cells[1].Text));
                cmd.Parameters.AddWithValue("@userId", Convert.ToInt32(Session["EGlobalLtdUserId"]));
                cmd.Parameters.AddWithValue("@quantity", 1);
                cmd.Parameters.AddWithValue("@unitPrice", Convert.ToInt32(GridViewProductList.SelectedRow.Cells[4].Text));
                conn.Open();
                if (cmd.ExecuteNonQuery() == 1)
                {
                    lblMessage.Text = "The product added to Cart successfully";
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message + " The product failed to Add Your Cart!";
            }
        }

        private void ShowMyCartState()
        {            
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                string sql;
                sql = "Select count(productid) as Qnt From shoppingCart Where userId= '" + Session["EGlobalLtdUserId"] + "'";
                sql += " And isCanceled=@isCanceled And isInvoiced=@isInvoiced";

                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@isCanceled", false);
                cmd.Parameters.AddWithValue("@isInvoiced", false);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    try
                    {
                        if (dr.Read())
                        {
                            if (Convert.ToInt32(dr["Qnt"].ToString()) > 0)
                            {
                                lblMessage.ForeColor = System.Drawing.Color.Red;
                                lblMessage.Font.Bold = true;
                                lblMessage.Text = "You have " + dr["Qnt"].ToString() + " items in Your Cart to Checkout. Visit My Cart to checkout";
                            }
                        }
                        else
                        {
                            lblMessage.ForeColor = System.Drawing.Color.White;
                            lblMessage.Font.Bold = false;
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = ex.Message + " ";
                    }
                }
            }
        }

        protected void ddLstProductCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindProducts();
        }

        protected void ddLstNewOrUsed_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindProducts();
        }
    }
}