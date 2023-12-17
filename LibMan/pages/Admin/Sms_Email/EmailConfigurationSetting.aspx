<%@ Page Title="Email Configuration Setting - Lib-Man" Language="C#" MasterPageFile="~/pages/Admin/Dashboard/Admin.Master"
    AutoEventWireup="true" CodeBehind="EmailConfigurationSetting.aspx.cs" Inherits="LibMan.pages.Admin.Sms_Email.EmailConfigurationSetting"
    EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <input type="hidden" id="hdn_id" runat="server" />
    <section class="table-background">
        <div class="table-responsive">
            <!--Table-->
            <div class="addNew">
                <a href="#" data-backdrop="static" data-target="#SmsconfigPopup" data-toggle="modal" class="btn btn-custom mrg-l15" onclick="Add();" title="Add New Configuration"><i class="fa fa-plus-circle"></i>Add New</a>
            </div>
            <table class="table table-striped" id="tbl_smsconfig">
                <!--Table head-->
                <thead class="thead-background">
                    <tr>
                        <th class="table-bolder">#</th>
                        <th class="table-bolder">Server Name</th>
                        <th class="table-bolder">From Email ID</th>
                        <th class="table-bolder">Default</th>
                        <th class="table-bolder">Action</th>
                    </tr>
                </thead>
            </table>
            <!--Table-->
        </div>
    </section>
    <div class="modal" id="SmsconfigPopup">
        <asp:UpdatePanel runat="server" ID="update">
            <ContentTemplate>
                <div class="modal-dialog9 modal-dialog-centered">
                    <div class="modal-content pb-4">
                        <!-- Modal Header -->
                        <div class="modal-header">
                            <p class="modal-title text-center m-auto">Email Configuration </p>
                            <button type="button" class="close" data-dismiss="modal" onclick="Clear();">&times;</button>
                        </div>
                        <!-- Modal body -->
                        <div class="modal-body">
                            <section>
                                <div class="row  border-bottom-1">
                                    <div class="col-md-10 col-sm-8 col-5 mt-2">
                                        <h3 id="Config_head" class="heading-modal">Add Email Confifguration</h3>
                                    </div>
                                    <div class="col-sm-1 pr-0 col-2 border-left-radius text-right">
                                        <asp:ImageButton src="/pages/Admin/images/save.png" class="icon-t-modal" runat="server" ID="btn_save" OnClick="btn_save_Click" OnClientClick="return Fn_Save();" TabIndex="7" title="Save"></asp:ImageButton>
                                    </div>
                                    <div class="col-sm-1 pl-0 col-2 border-right-radius text-center">
                                        <img src="/pages/Admin/images/clear.png" class="icon-t-modal" onclick="Clear();" title="Clear">
                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <div class=" col-md-2 col-sm-2">
                                        <label class="input-label-modal">SMTP Address<i class="fas fa-asterisk text-danger font_8"></i></label>
                                    </div>
                                    <div class="col-md-10 col-sm-10">
                                        <input id="txt_smtpadd" type="text" runat="server" placeholder="..............................................." class="BlankText all-border border-bottom-2 font-12 width-100" tabindex="1">
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class=" col-md-2 col-sm-2">
                                        <label class="input-label-modal">Port No.<i class="fas fa-asterisk text-danger font_8"></i></label>
                                    </div>
                                    <div class="col-md-10 col-sm-10">
                                        <input id="txt_port" type="text" runat="server" placeholder="..............................................." class="BlankText int all-border border-bottom-2 font-12 width-100" tabindex="2">
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class=" col-md-2 col-sm-2">
                                        <label class="input-label-modal">From E-mail ID<i class="fas fa-asterisk text-danger font_8"></i></label>
                                    </div>
                                    <div class="col-md-10 col-sm-10">
                                        <input id="txt_emailid" type="text" runat="server" placeholder="..............................................." class="BlankText email all-border border-bottom-2 font-12 width-100" tabindex="3">
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-md-2 col-sm2">
                                        <label class="input-label-modal">E-mail Password<i class="fas fa-asterisk text-danger font_8"></i></label>
                                    </div>
                                    <div class="col-md-10 col-sm-10">
                                        <input id="txt_password" type="password" runat="server" placeholder="..............................................." class="BlankText all-border border-bottom-2 font-12 width-100" tabindex="4">
                                    </div>
                                </div>

                                <div class="row mt-2">
                                    <div class="col-md-2 col-sm-2">
                                        <label class="input-label-modal">Enable SSL</label>
                                    </div>
                                    <div class="col-md-10 col-sm-10 status">
                                        <label class="switch">
                                            <input id="chkbox_EnblSSL" type="checkbox" runat="server" class="switchBox switch-small form-checkbox" data_on="success" data_off="danger" checked="checked" tabindex="5" />
                                            <span class="slider round"></span>
                                        </label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-md-2 col-sm-2">
                                        <label class="input-label-modal">Make Default</label>
                                    </div>
                                    <div class="col-md-10 col-sm-10 status">
                                        <label class="switch">
                                            <input id="chkbox_status" type="checkbox" runat="server" class="switchBox switch-small form-checkbox" data_on="success" data_off="danger" checked="checked" tabindex="6" />
                                            <span class="slider round"></span>
                                        </label>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btn_save" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_BottomScripts" runat="server">
    <script>
        var table;
        $(function () {
            DataBind();

        });
        function DataBind() {
            $.ajax({
                type: "POST",
                url: "/Classes/Services.asmx/GetEmailConfig",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    alert(response.d);
                },
                error: function (response) {
                    alert(response.d);
                }
            });
        }
        function OnSuccess(response) {

            var data = eval("(" + response.d + ")");
            table = $('#tbl_smsconfig').DataTable({
                bLengthChange: true,
                lengthMenu: [[5, 10, 20, 50, 100, -1], [5, 10, 20, 50, 100, "All"]],
                iDisplayLength: 10,
                bFilter: true,
                bSort: true,
                destroy: true,
                bPaginate: true,
                "scrollCollapse": true,
                "scrollY": 350,
                "jQueryUI": true,
                data: data.Table1,
                columns: [{ data: 'row', sortable: false, searchable: false },
                { data: 'EmailConfigSetting_SmtpAddress', sortable: true, searchable: true },
                { data: 'EmailConfigSetting_FromEmail', sortable: true, searchable: true },
                { data: 'EmailConfigSetting_default', sortable: true, searchable: true },
                {
                    name: "Action", data: null, title: "Action", sortable: false, searchable: false,
                    render: function (data, type, row, meta) {
                        var actionButtons = '';
                        actionButtons += $("<a />", {
                            title: "Edit Configuration",
                            class: "btn  btn-sm tb-edit-btn",
                            href: "#",
                            onclick: "Edit(" + row.EmailConfigSetting_kid + ")",
                            'data-toggle': "modal",
                            'data-target': "#SmsconfigPopup",
                            'data-backdrop': "static",
                            html: $("<i />", {
                                class: "fa fa-edit"
                            }).get(0).outerHTML
                        }).get(0).outerHTML;
                        actionButtons += $("<a/>", {
                            Title: "Delete Title",
                            class: "btn  btn-sm tb-edit-btn",
                            href: "#",
                            onclick: "Delete(" + row.EmailConfigSetting_kid + ")",
                            'data-toggle': "modal",
                            'data-target': "#modal-MCity-delete",
                            'data-backdrop': "static",
                            html: $("<i/>", {
                                class: "fa fa-trash"
                            }).get(0).outerHTML
                        }).get(0).outerHTML;
                        return actionButtons;
                    }
                }]
            });
        }

        function Add() {
            Clear();
            $('#Config_head').text('Add Email Confifguration');
            $('[tabindex=' + 1 + ']').focus();


        }

        function Clear() {
            $('#<%=txt_smtpadd.ClientID%>').val('');
            $('#<%=txt_password.ClientID%>').val('');
            $('#<%=txt_port.ClientID%>').val('');
            $('#<%=txt_emailid.ClientID%>').val('');
            $('.border-bottom-Danger').each(function () {
                $(this).removeClass("border-bottom-Danger");
            });
        }


        function Edit(id) {
            $('#Config_head').text('Edit Email Configuration');
            $('#<%=hdn_id.ClientID%>').val(id);
            var Edit_Config = jqPost("/Classes/Services.asmx/GetEmailConfigByID", "{'id':'" + id + "'}");

            if (Edit_Config != null && Edit_Config.Table1.length > 0) {
                $('#<%=txt_smtpadd.ClientID%>').val(Edit_Config.Table1[0].EmailConfigSetting_SmtpAddress);
                $('#<%=txt_emailid.ClientID%>').val(Edit_Config.Table1[0].EmailConfigSetting_FromEmail);
                $('#<%=txt_port.ClientID%>').val(Edit_Config.Table1[0].EmailConfigSetting_PortNo);
                if (Edit_Config.Table1[0].emailconfigsetting_SSL == "True" || parseInt(Edit_Config.Table1[0].emailconfigsetting_SSL) == 1)
                    $('#<%=chkbox_EnblSSL.ClientID%>').prop("checked", true);
                else
                    $('#<%=chkbox_EnblSSL.ClientID%>').prop("checked", false);
                if (Edit_Config.Table1[0].EmailConfigSetting_default == "True" || parseInt(Edit_Config.Table1[0].EmailConfigSetting_default) == 1)
                    $('#<%=chkbox_status.ClientID%>').prop("checked", true);
                else
                    $('#<%=chkbox_status.ClientID%>').prop("checked", false);
            }
        }


        function Delete(id) {

            swal({
                title: "This record will be deleted",
                text: "Are you sure to proceed?",
                showCancelButton: true,
                type: "warning",
                confirmButtonColor: "#015184",
                confirmButtonText: "Yes",
                cancelButtonText: "No"
            },
                function (isConfirm) {
                    if (isConfirm) {
                        var DelConfig = jqPost("/Classes/Services.asmx/DeleteEmailConfig", "{'id':'" + id + "'}");
                        if (DelConfig != null && DelConfig.Table1.length > 0) {

                            if (DelConfig.Table1[0].val == "1") {
                                MsgArray[0] = Msg["Delete"];
                                MsgColor(false);
                                MsgAlert();
                                table.destroy();
                                DataBind();
                            }
                            else if (DelConfig.Table1[0].val == "2") {
                                MsgArray[0] = Msg["LinkedRec"];
                                MsgColor(true);
                                MsgAlert();
                            }
                        }
                    }
                });
        }

    </script>
</asp:Content>

