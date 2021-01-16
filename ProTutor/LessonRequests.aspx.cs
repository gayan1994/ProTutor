using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProTutor
{
    public partial class LessonRequests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var tutorId = (int)Session["TutorId"];

            string commandText = $@"SELECT LR.[ID]
      ,S.FirstName + ' ' + S.LastName AS StudentName
      ,[StudentId]
      ,[TutorId]
      ,[Start]
      ,[End]
      ,[HourlyRate]
      ,[Status]
  FROM [TutorDb].[dbo].[LessonRequest] LR
	INNER JOIN [dbo].[Student] S ON LR.StudentId = S.ID
  WHERE LR.TutorId = {tutorId}";

            var table = new DataTable();

            using (SqlConnection conn = new SqlConnection(Constants.CONN_STRING))
            using (var da = new SqlDataAdapter(commandText, conn))
            {
                da.Fill(table);
            }

            rptRequests.DataSource = table;
            rptRequests.DataBind();
        }
    }
}