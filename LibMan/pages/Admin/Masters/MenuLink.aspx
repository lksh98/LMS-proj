<%@ Page Title="Link User Menu - Lib-Man" Language="C#" MasterPageFile="../Dashboard/Admin.Master" AutoEventWireup="true" CodeBehind="MenuLink.aspx.cs" Inherits="LibMan.pages.Admin.Masters.MenuLink" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <input type="hidden" id="hdn_id" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <section>
                <div class="row mt-2">
                    <div class="col-lg-1 col-md-2 col-sm-3 col-3">
                        <label class="input-label-modal">User Profile<i class="fas fa-asterisk text-danger font_8"></i></label>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-5 col-9">
                        <div class="form-group mb-0">
                            <asp:DropDownList ID="ddl_Profile" CssClass="form-control all-border border-bottom-2 font-12" runat="server" TabIndex="1"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-4 col-12">
                        <div class="form-group mb-0">
                            <asp:Button ID="btn_link" runat="server" Text="Link" OnClick="btn_link_Click" OnClientClick="return getUnlink();" CssClass="btntwo"/>
                            <asp:HiddenField ID="hdn_UnlinkID" runat="server" />
                            <asp:Button ID="btn_unlink" runat="server" Text="Unlink" OnClick="btn_unlink_Click" OnClientClick="return getLink();"  CssClass="btntwo"/>
                            <asp:HiddenField ID="hdn_LinkID" runat="server" />
                        </div>
                    </div>
                </div>
            </section>
            <div class="row table-height menulink-table">
                <div class="col-md-6 mt-2">
                    <section class="table-background ">
                        <div class="table-responsive">
                            <!--Table--><div class="addNew">
                            <a href="#" data-backdrop="static" data-target="" data-toggle="modal" class="btn btn-custom mrg-l15 ">Unlinked Menu</a></div>
                            <table class="table table-striped" id="tbl_unlink">
                                <!--Table head-->
                                <thead class="thead-background">
                                    <tr>
                                        <th class="table-bolder">#</th>

                                        <th class="table-bolder">
                                             <label class="switch"><input type="checkbox" title="Edit Status" id="chk_unall" class="Chk_select switchBox switch-small form-checkbox chk_all"  data-type="IsActive" data-on="success" data-off="danger"><span class="slider round"></span></label> Select All</th>
                                        <th class="table-bolder">Name</th>
                                    </tr>
                                </thead>
                            </table>
                            <!--Table-->
                        </div>
                    </section>
                </div>
                <div class="col-md-6 mt-2">
                    <section class="table-background">
                        <div class="table-responsive">
                            <!--Table--><div class="addNew">
                            <a href="#" data-backdrop="static" data-target="" data-toggle="modal" class="btn btn-custom mrg-l15 ">Linked Menu</a></div>
                            <table class="table table-striped" id="tbl_link">
                                <!--Table head-->
                                <thead class="thead-background">
                                    <tr>
                                        <th class="table-bolder">#</th>
                                        <th class="table-bolder"> <label class="switch"><input type="checkbox" title="Edit Status" id="chk_all" class="Chk_select switchBox switch-small form-checkbox chk_all"  data-type="IsActive" data-on="success" data-off="danger"><span class="slider round"></span></label> Select All</th>
                                        <th class="table-bolder">Name</th>

                                    </tr>
                                </thead>
                            </table>
                            <!--Table-->
                        </div>
                    </section>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger EventName="Click" ControlID="btn_link" />
            <asp:AsyncPostBackTrigger EventName="Click" ControlID="btn_unlink" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder_BottomScripts">
    <script type="text/javascript">
        var lnktable, unlnktable;
        $(function () {
            DataBind(0);

        });
        $(document).on('change', '#<%=ddl_Profile.ClientID%>', function () {
            if ($(this).val() != "0") {
                DataBind($(this).val());
            }
            else {

            }
        });

        function DataBind(id) {
            $.ajax({
                type: "POST",
                url: "/Classes/Services.asmx/GetMenuByProfileID",
                data: "{'id':'" + id + "'}",
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
            
            lnktable = $('#tbl_unlink').DataTable({
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
                {
                    data: 'mnum_kid', sortable: false, searchable: false,
                    render: function (data, type, row, meta) {
                        var actionButtons = '';
                        var chaeck = false;
                        if (data == "True")
                            chaeck = true;
                        actionButtons += $("<label/>", {
                            class: "switch",
                            html: $("<input/>", {
                                type: "checkbox",
                                Title: "Edit Status",
                                id: "Chk_select",
                                class: "Chk_select switchBox switch-small form-checkbox chk_unlink",
                                value: row.mnum_kid,
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
                { data: 'mnum_name', sortable: true, searchable: true },
                ]
            });
            unlnktable = $('#tbl_link').DataTable({
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
                data: data.Table11,
                columns: [{ data: 'row', sortable: false, searchable: false },
                {
                    data: 'mnum_kid', sortable: false, searchable: false,
                    render: function (data, type, row, meta) {
                        var actionButtons = '';
                        var chaeck = false;
                        if (data == "True")
                            chaeck = true;
                        actionButtons += $("<label/>", {
                            class: "switch",
                            html: $("<input/>", {
                                type: "checkbox",
                                Title: "Edit Status",
                                id: "Chk_select",
                                class: "Chk_select switchBox switch-small form-checkbox chk_link",
                                value: row.mnum_kid,
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
                { data: 'mnum_name', sortable: true, searchable: true },
                ]
            });
        }
        function getUnlink() {
            if ($('#tbl_unlink .Chk_select').length > 0) {
                var checkVal = '';
                $('#tbl_unlink .Chk_select').each(function () {

                    if ($(this).is(':checked')) {
                        checkVal += $(this).val() + ',';
                    }
                });
                if (checkVal != '') {
                    $('#<%=hdn_UnlinkID.ClientID%>').val(checkVal);
                    return true;
                }
                else {
                    MsgArray[0] = Msg["SelectRow"] + 'unlink menu table.';
                    MsgColor(true);
                    MsgAlert();
                }
            }
            else {
                MsgArray[0] = Msg["TableRow"] + 'unlink menu table.';
                MsgColor(true);
                MsgAlert();
            }
            return false;
        }
        function getLink() {
            if ($('#tbl_link .Chk_select').length > 0) {
                var checkVal = '';
                $('#tbl_link .Chk_select').each(function () {
                    if ($(this).is(':checked')) {
                        checkVal += $(this).val() + ',';
                    }
                });
                if (checkVal != '') {
                    $('#<%=hdn_LinkID.ClientID%>').val(checkVal);
                    return true;
                }
                else {
                    MsgArray[0] = Msg["SelectRow"] + 'link menu table.';
                    MsgColor(true);
                    MsgAlert();
                }
            }
            else {
                MsgArray[0] = Msg["TableRow"] + 'link menu table.';
                MsgColor(true);
                MsgAlert();
            }
            return false;
        }
        function Unlink() {
            MsgArray[0] = Msg["Unlinked"];
            MsgColor(false);
            MsgAlert();
            $('#<%=ddl_Profile.ClientID%>').change();
        }
        function Link() {
            MsgArray[0] = Msg["Linked"];
            MsgColor(false);
            MsgAlert();
            
            $('#<%=ddl_Profile.ClientID%>').change();
        }
        $(document).on('click', '#chk_unall', function () {
            if ($(this).is(':checked')) {
                $('.chk_unlink').prop('checked', true);
            }
            else
                $('.chk_unlink').prop('checked', false);
        });

        $(document).on('click', '#chk_all', function () {
            if ($(this).is(':checked')) {
                $('.chk_link').prop('checked', true);
            }
            else
                $('.chk_link').prop('checked', false);
        });
    </script>
</asp:Content>
