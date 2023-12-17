using GS.Common;
using GS.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace LibMan.pages.Admin.Masters
{
    public partial class fine : System.Web.UI.Page
    {
        DataManager DM = new DataManager();
        List<ViewParam> lst = new List<ViewParam>();
        DataSet DS = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
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
            if (!IsPostBack)
            {
            }
        }

        protected void btn_save_Click(object sender, ImageClickEventArgs e)
        {
            if (hdn_id.Value != "")
                lst.Add(new ViewParam() { Name = "@id", Value = hdn_id.Value });
            lst.Add(new ViewParam() { Name = "@ftype", Value = ddl_ftype.SelectedValue });
            if (ddl_ftype.SelectedValue == "F")
            {
                if (txt_Amount.Value != "" && txt_Amount.Value != "0")
                    lst.Add(new ViewParam() { Name = "@amount", Value = txt_Amount.Value });
            }
            else
            {
                string[] data = hdn_interval.Value.Split('~');
                XDocument xdoc = new XDocument();
                xdoc.Add(new XElement("root"));
                foreach (var dd in data)
                {
                    string[] interval = dd.Split(';');
                    XElement ele = xdoc.Element("root");
                    ele.Add(new XElement("child", new XElement("from", interval[0])
                        , new XElement("to", interval[1])
                        , new XElement("amount", interval[2])
                        ));
                }
                lst.Add(new ViewParam() { Name = "@data", Value = xdoc.ToString() });
            }
            lst.Add(new ViewParam() { Name = "@usrID", Value = Common.Decrypt(Request.Cookies["LibID"].Value, true) });
            DS = DM.View.GetDataSet("[L_Fine_save]", lst);
            if (DS != null && DS.Tables.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, GetType(), Guid.NewGuid().ToString(), "Save('" + DS.Tables[0].Rows[0][0].ToString() + "')", true);
            }
        }


        [WebMethod]
        public static string GetFineByID(string id)
        {
            List<ViewParam> lst = new List<ViewParam>();
            DataSet DS = new DataSet();
            DataManager DM = new DataManager();
            lst.Add(new ViewParam() { Name = "@id", Value = id });
            DS = DM.View.GetDataSet("L_Fine_get", lst);
            return Common.ConverDatasetToJson(DS);
        }
        [WebMethod]
        public static string DeleteUpdateFine(string id, string flag, bool status)
        {
            List<ViewParam> lst = new List<ViewParam>();
            DataSet DS = new DataSet();
            DataManager DM = new DataManager();
            lst.Add(new ViewParam() { Name = "@flag", Value = flag });
            lst.Add(new ViewParam() { Name = "@id", Value = id });
            lst.Add(new ViewParam() { Name = "@status", Value = status });
            lst.Add(new ViewParam() { Name = "@usrID", Value = Common.Decrypt(HttpContext.Current.Request.Cookies["LibID"].Value, true) });
            DS = DM.View.GetDataSet("[L_Fine_save]", lst);

            return Common.ConverDatasetToJson(DS);
        }

        [WebMethod]
        public static string getAllFines()
        {
            List<ViewParam> _lst = new List<ViewParam>();
            DataSet ds = new DataSet();
            DataManager dm = new DataManager();
            ds = dm.View.GetDataSet("L_Fine_get", _lst);
            return Common.ConverDatasetToJson(ds);
        }


    }
}