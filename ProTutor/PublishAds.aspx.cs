using System;
using System.Data.SqlClient;

namespace ProTutor
{
    public partial class PublishAds : System.Web.UI.Page
    {
        protected void btnPublish_Click(object sender, EventArgs e)
        {
            var title = AdTitle.Text;
            var description = AdDescription.Text;
            var studentId = (int)Session["StudentId"];
            var createdDate = DateTime.Now;


            string commandText = @"INSERT INTO [dbo].[Advertisement]([StudentId],[Title],[Description],[CreatedDate],[IsActive])
                                   VALUES (" + studentId + ",'" + title + "','" + description + "','" + createdDate + "','Active')";

            SqlConnection conn = new SqlConnection(Constants.CONN_STRING);
            SqlCommand cmd = new SqlCommand(commandText, conn);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("~/StudentAds.aspx");

        }
    }
}