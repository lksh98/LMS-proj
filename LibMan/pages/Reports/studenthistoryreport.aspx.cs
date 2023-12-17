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
    public partial class studenthistoryreport : System.Web.UI.Page
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
         

        [WebMethod]
        public static string getStudentDetails(string stid)
        {
            List<ViewParam> _lst = new List<ViewParam>();
            DataSet ds = new DataSet();
            DataManager dm = new DataManager();
            _lst.Add(new ViewParam() { Name = "@stid", Value = stid });
            ds = dm.View.GetDataSet("L_studenthistoryreport_get", _lst);
            return Common.ConverDatasetToJson(ds);
        }
        

        [WebMethod]
        public static string getIssuedBooks(string id)
        {
            List<ViewParam> _lst = new List<ViewParam>();
            DataSet ds = new DataSet();
            DataManager dm = new DataManager();
            _lst.Add(new ViewParam() { Name = "@id", Value = id });
            ds = dm.View.GetDataSet("L_studenthistoryreport_get", _lst);
            return Common.ConverDatasetToJson(ds);
        }
        

         

    }


}