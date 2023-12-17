using GS.Common;
using GS.Data;
using LibMan;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pages.ManageFormats
{
    public partial class ManageFormatsHelper : System.Web.UI.Page
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

            if (!Page.IsPostBack)
            {
                GS_BindData();
                ddl_mnumname.Focus();
            }
        }

        private void GS_BindData()
        {
            DataManager dm = new DataManager();
            List<ViewParam> _lstview = new List<ViewParam>();
            DataSet ds = new DataSet();
            _lstview.Add(new ViewParam() { Name = "@flag", Value = "L" });
            ds = dm.View.GetDataSet("M_FormatTemplate_GetSave", _lstview);

            ddl_mnumname.DataSource = ds.Tables[0];
            ddl_mnumname.DataTextField = "mnum_name";
            ddl_mnumname.DataValueField = "mnum_kid";
            ddl_mnumname.DataBind();
            ddl_mnumname.Items.Insert(0, new ListItem("-------Select Module---------", "0"));

            txt_FormatName.Text = "";
        }

        protected void ddl_mnumname_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataManager dm = new DataManager();
            List<ViewParam> _lstview = new List<ViewParam>();
            DataSet ds = new DataSet();
            _lstview.Add(new ViewParam() { Name = "@flag", Value = "M" });
            if (ddl_mnumname.SelectedValue != "0")
                _lstview.Add(new ViewParam() { Name = "@mnumid", Value = ddl_mnumname.SelectedValue });
            ds = dm.View.GetDataSet("M_FormatTemplate_GetSave", _lstview);
            ddl_pagename.DataSource = ds.Tables[0];
            ddl_pagename.DataTextField = "Format_ename";
            ddl_pagename.DataValueField = "Format_kid";
            ddl_pagename.DataBind();
            ddl_pagename.Items.Insert(0, new ListItem("-------Parent---------", "0"));

            ddl_FormatParent.Items.Clear();
            ddl_FormatParent.Items.Insert(0, new ListItem("-------Parent---------", "0"));

            rptr.DataSource = null;
            rptr.DataBind();

            txt_FormatName.Text = "";
            hdn_sampleTypeid.Value = "0";
            hdn_type.Value = "";
            hdn_linktab.Value = "";

            ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString(), "  BindDatatable(); ", true);
        }

        protected void ddl_pagename_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataManager dm = new DataManager();
            List<ViewParam> _lstview = new List<ViewParam>();
            DataSet ds = new DataSet();

            if (rdbtn_Body.Checked)
                _lstview.Add(new ViewParam() { Name = "@Ftype", Value = "B" });
            else if (rdbtn_Footer.Checked)
                _lstview.Add(new ViewParam() { Name = "@Ftype", Value = "F" });
            else if (rdbtn_Header.Checked)
                _lstview.Add(new ViewParam() { Name = "@Ftype", Value = "H" });
            else if (rdbtn_Label.Checked)
                _lstview.Add(new ViewParam() { Name = "@Ftype", Value = "L" });
            //else if (rdbtn_Email.Checked)
            //    _lstview.Add(new ViewParam() { Name = "@Ftype", Value = "E" });
            else if (rdbtn_oph.Checked)
                _lstview.Add(new ViewParam() { Name = "@Ftype", Value = "OH" });
            else if (rdbtn_lpf.Checked)
                _lstview.Add(new ViewParam() { Name = "@Ftype", Value = "LF" });

            _lstview.Add(new ViewParam() { Name = "@flag", Value = "A" });
            _lstview.Add(new ViewParam() { Name = "@activityID", Value = ddl_pagename.SelectedValue });
            if (ddl_mnumname.SelectedValue != "0")
                _lstview.Add(new ViewParam() { Name = "@mnumid", Value = ddl_mnumname.SelectedValue });
            ds = dm.View.GetDataSet("M_FormatTemplate_GetSave", _lstview);
            ddl_FormatParent.DataSource = ds.Tables[0];
            ddl_FormatParent.DataTextField = "FormatTemplate_ename";
            ddl_FormatParent.DataValueField = "FormatTemplate_kid";
            ddl_FormatParent.DataBind();
            ddl_FormatParent.Items.Insert(0, new ListItem("-------Parent---------", "0"));

            rptr.DataSource = ds.Tables[1];
            rptr.DataBind();

            txt_FormatName.Text = "";
            hdn_sampleTypeid.Value = "0";
            hdn_type.Value = "";
            hdn_linktab.Value = "";

            ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString(), "  BindDatatable();", true);
        }

        protected void rdbtn_CheckedChanged(object sender, EventArgs e)
        {
            DataManager dm = new DataManager();
            List<ViewParam> _lstview = new List<ViewParam>();
            DataSet ds = new DataSet();

            if (rdbtn_Body.Checked)
                _lstview.Add(new ViewParam() { Name = "@Ftype", Value = "B" });
            else if (rdbtn_Footer.Checked)
                _lstview.Add(new ViewParam() { Name = "@Ftype", Value = "F" });
            else if (rdbtn_Header.Checked)
                _lstview.Add(new ViewParam() { Name = "@Ftype", Value = "H" });
            else if (rdbtn_Label.Checked)
                _lstview.Add(new ViewParam() { Name = "@Ftype", Value = "L" });
            //else if (rdbtn_Email.Checked)
            //    _lstview.Add(new ViewParam() { Name = "@Ftype", Value = "E" });
            else if (rdbtn_oph.Checked)
                _lstview.Add(new ViewParam() { Name = "@Ftype", Value = "OH" });
            else if (rdbtn_lpf.Checked)
                _lstview.Add(new ViewParam() { Name = "@Ftype", Value = "LF" });

            _lstview.Add(new ViewParam() { Name = "@flag", Value = "A" });
            _lstview.Add(new ViewParam() { Name = "@activityID", Value = ddl_pagename.SelectedValue });
            if (ddl_mnumname.SelectedValue != "0")
                _lstview.Add(new ViewParam() { Name = "@mnumid", Value = ddl_mnumname.SelectedValue });
            ds = dm.View.GetDataSet("M_FormatTemplate_GetSave", _lstview);
            ddl_FormatParent.DataSource = ds.Tables[0];
            ddl_FormatParent.DataTextField = "FormatTemplate_ename";
            ddl_FormatParent.DataValueField = "FormatTemplate_kid";
            ddl_FormatParent.DataBind();
            ddl_FormatParent.Items.Insert(0, new ListItem("-------Parent---------", "0"));

            rptr.DataSource = ds.Tables[1];
            rptr.DataBind();

            txt_FormatName.Text = "";
            hdn_sampleTypeid.Value = "0";
            hdn_type.Value = "";
            hdn_linktab.Value = "";

            ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString(), "  BindDatatable(); ", true);
        }

        protected void btn_ok_Click(object sender, EventArgs e)
        {
            string mType = "B";
            if (Request.QueryString["FormatType"] == null)
            {
                if (rdbtn_Footer.Checked)
                    mType = "F";
                else if (rdbtn_Header.Checked)
                    mType = "H";
                else if (rdbtn_Label.Checked)
                    mType = "L";
                //else if (rdbtn_Email.Checked)
                //    mType = "E";
                else if (rdbtn_oph.Checked)
                    mType = "OH";
                else if (rdbtn_lpf.Checked)
                    mType = "LF";
            }
            else
            {
                mType = Request.QueryString["FormatType"].ToString().Trim();
            }
            string parentID = null;
            if (ddl_FormatParent.SelectedValue != "0")
                parentID = ddl_FormatParent.SelectedValue;
            DataManager dm = new DataManager();
            List<ViewParam> _lstview = new List<ViewParam>();
            DataSet ds = new DataSet();
            _lstview.Add(new ViewParam() { Name = "@flag", Value = "S" });
            _lstview.Add(new ViewParam() { Name = "@usrid", Value = Common.Decrypt(Request.Cookies["LibID"].Value.ToString(), true) });
            _lstview.Add(new ViewParam() { Name = "@parentid", Value = parentID });
            _lstview.Add(new ViewParam() { Name = "@ftype", Value = mType });
            _lstview.Add(new ViewParam() { Name = "@FormatName", Value = txt_FormatName.Text });
            if (hdn_sampleTypeid.Value != "0")
                _lstview.Add(new ViewParam() { Name = "@Formatid", Value = hdn_sampleTypeid.Value });
            if (ddl_pagename.SelectedValue != "0")
                _lstview.Add(new ViewParam() { Name = "@activityID", Value = ddl_pagename.SelectedValue });

            _lstview.Add(new ViewParam() { Name = "@status", Value = chk_status.Checked });
            ds = dm.View.GetDataSet("M_FormatTemplate_GetSave", _lstview);
            if (ds != null && ds.Tables.Count > 0)
            {
                GS_ClearData();
                ScriptManager.RegisterStartupScript(this.Page, GetType(), Guid.NewGuid().ToString(), "Save('" + ds.Tables[0].Rows[0][0].ToString() + "')", true);
            }

        }

        private void GS_ClearData()
        {
            hdn_sampleTypeid.Value = "0";
            hdn_type.Value = "";
            hdn_linktab.Value = "";
            txt_FormatName.Text = string.Empty;
            ddl_FormatParent.Focus();
            lbl_mode.Text = "New Mode";
            ddl_FormatParent.Enabled = true;

            DataManager dm = new DataManager();
            List<ViewParam> _lstview = new List<ViewParam>();
            DataSet ds = new DataSet();

            if (rdbtn_Body.Checked)
                _lstview.Add(new ViewParam() { Name = "@Ftype", Value = "B" });
            else if (rdbtn_Footer.Checked)
                _lstview.Add(new ViewParam() { Name = "@Ftype", Value = "F" });
            else if (rdbtn_Header.Checked)
                _lstview.Add(new ViewParam() { Name = "@Ftype", Value = "H" });
            else if (rdbtn_Label.Checked)
                _lstview.Add(new ViewParam() { Name = "@Ftype", Value = "L" });
            //else if (rdbtn_Email.Checked)
            //    _lstview.Add(new ViewParam() { Name = "@Ftype", Value = "E" });
            else if (rdbtn_oph.Checked)
                _lstview.Add(new ViewParam() { Name = "@Ftype", Value = "OH" });
            else if (rdbtn_lpf.Checked)
                _lstview.Add(new ViewParam() { Name = "@Ftype", Value = "LF" });

            _lstview.Add(new ViewParam() { Name = "@flag", Value = "A" });
            _lstview.Add(new ViewParam() { Name = "@activityID", Value = ddl_pagename.SelectedValue });
            if (ddl_mnumname.SelectedValue != "0")
                _lstview.Add(new ViewParam() { Name = "@mnumid", Value = ddl_mnumname.SelectedValue });
            ds = dm.View.GetDataSet("M_FormatTemplate_GetSave", _lstview);
            ddl_FormatParent.DataSource = ds.Tables[0];
            ddl_FormatParent.DataTextField = "FormatTemplate_ename";
            ddl_FormatParent.DataValueField = "FormatTemplate_kid";
            ddl_FormatParent.DataBind();
            ddl_FormatParent.Items.Insert(0, new ListItem("-------Parent---------", "0"));

            rptr.DataSource = ds.Tables[1];
            rptr.DataBind();
        }

        protected void rptr_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                lbl_mode.Text = "Edit Mode";
                hdn_sampleTypeid.Value = e.CommandArgument.ToString();
                Label lbl = new Label();
                lbl = (Label)e.Item.FindControl("lbl_formatname");
                txt_FormatName.Text = lbl.Text;
                ddl_FormatParent.Focus();
                HiddenField hdnid = new HiddenField();
                hdnid = (HiddenField)e.Item.FindControl("HiddenField1");
                HiddenField hdn_status = new HiddenField();
                hdn_status = (HiddenField)e.Item.FindControl("hdn_status");
                HiddenField hdn_mnuid = new HiddenField();
                hdn_mnuid = (HiddenField)e.Item.FindControl("hdn_mnuid");
                ddl_mnumname.SelectedValue = hdn_mnuid.Value;

                HiddenField hdn_pageid = new HiddenField();
                hdn_pageid = (HiddenField)e.Item.FindControl("hdn_pageid");
                ddl_pagename.SelectedValue = hdn_pageid.Value;

                ddl_FormatParent.SelectedValue = hdnid.Value;
                if (hdnid.Value == "0")
                {
                    ddl_FormatParent.Enabled = true;
                }
                hdnid = (HiddenField)e.Item.FindControl("HiddenField2");
                hdn_type.Value = hdnid.Value.Trim();
                if (hdnid.Value.Trim() == "B")
                {
                    rdbtn_Body.Checked = true;
                    rdbtn_Footer.Checked = false;
                    rdbtn_Header.Checked = false;
                    rdbtn_Label.Checked = false;
                    // rdbtn_Email.Checked = false;
                    rdbtn_oph.Checked = false;
                    rdbtn_lpf.Checked = false;
                }
                else if (hdnid.Value.Trim() == "H")
                {
                    rdbtn_Header.Checked = true;
                    rdbtn_Body.Checked = false;
                    rdbtn_Footer.Checked = false;
                    rdbtn_Label.Checked = false;
                    //  rdbtn_Email.Checked = false;
                    rdbtn_oph.Checked = false;
                    rdbtn_lpf.Checked = false;
                }
                else if (hdnid.Value.Trim() == "F")
                {
                    rdbtn_Footer.Checked = true;
                    rdbtn_Header.Checked = false;
                    rdbtn_Body.Checked = false;
                    rdbtn_Label.Checked = false;
                    //  rdbtn_Email.Checked = false;
                    rdbtn_oph.Checked = false;
                    rdbtn_lpf.Checked = false;
                }
                else if (hdnid.Value.Trim() == "L")
                {
                    rdbtn_Label.Checked = true;
                    rdbtn_Footer.Checked = false;
                    rdbtn_Header.Checked = false;
                    rdbtn_Body.Checked = false;
                    //                    rdbtn_Email.Checked = false;
                    rdbtn_oph.Checked = false;
                    rdbtn_lpf.Checked = false;
                }
                //else if (hdnid.Value.Trim() == "E")
                //{
                // //   rdbtn_Email.Checked = true;
                //    rdbtn_Label.Checked = false;
                //    rdbtn_Footer.Checked = false;
                //    rdbtn_Header.Checked = false;
                //    rdbtn_Body.Checked = false;
                //    rdbtn_oph.Checked = false;
                //    rdbtn_lpf.Checked = false;
                //}
                else if (hdnid.Value.Trim() == "OH")
                {
                    rdbtn_oph.Checked = true;
                    rdbtn_Footer.Checked = false;
                    rdbtn_Header.Checked = false;
                    rdbtn_Body.Checked = false;
                    //  rdbtn_Email.Checked = false;
                    rdbtn_Label.Checked = false;
                    rdbtn_lpf.Checked = false;
                }
                else if (hdnid.Value.Trim() == "LF")
                {
                    rdbtn_lpf.Checked = true;
                    // rdbtn_Email.Checked = true;
                    rdbtn_Label.Checked = false;
                    rdbtn_Footer.Checked = false;
                    rdbtn_Header.Checked = false;
                    rdbtn_Body.Checked = false;
                    rdbtn_oph.Checked = false;
                }


                chk_status.Checked = Convert.ToBoolean(hdn_status.Value.Trim());
                HiddenField hdn_linktable = new HiddenField();
                hdn_linktable = (HiddenField)e.Item.FindControl("hdn_linktable");
                hdn_linktab.Value = hdn_linktable.Value;
                ScriptManager.RegisterStartupScript(this.Page, GetType(), Guid.NewGuid().ToString(), "BindDatatable();", true);
            }
            if (e.CommandName == "Delete")
            {
                hdn_sampleTypeid.Value = e.CommandArgument.ToString();
                DataManager dm = new DataManager();
                List<ViewParam> _lstview = new List<ViewParam>();
                DataSet ds = new DataSet();
                _lstview.Add(new ViewParam() { Name = "@flag", Value = "D" });
                _lstview.Add(new ViewParam() { Name = "@Formatid", Value = hdn_sampleTypeid.Value });
                ds = dm.View.GetDataSet("M_FormatTemplate_GetSave", _lstview);
                if (ds != null && ds.Tables.Count > 0)
                {
                    GS_ClearData();
                    ScriptManager.RegisterStartupScript(this.Page, GetType(), Guid.NewGuid().ToString(), "DeleteResponse('" + ds.Tables[0].Rows[0][0].ToString() + "')", true);
                }

            }
        }

        protected void btn_new_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageFormatsHelper.aspx");
        }

        //protected void btn_view_Click(object sender, EventArgs e)
        //{
        //    DataManager dm = new DataManager();
        //    List<ViewParam> _lstview = new List<ViewParam>();
        //    DataSet ds = new DataSet();
        //    _lstview.Add(new ViewParam() { Name = "@flag", Value = "G" });
        //    _lstview.Add(new ViewParam() { Name = "@activityID", Value = ddl_pagename.SelectedValue });
        //    if (ddl_mnumname.SelectedValue != "0")
        //        _lstview.Add(new ViewParam() { Name = "@mnumid", Value = ddl_mnumname.SelectedValue });
        //    ds = dm.View.GetDataSet("M_FormatTemplate_GetSave", _lstview);
        //    if (ds.Tables[0].Rows.Count > 0)
        //    {
        //        lbl_sp.Text = ds.Tables[0].Rows[0]["Format_spname"].ToString();
        //        lbl_table.Text = ds.Tables[0].Rows[0]["Format_linkTable"].ToString();
        //    }
        //    else
        //    {
        //        lbl_sp.Text = "";
        //        lbl_table.Text = "";
        //    }
        //    ScriptManager.RegisterStartupScript(this.Page, GetType(), Guid.NewGuid().ToString(), "popupextender();", true);
        //}

        protected void btn_FormatLink_Click(object sender, EventArgs e)
        {
            DataManager dm = new DataManager();
            List<ViewParam> _lstview = new List<ViewParam>();
            DataSet ds = new DataSet();
            _lstview.Add(new ViewParam() { Name = "@flag", Value = "G" });
            _lstview.Add(new ViewParam() { Name = "@activityID", Value = ddl_pagename.SelectedValue });
            if (ddl_mnumname.SelectedValue != "0")
                _lstview.Add(new ViewParam() { Name = "@mnumid", Value = ddl_mnumname.SelectedValue });
            ds = dm.View.GetDataSet("M_FormatTemplate_GetSave", _lstview);
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["Format_spname"].ToString() != "" && ds.Tables[0].Rows[0]["Format_spname"].ToString() != null)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString(), "BindDatatable(); fn_LinkTable();", true);
                }
            }
        }
    }
}