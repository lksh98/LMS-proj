using GS.Common;
using GS.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.Services;
using System.Web.UI.WebControls;

namespace LibMan.pages.User
{
    public partial class Profile : System.Web.UI.Page
    {

        DataManager DM = new DataManager();
        List<ViewParam> lst = new List<ViewParam>();
        DataSet DS = new DataSet();

        protected void Page_PreInit(Object sender, EventArgs e)
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


        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                DataManager DM = new DataManager();
                List<ViewParam> lst = new List<ViewParam>();
                DataSet DS = new DataSet();
                lst.Add(new ViewParam() { Name = "@id", Value = Common.Decrypt(Request.Cookies["LibID"].Value, true) });
                DS = DM.View.GetDataSet("[l_profile_get]", lst);
                if (DS != null && DS.Tables.Count > 0)
                {
                    if (DS.Tables[0].Rows.Count > 0)
                    {
                        txt_ucode.Value = DS.Tables[0].Rows[0]["usr_code"].ToString();
                        h_name.InnerText = DS.Tables[0].Rows[0]["usr_name"].ToString();
                        h_role.InnerText = DS.Tables[0].Rows[0]["UserRoleName"].ToString();
                     
                        if (DS.Tables[0].Rows[0]["usr_staffID"].ToString() != "")
                        {
                            hdn_type.Value = "Staff";
                            hdn_mid.Value = DS.Tables[0].Rows[0]["usr_staffID"].ToString();
                        }
                        if (DS.Tables[0].Rows[0]["usr_studentID"].ToString() != "")
                        {
                            hdn_type.Value = "Student";
                            hdn_mid.Value = DS.Tables[0].Rows[0]["usr_studentID"].ToString();
                        }
                    }
                    if (   DS.Tables.Count > 1 && DS.Tables[1].Rows.Count > 0)
                    {
                        if (DS.Tables[1].Rows[0]["file_path"].ToString() != "")
                        {
                            usr_profile.Src = DS.Tables[1].Rows[0]["file_path"].ToString();
                        }
                        else {
                            usr_profile.Src = "/pages/Admin/Images/user.png";
                        }
                        
                        if (hdn_type.Value == "Staff")
                        {
                            txt_regno.Value = DS.Tables[1].Rows[0]["staff_staffID"].ToString();
                            txt_contact.Value = DS.Tables[1].Rows[0]["staff_Mob_No"].ToString();
                            txt_name.Value = DS.Tables[1].Rows[0]["staff_name"].ToString();
                            txt_fname.Value = DS.Tables[1].Rows[0]["staff_parent"].ToString();
                            txt_gender.Value = DS.Tables[1].Rows[0]["staff_gender"].ToString();
                            txt_email.Value = DS.Tables[1].Rows[0]["staff_EmailID"].ToString();
                            txt_address.Value = DS.Tables[1].Rows[0]["staff_Address"].ToString();
                            txt_doj.Value = DS.Tables[1].Rows[0]["staff_DOJ"].ToString();
                            txt_designation.Value = DS.Tables[1].Rows[0]["designation_name"].ToString();
                            txt_dept.Value = DS.Tables[1].Rows[0]["Dept_name"].ToString();
                        }
                        else if (hdn_type.Value == "Student") {
                            txt_regno.Value = DS.Tables[1].Rows[0]["student_stID"].ToString();
                            txt_contact.Value = DS.Tables[1].Rows[0]["student_Mob_No"].ToString();
                            txt_name.Value = DS.Tables[1].Rows[0]["student_name"].ToString();
                            txt_fname.Value = DS.Tables[1].Rows[0]["student_parent"].ToString();
                            txt_gender.Value = DS.Tables[1].Rows[0]["student_gender"].ToString();
                            txt_email.Value = DS.Tables[1].Rows[0]["staff_staffID"].ToString();
                            txt_address.Value = DS.Tables[1].Rows[0]["student_Address"].ToString();
                            txt_doj.Value = DS.Tables[1].Rows[0]["student_DOJ"].ToString();
                            txt_designation.Value = DS.Tables[1].Rows[0]["Branch_name"].ToString();
                            div_design.InnerText = "Branch";
                            div_dept.InnerText = "Course";
                            txt_dept.Value = DS.Tables[1].Rows[0]["Course_name"].ToString();
                        }
                    }
                }
            }
        }


        [WebMethod]
        public static string ChangePassword(string User, string Password)
        {
            DataManager DM = new DataManager();
            List<ViewParam> lst = new List<ViewParam>();
            DataSet DS = new DataSet();
            string password = Common.Encrypt(Password, true);

            if (User != "")
                lst.Add(new ViewParam() { Name = "@user", Value = User });
            if (password != "")
                lst.Add(new ViewParam() { Name = "@password", Value = password });
            DS = DM.View.GetDataSet("[L_UpdatePaswd_save]", lst);
            if (DS != null)
                return DS.Tables[0].Rows[0][0].ToString();
            else
                return "0";

        }


    }
}