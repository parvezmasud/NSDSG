using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;

namespace EGlobalLtd
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private string connString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["eGlobalDBConn"].ConnectionString;
        private SqlConnection conn;
        private SqlCommand cmd;

        protected void fillBlank()
        {
            txtUserName.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtRetypePass.Text = string.Empty;
            txtFirstName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtEmail.Text = string.Empty;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (txtPassword.Text != txtRetypePass.Text)
            {
                txtRetypePass.Focus();
                lblMessage.Text = "Your retype password does not match with the password";
            }
            else
            { 
                try
                {
                    conn = new SqlConnection(connString);

                    cmd = new SqlCommand("Insert into Users (firstname, lastname, username, password, userType, userStatus, email) values (@firstname, @lastname, @username, @password, 'BuyerOrSeller', 1, @email )", conn);
                    cmd.Parameters.AddWithValue("@firstname", txtFirstName.Text);
                    cmd.Parameters.AddWithValue("@lastname", txtLastName.Text);
                    cmd.Parameters.AddWithValue("@username", txtUserName.Text);
                    cmd.Parameters.AddWithValue("@password", EncryptPassword(txtPassword.Text));
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                    conn.Open();

                    if (cmd.ExecuteNonQuery() == 1)
                    {
                        lblMessage.Text = "The user information registered successfully";
                        sendEmail();
                        fillBlank();
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = ex.Message + " " + "The user information failed to register";
                    txtUserName.Focus();
                }
                conn.Close();
            }
        }

        private string EncryptPassword(string textPass)
        {
            System.Security.Cryptography.SHA1 shah = System.Security.Cryptography.SHA1.Create();
            string hashed = System.Convert.ToBase64String(shah.ComputeHash(System.Text.UnicodeEncoding.Unicode.GetBytes(textPass)));
            return hashed.Length > 49 ? hashed.Substring(0, 48) : hashed;
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
                    gmail.Body = "Congratulations! " + txtLastName.Text + ". You are registered successfully!";
                else
                    gmail.Body = "Congratulations! " + txtUserName.Text + ". You are registered successfully!";
                gmailSmtpServer.Port = 587;
                gmailSmtpServer.Credentials = new System.Net.NetworkCredential(uname, pword);
                gmailSmtpServer.EnableSsl = true;

                gmailSmtpServer.Send(gmail);
                lblMessage.Text = lblMessage.Text+ "; Message send successfully to your email!!!";
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.ToString();
            }
        }
    }
}