using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Data.SqlClient;
//using EGlobalLtd.BusinessLayer;
//using System.Data;

namespace EGlobalLtd
{
    public partial class Index2 : System.Web.UI.Page
    {
        //private string connString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["eGlobalDBConn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    BindCategory();
            //    BindProducts();
            //    //ddLstProductSubCategory.Items.Insert(0, new ListItem("Please Select a Category to select a Sub-Category", "0"));
            //}
        }
        //private SqlDataReader rdr;
        //protected void BindProducts()
        //{
        //    using (SqlConnection conn = new SqlConnection(connString))
        //    {
        //        conn.Open();
        //        string sql;
        //        sql = "Select productId as [Item ID], productName as [Name], ProductDescription as [Description], unitPrice as [Unti Price], newOrUsed";
        //        sql += " From ProductInfo ";

        //        if (ddLstProductCategory.SelectedItem.Text != "Select a Product Category")
        //        {
        //            sql += " Where ProductTypeId ='" + ddLstProductCategory.SelectedValue + "' ";
        //            if (ddLstNewOrUsed.SelectedItem.Text != "Any")
        //            {
        //                sql += " And newOrUsed='" + ddLstNewOrUsed.SelectedItem.Text + "'";
        //            }
        //        }
        //        else
        //        {
        //            if (ddLstNewOrUsed.SelectedItem.Text != "Any")
        //            {
        //                sql += " Where newOrUsed='" + ddLstNewOrUsed.SelectedItem.Text + "'";
        //            }
        //        }

        //        SqlCommand cmd = new SqlCommand(sql, conn);
        //        System.Data.DataTable dtProduct = new System.Data.DataTable();
        //        rdr = cmd.ExecuteReader();

        //        if (rdr.HasRows)
        //        {
        //            dtProduct.Load(rdr);
        //            GridViewProductList.DataSource = dtProduct;
        //            GridViewProductList.DataBind();
                    
        //        }
        //        else
        //        {
        //            dtProduct.Load(rdr);
        //            GridViewProductList.DataSource = dtProduct;
        //            GridViewProductList.EmptyDataText = "No products found";
        //            GridViewProductList.DataBind();
        //        }

        //        //GridViewProductList.Columns[3].Visible = false;
        //    }
        //}
        //protected void BindCategory()
        //{
        //    ClassBusinessLayer k = new ClassBusinessLayer();
        //    DataTable dt = k.GetAllProductType();
        //    if (dt.Rows.Count > 0)
        //    {
        //        ddLstProductCategory.DataValueField = "productTypeId";
        //        ddLstProductCategory.DataTextField = "ProductTypeName";
        //        ddLstProductCategory.DataSource = dt;
        //        ddLstProductCategory.DataBind();
        //        ddLstProductCategory.Items.Insert(0, new ListItem("Select a Product Category", "0"));
        //    }
        //}
        //protected void GridViewProductList_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (Session["EGlobalLtdUserId"] == null)
        //    {
        //        Response.Redirect(ResolveUrl("~/LoginPage.aspx"));
        //    }





        //    //int rowIndex = GridViewProductList.SelectedIndex;
        //    //lblPrdId.Text = GridViewProductList.SelectedRow.Cells[1].Text;
        //    ////txtProductName.Text = GridViewProductList.SelectedRow.Cells[2].Text;
        //    ////txtDescription.Text = GridViewProductList.SelectedRow.Cells[3].Text;

        //    //ddLstProductCategory.SelectedValue = GridViewProductList.SelectedRow.Cells[5].Text;
        //    ////txtUPrice.Text = GridViewProductList.SelectedRow.Cells[7].Text;
        //    //txtQnty.Text = GridViewProductList.SelectedRow.Cells[8].Text;
        //}

        //protected void ddLstProductCategory_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    BindProducts();
        //}

        //protected void ddLstNewOrUsed_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    BindProducts();
        //}



    }
}