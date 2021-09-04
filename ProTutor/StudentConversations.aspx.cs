using System;
using System.Data;
using System.Data.SqlClient;

namespace ProTutor
{
    public partial class StudentConversations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var studentId = (int)Session["StudentId"];

            string commandText = @"SELECT T.[ID]
		                                 ,T.[FirstName] + ' ' + T.[LastName] AS Name
		                                 ,C.[LastMessageDate]
                                   FROM [TutorDb].[dbo].[Tutor] T
	                                INNER JOIN [TutorDb].[dbo].[Conversation] C ON T.[ID] = C.[TutorId]
                                   WHERE C.[StudentId] = " + studentId + @"
                                   ORDER BY C.[LastMessageDate] DESC";

            var table = new DataTable();

            SqlConnection conn = new SqlConnection(Constants.CONN_STRING);
            var da = new SqlDataAdapter(commandText, conn);

            da.Fill(table);

            rptConversations.DataSource = table;
            rptConversations.DataBind();
        }
    }
}