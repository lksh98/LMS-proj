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
    public partial class student : System.Web.UI.Page
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
                DS = DM.View.GetDataSet("[L_Student_get]", lst);
                if (DS != null)
                {
                    if (DS.Tables.Count > 0)
                    {
                        ddl_course.DataSource = DS.Tables[0];
                        ddl_course.DataValueField = "Course_kid";
                        ddl_course.DataTextField = "Course_name";
                        ddl_course.DataBind();
                    }
                    ddl_course.Items.Insert(0, new ListItem("---Select---", "0"));
                    
                    if (DS.Tables.Count > 1)
                    {
                        ddl_branch.DataSource = DS.Tables[1];
                        ddl_branch.DataValueField = "branch_kid";
                        ddl_branch.DataTextField = "branch_name";
                        ddl_branch.DataBind();
                    }
                    ddl_branch.Items.Insert(0, new ListItem("---Select---", "0"));

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

            if (ddl_branch.SelectedValue != "0")
                lst.Add(new ViewParam() { Name = "@branch", Value = ddl_branch.SelectedValue });
           
            if (ddl_course.SelectedValue != "0")
                lst.Add(new ViewParam() { Name = "@course", Value = ddl_course.SelectedValue });
           
            if (ddl_gender.SelectedValue != "0")
                lst.Add(new ViewParam() { Name = "@gender", Value = ddl_gender.SelectedValue });

           
            lst.Add(new ViewParam() { Name = "@usrID", Value = Common.Decrypt(Request.Cookies["LibID"].Value, true) });
            DS = DM.View.GetDataSet("[L_Student_save]", lst);
            if (DS != null && DS.Tables.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, GetType(), Guid.NewGuid().ToString(), "Save('" + DS.Tables[0].Rows[0][0].ToString() + "')", true);
                if (img_upload.HasFile)
                {
                    string folderPath = Server.MapPath("/Image/Student/" + DS.Tables[0].Rows[0][1].ToString() + "/");

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
                        string file = "/Image/Student/" + DS.Tables[0].Rows[0][1].ToString() + "/" + filename;
                        Common.FileSave(Convert.ToInt32(DS.Tables[0].Rows[0][1].ToString()), file, FileType.Student);
                    }
                }
               
            }
        }


        [WebMethod]
        public static string GetStudentByID(string id)
        {
            List<ViewParam> lst = new List<ViewParam>();
            DataSet DS = new DataSet();
            DataManager DM = new DataManager();
            lst.Add(new ViewParam() { Name = "@id", Value = id });
            DS = DM.View.GetDataSet("L_Student_get", lst);
            return Common.ConverDatasetToJson(DS);
        }
        [WebMethod]
        public static string DeleteUpdateStudent(string id, string flag, bool status)
        {
            List<ViewParam> lst = new List<ViewParam>();
            DataSet DS = new DataSet();
            DataManager DM = new DataManager();
            lst.Add(new ViewParam() { Name = "@flag", Value = flag });
            lst.Add(new ViewParam() { Name = "@id", Value = id });
            lst.Add(new ViewParam() { Name = "@status", Value = status });
            lst.Add(new ViewParam() { Name = "@usrID", Value = Common.Decrypt(HttpContext.Current.Request.Cookies["LibID"].Value, true) });
            DS = DM.View.GetDataSet("[L_Student_save]", lst);

            return Common.ConverDatasetToJson(DS);
        }

        [WebMethod]
        public static string getAllStudents()
        {
            List<ViewParam> _lst = new List<ViewParam>();
            DataSet ds = new DataSet();
            DataManager dm = new DataManager();
            ds = dm.View.GetDataSet("L_Student_get", _lst);
            return Common.ConverDatasetToJson(ds);
        }


    }
}