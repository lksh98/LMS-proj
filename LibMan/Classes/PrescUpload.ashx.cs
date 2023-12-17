using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace LibMan.Classes
{
    /// <summary>
    /// Summary description for PrescUpload
    /// </summary>
    public class PrescUpload : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;
            try
            {
                //  string appliviewpath = Common.Gs_GetDefaultPath();
                string DirectPath = context.Request.Cookies["DirectPath"].Value;
                string rnd = context.Request.Cookies["rnd"].Value;
                foreach (string s in context.Request.Files)
                {
                    HttpPostedFile postedFile = context.Request.Files[s];
                    string filename = "1" + rnd + postedFile.FileName.Substring(postedFile.FileName.IndexOf("."));
                    postedFile.SaveAs(DirectPath + @"\" + filename);

                    //context.Response.Write(filename);
                    context.Response.StatusCode = 200;
                }
            }
            catch (Exception ex)
            {
                context.Response.Write("Error: " + ex.Message);
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}