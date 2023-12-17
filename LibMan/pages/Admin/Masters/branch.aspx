<%@ Page Title="Branch Master - Lib-Man" Language="C#" MasterPageFile="../Dashboard/Admin.Master" AutoEventWireup="true" CodeBehind="branch.aspx.cs" EnableEventValidation="false" Inherits="LibMan.pages.Admin.Masters.branch" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <input type="hidden" runat="server" id="hdn_id" />
    <input type="hidden" runat="server" id="hdn_userkid" />
    <section class="table-background">
        <div class="table-responsive">
            <!--Table-->
            <div class="addNew">
                <a href="#" data-backdrop="static" data-target="#Popup" data-toggle="modal" class="btn btn-custom mrg-l15 " onclick="Add();" title="Add New Branch"><i class="fa fa-plus-circle"></i>Add New</a>
            </div>
            <table class="table table-striped" id="tbl_Branch">
                <!--Table head-->
                <thead class="thead-background">
                    <tr>
                        <th class="table-bolder">#</th>
                        <th class="table-bolder">Branch Name </th> 
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
                    <div class="modal-dialog5 modal-dialog-centered">
                        <div class="modal-content pb-4">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <p class="modal-title text-center m-auto">Branch Master</p>
                                <button type="button" class="close" data-dismiss="modal" onclick="Clear();">&times;</button>
                            </div>
                            <!-- Modal body -->
                            <div class="modal-body">
                                <section>
                                    <div class="row  border-bottom-1">
                                       
                                        <div class="col-md-8 col-sm-8 col-8 mt-3">
                                            <h3 id="Branch_head" class="heading-modal">Add Branch </h3>
                                        </div>
                                        <div class="col-sm-2 pr-0 col-2 border-left-radius text-right">
                                            <asp:ImageButton ID="btn_save" src="/pages/Admin/images/save.png" class="icon-t-modal" OnClick="btn_save_Click" OnClientClick="return Fn_Save();" TabIndex="28" title="Save" runat="server" />
                                        </div>
                                        <div class="col-sm-2 pl-0 col-2 border-right-radius text-center">
                                            <img src="/pages/Admin/images/clear.png" class="icon-t-modal" onclick="Clear();" title="Clear">
                                        </div>
                                    </div>
                                    <div class="row mt-4">
                                        <div class="col-md-4 col-sm-3">
                                            <label class="input-label-modal">Name</label>
                                        </div>
                                        <div class="col-md-8 col-sm-9">
                                            <input type="text" maxlength="100" id="txt_branch" runat="server" tabindex="1" placeholder="..............................................." class="BlankText all-border border-bottom-2 font-12 width-100">
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
                url: 'Branch.aspx/getAllBranchs',
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
            table = $('#tbl_Branch').DataTable({
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
                { data: 'branch_name', sortable: true, searchable: true }, 
                {
                    data: 'branch_status', sortable: false, searchable: false,
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
                                value: row.branch_kid,
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
                            title: "Edit Branch",
                            class: "btn btn-default btn-sm tb-edit-btn",
                            href: "#",
                            onclick: "Edit(" + row.branch_kid + ")",
                            'data-toggle': "modal",
                            'data-target': "#Popup",
                            'data-backdrop': "static",
                            html: $("<i/>", {
                                class: "fa fa-edit"
                            }).get(0).outerHTML
                        }).get(0).outerHTML;

                        actionButtons += $("<a/>", {
                            title: "Delete Branch",
                            class: "btn btn-default btn-sm tb-edit-btn",
                            href: "#",
                            onclick: "Delete(" + row.branch_kid + ")",
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
            $('#Branch_head').text('Edit Branch');
            $('#<%=hdn_id.ClientID%>').val(id);
            var EditBranch = jqPost("Branch.aspx/GetBranchByID", "{'id':'" + id + "'}");

            if (EditBranch != null && EditBranch.Table1.length > 0) {
                $('#<%=hdn_id.ClientID%>').val(EditBranch.Table1[0].branch_kid);
                $('#<%=txt_branch.ClientID%>').val(EditBranch.Table1[0].branch_name); 


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
                        var DelBranch = jqPost("Branch.aspx/DeleteUpdateBranch", "{'id':'" + id + "','flag':'D','status':'" + false + "'}");
                        if (DelBranch != null && DelBranch.Table1.length > 0) {

                            if (DelBranch.Table1[0].val == "1") {
                                MsgArray[0] = Msg["Delete"];
                                MsgColor(false);
                                MsgAlert();
                                table.destroy();
                                DataBind();
                            }
                            else if (DelBranch.Table1[0].val == "2") {
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
            $('#Branch_head').text('Add Branch');
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
            $('#Branch_head').text('Add Branch ');
            $('#<%=hdn_id.ClientID%>').val('');
            $('.border-bottom-Danger').each(function () {
                $(this).removeClass("border-bottom-Danger");
            });
            $('#<%=hdn_id.ClientID%>').val('');
            $('#<%=txt_branch.ClientID%>').val(''); 

        }

        $(document).on('change', '.chk_status', function () {
            var status = $(this).is(":checked");
            var UpdateBranch = jqPost("Branch.aspx/DeleteUpdateBranch", "{'id':'" + $(this).val() + "','flag':'U','status':'" + status + "'}");
            if (UpdateBranch != null && UpdateBranch.Table1.length > 0) {

                if (UpdateBranch.Table1[0].val == "1") {
                    MsgArray[0] = Msg["Update"];
                    MsgColor(false);
                    MsgAlert();
                    DataBind();
                }
            }
        });




    </script>
</asp:Content>
