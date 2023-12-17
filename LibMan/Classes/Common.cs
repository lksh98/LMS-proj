using GS.Common;
using GS.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Script.Serialization;
using System.Xml;
using System.Xml.Linq;

namespace LibMan
{
    public static class Common
    {
        public static string Encrypt(string toEncrypt, bool useHashing)
        {
            try
            {
                byte[] keyArray;
                byte[] toEncryptArray = UTF8Encoding.UTF8.GetBytes(toEncrypt);

                System.Configuration.AppSettingsReader settingsReader = new AppSettingsReader();
                string key = (string)settingsReader.GetValue("SecurityKey", typeof(String));
                if (useHashing)
                {
                    MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
                    keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
                    hashmd5.Clear();
                }
                else
                    keyArray = UTF8Encoding.UTF8.GetBytes(key);

                TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();
                tdes.Key = keyArray;
                tdes.Mode = CipherMode.ECB;
                tdes.Padding = PaddingMode.PKCS7;

                ICryptoTransform cTransform = tdes.CreateEncryptor();
                byte[] resultArray = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length);
                tdes.Clear();
                return Convert.ToBase64String(resultArray, 0, resultArray.Length);
            }
            catch (Exception ex)
            {
                return ex.Source;

            }
        }


        public static string Decrypt(string cipherString, bool useHashing)
        {
            try
            {
                byte[] keyArray;
                byte[] toEncryptArray = Convert.FromBase64String(cipherString);
                System.Configuration.AppSettingsReader settingsReader = new AppSettingsReader();
                //Get your key from config file to open the lock!
                string key = (string)settingsReader.GetValue("SecurityKey", typeof(String));

                if (useHashing)
                {
                    MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
                    keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
                    hashmd5.Clear();
                }
                else
                    keyArray = UTF8Encoding.UTF8.GetBytes(key);

                TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();
                tdes.Key = keyArray;
                tdes.Mode = CipherMode.ECB;
                tdes.Padding = PaddingMode.PKCS7;

                ICryptoTransform cTransform = tdes.CreateDecryptor();
                byte[] resultArray = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length);

                tdes.Clear();
                return UTF8Encoding.UTF8.GetString(resultArray);
            }
            catch (Exception ex)
            {
                return ex.Source;

            }
        }
        public static void InsertSmsData(string SMSSchedule_Msg, string SMSActivityID, DateTime FollowUpDate, string FollowTime, string Mobno, string procedure, List<ViewParam> _lstview)
        {
            DataManager dm = new DataManager();
            DataSet ds = new DataSet();
            ds = dm.View.GetDataSet(procedure, _lstview);

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                for (int J = 0; J < ds.Tables[0].Columns.Count; J++)
                {
                    SMSSchedule_Msg = ReplaceAddon(SMSSchedule_Msg, ds.Tables[0].Columns[J].ToString(), ds.Tables[0].Rows[0][ds.Tables[0].Columns[J].ToString()].ToString());
                }
            }
            string regex = @"[\[\]]";
            SMSSchedule_Msg = ExtractHtmlInnerText(Regex.Replace(SMSSchedule_Msg, regex, ""));
            SMSSchedule_Msg = Regex.Replace(SMSSchedule_Msg, @"&nbsp;", "");

            SendSMS(SMSActivityID, FollowUpDate, FollowTime, Mobno, SMSSchedule_Msg);
        }


        public static void InsertSms(string message, string mobile)
        {
            DataManager dm = new DataManager();
            List<ViewParam> _lstview = new List<ViewParam>();
            DataSet ds = new DataSet();
            _lstview.Add(new ViewParam() { Name = "@mobno", Value = mobile });
            _lstview.Add(new ViewParam() { Name = "@parseMSG", Value = message });
            ds = dm.View.GetDataSet("USP_SMSSendDataSave", _lstview);
        }


        public static string ReplaceAddon(string msg, string Colname, string colvalue)
        {
            string ReplaceMsg = "";
            ReplaceMsg = msg.Replace("[" + Colname.ToString() + "]", colvalue.ToString());
            return ReplaceMsg;
        }

        public static string ExtractHtmlInnerText(string htmlText)
        {
            Regex regex = new Regex("(<.*?>\\s*)+", RegexOptions.Singleline);
            string resultText = regex.Replace(htmlText, " ").Trim();

            return resultText;
        }
        public static void SendSMS(string SMSActivityID, DateTime FollwUpDate, string FollowTime, string mobno, string parseMSG)
        {
            DataManager dm = new DataManager();
            List<ViewParam> _lstview = new List<ViewParam>();
            DataSet ds = new DataSet();
            _lstview.Add(new ViewParam() { Name = "@SMSActivityID", Value = SMSActivityID });
            _lstview.Add(new ViewParam() { Name = "@appTime", Value = FollowTime });
            _lstview.Add(new ViewParam() { Name = "@appdate", Value = FollwUpDate });
            _lstview.Add(new ViewParam() { Name = "@mobno", Value = mobno });
            _lstview.Add(new ViewParam() { Name = "@parseMSG", Value = parseMSG });
            ds = dm.View.GetDataSet("[USP_SMSSendDataSave]", _lstview);
        }
        public static string ConverDatasetToJson(DataSet dsDownloadJson)
        {
            StringBuilder Sb = new StringBuilder();
            Sb.Append("{");
            foreach (DataTable dtDownloadJson in dsDownloadJson.Tables)
            {
                string HeadStr = string.Empty;
                Sb.Append("\"" + dtDownloadJson.TableName + "1\": [");
                for (int j = 0; j < dtDownloadJson.Rows.Count; j++)
                {
                    string TempStr = HeadStr;
                    Sb.Append("{");
                    for (int i = 0; i < dtDownloadJson.Columns.Count; i++)
                    {
                        string caption = dtDownloadJson.Columns[i].Caption;
                        Sb.Append("\"" + caption + "\" : " + Enquote(dtDownloadJson.Rows[j][i].ToString()) + ",");
                    }
                    Sb.Append(TempStr + "},");
                }
                Sb.Append("],");
            }
            Sb.Append("}");
            return Sb.ToString();
        }
        public static string ConverDatasetToJson(DataSet dsDownloadJson, string TableName)
        {
            StringBuilder Sb = new StringBuilder();
            Sb.Append("{\"ok\":1,");
            foreach (DataTable dtDownloadJson in dsDownloadJson.Tables)
            {
                string HeadStr = string.Empty;
                Sb.Append("\"" + TableName + "\": [");
                for (int j = 0; j < dtDownloadJson.Rows.Count; j++)
                {
                    string TempStr = HeadStr;
                    Sb.Append("{");
                    for (int i = 0; i < dtDownloadJson.Columns.Count; i++)
                    {
                        string caption = dtDownloadJson.Columns[i].Caption;
                        Sb.Append("\"" + caption + "\" : " + Enquote(dtDownloadJson.Rows[j][i].ToString()) + ",");
                    }
                    Sb.Append(TempStr + "},");
                }
                Sb.Append("],");
            }
            Sb.Append("\"ERRORS\":[]}");
            return Sb.ToString();
        }
        public static string Gs_GetDefaultPath(Boolean ISdicomPath = true)
        {
            //20/06/2015
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(HttpContext.Current.Request.MapPath("~/dbCredential.xml"));

            if (ISdicomPath)
            {
                if (xmlDoc.GetElementsByTagName("apppath").Count == 0)
                {
                    XmlElement ele = xmlDoc.CreateElement("apppath");
                    XmlAttribute attr = xmlDoc.CreateAttribute("providername");
                    attr.InnerText = "apppath";
                    ele.Attributes.Append(attr);
                    ele.InnerText = HttpContext.Current.Request.MapPath("~/LibManData/");
                    xmlDoc.DocumentElement.AppendChild(ele);
                    xmlDoc.Save(HttpContext.Current.Request.MapPath("~/dbCredential.xml"));

                    return HttpContext.Current.Request.MapPath("~/LibManData/");
                }
                else
                {
                    XDocument xDoc = XDocument.Load(HttpContext.Current.Request.MapPath("~/dbCredential.xml"));
                    return xDoc.Descendants("apppath").FirstOrDefault().Value.Trim();
                }
            }
            else
            {
                if (xmlDoc.GetElementsByTagName("DicomPath").Count == 0)
                {
                    XmlElement ele = xmlDoc.CreateElement("DicomPath");
                    XmlAttribute attr = xmlDoc.CreateAttribute("providername");
                    attr.InnerText = "DicomPath";
                    ele.Attributes.Append(attr);
                    ele.InnerText = HttpContext.Current.Request.MapPath("~/dicomdata/");
                    xmlDoc.DocumentElement.AppendChild(ele);
                    xmlDoc.Save(HttpContext.Current.Request.MapPath("~/dbCredential.xml"));

                    return HttpContext.Current.Request.MapPath("~/dicomdata/");
                }
                else
                {
                    XDocument xDoc = XDocument.Load(HttpContext.Current.Request.MapPath("~/dbCredential.xml"));
                    return xDoc.Descendants("DicomPath").FirstOrDefault().Value.Trim();
                }
            }
        }
        public static string Gs_GetCompName()
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(HttpContext.Current.Request.MapPath("~/dbCredential.xml"));
            if (xmlDoc.GetElementsByTagName("CompName").Count == 0)
            {

                XmlElement ele = xmlDoc.CreateElement("CompName");
                XmlAttribute attr = xmlDoc.CreateAttribute("providername");
                attr.InnerText = "CompName";
                ele.Attributes.Append(attr);
                ele.InnerText = "Company Name";
                xmlDoc.DocumentElement.AppendChild(ele);
                xmlDoc.Save(HttpContext.Current.Request.MapPath("~/dbCredential.xml"));

                return "Company Name";
            }
            else
            {
                XDocument xDoc = XDocument.Load(HttpContext.Current.Request.MapPath("~/dbCredential.xml"));
                return xDoc.Descendants("CompName").FirstOrDefault().Value;
            }
        }
        public static string Enquote(string s)
        {
            if (s == null || s.Length == 0)
            {
                return "\"\"";
            }
            char c;
            int i;
            int len = s.Length;
            StringBuilder sb = new StringBuilder(len + 4);
            string t;

            sb.Append('"');
            for (i = 0; i < len; i += 1)
            {
                c = s[i];
                if ((c == '\\') || (c == '"') || (c == '>'))
                {
                    sb.Append('\\');
                    sb.Append(c);
                }
                else if (c == '\b')
                    sb.Append("\\b");
                else if (c == '\t')
                    sb.Append("\\t");
                else if (c == '\n')
                    sb.Append("\\n");
                else if (c == '\f')
                    sb.Append("\\f");
                else if (c == '\r')
                    sb.Append("\\r");
                else
                {
                    if (c < ' ')
                    {
                        //t = "000" + Integer.toHexString(c);
                        string tmp = new string(c, 1);
                        t = "000" + int.Parse(tmp, System.Globalization.NumberStyles.HexNumber);
                        sb.Append("\\u" + t.Substring(t.Length - 4));
                    }
                    else
                    {
                        sb.Append(c);
                    }
                }
            }
            sb.Append('"');
            return sb.ToString();
        }
        #region Create Json
        public static string ConverTableToJson(DataTable dtDownloadJson)
        {
            StringBuilder Sb = new StringBuilder();
            Sb.Append("{");

            string HeadStr = string.Empty;
            Sb.Append("\"" + dtDownloadJson.TableName + "1\": [");
            for (int j = 0; j < dtDownloadJson.Rows.Count; j++)
            {
                string TempStr = HeadStr;
                Sb.Append("{");
                for (int i = 0; i < dtDownloadJson.Columns.Count; i++)
                {
                    string caption = dtDownloadJson.Columns[i].Caption;
                    Sb.Append("\"" + caption + "\" : " + Enquote(dtDownloadJson.Rows[j][i].ToString()) + ",");
                }
                Sb.Append(TempStr + "},");
            }
            Sb.Append("],");

            Sb.Append("}");
            return Sb.ToString();
        }
        #endregion
        public static string GetConnectionString()
        {
            XDocument xDoc = XDocument.Load(HttpContext.Current.Request.MapPath("~/dbCredential.xml"));
            string dbName = "ind";
            return Decrypt(xDoc.Descendants(dbName).FirstOrDefault().Value, true);
            //return xDoc.Descendants(dbName).FirstOrDefault().Value;
        }

        public static string GetRandomString()
        {
            Guid result = Guid.NewGuid();
            return Convert.ToString(result);
        }
        public static void FileSave(int id, string path, FileType type  )
        {
            DataManager dm = new DataManager();
            List<ViewParam> _lstview = new List<ViewParam>();
            DataSet ds = new DataSet();
            _lstview.Add(new ViewParam() { Name = "@id", Value = id });
            _lstview.Add(new ViewParam() { Name = "@path", Value = path });
            _lstview.Add(new ViewParam() { Name = "@type", Value = type }); 
            ds = dm.View.GetDataSet("L_FileSave", _lstview);
        }
        // work
        public static void SendPushNotification(DataTable dt)
        {
            try
            {
                if (dt != null && dt.Rows.Count > 0)
                {

                    string senderId = "695686689838";
                    string applicationID = "AAAAofoodC4:APA91bE_YiQ0YXtn_bZjPfrV56m3_zC0yV5OBosiuAamUh-EbHUtQ0Sg_fUSX1YlB2ffL16JARGgpd9VOumNoAh6NTEWPFzTi5SQ470A5f75pbpMF2t2Zl0xQniv_w7DddPucLfwz7Zk";

                    string deviceToken = "";
                    if (dt.Rows[0]["deviceToken"].ToString() != null && dt.Rows[0]["deviceToken"].ToString() != "")
                        deviceToken = dt.Rows[0]["deviceToken"].ToString();
                    string notifyTitle = dt.Rows[0]["NotifyName"].ToString();
                    string Reason = dt.Rows[0]["Reason"].ToString();
                    string tag = "0";
                    string flag = "0";
                    if (dt.Rows[0]["flag"].ToString() != null && dt.Rows[0]["flag"].ToString() != "")
                        flag = dt.Rows[0]["flag"].ToString();
                    WebRequest tRequest = WebRequest.Create("https://fcm.googleapis.com/fcm/send");
                    tRequest.Method = "post";
                    tRequest.ContentType = "application/json";
                    var payload = new
                    {
                        to = deviceToken,
                        notification = new
                        {
                            body = Reason,
                            title = notifyTitle,
                            reason = Reason,
                            flag = flag,
                            click_action = flag,
                            //priority = "normal",
                            sound = "Enabled",
                            tag = tag,
                            show_in_foreground = true
                        },
                        data = new
                        {
                            body = Reason,
                            title = notifyTitle,
                            reason = Reason,
                            flag = flag,
                            click_action = flag,
                            //priority = "normal",
                            sound = "Enabled",
                            tag = tag,
                            show_in_foreground = true
                        },
                    };

                    var serializer = new JavaScriptSerializer();
                    var json = serializer.Serialize(payload);
                    Byte[] byteArray = Encoding.UTF8.GetBytes(json);
                    tRequest.Headers.Add(string.Format("Authorization: key={0}", applicationID));
                    tRequest.Headers.Add(string.Format("Sender: id={0}", senderId));
                    tRequest.ContentLength = byteArray.Length;
                    using (Stream dataStream = tRequest.GetRequestStream())
                    {
                        dataStream.Write(byteArray, 0, byteArray.Length);
                        using (WebResponse tResponse = tRequest.GetResponse())
                        {
                            using (Stream dataStreamResponse = tResponse.GetResponseStream())
                            {
                                using (StreamReader tReader = new StreamReader(dataStreamResponse))
                                {
                                    String sResponseFromServer = tReader.ReadToEnd();
                                    string str = sResponseFromServer;
                                    Exception ex = new Exception();
                                    ErrorHandling.Save(ex, str);
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ErrorHandling.Save(ex, null);
            }
        }

    }

    public static class ErrorHandling
    {
        public static void Save(Exception ex, string responseMsg)
        {
            string Message = string.Empty;
            if (!string.IsNullOrEmpty(responseMsg))
                Message = responseMsg;
            else
                Message = ex.Message;
            string InnerException = ex.InnerException != null ? ex.InnerException.ToString() : "";
            string StackTrace = Environment.StackTrace;
            string Source = ex.Source;
            string filename = HttpContext.Current.Server.MapPath("Error");
            if (!Directory.Exists(filename))
            {
                Directory.CreateDirectory(filename);
            }
            StreamWriter sw = new StreamWriter(filename + "\\Error.txt", true);
            string data = "*********************************" + Environment.NewLine;
            data += "DateTime: " + DateTime.Now + Environment.NewLine;
            data += "Message: " + Message + Environment.NewLine;
            data += "Inner Exception: " + InnerException + Environment.NewLine;
            data += "StackTrace: " + StackTrace + Environment.NewLine;
            data += "Source: " + Source + Environment.NewLine;
            data += "*********************************" + Environment.NewLine;
            sw.WriteLine(data);
            sw.Close();
        }
    }


    public enum FileType
    {
        Book,
        Student,
        Staff
    }
    
    public enum Gender
    {
        Male,
        Female,
        Transgender,
        Other
    }

    public enum MaritalStatus
    {
        Single,
        Married,
        Unmarried,
        Separated,
        Divorced
    }
    public enum Weekdays
    {
        Sunday,
        Monday,
        Tuesday,
        Wednesday,
        Thursday,
        Friday,
        Saturday
    }
    public enum InOut
    {
        InCity,
        OutCity
    }
    public enum TestType
    {
        Tabular,
        Selective,
        Free_Style
    }
    public enum LabType
    {
        Pathology,
        Radiology,
        Consultation

    }
    public enum ConsQuestion
    {
        Yes,
        No

    }
    public enum QuestionType
    {
        Selective,
        Int,
        Year,
        Text
    }

    public class CheckUser
    {
        public int Valid(string LibID, string LibName, string LibType)
        {
            int val = 0;
            try
            {
                if (LibID != "")
                {
                    DataManager dm = new DataManager();
                    DataTable dt = dm.View.Get("select usr_kid,usr_name,UserRoleName , usr_Status from l_usr,UserRole where usr_kid = '" + Common.Decrypt(LibID, true) + "' and UserRoleKid = usr_UserRoleID ");
                    string a = dt.Rows[0]["usr_Status"].ToString();
                    if (dt == null || dt.Rows.Count < 1 || (dt.Rows[0][0].ToString() != Common.Decrypt(LibID, true) && dt.Rows[0][1].ToString() != Common.Decrypt(LibName, true) && dt.Rows[0][2].ToString() != Common.Decrypt(LibType, true)))
                    {
                        val = 1;
                    }
                    else if (dt.Rows[0]["usr_Status"].ToString() == "False")
                    {
                        val = 2;
                    }
                }
                else
                {
                    val = 1;
                }
            }
            catch (Exception ex)
            {
                val = 1;
            }
            return val;
        }
    }
}