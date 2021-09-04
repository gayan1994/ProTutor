using System;
using System.Data;
using System.Data.SqlClient;

namespace ProTutor
{
    public partial class ReceivedLessonRequests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var tutorId = (int)Session["TutorId"];

            string commandText = @"SELECT LR.[ID]
                                         ,LR.[StudentId]
                                         ,S.[FirstName] + ' ' + S.[LastName] AS StudentName
                                         ,LR.[StudentId]
                                         ,LR.[TutorId]
                                         ,LR.[Start]
                                         ,LR.[End]
                                         ,LR.[HourlyRate]
                                         ,LR.[Status]
                                   FROM [TutorDb].[dbo].[LessonRequest] LR
	                                INNER JOIN [dbo].[Student] S ON LR.[StudentId] = S.[ID]
                                   WHERE LR.[TutorId] = " + tutorId;

            var table = new DataTable();

            SqlConnection conn = new SqlConnection(Constants.CONN_STRING);
            var da = new SqlDataAdapter(commandText, conn);

            da.Fill(table);

            rptRequests.DataSource = table;
            rptRequests.DataBind();
        }
    }
}