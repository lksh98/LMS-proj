using GS.Common;
using GS.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Web;
using System.Web.Services;
using System.Web.UI;

namespace LibMan.pages.Admin.Masters
{
    public partial class Supplier : System.Web.UI.Page
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
            if (hdn_id.Value != "")
                lst.Add(new ViewParam() { Name = "@id", Value = hdn_id.Value });
            if (txt_Address.Value != "")
                lst.Add(new ViewParam() { Name = "@address", Value = txt_Address.Value });
 
            if (txt_city.Value != "")
                lst.Add(new ViewParam() { Name = "@city", Value = txt_city.Value });
 
            if (txt_email.Value != "")
                lst.Add(new ViewParam() { Name = "@email", Value = txt_email.Value });
 
            if (txt_gstIN.Value != "")
                lst.Add(new ViewParam() { Name = "@gstIN", Value = txt_gstIN.Value });
 
            if (txt_landline.Value != "")
                lst.Add(new ViewParam() { Name = "@landline", Value = txt_landline.Value });
 
            if (txt_mobNo.Value != "")
                lst.Add(new ViewParam() { Name = "@mobNo", Value = txt_mobNo.Value });
 
            if (txt_pincode.Value != "")
                lst.Add(new ViewParam() { Name = "@pincode", Value = txt_pincode.Value });
  
            if (txt_state.Value != "")
                lst.Add(new ViewParam() { Name = "@state", Value = txt_state.Value });
  
            if (txt_supp.Value != "")
                lst.Add(new ViewParam() { Name = "@supp", Value = txt_supp.Value });

            lst.Add(new ViewParam() { Name = "@usrID", Value = Common.Decrypt(Request.Cookies["LibID"].Value, true) });
            DS = DM.View.GetDataSet("[L_Supplier_save]", lst);
            if (DS != null && DS.Tables.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, GetType(), Guid.NewGuid().ToString(), "Save('" + DS.Tables[0].Rows[0][0].ToString() + "')", true);
            }
        }

       
        [WebMethod]
        public static string GetSupplierByID(string id)
        {
            List<ViewParam> lst = new List<ViewParam>();
            DataSet DS = new DataSet();
            DataManager DM = new DataManager();
            lst.Add(new ViewParam() { Name = "@id", Value = id });
            DS = DM.View.GetDataSet("L_Supplier_get", lst);
            return Common.ConverDatasetToJson(DS);
        }
        [WebMethod]
        public static string DeleteUpdateSupplier(string id, string flag,  bool status)
        {
            List<ViewParam> lst = new List<ViewParam>();
            DataSet DS = new DataSet();
            DataManager DM = new DataManager();
            lst.Add(new ViewParam() { Name = "@flag", Value = flag });
            lst.Add(new ViewParam() { Name = "@id", Value = id });
            lst.Add(new ViewParam() { Name = "@status", Value = status });
            lst.Add(new ViewParam() { Name = "@usrID", Value = Common.Decrypt(HttpContext.Current.Request.Cookies["LibID"].Value,   true) });
            DS = DM.View.GetDataSet("[L_Supplier_save]", lst);
           
            return Common.ConverDatasetToJson(DS);
        }

        [WebMethod]
        public static string getAllSuppliers()
        {
            List<ViewParam> _lst = new List<ViewParam>();
            DataSet ds = new DataSet();
            DataManager dm = new DataManager();
            ds = dm.View.GetDataSet("L_Supplier_get", _lst);
            return Common.ConverDatasetToJson(ds);
        }


    }
}