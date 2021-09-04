using System;
using System.Data.SqlClient;

namespace ProTutor
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
            var email = tbxEmail.Text;
            var password = tbxPassword.Text;
            var passwordHash = Crypto.GetHashString(password);

            var connection = new SqlConnection(Constants.CONN_STRING);

            // Student table

            var command = new SqlCommand("SELECT [Id], [Email], [Password] FROM [TutorDb].[dbo].[Student] WHERE [Email] = '" + email + "'", connection);

            connection.Open();

            var isPasswordValid = false;

            var reader = command.ExecuteReader();

            int id = 0;
            string role = "";

            if (reader.Read()) // Don't assume we have any rows.
            {
                id = reader.GetInt32(0);
                string passwordDb = reader.GetString(2);
                role = "Student";

                if (passwordHash == passwordDb)
                {
                    isPasswordValid = true;
                }
            }

            connection.Close();

            // Tutor table
            connection = new SqlConnection(Constants.CONN_STRING);
            command = new SqlCommand("SELECT [Id], [Email], [Password] FROM [TutorDb].[dbo].[Tutor] WHERE [Email] = '" + email + "'", connection);

            connection.Open();

            reader = command.ExecuteReader();

            if (reader.Read())
            {
                id = reader.GetInt32(0);
                string passwordDb = reader.GetString(2);
                role = "Tutor";

                if (passwordHash == passwordDb)
                {
                    isPasswordValid = true;
                }
            }

            connection.Close();

            if (!isPasswordValid)
            {
                passValidation.Visible = true;
                return;
            }
            else
            {
                passValidation.Visible = false;
            }

            Session["Role"] = role;
            Session["IsLoggedIn"] = true;

            if (role == "Student")
            {
                Session["StudentId"] = id;
                Response.Redirect("~/StudentHome.aspx");
            }
            else
            {
                Session["TutorId"] = id;
                Response.Redirect("~/TutorHome.aspx");
            }
        }
    }
}