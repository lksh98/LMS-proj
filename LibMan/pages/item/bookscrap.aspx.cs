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

namespace LibMan.pages.item
{
    public partial class bookscrap : System.Web.UI.Page
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
            string num = string.Empty;
            lst.Add(new ViewParam() { Name = "@remarks", Value = txt_descriptions.Value });
            lst.Add(new ViewParam() { Name = "@stockID", Value = hdn_bookStock.Value });
            lst.Add(new ViewParam() { Name = "@usrID", Value = Common.Decrypt(Request.Cookies["LibID"].Value, true) });
            DS = DM.View.GetDataSet("[L_bookscrap_save]", lst);
            if (DS != null && DS.Tables.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, GetType(), Guid.NewGuid().ToString(), "Save('" + DS.Tables[0].Rows[0][0].ToString() + "','" + DS.Tables[0].Rows[0][1].ToString() + "')", true);
            }
        }




        [WebMethod]
        public static string getBookDetails(string bookid)
        {
            List<ViewParam> _lst = new List<ViewParam>();
            DataSet ds = new DataSet();
            DataManager dm = new DataManager();
            _lst.Add(new ViewParam() { Name = "@bookid", Value = bookid });
            ds = dm.View.GetDataSet("L_bookscrap_get", _lst);
            return Common.ConverDatasetToJson(ds);
        }


        [WebMethod]
        public static string getScrapBooks( )
        {
            List<ViewParam> _lst = new List<ViewParam>();
            DataSet ds = new DataSet();
            DataManager dm = new DataManager(); 
            ds = dm.View.GetDataSet("L_bookscrap_get", _lst);
            return Common.ConverDatasetToJson(ds);
        }

        [WebMethod]
        public static string saveBook(string bookid, string remarks)
        {
            List<ViewParam> _lst = new List<ViewParam>();
            DataSet ds = new DataSet();
            DataManager dm = new DataManager();
            _lst.Add(new ViewParam() { Name = "@stockID", Value = bookid });
            _lst.Add(new ViewParam() { Name = "@remarks", Value = remarks });
            _lst.Add(new ViewParam() { Name = "@usrID", Value = Common.Decrypt(HttpContext.Current.Request.Cookies["LibID"].Value, true) });
            ds = dm.View.GetDataSet("L_bookscrap_save", _lst);
            return Common.ConverDatasetToJson(ds);
        }

    }


}