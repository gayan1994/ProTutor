using System;
using System.Data.SqlClient;

namespace ProTutor
{
    public partial class EditTutorProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }

            var tutorId = (int)Session["TutorId"];

            string commandText = @"SELECT T.[ID]
                                         ,T.[FirstName]
                                         ,T.[LastName]
                                         ,T.[Email]
                                         ,T.[MobileNumber]
                                         ,T.[DOB]
                                         ,T.[HighestQualification]
                                         ,T.[Hometown]
                                         ,T.[MainSubject]
                                         ,T.[Curriculum]
                                         ,T.[Summary]
                                         ,T.[HourlyRate]
                                         ,T.[Password]
                                         ,B.[AccountNo]
                                         ,B.[Bank]
                                         ,B.[Branch]
                                         ,B.[Name]
                                   FROM [TutorDb].[dbo].[Tutor] T
	                                INNER JOIN [TutorDb].[dbo].[BankAccount] B ON T.[ID] = B.[TutorId]
                                   WHERE T.[Id] = " + tutorId;

            SqlConnection conn = new SqlConnection(Constants.CONN_STRING);
            SqlCommand cmd = new SqlCommand(commandText, conn);

            conn.Open();

            var reader = cmd.ExecuteReader();
            reader.Read();

            string fName = reader.GetString(1);
            tbxfName.Text = fName;

            string lName = reader.GetString(2);
            tbxlName.Text = lName;

            string email = reader.GetString(3);
            tbxEmail.Text = email;

            string mobNo = reader.GetString(4);
            tbxMobNum.Text = mobNo;

            DateTime dob = reader.GetDateTime(5);
            DOBPicker.Value = dob.ToString("yyyy-MM-dd");

            string highestQualification = reader.GetString(6);
            RadioButtonList1.SelectedValue = highestQualification;

            string hometown = reader.GetString(7);
            tbxHometown.Text = hometown;

            string mainSubject = reader.GetString(8);
            tbxSubject.Text = mainSubject;

            string curriculum = reader.GetString(9);
            tbxCurruculum.Text = curriculum;

            string summary = reader.GetString(10);
            tbxSummary.Text = summary;

            decimal hourlyRate = reader.GetDecimal(11);
            tbxHourlyRate.Text = hourlyRate.ToString();

            string accountNo = reader.GetString(13);
            tbxAccountNo.Text = accountNo;

            string bank = reader.GetString(14);
            tbxBank.Text = bank;

            string branch = reader.GetString(15);
            tbxBranchName.Text = branch;

            string accountHolderName = reader.GetString(16);
            tbxAccountHolderName.Text = accountHolderName;

            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var tutorId = (int)Session["TutorId"];

            var fName = tbxfName.Text;
            var lName = tbxlName.Text;
            var eMail = tbxEmail.Text;
            var mobNo = tbxMobNum.Text;
            var dobValue = DOBPicker.Value;
            var dob = DateTime.Parse(dobValue);
            var highestQualification = RadioButtonList1.SelectedValue;
            var hometown = tbxHometown.Text;
            var mainSubject = tbxSubject.Text;
            var curriculum = tbxCurruculum.Text;
            var summary = tbxSummary.Text;
            var hourlyRate = tbxHourlyRate.Text;

            //Validate date of birth

            if (dob > DateTime.Now)
            {
                dobValidation.Visible = true;
                return;
            }

            dobValidation.Visible = false;

            var accountNo = tbxAccountNo.Text;
            var bank = tbxBank.Text;
            var branch = tbxBranchName.Text;
            var accountHolderName = tbxAccountHolderName.Text;

            //Validate the email address

            //check whether the updated email address is the one currently in use
            string commandText = @"SELECT [Email]
                                   FROM [TutorDb].[dbo].[Tutor]
                                   WHERE [ID] = " + tutorId;

            SqlConnection conn = new SqlConnection(Constants.CONN_STRING);
            SqlCommand cmd = new SqlCommand(commandText, conn);

            conn.Open();

            var reader = cmd.ExecuteReader();

            reader.Read();

            var emailAd = reader.GetString(0);

            conn.Close();

            if (eMail != emailAd)
            {
                //check whether the updated email address already exists in the tutor table
                commandText = @"SELECT *
                                FROM [TutorDb].[dbo].[Tutor]
                                WHERE [Email] = '" + eMail + "'";

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

                //check whether the updated email address already exists in the student table
                commandText = @"SELECT *
                                FROM [TutorDb].[dbo].[Student]
                                WHERE [Email] = '" + eMail + "'";

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
            commandText = "UPDATE [TutorDb].[dbo].[Tutor] SET [FirstName] = '" + fName + "',[LastName] = '" + lName + "',[Email] = '" + eMail + "',[MobileNumber] = '" + mobNo + "',[DOB] = '" + dob + "',[HighestQualification] = '" + highestQualification + "',[Hometown] = '" + hometown + "',[MainSubject] = '" + mainSubject + "' ,[Curriculum] = '" + curriculum + "',[Summary] = '" + summary + "',[HourlyRate] = " + hourlyRate + " WHERE [ID] = " + tutorId

                        + "UPDATE [TutorDb].[dbo].[BankAccount] SET [AccountNo] = '" + accountNo + "',[Bank] = '" + bank + "',[Branch] = '" + branch + "',[Name] = '" + accountHolderName + "' WHERE [TutorId] = " + tutorId;

            conn = new SqlConnection(Constants.CONN_STRING);
            cmd = new SqlCommand(commandText, conn);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("TutorProfile.aspx");
        }
    }
}