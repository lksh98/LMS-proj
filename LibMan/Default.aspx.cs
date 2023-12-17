using GS.Common;
using GS.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;

namespace LibMan
{
    public partial class _Default : Page
    {
        private static bool status { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.Cookies["usrname"] != null)
                    txtUserName.Text = Request.Cookies["usrname"].Value;

                if (Request.Cookies["pwd"] != null)
                    txtUserPass.Attributes.Add("value", Request.Cookies["pwd"].Value);

                if (Request.Cookies["usrname"] != null && Request.Cookies["pwd"] != null)
                    chk_remem.Checked = true;

                clearCookies();
                Response.Cookies["dbName"].Value = "ind";
                Response.Cookies["dbName"].Expires = DateTime.Now.AddHours(8);
            }
        }



        protected void btn_login_Click(object sender, EventArgs e)
        {
            ViewState["LoginDt"] = null;
            DataManager dm = new DataManager();
            DataTable dt = dm.View.Get("select usr_kid,usr_name,UserRoleName, Usr_login from L_usr,UserRole where usr_code = '" + txtUserName.Text.Trim() + "' and UserRoleKid = usr_UserRoleID ");
            if (dt != null && dt.Rows.Count > 0)
            {
                //if (Convert.ToBoolean(dt.Rows[0]["Usr_login"].ToString()) == true)
                //{
                    if (ValidateUser(txtUserName.Text.Trim(), txtUserPass.Text, false))
                    {
                        LoginSucess(Common.Decrypt(Request.Cookies["LibType"].Value, true));
                    }
                    else
                    {
                        Response.Cookies.Clear();
                    }
                //}
                //else
                //{
                //    hdn_userkid.Value = dt.Rows[0]["usr_kid"].ToString();
                //    hdn_usercode.Value = Common.Encrypt(txtUserName.Text.Trim(), true);
                //    hdn_userpasswd.Value = Common.Encrypt(txtUserPass.Text.Trim(), true);
                //    ScriptManager.RegisterStartupScript(this.Page, GetType(), Guid.NewGuid().ToString(), "Agreementshow('" + dt.Rows[0]["UserRoleName"].ToString() + "');", true);
                //}
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, GetType(), Guid.NewGuid().ToString(), "InValidUser();", true);
            }

        }

        protected void btn_agrement_Click(object sender, EventArgs e)
        {
            if (ValidateUser(Common.Decrypt(hdn_usercode.Value.Trim(), true), Common.Decrypt(hdn_userpasswd.Value.Trim(), true), false))
            {
                LoginSucess(Common.Decrypt(Request.Cookies["LibType"].Value, true));
            }
            else
            {
                Response.Cookies.Clear();
            }
        }



        private void clearCookies()
        {
            Response.Cookies["LibType"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["LibName"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["LibID"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["LibUsr"].Expires = DateTime.Now.AddDays(-1);
        }
        private bool SetCookies()
        {
            if (ViewState["LoginDt"] != null)
            {
                DataTable dt = (DataTable)ViewState["LoginDt"];
                if (dt != null && dt.Rows.Count > 0 && dt.Rows[0][0].ToString() != "")
                {
                    if (chk_remem.Checked == true)
                    {
                        Response.Cookies["usrname"].Value = txtUserName.Text;
                        Response.Cookies["pwd"].Value = txtUserPass.Text;
                        Response.Cookies["usrname"].Expires = DateTime.Now.AddDays(15);
                        Response.Cookies["pwd"].Expires = DateTime.Now.AddDays(15);
                    }
                    else
                    {
                        Response.Cookies["usrname"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["pwd"].Expires = DateTime.Now.AddDays(-1);
                    }
                    Response.Cookies["LibType"].Value = Common.Encrypt(dt.Rows[0][0].ToString(), true);
                    Response.Cookies["LibType"].Expires = DateTime.Now.AddHours(8);

                    Response.Cookies["LibName"].Value = Common.Encrypt(dt.Rows[0][2].ToString(), true);
                    Response.Cookies["LibName"].Expires = DateTime.Now.AddHours(8);

                    Response.Cookies["LibID"].Value = Common.Encrypt(dt.Rows[0][1].ToString(), true);
                    Response.Cookies["LibID"].Expires = DateTime.Now.AddHours(8);

                    Response.Cookies["LibUsr"].Value = Common.Encrypt(dt.Rows[0][3].ToString(), true);
                    Response.Cookies["LibUsr"].Expires = DateTime.Now.AddHours(8);

                    Response.Cookies["Cache"].Value = "N";
                    Response.Cookies["Cache"].Expires = DateTime.Now.AddHours(8);

                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }


        private bool ValidateUser(string userName, string passWord, bool OTPAuthenticate)
        {
            try
            {
                DataTable dt;
                dt = CheckPassword(userName, passWord);

                ViewState["LoginDt"] = dt;
                if (dt.Rows.Count > 0 && (dt.Rows[0][0].ToString() != "InValid" && dt.Rows[0][0].ToString() != ""))
                {
                    return SetCookies();
                }
                else
                {
                    if (dt.Rows.Count > 0 && dt.Rows[0][0].ToString() == "InValid")
                        ScriptManager.RegisterStartupScript(this.Page, GetType(), Guid.NewGuid().ToString(), "InValidUser();", true);
                    else if (dt.Rows.Count > 0 && dt.Rows[0][0].ToString() == "")
                        ScriptManager.RegisterStartupScript(this.Page, GetType(), Guid.NewGuid().ToString(), "CorrectPass();", true);
                    else
                        ScriptManager.RegisterStartupScript(this.Page, GetType(), Guid.NewGuid().ToString(), "CorrectUser();", true);
                    return false;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public DataTable CheckPassword(string usrname, string pwd)
        {
            DataManager dm = new DataManager();
            DataTable dt = dm.View.Get("select usr_pswd,usr_kid,usr_name,UserRoleName, usr_id, Usr_login, usr_Status from l_usr,UserRole where usr_code = '" + usrname + "' and UserRoleKid = usr_UserRoleID ");

            if (dt.Rows.Count > 0)
            {
                string paswd = dt.Rows[0][0].ToString();
                status = Convert.ToBoolean(dt.Rows[0]["usr_status"].ToString());
                string decryptpwd = Common.Decrypt(paswd, true);
                bool f = (0 == string.Compare(pwd, decryptpwd, false));
                DataTable dt1 = new DataTable();
                dt1.Columns.Add("Type", typeof(string));
                dt1.Columns.Add("ID", typeof(int));
                dt1.Columns.Add("UserName", typeof(string));
                dt1.Columns.Add("usrid", typeof(string));
                dt1.Columns.Add("Usr_login", typeof(bool));

                if (f == true)
                {
                    dt1.Rows.Add(dt.Rows[0][3], dt.Rows[0][1], dt.Rows[0][2], dt.Rows[0][4], dt.Rows[0][5]);
                }
                else
                {
                    dt1.Rows.Add("", dt.Rows[0][1]);
                }
                return dt1;
            }
            else
            {
                return dt = new DataTable();
            }
        }
        private void LoginSucess(string UserType)
        {
            FormsAuthentication.SetAuthCookie(txtUserName.Text.Trim(), false);

            #region Update dashbord cache file at login time
            string fileName = "DashboardCache_" + 1 + ".txt";
            string filePath = HttpContext.Current.Server.MapPath("~/UserCache/" + fileName);
            if (File.Exists(filePath))
            {
                File.WriteAllText(filePath, DateTime.Now.ToString());
            }
            #endregion
            if (status == true)
            {
                Response.Redirect("~/pages/user/dashboard.aspx");
            }
            else
            {
                Response.Redirect("~/pages/user/profile.aspx");
            }
        }


        [WebMethod]
        public static string GetOTP(string username)
        {
            DataManager dm = new DataManager();
            DataTable dt = new DataTable();
            dt = dm.View.Get("select Usr_name,usr_contact from l_usr where usr_code='" + username + "'");
            if (dt != null && dt.Rows.Count > 0)
            {
                string name = dt.Rows[0][0].ToString();
                var chars = "1234567890";
                var random = new Random();
                var result = new string(Enumerable.Repeat(chars, 4).Select(s => s[random.Next(s.Length)]).ToArray());
                string MsgEmailFormat = "Dear " + dt.Rows[0][0].ToString() + " thanks for associating with LibMan. Your OTP for password reset is " + result + " Valid for 5 minutes only.";
                Common.InsertSms(MsgEmailFormat, dt.Rows[0][1].ToString());
                return Common.Encrypt(result, true);
            }
            else
            {
                return "0";
            }

        }
        [WebMethod]
        public static string VerifyOTP(string OTP, string hdn)
        {
            if (OTP == Common.Decrypt(hdn, true))
            {
                return "1";
            }
            else
            {
                return "0";
            }

        }



        [WebMethod]
        public static string ResetPassword(string User, string Password)
        {
            DataManager DM = new DataManager();
            List<ViewParam> lst = new List<ViewParam>();
            DataSet DS = new DataSet();
            string password = Common.Encrypt(Password, true);

            if (User != "")
                lst.Add(new ViewParam() { Name = "@user", Value = User });
            if (password != "")
                lst.Add(new ViewParam() { Name = "@password", Value = password });

            DS = DM.View.GetDataSet("[l_UpdatePaswd_save]", lst);
            if (DS != null)
                return DS.Tables[0].Rows[0][0].ToString();
            else
                return "0";

        }


    }
}