using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using EGlobalLtd.BusinessLayer;
using System.Data;

namespace EGlobalLtd
{
    public partial class Products : System.Web.UI.Page
    {
        private string connString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["eGlobalDBConn"].ConnectionString;
        private SqlConnection conn;
        private SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCategory();
                BindSubCategory();
                //ddLstProductSubCategory.Items.Insert(0, new ListItem("Please Select a Category to select a Sub-Category", "0"));
                BindProducts();
            }            
        }

        //protected void BindCategory()
        //{
        //    using (SqlConnection conn = new SqlConnection(connString))
        //    {
        //        conn.Open();
        //        SqlCommand cmd = new SqlCommand("Select * From ProductType", conn);
        //        using (SqlDataReader dr = cmd.ExecuteReader())
        //        {
        //            try
        //            {
        //                if (dr.Read())
        //                {
        //                    ddLstProductCategory.DataSource = null;
        //                    ddLstProductCategory.DataSource = dr;
        //                    ddLstProductCategory.Items.Add ("Select a Category");
        //                    ddLstProductCategory.DataTextField = "ProductTypeName";
        //                    ddLstProductCategory.DataValueField = "productTypeId";
        //                    ddLstProductCategory.DataBind();

        //                }
        //            }
        //            catch (Exception ex)
        //            {
        //                lblMessage.Text = ex.Message + " " + "The Product Category is not introduced to Database by Admin";
        //                lblMessage.Focus();
        //            }
        //        }
        //    }
        //}

        protected void BindCategory()
        {
            ClassBusinessLayer k = new ClassBusinessLayer();
            DataTable dt = k.GetAllProductType();
            if (dt.Rows.Count>0)
            {
                ddLstProductCategory.DataValueField = "productTypeId";
                ddLstProductCategory.DataTextField = "ProductTypeName";
                ddLstProductCategory.DataSource = dt;
                ddLstProductCategory.DataBind();
            }            
        }

        protected void BindSubCategory()
        {
            //ClassBusinessLayer k = new ClassBusinessLayer()
            //{
            //    ProductTypeId = Convert.ToInt32(ddLstProductCategory.SelectedValue)
            //};


            //DataTable dt = k.GetAllProductSubType();
            //if (dt.Rows.Count > 0)
            //{
            //    ddLstProductSubCategory.DataValueField = "productSubTypeId";
            //    ddLstProductSubCategory.DataTextField = "productSubTypeName";
            //    ddLstProductSubCategory.DataSource = dt;
            //    ddLstProductSubCategory.DataBind();
            //}
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                string sql;
                sql = "Select * From ProductSubType";
                //if (Convert.ToInt32(ddLstProductCategory.SelectedValue)>0)
                //    sql += " Where ProductTypeId='" + Convert.ToInt32(ddLstProductCategory.SelectedValue) + "'";

                SqlCommand cmd = new SqlCommand(sql, conn);
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    try
                    {
                        if (dr.Read())
                        {
                            ddLstProductSubCategory.DataSource = null;
                            ddLstProductSubCategory.DataSource = dr;
                            ddLstProductSubCategory.DataTextField = "productSubTypeName";
                            ddLstProductSubCategory.DataValueField = "productSubTypeId";
                            ddLstProductSubCategory.DataBind();
                            ddLstProductSubCategory.Items.Insert(0, new ListItem("Select a Sub-Category", "0"));
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = ex.Message + " " + "The Product Sub-Category is not introduced to Database by Admin";
                    }
                }
            }
        }
        protected void ddLstProductCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindSubCategory();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (ddLstProductCategory.Text == "Select a Category")
            {
                ddLstProductCategory.Focus();
                lblMessage.Text = "Select a Category before you save a Product";
            }
            else if (ddLstProductSubCategory.SelectedItem.Text == "Select a Sub-Category" || ddLstProductSubCategory.SelectedItem.Text == "Please Select a Category to select a Sub-Category")
            {
                ddLstProductSubCategory.Focus();
                lblMessage.Text = "Select a Sub-Category before you save a Product";
            }
            else
            {
                try
                {
                    if (uploadProductPhoto.PostedFile != null)
                    {
                        SaveProductPhoto();
                    }

                    conn = new SqlConnection(connString);

                    cmd = new SqlCommand("Insert into ProductInfo (productName, productDescription, productTypeId, unitPrice, productQuantity, enlistToSell, productBy, newOrUsed, productSubTypeId, productImage) values (@productName, @productDescription, @productTypeId, @unitPrice, @productQuantity, @enlistToSell, @productBy, @newOrUsed, @productSubTypeId, @productImage)", conn); //@startDate, @endDate, startDate, endDate, 
                    cmd.Parameters.AddWithValue("@productName", txtProductName.Text);
                    cmd.Parameters.AddWithValue("@productDescription", txtDescription.Text);
                    cmd.Parameters.AddWithValue("@productTypeId", ddLstProductCategory.SelectedValue);
                    cmd.Parameters.AddWithValue("@unitPrice", txtUPrice.Text);
                    cmd.Parameters.AddWithValue("@productQuantity", txtQnty.Text);
                    //cmd.Parameters.AddWithValue("@startDate", txtPubDate.Text);
                    //cmd.Parameters.AddWithValue("@endDate", txtPubDate.Text);
                    if (chkBoxStatus.Checked)
                        cmd.Parameters.AddWithValue("@enlistToSell", true);
                    else
                        cmd.Parameters.AddWithValue("@enlistToSell", false);
                    cmd.Parameters.AddWithValue("@productBy", Convert.ToInt32(Session["EGlobalLtdUserId"]));
                    cmd.Parameters.AddWithValue("@newOrUsed", ddLstNewOrUsed.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@productSubTypeId", ddLstProductSubCategory.SelectedValue);
                    cmd.Parameters.AddWithValue("@productImage", "~/ProductImages/" + uploadProductPhoto.FileName);

                    conn.Open();
                    if (cmd.ExecuteNonQuery() == 1)
                    {
                        lblMessage.Text = "The product information saved successfully";
                        fillBlank();
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = ex.Message + " " + "The product information failed to saved";
                    txtProductName.Focus();
                }
                conn.Close();
            }
        }
        protected void fillBlank()
        {
            txtProductName.Text = string.Empty;
            txtDescription.Text = string.Empty;
            txtQnty.Text = string.Empty;
            txtPubDate.Text = string.Empty;
            txtUPrice.Text = string.Empty;
            lblPrdId.Text = string.Empty;
        }

        private void SaveProductPhoto()
        {
            if (uploadProductPhoto.PostedFile != null)
            {
                string fileName = uploadProductPhoto.PostedFile.FileName.ToString();
                string fileExt = System.IO.Path.GetExtension(uploadProductPhoto.FileName);

                if (fileName.Length > 96)
                {
                    lblMessage.Text = "Image length should not exceed 96 characters";
                }
                else if (fileExt != ".jpg" && fileExt != ".jpeg" && fileExt != ".png" && fileExt != ".gif" && fileExt != ".bmp")
                {
                    lblMessage.Text = "Image file category un accepted";
                }
                else if (uploadProductPhoto.PostedFile.ContentLength > 2000000) //not more than 2MB file size
                {
                    lblMessage.Text = "Image file size can not exceed 2MB";
                }
                else
                {
                    uploadProductPhoto.SaveAs(Server.MapPath("~/ProductImages/" + fileName));
                }
            }
        }

        private SqlDataReader rdr;
        protected void BindProducts()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Select * From ProductInfo Where productBy='" + Convert.ToInt32(Session["EGlobalLtdUserId"]) + "'", conn);           

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
                    GridViewProductList.EmptyDataText = "No products added";
                    GridViewProductList.DataBind();
                }
            }
        }

        protected void GridViewProductList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int rowIndex = GridViewProductList.SelectedIndex;
            lblPrdId.Text= GridViewProductList.SelectedRow.Cells[2].Text;
            txtProductName.Text = GridViewProductList.SelectedRow.Cells[3].Text;
            txtDescription.Text = GridViewProductList.SelectedRow.Cells[4].Text;

            ddLstProductCategory.SelectedValue = GridViewProductList.SelectedRow.Cells[5].Text;
            txtUPrice.Text = GridViewProductList.SelectedRow.Cells[7].Text;
            txtQnty.Text = GridViewProductList.SelectedRow.Cells[8].Text;
            CheckBox statChk = (CheckBox)GridViewProductList.SelectedRow.Cells[11].Controls[0];
            if (statChk.Checked == true)
                chkBoxStatus.Checked = true;
            else
                chkBoxStatus.Checked = false;
            ddLstNewOrUsed.SelectedItem.Text = GridViewProductList.SelectedRow.Cells[14].Text;
            ddLstProductSubCategory.SelectedValue = GridViewProductList.SelectedRow.Cells[15].Text;
            ImagePrd.ImageUrl = GridViewProductList.SelectedRow.Cells[16].Text;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (ddLstProductCategory.Text == "Select a Category")
            {
                ddLstProductCategory.Focus();
                lblMessage.Text = "Select a Category before you save a Product";
            }
            else if (ddLstProductSubCategory.SelectedItem.Text == "Select a Sub-Category" || ddLstProductSubCategory.SelectedItem.Text == "Please Select a Category to select a Sub-Category")
            {
                ddLstProductSubCategory.Focus();
                lblMessage.Text = "Select a Sub-Category before you save a Product";
            }
            else
            {
                try
                {
                    if (uploadProductPhoto.PostedFile != null)
                    {
                        SaveProductPhoto();
                    }

                    conn = new SqlConnection(connString);

                    cmd = new SqlCommand("Update ProductInfo Set productName=@productName, productDescription=@productDescription, productTypeId=@productTypeId, unitPrice=@unitPrice, productQuantity=@productQuantity, enlistToSell=@enlistToSell, productBy=@productBy, newOrUsed=@newOrUsed, productSubTypeId=@productSubTypeId, productImage=@productImage Where productId=@productId", conn); //@startDate, @endDate, startDate, endDate, 
                    cmd.Parameters.AddWithValue("@productId", Convert.ToInt32(lblPrdId.Text));
                    cmd.Parameters.AddWithValue("@productName", txtProductName.Text);
                    cmd.Parameters.AddWithValue("@productDescription", txtDescription.Text);
                    cmd.Parameters.AddWithValue("@productTypeId", ddLstProductCategory.SelectedValue);
                    cmd.Parameters.AddWithValue("@unitPrice", txtUPrice.Text);
                    cmd.Parameters.AddWithValue("@productQuantity", txtQnty.Text);
                    //cmd.Parameters.AddWithValue("@startDate", txtPubDate.Text);
                    //cmd.Parameters.AddWithValue("@endDate", txtPubDate.Text);
                    if (chkBoxStatus.Checked)
                        cmd.Parameters.AddWithValue("@enlistToSell", true);
                    else
                        cmd.Parameters.AddWithValue("@enlistToSell", false);
                    cmd.Parameters.AddWithValue("@productBy", Convert.ToInt32(Session["EGlobalLtdUserId"]));
                    cmd.Parameters.AddWithValue("@newOrUsed", ddLstNewOrUsed.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@productSubTypeId", ddLstProductSubCategory.SelectedValue);
                    cmd.Parameters.AddWithValue("@productImage", "~/ProductImages/" + uploadProductPhoto.FileName);

                    conn.Open();
                    if (cmd.ExecuteNonQuery() == 1)
                    {
                        lblMessage.Text = "The product information saved successfully";
                        fillBlank();
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = ex.Message + " " + "The product information failed to saved";
                    txtProductName.Focus();
                }
                conn.Close();
            }
        }
    }
}