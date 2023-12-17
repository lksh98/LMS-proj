using System;
using System.Web;

namespace LibMan.pages.Admin.Dashboard
{
    public partial class Empty : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hdn_Type.Value = Common.Decrypt(Request.Cookies["LibType"].Value, true);
            hdn_currenturl.Value = HttpContext.Current.Request.Url.AbsoluteUri;
        }
    }
}