using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProTutor
{
    public partial class StudentProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["StudentId"];

            string commandText = $@"SELECT [ID]
      ,[FirstName] + ' '+ [LastName] AS Name
      ,[Email]
      ,[MobileNumber]
      ,[DOB]
  FROM [TutorDb].[dbo].[Student] 
  WHERE ID = {id}";

            using (SqlConnection conn = new SqlConnection(Constants.CONN_STRING))
            using (var command = new SqlCommand(commandText, conn))
            {
                conn.Open();

                using (var reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        if (!reader.IsDBNull(1))
                        {
                            string name = reader.GetString(1);
                            lblName.Text = name;
                        }

                        if (!reader.IsDBNull(2))
                        {
                            string email = reader.GetString(2);
                            lblEmail.Text = email;
                        }

                        if (!reader.IsDBNull(3))
                        {
                            string mobileNumber = reader.GetString(3);
                            lblMobileNumber.Text = mobileNumber;
                        }

                        if (!reader.IsDBNull(4))
                        {
                            string dob = reader.GetString(4);
                            lblDOB.Text = dob;
                        }
                    }


                }
            }
        }
    }
}