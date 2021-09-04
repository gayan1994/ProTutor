using System;
using System.Data;
using System.Data.SqlClient;

namespace ProTutor
{
    public partial class TutorPublicProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }

            string id = Request.QueryString["TutorId"];

            // Retrieve the profile

            string commandText = @"SELECT T.[ID]
                                         ,T.[FirstName] + ' '+ T.[LastName] AS Name
                                         ,T.[HighestQualification]
                                         ,T.[Hometown]
                                         ,T.[MainSubject]
                                         ,T.[Curriculum]
                                         ,T.[ProfilePicture]
                                         ,T.[Summary]
                                         ,T.[HourlyRate]
                                         ,T.[Email]
                                         ,T.[DOB]
                                         ,AVG(R.[Rating]) AS Rating
                                   FROM [TutorDb].[dbo].[Tutor] T
                                    LEFT JOIN [TutorDb].[dbo].[Review] R ON T.[ID] = R.[TutorId]
                                   WHERE T.[ID] = " + id + @"
                                   GROUP BY T.[ID]
                                           ,T.[FirstName] + ' '+ T.[LastName]
                                           ,T.[HighestQualification]
                                           ,T.[Hometown]
                                           ,T.[MainSubject]
                                           ,T.[Curriculum]
                                           ,T.[ProfilePicture]
                                           ,T.[Summary]
                                           ,T.[HourlyRate]
                                           ,T.[Email]
                                           ,T.[DOB]";

            SqlConnection conn = new SqlConnection(Constants.CONN_STRING);
            var command = new SqlCommand(commandText, conn);

            conn.Open();

            var reader = command.ExecuteReader();
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

            string email = reader.GetString(9);
            lblEmail.Text = email;

            // Calculate and show the age

            DateTime dob = reader.GetDateTime(10);
            TimeSpan span = (DateTime.Now).Subtract(dob);

            var DifferenceInDays = span.TotalDays;
            var DifferenceInYears = (DifferenceInDays / 365);
            var age = Math.Round(DifferenceInYears);

            lblAge.Text = age.ToString();


            if (!reader.IsDBNull(11))
            {
                decimal rating = reader.GetDecimal(11);
                lblRating.Text = rating.ToString("0.00");
            }
            else
            {
                lblRating.Text = "-";
            }

            conn.Close();

            var tutorId = Request.QueryString["TutorId"];

            // Retrieve and show  the student reviews & ratings

            commandText = @"SELECT S.[FirstName] + ' ' + S.[LastName] AS StudentName
                                  ,R.[Comment]
                                  ,R.[Rating]
                                  ,R.[Date]
                            FROM [TutorDb].[dbo].[Review] R
	                            INNER JOIN [dbo].[Student] S ON R.[StudentId] = S.[ID]
                            WHERE R.[TutorId] = " + tutorId + @"
                            ORDER BY R.[Date] DESC";

            var table = new DataTable();

            conn = new SqlConnection(Constants.CONN_STRING);
            var da = new SqlDataAdapter(commandText, conn);

            da.Fill(table);


            rptRequests.DataSource = table;
            rptRequests.DataBind();

        }

        protected void btnRequestLesson_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["TutorId"];
            Response.Redirect("AddLessonRequest.aspx?TutorId=" + id);
        }
        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["TutorId"];
            Response.Redirect("StudentMessages.aspx?TutorId=" + id);
        }

        protected void btnWriteReview_Click(object sender, EventArgs e)
        {
            tbxReview.Visible = true;
            tbxRating.Visible = true;
            btnSubmit.Visible = true;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var review = tbxReview.Text;
            var ratingInput = tbxRating.Text;

            if (review == "")
            {
                spnReview.Visible = true;
                return;
            }
            else
            {
                spnReview.Visible = false;
            }

            if (ratingInput == "")
            {
                spnRating.Visible = true;
                return;
            }
            else
            {
                spnRating.Visible = false;
            }

            var rating = Decimal.Parse(ratingInput);

            var date = DateTime.Now;

            var studentId = (int)Session["StudentId"];
            var tId = Request.QueryString["TutorId"];
            var tutorId = Int32.Parse(tId);

            string commandText = @"INSERT INTO [TutorDb].[dbo].[Review] ([StudentId],[TutorId],[Comment],[Rating],[Date])
                                   VALUES (" + studentId + "," + tutorId + ",'" + review + "','" + rating + "','" + date + "')";

            SqlConnection conn = new SqlConnection(Constants.CONN_STRING);
            SqlCommand cmd = new SqlCommand(commandText, conn);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect(Request.RawUrl);
        }
    }
}