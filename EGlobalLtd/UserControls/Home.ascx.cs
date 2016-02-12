﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using EGlobalLtd.BusinessLayer;


namespace EGlobalLtd.UserControls
{
    public partial class Home : System.Web.UI.UserControl
    {
        private static string connString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["eGlobalDBConn"].ConnectionString;
        private SqlDataReader rdr;
        SqlConnection conn = new SqlConnection(connString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCategory();
                BindProducts();
                if (Session["EGlobalLtdUserId"] != null)
                {
                    ShowMyCartState();
                }
            }
        }
        protected void BindProducts()
        {
            DataTable dt = new DataTable();
            conn.Open();

            string sql;
            sql = "Select productId, productName, ProductDescription, unitPrice, newOrUsed, productImage";
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
            rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                dt.Load(rdr);
            }
            conn.Close();
            DataListProducts.DataSource = dt;
            DataListProducts.DataBind();
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

        private void AddProductToCart(int PrdId)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connString);
                SqlCommand cmd = new SqlCommand("AddToCart", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userId", Convert.ToInt32(Session["EGlobalLtdUserId"]));
                cmd.Parameters.AddWithValue("@productId", PrdId);

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

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            if (Session["EGlobalLtdUserId"] == null)
            {
                Response.Redirect(ResolveUrl("~/LoginPage.aspx"));
            }
            else
            {
                ListViewDataItem currentItem = (sender as Button).NamingContainer as ListViewDataItem;
                int PrdId = Convert.ToInt32(((Button)sender).CommandArgument);
                AddProductToCart(PrdId);
                ShowMyCartState();
            }
            //----*** Adding to the Shopping Cart Here
            //Session["MyCart"] = Convert.ToInt32(Session["MyCart"]) + 1;
        }
    }
}