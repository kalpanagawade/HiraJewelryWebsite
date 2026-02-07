using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace HiraJewelryWeb
{
    public partial class AdminOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrders();
            }
        }
        private void LoadOrders()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"
                    SELECT 
                        O.OrderID,
                        U.FullName,
                        U.Email,
                        O.OrderDate,
                        O.TotalAmount,
                        O.OrderStatus
                    FROM Orders O
                    INNER JOIN Users U ON O.UserID = U.UserID
                    ORDER BY O.OrderDate DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvOrders.DataSource = dt;
                gvOrders.DataBind();
            }
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            var btn = (System.Web.UI.WebControls.Button)sender;
            int orderId = Convert.ToInt32(btn.CommandArgument);

            Response.Redirect("~/AdminOrderDetails.aspx?OrderID=" + orderId);
        }

    }
}