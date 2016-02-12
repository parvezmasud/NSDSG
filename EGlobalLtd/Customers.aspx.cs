using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;
using System.Net.Mail;

namespace EGlobalLtd
{
    public partial class Customers : System.Web.UI.Page
    {
        private string connString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["eGlobalDBConn"].ConnectionString;
        private SqlConnection conn;
        private SqlCommand cmd;
        private SqlDataReader rdr;

        protected void Page_Load(object sender, EventArgs e)
        {
            //loadCustomerType();
            ShowCustomers();
        }

        private void loadCustomerType()
        {
            DDListUserType.Items.Clear();
            DDListUserType.Items.Add("Select User Type");
            DDListUserType.Items.Add("Admin");
            DDListUserType.Items.Add("BuyerOrSeller");
           // DDListUserType.SelectedItem.Text = "BuyerOrSeller";
        }

        string uname = "eglobal0015";
        string pword = "eglobaleglobal";
        private void sendEmail()
        {
            try
            {
                MailMessage gmail = new MailMessage();
                SmtpClient gmailSmtpServer = new SmtpClient("smtp.gmail.com");
                gmail.From = new MailAddress("eglobal0015@gmail.com");
                gmail.To.Add(txtEmail.Text);
                gmail.Subject = "Student registartion status";
                if (txtLastName.Text != string.Empty)
                    gmail.Body = "Congratulations! " + txtLastName.Text + ". Your user registration was successfully! <br/> Your Temporary password is: " + EncryptPassword("123");
                else
                    gmail.Body = "Congratulations! " + txtUserName.Text + ". Your user registration was successfully! <br/> Your Temporary password is: " + EncryptPassword("123");
                gmailSmtpServer.Port = 587;
                gmailSmtpServer.Credentials = new System.Net.NetworkCredential(uname, pword);
                gmailSmtpServer.EnableSsl = true;

                gmailSmtpServer.Send(gmail);
                lblMessage.Text = lblMessage.Text + "; Message send successfully to your email!!!";
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.ToString();
            }
        }

        private void ShowCustomers()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Select userId, FirstName, LastName, UserName, Email, UserType, UserStatus, Mobile From Users", conn);

                System.Data.DataTable dtItems = new System.Data.DataTable();
                rdr = cmd.ExecuteReader();

                if (rdr.HasRows)
                {
                    dtItems.Load(rdr);
                    GridViewCustomers.DataSource = dtItems;
                    GridViewCustomers.DataBind();
                }
                else
                {
                    dtItems.Load(rdr);
                    GridViewCustomers.DataSource = dtItems;
                    GridViewCustomers.EmptyDataText = "No cusomers in the database";
                    GridViewCustomers.DataBind();
                }
            }
        }

        protected void fillBlank()
        {
            txtFirstName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtUserName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtMobileNo.Text = string.Empty;
        }

        private string EncryptPassword(string textPass)
        {
            System.Security.Cryptography.SHA1 shah = System.Security.Cryptography.SHA1.Create();
            string hashed = System.Convert.ToBase64String(shah.ComputeHash(System.Text.UnicodeEncoding.Unicode.GetBytes(textPass)));
            return hashed.Length > 49 ? hashed.Substring(0, 48) : hashed;
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                conn = new SqlConnection(connString);

                cmd = new SqlCommand("Insert into Users (firstname, lastname, username, userType, userStatus, email, mobile) values (@firstname, @lastname, @username, @userType, @userStatus, @email, @mobile)", conn);
                cmd.Parameters.AddWithValue("@firstname", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@lastname", txtLastName.Text);
                cmd.Parameters.AddWithValue("@username", txtUserName.Text);
                cmd.Parameters.AddWithValue("@userType", DDListUserType.SelectedItem.Text);
                if (chkBoxStatus.Checked)
                    cmd.Parameters.AddWithValue("@userStatus", true);
                else
                    cmd.Parameters.AddWithValue("@userStatus", false);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@mobile", txtMobileNo.Text);
                conn.Open();

                if (cmd.ExecuteNonQuery() == 1)
                {
                    lblMessage.Text = "The user information registered successfully";
                    ShowCustomers();
                    sendEmail();
                    fillBlank();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message + " " + "The user information failed to register";
                txtUserName.Focus();
            }
            finally
            {
                conn.Close();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                conn = new SqlConnection(connString);

                cmd = new SqlCommand("Update Users Set firstname=@firstname, lastname=@lastname, username=@username, userType=@userType, userStatus=@userStatus, email=@email, mobile=@mobile Where userId='" + lblCustomerId.Text + "'", conn);
                cmd.Parameters.AddWithValue("@firstname", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@lastname", txtLastName.Text);
                cmd.Parameters.AddWithValue("@username", txtUserName.Text);
                cmd.Parameters.AddWithValue("@userType", DDListUserType.SelectedItem.Text);
                if (chkBoxStatus.Checked)
                    cmd.Parameters.AddWithValue("@userStatus", true);
                else
                    cmd.Parameters.AddWithValue("@userStatus", false);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@mobile", txtMobileNo.Text);
                conn.Open();

                if (cmd.ExecuteNonQuery() == 1)
                {
                    lblMessage.Text = "The user information Updated successfully";
                    ShowCustomers();
                    fillBlank();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message + " " + "The user information failed to Update";
                txtUserName.Focus();
            }
            finally
            {
                conn.Close();
            }
        }

        protected void GridViewCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            int rowIndex = GridViewCustomers.SelectedIndex;
            lblCustomerId.Text = GridViewCustomers.SelectedRow.Cells[1].Text;
            txtFirstName.Text = GridViewCustomers.SelectedRow.Cells[2].Text;
            txtLastName.Text = GridViewCustomers.SelectedRow.Cells[3].Text;
            txtUserName.Text = GridViewCustomers.SelectedRow.Cells[4].Text;
            txtEmail.Text = GridViewCustomers.SelectedRow.Cells[5].Text;
            DDListUserType.Items.Add (GridViewCustomers.SelectedRow.Cells[6].Text);
            DDListUserType.SelectedItem.Text = GridViewCustomers.SelectedRow.Cells[6].Text;
            CheckBox statChk = (CheckBox)GridViewCustomers.SelectedRow.Cells[7].Controls[0];
            if (statChk.Checked == true)
                chkBoxStatus.Checked = true;
            else
                chkBoxStatus.Checked = false;
            txtMobileNo.Text = GridViewCustomers.SelectedRow.Cells[8].Text;
        }
    }
}