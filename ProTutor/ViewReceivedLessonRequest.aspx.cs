using System;
using System.Data.SqlClient;

namespace ProTutor
{
    public partial class ViewReceivedLessonRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["Id"];

            string commandText = @"SELECT LR.[ID]
                                         ,S.[FirstName] + ' ' + S.[LastName] AS StudentName
                                         ,LR.[StudentId]
                                         ,LR.[TutorId]
                                         ,LR.[Start]
                                         ,LR.[End]
                                         ,LR.[HourlyRate]
                                         ,LR.[Status]
                                   FROM [TutorDb].[dbo].[LessonRequest] LR
	                                INNER JOIN [dbo].[Student] S ON LR.[StudentId] = S.[ID]
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
                btnAccept.Visible = true;
                btnDecline.Visible = true;
            }
            else if (status == "Accepted")
            {
                btnStart.Visible = true;
                btnDecline.Visible = true;
            }
            else if (status == "Started")
            {
                btnFinish.Visible = true;
            }

            conn.Close();
        }


        protected void btnAccept_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["Id"];

            string commandText = @"UPDATE [TutorDb].[dbo].[LessonRequest]
                                   SET [Status] = 'Accepted'
                                   WHERE [ID] = " + id;

            SqlConnection conn = new SqlConnection(Constants.CONN_STRING);
            SqlCommand cmd = new SqlCommand(commandText, conn);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect(Request.RawUrl);
        }

        protected void btnStart_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["Id"];

            string commandText = @"UPDATE [TutorDb].[dbo].[LessonRequest]
                                   SET [Status] = 'Started'
                                   WHERE [ID] = " + id;

            SqlConnection conn = new SqlConnection(Constants.CONN_STRING);
            SqlCommand cmd = new SqlCommand(commandText, conn);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect(Request.RawUrl);
        }

        protected void btnFinish_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["Id"];

            string commandText = @"UPDATE [TutorDb].[dbo].[LessonRequest]
                                   SET [Status] = 'Finished'
                                   WHERE [ID] = " + id;

            SqlConnection conn = new SqlConnection(Constants.CONN_STRING);
            SqlCommand cmd = new SqlCommand(commandText, conn);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            var tutorId = (int)Session["TutorId"];

            // Retrieve the tutor's current balance

            commandText = @"SELECT [CurrentBalance]
                            FROM [TutorDb].[dbo].[Tutor] T
                            WHERE T.[Id] = " + tutorId;

            conn = new SqlConnection(Constants.CONN_STRING);
            cmd = new SqlCommand(commandText, conn);

            conn.Open();

            var reader = cmd.ExecuteReader();

            reader.Read();

            var currentBalance = reader.GetDecimal(0);

            conn.Close();

            // Calculate the lesson fee

            commandText = @"SELECT [Start],[End],[HourlyRate]
                            FROM [TutorDb].[dbo].[LessonRequest] LR
                            WHERE LR.[Id] = " + id;

            conn = new SqlConnection(Constants.CONN_STRING);
            cmd = new SqlCommand(commandText, conn);

            conn.Open();

            reader = cmd.ExecuteReader();

            reader.Read();

            DateTime startTime = reader.GetDateTime(0);
            DateTime endTime = reader.GetDateTime(1);
            Decimal hourlyRate = reader.GetDecimal(2);

            TimeSpan span = endTime.Subtract(startTime);

            var Difference = span.TotalMinutes;
            var timeDifference = (decimal)Difference;

            var amount = ((timeDifference / 60) * hourlyRate) + currentBalance;

            conn.Close();

            // Update the tutor's current balance

            commandText = @"UPDATE [TutorDb].[dbo].[Tutor]
                            SET [CurrentBalance] = " + amount + " WHERE [ID] = " + tutorId;

            conn = new SqlConnection(Constants.CONN_STRING);
            cmd = new SqlCommand(commandText, conn);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect(Request.RawUrl);

        }

        protected void btnDecline_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["Id"];

            string commandText = @"UPDATE [TutorDb].[dbo].[LessonRequest]
                                   SET [Status] = 'Declined'
                                   WHERE [ID] = " + id;

            SqlConnection conn = new SqlConnection(Constants.CONN_STRING);
            SqlCommand cmd = new SqlCommand(commandText, conn);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("~/ReceivedLessonRequests.aspx");
        }
    }
}
