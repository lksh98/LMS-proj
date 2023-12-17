using GS.Common;
using GS.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Services;
using System.Net;
using System.Drawing.Imaging;
using System.Web.Script.Serialization;
using System.Xml.Linq;

namespace LibMan.pages.Reports
{
    public partial class departmenthistoryreport : System.Web.UI.Page
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
                DataManager DM = new DataManager();
                List<ViewParam> lst = new List<ViewParam>();
                DataSet DS = new DataSet();
                DS = DM.View.GetDataSet("[L_departmenthistoryreport_get]", lst);
                if (DS != null)
                {
                    if (DS.Tables.Count > 0)
                    {
                        ddl_dept.DataSource = DS.Tables[0];
                        ddl_dept.DataValueField = "Dept_kid";
                        ddl_dept.DataTextField = "Dept_name";
                        ddl_dept.DataBind();
                    }
                    ddl_dept.Items.Insert(0, new ListItem("---Select---", "0"));



                }
            }
        }
         


        [WebMethod]
        public static string getIssuedBooks(string id)
        {
            List<ViewParam> _lst = new List<ViewParam>();
            DataSet ds = new DataSet();
            DataManager dm = new DataManager();
            _lst.Add(new ViewParam() { Name = "@id", Value = id });
            ds = dm.View.GetDataSet("L_departmenthistoryreport_get", _lst);
            return Common.ConverDatasetToJson(ds);
        }
        

         

    }


}