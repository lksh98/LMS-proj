using GS.Common;
using GS.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;

namespace LibMan.pages.Admin.Sms_Email
{
    public partial class SMSAPIConfig : System.Web.UI.Page
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

            }
        }

        //private void BindRecords()
        //{
        //    DataManager dm = new DataManager();
        //    List<ViewParam> _lst = new List<ViewParam>();
        //    _lst.Add(new ViewParam() { Name = "@flag", Value = "L" });
        //    DataSet ds = dm.View.GetDataSet("[SMS_SMSConfig_GetSave]", _lst);

        //    txt_configName.Text = string.Empty;
        //    txt_cmnPart.Text = string.Empty;
        //    txt_mobno.Text = string.Empty;
        //    txt_msg.Text = string.Empty;
        //    chkbox_default.Checked = false;
        //}

        protected void btn_save_Click(object sender, ImageClickEventArgs e)
        {
            DataManager dm = new DataManager();
            List<ViewParam> _lst = new List<ViewParam>();
            _lst.Add(new ViewParam() { Name = "@flag", Value = "S" });
            if (hdn_id.Value != "")
                _lst.Add(new ViewParam() { Name = "@SMSConfig_Kid", Value = hdn_id.Value });
            _lst.Add(new ViewParam() { Name = "@SMSConfig_ConfigName", Value = txt_name.Value.Trim() });
            _lst.Add(new ViewParam() { Name = "@SMSConfig_CommonPart", Value = txt_commonpart.Value.Trim() });
            _lst.Add(new ViewParam() { Name = "@SMSConfig_ForMobile", Value = txt_fmobileno.Value.Trim() });
            _lst.Add(new ViewParam() { Name = "@SMSConfig_ForMessage", Value = txt_fmsg.Value.Trim() });
            _lst.Add(new ViewParam() { Name = "@SMSConfig_Default", Value = chk_default.Checked });
            _lst.Add(new ViewParam() { Name = "@SMSConfig_Date", Value = DateTime.Now });
            _lst.Add(new ViewParam() { Name = "@SMSConfig_Userid", Value = Common.Decrypt(Request.Cookies["LibID"].Value.ToString(), true) });
            DataSet ds = dm.View.GetDataSet("[SMS_SMSConfig_GetSave]", _lst);

        }

    }
}