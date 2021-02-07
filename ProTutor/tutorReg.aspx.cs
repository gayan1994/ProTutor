using ProTutor.Helpers;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProTutor
{
    public partial class tutorReg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                var fName = tbxfName.Text;
                var lName = tbxlName.Text;
                var eMail = tbxEmail.Text;
                var mobNo = tbxMobNum.Text;
                var dob = DOBPicker.Value;
                var password = CryptoHelper.GetHashString(Pass2.Text);
                var highestQualification = RadioButtonList1.SelectedValue;
                var school = tbxSchool.Text;
                var mainSubject = tbxSubject.Text;
                var curriculum = tbxCurruculum.Text;
                var summary = tbxSummary.Text;
                var hourlyRate = tbxHourlyRate.Text;

                string[] dateParts = dob.Split('-');

                var year = int.Parse(dateParts[0]);
                var month = int.Parse(dateParts[1]);
                var day = int.Parse(dateParts[2]);

                if (year > DateTime.Now.Year)
                {
                    dobValidation.Visible = true;
                    return;
                }

                if (year == DateTime.Now.Year && month > DateTime.Now.Month)
                {
                    dobValidation.Visible = true;
                    return;
                }

                if(year == DateTime.Now.Year && month == DateTime.Now.Month && day > DateTime.Now.Day)
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
                    filePath = $"/Images/profile_{Guid.NewGuid()}.png";
                    string fullpath = $"{HttpRuntime.AppDomainAppPath}{filePath}";
                    updProfilePicture.SaveAs(fullpath);
                }

                var accountNo = tbxAccountNo.Text;
                var bank = tbxBank.Text;
                var branch = tbxBranchName.Text;
                var accountHolderName = tbxAccountHolderName.Text;

                string commandText = $@"
    INSERT INTO [dbo].[Tutor]
           ([FirstName]
           ,[LastName]
           ,[Email]
           ,[MobileNumber]
           ,[DOB]
           ,[Password]
           ,[HighestQualificaton]
           ,[School]
           ,[MainSubject]
           ,[Curriculum]
           ,[ProfilePicture]
           ,[Summary]
           ,[HourlyRate])
     VALUES
           ('{fName}'
           ,'{lName}'
           ,'{eMail}'
           ,'{mobNo}'
           ,'{dob}'
           ,'{password}'
           ,'{highestQualification}'
           ,'{school}'
           ,'{mainSubject}'
           ,'{curriculum}'
           ,'{filePath}'
           ,'{summary}'
           , {hourlyRate})

    DECLARE @ID AS INT = SCOPE_IDENTITY()

    INSERT INTO [dbo].[BankAccount]
           ([AccountNo]
           ,[Bank]
           ,[Branch]
           ,[Name]
           ,[TutorId])
     VALUES
           ('{accountNo}'
           ,'{bank}'
           ,'{branch}'
           ,'{accountHolderName}'
           ,@ID)";

                using (SqlConnection conn = new SqlConnection(Constants.CONN_STRING))
                using (SqlCommand cmd = new SqlCommand(commandText, conn))
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }

                Response.Redirect("Login.aspx");
            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}