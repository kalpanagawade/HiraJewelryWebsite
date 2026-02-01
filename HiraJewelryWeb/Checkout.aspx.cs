using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace YourProject
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Example static values (from session/cart later)
                decimal price = 14272;
                decimal tax = 415.69m;

                lblItemPrice.Text = price.ToString("N2");
                lblTax.Text = tax.ToString("N2");
                lblTax2.Text = tax.ToString("N2");
                lblTotal.Text = (price).ToString("N2");
            }
        }

        protected void btnPayNow_Click(object sender, EventArgs e)
        {
            // Later integrate Razorpay / Easebuzz
            Response.Write("<script>alert('Order placed (Demo)');</script>");
        }
    }
}
