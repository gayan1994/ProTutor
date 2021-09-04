using System;
using System.Data;
using System.Data.SqlClient;

namespace ProTutor
{
    public partial class TutorConversations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var tutorId = (int)Session["TutorId"];

            string commandText = @"SELECT S.[ID]
		                                 ,S.[FirstName] + ' ' + S.[LastName] AS Name
		                                 ,C.[LastMessageDate]
                                   FROM [TutorDb].[dbo].[Student] S
	                                INNER JOIN [TutorDb].[dbo].[Conversation] C ON S.[ID] = C.[StudentId]
                                   WHERE C.[TutorId] = " + tutorId + @"
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