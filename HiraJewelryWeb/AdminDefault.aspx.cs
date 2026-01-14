using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HiraJewelryWeb
{
    public partial class AdminDefault : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["AdminUser"] == null)
            //{
            //    Response.Redirect("~/Auth.aspx");
            //}
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Auth.aspx");
        }
        protected void btnManageProducts_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AdminProducts.aspx");
        }

    }
}