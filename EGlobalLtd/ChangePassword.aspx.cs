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
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {            
                if ((Session["EGlobalLtdUserType"] == null) || (Session["EGlobalLtdUserType"].ToString() != "BuyerOrSeller"))
                {
                    Response.Redirect(ResolveUrl("~/LoginPage.aspx"));
                }
                else
                {
                    FindProfileInfo();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
            finally
            {
                Session.Remove("OldPass");
            }
        }
        private string EncryptPassword(string textPass)
        {
            System.Security.Cryptography.SHA1 shah = System.Security.Cryptography.SHA1.Create();
            string hashed = System.Convert.ToBase64String(shah.ComputeHash(System.Text.UnicodeEncoding.Unicode.GetBytes(textPass)));
            return hashed.Length > 49 ? hashed.Substring(0, 48) : hashed;
        }
        protected void FindProfileInfo()
        {
            try
            {
                conn = new SqlConnection(connString);
                cmd = new SqlCommand("Select * From Users Where userId='" + Session["EGlobalLtdUserId"] + "'", conn);
                conn.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    try
                    {
                        if (dr.Read())
                        {
                            lblUserId.Text = dr["userId"].ToString();
                            txtUserName.Text = dr["userName"].ToString();
                            txtEmail.Text = dr["email"].ToString();
                            Session["OldPass"] = dr["password"].ToString();
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = ex.Message + " " + "Did not find the information for the session user";
                        lblMessage.Focus();
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message + " " + "The user information failed to display";
            }
            conn.Close();
        }

        private string connString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["eGlobalDBConn"].ConnectionString;
        private SqlConnection conn;
        private SqlCommand cmd;

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (txtNewPass.Text != txtNewPassRetype.Text)
            {
                txtNewPassRetype.Focus();
                lblMessage.Text = "Your retype password does not match with the password";
            }
            else
            {
                try
                {
                    if (Session["OldPass"].ToString() == EncryptPassword(txtOldPass.Text))
                    {
                        conn = new SqlConnection(connString);

                        cmd = new SqlCommand("Update Users Set password=@password Where userId=@userId", conn);
                        cmd.Parameters.AddWithValue("@password", EncryptPassword(txtNewPass.Text));
                        cmd.Parameters.AddWithValue("@userId", lblUserId.Text);
                        conn.Open();

                        if (cmd.ExecuteNonQuery() == 1)
                            lblMessage.Text = "The user information updated successfully";
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = ex.Message + " " + "The user information failed to updated";
                }
                conn.Close();
            }
        }
    }
}