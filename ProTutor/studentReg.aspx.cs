using System;
using System.Data.SqlClient;

namespace ProTutor
{
    public partial class studentReg : System.Web.UI.Page
    {
        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (!CheckBoxAgreement.Checked)
            {
                return;
            }

            var fName = tbxFName.Text;
            var lName = tbxLName.Text;
            var eMail = tbxEMail.Text;
            var mobNo = tbxMobNo.Text;
            var dobValue = DOBPicker.Value;
            var dob = DateTime.Parse(dobValue);
            var password = tbxPass.Text;
            var passwordHash = Crypto.GetHashString(password);

            // Validate date of birth

            if (dob > DateTime.Now)
            {
                dobValidation.Visible = true;
                return;
            }

            dobValidation.Visible = false;

            var cardNumber = tbxCardNumber.Text;
            var CVN = tbxCVN.Text;
            var expiryMonth = tbxExpiryMonth.Text;
            var expiryYear = tbxExpiryYear.Text;

            // Validate expiry month and year
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


            // check whether the email address already exists in the student table
            string commandText = @"SELECT *
                                   FROM [TutorDb].[dbo].[Student]
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

            // check whether the email address already exists in the tutor table
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

            // Save student's details
            commandText = "INSERT INTO [dbo].[Student] ([FirstName],[LastName],[Email],[MobileNumber],[DOB],[Password]) VALUES ('" + fName + "','" + lName + "','" + eMail + "','" + mobNo + "','" + dob + "','" + passwordHash + "')"

                        + "INSERT INTO [dbo].[Card] ([StudentId],[CardNo],[CVN],[ExpiryDate]) VALUES (SCOPE_IDENTITY(),'" + cardNumber + "','" + CVN + "','" + expiryMonth + "/" + expiryYear + "')";

            conn = new SqlConnection(Constants.CONN_STRING);
            cmd = new SqlCommand(commandText, conn);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("Login.aspx");
        }
    }
}