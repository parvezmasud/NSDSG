using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace EGlobalLtd
{
    public partial class Email : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        string uname = "ntecemail";
        string pword = "DC306Level7";

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                MailMessage gmail = new MailMessage(); 
                SmtpClient gmailSmtpServer = new SmtpClient("smtp.gmail.com");
                gmail.From = new MailAddress("ntecemail@gmail.com");
                gmail.To.Add(txtTo.Text);
                gmail.Subject = "Hello from Masud";
                gmail.Body = txtMsgBody.Text;

                gmailSmtpServer.Port = 587;
                gmailSmtpServer.Credentials = new System.Net.NetworkCredential(uname, pword);
                gmailSmtpServer.EnableSsl = true;

                gmailSmtpServer.Send(gmail);
                lblMessage.Text = "Message send successfully";
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.ToString();
            }
        }
    }
}