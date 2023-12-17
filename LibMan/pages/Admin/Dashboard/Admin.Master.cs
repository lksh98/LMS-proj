using GS.Common;
using GS.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.Caching;

namespace LibMan.pages.Admin.Dashboard
{
    public partial class Admin1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataManager dm = new DataManager();
            hdn_Type.Value = Common.Decrypt(Request.Cookies["LibType"].Value, true);
            List<ViewParam> _lstview = new List<ViewParam>();
            DataSet ds = new DataSet();
            string userId = Common.Decrypt(Request.Cookies["LibID"].Value, true);
            if (!IsPostBack)
            {
                hdn_usrID.Value = Request.Cookies["LibID"].Value;
            }
            string cacheName = "MenuDa_" + userId;

            if (Request.Cookies["Cache"].Value == "Y" && HttpContext.Current.Cache[cacheName] != null)
            {
                ds = (DataSet)System.Web.HttpContext.Current.Cache[cacheName];
            }
            else
            {
                string fileName = "DashboardCache_" + userId + ".txt";
                _lstview.Add(new ViewParam() { Name = "@userRole", Value = hdn_Type.Value });
                ds = dm.View.GetDataSet("l_mnum_Menu_Get", _lstview);

                bool exists = System.IO.Directory.Exists(HttpContext.Current.Server.MapPath("/UserCache"));
                if (!exists)
                    System.IO.Directory.CreateDirectory(HttpContext.Current.Server.MapPath("/UserCache"));

                string filePath = HttpContext.Current.Server.MapPath("/UserCache/" + fileName);
                if (!System.IO.File.Exists(filePath))
                {
                    var myFile = System.IO.File.Create(filePath);
                    myFile.Close();
                    System.IO.File.WriteAllText(filePath, DateTime.Now.ToString());
                }
                CacheDependency dep = new CacheDependency(filePath);
                System.Web.HttpContext.Current.Cache.Insert(cacheName, ds, dep);

                Response.Cookies["Cache"].Value = "Y";
                Response.Cookies["Cache"].Expires = DateTime.Now.AddHours(8);
            }
            hdn_Menus.Value = Common.ConverDatasetToJson(ds);

            hdn_currenturl.Value = HttpContext.Current.Request.Url.AbsoluteUri;

            lbl_Type.InnerText = hdn_Type.Value;
            string Name = Common.Decrypt(Request.Cookies["LibName"].Value, true);

            lbl_Name.InnerText = Name;
            Span_Name.InnerText = Name;
            string type = Common.Decrypt(Request.Cookies["LibType"].Value, true);

            span_ShortName.InnerText = Name.Substring(0, 1);
            //if (type == "Admin" || type == "Service Provider")
            //{
            //    div_profimg.Visible = false;
            //}
            //else
            //{
            //List<ViewParam> _lst = new List<ViewParam>();
            //DataTable DT = new DataTable();
            //_lstview.Add(new ViewParam() { Name = "@userRole", Value = hdn_Type.Value });
            //_lstview.Add(new ViewParam() { Name = "@id", Value = Common.Decrypt(Request.Cookies["LibID"].Value, true) });
            DataTable dt = dm.View.Get("select usr_staffID, usr_studentID from L_usr where usr_kid='" + Common.Decrypt(Request.Cookies["LibID"].Value, true) + "'");

            DataTable dt1 = new DataTable();
            if (dt.Rows[0]["usr_staffID"].ToString() != "")
            {
                dt1 = dm.View.Get("select top 1 File_Path from l_File where  File_Type=2 and File_id= '" + dt.Rows[0][0].ToString() + "' order by file_kid desc  ");
            }
            else
            {
                dt1 = dm.View.Get("select top 1 File_Path from l_File where  File_Type=1 and File_id= '" + dt.Rows[0][1].ToString() + "' order by file_kid desc  ");
            }
            if (dt1 != null && dt1.Rows.Count > 0)
            {
                usr_image.Src = dt1.Rows[0][0].ToString();
            }
            else
            {
                usr_image.Src = "/pages/Admin/Images/user.png";
            }
            //}
        }
    }
}