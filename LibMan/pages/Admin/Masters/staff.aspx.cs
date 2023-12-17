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

namespace LibMan.pages.Admin.Masters
{
    public partial class staff : System.Web.UI.Page
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
                DS = DM.View.GetDataSet("[L_Staff_get]", lst);
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
                    
                    if (DS.Tables.Count > 1)
                    {
                        ddl_designation.DataSource = DS.Tables[1];
                        ddl_designation.DataValueField = "designation_kid";
                        ddl_designation.DataTextField = "designation_name";
                        ddl_designation.DataBind();
                    }
                    ddl_designation.Items.Insert(0, new ListItem("---Select---", "0"));
                    
                    if (DS.Tables.Count > 2)
                    {
                        ddl_usrrole.DataSource = DS.Tables[2];
                        ddl_usrrole.DataValueField = "UserRoleKid";
                        ddl_usrrole.DataTextField = "UserRoleName";
                        ddl_usrrole.DataBind();
                    }
                    ddl_usrrole.Items.Insert(0, new ListItem("---Select---", "0"));

                }
            }
        }

        protected void btn_save_Click(object sender, ImageClickEventArgs e)
        {
            string num = string.Empty;
            if (hdn_id.Value != "")
                lst.Add(new ViewParam() { Name = "@id", Value = hdn_id.Value });
            if (txt_Address.Value != "")
                lst.Add(new ViewParam() { Name = "@address", Value = txt_Address.Value });

            if (txt_fName.Value != "")
                lst.Add(new ViewParam() { Name = "@fname", Value = txt_fName.Value });

            if (txt_email.Value != "")
                lst.Add(new ViewParam() { Name = "@email", Value = txt_email.Value });

            if (txt_doj.Value != "")
                lst.Add(new ViewParam() { Name = "@doj", Value = txt_doj.Value });

            if (txt_name.Value != "")
                lst.Add(new ViewParam() { Name = "@name", Value = txt_name.Value });

            if (txt_mobNo.Value != "")
                lst.Add(new ViewParam() { Name = "@mobNo", Value = txt_mobNo.Value });

            if (txt_stID.Value != "")
                lst.Add(new ViewParam() { Name = "@sid", Value = txt_stID.Value });

            if (ddl_designation.SelectedValue != "0")
                lst.Add(new ViewParam() { Name = "@designation", Value = ddl_designation.SelectedValue });
           
            if (ddl_dept.SelectedValue != "0")
                lst.Add(new ViewParam() { Name = "@dept", Value = ddl_dept.SelectedValue });
           
            if (ddl_gender.SelectedValue != "0")
                lst.Add(new ViewParam() { Name = "@gender", Value = ddl_gender.SelectedValue });

           
            if (txt_usrcode.Value != "")
                lst.Add(new ViewParam() { Name = "@usrName", Value = txt_usrcode.Value });
           
            if (ddl_usrrole.SelectedValue != "0")
                lst.Add(new ViewParam() { Name = "@usrrole", Value = ddl_usrrole.SelectedValue });

           
            lst.Add(new ViewParam() { Name = "@usrID", Value = Common.Decrypt(Request.Cookies["LibID"].Value, true) });
            DS = DM.View.GetDataSet("[L_Staff_save]", lst);
            if (DS != null && DS.Tables.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, GetType(), Guid.NewGuid().ToString(), "Save('" + DS.Tables[0].Rows[0][0].ToString() + "')", true);
                if (img_upload.HasFile)
                {
                    string folderPath = Server.MapPath("/Image/Staff/" + DS.Tables[0].Rows[0][1].ToString() + "/");

                    if (!Directory.Exists(folderPath))
                        Directory.CreateDirectory(folderPath);
                    string rnd = Common.GetRandomString();
                    string filename = rnd + Path.GetExtension(img_upload.FileName);

                    if (Directory.Exists(folderPath))
                    {
                        DirectoryInfo di = new DirectoryInfo(folderPath);
                        foreach (FileInfo ff in di.GetFiles())
                        {
                            ff.Delete();
                        }
                        img_upload.SaveAs(folderPath + "\\" + filename);
                        string file = "/Image/Staff/" + DS.Tables[0].Rows[0][1].ToString() + "/" + filename;
                        Common.FileSave(Convert.ToInt32(DS.Tables[0].Rows[0][1].ToString()), file, FileType.Staff);
                    }
                }
               
            }
        }


        [WebMethod]
        public static string GetStaffByID(string id)
        {
            List<ViewParam> lst = new List<ViewParam>();
            DataSet DS = new DataSet();
            DataManager DM = new DataManager();
            lst.Add(new ViewParam() { Name = "@id", Value = id });
            DS = DM.View.GetDataSet("L_Staff_get", lst);
            return Common.ConverDatasetToJson(DS);
        }
        [WebMethod]
        public static string DeleteUpdateStaff(string id, string flag, bool status)
        {
            List<ViewParam> lst = new List<ViewParam>();
            DataSet DS = new DataSet();
            DataManager DM = new DataManager();
            lst.Add(new ViewParam() { Name = "@flag", Value = flag });
            lst.Add(new ViewParam() { Name = "@id", Value = id });
            lst.Add(new ViewParam() { Name = "@status", Value = status });
            lst.Add(new ViewParam() { Name = "@usrID", Value = Common.Decrypt(HttpContext.Current.Request.Cookies["LibID"].Value, true) });
            DS = DM.View.GetDataSet("[L_Staff_save]", lst);

            return Common.ConverDatasetToJson(DS);
        }

        [WebMethod]
        public static string getAllStaffs()
        {
            List<ViewParam> _lst = new List<ViewParam>();
            DataSet ds = new DataSet();
            DataManager dm = new DataManager();
            ds = dm.View.GetDataSet("L_Staff_get", _lst);
            return Common.ConverDatasetToJson(ds);
        }


    }
}