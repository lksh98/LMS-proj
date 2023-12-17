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
    public partial class settings : System.Web.UI.Page
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
                DS = DM.View.GetDataSet("[L_appsettings_get]", lst);
                if (DS != null && DS.Tables.Count > 0)
                {
                    txt_deptdays.Value = DS.Tables[0].Rows[0]["par_maxdeptdays"].ToString();
                    txt_stuDays.Value = DS.Tables[0].Rows[0]["par_maxstudentdays"].ToString();
                    txt_staffdays.Value = DS.Tables[0].Rows[0]["par_maxstaffdays"].ToString();
                    txt_deptno.Value = DS.Tables[0].Rows[0]["par_maxbooktodepartment"].ToString();
                    txt_studentNo.Value = DS.Tables[0].Rows[0]["par_maxbooktostudent"].ToString();
                    txt_staffNo.Value = DS.Tables[0].Rows[0]["par_maxbooktostaff"].ToString();
                    txt_college.Value = DS.Tables[0].Rows[0]["par_collegeName"].ToString();
                    txt_Address.Value = DS.Tables[0].Rows[0]["par_address"].ToString();
                    txt_mobNo.Value = DS.Tables[0].Rows[0]["par_contact"].ToString();
                    txt_email.Value = DS.Tables[0].Rows[0]["par_email"].ToString();
                }
            }
        }

        protected void btn_save_Click(object sender, ImageClickEventArgs e)
        {
            string num = string.Empty;
            if (txt_deptdays.Value != "")
                lst.Add(new ViewParam() { Name = "@deptDays", Value = txt_deptdays.Value });
            if (txt_stuDays.Value != "")
                lst.Add(new ViewParam() { Name = "@stuDays", Value = txt_stuDays.Value });
            if (txt_staffdays.Value != "")
                lst.Add(new ViewParam() { Name = "@staffDays", Value = txt_staffdays.Value });
            if (txt_deptno.Value != "")
                lst.Add(new ViewParam() { Name = "@deptNo", Value = txt_deptno.Value });
            if (txt_studentNo.Value != "")
                lst.Add(new ViewParam() { Name = "@studentNo", Value = txt_studentNo.Value });
            if (txt_staffNo.Value != "")
                lst.Add(new ViewParam() { Name = "@staffNo", Value = txt_staffNo.Value });

            lst.Add(new ViewParam() { Name = "@usrID", Value = Common.Decrypt(Request.Cookies["LibID"].Value, true) });
            DS = DM.View.GetDataSet("[L_appsettings_save]", lst);
            if (DS != null && DS.Tables.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, GetType(), Guid.NewGuid().ToString(), "Save('" + DS.Tables[0].Rows[0][0].ToString() + "')", true);
            }
        }



    }
}