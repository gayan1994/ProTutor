using System;
using System.Web.UI;

namespace ProTutor
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnLogout.Visible = false;

            var sessionItem = Session["IsLoggedIn"];

            if (sessionItem == null)
            {
                return;
            }

            var isLoggedIn = (bool)sessionItem;

            if (isLoggedIn)
            {
                linkLogin.Visible = false;
                linkRegister.Visible = false;
                btnLogout.Visible = true;
            }

        }

        public void ButtonLogout(object sender, EventArgs e)
        {
            Session.Abandon();

            Response.Redirect("~/Login.aspx");
        }

    }
}