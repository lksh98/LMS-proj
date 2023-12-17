using GS.Common;
using GS.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.Services;
using System.Web.UI.WebControls;
using LibMan.Classes;
using LibMan.pages.Admin.Dashboard;
using Org.BouncyCastle.Asn1.Ocsp;
using System.Web.Script.Serialization;

namespace LibMan.Classes
{
    /// <summary>
    /// Summary description for Services
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Services : System.Web.Services.WebService
    {
        DataManager DM = new DataManager();
        List<ViewParam> lst = new List<ViewParam>();
        DataSet DS = new DataSet();
        DataTable DT = new DataTable();
        [WebMethod]
        public string GetMenuBySearch(string item, string userRole)
        {
            lst.Add(new ViewParam() { Name = "@Name", Value = item });
            lst.Add(new ViewParam() { Name = "@Role", Value = userRole });
            DS = DM.View.GetDataSet("l_MenuSearch_byBox", lst);
            return Common.ConverDatasetToJson(DS);
        }

        [WebMethod]
        public string GetMenuByProfileID(string id)
        {
            lst.Add(new ViewParam() { Name = "@id", Value = id });
            DS = DM.View.GetDataSet("l_MenuLink_get", lst);
            return Common.ConverDatasetToJson(DS);
        }

        //------------------------------------------Terms & Conditions--------------------------------------------------------------
        [WebMethod]
        public string GetAgreement()
        {
            DS = DM.View.GetDataSet("[l_Agreement_get]", lst);
            return Common.ConverDatasetToJson(DS);
        }


        [WebMethod]
        public string GetAgreementByID(string id)
        {
            lst.Add(new ViewParam() { Name = "@id", Value = id });
            DS = DM.View.GetDataSet("l_Agreement_get", lst);
            return Common.ConverDatasetToJson(DS);
        }

        [WebMethod]
        public string GetAgreementByUserType(string type)
        {
            lst.Add(new ViewParam() { Name = "@type", Value = type });
            DS = DM.View.GetDataSet("l_Agreement_get", lst);
            return Common.ConverDatasetToJson(DS);
        }

        [WebMethod]
        public string saveAgreementByID(string user)
        {
            lst.Add(new ViewParam() { Name = "@flag", Value = 'S' });
            lst.Add(new ViewParam() { Name = "@user", Value = user });
            DS = DM.View.GetDataSet("l_Agreement_save", lst);
            return Common.ConverDatasetToJson(DS);
        }



        //-----------------------------------------------Notification Related -------------------------------------------------------------
        [WebMethod(EnableSession = true)]
        public string GetNotification(string usrid)
        {
            Session["LastTimeNotified"] = DateTime.Now;

            lst.Add(new ViewParam() { Name = "@usrid", Value =   Common.Decrypt(HttpContext.Current.Request.Cookies["LibID"].Value, true) });
            DS = DM.View.GetDataSet("L_GetNotification", lst);
            return Common.ConverDatasetToJson(DS);
        }
        [WebMethod]
        public string UpdateNotification(string usrid)
        {
            lst.Add(new ViewParam() { Name = "@usrid", Value = Common.Decrypt(usrid, true) });
            lst.Add(new ViewParam() { Name = "@flag", Value = "U" });
            DS = DM.View.GetDataSet("l_GetNotification", lst);
            return Common.ConverDatasetToJson(DS);
        }

        //--------------------------SMS Related ------------------------------------//

        [WebMethod]
        public string GetSMSConfig()
        {
            lst.Add(new ViewParam() { Name = "@flag", Value = "L" });
            DS = DM.View.GetDataSet("SMS_SMSConfig_GetSave", lst);
            return Common.ConverDatasetToJson(DS);
        }

        [WebMethod]
        public string GetSMSConfigsByID(string id)
        {
            lst.Add(new ViewParam() { Name = "@flag", Value = "G" });
            lst.Add(new ViewParam() { Name = "@SMSConfig_Kid", Value = id });
            DS = DM.View.GetDataSet("SMS_SMSConfig_GetSave", lst);
            return Common.ConverDatasetToJson(DS);
        }

        [WebMethod]
        public string GetSMSTemplate(string SMSActivityID)
        {

            lst.Add(new ViewParam() { Name = "@flag", Value = "C" });
            lst.Add(new ViewParam() { Name = "@SMSActivityID", Value = SMSActivityID });
            DS = DM.View.GetDataSet("[SMS_TemplateCreationGetSave]", lst);
            return Common.ConverDatasetToJson(DS);
        }

        [WebMethod]
        public string GetMacroText(string str_test, string moduleid, string subheadid)
        {
            DataManager dm = new DataManager();
            DataSet ds = new DataSet();
            List<ViewParam> _lstParam = new List<ViewParam>();
            _lstParam.Add(new ViewParam() { Name = "@macro_text", Value = str_test });
            if (moduleid.Trim() != "0")
                _lstParam.Add(new ViewParam() { Name = "@macroheadid", Value = moduleid });
            if (subheadid.Trim() != "0" && subheadid.Trim() != null && subheadid.Trim() != "null")
                _lstParam.Add(new ViewParam() { Name = "@macrosubheadid", Value = subheadid });
            ds = dm.View.GetDataSet("addon_macro_get", _lstParam);
            return Common.ConverDatasetToJson(DS);
        }


        [WebMethod]
        public string GetEmailFormat(string EmailActivityID, string EmailRecipientID)
        {
            DataManager dm = new DataManager();
            DataSet ds = new DataSet();
            List<ViewParam> _lstParam = new List<ViewParam>();
            _lstParam.Add(new ViewParam() { Name = "@flag", Value = "C" });
            _lstParam.Add(new ViewParam() { Name = "@EmailActivityID", Value = EmailActivityID });
            _lstParam.Add(new ViewParam() { Name = "@EmailRecipientID", Value = EmailRecipientID });
            ds = dm.View.GetDataSet("[E_EmailFormatCreationGetSave]", _lstParam);
            return Common.ConverDatasetToJson(ds);
        }
        //--------------------------SMS Related ------------------------------------//
        //--------------------------Email Related ------------------------------------//

        [WebMethod]
        public string GetEmailConfig()
        {
            DS = DM.View.GetDataSet("USP_EmailConfigurationSetting", lst);
            return Common.ConverDatasetToJson(DS);
        }

        [WebMethod]
        public string GetEmailConfigByID(int id)
        {
            lst.Add(new ViewParam() { Name = "@flag", Value = "E" });
            lst.Add(new ViewParam() { Name = "@EmailConfigSetting_kid", Value = id });
            DS = DM.View.GetDataSet("USP_EmailConfigurationSetting", lst);
            return Common.ConverDatasetToJson(DS);
        }

        [WebMethod]
        public string DeleteEmailConfig(int id)
        {
            lst.Add(new ViewParam() { Name = "@flag", Value = "D" });
            lst.Add(new ViewParam() { Name = "@EmailConfigSetting_kid", Value = id });
            DS = DM.View.GetDataSet("USP_EmailConfigurationSetting", lst);
            return Common.ConverDatasetToJson(DS);
        }

        //--------------------------Email Related ------------------------------------//
        //--------------------------Edit Format Helper Related ------------------------------------//
        [WebMethod]
        public string GetEditorTemplate(string ID)
        {
            DataManager dm = new DataManager();
            DataSet ds = new DataSet();
            List<ViewParam> _lstParam = new List<ViewParam>();
            _lstParam.Add(new ViewParam() { Name = "@formatid", Value = ID });
            _lstParam.Add(new ViewParam() { Name = "@flag", Value = "E" });
            ds = dm.View.GetDataSet("l_Format_GetSave", _lstParam);
            return Common.ConverDatasetToJson(ds);
        }
        //--------------------------Email Related ------------------------------------//

        [WebMethod]
        public string GS_GetSpName(int PageID)
        {
            lst.Add(new ViewParam() { Name = "@PageID", Value = PageID });
            DS = DM.View.GetDataSet("l_WebService_format_SpName", lst);
            return Common.ConverDatasetToJson(DS);

        }
        [WebMethod]
        public string GS_GetData(string TrmID, string spname)
        {
            lst.Add(new ViewParam() { Name = "@trmID", Value = TrmID });
            DS = DM.View.GetDataSet(spname, lst);
            return Common.ConverDatasetToJson(DS);
        }

        [WebMethod]
        public string BookStock(string id, string spname)
        { 
            lst.Add(new ViewParam() { Name = "@id", Value = id });
            DS = DM.View.GetDataSet(spname, lst);
            return Common.ConverDatasetToJson(DS);
        }



    }

}


