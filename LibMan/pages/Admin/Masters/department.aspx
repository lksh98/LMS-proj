﻿<%@ Page Title="Department Master - Lib-Man" Language="C#" MasterPageFile="../Dashboard/Admin.Master" AutoEventWireup="true" CodeBehind="department.aspx.cs" EnableEventValidation="false" Inherits="LibMan.pages.Admin.Masters.department" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <input type="hidden" runat="server" id="hdn_id" />
    <input type="hidden" runat="server" id="hdn_userkid" />
    <section class="table-background">
        <div class="table-responsive">
            <!--Table-->
            <div class="addNew">
                <a href="#" data-backdrop="static" data-target="#Popup" data-toggle="modal" class="btn btn-custom mrg-l15 " onclick="Add();" title="Add New Department"><i class="fa fa-plus-circle"></i>Add New</a>
            </div>
            <table class="table table-striped" id="tbl_Department">
                <!--Table head-->
                <thead class="thead-background">
                    <tr>
                        <th class="table-bolder">#</th>
                        <th class="table-bolder">Department Name </th>
                        <th class="table-bolder">Incharge Name</th>
                        <th class="table-bolder">Status</th>
                        <th class="table-bolder">Action</th>
                    </tr>
                </thead>
            </table>
            <!--Table-->
        </div>
    </section>
    <section>
        <!-- The Modal -->
        <div class="modal" id="Popup">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always" IsInPartialRendering="true">
                <ContentTemplate>
                    <div class="modal-dialog9 modal-dialog-centered">
                        <div class="modal-content pb-4">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <p class="modal-title text-center m-auto">Department Master</p>
                                <button type="button" class="close" data-dismiss="modal" onclick="Clear();">&times;</button>
                            </div>
                            <!-- Modal body -->
                            <div class="modal-body">
                                <section>
                                    <div class="row  border-bottom-1">
                                       
                                        <div class="col-md-8 col-sm-8 col-8 mt-3">
                                            <h3 id="Department_head" class="heading-modal">Add Department </h3>
                                        </div>
                                        <div class="col-sm-1 pr-0 col-2 border-left-radius text-right">
                                            <asp:ImageButton ID="btn_save" src="/pages/Admin/images/save.png" class="icon-t-modal" OnClick="btn_save_Click" OnClientClick="return Fn_Save();" TabIndex="28" title="Save" runat="server" />
                                        </div>
                                        <div class="col-sm-1 pl-0 col-2 border-right-radius text-center">
                                            <img src="/pages/Admin/images/clear.png" class="icon-t-modal" onclick="Clear();" title="Clear">
                                        </div>
                                    </div>
                                    <div class="row mt-4">
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">Name</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <input type="text" maxlength="100" id="txt_department" runat="server" tabindex="1" placeholder="..............................................." class="BlankText all-border border-bottom-2 font-12 width-100">
                                        </div>
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">Incharge</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                               <asp:DropDownList ID="ddl_incharge" CssClass="ddl_incharge BlankSelect form-control all-border border-bottom-2 font-12" runat="server" TabIndex="2"></asp:DropDownList>
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
    </section>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder_BottomScripts">
    <script>
        var table;
        $(function () {
            DataBind();

        });


        function DataBind() {
            $.ajax({
                type: "POST",
                url: 'Department.aspx/getAllDepartments',
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
            table = $('#tbl_Department').DataTable({
                bLengthChange: true,
                lengthMenu: [[5, 10, 20, 50, 100, 500, 1000], [5, 10, 20, 50, 100, 500, 1000]],
                iDisplayLength: 100,
                bFilter: true,
                bSort: true,
                destroy: true,
                bPaginate: true,
                "scrollCollapse": true,
                "scrollY": 350,
                "jQueryUI": true,
                data: data.Table1,
                columns: [{ data: 'row', sortable: false, searchable: false },
                { data: 'dept_name', sortable: true, searchable: true }, 
                    { data: 'staff_name', sortable: true, searchable: true },
                {
                    data: 'dept_status', sortable: false, searchable: false,
                    render: function (data, type, row, meta) {
                        var actionButtons = '';
                        var chaeck = false;
                        if (data == "True" || parseInt(data) == 1)
                            chaeck = true;
                        actionButtons += $("<label/>", {
                            class: "switch",
                            html: $("<input/>", {
                                type: "checkbox",
                                Title: "Edit Status",
                                id: "Chk_status",
                                class: "chk_status switchBox switch-small form-checkbox",
                                value: row.dept_kid,
                                checked: chaeck,
                                "data-type": "IsActive",
                                'data-on': "success",
                                'data-off': "danger",
                            }).get(0).outerHTML +
                                $("<span/>", {
                                    class: "slider round",
                                }).get(0).outerHTML
                        }).get(0).outerHTML;

                        return actionButtons;
                    }
                },
                {
                    name: "Action", data: null, title: "Action", sortable: false, searchable: false,
                    render: function (data, type, row, meta) {
                        var actionButtons = '';
                        actionButtons += $("<a/>", {
                            title: "Edit Department",
                            class: "btn btn-default btn-sm tb-edit-btn",
                            href: "#",
                            onclick: "Edit(" + row.dept_kid + ")",
                            'data-toggle': "modal",
                            'data-target': "#Popup",
                            'data-backdrop': "static",
                            html: $("<i/>", {
                                class: "fa fa-edit"
                            }).get(0).outerHTML
                        }).get(0).outerHTML;

                        actionButtons += $("<a/>", {
                            title: "Delete Department",
                            class: "btn btn-default btn-sm tb-edit-btn",
                            href: "#",
                            onclick: "Delete(" + row.dept_kid + ")",
                            'data-toggle': "modal",
                            'data-target': "#modal-MCity-delete",
                            'data-backdrop': "static",
                            html: $("<i/>", {
                                class: "fa fa-trash"
                            }).get(0).outerHTML
                        }).get(0).outerHTML;

                        return actionButtons;
                    }
                }],
                "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {

                },
            });
        }
        function Edit(id) {
            $('[tabindex=' + 1 + ']').focus();
            $('#Department_head').text('Edit Department');
            $('#<%=hdn_id.ClientID%>').val(id);
            var EditDepartment = jqPost("Department.aspx/GetDepartmentByID", "{'id':'" + id + "'}");

            if (EditDepartment != null && EditDepartment.Table1.length > 0) {
                $('#<%=hdn_id.ClientID%>').val(EditDepartment.Table1[0].dept_kid);
                $('#<%=txt_department.ClientID%>').val(EditDepartment.Table1[0].dept_name);
                $('#<%=ddl_incharge.ClientID%>').val(EditDepartment.Table1[0].dept_incharge);


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
                        var DelDepartment = jqPost("Department.aspx/DeleteUpdateDepartment", "{'id':'" + id + "','flag':'D','status':'" + false + "'}");
                        if (DelDepartment != null && DelDepartment.Table1.length > 0) {

                            if (DelDepartment.Table1[0].val == "1") {
                                MsgArray[0] = Msg["Delete"];
                                MsgColor(false);
                                MsgAlert();
                                table.destroy();
                                DataBind();
                            }
                            else if (DelDepartment.Table1[0].val == "2") {
                                MsgArray[0] = Msg["LinkedRec"];
                                MsgColor(true);
                                MsgAlert();
                            }
                        }
                    }
                }
            );
        }
        function Add() {
            $('#Department_head').text('Add Department');
            $('#<%=hdn_id.ClientID%>').val('');
            $('[tabindex=' + 1 + ']').focus();
        }

        function Save(result, id) {
            if (result == "1") {
                MsgArray[0] = Msg["Update"];
                MsgColor(false);
                MsgAlert();
                $('.close').click();
                Clear();
                DataBind();
            }
            else if (result == "2") {
                MsgArray[0] = Msg["Insert"];
                MsgColor(false);
                MsgAlert();
                $('.close').click();
                Clear();
                DataBind();
            }
            else if (result == "3") {
                MsgArray[0] = Msg["Already"];
                MsgColor(true);
                MsgAlert();
                $('#Popup').modal('show');
            }

        }

        function Clear() {
            $('#Department_head').text('Add Department ');
            $('#<%=hdn_id.ClientID%>').val('');
            $('.border-bottom-Danger').each(function () {
                $(this).removeClass("border-bottom-Danger");
            });
            $('#<%=hdn_id.ClientID%>').val('');
            $('#<%=txt_department.ClientID%>').val('');
            $('#<%=ddl_incharge.ClientID%>').val('0'); 

        }

        $(document).on('change', '.chk_status', function () {
            var status = $(this).is(":checked");
            var UpdateDepartment = jqPost("Department.aspx/DeleteUpdateDepartment", "{'id':'" + $(this).val() + "','flag':'U','status':'" + status + "'}");
            if (UpdateDepartment != null && UpdateDepartment.Table1.length > 0) {

                if (UpdateDepartment.Table1[0].val == "1") {
                    MsgArray[0] = Msg["Update"];
                    MsgColor(false);
                    MsgAlert();
                    DataBind();
                }
            }
        });




    </script>
</asp:Content>
