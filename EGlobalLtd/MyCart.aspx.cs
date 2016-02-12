using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace EGlobalLtd
{
    public partial class MyCart : System.Web.UI.Page
    {
        private string connString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["eGlobalDBConn"].ConnectionString;
        private SqlDataReader rdr;
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadMyCart();
        }

        private void LoadMyCart()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                string sql;
                sql = "SELECT        SC.shoppingCartId, SC.userId, SC.productId, Prd.productName,  SC.isCanceled, SC.productAddDate, SC.quantity, SC.unitPrice, (SC.quantity*SC.unitPrice) As Total FROM ShoppingCart AS SC INNER JOIN ProductInfo AS Prd ON SC.productId = Prd.productId WHERE(SC.userId = '" + Session["EGlobalLtdUserId"] + "') AND (SC.isInvoiced = 0) AND (SC.isCanceled = 0)";
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
            }
        }

        protected void GridViewProductList_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(connString);
                SqlCommand cmd = new SqlCommand("Update shoppingCart Set isCanceled = 1 Where shoppingCartId=@shoppingCartId", conn);
                cmd.Parameters.AddWithValue("@shoppingCartId", Convert.ToInt32(GridViewProductList.SelectedRow.Cells[1].Text));
                conn.Open();
                if (cmd.ExecuteNonQuery() == 1)
                {
                    lblMessage.Text = "The product cancelled from My Cart successfully";
                    LoadMyCart();
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message + " The product failed to cancelled from Your Cart!";
            }
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            if (GridViewProductList.Rows.Count>0)
            {
                try
                {
                    SqlConnection conn = new SqlConnection(connString);
                    SqlCommand cmd = new SqlCommand("POCreation", conn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@POBy", Convert.ToInt32(Session["EGlobalLtdUserId"]));
                    conn.Open();
                    if (cmd.ExecuteNonQuery() == 1)
                    {
                        lblMessage.Text = "Creating the PO is prepared successfully";
                        LoadMyCart();
                    }
                    conn.Close();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = ex.Message + " The products failed to Add in PO from Your Cart!";
                }
                Response.Redirect(ResolveUrl("~/MyOrders.aspx"));
            }
            else
            {
                lblMessage.Text = "You don't have any items in your Cart to Checkout";
            }
        }
    }
}