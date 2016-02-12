using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace EGlobalLtd
{
    public partial class MyOrders : System.Web.UI.Page
    {
        private string connString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["eGlobalDBConn"].ConnectionString;
        private SqlDataReader rdr;
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadMyPO();
        }

        private void LoadMyPO()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                string sql;
                sql = "SELECT POId, Quantity, TotalPrice, PODate, DeliveryAddress, POStatus FROM POTable WHERE POBy = '" + Session["EGlobalLtdUserId"] + "'";
                SqlCommand cmd = new SqlCommand(sql, conn);

                System.Data.DataTable dtPO = new System.Data.DataTable();
                rdr = cmd.ExecuteReader();

                if (rdr.HasRows)
                {
                    dtPO.Load(rdr);
                    GridViewPOList.DataSource = dtPO;
                    GridViewPOList.DataBind();
                }
                else
                {
                    dtPO.Load(rdr);
                    GridViewPOList.DataSource = dtPO;
                    GridViewPOList.EmptyDataText = "No PO found";
                    GridViewPOList.DataBind();
                }
            }
        }

        private void LoadMyCart(int POId)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                string sql;
                //SqlCommand cmd = new SqlCommand("Select * From ShoppingCart Where InvoiceNo = '" + +"'", conn);

                sql = "SELECT        SC.shoppingCartId, SC.userId, SC.productId, Prd.productName, SC.productAddDate, SC.quantity, SC.unitPrice, (SC.quantity*SC.unitPrice) As Total FROM ShoppingCart AS SC INNER JOIN ProductInfo AS Prd ON SC.productId = Prd.productId WHERE (SC.userId = '" + Session["EGlobalLtdUserId"] + "') AND (SC.InvoiceNo = '" + POId + "') AND (SC.IsCanceled = 0)";
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

        protected void GridViewPOList_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (Convert.ToInt32(GridViewPOList.SelectedRow.Cells[1].Text)>0)
                {
                    lblMessage.Text = "The PO Detail Showing Successfully";
                    LoadMyCart(Convert.ToInt32(GridViewPOList.SelectedRow.Cells[1].Text));
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message + " The PO Detail Showing Un-successfully!";
            }
        }
    }
}