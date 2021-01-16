using ProTutor.Helpers;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics.SymbolStore;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProTutor
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var email = tbxEmail.Text;
            var password = tbxPassword.Text;
            using (var connection = new SqlConnection(Constants.CONN_STRING))
            using (var command = new SqlCommand($@"

SELECT Id, Email, Password, 'Student' AS Role FROM Student 
WHERE Email = '{email}'

UNION

SELECT Id, Email, Password, 'Tutor' AS Role FROM Tutor 
WHERE Email = '{email}'", connection))
            {
                connection.Open();

                var passwordHash = CryptoHelper.GetHashString(password);

                var isPasswordValid = false;

                using (var reader = command.ExecuteReader())
                {
                    int id = 0;
                    string role = "";

                    if (reader.Read()) // Don't assume we have any rows.
                    {
                        id = reader.GetInt32(0);
                        string passwordHashDB = reader.GetString(2);
                        role = reader.GetString(3);
                        
                        if(passwordHash == passwordHashDB)
                        {
                            isPasswordValid = true;
                        }
                    }

                    if (!isPasswordValid)
                    {
                        passValidation.Visible = true;
                        return;
                    }
                   
                    Session["Role"] = role;

                    if (role == "Student")
                    {
                        Session["StudentId"] = id;
                    }
                    else
                    {
                        Session["TutorId"] = id;
                    }

                    //To do: redirect to main page
                }
            }
        }
    }
}