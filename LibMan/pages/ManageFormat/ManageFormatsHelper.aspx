<%@ Page Title="Manage Format - Lib-Man" Language="C#" MasterPageFile="~/pages/Admin/Dashboard/Admin.Master"
    AutoEventWireup="true" CodeBehind="ManageFormatsHelper.aspx.cs" Inherits="pages.ManageFormats.ManageFormatsHelper" %>
<%@ Register Src="~/pages/Partial/Popup.ascx" TagName="Popup"
    TagPrefix="Partial" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-6 mb-2">
            <section class="table-background">

                <div class="table-responsive">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <table class="table table-striped" id="tbl_format">
                                <thead class="thead-background">
                                    <tr>
                                        <th class="table-bolder">#</th>
                                        <th class="table-bolder">Format Name</th>
                                        <th class="table-bolder">Format Type</th>
                                        <th class="table-bolder">Status</th>
                                        <th class="table-bolder">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rptr" runat="server" OnItemCommand="rptr_ItemCommand">
                                        <ItemTemplate>
                                            <tr runat="server" id="tr_Color">
                                                <td>
                                                    <%#Container.ItemIndex+1 %>
                                                </td>
                                                <td class="ghms_tl">
                                                    <asp:Label ID="lbl_formatname" runat="server" Text='<%#Eval("FormatTemplate_ename")%>'></asp:Label>
                                                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("FormatTemplate_Parentid")%>' />
                                                    <asp:HiddenField ID="HiddenField2" runat="server" Value='<%#Eval("FormatTemplate_Ftype")%>' />
                                                    <asp:HiddenField ID="hdn_status" runat="server" Value='<%#Eval("FormatTemplate_Status")%>' />
                                                    <asp:HiddenField ID="hdn_mnuid" runat="server" Value='<%#Eval("Format_mnumid")%>' />
                                                    <asp:HiddenField ID="hdn_pageid" runat="server" Value='<%#Eval("FormatTemplate_Formatid")%>' />
                                                    <asp:HiddenField ID="hdn_linktable" runat="server" Value='<%#Eval("Format_linkTable")%>' />
                                                </td>
                                                <td>
                                                    <%#Eval("FormatTemplate_Ftype")%>
                                                </td>
                                                <td>
                                                    <%#Eval("FormatTemplate_Status")%>
                                                </td>
                                                <td>
                                                    <i class="fa fa-edit btn_faEdit"></i>
                                                    <asp:Button ID="btn_Edit" CommandArgument='<%#Eval("FormatTemplate_kid") %>' CssClass="btn_Edit" CommandName="Edit" Style="display: none" runat="server" Text="Edit" />

                                                    <i class="fa fa-trash btn_faDelete"></i>
                                                    <asp:Button ID="btn_Delete" CommandArgument='<%#Eval("FormatTemplate_kid") %>' CssClass="btn_Delete" CommandName="Delete" Style="display: none" runat="server" Text="Delete" />

                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btn_ok" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="ddl_pagename" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="ddl_mnumname" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="rdbtn_Body" EventName="CheckedChanged" />
                            <asp:AsyncPostBackTrigger ControlID="rdbtn_Footer" EventName="CheckedChanged" />
                            <asp:AsyncPostBackTrigger ControlID="rdbtn_Header" EventName="CheckedChanged" />
                            <asp:AsyncPostBackTrigger ControlID="rdbtn_Label" EventName="CheckedChanged" />
                            <%--<asp:AsyncPostBackTrigger ControlID="rdbtn_Email" EventName="CheckedChanged" />--%>
                            <asp:AsyncPostBackTrigger ControlID="rdbtn_oph" EventName="CheckedChanged" />
                            <asp:AsyncPostBackTrigger ControlID="rdbtn_lpf" EventName="CheckedChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </section>
        </div>
        <div class="col-md-6">

            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:HiddenField ID="hdn_locationid" runat="server" Value="0" />
                    <div class="row">
                        <div class="col-12">
                            <asp:Label ID="lbl_mode" runat="server" CssClass=" btntwo" Text="New Mode"></asp:Label>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-md-4 col-sm-3">
                            <label class="input-label-modal">Module Name<i class="fas fa-asterisk text-danger font_8"></i></label>
                        </div>
                        <div class="col-md-8 col-sm-9 ">
                            <asp:DropDownList ID="ddl_mnumname" TabIndex="1" runat="server" CssClass="BlankSelect form-control all-border border-bottom-2 font-12"
                                OnSelectedIndexChanged="ddl_mnumname_SelectedIndexChanged" AutoPostBack="true">
                            </asp:DropDownList>

                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-md-4 col-sm-3">
                            <label class="input-label-modal">Activity Name<i class="fas fa-asterisk text-danger font_8"></i></label>
                        </div>
                        <div class="col-md-8 col-sm-7 ">
                            <asp:DropDownList ID="ddl_pagename" TabIndex="2" runat="server" CssClass="BlankSelect form-control all-border border-bottom-2 font-12"
                                AutoPostBack="true" OnSelectedIndexChanged="ddl_pagename_SelectedIndexChanged">
                            </asp:DropDownList>


                        </div>
                       <%-- <div class="col-md-2 col-sm-2 ">
                            <asp:Button ID="btn_view" runat="server" CssClass="btn btntwo" Text="View" TabIndex="3"
                                OnClientClick="javascript:return confirmSubmitIssue();" OnClick="btn_view_Click" />
                        </div>--%>
                    </div>
                    <div class="row mt-2">
                        <div class="col-md-4 col-sm-3">
                            <label class="input-label-modal">Associate Format Header Footer</label>
                        </div>
                        <div class="col-md-8 col-sm-9 ">
                            <asp:DropDownList ID="ddl_FormatParent" TabIndex="4" runat="server" CssClass=" form-control all-border border-bottom-2 font-12">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-md-4 col-sm-3">
                            <label class="input-label-modal">Format Name<i class="fas fa-asterisk text-danger font_8"></i></label>
                        </div>
                        <div class="col-md-8 col-sm-9 ">
                            <asp:TextBox ID="txt_FormatName" TabIndex="5" runat="server" CssClass="all-border BlankText border-bottom-2 font-12 width-100"
                                MaxLength="100">
                            </asp:TextBox>
                            <asp:HiddenField ID="hdn_sampleTypeid" runat="server" Value="0" />
                            <asp:HiddenField ID="hdn_type" runat="server" />
                            <asp:HiddenField ID="hdn_linktab" runat="server" />

                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-md-4 col-sm-3">
                            <label class="input-label-modal">Status</label>
                        </div>
                        <div class="col-md-8 col-sm-9 status">
                            <label class="switch">
                                <input id="chk_status" type="checkbox" tabindex="6" runat="server" class="switchBox switch-small form-checkbox" data_on="success" data_off="danger" checked="checked" />
                                <span class="slider round"></span>
                            </label>
                        </div>
                    </div>

                    <div class="row mt-2">
                        <div class="col-md-4 col-sm-3">
                            <label class="input-label-modal">Format Type</label>
                        </div>
                        <div class="col-md-8 col-sm-9 ">
                            <div class="form-check form-check-inline">
                                <asp:RadioButton ID="rdbtn_Header" runat="server" class="form-check-input"
                                    AutoPostBack="true" OnCheckedChanged="rdbtn_CheckedChanged"  TabIndex="7"
                                    GroupName="fortype" />
                                <label class="form-check-label input-label-modal ml-1">Header</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <asp:RadioButton ID="rdbtn_Footer" runat="server" class="form-check-input"   TabIndex="8"
                                    AutoPostBack="true" OnCheckedChanged="rdbtn_CheckedChanged" GroupName="fortype" />
                                <label class="form-check-label input-label-modal ml-1">Footer</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <asp:RadioButton ID="rdbtn_Body" runat="server" Checked="true"  TabIndex="9"
                                    AutoPostBack="true" OnCheckedChanged="rdbtn_CheckedChanged" class="form-check-input"
                                    GroupName="fortype" />
                                <label class="form-check-label input-label-modal ml-1">Body</label>
                            </div>

                            <div class="form-check form-check-inline">
                                <asp:RadioButton ID="rdbtn_Label" runat="server"  TabIndex="10" class="form-check-input"
                                    AutoPostBack="true" OnCheckedChanged="rdbtn_CheckedChanged" GroupName="fortype" />
                                <label class="form-check-label input-label-modal ml-1">Label</label>
                            </div>
<%--                            <div class="form-check form-check-inline">
                                <asp:RadioButton ID="rdbtn_Email" runat="server" TabIndex="11" class="form-check-input"
                                    AutoPostBack="true" OnCheckedChanged="rdbtn_CheckedChanged" GroupName="fortype" />
                                <label class="form-check-label input-label-modal ml-1">Email</label>
                            </div>--%>
                            <div class="form-check form-check-inline">
                                <asp:RadioButton ID="rdbtn_oph" runat="server"  TabIndex="12" class="form-check-input"
                                    AutoPostBack="true" OnCheckedChanged="rdbtn_CheckedChanged" GroupName="fortype" />
                                <label class="form-check-label input-label-modal ml-1">Other Page Header</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <asp:RadioButton ID="rdbtn_lpf" runat="server"  TabIndex="13" class="form-check-input"
                                    AutoPostBack="true" OnCheckedChanged="rdbtn_CheckedChanged" GroupName="fortype" />
                                <label class="form-check-label input-label-modal ml-1">Last Page Footer</label>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-sm-12 col-12 mt-3">
                            <div class="form-group mb-0 text-center  mx-auto form-inline form-inherit">
                                <asp:Button ID="btn_ok" runat="server" CssClass="ml-2 btn  btntwo" OnClick="btn_ok_Click"  TabIndex="14"
                                    Text="Save" OnClientClick="return Fn_Save();" />
                                <asp:Button ID="btn_new" runat="server" CssClass="ml-2 btn  btntwo" OnClick="btn_new_Click"  TabIndex="15"
                                    Text="Clear" />
                                <input id="btn_createFormat" type="button" value="Create Format" class="ml-2 btn  btntwo"  TabIndex="16"
                                    onclick="FormatCall();"  />
                                <asp:Button ID="btn_FormatLink" runat="server" CssClass="ml-2 btn  btntwo"  TabIndex="17"
                                    OnClick="btn_FormatLink_Click" Text="Linking" OnClientClick="javascript:return confirmLink();" />

                            </div>

                        </div>
                </ContentTemplate>

                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="rptr" EventName="ItemCommand" />
                </Triggers>
            </asp:UpdatePanel>

            <asp:HiddenField ID="hdn_popUp" runat="server" />
        </div>



    </div>

  <%--  <section>

        <div class="modal" id="FormatPopup">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content pb-4">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <p class="modal-title text-center m-auto">Format Details</p>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <section>

                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div class="row">
                                        <div class="col-sm-5 col-12 ">
                                            <label class="input-label-modal">Stored Procedure : </label>
                                        </div>
                                        <div class="col-sm-7 col-12">
                                            <asp:Label ID="lbl_sp" runat="server" CssClass="input-label-modal" Text=""></asp:Label>

                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-7 col-12">
                                            <label class="input-label-modal">Link Table : </label>
                                        </div>
                                        <div class="col-sm-5 col-12">
                                            <asp:Label ID="lbl_table" runat="server" CssClass="input-label-modal" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btn_View" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </section>
                    </div>
                </div>
            </div>
        </div>

    </section>--%>
     <Partial:Popup ID="Popup" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder_BottomScripts" runat="server">

    <script type="text/javascript" language="javascript">

        function btn_close_click() {
            var modal = $find("Popup1");
            modal.hide();
        }
        $(function () {
            BindDatatable();
            $('[tabindex=1]').focus();
            //fn_ManageFormats();
        });

        function BindDatatable() {
            $('#tbl_format').DataTable({
                bLengthChange: true,
                lengthMenu: [[5], [5]],
                iDisplayLength: -1,
                "scrollCollapse": true,
                "scrollY": 350,
                "scrollX": true,
                "jQueryUI": true

            });
        }

        $(document).on('click', '.btn_faEdit', function () {
            $(this).next().click();
        });

        $(document).on('click', '.btn_faDelete', function () {
            var id = $(this).next().attr('id');
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
                        $('#' + id + '').click();
                    }
                });
        });


        //function popupextender() {

        //    BindDatatable();
        //}


        function redirect() {
            window.location = "ManageFormatsHelper.aspx";

        }

<%--        function confirmSubmitIssue() {
            if ($('#<%=ddl_pagename.ClientID %>').val() == "" || $('#<%=ddl_pagename.ClientID %>').val() == "0" || $('#<%=ddl_pagename.ClientID %>').val() == null) {
                MsgArray[MsgArray.length] = 'Please select activity.';
                $(this).addClass('border-bottom-Danger');
                MsgColor(true);
                MsgAlert();
                return false;
            }
            else {
                $(this).removeClass('border-bottom-Danger');
                $("#FormatPopup").modal('show');
                return true;
            }
            return Page_IsValid;
        }--%>

        function confirmLink() {
            var result;
            if ($('#<%=hdn_sampleTypeid.ClientID %>').val() == '' || $('#<%=hdn_sampleTypeid.ClientID %>').val() == "0") {
                MsgArray[MsgArray.length] = 'Please select the Format Name';
            }
            else if ($('#<%=hdn_type.ClientID %>').val() != 'B') {
                MsgArray[MsgArray.length] = 'Please select body type format only';
            }
            else if ($('#<%=hdn_linktab.ClientID %>').val() == '' || $('#<%=hdn_linktab.ClientID %>').val() == null) {
                MsgArray[MsgArray.length] = 'Format Link Table Not Found.';
            }


            if (MsgArray.length > 0) {
                MsgColor(true);
                MsgAlert();
                return false;
            }
            else {
                return true;
            }

            return Page_IsValid;

        }


        function FormatCall() {
            if ($('#<%=hdn_sampleTypeid.ClientID %>').val() != '' && $('#<%=hdn_sampleTypeid.ClientID %>').val() != "0") {
                $("#Popup").modal('show');
                $('#Popup p').text('Create Format');
                $('.PopupIframe').attr("src", "EditFormatHelper.aspx?type=" + $('#<%=hdn_type.ClientID %>').val() + "&FormatID=" + $('#<%=hdn_sampleTypeid.ClientID %>').val() + "");
            }
            else {
                MsgArray[MsgArray.length] = 'Please select the Format.';
                MsgColor(true);
                MsgAlert();
            }
        
        }

        function fn_LinkTable() {

            openModelPopUp('/HMS/GS_ManageFormats/GS_PageTable_Linking.aspx?type=' + $('#<%=hdn_type.ClientID %>').val() + '&FormatID=' + $('#<%=hdn_sampleTypeid.ClientID %>').val() + '&mnumid=' + $('#<%=ddl_mnumname.ClientID %>').val(), 'Page Format Linking', '');
        }

        function Save(result) {
            if (result == "1") {
                MsgArray[0] = Msg["Update"];
                MsgColor(false);
            }
            else if (result == "2") {
                MsgArray[0] = Msg["Insert"];
                MsgColor(false);
            }
            else if (result == "3") {
                MsgArray[0] = Msg["Already"];
                MsgColor(true);

            }
            MsgAlert();
            BindDatatable();
        }



        function DeleteResponse(result) {
            if (result == "1") {
                MsgArray[0] = Msg["Delete"];
                MsgColor(false);
            }

            else {
                MsgArray[0] = Msg["LinkedRec"];
                MsgColor(true);

            }
            MsgAlert();
            BindDatatable();
        }


    </script>
</asp:Content>

