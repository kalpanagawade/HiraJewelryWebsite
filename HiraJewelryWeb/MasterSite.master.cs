using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HiraJewelryWeb
{
    public partial class MasterSite : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // CHECK LOGIN SESSION
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("Auth.aspx");  // redirect if not logged in
            }
            else
            {
                lblUser.Text = Session["UserEmail"].ToString();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();   // clear session
            Response.Redirect("Auth.aspx"); // redirect to login
        }
    }
}