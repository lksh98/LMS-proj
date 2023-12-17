﻿using GS.Common;
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
    public partial class shelf : System.Web.UI.Page
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
                DS = DM.View.GetDataSet("[L_Shelf_get]", lst);
                if (DS != null)
                {
                    if (DS.Tables.Count > 0)
                    {
                        ddl_rack.DataSource = DS.Tables[0];
                        ddl_rack.DataValueField = "rack_kid";
                        ddl_rack.DataTextField = "rack_name";
                        ddl_rack.DataBind();
                    }
                    ddl_rack.Items.Insert(0, new ListItem("---Select---", "0"));

                }


            }
        }

        protected void btn_save_Click(object sender, ImageClickEventArgs e)
        {
            string num = string.Empty;
            if (hdn_id.Value != "")
                lst.Add(new ViewParam() { Name = "@id", Value = hdn_id.Value });

            if (ddl_rack.SelectedValue != "")
                lst.Add(new ViewParam() { Name = "@rack", Value = ddl_rack.SelectedValue });

            if (txt_shelf.Value != "")
                lst.Add(new ViewParam() { Name = "@shelf", Value = txt_shelf.Value });

            lst.Add(new ViewParam() { Name = "@usrID", Value = Common.Decrypt(Request.Cookies["LibID"].Value, true) });
            DS = DM.View.GetDataSet("[L_Shelf_save]", lst);
            if (DS != null && DS.Tables.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, GetType(), Guid.NewGuid().ToString(), "Save('" + DS.Tables[0].Rows[0][0].ToString() + "')", true);
            }
        }


        [WebMethod]
        public static string GetShelfByID(string id)
        {
            List<ViewParam> lst = new List<ViewParam>();
            DataSet DS = new DataSet();
            DataManager DM = new DataManager();
            lst.Add(new ViewParam() { Name = "@id", Value = id });
            DS = DM.View.GetDataSet("L_Shelf_get", lst);
            return Common.ConverDatasetToJson(DS);
        }
        [WebMethod]
        public static string DeleteUpdateShelf(string id, string flag, bool status)
        {
            List<ViewParam> lst = new List<ViewParam>();
            DataSet DS = new DataSet();
            DataManager DM = new DataManager();
            lst.Add(new ViewParam() { Name = "@flag", Value = flag });
            lst.Add(new ViewParam() { Name = "@id", Value = id });
            lst.Add(new ViewParam() { Name = "@status", Value = status });
            lst.Add(new ViewParam() { Name = "@usrID", Value = Common.Decrypt(HttpContext.Current.Request.Cookies["LibID"].Value, true) });
            DS = DM.View.GetDataSet("[L_Shelf_save]", lst);

            return Common.ConverDatasetToJson(DS);
        }

        [WebMethod]
        public static string getAllShelfs()
        {
            List<ViewParam> _lst = new List<ViewParam>();
            DataSet ds = new DataSet();
            DataManager dm = new DataManager();
            ds = dm.View.GetDataSet("L_Shelf_get", _lst);
            return Common.ConverDatasetToJson(ds);
        }


    }
}