using System;
using System.Data;
using System.Data.SqlClient;

namespace ProTutor
{
    public partial class ViewAds : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string commandText = @"SELECT S.[ID],
                                          S.[FirstName] + ' ' +S.[LastName] AS Name, 
                                          A.[Title],A.[Description],A.[CreatedDate],A.[IsActive]
                                   FROM [TutorDb].[dbo].[Advertisement] A
                                    INNER JOIN [TutorDb].[dbo].[Student] S ON S.[ID] = A.[StudentId]
                                   ORDER BY [CreatedDate] DESC";

            var table = new DataTable();

            SqlConnection conn = new SqlConnection(Constants.CONN_STRING);
            var da = new SqlDataAdapter(commandText, conn);

            da.Fill(table);

            rptAds.DataSource = table;
            rptAds.DataBind();

        }
    }
}