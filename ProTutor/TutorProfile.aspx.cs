using System;
using System.Data.SqlClient;

namespace ProTutor
{
    public partial class TutorProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }

            int id = (int)Session["TutorId"];

            //Calculate and show the total completed Sessons

            string commandText = @"SELECT COUNT(*)
                                   FROM [TutorDb].[dbo].[LessonRequest]
                                   WHERE [TutorId] = " + id + " AND [Status] = 'Finished'";

            SqlConnection conn = new SqlConnection(Constants.CONN_STRING);
            SqlCommand cmd = new SqlCommand(commandText, conn);

            conn.Open();

            var reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                var completedSessions = reader.GetInt32(0);
                lblCompletedSessions.Text = completedSessions.ToString();
            }
            conn.Close();

            //Calculate and show the total lesson requests received

            commandText = @"SELECT COUNT(*)
                            FROM [TutorDb].[dbo].[LessonRequest]
                            WHERE [TutorId] = " + id;

            conn = new SqlConnection(Constants.CONN_STRING);
            cmd = new SqlCommand(commandText, conn);

            conn.Open();

            reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                var totalRequests = reader.GetInt32(0);
                lblTotalRequests.Text = totalRequests.ToString();
            }

            conn.Close();

            //Calculate and show the total pending lesson requests

            commandText = @"SELECT COUNT(*)
                            FROM [TutorDb].[dbo].[LessonRequest]
                            WHERE [TutorId] = " + id + " AND [Status] = 'Pending'";

            conn = new SqlConnection(Constants.CONN_STRING);
            cmd = new SqlCommand(commandText, conn);

            conn.Open();

            reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                var notResponded = reader.GetInt32(0);
                lblNotResponded.Text = notResponded.ToString();
            }

            conn.Close();

            //Retrieve the profile 

            commandText = @"SELECT T.[ID]
                                  ,T.[FirstName] + ' ' + T.[LastName] AS Name
                                  ,T.[HighestQualification]
                                  ,T.[Hometown]
                                  ,T.[MainSubject]
                                  ,T.[Curriculum]
                                  ,T.[ProfilePicture]
                                  ,T.[Summary]
                                  ,T.[HourlyRate]
                                  ,T.[CurrentBalance]
                                  ,T.[Email]
                                  ,T.[DOB]
                                  ,AVG(R.[Rating]) AS Rating
                            FROM [TutorDb].[dbo].[Tutor] T
                                LEFT JOIN [TutorDb].[dbo].[Review] R ON T.[ID] = R.[TutorId]
                            WHERE T.[ID] = " + id + @"
                            GROUP BY T.[ID]
                                    ,T.[FirstName] + ' ' + T.[LastName]
                                    ,T.[HighestQualification]
                                    ,T.[Hometown]
                                    ,T.[MainSubject]
                                    ,T.[Curriculum]
                                    ,T.[ProfilePicture]
                                    ,T.[Summary]
                                    ,T.[HourlyRate]
                                    ,T.[CurrentBalance]
                                    ,T.[Email]
                                    ,T.[DOB]";

            conn = new SqlConnection(Constants.CONN_STRING);
            cmd = new SqlCommand(commandText, conn);

            conn.Open();

            reader = cmd.ExecuteReader();
            reader.Read();

            string name = reader.GetString(1);
            lblName.Text = name;

            string highestQualification = reader.GetString(2);
            lblQualification.Text = highestQualification;

            string hometown = reader.GetString(3);
            lblHometown.Text = hometown;

            string subject = reader.GetString(4);
            lblSubject.Text = subject;

            string curriculum = reader.GetString(5);
            lblCurriculum.Text = curriculum;

            if (!reader.IsDBNull(6))
            {
                string profilePic = reader.GetString(6);
                imgProPic.ImageUrl =  profilePic;
            }

            if (!reader.IsDBNull(7))
            {
                string summary = reader.GetString(7);

                if (summary == "")
                {
                    lblSummary.Text = "-";
                }
                else
                {
                    lblSummary.Text = summary;
                }
            }

            decimal hourlyRate = reader.GetDecimal(8);
            lblHourlyRate.Text = hourlyRate.ToString();

            decimal currentBalance = reader.GetDecimal(9);
            lblCurrentBalance.Text = currentBalance.ToString();

            if (currentBalance < 5000)
            {
                btnCashOut.Visible = false;
                lblCashoutInfo.Visible = true;
            }
            if (currentBalance > 5000)
            {
                btnCashOut.Visible = true;
                lblCashoutInfo.Visible = false;
            }

            string email = reader.GetString(10);
            lblEmail.Text = email;

            // Calculate and show the age

            DateTime dob = reader.GetDateTime(11);
            TimeSpan span = (DateTime.Now).Subtract(dob);

            var DifferenceInDays = span.TotalDays;
            var DifferenceInYears = (DifferenceInDays / 365);
            var age = Math.Round(DifferenceInYears);

            lblAge.Text = age.ToString();


            if (!reader.IsDBNull(12))
            {
                decimal rating = reader.GetDecimal(12);
                lblRating.Text = rating.ToString("0.00");
            }
            else
            {
                lblRating.Text = "-";
            }

            conn.Close();
        }

        protected void btnCashOut_Click(object sender, EventArgs e)
        {
            int id = (int)Session["TutorId"];

            // Retrive the current balance

            string commandText = @"SELECT T.[CurrentBalance], B.[ID]
                                   FROM [TutorDb].[dbo].[Tutor] T
                                    INNER JOIN [TutorDb].[dbo].BankAccount B ON T.[ID] = B.[TutorId]
                                   WHERE T.[ID] = " + id;

            SqlConnection conn = new SqlConnection(Constants.CONN_STRING);
            var command = new SqlCommand(commandText, conn);

            conn.Open();

            var reader = command.ExecuteReader();
            reader.Read();

            decimal currentBalance = reader.GetDecimal(0);
            int bankAccountId = reader.GetInt32(1);

            conn.Close();

            // Create the cash out request and update the current balance

            commandText = @"INSERT INTO [TutorDb].[dbo].[CashOutRequest] ([TutorId],[Amount],[Date],[BankAccountId],[Status])
                            VALUES (" + id + "," + currentBalance + ",'" + DateTime.Now + "'," + bankAccountId + ",'Pending'" + ") "

                         + @"UPDATE [TutorDb].[dbo].[Tutor] SET CurrentBalance = 0 
                            WHERE [ID] = " + id;

            conn = new SqlConnection(Constants.CONN_STRING);
            command = new SqlCommand(commandText, conn);

            conn.Open();
            command.ExecuteNonQuery();
            conn.Close();

            Response.Redirect(Request.RawUrl);
        }
    }
}