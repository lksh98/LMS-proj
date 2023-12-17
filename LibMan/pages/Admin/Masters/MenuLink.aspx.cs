using GS.Common;
using GS.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibMan.pages.Admin.Masters
{
    public partial class MenuLink : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CheckUser ChU = new CheckUser();
                string LibID = string.Empty, Libname = string.Empty, type = string.Empty;
                if (Request.Cookies["LibID"] != null)
                    LibID = Request.Cookies["LibID"].Value;
                if (Request.Cookies["LibName"] != null)
                    Libname = Request.Cookies["LibName"].Value;
                if (Request.Cookies["LibType"] != null)
                    type = Request.Cookies["LibType"].Value;
                int check = ChU.Valid(LibID, Libname, type);


                if (check == 1)
                {
                    Response.Redirect("~/default.aspx");
                }
                DataManager DM = new DataManager();
                List<ViewParam> lst = new List<ViewParam>();
                DataSet DS = new DataSet();
                lst.Add(new ViewParam() { Name = "@flag", Value = 'L' });
                DS = DM.View.GetDataSet("l_MenuLink_get", lst);
                if (DS != null)
                {
                    ddl_Profile.DataSource = DS;
                    ddl_Profile.DataValueField = "UserRoleKid";
                    ddl_Profile.DataTextField = "UserRoleName";
                    ddl_Profile.DataBind();
                }
                ddl_Profile.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        protected void btn_unlink_Click(object sender, EventArgs e)
        {
            if (hdn_LinkID.Value != "")
            {
                DataManager DM = new DataManager();
                List<ViewParam> lst = new List<ViewParam>();
                DataSet DS = new DataSet();
                lst.Add(new ViewParam() { Name = "@flag", Value = 'U' });
                lst.Add(new ViewParam() { Name = "@profileID", Value = ddl_Profile.SelectedValue });
                lst.Add(new ViewParam() { Name = "@usrid", Value = Common.Decrypt(Request.Cookies["LibID"].Value,true) });
                lst.Add(new ViewParam() { Name = "@id", Value = hdn_LinkID.Value });

                DS = DM.View.GetDataSet("l_MenuLink_save", lst);
                if (DS != null && DS.Tables.Count>0 && DS.Tables[0].Rows.Count > 0) 
                {
                    ScriptManager.RegisterStartupScript(this.Page, GetType(), Guid.NewGuid().ToString(), "Unlink();", true);
                }
            }
        }

        protected void btn_link_Click(object sender, EventArgs e)
        {
            if (hdn_UnlinkID.Value != "")
            {
                DataManager DM = new DataManager();
                List<ViewParam> lst = new List<ViewParam>();
                DataSet DS = new DataSet();
                lst.Add(new ViewParam() { Name = "@flag", Value = 'L' });
                lst.Add(new ViewParam() { Name = "@profileID", Value = ddl_Profile.SelectedValue });
                lst.Add(new ViewParam() { Name = "@usrid", Value = Common.Decrypt(Request.Cookies["LibID"].Value, true) });
                lst.Add(new ViewParam() { Name = "@id", Value = hdn_UnlinkID.Value });

                DS = DM.View.GetDataSet("l_MenuLink_save", lst);
                if (DS != null && DS.Tables.Count > 0 && DS.Tables[0].Rows.Count > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, GetType(), Guid.NewGuid().ToString(), "Link();", true);
                }
            }
        }
    }
}