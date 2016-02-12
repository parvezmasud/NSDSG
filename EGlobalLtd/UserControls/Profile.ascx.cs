using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace EGlobalLtd.UserControls
{
    public partial class Profile : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EGlobalLtdUserType"] == null)
            {
                Response.Redirect(ResolveUrl("~/LoginPage.aspx"));
            }
            else
            {
                FindProfileInfo();
            }
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
                            txtFirstName.Text = "";
                            txtLastName.Text = "";
                            txtFirstName.Visible = false;
                            txtLastName.Visible = false;
                            lblUserId.Text = dr["userId"].ToString();
                            txtUserName.Text = dr["userName"].ToString();
                            txtEmail.Text = dr["email"].ToString();
                            lblFName.Text = dr["firstName"].ToString();
                            lbllName.Text = dr["lastName"].ToString();
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = ex.Message + "; The Profile information failed to display";
                        lblMessage.Focus();
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message + "; The Profile information failed to display";
                txtFirstName.Focus();
            }
            conn.Close();
        }

        private string connString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["eGlobalDBConn"].ConnectionString;
        private SqlConnection conn;
        private SqlCommand cmd;

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                conn = new SqlConnection(connString);

                cmd = new SqlCommand("Update Users Set firstname=@firstname, lastname=@lastname Where userId=@userId", conn);
                cmd.Parameters.AddWithValue("@firstname", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@lastname", txtLastName.Text);
                cmd.Parameters.AddWithValue("@userId", lblUserId.Text);
                conn.Open();

                if (cmd.ExecuteNonQuery() == 1)
                    lblMessage.Text = "The user information updated successfully";
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message + " " + "The user information failed to updated";
                txtFirstName.Focus();
            }
            finally
            {
                conn.Close();
            }
        }

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            //txtFirstName.Text = lblFName.Text;
            //txtLastName.Text = lbllName.Text;

            txtFirstName.Visible = true;
            txtLastName.Visible = true;
        }
    }
}