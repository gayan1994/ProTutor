using System;
using System.Data.SqlClient;

namespace ProTutor
{
    public partial class StudentPublicProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["StudentId"];

            string commandText = @"SELECT [ID]
                                         ,[FirstName] + ' '+ [LastName] AS Name
                                         ,[Email]
                                         ,[MobileNumber]
                                         ,[DOB]
                                   FROM [TutorDb].[dbo].[Student] 
                                   WHERE [ID] = " + id;

            SqlConnection conn = new SqlConnection(Constants.CONN_STRING);
            var command = new SqlCommand(commandText, conn);

            conn.Open();

            var reader = command.ExecuteReader();
            reader.Read();

            string name = reader.GetString(1);
            lblName.Text = name;

            string email = reader.GetString(2);
            lblEmail.Text = email;

            string mobileNumber = reader.GetString(3);
            lblMobileNumber.Text = mobileNumber;

            // Calculate and show the age

            DateTime dob = reader.GetDateTime(4);
            TimeSpan span = (DateTime.Now).Subtract(dob);

            var DifferenceInDays = span.TotalDays;
            var DifferenceInYears = (DifferenceInDays / 365);
            var age = Math.Round(DifferenceInYears);

            lblAge.Text = age.ToString();

            conn.Close();
        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["StudentId"];
            Response.Redirect("TutorMessages.aspx?StudentId=" + id);
        }
    }
}