using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HiraJewelryWeb
{
    public partial class Auth : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // ------------------- LOGIN LOGIC -------------------
        //protected void btnLogin_Click(object sender, EventArgs e)
        //{
        //    string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        //    using (SqlConnection con = new SqlConnection(cs))
        //    {
        //        string query = "SELECT COUNT(*) FROM Users WHERE Email=@Email AND Password=@Password";

        //        SqlCommand cmd = new SqlCommand(query, con);
        //        cmd.Parameters.AddWithValue("@Email", txtLoginEmail.Text.Trim());
        //        cmd.Parameters.AddWithValue("@Password", txtLoginPassword.Text.Trim());

        //        con.Open();
        //        int count = Convert.ToInt32(cmd.ExecuteScalar());
        //        con.Close();

        //        if (count == 1)
        //        {
        //            // Store session if needed
        //            Session["UserEmail"] = txtLoginEmail.Text.Trim();

        //            // Redirect to Home page
        //            Response.Redirect("Default.aspx");
        //        }
        //        else
        //        {
        //            lblLoginMsg.Text = "Invalid Email or Password!";
        //        }
        //    }
        //}

        // ------------------- REGISTER LOGIC -------------------

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT Role FROM Users WHERE Email=@Email AND Password=@Password";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", txtLoginEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtLoginPassword.Text.Trim());

                con.Open();
                object roleObj = cmd.ExecuteScalar();
                con.Close();

                if (roleObj != null)
                {
                    string role = roleObj.ToString();

                    // Store login session
                    Session["UserEmail"] = txtLoginEmail.Text.Trim();
                    Session["UserRole"] = role;

                    if (role == "Admin")
                    {
                        Response.Redirect("~/AdminDefault.aspx");
                    }
                    else if (role == "User")
                    {
                        Response.Redirect("~/Default.aspx");
                    }
                }
                else
                {
                    lblLoginMsg.Text = "Invalid Email or Password!";
                    lblLoginMsg.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                // Check if email already exists
                SqlCommand checkCmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE Email=@Email", con);
                checkCmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());

                con.Open();
                int count = Convert.ToInt32(checkCmd.ExecuteScalar());
                con.Close();

                if (count > 0)
                {
                    lblRegisterMsg.ForeColor = System.Drawing.Color.Red;
                    lblRegisterMsg.Text = "Email already exists!";
                    return;
                }

                // Insert new user
                SqlCommand cmd = new SqlCommand("INSERT INTO Users (FullName, Email, Password, Mobile) VALUES (@FullName, @Email, @Password, @Mobile)", con);

                cmd.Parameters.AddWithValue("@FullName", txtFullName.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                lblRegisterMsg.ForeColor = System.Drawing.Color.Green;
                lblRegisterMsg.Text = "Registration Successful! Please Login.";

                // Optionally flip to login panel
                // (will require javascript call if needed)
            }
        }

    }
}