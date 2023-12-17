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

namespace LibMan.pages.Admin.Masters
{
    public partial class Book : System.Web.UI.Page
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

            if (txt_authors.Value != "")
                lst.Add(new ViewParam() { Name = "@author", Value = txt_authors.Value });

            if (txt_categories.Value != "")
                lst.Add(new ViewParam() { Name = "@category", Value = txt_categories.Value });
            if (txt_descriptions.Value != "")
                lst.Add(new ViewParam() { Name = "@description", Value = txt_descriptions.Value });
            if (txt_publishedDate.Value != "")
                lst.Add(new ViewParam() { Name = "@publishedDate", Value = txt_publishedDate.Value });

            if (txt_publisher.Value != "")
                lst.Add(new ViewParam() { Name = "@publisher", Value = txt_publisher.Value });


            if (txt_isbn10.Value != "")
                lst.Add(new ViewParam() { Name = "@ISBN10", Value = txt_isbn10.Value });


            if (txt_isbn13.Value != "")
                lst.Add(new ViewParam() { Name = "@ISBN13", Value = txt_isbn13.Value });

            if (txt_subtitle.Value != "")
                lst.Add(new ViewParam() { Name = "@subtitle", Value = txt_subtitle.Value });

            if (txt_title.Value != "")
                lst.Add(new ViewParam() { Name = "@title", Value = txt_title.Value });

            if (txt_edition.Value != "")
                lst.Add(new ViewParam() { Name = "@edition", Value = txt_edition.Value });

            if (txt_purdate.Value != "")
                lst.Add(new ViewParam() { Name = "@purdate", Value = txt_purdate.Value });
            if (txt_quantity.Value != "")
                lst.Add(new ViewParam() { Name = "@qty", Value = txt_quantity.Value });
            if (txt_price.Value != "")
                lst.Add(new ViewParam() { Name = "@price", Value = txt_price.Value });


            lst.Add(new ViewParam() { Name = "@usrID", Value = Common.Decrypt(Request.Cookies["LibID"].Value, true) });
            DS = DM.View.GetDataSet("[L_Book_save]", lst);
            if (DS != null && DS.Tables.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, GetType(), Guid.NewGuid().ToString(), "Save('" + DS.Tables[0].Rows[0][0].ToString() + "','" + DS.Tables[0].Rows[0][1].ToString() + "')", true);

                if (DS.Tables[0].Rows[0][0].ToString() == "1" || DS.Tables[0].Rows[0][0].ToString() == "2")
                {
                    //if (hdn_id.Value == "")
                    //{
                    //    string MsgEmailFormat = "Dear " + txt_fname.Value + " thanks for associating with LibMan. Your login details are  Username: " + txt_code.Value.ToString().Trim() + " and Password : " + num + ". Please visit https://www.LibMan.app for verification of your login profile";
                    //    Common.InsertSms(MsgEmailFormat, txt_mob.Value);
                    //}
                    if (img_upload.HasFile)
                    {
                        string folderPath = Server.MapPath("/Image/Books/" + DS.Tables[0].Rows[0][1].ToString() + "/");

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
                            string file = "/Image/Books/" + DS.Tables[0].Rows[0][1].ToString() + "/" + filename;
                            Common.FileSave(Convert.ToInt32(DS.Tables[0].Rows[0][1].ToString()), file, FileType.Book);
                        }
                    }
                    else if (hdn_downImage.Value!="") {
                        Common.FileSave(Convert.ToInt32(DS.Tables[0].Rows[0][1].ToString()), hdn_downImage.Value, FileType.Book);
                    }
                    
                }
            }
        }

       
        [WebMethod]
        public static string GetBookByID(string id)
        {
            List<ViewParam> lst = new List<ViewParam>();
            DataSet DS = new DataSet();
            DataManager DM = new DataManager();
            lst.Add(new ViewParam() { Name = "@id", Value = id });
            DS = DM.View.GetDataSet("L_Book_get", lst);
            return Common.ConverDatasetToJson(DS);
        } 

        [WebMethod]
        public static string GetBookStockByID(string id)
        {
            List<ViewParam> lst = new List<ViewParam>();
            DataSet DS = new DataSet();
            DataManager DM = new DataManager();
            lst.Add(new ViewParam() { Name = "@id", Value = id });
            lst.Add(new ViewParam() { Name = "@flag", Value = "L" });
            DS = DM.View.GetDataSet("L_Book_get", lst);
            return Common.ConverDatasetToJson(DS);
        }
        [WebMethod]
        public static string DeleteUpdateBook(string id, string flag,  bool status)
        {
            List<ViewParam> lst = new List<ViewParam>();
            DataSet DS = new DataSet();
            DataManager DM = new DataManager();
            lst.Add(new ViewParam() { Name = "@flag", Value = flag });
            lst.Add(new ViewParam() { Name = "@id", Value = id });
            lst.Add(new ViewParam() { Name = "@status", Value = status });
            lst.Add(new ViewParam() { Name = "@usrID", Value = Common.Decrypt(HttpContext.Current.Request.Cookies["LibID"].Value,   true) });
            DS = DM.View.GetDataSet("[L_Book_save]", lst);
            if (DS != null && DS.Tables.Count > 0 && DS.Tables[0].Rows[0][0].ToString() == "1" && flag == "D")
            {
                string folderPath = HttpContext.Current.Server.MapPath("/Image/Books/" + id);
                if (Directory.Exists(folderPath))
                    Directory.Delete(folderPath, true);
            }
            return Common.ConverDatasetToJson(DS);
        }

        [WebMethod]
        public static string getAllBooks()
        {
            List<ViewParam> _lst = new List<ViewParam>();
            DataSet ds = new DataSet();
            DataManager dm = new DataManager();
            ds = dm.View.GetDataSet("L_Book_get", _lst);
            return Common.ConverDatasetToJson(ds);
        }

        [WebMethod]
        public static string getPublisher(string term)
        {
            List<ViewParam> _lst = new List<ViewParam>();
            DataSet ds = new DataSet();
            DataManager dm = new DataManager();
            _lst.Add(new ViewParam() { Name = "@term", Value = term });
            ds = dm.View.GetDataSet("l_getPublisher", _lst);
            return Common.ConverDatasetToJson(ds);
        }

        [WebMethod]
        public static string getAuthor(string term)
        {
            List<ViewParam> _lst = new List<ViewParam>();
            DataSet ds = new DataSet();
            DataManager dm = new DataManager();
            _lst.Add(new ViewParam() { Name = "@term", Value = term });
            ds = dm.View.GetDataSet("l_getAuthors", _lst);
            return Common.ConverDatasetToJson(ds);
        }

        [WebMethod]
        public static string getCategories(string term)
        {
            List<ViewParam> _lst = new List<ViewParam>();
            DataSet ds = new DataSet();
            DataManager dm = new DataManager();
            _lst.Add(new ViewParam() { Name = "@term", Value = term });
            ds = dm.View.GetDataSet("l_getcategories", _lst);
            return Common.ConverDatasetToJson(ds);
        }

       

    }
}