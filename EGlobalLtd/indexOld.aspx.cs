using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using EGlobalLtd.BusinessLayer;


namespace EGlobalLtd
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //findData();
            if (!IsPostBack)
            {
                GetCategory();
                GetProducts(0);
            }
        }

        private string connString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["eGlobalDBConn"].ConnectionString;


        private void GetCategory()
        {
            ClassBusinessLayer k = new ClassBusinessLayer();
            DLCategory.DataSource = null;
            DLCategory.DataSource = k.GetAllProductType();
            DLCategory.DataBind();
        }

        private void GetProducts(int productTypeId)
        {
            ClassBusinessLayer k = new ClassBusinessLayer()
            {
                ProductTypeId = productTypeId
            };
            DLProducts.DataSource = null;
            DLProducts.DataSource = k.GetAllProductType();
            DLProducts.DataBind();

        }
        protected void findData()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Select * From ProductType Order By showOrderNo", conn);
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.Read())
                    {
                        // GridView1.DataSource = dr;
                        // GridView1.DataBind();
                    }
                }
            }

            //if (cmd.ExecuteNonQuery()==1)
            //{
            //    lblMessage.Text = "Need to show few Prodcut types over here";
            //}
            //else
            //{
            //    lblMessage.Text = "Requested to add/insert few Product categories into Database by Administrator";
            //}
            //conn.Close();
        }
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            string ProductId = Convert.ToInt32(((Button)sender).CommandArgument).ToString();

            if (Session["MyCart"] != null)
            {
                DataTable dt = (DataTable)Session["MyCart"];
                dt.Rows.Add(ProductId);
                Session["MyCart"] = dt;
                lBtnCart.Text = dt.Rows.Count.ToString();
            }
            else
            {
                DataTable dt = new DataTable();
                dt.Columns.Add(ProductId);
                Session["MyCart"] = dt;
                lBtnCart.Text = dt.Rows.Count.ToString();
            }

        }

        protected void lbtnCategory_Click(object sender, EventArgs e)
        {
            int typeID = Convert.ToInt32((((LinkButton)sender).CommandArgument).ToString());
            GetProducts(typeID);
        }

        protected void DLCategory_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}