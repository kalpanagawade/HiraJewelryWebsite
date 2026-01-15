using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace HiraJewelryWeb
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCart();
            }
        }

        private void BindCart()
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("~/Auth.aspx");
                return;
            }

            string userEmail = Session["UserEmail"].ToString();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // Get UserID
                SqlCommand cmdUser = new SqlCommand("SELECT UserID FROM Users WHERE Email=@Email", con);
                cmdUser.Parameters.AddWithValue("@Email", userEmail);
                object userObj = cmdUser.ExecuteScalar();

                if (userObj == null)
                {
                    rptCart.DataSource = null;
                    rptCart.DataBind();
                    lblEmpty.Visible = true;
                    return;
                }

                int userId = Convert.ToInt32(userObj);

                // Get CartID
                SqlCommand cmdCart = new SqlCommand("SELECT CartID FROM CartMaster WHERE UserID=@UserID", con);
                cmdCart.Parameters.AddWithValue("@UserID", userId);
                object cartObj = cmdCart.ExecuteScalar();

                if (cartObj == null)
                {
                    rptCart.DataSource = null;
                    rptCart.DataBind();
                    lblEmpty.Visible = true;
                    return;
                }

                int cartId = Convert.ToInt32(cartObj);

                // Get Cart Details
                SqlCommand cmdDetails = new SqlCommand(@"
                SELECT p.ProductName, p.Price, cd.Quantity, (p.Price * cd.Quantity) AS Total, p.ImageUrl
                FROM CartDetails cd
                INNER JOIN Products p ON cd.ProductID = p.ProductID
                WHERE cd.CartID=@CartID", con);

                cmdDetails.Parameters.AddWithValue("@CartID", cartId);

                SqlDataAdapter da = new SqlDataAdapter(cmdDetails);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    rptCart.DataSource = dt;
                    rptCart.DataBind();
                }
                else
                {
                    rptCart.DataSource = null;
                    rptCart.DataBind();
                    lblEmpty.Visible = true;
                }
            }
        }
    }

}