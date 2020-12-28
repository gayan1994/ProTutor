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
    public partial class TutorSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            var name = tbxName.Text;
            var highestQualification = RadioButtonList1.SelectedValue;
            var mainSubject = tbxSubject.Text;
            var curriculum = tbxCurriculum.Text;
            var hourlyRate = tbxHourlyRate.Text;

            if (!double.TryParse(hourlyRate, out double rate)) {
                hourlyRate = "NULL";
            }

            string commandText = $@"SELECT [ID]
      ,[FirstName] + ' ' + [LastName] AS Name
      ,[HighestQualificaton]
      ,[MainSubject]
      ,[Curriculum]
      ,[ProfilePicture]
      ,[HourlyRate]
  FROM [TutorDb].[dbo].[Tutor]
  WHERE (FirstName + ' ' + LastName LIKE '%'+'{name}'+'%' OR '{name}' = '')
	AND (HighestQualificaton = '{highestQualification}' OR '{highestQualification}' = '')
	AND (MainSubject = '{mainSubject}' OR '{mainSubject}' = '')
	AND (Curriculum = '{curriculum}' OR '{curriculum}' ='')
	AND (HourlyRate <= {hourlyRate} OR {hourlyRate} IS NULL)";

            var table = new DataTable();

            using (SqlConnection conn = new SqlConnection(Constants.CONN_STRING))
            using (var da = new SqlDataAdapter(commandText, conn))
            {
                da.Fill(table);
            }

            rptTutors.DataSource = table;
            rptTutors.DataBind();
        }
    }
}