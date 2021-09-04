using System;
using System.Data.SqlClient;

namespace ProTutor
{
    public partial class AddLessonRequest : System.Web.UI.Page
    {
        protected void btnSave_Click(object sender, EventArgs e)
        {
            // get the tuter Id from the URL
            string tutorId = Request.QueryString["TutorId"];
            var studentId = (int)Session["StudentId"];

            var startTime = inptStart.Value;
            // remove the T in the startTime
            startTime = startTime.Replace('T', ' ');

            var endTime = inptEnd.Value;
            // remove the T in the endTime
            endTime = endTime.Replace('T', ' ');

            var hourlyRate = tbxHourlyRate.Text;

            // validate start and end time
            var startDate = DateTime.Parse(startTime);
            var endDate = DateTime.Parse(endTime);

            if (startDate < DateTime.Now)
            {
                startTimeValidation.Visible = true;
                return;
            }
            else
            {
                startTimeValidation.Visible = false;
            }

            if (endDate < DateTime.Now)
            {
                endTimeValidation.Visible = true;
                return;
            }
            else
            {
                endTimeValidation.Visible = false;
            }

            if (endDate < startDate)
            {
                endTimeValidation.Visible = true;
                return;
            }
            else
            {
                endTimeValidation.Visible = false;
            }


            string commandText = @"INSERT INTO [dbo].[LessonRequest]([StudentId]
                                                                    ,[TutorId]
                                                                    ,[Start]
                                                                    ,[End]
                                                                    ,[HourlyRate]
                                                                    ,[Status])
                                                              VALUES
                                                                    (" + studentId +
                                                                    "," + tutorId +
                                                                    ",'" + startTime + "'" +
                                                                    ",'" + endTime + "'" +
                                                                    ",'" + hourlyRate + "'" +
                                                                    ",'Pending')";

            SqlConnection conn = new SqlConnection(Constants.CONN_STRING);
            SqlCommand cmd = new SqlCommand(commandText, conn);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("~/SentLessonRequests.aspx");
        }
    }
}
