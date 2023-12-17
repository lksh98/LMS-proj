using GS.Common;
using GS.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibMan.pages.Admin.Sms_Email
{
    public partial class SMSTemplate : System.Web.UI.Page
    {
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
                txt_startTime.Attributes.Add("readonly", "readonly");
                BindActivities();
            }
        }

        private void BindActivities()
        {
            List<ViewParam> _lst = new List<ViewParam>();
            DataManager dm = new DataManager();
            _lst.Add(new ViewParam() { Name = "@flag", Value = "L" });
            DataSet ds = dm.View.GetDataSet("SMS_TemplateCreationGetSave", _lst);

            ddl_str_TemplateName.DataTextField = "SMSActivity_Name";
            ddl_str_TemplateName.DataValueField = "SMSActivity_Kid";
            ddl_str_TemplateName.DataSource = ds.Tables[0];
            ddl_str_TemplateName.DataBind();
            ddl_str_TemplateName.Items.Insert(0, new ListItem("------select------", "0"));
        }

        protected void btn_save_Click(object sender, ImageClickEventArgs e)
        {
            List<ViewParam> _lst = new List<ViewParam>();
            DataManager dm = new DataManager();
            _lst.Add(new ViewParam() { Name = "@flag", Value = "S" });
            _lst.Add(new ViewParam() { Name = "@SMSActivityID", Value = ddl_str_TemplateName.SelectedValue });
            _lst.Add(new ViewParam() { Name = "@SMSSchedule_Type", Value = ddl_Type.SelectedValue });
            _lst.Add(new ViewParam() { Name = "@SMSSchedule_DaysBefore", Value = txt_Daysbefore.Text });
            _lst.Add(new ViewParam() { Name = "@SMSSchedule_StartTime", Value = txt_startTime.Text });
            _lst.Add(new ViewParam() { Name = "@SMSSchedule_TimeBefore", Value = txt_timebefore.Text });
            _lst.Add(new ViewParam() { Name = "@SMSSchedule_TimeSpan", Value = txt_timespan.Text });
            _lst.Add(new ViewParam() { Name = "@SMSSchedule_Msg", Value = txt_FormatEditor.Text });

            DataSet ds = dm.View.GetDataSet("SMS_TemplateCreationGetSave", _lst);
            if (ds != null && ds.Tables.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, GetType(), Guid.NewGuid().ToString(), "Save('" + ds.Tables[0].Rows[0][0].ToString() + "')", true);
            }
        }

        [WebMethod]
        public static string GS_GetData(string val, string spName)
        {
            List<ViewParam> _lst = new List<ViewParam>();
            DataManager dm = new DataManager();
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

        }

    }
}