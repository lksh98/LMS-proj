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
    public partial class returnbooksfromstaff : System.Web.UI.Page
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
                lst.Add(new ViewParam() { Name = "@flag", Value = "L" });
                DS = DM.View.GetDataSet("[L_returnbooksfromstaff_get]", lst);
                if (DS.Tables.Count > 1 && DS.Tables[1].Rows.Count > 0)
                {
                    if (DS.Tables[1].Rows[0][0].ToString() != "")
                    {
                        txt_rdate.Value = DateTime.Now.AddDays(Convert.ToDouble(DS.Tables[1].Rows[0][0].ToString())).ToString("dd/MM/yyyy");
                    }
                }
            }
        }

      

       

        [WebMethod]
        public static string getStaffDetails(string StaffID)
        {
            List<ViewParam> _lst = new List<ViewParam>();
            DataSet ds = new DataSet();
            DataManager dm = new DataManager();
            _lst.Add(new ViewParam() { Name = "@flag", Value = "L" });
            _lst.Add(new ViewParam() { Name = "@StaffID", Value = StaffID });
            ds = dm.View.GetDataSet("L_returnbooksfromstaff_get", _lst);
            return Common.ConverDatasetToJson(ds);
        }

        [WebMethod]
        public static string getBookDetails(string bookid, string StaffID)
        {
            List<ViewParam> _lst = new List<ViewParam>();
            DataSet ds = new DataSet();
            DataManager dm = new DataManager();
            _lst.Add(new ViewParam() { Name = "@bookid", Value = bookid });
            _lst.Add(new ViewParam() { Name = "@StaffID", Value = StaffID });
            ds = dm.View.GetDataSet("L_returnbooksfromstaff_get", _lst);
            return Common.ConverDatasetToJson(ds);
        }
        

        [WebMethod]
        public static string getIssuedBooks(string StaffID)
        {
            List<ViewParam> _lst = new List<ViewParam>();
            DataSet ds = new DataSet();
            DataManager dm = new DataManager();
            _lst.Add(new ViewParam() { Name = "@StaffID", Value = StaffID });
            ds = dm.View.GetDataSet("L_returnbooksfromstaff_get", _lst);
            return Common.ConverDatasetToJson(ds);
        }


        [WebMethod]
        public static string saveBook(string issueID, string remark, string fine)
        {
            List<ViewParam> _lst = new List<ViewParam>();
            DataSet ds = new DataSet();
            DataManager dm = new DataManager();
            _lst.Add(new ViewParam() { Name = "@issueID", Value = issueID });
            if(remark!="")
            _lst.Add(new ViewParam() { Name = "@remark", Value = remark });
            if(fine!="")
            _lst.Add(new ViewParam() { Name = "@fine", Value = fine });
            _lst.Add(new ViewParam() { Name = "@usrID", Value = Common.Decrypt(HttpContext.Current.Request.Cookies["LibID"].Value, true) });
            ds = dm.View.GetDataSet("L_returnbooksfromstaff_save", _lst);
            return Common.ConverDatasetToJson(ds);
        }

    }


}