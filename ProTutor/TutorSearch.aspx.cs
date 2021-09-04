using System;
using System.Data;
using System.Data.SqlClient;

namespace ProTutor
{
    public partial class TutorSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RadioButtonList1.SelectedValue = "";
                RadioButtonList2.SelectedValue = "";
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            var name = tbxName.Text;
            var highestQualification = RadioButtonList1.SelectedValue;
            var mainSubject = tbxSubject.Text;
            var curriculum = tbxCurriculum.Text;
            var hometown = tbxLocation.Text;
            var hourlyRate = tbxHourlyRate.Text;
            var sortBy = RadioButtonList2.SelectedValue;

            var orderBy = "[ID] ASC";
            switch (sortBy)
            {
                case "Name":
                    orderBy = "[FirstName],[LastName] ASC";
                    break;

                case "Hourly Rate":
                    orderBy = "[HourlyRate] ASC";
                    break;
            }

            if (!double.TryParse(hourlyRate, out double rate))
            {
                hourlyRate = "NULL";
            }

            string commandText = @"SELECT [ID]
                                         ,[FirstName] + ' ' + [LastName] AS Name
                                         ,[HighestQualification]
                                         ,[MainSubject]
                                         ,[Curriculum]
                                         ,[Hometown]
                                         ,[HourlyRate]
                                   FROM [TutorDb].[dbo].[Tutor]
                                   WHERE (FirstName + ' ' + LastName LIKE '%" + name + "%' OR '" + name + @"' = '')
	                                 AND (HighestQualification = '" + highestQualification + "' OR '" + highestQualification + @"' = '')
	                                 AND (MainSubject = '" + mainSubject + "' OR '" + mainSubject + @"' = '')
	                                 AND (Curriculum = '" + curriculum + "' OR '" + curriculum + @"' ='')
                                     AND (Hometown = '" + hometown + "' OR '" + hometown + @"' ='')
	                                 AND (HourlyRate <= " + hourlyRate + " OR " + hourlyRate + @" IS NULL)
                                   ORDER BY " + orderBy;

            var table = new DataTable();

            SqlConnection conn = new SqlConnection(Constants.CONN_STRING);
            var da = new SqlDataAdapter(commandText, conn);

            da.Fill(table);

            rptTutors.DataSource = table;
            rptTutors.DataBind();
        }
    }
}