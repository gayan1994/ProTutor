using System;
using System.Data.SqlClient;
using System.Web;

namespace ProTutor
{
    public partial class tutorReg : System.Web.UI.Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!CheckBoxAgreement.Checked)
            {
                return;
            }

            var fName = tbxfName.Text;
            var lName = tbxlName.Text;
            var eMail = tbxEmail.Text;
            var mobNo = tbxMobNum.Text;
            var dobValue = DOBPicker.Value;
            var dob = DateTime.Parse(dobValue);
            var password = Pass2.Text;
            var passwordHash = Crypto.GetHashString(password);
            var highestQualification = RadioButtonList1.SelectedValue;
            var homeTown = tbxHometown.Text;
            var mainSubject = tbxSubject.Text;
            var curriculum = tbxCurruculum.Text;
            var summary = tbxSummary.Text;
            var hourlyRate = tbxHourlyRate.Text;
            decimal currentBalance = 0;

            // Validate date of birth

            if (dob > DateTime.Now)
            {
                dobValidation.Visible = true;
                return;
            }

            dobValidation.Visible = false;

            string filePath = null;

            //save profile picture
            if (updProfilePicture.HasFile)
            {
                //saving the file
                filePath = "/Images/profile_" + Guid.NewGuid() + ".png";
                string fullpath = HttpRuntime.AppDomainAppPath + filePath;
                updProfilePicture.SaveAs(fullpath);
            }

            var accountNo = tbxAccountNo.Text;
            var bank = tbxBank.Text;
            var branch = tbxBranchName.Text;
            var accountHolderName = tbxAccountHolderName.Text;

            //check whether the email address already exists in the Tutor table

            string commandText = @"SELECT *
                                   FROM [TutorDb].[dbo].[Tutor]
                                   WHERE [Email] = '" + eMail + "'";

            SqlConnection conn = new SqlConnection(Constants.CONN_STRING);
            SqlCommand cmd = new SqlCommand(commandText, conn);

            conn.Open();

            var reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                emailValidation.Visible = true;
                conn.Close();
                return;
            }

            conn.Close();

            //check whether the updated email address already exists in the Student table

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

            // Save tutor's details

            commandText = "INSERT INTO [dbo].[Tutor] ([FirstName],[LastName],[Email],[MobileNumber],[DOB],[Password],[HighestQualification],[CurrentBalance],[Hometown],[MainSubject],[Curriculum],[ProfilePicture],[Summary],[HourlyRate]) VALUES ('" + fName + "','" + lName + "','" + eMail + "','" + mobNo + "','" + dob + "','" + passwordHash + "','" + highestQualification + "'," + currentBalance + ",'" + homeTown + "','" + mainSubject + "','" + curriculum + "','" + filePath + "','" + summary + "', " + hourlyRate + ")"

                        + "INSERT INTO [dbo].[BankAccount] ([AccountNo],[Bank],[Branch],[Name],[TutorId]) VALUES ('" + accountNo + "','" + bank + "','" + branch + "','" + accountHolderName + "', SCOPE_IDENTITY())";

            conn = new SqlConnection(Constants.CONN_STRING);
            cmd = new SqlCommand(commandText, conn);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("Login.aspx");

        }
    }
}