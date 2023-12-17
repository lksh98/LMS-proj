using GS.Common;
using GS.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;

namespace LibMan.pages.User
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    DataManager DM = new DataManager();
            //    List<ViewParam> lst = new List<ViewParam>();
            //    DataSet DS = new DataSet();
            //    lst.Add(new ViewParam() { Name = "@usrID", Value = Common.Decrypt(Request.Cookies["LibID"].Value, true) });
            //    DS = DM.View.GetDataSet("l_Admin_Get", lst);
            //    if (DS != null && DS.Tables.Count > 0)
            //    {
            //        string Ds = Common.ConverDatasetToJson(DS);

            //        ScriptManager.RegisterStartupScript(this.Page, GetType(), Guid.NewGuid().ToString(), "Dashcount('" + Ds + "');", true);
            //    }
            //}
        }
    }
}