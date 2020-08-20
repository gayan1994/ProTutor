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
                var password = Pass2.Text;
                var highestQualification = RadioButtonList1.SelectedValue;

                string connectionString = @"Data Source=.;Initial Catalog=TutorDb;Integrated Security=True";

                string commandText = $@"
    INSERT INTO [dbo].[Tutor]
           ([FirstName]
           ,[LastName]
           ,[Email]
           ,[MobileNumber]
           ,[DOB]
           ,[Password]
           ,[HighestQualificaton])
     VALUES
           ('{fName}'
           ,'{lName}'
           ,'{eMail}'
           ,'{mobNo}'
           ,NULL
           ,'{password}'
           ,'{highestQualification}')";

                using (SqlConnection conn = new SqlConnection(connectionString))
                using (SqlCommand cmd = new SqlCommand(commandText, conn))
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}