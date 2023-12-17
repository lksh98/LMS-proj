<%@ Page Title="Link Book to Shelf - Lib-Man" Language="C#" MasterPageFile="../Dashboard/Admin.Master" AutoEventWireup="true" CodeBehind="lnkbookshelf.aspx.cs" Inherits="LibMan.pages.Admin.Masters.lnkbookshelf" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <input type="hidden" id="hdn_id" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <section>

                <div class="row mt-2">
                    <div class="col-md-1 col-sm-3">
                        <label class="input-label-modal">Rack<i class="fas fa-asterisk text-danger font_8"></i></label>
                    </div>
                    <div class="col-md-2 col-sm-9">
                        <div class="form-group mb-0">
                            <asp:DropDownList ID="ddl_rack" CssClass="ddl_rack BlankSelect form-control all-border border-bottom-2 font-12" AutoPostBack="true" OnSelectedIndexChanged="ddl_rack_SelectedIndexChanged" runat="server" TabIndex="1"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="col-md-1 col-sm-3">
                        <label class="input-label-modal">Shelf<i class="fas fa-asterisk text-danger font_8"></i></label>
                    </div>
                    <div class="col-md-2 col-sm-9">
                        <div class="form-group mb-0">
                            <asp:DropDownList ID="ddl_shlef" CssClass="form-control all-border border-bottom-2 font-12" runat="server" TabIndex="1"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-9">
                        <div class="form-group mb-0">
                            <asp:Button ID="btn_link" runat="server" Text="Link" OnClick="btn_link_Click" OnClientClick="return getUnlink();" CssClass="btntwo" />
                            <asp:HiddenField ID="hdn_UnlinkID" runat="server" />
                            <asp:Button ID="btn_unlink" runat="server" Text="Unlink" OnClick="btn_unlink_Click" OnClientClick="return getLink();" CssClass="btntwo" />
                            <asp:HiddenField ID="hdn_LinkID" runat="server" />
                        </div>
                    </div>
                </div>
            </section>
            <div class="row mt-2 table-height menulink-table">
                <div class="col-md-6">
                    <section class="table-background">
                        <div class="table-responsive">
                            <!--Table-->
                            <div class="addNew">
                                <a href="#" data-backdrop="static" data-target="" data-toggle="modal" class="btn btn-custom mrg-l15 ">Unlinked Book</a>
                            </div>
                            <table class="table table-striped" id="tbl_unlink">
                                <!--Table head-->
                                <thead class="thead-background">
                                    <tr>
                                        <th class="table-bolder">#</th>
                                        <th class="table-bolder">
                                            <label class="switch">
                                                <input type="checkbox" title="Edit Status" id="chk_unall" class="Chk_select switchBox switch-small form-checkbox chk_all" data-type="IsActive" data-on="success" data-off="danger"><span class="slider round"></span></label>
                                            Select All</th>
                                        <th class="table-bolder">Name</th>
                                        <th class="table-bolder">Sub Title</th>
                                        <th class="table-bolder">ISBN</th>
                                    </tr>
                                </thead>
                            </table>
                            <!--Table-->
                        </div>
                    </section>
                </div>
                <div class="col-md-6">
                    <section class="table-background">
                        <div class="table-responsive">
                            <!--Table-->
                            <div class="addNew">
                                <a href="#" data-backdrop="static" data-target="" data-toggle="modal" class="btn btn-custom mrg-l15 ">Linked Book</a>
                            </div>
                            <table class="table table-striped" id="tbl_link">
                                <!--Table head-->
                                <thead class="thead-background">
                                    <tr>
                                        <th class="table-bolder">#</th>
                                        <th class="table-bolder">
                                            <label class="switch">
                                                <input type="checkbox" title="Edit Status" id="chk_all" class="Chk_select switchBox switch-small form-checkbox chk_all" data-type="IsActive" data-on="success" data-off="danger"><span class="slider round"></span></label>
                                            Select All</th>
                                        <th class="table-bolder">Name</th>
                                        <th class="table-bolder">Sub Title</th>
                                        <th class="table-bolder">ISBN</th>

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
            //DataBind(0);
            var ch = 0;
            tableBindlab();
        });

        $(document).on('change', '#<%=ddl_shlef.ClientID%>', function () {
            $('#tbl_unlink').DataTable().clear().destroy();
            $('#tbl_unlink').DataTable().clear();
            $('#tbl_link').DataTable().clear().destroy();
            $('#tbl_link').DataTable().clear();
            if ($(this).val() != "0" && $(this).val() != null && $('#<%=ddl_rack.ClientID%>').val() != "0") {
                var rack = $('#<%=ddl_rack.ClientID%>').val();
                DataBind($(this).val());
            }
        });

        $(document).on('change', '#<%=ddl_rack.ClientID%>', function () {
            $('#<%=ddl_shlef.ClientID%>').change();
        });




        function DataBind(id) {
            $.ajax({
                type: "POST",
                url: "lnkbookshelf.aspx/GetBookByShelf",
                data: "{'shelfID':'" + id + "'}",
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
                    data: 'book_kid', sortable: false, searchable: false,
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
                                value: row.book_kid,
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
                { data: 'book_title', sortable: true, searchable: true },
                { data: 'book_subtitle', sortable: true, searchable: true },
                { data: 'book_isbn13', sortable: true, searchable: true },
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
                    data: 'book_kid', sortable: false, searchable: false,
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
                                value: row.boobook_kid,
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
                { data: 'book_title', sortable: true, searchable: true },
                { data: 'book_subtitle', sortable: true, searchable: true },
                { data: 'book_isbn13', sortable: true, searchable: true },
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
                console.log(checkVal);
                if (checkVal != '') {
                    $('#<%=hdn_UnlinkID.ClientID%>').val(checkVal);
                    return true;
                }
                else {
                    MsgArray[0] = Msg["SelectRow"] + 'Unlink Book table.';
                    MsgColor(true);
                    MsgAlert();
                }
            }
            else {
                MsgArray[0] = Msg["TableRow"] + 'Unlink Book table.';
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
                console.log(checkVal);
                if (checkVal != '') {
                    $('#<%=hdn_LinkID.ClientID%>').val(checkVal);
                    return true;
                }
                else {
                    MsgArray[0] = Msg["SelectRow"] + 'link Service table.';
                    MsgColor(true);
                    MsgAlert();
                }
            }
            else {
                MsgArray[0] = Msg["TableRow"] + 'link Service table.';
                MsgColor(true);
                MsgAlert();
            }
            return false;
        }
        function Unlink() {
            MsgArray[0] = Msg["Unlinked"];
            MsgColor(false);
            MsgAlert();
            MsgAlert();
            DataBind($('#<%=ddl_shlef.ClientID%>').val());
            <%--$('#<%=ddl_shlef.ClientID%>').change();--%>
        }
        function Link() {
            MsgArray[0] = Msg["Linked"];
            MsgColor(false);
            MsgAlert();
            DataBind($('#<%=ddl_shlef.ClientID%>').val());

          <%--  $('#<%=ddl_rack.ClientID%>').change();--%>
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

        $(document).on('click', '.chk_link', function () {
            var ch = 0;
            $('#tbl_link .Chk_select').each(function () {

                if (!($(this).is(':checked'))) {

                    ch = ch + 1;

                }
                if (ch == 1) {

                    $('#chk_all').prop('checked', true);
                }
                else {
                    $('#chk_all').prop('checked', false);
                }
            });
        });

        $(document).on('click', '.chk_unlink', function () {
            var ch = 0;
            $('#tbl_unlink .Chk_select').each(function () {
                if (!($(this).is(':checked'))) {
                    ch++;
                }
                if (ch == 1) {
                    $('#chk_unall').prop('checked', true);
                }
                else {
                    $('#chk_unall').prop('checked', false);
                }
            });
        });



        function tableBindlab() {

            $('#tbl_unlink').DataTable();
            $('#tbl_link').DataTable();
        }
    </script>
</asp:Content>
