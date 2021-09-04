using System;
using System.Data;
using System.Data.SqlClient;

namespace ProTutor
{
    public partial class SentLessonRequests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var studentId = (int)Session["StudentId"];

            string commandText = @"SELECT LR.[ID]
                                         ,T.[FirstName] + ' ' + T.[LastName] AS TutorName
                                         ,LR.[TutorId]
                                         ,LR.[StudentId]
                                         ,LR.[TutorId]
                                         ,LR.[Start]
                                         ,LR.[End]
                                         ,LR.[HourlyRate]
                                         ,LR.[Status]
                                   FROM [TutorDb].[dbo].[LessonRequest] LR
	                                INNER JOIN [dbo].[Tutor] T ON LR.[TutorId] = T.[ID]
                                   WHERE LR.[StudentId] = " + studentId;

            var table = new DataTable();

            SqlConnection conn = new SqlConnection(Constants.CONN_STRING);
            var da = new SqlDataAdapter(commandText, conn);

            da.Fill(table);

            rptRequests.DataSource = table;
            rptRequests.DataBind();

        }
    }
}