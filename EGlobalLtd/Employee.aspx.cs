using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace EGlobalLtd
{
    public partial class Employee : System.Web.UI.Page
    {

        private string connString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["NTecEmpConnStr"].ConnectionString;
        private SqlConnection conn;
        private SqlCommand cmd;


        protected void Page_Load(object sender, EventArgs e)
        {
            BindEmployees();
        }

        protected void fillBlank()
        {
            txtEmpName.Text = "";
            txtDept.Text = "";
            txtEmail.Text = "";
            txtMobileNo.Text = "";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            conn = new SqlConnection(connString);

            cmd = new SqlCommand("Insert into Employees (EmployeeName, department, email, MobileNo) values (@EmployeeName, @department, @email, @MobileNo)", conn); //@startDate, @endDate, startDate, endDate, 
            cmd.Parameters.AddWithValue("@EmployeeName", txtEmpName.Text);
            cmd.Parameters.AddWithValue("@department", txtDept.Text);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@MobileNo", txtMobileNo.Text);

            conn.Open();
            if (cmd.ExecuteNonQuery() == 1)
            {
                lblMessage.Text = "Message status:" + "The Employee information saved successfully";
                fillBlank();
                BindEmployees();
            }
            conn.Close();
        }

        private SqlDataReader rdr;


        protected void BindEmployees()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Select * From Employees", conn);

                System.Data.DataTable dtEmployee = new System.Data.DataTable();
                rdr = cmd.ExecuteReader();

                if (rdr.HasRows)
                {
                    dtEmployee.Load(rdr);
                    GridViewEmpList.DataSource = dtEmployee;
                    GridViewEmpList.DataBind();
                }
                else
                {
                    dtEmployee.Load(rdr);
                    GridViewEmpList.DataSource = dtEmployee;
                    GridViewEmpList.EmptyDataText = "Message status:" + "No employee added in the database";
                    GridViewEmpList.DataBind();
                }
            }
        }

        protected void GridViewEmpList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int rowIndex = GridViewEmpList.SelectedIndex;
            lblEmpId.Text = GridViewEmpList.SelectedRow.Cells[1].Text;
            txtEmpName.Text = GridViewEmpList.SelectedRow.Cells[2].Text;
            txtDept.Text = GridViewEmpList.SelectedRow.Cells[3].Text;
            txtEmail.Text = GridViewEmpList.SelectedRow.Cells[4].Text;
            txtMobileNo.Text = GridViewEmpList.SelectedRow.Cells[5].Text;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {

                conn.Open();
                SqlCommand cmd = new SqlCommand("Update Employees Set EmployeeName=@EmployeeName, department=@department, email=@email, MobileNo=@MobileNo Where EmployeeId=@EmployeeId", conn);

                cmd.Parameters.AddWithValue("@EmployeeId", lblEmpId.Text);
                cmd.Parameters.AddWithValue("@EmployeeName", txtEmpName.Text);
                cmd.Parameters.AddWithValue("@department", txtDept.Text);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@MobileNo", txtMobileNo.Text);

                if (cmd.ExecuteNonQuery() == 1)
                {
                    lblMessage.Text = "Message status:" + "The Employee information updated successfully";
                    fillBlank();
                    BindEmployees();
                }


            }
        }
    }
}