﻿<%@ Page Title="Supplier Master - Lib-Man" Language="C#" MasterPageFile="../Dashboard/Admin.Master" AutoEventWireup="true" CodeBehind="Supplier.aspx.cs" EnableEventValidation="false" Inherits="LibMan.pages.Admin.Masters.Supplier" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <input type="hidden" runat="server" id="hdn_id" />
    <input type="hidden" runat="server" id="hdn_userkid" />
    <section class="table-background">
        <div class="table-responsive">
            <!--Table-->
            <div class="addNew">
                <a href="#" data-backdrop="static" data-target="#Popup" data-toggle="modal" class="btn btn-custom mrg-l15 " onclick="Add();" title="Add New Supplier"><i class="fa fa-plus-circle"></i>Add New</a>
            </div>
            <table class="table table-striped" id="tbl_Supplier">
                <!--Table head-->
                <thead class="thead-background">
                    <tr>
                        <th class="table-bolder">#</th>
                        <th class="table-bolder">Supplier Name </th>
                        <th class="table-bolder">Mobile Number</th>
                        <th class="table-bolder">LandLine Number</th>
                        <th class="table-bolder">Email</th>
                        <th class="table-bolder">Address</th>
                        <th class="table-bolder">City</th>
                        <th class="table-bolder">State</th>
                        <th class="table-bolder">GST Number</th>
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
                                <p class="modal-title text-center m-auto">Supplier Master</p>
                                <button type="button" class="close" data-dismiss="modal" onclick="Clear();">&times;</button>
                            </div>
                            <!-- Modal body -->
                            <div class="modal-body">
                                <section>
                                    <div class="row  border-bottom-1">
                                       
                                        <div class="col-md-8 col-sm-8 col-8 mt-3">
                                            <h3 id="Supplier_head" class="heading-modal">Add Supplier </h3>
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
                                            <input type="text" maxlength="100" id="txt_supp" runat="server" tabindex="1" placeholder="..............................................." class="BlankText all-border border-bottom-2 font-12 width-100">
                                        </div>
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">Mobile Number</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <input type="text" maxlength="10" id="txt_mobNo" runat="server" tabindex="2" placeholder="..............................................." autocomplete="off" class="int BlankText all-border border-bottom-2 font-12 width-100">
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal"0>Landline Number</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <input type="text" maxlength="15" id="txt_landline" runat="server" tabindex="3" placeholder="..............................................." class="  int all-border border-bottom-2 font-12 width-100">
                                        </div>
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">E-Mail</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <input type="text" maxlength="50" id="txt_email" runat="server" tabindex="4" placeholder="..............................................." autocomplete="off" class="   all-border border-bottom-2 font-12 width-100">
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">Address</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <input type="text" maxlength="200" id="txt_Address" runat="server" tabindex="5" placeholder="..............................................." class="BlankText    all-border border-bottom-2 font-12 width-100">
                                          
                                        </div>
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">City</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <input type="text" maxlength="50" id="txt_city" runat="server" tabindex="6" placeholder="..............................................." autocomplete="off" class=" BlankText   all-border border-bottom-2 font-12 width-100">
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">State</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <input type="text" maxlength="50" id="txt_state" runat="server" tabindex="7" placeholder="..............................................." class="BlankText    all-border border-bottom-2 font-12 width-100">
                                            
                                        </div>
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">Pincode</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <input type="text" maxlength="6" id="txt_pincode" runat="server" tabindex="8" placeholder="..............................................." autocomplete="off" class="  int BlankText all-border border-bottom-2 font-12 width-100">
                                            
                                        </div>
                                    </div>
                                     <div class="row mt-2">
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">GST Number</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                           <input type="text" maxlength="20" id="txt_gstIN" runat="server" tabindex="8" placeholder="..............................................." autocomplete="off" class="     all-border border-bottom-2 font-12 width-100">
                                        </div>
                                        
                                    </div>
                                    <div class="row mt-2">
                                    

                                    <div class="row  mt-2">
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
                url: 'Supplier.aspx/getAllSuppliers',
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
            table = $('#tbl_Supplier').DataTable({
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
                    { data: 'supp_ename', sortable: true, searchable: true },
                    { data: 'supp_contphone', sortable: true, searchable: true },
                    { data: 'supp_phone', sortable: true, searchable: true },
                    { data: 'supp_Email', sortable: true, searchable: true },
                    { data: 'supp_add1', sortable: true, searchable: true },
                    { data: 'supp_city', sortable: true, searchable: true },
                    { data: 'supp_state', sortable: true, searchable: true },
                    { data: 'supp_GSTIN', sortable: true, searchable: true },
                {
                    data: 'supp_status', sortable: false, searchable: false,
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
                                value: row.supp_kid,
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
                            title: "Edit Supplier",
                            class: "btn btn-default btn-sm tb-edit-btn",
                            href: "#",
                            onclick: "Edit(" + row.supp_kid + ")",
                            'data-toggle': "modal",
                            'data-target': "#Popup",
                            'data-backdrop': "static",
                            html: $("<i/>", {
                                class: "fa fa-edit"
                            }).get(0).outerHTML
                        }).get(0).outerHTML;

                        actionButtons += $("<a/>", {
                            title: "Delete Supplier",
                            class: "btn btn-default btn-sm tb-edit-btn",
                            href: "#",
                            onclick: "Delete(" + row.supp_kid + ")",
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
            $('#Supplier_head').text('Edit Supplier');
            $('#<%=hdn_id.ClientID%>').val(id);
            var EditSupplier = jqPost("Supplier.aspx/GetSupplierByID", "{'id':'" + id + "'}");

            if (EditSupplier != null && EditSupplier.Table1.length > 0) {
                $('#<%=hdn_id.ClientID%>').val(EditSupplier.Table1[0].supp_kid);
                $('#<%=txt_supp.ClientID%>').val(EditSupplier.Table1[0].supp_ename);
                $('#<%=txt_mobNo.ClientID%>').val(EditSupplier.Table1[0].supp_contphone);
                $('#<%=txt_landline.ClientID%>').val(EditSupplier.Table1[0].supp_phone);
                $('#<%=txt_email.ClientID%>').val(EditSupplier.Table1[0].supp_Email);
                $('#<%=txt_Address.ClientID%>').val(EditSupplier.Table1[0].supp_add1);
                $('#<%=txt_city.ClientID%>').val(EditSupplier.Table1[0].supp_city);
                $('#<%=txt_state.ClientID%>').val(EditSupplier.Table1[0].supp_state);
                $('#<%=txt_pincode.ClientID%>').val(EditSupplier.Table1[0].supp_pincode);
                $('#<%=txt_gstIN.ClientID%>').val(EditSupplier.Table1[0].supp_GSTIN);


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
                        var DelSupplier = jqPost("Supplier.aspx/DeleteUpdateSupplier", "{'id':'" + id + "','flag':'D','status':'" + false + "'}");
                        if (DelSupplier != null && DelSupplier.Table1.length > 0) {

                            if (DelSupplier.Table1[0].val == "1") {
                                MsgArray[0] = Msg["Delete"];
                                MsgColor(false);
                                MsgAlert();
                                table.destroy();
                                DataBind();
                            }
                            else if (DelSupplier.Table1[0].val == "2") {
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
            $('#Supplier_head').text('Add Supplier');
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
            $('#Supplier_head').text('Add Supplier ');
            $('#<%=hdn_id.ClientID%>').val('');
            $('.border-bottom-Danger').each(function () {
                $(this).removeClass("border-bottom-Danger");
            });
            $('#<%=hdn_id.ClientID%>').val('');
            $('#<%=txt_supp.ClientID%>').val('');
            $('#<%=txt_mobNo.ClientID%>').val('');
            $('#<%=txt_landline.ClientID%>').val('');
            $('#<%=txt_email.ClientID%>').val('');
            $('#<%=txt_Address.ClientID%>').val('');
            $('#<%=txt_city.ClientID%>').val('');
            $('#<%=txt_state.ClientID%>').val('');
            $('#<%=txt_pincode.ClientID%>').val('');
            $('#<%=txt_gstIN.ClientID%>').val('');
            
        }

        $(document).on('change', '.chk_status', function () {
            var status = $(this).is(":checked");
            var UpdateSupplier = jqPost("Supplier.aspx/DeleteUpdateSupplier", "{'id':'" + $(this).val() + "','flag':'U','status':'" + status + "'}");
            if (UpdateSupplier != null && UpdateSupplier.Table1.length > 0) {

                if (UpdateSupplier.Table1[0].val == "1") {
                    MsgArray[0] = Msg["Update"];
                    MsgColor(false);
                    MsgAlert();
                    DataBind();
                }
            }
        });

      


    </script>
</asp:Content>
