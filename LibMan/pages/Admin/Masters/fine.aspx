<%@ Page Title="Fine Master - Lib-Man" Language="C#" MasterPageFile="../Dashboard/Admin.Master" AutoEventWireup="true" CodeBehind="fine.aspx.cs" EnableEventValidation="false" Inherits="LibMan.pages.Admin.Masters.fine" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <style>
        .removeVariablecontrol {
            padding-left: 0.6rem !important;
            padding-right: 0.6rem !important;
        }

        .addVariablecontrol {
            padding-left: 0.5rem !important;
            padding-right: 0.5rem !important;
        }

        .modal-dialog5 {
            max-width: 600px;
            margin: 1.75rem auto;
        }
    </style>
    <input type="hidden" runat="server" id="hdn_id" />
    <input type="hidden" runat="server" id="hdn_interval" />
    <input type="hidden" runat="server" id="hdn_userkid" />
    <section class="table-background">
        <div class="table-responsive">
            <!--Table-->

            <table class="table table-striped" id="tbl_Fine">
                <!--Table head-->
                <thead class="thead-background">
                    <tr>
                        <th class="table-bolder">#</th>
                        <th class="table-bolder">Applicable to </th>
                        <th class="table-bolder">Fine Type</th>
                        <th class="table-bolder">Fine Applicable</th>
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
                                <p class="modal-title text-center m-auto">Fine Master</p>
                                <button type="button" class="close" data-dismiss="modal" onclick="Clear();">&times;</button>
                            </div>
                            <!-- Modal body -->
                            <div class="modal-body">
                                <section>
                                    <div class="row  border-bottom-1">

                                        <div class="col-md-8 col-sm-8 col-8 mt-3">
                                            <h3 id="Fine_head" class="heading-modal modalheader"></h3>
                                        </div>
                                        <div class="col-sm-2 pr-0 col-2 border-left-radius text-right">
                                            <asp:ImageButton ID="btn_save" src="/pages/Admin/images/save.png" class="icon-t-modal" OnClick="btn_save_Click" OnClientClick="return Save_FN();" TabIndex="28" title="Save" runat="server" />
                                        </div>

                                    </div>
                                    <%--  <div class="row mt-4">
                                        <div class="col-md-4 col-sm-3">
                                            <label class="input-label-modal">User Type</label>
                                        </div>
                                        <div class="col-md-8 col-sm-9">
                                            <asp:DropDownList ID="ddl_usrType" CssClass="ddl_usrType BlankSelect form-control all-border border-bottom-2 font-12" runat="server" TabIndex="2">
                                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Department" Value="D"></asp:ListItem>
                                                <asp:ListItem Text="Staff" Value="S"></asp:ListItem>
                                                <asp:ListItem Text="Student" Value="U"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                    </div>--%>

                                    <div class="row mt-4">
                                        <div class="col-md-4 col-sm-3">
                                            <label class="input-label-modal">Fine Type </label>
                                        </div>
                                        <div class="col-md-8 col-sm-9">
                                            <asp:DropDownList ID="ddl_ftype" CssClass="ddl_ftype BlankSelect form-control all-border border-bottom-2 font-12" runat="server" TabIndex="2">
                                                <asp:ListItem Text="Daily Basis" Value="F" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="Interval Basis" Value="V"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="row mt-1 dailybasis">
                                        <div class="col-md-4 col-sm-3">
                                            <label class="input-label-modal">Amount </label>
                                        </div>
                                        <div class="col-md-8 col-sm-9">
                                            <input type="text" maxlength="10" id="txt_Amount" runat="server" tabindex="1" placeholder="..............................................." class="  amount decimal text-right all-border border-bottom-2 font-12 width-100">
                                        </div>
                                    </div>

                                    <div class="row mt-1 variable d-none">
                                        <div class="col-md-4 col-sm-3">
                                            <label class="input-label-modal">Interval (In Days) </label>
                                        </div>
                                        <div class="col-md-8 col-sm-9 ">
                                            <div class=" row">
                                                <div class="col-md-3 pr-1 ">
                                                    From
                                                </div>
                                                <div class="col-md-3 px-1 ">
                                                    To
                                                </div>
                                                <div class="col-md-3 px-1 ">
                                                    Amount
                                                </div>
                                                <div class="col-md-3 pl-1">
                                                </div>
                                            </div>
                                            <div class="interval"></div>
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
                url: 'Fine.aspx/getAllFines',
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
            table = $('#tbl_Fine').DataTable({
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
                { data: 'fineusr', sortable: true, searchable: true },
                { data: 'finemast_finetype', sortable: true, searchable: true },
                { data: 'isapplicable', sortable: true, searchable: true },
                {
                    name: "Action", data: null, title: "Action", sortable: false, searchable: false,
                    render: function (data, type, row, meta) {
                        var actionButtons = '';
                        actionButtons += $("<a/>", {
                            title: "Edit Fine",
                            class: "btn btn-default btn-sm tb-edit-btn",
                            href: "#",
                            onclick: "Edit(" + row.finemast_kid + ")",
                            'data-toggle': "modal",
                            'data-target': "#Popup",
                            'data-backdrop': "static",
                            html: $("<i/>", {
                                class: "fa fa-edit"
                            }).get(0).outerHTML
                        }).get(0).outerHTML;
                        return actionButtons;
                    }
                }],
                "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
                    if (aData.isapplicable == "Applicable") {
                        $('td', nRow).css('background-color', '#e5fdf5');
                    }
                    else {
                        $('td', nRow).css('background-color', '#F3D2CB');
                    }
                },
            });
        }
        function Edit(id) {
            $('[tabindex=' + 1 + ']').focus();
            $('#<%=hdn_id.ClientID%>').val(id);
            var EditFine = jqPost("Fine.aspx/GetFineByID", "{'id':'" + id + "'}");
            if (EditFine != null && EditFine.Table1.length > 0) {
                $('#Fine_head').text(EditFine.Table1[0].fineusr);
                $('#<%=ddl_ftype.ClientID%>').val(EditFine.Table1[0].finemast_finetype);
                $('#<%=ddl_ftype.ClientID%>').change();
                $('#<%=txt_Amount.ClientID%>').val(EditFine.Table1[0].finemast_Amt);
                if (EditFine.Table1[0].finemast_finetype == 'V') {
                    if (EditFine.Table11.length > 0) {
                        var html = ``;
                        for (let i = 0; i < EditFine.Table11.length; i++) {
                            html += `  <div class=" row mt-1">
                            <div class="col-md-3 pr-1 ">
                                <input type="text" value="${EditFine.Table11[i].finemastdet_from}" readonly="readonly" style="width: 50px" class="datef int   text-right all-border border-bottom-2 font-12 " />
                            </div>`
                            if (EditFine.Table11.length - 1 == i) {
                                html += `<div class="col-md-3 px-1 ">
                                <input type="text" value="${EditFine.Table11[i].finemastdet_to}" style="width: 50px" class="datet int   text-right all-border border-bottom-2 font-12 " />
                                </div>
                                <div class="col-md-3 px-1 ">
                                    <input type="text" value="${EditFine.Table11[i].finemastdet_amt}" style="width: 50px" class="amount decimal   text-right all-border border-bottom-2 font-12  " />
                                </div>
                                <div class="col-md-3 pl-1">`;
                            }
                            else {
                                html += `<div class="col-md-3 px-1 ">
                                <input type="text" value="${EditFine.Table11[i].finemastdet_to}" readonly="readonly" style="width: 50px" class="datet int   text-right all-border border-bottom-2 font-12 " />
                                </div>
                                <div class="col-md-3 px-1 ">
                                    <input type="text" value="${EditFine.Table11[i].finemastdet_amt}" readonly="readonly" style="width: 50px" class="amount decimal   text-right all-border border-bottom-2 font-12  " />
                                </div>
                                <div class="col-md-3 pl-1">`;
                            }
                            if (EditFine.Table11.length - 2 == i)
                                html += `<input type="button" value="-" class="btn  btn-primary p-0   removeVariablecontrol" />`;
                            else if (EditFine.Table11.length - 1 == i)
                                html += `<input type="button" value="+" class="btn  btn-primary p-0   addVariablecontrol" />`;
                            else
                                html += `<input type="button" value="-" class="btn  btn-primary p-0   removeVariablecontrol" style="display: none;" />`;
                            html += `</div>
                                    </div>`;
                        }

                        $('.interval').empty();
                        $('.interval').append(html);
                    }
                }
            }
        }

        function Add() {
            $('#<%=hdn_id.ClientID%>').val('');
            $('[tabindex=' + 1 + ']').focus();
        }

        function Save(result) {
            if (result == "1") {
                MsgArray[0] = Msg["Update"];
                MsgColor(false);
                MsgAlert(); 
                Clear();
                DataBind();
            }
             
        }

        function Clear() {
            $('#<%=hdn_id.ClientID%>').val('');
            $('.border-bottom-Danger').each(function () {
                $(this).removeClass("border-bottom-Danger");
            });
            $('#<%=hdn_id.ClientID%>').val('');

        }



        $(document).on('change', '.ddl_ftype', function () {
            var data = $(this).val();
            if (data == 'F') {
                $('.dailybasis').removeClass('d-none');
                $('.variable').addClass('d-none');
            }
            else {
                $('.variable').removeClass('d-none');
                $('.dailybasis').addClass('d-none');
                $('.interval').empty();
                var html = `  <div class=" row">
                            <div class="col-md-3 pr-1 ">
                                <input type="text" value="1" readonly="readonly" style="width: 50px" class="datef int   text-right all-border border-bottom-2 font-12 " />
                            </div>
                            <div class="col-md-3 px-1 ">
                                <input type="text" value="" style="width: 50px" class="datet int   text-right all-border border-bottom-2 font-12 " />
                            </div>
                            <div class="col-md-3 px-1 ">
                                <input type="text" value="0" style="width: 50px" class="amount decimal   text-right all-border border-bottom-2 font-12  " />
                            </div>
                            <div class="col-md-3 pl-1">
                                <input type="button" value="+" class="btn  btn-primary p-0   addVariablecontrol" />
                            </div>
                        </div>`;
                $('.interval').append(html);
            }
        });


        $(document).on('change', '.datet', function () {
            var dtf = $(this).closest('.row').find('input.datef').val();
            var dtt = $(this).val();
            if (dtt != "" && parseInt(dtf) > parseInt(dtt)) {
                $(this).val('');
                $(this).focus();
                MsgArray[0] = "To interval cannot be less than from interval.";
                MsgColor(true);
                MsgAlert();
            }
        });

        function Save_FN() {
            var ftype = $('#<%=ddl_ftype.ClientID%>').val();
            if (ftype == 'V') {
                var valll = "";
                $('.interval').find('.row').each(function () {
                    var from = $(this).find('input:eq(0)').val();
                    var to = $(this).find('input:eq(1)').val();
                    var amount = $(this).find('input:eq(2)').val();
                    if (amount == "") amount = 0
                    if (valll != "")
                        valll += `~${from};${to};${amount}`
                    else
                        valll += `${from};${to};${amount}`
                });
                var lst = valll.split('~');
                if (lst[lst.length - 1].split(';')[1] != "") {
                    MsgArray[0] = "Last to interval should be empty for elsewhere calculation.";
                    MsgColor(true);
                    MsgAlert();
                    return false;
                }
                $('#<%=hdn_interval.ClientID%>').val(valll);
            }

        }

        $(document).on('blur', '.amount', function () {
            var amt = $(this).val();
            if (amt == "") {
                $(this).val('0');
                $(this).focus();
                MsgArray[0] = "Amount cannot be blank.";
                MsgColor(true);
                MsgAlert();
            }
        });


        $(document).on('click', '.removeVariablecontrol', function () {
            $(this).removeClass('removeVariablecontrol').addClass('addVariablecontrol').val('+');
            $(this).closest('.row').prev().find('.removeVariablecontrol').show().removeClass('addVariablecontrol').addClass('removeVariablecontrol').val('-');
            $(this).closest('.row').find('input.datet').val('');
            $(this).closest('.row').find('input.amount').val('0');
            $(this).closest('.row').find('input.datet').removeAttr('readonly', 'readonly');
            $(this).closest('.row').find('input.amount').removeAttr('readonly', 'readonly');
            $(this).closest('.row').next().remove();

        });


        $(document).on('click', '.addVariablecontrol', function () {
            var dtf = $(this).closest('.row').find('input.datef').val();
            var dtt = $(this).closest('.row').find('input.datet').val();
            var amt = $(this).closest('.row').find('input.amount').val();

            if (dtt != "") {
                $(this).closest('.row').find('input.datet').attr('readonly', 'readonly');
                $(this).closest('.row').find('input.amount').attr('readonly', 'readonly');
                $(this).closest('.row').prev().find('.removeVariablecontrol').hide();
                $(this).closest('.row').find('.addVariablecontrol').removeClass('addVariablecontrol').addClass('removeVariablecontrol').val('-');
                var html = `  <div class=" row mt-1">
                            <div class="col-md-3 pr-1 ">
                                <input type="text" value="${parseInt(dtt) + 1}" readonly="readonly" style="width:50px" class="datef int BlankText text-right all-border border-bottom-2 font-12 " />
                            </div>
                            <div class="col-md-3 px-1 ">
                                <input type="text" value="" style="width:50px" class="datet int BlankText text-right all-border border-bottom-2 font-12 " />
                            </div>
                            <div class="col-md-3 px-1 ">
                                <input type="text" value="0" style="width:50px" class="amount decimal BlankText text-right all-border border-bottom-2 font-12  " />
                            </div>
                            <div class="col-md-3 pl-1">
                                <input type="button" value="+" class="btn  btn-primary p-0 px-2 addVariablecontrol" />
                            </div>
                        </div>`;
                $('.interval').append(html);
                $('.interval .row:last').find('input.datet').focus();
            }
            else {
                MsgArray[0] = "To interval cannot be blank.";
                MsgColor(true);
                MsgAlert();
            }

        });




    </script>
</asp:Content>
