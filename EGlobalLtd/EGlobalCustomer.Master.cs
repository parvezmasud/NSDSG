using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EGlobalLtd
{
    public partial class EGlobalCustomer : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EGlobalLtdUserType"] == null)
            {
                Response.Redirect(ResolveUrl("~/LoginPage.aspx"));
            }
        }
    }
}