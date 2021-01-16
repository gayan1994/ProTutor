using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProTutor
{
    public partial class ViewLessonRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["Id"];

            string commandText = $@"SELECT LR.[ID]
      ,S.FirstName + ' ' + S.LastName AS StudentName
      ,[StudentId]
      ,[TutorId]
      ,[Start]
      ,[End]
      ,[HourlyRate]
      ,[Status]
  FROM [TutorDb].[dbo].[LessonRequest] LR
	INNER JOIN [dbo].[Student] S ON LR.StudentId = S.ID
  WHERE LR.Id = {id}";

            using (SqlConnection conn = new SqlConnection(Constants.CONN_STRING))
            using (var command = new SqlCommand(commandText, conn))
            {
                conn.Open();

                using (var reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        if (!reader.IsDBNull(1))
                        {
                            string name = reader.GetString(1);
                            lblName.Text = name;
                        }

                        if (!reader.IsDBNull(4))
                        {
                            DateTime startTime = reader.GetDateTime(4);
                            lblStart.Text = startTime.ToString();
                        }

                        if (!reader.IsDBNull(5))
                        {
                            DateTime endTime = reader.GetDateTime(5);
                            lblEnd.Text = endTime.ToString();
                        }

                        if (!reader.IsDBNull(6))
                        {
                            Decimal hourlyRate = reader.GetDecimal(6);
                            lblHourlyRate.Text = hourlyRate.ToString();
                        }

                        if (!reader.IsDBNull(7))
                        {
                            string status = reader.GetString(7);
                            lblStatus.Text = status.ToString();

                            if(status == "Pending")
                            {
                                btnAccept.Visible = true;
                            }
                            else if(status == "Accepted")
                            {
                                btnStart.Visible = true;
                            }
                            else if(status == "Started")
                            {
                                btnFinish.Visible = true;
                            }
                        }
                    }
                }
            }
        }

        protected void btnAccept_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["Id"];

            string commandText = $@"
    UPDATE [dbo].[LessonRequest]
   SET [Status] = 'Accepted'
 WHERE ID = {id}";

            using (SqlConnection conn = new SqlConnection(Constants.CONN_STRING))
            using (SqlCommand cmd = new SqlCommand(commandText, conn))
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            Response.Redirect(Request.RawUrl);
        }

        protected void btnStart_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["Id"];

            string commandText = $@"
    UPDATE [dbo].[LessonRequest]
   SET [Status] = 'Started'
 WHERE ID = {id}";

            using (SqlConnection conn = new SqlConnection(Constants.CONN_STRING))
            using (SqlCommand cmd = new SqlCommand(commandText, conn))
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            Response.Redirect(Request.RawUrl);
        }

        protected void btnFinish_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["Id"];

            string commandText = $@"
    UPDATE [dbo].[LessonRequest]
   SET [Status] = 'Finished'
 WHERE ID = {id}";

            using (SqlConnection conn = new SqlConnection(Constants.CONN_STRING))
            using (SqlCommand cmd = new SqlCommand(commandText, conn))
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            Response.Redirect(Request.RawUrl);
        }
    }
}