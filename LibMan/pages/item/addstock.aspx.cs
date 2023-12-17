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
    public partial class addstock : System.Web.UI.Page
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
                txt_pdate.Value = DateTime.Now.ToString("yyyy-MM-dd");
                txt_pdate.Attributes.Add("readonly", "readonly");
            }
        }

        protected void btn_save_Click(object sender, ImageClickEventArgs e)
        {
            string num = string.Empty;
            
            IList<BookData> bookDetails = new JavaScriptSerializer().Deserialize<IList<BookData>>(hdn_bookStock.Value);
            XDocument Xdoc = new XDocument();
            Xdoc.Add(new XElement("bookdet"));
            foreach (BookData book in bookDetails)
            {

                XElement ele = Xdoc.Element("bookdet");
                ele.Add(new XElement("book",
                    new XElement("book_ID", book.book_kid),
                    new XElement("book_edition", book.book_edition),
                    new XElement("book_purdate", book.book_purdate),
                    new XElement("book_qty", book.book_qty),
                    new XElement("book_price", book.book_price)
                ));
            }
            lst.Add(new ViewParam() { Name = "@bookDetails", Value = Xdoc.ToString() });
            lst.Add(new ViewParam() { Name = "@usrID", Value = Common.Decrypt(Request.Cookies["LibID"].Value, true) });
            DS = DM.View.GetDataSet("[L_BookStock_save]", lst);
            if (DS != null && DS.Tables.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, GetType(), Guid.NewGuid().ToString(), "Save('" + DS.Tables[0].Rows[0][0].ToString() + "','" + DS.Tables[0].Rows[0][1].ToString() + "')", true);
            }
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
        public static string GetBookByISBN(string isbn)
        {
            List<ViewParam> _lst = new List<ViewParam>();
            DataSet ds = new DataSet();
            DataManager dm = new DataManager();
            _lst.Add(new ViewParam() { Name = "@isbn", Value = isbn });
            ds = dm.View.GetDataSet("L_BookStock_get", _lst);
            return Common.ConverDatasetToJson(ds);
        }

    }

    class BookData
    {
        public string book_kid { get; set; }
        public string book_edition { get; set; }
        public string book_purdate { get; set; }
        public string book_qty { get; set; }
        public string book_price { get; set; }
        public string book_Description { get; set; }
    }

}