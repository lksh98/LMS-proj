<%@ Page Title="SMS Template - Lib-Man" Language="C#" MasterPageFile="~/pages/Admin/Dashboard/Admin.Master" AutoEventWireup="true" ValidateRequest="false" CodeBehind="SMSTemplate.aspx.cs" Inherits="LibMan.pages.Admin.Sms_Email.SMSTemplate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../../Scripts/jquery-clockpicker.min.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row mt-2 mx-1">
        <div class="col-md-2 col-sm-4 mt-">
            <label class="input-label-modal">Activity<i class="fas fa-asterisk text-danger font_8"></i></label>
        </div>
        <div class="col-md-2 col-sm-4 mt-2">
            <asp:DropDownList ID="ddl_str_TemplateName" CssClass="BlankSelect ddl_state form-control all-border border-bottom-2 font-12" runat="server" TabIndex="1"></asp:DropDownList>
        </div>
        <div class="col-md-2 col-sm-4 mt-2">
            <label class="input-label-modal">Type<i class="fas fa-asterisk text-danger font_8"></i></label>
        </div>
        <div class="col-md-2 col-sm-4 mt-2">
            <asp:DropDownList ID="ddl_Type" CssClass="BlankSelect  form-control all-border border-bottom-2 font-12" runat="server" TabIndex="2">
                <asp:ListItem Text="Single" Value="S" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Alternate" Value="A"></asp:ListItem>
                <asp:ListItem Text="Multiple" Value="M"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col-md-2 col-sm-4 mt-2">
            <label class="input-label-modal">Days Before<i class="fas fa-asterisk text-danger font_8"></i></label>
        </div>
        <div class="col-md-2 col-sm-4 mt-2">
            <asp:TextBox ID="txt_Daysbefore" CssClass="BlankText all-border border-bottom-2 font-12 width-100 int" runat="server" TabIndex="3" MaxLength="2"></asp:TextBox>
        </div>

        <div class="col-md-2 col-sm-2 mt-2">
            <label class="input-label-modal">Start Time<i class="fas fa-asterisk text-danger font_8"></i></label>
        </div>
        <div class="col-md-2 col-sm-4 mt-2">
            <asp:TextBox ID="txt_startTime" CssClass="BlankText all-border border-bottom-2 font-12 width-100 int time" runat="server" TabIndex="4" MaxLength="2"></asp:TextBox>
        </div>

        <div class="col-md-2 col-sm-4 mt-2">
            <label class="input-label-modal">Time Before<i class="fas fa-asterisk text-danger font_8"></i></label>
        </div>
        <div class="col-md-2 col-sm-4 mt-2">
            <asp:TextBox ID="txt_timebefore" CssClass="BlankText all-border border-bottom-2 font-12 width-100 int" runat="server" TabIndex="5" MaxLength="2"></asp:TextBox>
        </div>
        <div class="col-md-2 col-sm-4 mt-2">
            <label class="input-label-modal">Time Span<i class="fas fa-asterisk text-danger font_8"></i></label>
        </div>
        <div class="col-md-2 col-sm-4 mt-2">
            <asp:TextBox ID="txt_timespan" TabIndex="6" CssClass="BlankText all-border border-bottom-2 font-12 width-100 int" runat="server" MaxLength="2"></asp:TextBox>
        </div>

    </div>

    <div class="row mt-4 mx-1">
        <div class="col-md-6 col-sm-12">
            <div class="table-background">

                <div class="table-responsive">
                    <!--Table-->

                    <table class="table table-striped" id="tbl_AddOns">
                        <!--Table head-->
                        <thead class="thead-background">
                            <tr>
                                <th class="table-bolder">#</th>
                                <th class="table-bolder">Column Name</th>
                                <th class="table-bolder">Table</th>
                                <th class="table-bolder">Action</th>
                            </tr>
                        </thead>
                    </table>
                    <!--Table-->
                </div>
            </div>
        </div>
        <div class="col-md-6 col-sm-12">
            <div class="ghms_fl margin5 margin3" id="div_Editor">
                <asp:TextBox ID="txt_FormatEditor" TabIndex="7" class="form-control all-border border-bottom-2 font-12 width-100 FormatEditor" Rows="10" autocomplete="off" runat="server" TextMode="MultiLine"></asp:TextBox>
            </div>
        </div>
    </div>
    <div class="row mt-4 mx-1">
        <div class="offset-5 pr-0 col-md-1 col-sm-1 border-left-radius  text-right">
            <asp:ImageButton src="/pages/Admin/images/save.png" class="icon-t-modal" runat="server" ID="btn_Save" OnClick="btn_save_Click" OnClientClick="return Confirm();" TabIndex="8" title="Save"></asp:ImageButton>
        </div>
        <div class="col-sm-1 col-1 border-right-radius text-left">
            <img src="/pages/Admin/images/clear.png" class="icon-t-modal" tabindex="9" onclick="Clear();" title="Clear">
        </div>
    </div>
    <div id="myDiv" style="position: absolute; left: 50; top: 50; visibility: hidden"></div>
    <div id="myDiv_L" style="position: absolute; left: 50; top: 50; visibility: hidden"></div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_BottomScripts" runat="server">
    <script src="../../../Scripts/jquery-clockpicker.min.js"></script>
   <link href="../../../Content/codemirror.css" rel="stylesheet" />
    <link href="../../../Content/monokai.css" rel="stylesheet" />
    <script src="../../../Scripts/codemirror.js"></script>
    <script src="../../../Scripts/xml.js"></script>
    <script src="../../../Scripts/formatting.js"></script>
    <link href="../../../Content/summernote-lite.min.css" rel="stylesheet" />
    <script src="../../../Scripts/summernote.min.js"></script>
    <script type="text/javascript">

        $(function () {
            var table;
            $('#<%=ddl_str_TemplateName.ClientID %>').change(function () {
                GetTemplateData($(this).val());
            });
            SummernoteEditor();
            table = $('#tbl_AddOns').DataTable();

            $(".time").clockpicker({
                align: 'left',
                autoclose: true,
                default: 'now',
                donetext: "Select",

            });

        });
        function SummernoteEditor() {
            $('.FormatEditor').summernote({
                disableResizeEditor: true,
                height: 200,
                codemirror: {
                    theme: 'monokai'
                }
            });
        }

        function GetAddOns(pID, spName) {

            $.ajax({
                type: "POST",
                url: "SMSTemplate.aspx/GS_GetData",
                data: "{'val': " + pID + ",'spName': '" + spName + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                error: OnError
            });
        }


        function OnSuccess(response) {

            var data = eval("(" + response.d + ")");
            table = $('#tbl_AddOns').DataTable({
                bLengthChange: true,
                lengthMenu: [[5], [5]],
                iDisplayLength: 5,
                bFilter: true,
                bSort: true,
                destroy: true,
                bPaginate: true,
                "scrollCollapse": true,
                "scrollY": 200,
                "jQueryUI": true,
                data: data.Table1,
                columns: [{ data: 'datarow', sortable: false, searchable: false },
                { data: 'Column_Name', sortable: true, searchable: true },
                {
                    data: 'Table_No', sortable: true, searchable: true

                },
                {
                    name: "Action", data: null, title: "Action", sortable: false, searchable: false,
                    render: function (data, type, row, meta) {
                        var actionButtons = '';
                        actionButtons += $("<a/>", {
                            class: "btn  btn-sm tb-edit-btn",
                            title: "Add Addons",
                            onclick: "setData('idx_" + row.datarow + "' , '" + row.Table_No + "')",
                            html: $("<i/>", {
                                class: "fa fa-arrow-right"
                            }).get(0).outerHTML
                        }).get(0).outerHTML;
                        actionButtons += $("<input/>", {
                            type: "hidden",
                            id: "idx_" + row.datarow,
                            value: row.Column_Name,
                            title: row.FEDBCoulmns_ImageType
                        }).get(0).outerHTML;

                        return actionButtons;
                    }
                }]
            });
        }

        //-----------------------------------------------------------------------End Bind Data Table---------------------------------------------------------------------------------//

        function GetTemplateData(myVal) {
            $.ajax({
                type: "POST",
                url: "/Classes/Services.asmx/GetSMSTemplate",
                data: "{'SMSActivityID': '" + myVal + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (retVal) {
                    var obj = eval("(" + retVal.d + ")");


                    if (JSON.stringify(obj.Table1) != "[]") {

                        $('#<%=ddl_Type.ClientID %>').val(obj.Table1[0].SMSSchedule_Type);
                        $('#<%=txt_timespan.ClientID %>').val(obj.Table1[0].SMSSchedule_TimeSpan);
                        $('#<%=txt_timebefore.ClientID %>').val(obj.Table1[0].SMSSchedule_TimeBefore);
                        $('#<%=txt_startTime.ClientID %>').val(obj.Table1[0].SMSSchedule_StartTime);
                        $('#<%=txt_Daysbefore.ClientID %>').val(obj.Table1[0].SMSSchedule_DaysBefore);
                        $('.FormatEditor').summernote('code', obj.Table1[0].SMSSchedule_Msg);
                        GetAddOns(myVal, obj.Table1[0].SMSActivity_AddonProcedure);
                    }
                    else {
                        $('.FormatEditor').summernote('reset');
                        $('#<%=ddl_Type.ClientID %>').val('S');
                        $('#<%=txt_timespan.ClientID %>').val('');
                        $('#<%=txt_timebefore.ClientID %>').val('');
                        $('#<%=txt_startTime.ClientID %>').val('');
                        $('#<%=txt_Daysbefore.ClientID %>').val('');
                        table.clear();
                        table.destroy();
                        table = $('#tbl_AddOns').DataTable();
                    }
                },
                error: function () { }
            });
        }





        function setData(pID, eleClass) {

            //var type = $('#' + pID).attr('title');
            var val = $('#' + pID).val();
            var sel = $('.FormatEditor').summernote('editor.getLastRange');
            var node = window.getSelection().anchorNode.parentNode.parentNode;
            if ($(node).closest('span').length > 0) {
                if (!$(node).closest('p').hasClass(eleClass)) {//alert('sd');
                    $(node).closest('p').addClass(eleClass);
                }
            }
            else {
                if (!$(node).hasClass(eleClass)) {
                    $(node).addClass(eleClass);
                }
            }
            sel.pasteHTML('<span class="GS_Value">[' + val + ']</span>');

        }
        function OnError(err) {
            alert(err)
        }



        function Confirm() {
            $('#<%=txt_FormatEditor.ClientID%>').val($('.FormatEditor').summernote('code'));
            return Fn_Save();
        }



        function Save(response) {
            if (response == "1") {
                MsgArray[0] = Msg["Update"];
                MsgColor(false);
                MsgAlert();
                $('.close').click();
                Clear();
            }
            else if (response == "2") {
                MsgArray[0] = Msg["Insert"];
                MsgColor(false);
                MsgAlert();
                $('.close').click();
                Clear();
            }
            else if (response == "3") {
                MsgArray[0] = Msg["Already"];
                MsgColor(true);
                MsgAlert();
            }
        }

        function Clear() {
            $('#<%=ddl_str_TemplateName.ClientID %>').val('0');
            $('#<%=ddl_Type.ClientID %>').val('S');
            $('#<%=txt_timespan.ClientID %>').val('');
            $('#<%=txt_timebefore.ClientID %>').val('');
            $('#<%=txt_startTime.ClientID %>').val('');
            $('#<%=txt_Daysbefore.ClientID %>').val('');
            SummernoteEditor();
            $('.FormatEditor').summernote('reset');
            table.clear();
            table.destroy();
            table = $('#tbl_AddOns').DataTable();
        }

    </script>

</asp:Content>
