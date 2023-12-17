using GS.Common;
using GS.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibMan.pages.Admin.Masters
{
    public partial class lnkbookshelf : System.Web.UI.Page
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
                DS = DM.View.GetDataSet("L_lnkbookshelf_get", lst);
                if (DS != null && DS.Tables.Count > 0)
                {
                    ddl_rack.DataSource = DS.Tables[0];
                    ddl_rack.DataValueField = "rack_kid";
                    ddl_rack.DataTextField = "rack_name";
                    ddl_rack.DataBind();
                }
                ddl_rack.Items.Insert(0, new ListItem("---Select---", "0"));
                ddl_shlef.Items.Insert(0, new ListItem("---Select---", "0"));


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
                lst.Add(new ViewParam() { Name = "@shelf", Value = ddl_shlef.SelectedValue });
                lst.Add(new ViewParam() { Name = "@id", Value = hdn_LinkID.Value });
                DS = DM.View.GetDataSet("L_lnkbookshelf_save", lst);
                if (DS != null && DS.Tables.Count > 0 && DS.Tables[0].Rows.Count > 0)
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
                lst.Add(new ViewParam() { Name = "@id", Value = hdn_UnlinkID.Value });
                lst.Add(new ViewParam() { Name = "@shelf", Value = ddl_shlef.SelectedValue });
                DS = DM.View.GetDataSet("L_lnkbookshelf_save", lst);
                if (DS != null && DS.Tables.Count > 0 && DS.Tables[0].Rows.Count > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, GetType(), Guid.NewGuid().ToString(), "Link();", true);
                }
            }
        }

        protected void ddl_rack_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataManager DM = new DataManager();
            List<ViewParam> lst = new List<ViewParam>();
            DataSet DS = new DataSet();

            lst.Add(new ViewParam() { Name = "@flag", Value = 'R' });
            lst.Add(new ViewParam() { Name = "@id", Value = ddl_rack.SelectedValue });
            DS = DM.View.GetDataSet("[L_lnkbookshelf_get]", lst);
            if (DS != null)
            {
                if (DS.Tables.Count > 0)
                {
                    ddl_shlef.DataSource = DS.Tables[0];
                    ddl_shlef.DataValueField = "shelf_kid";
                    ddl_shlef.DataTextField = "shelf_name";
                    ddl_shlef.DataBind();
                    ddl_shlef.Items.Insert(0, new ListItem("---Select---", "0"));
                }
            }
            ScriptManager.RegisterStartupScript(this.Page, GetType(), Guid.NewGuid().ToString(), "tableBindlab();", true);
        }


        [WebMethod]
        public static string linkUnlink(string shelfID, string id, string flag)
        {
            List<ViewParam> _lst = new List<ViewParam>();
            DataSet ds = new DataSet();
            DataManager dm = new DataManager();
            _lst.Add(new ViewParam() { Name = "@flag", Value = flag });
            _lst.Add(new ViewParam() { Name = "@id", Value = id });
            _lst.Add(new ViewParam() { Name = "@shelf", Value = shelfID });
            ds = dm.View.GetDataSet("L_lnkbookshelf_save", _lst);
            return Common.ConverDatasetToJson(ds);
        }
        [WebMethod]
        public static string GetBookByShelf(string shelfID)
        {
            List<ViewParam> _lst = new List<ViewParam>();
            DataSet ds = new DataSet();
            DataManager dm = new DataManager();
            _lst.Add(new ViewParam() { Name = "@id", Value = shelfID });
            ds = dm.View.GetDataSet("L_lnkbookshelf_get", _lst);
            return Common.ConverDatasetToJson(ds);
        }
    }
}