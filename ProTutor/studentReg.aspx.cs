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
    public partial class studentReg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            try
            {

                var fName = tbxFName.Text;
                var lName = tbxLName.Text;
                var eMail = tbxEMail.Text;
                var mobNo = tbxMobNo.Text;
                var dob = DOBPicker.Value;
                var password = CryptoHelper.GetHashString(tbxPass.Text);

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

                if (year == DateTime.Now.Year && month == DateTime.Now.Month && day > DateTime.Now.Day)
                {
                    dobValidation.Visible = true;
                    return;
                }

                dobValidation.Visible = false;

                var cardNumber = tbxCardNumber.Text;
                var CVN = tbxCVN.Text;
                var expiryMonth = tbxExpiryMonth.Text;
                var expiryYear = tbxExpiryYear.Text;

                string commandText = $@"
    INSERT INTO [dbo].[Student]
           ([FirstName]
           ,[LastName]
           ,[Email]
           ,[MobileNumber]
           ,[DOB]
           ,[Password])
     VALUES
           ('{fName}'
           ,'{lName}'
           ,'{eMail}'
           ,'{mobNo}'
           ,'{dob}'
           ,'{password}')

    DECLARE @ID AS INT = SCOPE_IDENTITY()

	INSERT INTO [dbo].[Card]
           ([StudentId]
           ,[CardNo]
           ,[CVN]
           ,[ExpiryDate])
     VALUES
           (@ID
           ,'{cardNumber}'
           ,'{CVN}'
           ,'{expiryMonth}/{expiryYear}')";

                using (SqlConnection conn = new SqlConnection(Constants.CONN_STRING))
                using (SqlCommand cmd = new SqlCommand(commandText, conn))
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }

              

            }
            catch (Exception ef)
            {

                throw;
            }
        }
    }
}