using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;


namespace EGlobalLtd
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private string connString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["eGlobalDBConn"].ConnectionString;

        private string EncryptPassword(string textPass)
        {
            System.Security.Cryptography.SHA1 shah = System.Security.Cryptography.SHA1.Create();
            string hashed = System.Convert.ToBase64String(shah.ComputeHash(System.Text.UnicodeEncoding.Unicode.GetBytes(textPass)));
            return hashed.Length > 49 ? hashed.Substring(0, 48) : hashed;
        }
        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            string LoginID = System.Web.Configuration.WebConfigurationManager.AppSettings["AdminLoginID"];
            string Password = System.Web.Configuration.WebConfigurationManager.AppSettings["AdminPassword"];
            if (txtUserName.Text == LoginID && txtPassword.Text == Password)
            {
                Session["EGlobalLtdUserAdmin"] = "WebAdmin";
                Session["EGlobalLtdUserType"] = "Admin";
                
            }
            else
            {
                SqlConnection conn = new SqlConnection(connString);
                conn.Open();
                SqlCommand cmd = new SqlCommand("Select * From Users Where password='" + EncryptPassword(txtPassword.Text) + "' and userStatus=@userStatus and (username='" + txtUserName.Text + "' or email='" + txtUserName.Text + "')", conn);
                cmd.Parameters.AddWithValue("@userStatus", true);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    try
                    {
                        if (dr.Read())
                        {
                            lblComment.Text = "The user login successfully, Now according to userType need to load HomeProfile";
                            //Session("userName") = dr["userName"].ToString();
                            //Session("userType") = dr["userType"].ToString();
                            Session["EGlobalLtdUserAdmin"] = txtUserName.Text;
                            Session["EGlobalLtdUserId"] = dr["userId"].ToString();
                            //Session["EGlobalLtdUserId"] = dr.GetInt32(0); or else fields dr.GetString(1) ....
                            if (dr["userType"].ToString() == "Admin")
                            {
                                Session["EGlobalLtdUserType"] = "Admin";
                                Response.Redirect(ResolveUrl("~/ProfileAdmin.aspx"));
                            }
                            else
                            {
                                Session["EGlobalLtdUserType"] = "BuyerOrSeller";
                                Response.Redirect(ResolveUrl("~/ProfileCustomer.aspx"));
                            }
                        }
                        else
                        {
                            lblComment.Text = "The user information is failed to Login";
                            txtUserName.Focus();
                        }
                    }
                    catch (Exception ex)
                    {
                        lblComment.Text = ex.Message + "; The user information is failed to login";
                        txtUserName.Focus();
                    }
                }
                conn.Close();
            }
        }
    }
}