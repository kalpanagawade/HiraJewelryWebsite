using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace HiraJewelryWeb
{
    public partial class Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("Auth.aspx");
                return;
            }

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
                SqlCommand cmd = new SqlCommand(@"SELECT  
                O.OrderID,
                O.OrderDate,
                O.TotalAmount,
                O.OrderStatus,
                STRING_AGG(P.ImageUrl, ',') AS Images
            FROM Orders O
            INNER JOIN Users U ON O.UserID = U.UserID
            INNER JOIN OrderDetails OD ON O.OrderID = OD.OrderID
            INNER JOIN Products P ON OD.ProductID = P.ProductID
            WHERE U.Email = @Email
            GROUP BY O.OrderID, O.OrderDate, O.TotalAmount, O.OrderStatus
            ORDER BY O.OrderDate DESC", con);

                cmd.Parameters.AddWithValue("@Email", Session["UserEmail"].ToString());

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptOrders.DataSource = dt;
                rptOrders.DataBind();
            }
        }

        // 🔥 THIS METHOD WAS MISSING / NOT FOUND – NOW FIXED
        protected void rptOrders_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
                e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater rptImages = (Repeater)e.Item.FindControl("rptImages");
                DataRowView row = (DataRowView)e.Item.DataItem;

                if (row["Images"] != DBNull.Value)
                {
                    string[] images = row["Images"].ToString().Split(',');
                    rptImages.DataSource = images;
                    rptImages.DataBind();
                }
            }
        }
    }
}
