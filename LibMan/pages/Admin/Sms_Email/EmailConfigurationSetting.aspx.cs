using GS.Common;
using GS.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;

namespace LibMan.pages.Admin.Sms_Email
{
    public partial class EmailConfigurationSetting : System.Web.UI.Page
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
        }


        protected void btn_save_Click(object sender, ImageClickEventArgs e)
        {
            DataManager dm_P = new DataManager();
            DataSet ds_P = new DataSet();
            List<ViewParam> _lstParam_P = new List<ViewParam>();
            DataManager dm = new DataManager();
            List<ViewParam> _lstview = new List<ViewParam>();
            DataSet ds = new DataSet();
            _lstview.Add(new ViewParam() { Name = "@flag", Value = "S" });
            if (hdn_id.Value != "")
                _lstview.Add(new ViewParam() { Name = "@EmailConfigSetting_kid", Value = hdn_id.Value });
            _lstview.Add(new ViewParam() { Name = "@EmailConfigSetting_SmtpAddress", Value = txt_smtpadd.Value });
            _lstview.Add(new ViewParam() { Name = "@EmailConfigSetting_default", Value = chkbox_status.Checked });
            _lstview.Add(new ViewParam() { Name = "@EmailConfigSetting_SSL", Value = chkbox_EnblSSL.Checked });
            _lstview.Add(new ViewParam() { Name = "@EmailConfigSetting_password", Value = Common.Encrypt(txt_password.Value.Trim(), true) });
            _lstview.Add(new ViewParam() { Name = "@userid", Value = Common.Decrypt(Request.Cookies["LibID"].Value.ToString(), true) });
            _lstview.Add(new ViewParam() { Name = "@EmailConfigSetting_PortNo", Value = txt_port.Value.Trim() });
            _lstview.Add(new ViewParam() { Name = "@EmailConfigSetting_FromEmail", Value = txt_emailid.Value.Trim() });
            ds = dm.View.GetDataSet("USP_EmailConfigurationSetting", _lstview);
            ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString(), "", true);

        }
    }


}