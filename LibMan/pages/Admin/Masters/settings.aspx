<%@ Page Title="Application Settings - Lib-Man" Language="C#" MasterPageFile="../Dashboard/Admin.Master" AutoEventWireup="true" CodeBehind="settings.aspx.cs" EnableEventValidation="false" Inherits="LibMan.pages.Admin.Masters.settings" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <style>
        .icon-t-modal {
            margin-top: 0px;
        }

        .legend {
            font-size: 12px;
            font-weight: 600;
            background-color: #015184;
            padding: 3px;
            border-radius: 10px;
            color: #fff;
            margin-left: 30px;
        }

        .fieldset {
            border-radius: 10px;
            border: 1px solid #01518429 !important;
        }
    </style>
    <input type="hidden" runat="server" id="hdn_id" />


    <section>
        <div class="row  border-bottom-1 pb-0">

            <div class="col-md-10 col-sm-8 col-8 ">
                <h3 id="College_head" class="heading-modal">Application Settings </h3>
            </div>
            <div class="col-sm-1 pr-0 col-2 border-left-radius text-right">
                <asp:ImageButton ID="btn_save" src="/pages/Admin/images/save.png" class="icon-t-modal" OnClick="btn_save_Click" OnClientClick="return Fn_Save();" TabIndex="28" title="Save" runat="server" />
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-12">
                <fieldset class="form-group border p-1 fieldset">
                    <legend class="w-auto px-2 legend">University/College Information</legend>
                    <div class="row">
                        <div class="col-md-1 col-sm-3">
                            <label class="input-label-modal">College Name</label>
                        </div>
                        <div class="col-md-2 col-sm-9">
                            <input type="text" maxlength="100" id="txt_college" runat="server" readonly="readonly" tabindex="1" placeholder="..............................................." class="  all-border border-bottom-2 font-12 width-100">
                        </div>
                        <div class="col-md-1 col-sm-3">
                            <label class="input-label-modal">Contact</label>
                        </div>
                        <div class="col-md-2 col-sm-9">
                            <input type="text" maxlength="10" id="txt_mobNo" runat="server" tabindex="2" placeholder="..............................................."  readonly="readonly" autocomplete="off" class="    all-border border-bottom-2 font-12 width-100">
                        </div>
                        <div class="col-md-1 col-sm-3">
                            <label class="input-label-modal">Email</label>
                        </div>
                        <div class="col-md-2 col-sm-9">
                            <input type="text" maxlength="100" id="txt_email" runat="server" tabindex="1" placeholder="..............................................."  readonly="readonly" class="  all-border border-bottom-2 font-12 width-100">
                        </div>
                        <div class="col-md-1 col-sm-3">
                            <label class="input-label-modal">Address</label>
                        </div>
                        <div class="col-md-2 col-sm-9">
                            <input type="text" maxlength="10" id="txt_Address" runat="server" tabindex="2" placeholder="..............................................." autocomplete="off"  readonly="readonly" class="    all-border border-bottom-2 font-12 width-100">
                        </div>
                    </div>
                </fieldset>

                <fieldset class="form-group border p-1 fieldset">
                    <legend class="w-auto px-2 legend">Maximum No of Days for Book Issued</legend>
                    <div class="row">
                        <div class="col-md-1 col-sm-3">
                            <label class="input-label-modal">Department </label>
                        </div>
                        <div class="col-md-2 col-sm-9">
                            <input type="text" maxlength="10" id="txt_deptdays" runat="server" tabindex="2" placeholder="..............................................." autocomplete="off" class="int text-right BlankText all-border border-bottom-2 font-12 width-100">
                        </div>
                        <div class="col-md-1 col-sm-3">
                            <label class="input-label-modal">Student </label>
                        </div>
                        <div class="col-md-2 col-sm-9">
                            <input type="text" maxlength="10" id="txt_stuDays" runat="server" tabindex="2" placeholder="..............................................." autocomplete="off" class="int text-right  BlankText all-border border-bottom-2 font-12 width-100">
                        </div>
                        <div class="col-md-1 col-sm-3">
                            <label class="input-label-modal">Staff/Faculty </label>
                        </div>
                        <div class="col-md-2 col-sm-9">
                            <input type="text" maxlength="10" id="txt_staffdays" runat="server" tabindex="2" placeholder="..............................................." autocomplete="off" class="int text-right  BlankText all-border border-bottom-2 font-12 width-100">
                        </div>
                    </div>
                </fieldset>

                <fieldset class="form-group border p-1 fieldset">
                    <legend class="w-auto px-2 legend">Maximum No of Book Issued</legend>
                    <div class="row">
                        <div class="col-md-1 col-sm-3">
                            <label class="input-label-modal">Department </label>
                        </div>
                        <div class="col-md-2 col-sm-9">
                            <input type="text" maxlength="10" id="txt_deptno" runat="server" tabindex="2" placeholder="..............................................." autocomplete="off" class="int text-right  BlankText all-border border-bottom-2 font-12 width-100">
                        </div>
                        <div class="col-md-1 col-sm-3">
                            <label class="input-label-modal">Student </label>
                        </div>
                        <div class="col-md-2 col-sm-9">
                            <input type="text" maxlength="10" id="txt_studentNo" runat="server" tabindex="2" placeholder="..............................................." autocomplete="off" class="int text-right  BlankText all-border border-bottom-2 font-12 width-100">
                        </div>
                        <div class="col-md-1 col-sm-3">
                            <label class="input-label-modal">Staff/Faculty </label>
                        </div>
                        <div class="col-md-2 col-sm-9">
                            <input type="text" maxlength="10" id="txt_staffNo" runat="server" tabindex="2" placeholder="..............................................." autocomplete="off" class="int text-right  BlankText all-border border-bottom-2 font-12 width-100">
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>


    </section>

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder_BottomScripts">
    <script>


        function Save(result, id) {
            if (result == "1") {
                MsgArray[0] = Msg["Update"];
                MsgColor(false);
                MsgAlert();
                $('.close').click();
                Clear();
                DataBind();
            }
           
             

        }






    </script>
</asp:Content>
