using System;
using System.Data.SqlClient;

namespace ProTutor
{
    public partial class EditStudentProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }

            var studentId = (int)Session["StudentId"];

            string commandText = @"SELECT S.[ID]
                                         ,S.[FirstName]
                                         ,S.[LastName]
                                         ,S.[Email]
                                         ,S.[MobileNumber]
                                         ,S.[DOB]
                                         ,S.[Password]
                                         ,C.[CardNo]
                                         ,C.[CVN]
                                         ,C.[ExpiryDate]
                                   FROM [TutorDb].[dbo].[Student] S
	                                INNER JOIN [dbo].[Card] C ON S.[ID] = C.[StudentId]
                                   WHERE S.[Id] = " + studentId;

            SqlConnection conn = new SqlConnection(Constants.CONN_STRING);
            SqlCommand cmd = new SqlCommand(commandText, conn);

            conn.Open();

            var reader = cmd.ExecuteReader();
            reader.Read();

            string fName = reader.GetString(1);
            tbxFName.Text = fName;

            string lName = reader.GetString(2);
            tbxLName.Text = lName;

            string email = reader.GetString(3);
            tbxEMail.Text = email;

            string mobNo = reader.GetString(4);
            tbxMobNo.Text = mobNo;

            DateTime dob = reader.GetDateTime(5);
            DOBPicker.Value = dob.ToString("yyyy-MM-dd");

            string cardNo = reader.GetString(7);
            tbxCardNumber.Text = cardNo;

            string cvn = reader.GetString(8);
            tbxCVN.Text = cvn;

            string expiry = reader.GetString(9);
            string[] expiryDateParts = expiry.Split('/');

            tbxExpiryMonth.Text = expiryDateParts[0];
            tbxExpiryYear.Text = expiryDateParts[1];

            conn.Close();
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            int id = (int)Session["StudentId"];

            string fName = tbxFName.Text;
            string lName = tbxLName.Text;
            string email = tbxEMail.Text;
            string mobNo = tbxMobNo.Text;
            string dobValue = DOBPicker.Value;
            DateTime dob = DateTime.Parse(dobValue);

            //Validate date of birth

            if (dob > DateTime.Now)
            {
                dobValidation.Visible = true;
                return;
            }

            dobValidation.Visible = false;

            string cardNo = tbxCardNumber.Text;
            string cvn = tbxCVN.Text;
            string expiryMonth = tbxExpiryMonth.Text;
            string expiryYear = tbxExpiryYear.Text;

            //Validate expiry month and date
            if (DateTime.Now.Year > int.Parse(expiryYear))
            {
                expiryYearValidation.Visible = true;
                return;
            }
            else
            {
                expiryYearValidation.Visible = false;
            }

            if (int.Parse(expiryYear) == DateTime.Now.Year && DateTime.Now.Month > int.Parse(expiryMonth))
            {
                expiryMonthValidation.Visible = true;
                return;
            }
            else
            {
                expiryMonthValidation.Visible = false;
            }

            //Validate the email address

            //check whether the updated email address is the one currently in use
            string commandText = @"SELECT [Email]
                                   FROM [TutorDb].[dbo].[Student]
                                   WHERE [ID] = " + id;

            SqlConnection conn = new SqlConnection(Constants.CONN_STRING);
            SqlCommand cmd = new SqlCommand(commandText, conn);

            conn.Open();

            var reader = cmd.ExecuteReader();

            reader.Read();

            var emailAd = reader.GetString(0);

            conn.Close();

            if (email != emailAd)
            {
                //check whether the updated email address already exists in the student table
                commandText = @"SELECT *
                                FROM [TutorDb].[dbo].[Student]
                                WHERE [Email] = '" + email + "'";

                conn = new SqlConnection(Constants.CONN_STRING);
                cmd = new SqlCommand(commandText, conn);

                conn.Open();

                reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    emailValidation.Visible = true;
                    conn.Close();
                    return;
                }

                conn.Close();

                //check whether the updated email address already exists in the tutor table
                commandText = @"SELECT *
                                FROM [TutorDb].[dbo].[Tutor]
                                WHERE [Email] = '" + email + "'";

                conn = new SqlConnection(Constants.CONN_STRING);
                cmd = new SqlCommand(commandText, conn);

                conn.Open();

                reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    emailValidation.Visible = true;
                    conn.Close();
                    return;

                }

                conn.Close();
            }

            //Update the profile
            commandText = @"UPDATE [dbo].[Student]
                            SET [FirstName] = '" + fName + "',[LastName] = '" + lName + "',[Email] = '" + email + "',[MobileNumber] = '" + mobNo + "',[DOB] = '" + dob + "' WHERE [ID] = " + id

                        + @"UPDATE [dbo].[Card]
                            SET [CardNo] = '" + cardNo + "',[CVN] = '" + cvn + "',[ExpiryDate] = '" + expiryMonth + "/" + expiryYear + "' WHERE [StudentId] = " + id;

            conn = new SqlConnection(Constants.CONN_STRING);
            cmd = new SqlCommand(commandText, conn);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("~/StudentProfile.aspx");
        }
    }
}