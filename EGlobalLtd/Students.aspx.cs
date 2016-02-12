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
    public partial class Students : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private string connString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["NTecEmpConnStr"].ConnectionString;
        private SqlConnection conn;
        private SqlCommand cmd;

        protected void fillBlank()
        {
            txtStdName.Text = string.Empty;
            txtAdd.Text = string.Empty;
            txtContact.Text = string.Empty;
            txtDob.Text = string.Empty;
            txtEmail.Text = string.Empty;
            //chkStatus.Checked = 0;
        }

        string uname = "ntecemail";
        string pword = "DC306Level7";
        private void sendEmail()
        {
            try
            {
                MailMessage gmail = new MailMessage();
                SmtpClient gmailSmtpServer = new SmtpClient("smtp.gmail.com");
                gmail.From = new MailAddress("ntecemail@gmail.com");
                gmail.To.Add(txtEmail.Text);
                gmail.Subject = "Student registartion status";
                gmail.Body = "Hello, " + txtStdName.Text + ". You are registered successfully!";

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
            finally
            {

            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtEmail.Text == string.Empty)
            {
                txtEmail.Focus();
                lblMessage.Text = "Your email is necessary to register";
            }
            else
            {
                try
                {
                    conn = new SqlConnection(connString);

                    cmd = new SqlCommand("Insert into Students (stdName, Address, Contact, DOB, Email, Status) values (@stdName, @Address, @Contact, @DOB, @Email, @Status)", conn);
                    cmd.Parameters.AddWithValue("@stdName", txtStdName.Text);
                    cmd.Parameters.AddWithValue("@Address", txtAdd.Text);
                    cmd.Parameters.AddWithValue("@Contact", txtContact.Text);
                    cmd.Parameters.AddWithValue("@DOB", txtDob.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    if (chkStatus.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@Status", true);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@Status", false);
                    }
                    conn.Open();

                    if (cmd.ExecuteNonQuery() == 1)
                    {
                        lblMessage.Text = "The student information registered successfully";
                        sendEmail();
                        fillBlank();
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = ex.Message + " " + "The student information failed to register";
                    txtStdName.Focus();
                }
                conn.Close();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                conn = new SqlConnection(connString);

                cmd = new SqlCommand("Insert into Students (stdName, Address, Contact, DOB, Email, Status) values (@stdName, @Address, @Contact, @DOB, @Email, @Status)", conn);
                cmd.Parameters.AddWithValue("@stdName", txtStdName.Text);
                cmd.Parameters.AddWithValue("@Address", txtAdd.Text);
                cmd.Parameters.AddWithValue("@Contact", txtContact.Text);
                cmd.Parameters.AddWithValue("@DOB", txtDob.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                if (chkStatus.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Status", true);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Status", false);
                }
                conn.Open();

                if (cmd.ExecuteNonQuery() == 1)
                {
                    lblMessage.Text = "The student information registered successfully";
                    sendEmail();
                    fillBlank();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message + " " + "The student information failed to register";
                txtStdName.Focus();
            }
            conn.Close();
        }

        protected void GridViewEmpList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}