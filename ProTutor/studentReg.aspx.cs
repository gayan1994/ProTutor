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
                var DOB = tbxDOB.Text;
                var password = tbxPass.Text;
                

                string connectionString = @"Data Source=.;Initial Catalog=TutorDb;Integrated Security=True";

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
           ,NULL
           ,'{password}')";

                using (SqlConnection conn = new SqlConnection(connectionString))
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