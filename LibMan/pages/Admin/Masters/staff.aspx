<%@ Page Title="Staff Master - Lib-Man" Language="C#" MasterPageFile="../Dashboard/Admin.Master" AutoEventWireup="true" CodeBehind="staff.aspx.cs" EnableEventValidation="false" Inherits="LibMan.pages.Admin.Masters.staff" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <input type="hidden" runat="server" id="hdn_id" />
    <input type="hidden" runat="server" id="hdn_userkid" />
    <section class="table-background">
        <div class="table-responsive">
            <!--Table-->
            <div class="addNew">
                <a href="#" data-backdrop="static" data-target="#Popup" data-toggle="modal" class="btn btn-custom mrg-l15 " onclick="Add();" title="Add New Staff"><i class="fa fa-plus-circle"></i>Add New</a>
            </div>
            <table class="table table-striped" id="tbl_Staff">
                <!--Table head-->
                <thead class="thead-background">
                    <tr>
                        <th class="table-bolder">#</th>
                        <th class="table-bolder">Staff ID </th>
                        <th class="table-bolder">Staff Name </th>
                        <th class="table-bolder">Usr Code </th>
                        <th class="table-bolder">Usr Role </th>
                        <th class="table-bolder">Mobile Number</th>
                        <th class="table-bolder">Email</th>
                        <th class="table-bolder">Gender</th>
                        <th class="table-bolder">Department</th>
                        <th class="table-bolder">Designation</th>
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
                                <p class="modal-title text-center m-auto">Staff Master</p>
                                <button type="button" class="close" data-dismiss="modal" onclick="Clear();">&times;</button>
                            </div>
                            <!-- Modal body -->
                            <div class="modal-body">
                                <section>
                                    <div class="row  border-bottom-1">
                                        <div class="col-md-2 col-sm-3">
                                            <div class="user-profiles">
                                                <img src="/Image/user.png" class="imgsel user-modal"><i class="fas fa-edit img-upload uploadimage">  </i>
                                                <asp:FileUpload ID="img_upload" Style="display: none" runat="server" CssClass="img img_up" accept=".png, .jpg, .jpeg, .svg, .sveg" onchange="img_pathUrl(this);" />
                                                <asp:HiddenField ID="hdn_downImage" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-md-8 col-sm-8 col-8 mt-3">
                                            <h3 id="Staff_head" class="heading-modal">Add Staff </h3>
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
                                            <label class="input-label-modal">ID</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <input type="text" maxlength="50" id="txt_stID" runat="server" tabindex="1" placeholder="..............................................." class="BlankText all-border border-bottom-2 font-12 width-100">
                                        </div>
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">Name</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <input type="text" maxlength="100" id="txt_name" runat="server" tabindex="2" placeholder="..............................................." autocomplete="off" class="  BlankText all-border border-bottom-2 font-12 width-100">
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">Father's Name</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <input type="text" maxlength="100" id="txt_fName" runat="server" tabindex="3" placeholder="..............................................." autocomplete="off" class="  BlankText all-border border-bottom-2 font-12 width-100">
                                        </div>
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">Gender</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <asp:DropDownList ID="ddl_gender" CssClass="ddl_gender BlankSelect  form-control all-border border-bottom-2 font-12" runat="server" TabIndex="4">
                                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Male" Value="M"></asp:ListItem>
                                                <asp:ListItem Text="Female" Value="F"></asp:ListItem>
                                                <asp:ListItem Text="Other" Value="O"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">Mobile Number</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <input type="text" maxlength="10" id="txt_mobNo" runat="server" tabindex="5" placeholder="..............................................." autocomplete="off" class="int BlankText all-border border-bottom-2 font-12 width-100">
                                        </div>
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">E-Mail</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <input type="text" maxlength="50" id="txt_email" runat="server" tabindex="6" placeholder="..............................................." autocomplete="off" class=" BlankText email all-border border-bottom-2 font-12 width-100">
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">Address</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <input type="text" maxlength="200" id="txt_Address" runat="server" tabindex="7" placeholder="..............................................." class="BlankText    all-border border-bottom-2 font-12 width-100">
                                        </div>
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">Date of Joining </label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <input type="text" maxlength="10" id="txt_doj" runat="server" tabindex="8" placeholder="..............................................." autocomplete="off" class=" BlankText  date all-border border-bottom-2 font-12 width-100">
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">Designation</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <asp:DropDownList ID="ddl_designation" CssClass="ddl_designation BlankSelect  form-control all-border border-bottom-2 font-12" runat="server" TabIndex="9"></asp:DropDownList>

                                        </div>
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">Department</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <asp:DropDownList ID="ddl_dept" CssClass="ddl_dept BlankSelect  form-control all-border border-bottom-2 font-12" runat="server" TabIndex="10"></asp:DropDownList>

                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">User Role</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <asp:DropDownList ID="ddl_usrrole" CssClass="ddl_usrrole    form-control all-border border-bottom-2 font-12" runat="server" TabIndex="9"></asp:DropDownList>

                                        </div>
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">User Code</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <input type="text" maxlength="10" id="txt_usrcode" runat="server" tabindex="8" placeholder="..............................................." autocomplete="off" class="    all-border border-bottom-2 font-12 width-100">
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
            $(".date").datepicker({
                "dateFormat": "yy-mm-dd",
                maxDate: 0
            });
        });


        function DataBind() {
            $.ajax({
                type: "POST",
                url: 'staff.aspx/getAllStaffs',
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
            table = $('#tbl_Staff').DataTable({
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
                { data: 'staff_staffID', sortable: true, searchable: true },
                { data: 'staff_name', sortable: true, searchable: true },
                { data: 'usr_code', sortable: true, searchable: true },
                { data: 'usr_UserRole', sortable: true, searchable: true },
                { data: 'staff_Mob_No', sortable: true, searchable: true },
                { data: 'staff_EmailID', sortable: true, searchable: true },
                { data: 'staff_gender', sortable: true, searchable: true },
                { data: 'Dept_name', sortable: true, searchable: true },
                { data: 'designation_name', sortable: true, searchable: true },
                {
                    data: 'staff_status', sortable: false, searchable: false,
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
                                value: row.staff_kid,
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
                            title: "Edit Staff",
                            class: "btn btn-default btn-sm tb-edit-btn",
                            href: "#",
                            onclick: "Edit(" + row.staff_kid + ")",
                            'data-toggle': "modal",
                            'data-target': "#Popup",
                            'data-backdrop': "static",
                            html: $("<i/>", {
                                class: "fa fa-edit"
                            }).get(0).outerHTML
                        }).get(0).outerHTML;

                        actionButtons += $("<a/>", {
                            title: "Delete Staff",
                            class: "btn btn-default btn-sm tb-edit-btn",
                            href: "#",
                            onclick: "Delete(" + row.staff_kid + ")",
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
            $('#Staff_head').text('Edit Staff');
            $('#<%=hdn_id.ClientID%>').val(id);
            var EditStaff = jqPost("Staff.aspx/GetStaffByID", "{'id':'" + id + "'}");

            if (EditStaff != null && EditStaff.Table1.length > 0) {
                $('#<%=hdn_id.ClientID%>').val(EditStaff.Table1[0].staff_kid);
                $('#<%=txt_stID.ClientID%>').val(EditStaff.Table1[0].staff_staffID);
                $('#<%=txt_fName.ClientID%>').val(EditStaff.Table1[0].staff_parent);
                $('#<%=ddl_gender.ClientID%>').val(EditStaff.Table1[0].staff_gender);
                $('#<%=ddl_designation.ClientID%>').val(EditStaff.Table1[0].staff_Designationid);
                $('#<%=ddl_dept.ClientID%>').val(EditStaff.Table1[0].staff_Deptid);
                $('#<%=txt_doj.ClientID%>').val(EditStaff.Table1[0].staff_DOJ);
                $('#<%=txt_name.ClientID%>').val(EditStaff.Table1[0].staff_name);
                $('#<%=txt_mobNo.ClientID%>').val(EditStaff.Table1[0].staff_Mob_No);
                $('#<%=txt_email.ClientID%>').val(EditStaff.Table1[0].staff_EmailID);
                $('#<%=txt_Address.ClientID%>').val(EditStaff.Table1[0].staff_Address);
                $('#<%=ddl_usrrole.ClientID%>').val(EditStaff.Table1[0].usr_UserRoleID);
                $('#<%=txt_usrcode.ClientID%>').val(EditStaff.Table1[0].usr_code);
                if (EditStaff.Table1[0].file_id != '' && EditStaff.Table1[0].file_id != null && EditStaff.Table1[0].file_id != undefined) {

                    $('.imgsel').attr('src', EditStaff.Table1[0].file_id);
                }
                else {
                    $('.imgsel').attr('src', '/Image/user.png');
                }

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
                        var DelStaff = jqPost("Staff.aspx/DeleteUpdateStaff", "{'id':'" + id + "','flag':'D','status':'" + false + "'}");
                        if (DelStaff != null && DelStaff.Table1.length > 0) {

                            if (DelStaff.Table1[0].val == "1") {
                                MsgArray[0] = Msg["Delete"];
                                MsgColor(false);
                                MsgAlert();
                                table.destroy();
                                DataBind();
                            }
                            else if (DelStaff.Table1[0].val == "2") {
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
            $('#Staff_head').text('Add Staff');
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

            else {
                MsgArray[0] = Msg["Error"];
                MsgColor(true);
                MsgAlert();
            }

        }

        function Clear() {
            $('#Staff_head').text('Add Staff ');
            $('#<%=hdn_id.ClientID%>').val('');
            $('.border-bottom-Danger').each(function () {
                $(this).removeClass("border-bottom-Danger");
            });
            $('#<%=hdn_id.ClientID%>').val("");
            $('#<%=txt_stID.ClientID%>').val("");
            $('#<%=txt_fName.ClientID%>').val("");
            $('#<%=ddl_gender.ClientID%>').val("");
            $('#<%=ddl_designation.ClientID%>').val("");
            $('#<%=ddl_dept.ClientID%>').val("");
            $('#<%=txt_doj.ClientID%>').val("");
            $('#<%=txt_name.ClientID%>').val("");
            $('#<%=txt_mobNo.ClientID%>').val("");
            $('#<%=txt_email.ClientID%>').val("");
            $('#<%=txt_Address.ClientID%>').val("");
            $('.imgsel').attr('src', '/Image/user.png');


        }

        $(document).on('change', '.chk_status', function () {
            var status = $(this).is(":checked");
            var UpdateStaff = jqPost("Staff.aspx/DeleteUpdateStaff", "{'id':'" + $(this).val() + "','flag':'U','status':'" + status + "'}");
            if (UpdateStaff != null && UpdateStaff.Table1.length > 0) {

                if (UpdateStaff.Table1[0].val == "1") {
                    MsgArray[0] = Msg["Update"];
                    MsgColor(false);
                    MsgAlert();
                    DataBind();
                }
            }
        });

       




    </script>
</asp:Content>
