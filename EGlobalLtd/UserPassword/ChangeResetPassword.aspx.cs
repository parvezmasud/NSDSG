using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration; 

namespace EGlobalLtd.UserPassword
{
    public partial class ChangeResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!IsPasswordResetLinkValid())
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Password reset link has expired or is invalid";
                }
            }
        }

        private bool ChangeUserPassword()
        {
            List<SqlParameter> paramList = new List<SqlParameter>()
            {
                new SqlParameter()
                {
                    ParameterName = "@GUID",
                    Value =Request.QueryString["uid"]
                },
                new SqlParameter()
                {
                    ParameterName = "@Password",
                    Value = EncryptPassword(txtNewPass.Text)
                }
            };
            return ExecuteSP("ChangePassword", paramList);
        }

        private string EncryptPassword(string textPass)
        {
            System.Security.Cryptography.SHA1 shah = System.Security.Cryptography.SHA1.Create();
            string hashed = System.Convert.ToBase64String(shah.ComputeHash(System.Text.UnicodeEncoding.Unicode.GetBytes(textPass)));
            return hashed.Length > 49 ? hashed.Substring(0, 48) : hashed;
        }
        private bool IsPasswordResetLinkValid()
        {
            List<SqlParameter> paramList = new List<SqlParameter>()
            {
                new SqlParameter()
                {
                    ParameterName = "@GUID",
                    Value =Request.QueryString["uid"]
                }
            };
            return ExecuteSP("IsPasswordResetLinkValid", paramList);
        }
            
        private bool ExecuteSP(string spName, List<SqlParameter> spParaMeters)
        {
            string cs = ConfigurationManager.ConnectionStrings["eGlobalDBConn"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(spName, conn);
                cmd.CommandType = CommandType.StoredProcedure;

                foreach(SqlParameter parameter in spParaMeters)
                {
                    cmd.Parameters.Add(parameter);
                }
                conn.Open();
                return Convert.ToBoolean(cmd.ExecuteScalar());
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (ChangeUserPassword())
            {
                lblMessage.Text = "Password changed successfully!";
            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Password reset link has expired or is invalid!";
            }
        }
    }
}