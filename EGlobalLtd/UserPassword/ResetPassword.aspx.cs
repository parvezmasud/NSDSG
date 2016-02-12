using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;

namespace EGlobalLtd
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        private string connString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["eGlobalDBConn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("ResetPassword", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userNameOrEmail", txtUserName.Text);
                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while(rdr.Read())
                {
                    if (Convert.ToBoolean(rdr["ReturnCode"]))
                    {
                        SendEmail(rdr["Email"].ToString(), rdr["userName"].ToString(), rdr["UniqueId"].ToString());
                        lblComment.Text = "An email with instrudctions to reset your password is send to your registered email";
                    }
                    else
                    {
                        lblComment.Text = "User name or email does not found!";
                        lblComment.ForeColor = System.Drawing.Color.Red;
                    }
                }

            }
        }
        string uname = "eglobal0015";
        string pword = "eglobaleglobal";
        private void SendEmail(string ToEmail, string UserName, string UniqueId)
        {
            try
            {
                MailMessage gmail = new MailMessage();
                SmtpClient gmailSmtpServer = new SmtpClient("smtp.gmail.com");
                gmail.From = new MailAddress("eglobal0015@gmail.com");
                gmail.To.Add(ToEmail);
                gmail.Subject = "Password reset request";

                gmail.Body = "Dear! " + UserName + ", <br/><br/>";
                gmail.Body += "Please click the link below to reset your password<br/><br/>";
                gmail.Body += "http://localhost/EGlobalLtd/UserPassword/ChangeResetPassword.aspx?uid=" + UniqueId;
                gmail.Body += "<br/><br/><br/> Please avoid the email if you have not requested for such";


                gmailSmtpServer.Port = 587;
                gmailSmtpServer.Credentials = new System.Net.NetworkCredential(uname, pword);
                gmailSmtpServer.EnableSsl = true;

                gmailSmtpServer.Send(gmail);
                lblComment.Text = lblComment.Text + "; Message send successfully to your email!!!";
            }
            catch (Exception ex)
            {
                lblComment.Text = ex.ToString();
            }
        }
    }
}