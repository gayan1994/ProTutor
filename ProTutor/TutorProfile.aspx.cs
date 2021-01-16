using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProTutor
{
    public partial class TutorProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["TutorId"];

            string commandText = $@"SELECT [ID]
      ,[FirstName] + ' '+ [LastName] AS Name
      ,[HighestQualificaton]
      ,[School]
      ,[MainSubject]
      ,[Curriculum]
      ,[ProfilePicture]
      ,[Summary]
      ,[HourlyRate]
  FROM [TutorDb].[dbo].[Tutor]
  WHERE ID = {id}";

            using (SqlConnection conn = new SqlConnection(Constants.CONN_STRING))
            using (var command = new SqlCommand(commandText, conn))
            {
                conn.Open();

                using (var reader = command.ExecuteReader())
                {
                    if (reader.Read()) 
                    {
                        if (!reader.IsDBNull(1))
                        {
                            string name = reader.GetString(1);
                            lblName.Text = name; 
                        }

                        if (!reader.IsDBNull(2))
                        {
                            string highestQualification = reader.GetString(2);
                            lblQualification.Text = highestQualification; 
                        }

                        if (!reader.IsDBNull(3))
                        {
                            string school = reader.GetString(3);
                            lblSchool.Text = school; 
                        }

                        if (!reader.IsDBNull(4))
                        {
                            string subject = reader.GetString(4);
                            lblSubject.Text = subject; 
                        }

                        if (!reader.IsDBNull(5))
                        {
                            string curriculum = reader.GetString(5);
                            lblCurriculum.Text = curriculum; 
                        }

                        if (!reader.IsDBNull(6))
                        {
                            string profilePic = reader.GetString(6);
                            imgProPic.ImageUrl = $"..{profilePic}";
                        }

                        if (!reader.IsDBNull(7))
                        {
                            string summary = reader.GetString(7);
                            lblSummary.Text = summary; 
                        }

                        if (!reader.IsDBNull(8))
                        {
                            decimal hourlyRate = reader.GetDecimal(8);
                            lblHourlyRate.Text = hourlyRate.ToString(); 
                        }

                        
                    }

                    
                }
            }
        }

        protected void btnRequestLesson_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["TutorId"];
            Response.Redirect($"AddLessonRequest.aspx?TutorId={id}");
        }
    }
}