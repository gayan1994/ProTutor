using System;
using System.Data.SqlClient;

namespace ProTutor
{
    public partial class EditAd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }

            string id = Request.QueryString["Id"];

            string commandText = @"SELECT [ID]
                                         ,[Title]
                                         ,[Description]
                                   FROM [TutorDb].[dbo].[Advertisement]
                                   WHERE [ID] = " + id;

            SqlConnection conn = new SqlConnection(Constants.CONN_STRING);
            SqlCommand cmd = new SqlCommand(commandText, conn);

            conn.Open();

            var reader = cmd.ExecuteReader();
            reader.Read();

            string title = reader.GetString(1);
            AdTitle.Text = title;

            string description = reader.GetString(2);
            AdDescription.Text = description;

            conn.Close();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var title = AdTitle.Text;
            var description = AdDescription.Text;
            string id = Request.QueryString["Id"];

            string commandText = @"UPDATE [TutorDb].[dbo].[Advertisement]
                                   SET [Title] = '" + title + "',[Description] = '" + description + "' WHERE [ID] = " + id;

            SqlConnection conn = new SqlConnection(Constants.CONN_STRING);
            SqlCommand cmd = new SqlCommand(commandText, conn);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("~/StudentAds.aspx");
        }
    }
}