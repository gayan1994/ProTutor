using System;
using System.Data.SqlClient;

namespace ProTutor
{
    public partial class ViewSentLessonRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["Id"];

            string commandText = @"SELECT LR.[ID]
                                         ,T.[FirstName] + ' ' + T.[LastName] AS TutorName
                                         ,LR.[StudentId]
                                         ,LR.[TutorId]
                                         ,LR.[Start]
                                         ,LR.[End]
                                         ,LR.[HourlyRate]
                                         ,LR.[Status]
                                   FROM [TutorDb].[dbo].[LessonRequest] LR
	                                INNER JOIN [dbo].[Tutor] T ON LR.[TutorId] = T.[ID]
                                   WHERE LR.[Id] = " + id;

            SqlConnection conn = new SqlConnection(Constants.CONN_STRING);
            var command = new SqlCommand(commandText, conn);

            conn.Open();

            var reader = command.ExecuteReader();
            reader.Read();

            string name = reader.GetString(1);
            lblName.Text = name;

            DateTime startTime = reader.GetDateTime(4);
            lblStart.Text = startTime.ToString();

            DateTime endTime = reader.GetDateTime(5);
            lblEnd.Text = endTime.ToString();

            Decimal hourlyRate = reader.GetDecimal(6);
            lblHourlyRate.Text = hourlyRate.ToString();

            string status = reader.GetString(7);
            lblStatus.Text = status.ToString();

            if (status == "Pending")
            {
                btnCancel.Visible = true;
            }
            else if (status == "Accepted")
            {
                btnCancel.Visible = true;
            }

            conn.Close();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["Id"];

            string commandText = @"UPDATE [dbo].[LessonRequest]
                                   SET [Status] = 'Canceled'
                                   WHERE [ID] = " + id;

            SqlConnection conn = new SqlConnection(Constants.CONN_STRING);
            SqlCommand cmd = new SqlCommand(commandText, conn);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("~/SentLessonRequests.aspx");
        }
    }
}