using System;
using System.Web.UI;

namespace ProTutor
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["Role"] == "Student")
            {
                Response.Redirect("StudentHome");
            }

            if ((string)Session["Role"] == "Tutor")
            {
                Response.Redirect("TutorHome");
            }
        }
    }
}