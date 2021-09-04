using System;
using System.Data;
using System.Data.SqlClient;

namespace ProTutor
{
    public partial class StudentMessages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int studentId = (int)Session["StudentId"];
            int tutorId = int.Parse(Request.QueryString["TutorId"]);

            //Create the hyperlink to the recipient's profile
            string commandText = @"SELECT [FirstName] + ' ' + [LastName] AS Name
                                   FROM [TutorDb].[dbo].[Tutor]
                                   WHERE [ID] = " + tutorId;

            SqlConnection conn = new SqlConnection(Constants.CONN_STRING);
            SqlCommand cmd = new SqlCommand(commandText, conn);

            conn.Open();

            var reader = cmd.ExecuteReader();
            reader.Read();

            string recipientName = reader.GetString(0);
            lnkRecipient.Text = recipientName;

            lnkRecipient.NavigateUrl = "~/TutorPublicProfile.aspx?TutorId=" + tutorId;

            conn.Close();

            //Retrieve the messages
            commandText = @"SELECT [Id], [Text], [Direction], [SentDate]  
                            FROM [TutorDb].[dbo].[Message]
                            WHERE [TutorId] = " + tutorId + " AND [StudentId] = " + studentId + @"
                            ORDER BY [SentDate] ASC";

            var table = new DataTable();

            conn = new SqlConnection(Constants.CONN_STRING);
            var da = new SqlDataAdapter(commandText, conn);

            da.Fill(table);

            rptMessages.DataSource = table;
            rptMessages.DataBind();

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            var studentId = (int)Session["StudentId"];
            var tutorId = int.Parse(Request.QueryString["TutorId"]);
            var text = tbxMessage.Text;
            var date = DateTime.Now;

            //Save the message

            string commandText = @" INSERT INTO [dbo].[Message] ([TutorId]
                                                                ,[StudentId]
                                                                ,[Text]
                                                                ,[Direction]
                                                                ,[SentDate])
                                                           VALUES
                                                                 (" + tutorId + @"
                                                                 ," + studentId + @"
                                                                 ,'" + text + @"'
                                                                 , 'StudentToTutor'
                                                                 ,'" + date + "')";

            SqlConnection conn = new SqlConnection(Constants.CONN_STRING);
            SqlCommand cmd = new SqlCommand(commandText, conn);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            //Check if a conversation of these two participants already exists
            commandText = @"SELECT [StudentId], [TutorId]
                            FROM [TutorDb].[dbo].[Conversation]
                            WHERE [StudentId] = " + studentId + " AND [TutorId] = " + tutorId;

            conn = new SqlConnection(Constants.CONN_STRING);
            cmd = new SqlCommand(commandText, conn);

            conn.Open();

            var reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                conn.Close();

                // Update the conversation

                commandText = @" UPDATE [TutorDb].[dbo].[Conversation]
                                 SET [LastMessageDate] = '" + date + @"'
                                 WHERE [StudentId] = " + studentId + " AND [TutorId] = " + tutorId;

                conn = new SqlConnection(Constants.CONN_STRING);
                cmd = new SqlCommand(commandText, conn);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            else
            {
                conn.Close();

                // Create the conversation

                commandText = @"INSERT INTO [TutorDb].[dbo].[Conversation]
                                                           ([TutorId]
                                                           ,[StudentId]
                                                           ,[LastMessageDate])
                                                      VALUES
                                                           (" + tutorId + @"
                                                           ," + studentId + @"
                                                           ,'" + date + "')";

                conn = new SqlConnection(Constants.CONN_STRING);
                cmd = new SqlCommand(commandText, conn);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            Response.Redirect(Request.RawUrl);
        }
    }
}