using System;
using System.Data;
using System.Data.SqlClient;

namespace ProTutor
{
    public partial class StudentAds : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var studentId = (int)Session["StudentId"];

            string commandText = @"SELECT [ID]
                                         ,[Title]
                                         ,[Description]
                                         ,[CreatedDate]
                                         ,[IsActive]
                                   FROM [TutorDb].[dbo].[Advertisement]
                                   WHERE [studentId] = " + studentId + @"
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