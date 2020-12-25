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

SELECT Email, Password, 'Student' AS Role FROM Student 
WHERE Email = '{email}'

UNION

SELECT Email, Password, 'Tutor' AS Role FROM Tutor 
WHERE Email = '{email}'", connection))
            {
                connection.Open();

                var passwordHash = CryptoHelper.GetHashString(password);

                var isPasswordValid = false;

                using (var reader = command.ExecuteReader())
                {
                    if (reader.Read()) // Don't assume we have any rows.
                    {
                        string passwordHashDB = reader.GetString(1);
                        
                        if(passwordHash == passwordHashDB)
                        {
                            isPasswordValid = true;
                        }
                    }

                    if (!isPasswordValid)
                    {
                        passValidation.Visible = true;
                    }
                    //To do: redirect to main page
                }
            }
        }
    }
}