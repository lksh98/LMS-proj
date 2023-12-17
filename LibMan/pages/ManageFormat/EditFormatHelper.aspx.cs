using GS.Common;
using GS.Data;
using LibMan;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Reflection;
using System.Text.RegularExpressions;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pages.ManageFormats
{
    public partial class EditFormatHelper : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckUser ChU = new CheckUser();
            string LibID = string.Empty, Libname = string.Empty, LibType = string.Empty;
            if (Request.Cookies["LibID"] != null)
                LibID = Request.Cookies["LibID"].Value;
            if (Request.Cookies["LibName"] != null)
                Libname = Request.Cookies["LibName"].Value;
            if (Request.Cookies["LibType"] != null)
                LibType = Request.Cookies["LibType"].Value;
            int check = ChU.Valid(LibID, Libname, LibType);

            if (check == 1)
            {
                Response.Redirect("~/default.aspx");
            }
            if (!Page.IsPostBack)
            {
                DataManager dm = new DataManager();
                DataSet ds = new DataSet();
                string type = "B";
                if (Request.QueryString["type"] != null)
                {
                    type = Request.QueryString["type"].ToString();
                }
                if (type.Trim() == "H")
                    ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString(), "HBodymargin();", true);
                else if (type.Trim() == "F")
                    ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString(), "BodyfooterFmargin();", true);
                else
                    ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString(), "HBFFmargin();", true);

                if (type.Trim() == "B")
                {
                    List<ViewParam> _lstParam = new List<ViewParam>();
                    _lstParam.Add(new ViewParam() { Name = "@Formatid", Value = Request.QueryString["FormatID"].ToString() });
                    _lstParam.Add(new ViewParam() { Name = "@flag", Value = "E" });
                    ds = dm.View.GetDataSet("L_Format_GetSave", _lstParam);

                    ddl_header.DataSource = ds.Tables[1];
                    ddl_header.DataTextField = "FormatTemplate_ename";
                    ddl_header.DataValueField = "FormatTemplate_kid";
                    ddl_header.DataBind();
                    ddl_header.Items.Insert(0, new ListItem("-------Select Header---------", "0"));

                    ddl_footer.DataSource = ds.Tables[2];
                    ddl_footer.DataTextField = "FormatTemplate_ename";
                    ddl_footer.DataValueField = "FormatTemplate_kid";
                    ddl_footer.DataBind();
                    ddl_footer.Items.Insert(0, new ListItem("-------Select Footer---------", "0"));

                    ddl_OPH.DataSource = ds.Tables[3];
                    ddl_OPH.DataTextField = "FormatTemplate_ename";
                    ddl_OPH.DataValueField = "FormatTemplate_kid";
                    ddl_OPH.DataBind();
                    ddl_OPH.Items.Insert(0, new ListItem("-------Select---------", "0"));

                    ddl_LPF.DataSource = ds.Tables[4];
                    ddl_LPF.DataTextField = "FormatTemplate_ename";
                    ddl_LPF.DataValueField = "FormatTemplate_kid";
                    ddl_LPF.DataBind();
                    ddl_LPF.Items.Insert(0, new ListItem("-------Select---------", "0"));

                    if (ds.Tables[5].Rows.Count > 0)
                    {
                        if (ds.Tables[5].Rows[0]["Link_Headerid"].ToString() != "")
                            ddl_header.SelectedValue = ds.Tables[5].Rows[0]["Link_Headerid"].ToString();
                        if (ds.Tables[5].Rows[0]["Link_Footerid"].ToString() != "")
                            ddl_footer.SelectedValue = ds.Tables[5].Rows[0]["Link_Footerid"].ToString();
                        if (ds.Tables[5].Rows[0]["Link_otherHeaderid"].ToString() != "")
                            ddl_OPH.SelectedValue = ds.Tables[5].Rows[0]["Link_otherHeaderid"].ToString();
                        if (ds.Tables[5].Rows[0]["Link_LastPagefooterid"].ToString() != "")
                            ddl_LPF.SelectedValue = ds.Tables[5].Rows[0]["Link_LastPagefooterid"].ToString();
                    }
                }
                BindPDFSize();

                List<int> margin = new List<int>();
                for (int i = 0; i <= 200; i++)
                {
                    margin.Add(i);
                }

                ddl_leftmargin.DataSource = margin;
                ddl_leftmargin.DataBind();
                ddl_rightmargin.DataSource = margin;
                ddl_rightmargin.DataBind();


                List<int> HBmargin = new List<int>();
                for (int i = -60; i <= 200; i++)
                {
                    HBmargin.Add(i);
                }

                ddl_HBodymargin.DataSource = HBmargin;
                ddl_HBodymargin.DataBind();
                ddl_HBodymargin.SelectedValue = "0";
                ddl_BFootermargin.DataSource = HBmargin;
                ddl_BFootermargin.DataBind();
                ddl_BFootermargin.SelectedValue = "0";

                string[] colorName = System.Enum.GetNames(typeof(KnownColor));
                ddl_pagenocolor.DataSource = colorName;
                ddl_pagenocolor.DataBind();
            }
        }

        private void BindPDFSize()
        {
            DataManager dm = new DataManager();
            DataSet ds = new DataSet();
            List<ViewParam> _lstParam = new List<ViewParam>();
            ds = dm.View.GetDataSet("L_Format_GetSave", _lstParam);

            Assembly a = Assembly.LoadFrom(MapPath("~/bin/itextsharp.dll"));
            foreach (Type t in a.GetExportedTypes())
            {
                if (t.Name == "PageSize")
                {
                    FieldInfo[] f = t.GetFields();
                    foreach (FieldInfo fi in f)
                    {
                        if (fi.FieldType.Name == "Rectangle")
                            ddl_str_PageType.Items.Add(fi.Name);
                    }
                    if (ds.Tables[6].Rows.Count > 0)
                    {
                        for (int i = 0; i < ds.Tables[6].Rows.Count; i++)
                        {
                            ddl_str_PageType.Items.Add(ds.Tables[6].Rows[i]["PaperType_Name"].ToString());
                        }
                    }
                }
            }

            ddl_str_PageType.SelectedValue = "A4";
        }

        protected void btn_Save_Click(object sender, EventArgs e)
        {
            DataManager dm_P = new DataManager();
            DataSet ds_P = new DataSet();
            List<ViewParam> _lstParam_P = new List<ViewParam>();
            string type = "B";
            if (Request.QueryString["type"] != null)
            {
                type = Request.QueryString["type"].ToString();
            }
            string FormatID = Request.QueryString["FormatID"].ToString();
            //PdfHelperLib.GS_Helper obj_Helper = new PdfHelperLib.GS_Helper();------------------------------------------------------------
            DataManager dm = new DataManager();
            DataSet ds = new DataSet();
            List<ViewParam> _lstParam = new List<ViewParam>();
            string pattern = @"\w+\:\/\/[^\/]+\/";
            string OutPutHtml = Regex.Replace(txt_FormatEditor.Text, pattern, "/");
            //OutPutHtml =  Regex.Replace(OutPutHtml, @"(?<=<.*?>)(&nbsp;\s*)+(?=</.*?>)", "<br />");
            //OutPutHtml =  Regex.Replace(OutPutHtml, @"(?<=<.*?>)( &nbsp;\s*)+(?=</.*?>)", "<br />");
            _lstParam.Add(new ViewParam() { Name = "@Formatid", Value = FormatID });
            _lstParam.Add(new ViewParam() { Name = "@Format", Value = OutPutHtml });
            _lstParam.Add(new ViewParam() { Name = "@flag", Value = "S" });
            _lstParam.Add(new ViewParam() { Name = "@FormatDetail_PageType", Value = ddl_str_PageType.SelectedValue });
            _lstParam.Add(new ViewParam() { Name = "@FormatDetail_PageOrientation", Value = ddl_str_PageOrintion.SelectedValue });
            _lstParam.Add(new ViewParam() { Name = "@FormatDetail_PageLeftMargin", Value = ddl_leftmargin.SelectedValue });
            _lstParam.Add(new ViewParam() { Name = "@FormatDetail_PageRightMargin", Value = ddl_rightmargin.SelectedValue });
            _lstParam.Add(new ViewParam() { Name = "@FormatDetail_FooterPageNoColor", Value = ddl_pagenocolor.SelectedValue });
            if (chk_Pagenoshow.Checked)
                _lstParam.Add(new ViewParam() { Name = "@FormatDetail_FooterPageNoShow", Value = "Y" });
            else
                _lstParam.Add(new ViewParam() { Name = "@FormatDetail_FooterPageNoShow", Value = "N" });

            if (type.Trim() == "B")
                _lstParam.Add(new ViewParam() { Name = "@FormatDetail_HeaderBodyMargin", Value = "0" });
            else
                _lstParam.Add(new ViewParam() { Name = "@FormatDetail_HeaderBodyMargin", Value = ddl_HBodymargin.SelectedValue });
            if (type.Trim() == "B")
                _lstParam.Add(new ViewParam() { Name = "@FormatDetail_BodyFooterMargin", Value = "0" });
            else
                _lstParam.Add(new ViewParam() { Name = "@FormatDetail_BodyFooterMargin", Value = ddl_BFootermargin.SelectedValue });
            if (type.Trim() == "B")
            {
                if (ddl_header.SelectedValue != "0")
                    _lstParam.Add(new ViewParam() { Name = "@headerid", Value = ddl_header.SelectedValue });
                if (ddl_footer.SelectedValue != "0")
                    _lstParam.Add(new ViewParam() { Name = "@footerid", Value = ddl_footer.SelectedValue });
                if (ddl_OPH.SelectedValue != "0")
                    _lstParam.Add(new ViewParam() { Name = "@othheaderid", Value = ddl_OPH.SelectedValue });
                if (ddl_LPF.SelectedValue != "0")
                    _lstParam.Add(new ViewParam() { Name = "@lastfooterid", Value = ddl_LPF.SelectedValue });
            }

            ds = dm.View.GetDataSet("M_Format_GetSave", _lstParam);
            ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString(), "savePrompt();", true);

        }



        [WebMethod]
        public static string GetData(string val, string spName)
        {
            List<ViewParam> _lst = new List<ViewParam>();
            DataManager dm = new DataManager();
            //_lst.Add(new ViewParam() { Name = "@FormatID", Value = val });
            //_lst.Add(new ViewParam() { Name = "@CompID", Value = HttpContext.Current.Request.Cookies["compID"].Value.ToString() });
            DataSet ds = dm.View.GetDataSet(spName, _lst);
            int count1 = ds.Tables.Count;
            DataTable dt = new DataTable("Table");
            DataColumn datarow = new DataColumn("datarow", typeof(System.String));
            dt.Columns.Add(datarow);
            DataColumn Column_Name = new DataColumn("Column_Name", typeof(System.String));
            dt.Columns.Add(Column_Name);
            DataColumn Table_No = new DataColumn("Table_No", typeof(System.String));
            dt.Columns.Add(Table_No);
            DataColumn FEDBCoulmns_ImageType = new DataColumn("FEDBCoulmns_ImageType", typeof(System.String));
            dt.Columns.Add(FEDBCoulmns_ImageType);
            DataRow row = null;
            int j = 1;
            for (int i = 1; i <= count1; i++)
            {
                foreach (DataColumn col in ds.Tables[i - 1].Columns)
                {

                    row = dt.NewRow();

                    row[datarow] = j;
                    row[Column_Name] = col.ColumnName;
                    row[Table_No] = ds.Tables[i - 1].TableName + "1";
                    row[FEDBCoulmns_ImageType] = "N";
                    dt.Rows.Add(row);
                    j++;
                }
            }
            return Common.ConverTableToJson(dt);
            //DataSet ds_Addon = new DataSet();
            //ds_Addon.Tables.Add(dt);
            //StringWriter sw = new StringWriter();
            //ds_Addon.WriteXml(sw, XmlWriteMode.IgnoreSchema);
            //XmlDocument xd = new XmlDocument();
            //xd.LoadXml(sw.ToString());

            //string jsonText = JsonConvert.SerializeXmlNode(xd);
            //return jsonText;

        }
    }
}