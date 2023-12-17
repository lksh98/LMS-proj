<%@ Page Title="SMS API Configuration - Lib-Man" Language="C#" MasterPageFile="~/pages/Admin/Dashboard/Admin.Master" AutoEventWireup="true" CodeBehind="SMSAPIConfig.aspx.cs" Inherits="LibMan.pages.Admin.Sms_Email.SMSAPIConfig" %>

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
                        <th class="table-bolder">Config Name</th>
                        <th class="table-bolder">Default</th>
                        <th class="table-bolder">Action</th>
                    </tr>
                </thead>
            </table>
            <!--Table-->
        </div>
    </section>
    <section>
        <!-- The Modal -->
        <div class="modal" id="SmsconfigPopup">
            <asp:UpdatePanel runat="server" ID="update">
                <ContentTemplate>
                    <div class="modal-dialog9 modal-dialog-centered">
                        <div class="modal-content pb-4">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <p class="modal-title text-center m-auto">SMS API Configuration </p>
                                <button type="button" class="close" data-dismiss="modal" onclick="Clear();">&times;</button>
                            </div>
                            <!-- Modal body -->
                            <div class="modal-body">
                                <section>
                                    <div class="row  border-bottom-1">
                                        <div class="col-md-10 col-sm-8 col-8 mt-2">
                                            <h3 id="Config_head" class="heading-modal">New Mode</h3>
                                        </div>
                                        <div class="col-sm-1 pr-0 col-2 border-left-radius text-right">
                                            <asp:ImageButton src="/pages/Admin/images/save.png" class="icon-t-modal" runat="server" ID="btn_save" OnClick="btn_save_Click" OnClientClick="return Fn_Save();" TabIndex="6" title="Save"></asp:ImageButton>
                                        </div>
                                        <div class="col-sm-1 pl-0 col-2 border-right-radius text-center">
                                            <img src="/pages/Admin/images/clear.png" class="icon-t-modal" onclick="Clear();" title="Clear">
                                        </div>
                                    </div>
                                   <%-- <div class="row  border-bottom-1">
                                        <div class=" col-md-12 col-sm-12">
                                            <h5>Sample</h5>
                                            <div>
                                                <label class="input-label-modal">
                                                    Config String :- http://mydatasms.com/sendhttp.php?user=sjoshi303&password=659964&mobiles=7742094349&message=Send by sms pack&sender=SMSINSTARAD1<br />
                                                    Common prt :- http://demosms.com/sendhttp.php?user=UserName&password=Password&sender=SMSINSTARAD1<br />
                                                    For Mobile :- &mobiles<br />
                                                    For Message :- &message
                                                </label>
                                            </div>
                                        </div>
                                    </div>--%>
                                    <div class="row mt-4">
                                        <div class=" col-md-3 col-sm-2">
                                            <label class="input-label-modal">Config String Name<i class="fas fa-asterisk text-danger font_8"></i></label>
                                        </div>
                                        <div class="col-md-9 col-sm-10">
                                            <input id="txt_name" type="text" runat="server" placeholder="..............................................." class="BlankText all-border border-bottom-2 font-12 width-100" tabindex="1">
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class=" col-md-3 col-sm-2">
                                            <label class="input-label-modal">Common Part<i class="fas fa-asterisk text-danger font_8"></i></label>
                                        </div>
                                        <div class="col-md-9 col-sm-10">
                                            <input id="txt_commonpart" type="text" runat="server" placeholder="..............................................." class="BlankText all-border border-bottom-2 font-12 width-100" tabindex="2">
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class=" col-md-3 col-sm-2">
                                            <label class="input-label-modal">For Mobile<i class="fas fa-asterisk text-danger font_8"></i></label>
                                        </div>
                                        <div class="col-md-9 col-sm-10">
                                            <input id="txt_fmobileno" type="text" runat="server" placeholder="..............................................." class="BlankText all-border border-bottom-2 font-12 width-100" tabindex="3">
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-md-3 col-sm2">
                                            <label class="input-label-modal">For Message<i class="fas fa-asterisk text-danger font_8"></i></label>
                                        </div>
                                        <div class="col-md-9 col-sm-10">
                                            <input id="txt_fmsg" type="text" runat="server" placeholder="..............................................." class="BlankText all-border border-bottom-2 font-12 width-100" tabindex="4">
                                        </div>
                                    </div>

                                    <div class="row mt-2">
                                        <div class="col-md-3 col-sm-2">
                                            <label class="input-label-modal">Make Default</label>
                                        </div>
                                        <div class="col-md-9 col-sm-10 status">
                                            <label class="switch">
                                                <input id="chk_default" type="checkbox" runat="server" class="switchBox switch-small form-checkbox" data_on="success" data_off="danger" checked="checked" tabindex="5" />
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
    </section>








</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_BottomScripts"
    runat="server">
    <script>
        var table;
        $(function () {
            DataBind();

        });
        function DataBind() {
            $.ajax({
                type: "POST",
                url: "/Classes/Services.asmx/GetSMSConfig",
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
                { data: 'SMSConfig_ConfigName', sortable: true, searchable: true },
                { data: 'SMSConfig_Default', sortable: true, searchable: true },
                {
                    name: "Action", data: null, title: "Action", sortable: false, searchable: false,
                    render: function (data, type, row, meta) {
                        var actionButtons = '';
                        actionButtons += $("<a />", {
                            title: "Edit Configuration",
                            class: "btn btn-default btn-sm tb-edit-btn",
                            href: "#",
                            onclick: "Edit(" + row.SMSConfig_Kid + ")",
                            'data-toggle': "modal",
                            'data-target': "#SmsconfigPopup",
                            'data-backdrop': "static",
                            html: $("<i />", {
                                class: "fa fa-edit"
                            }).get(0).outerHTML
                        }).get(0).outerHTML;

                        return actionButtons;
                    }
                }]
            });
        }

        function Edit(id) {
            $('[tabindex=' + 1 + ']').focus();
            $('#Config_head').text('Edit SMS Configuration');
            $('#<%=hdn_id.ClientID%>').val(id);
            var Edit_Config = jqPost("/Classes/Services.asmx/GetSMSConfigsByID", "{'id':'" + id + "'}");

            if (Edit_Config != null && Edit_Config.Table1.length > 0) {

                $('#<%=txt_name.ClientID%>').val(Edit_Config.Table1[0].SMSConfig_ConfigName);
                $('#<%=txt_commonpart.ClientID%>').val(Edit_Config.Table1[0].SMSConfig_CommonPart);
                $('#<%=txt_fmobileno.ClientID%>').val(Edit_Config.Table1[0].SMSConfig_ForMobile);
                $('#<%=txt_fmsg.ClientID%>').val(Edit_Config.Table1[0].SMSConfig_ForMessage);
                if (Edit_Config.Table1[0].SMSConfig_Default == "True" || parseInt(Edit_Config.Table1[0].SMSConfig_Default) == 1) {
                    $('#<%=chk_default.ClientID%>').prop("checked", true);
                }
                else
                    $('#<%=chk_default.ClientID%>').prop("checked", false);
            }
        }


        function Add() {
            $('#Config_head').text('Add SMS Configuration');
            $('#<%=hdn_id.ClientID%>').val('');
            $('[tabindex=' + 1 + ']').focus();
        }


        function Save(response) {
            if (response == "1") {
                MsgArray[0] = Msg["Update"];
                MsgColor(false);
                MsgAlert();
                $('.close').click();
                Clear();
                DataBind();
            }
            else if (response == "2") {
                MsgArray[0] = Msg["Insert"];
                MsgColor(false);
                MsgAlert();
                $('.close').click();
                Clear();
                DataBind();
            }
            else if (response == "3") {
                MsgArray[0] = Msg["Already"];
                MsgColor(true);
                MsgAlert();
                $('#SmsconfigPopup').modal('show');
            }
        }
        function Clear() {
            $('#<%=hdn_id.ClientID%>').val('');
            $('#<%=txt_name.ClientID%>').val('');
            $('#<%=txt_commonpart.ClientID%>').val('');
            $('#<%=txt_fmobileno.ClientID%>').val('');
            $('#<%=txt_fmsg.ClientID%>').val('');
            $('#<%=chk_default.ClientID%>').prop("checked", true);
            $('.border-bottom-Danger').each(function () {
                $(this).removeClass("border-bottom-Danger");
            });
        }
    </script>
</asp:Content>
