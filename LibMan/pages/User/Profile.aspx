<%@ Page Title="User Profile - Lib-Man" Language="C#" MasterPageFile="~/pages/Admin/Dashboard/Admin.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="LibMan.pages.User.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class=" dr-profile">
        <input type="hidden" value="" id="hdn_data" runat="server" />
        <input type="hidden" value="" id="hdn_id" runat="server" />
        <input type="hidden" value="" id="hdn_mid" runat="server" />
        <input type="hidden" value="" id="hdn_type" runat="server" />
        <div class="row mt-2">
            <div class="col-lg-2">
                <div class="dr-pro-top-bag" runat="server" id="div_profbag">
                    <div class="user-profiles text-center" runat="server" id="div_profimage">
                        <img src="../images/user.png" class="imgsel user-modal" id="usr_profile" runat="server">
                        <%--<i class="fas fa-edit img-upload uploadimage">  </i>--%>
                        <%--     <asp:FileUpload ID="file_upload" Style="display: none" runat="server" TabIndex="22" CssClass="img img_up" accept=".png, .jpg, .jpeg, .svg, .sveg" onchange="img_pathUrl(this);  " />--%>
                    </div>
                    <h5 class="mt-2  text-center" id="h_name" runat="server"></h5>
                    <p class=" text-center" id="h_role" runat="server"></p>
                </div>
                <div class=" dr-pro-bag">

                    <div class="mt-3">
                        <label class="input-label-modal"><b>User Code</b></label>
                        <input type="text" id="txt_ucode" runat="server" readonly maxlength="20" tabindex="2" placeholder="..............................................." class="  all-border border-bottom-2 font-12 width-100">
                    </div>
                    <div class="mt-3">
                        <label class="input-label-modal"><b>Password</b></label>
                        <input type="password" id="txt_password" runat="server" maxlength="24" tabindex="3" placeholder="..............................................." class="  all-border  border-bottom-2 font-12 width-100">
                    </div>
                    <div class="mt-3">
                        <label class="input-label-modal"><b>Re Password</b></label>
                        <input type="password" id="txt_repassword" runat="server" maxlength="24" tabindex="4" placeholder="..............................................." class="  all-border border-bottom-2 font-12 width-100">
                    </div>
                    <div class="mt-3  text-center">
                        <input type="button" id="usr_save" value="Update Password" class="btnthree">
                    </div>
                </div>
            </div>
            <div class="col-lg-10" runat="server">

                <div class="row">
                    <div class=" col-md-2 mt-3  ">
                        Registration Number 
                   
                    </div>
                    <div class="col-md-4 mt-3   col-sm-9">
                        <input type="text" maxlength="500" id="txt_regno" runat="server" tabindex="4" placeholder="..............................................." autocomplete="off" readonly="readonly" class="   all-border border-bottom-2 font-12 width-100">
                    </div>

                    <div class=" col-md-2 mt-3   ">
                        Full Name  
                   
                    </div>
                    <div class="col-md-4 mt-3   col-sm-9">
                        <input type="text" maxlength="500" id="txt_name" runat="server" tabindex="4" placeholder="..............................................." autocomplete="off" readonly="readonly" class="   all-border border-bottom-2 font-12 width-100">
                    </div>

                    <div class=" col-md-2 mt-3   ">
                        Father's Name   
                   
                    </div>
                    <div class="col-md-4 mt-3   col-sm-9">
                        <input type="text" maxlength="500" id="txt_fname" runat="server" tabindex="4" placeholder="..............................................." autocomplete="off" readonly="readonly" class="   all-border border-bottom-2 font-12 width-100">
                    </div>

                    <div class=" col-md-2 mt-3   ">
                        Gender 
                   
                    </div>
                    <div class="col-md-4 mt-3   col-sm-9">
                        <input type="text" maxlength="500" id="txt_gender" runat="server" tabindex="4" placeholder="..............................................." autocomplete="off" readonly="readonly" class="   all-border border-bottom-2 font-12 width-100">
                    </div>

                    <div class=" col-md-2 mt-3   ">
                        Contact Number 
                   
                    </div>
                    <div class="col-md-4 mt-3   col-sm-9">
                        <input type="text" maxlength="500" id="txt_contact" runat="server" tabindex="4" placeholder="..............................................." autocomplete="off" readonly="readonly" class="   all-border border-bottom-2 font-12 width-100">
                    </div>

                    <div class=" col-md-2 mt-3   ">
                        Email 
                   
                    </div>
                    <div class="col-md-4 mt-3   col-sm-9">
                        <input type="text" maxlength="500" id="txt_email" runat="server" tabindex="4" placeholder="..............................................." autocomplete="off" readonly="readonly" class="   all-border border-bottom-2 font-12 width-100">
                    </div>

                    <div class=" col-md-2 mt-3   ">
                        Address 
                   
                    </div>
                    <div class="col-md-4 mt-3   col-sm-9">
                        <input type="text" maxlength="500" id="txt_address" runat="server" tabindex="4" placeholder="..............................................." autocomplete="off" readonly="readonly" class="   all-border border-bottom-2 font-12 width-100">
                    </div>
                    <div class=" col-md-2 mt-3   ">
                        Date of Joining  
                   
                    </div>
                    <div class="col-md-4 mt-3   col-sm-9">
                        <input type="text" maxlength="500" id="txt_doj" runat="server" tabindex="4" placeholder="..............................................." autocomplete="off" readonly="readonly" class="   all-border border-bottom-2 font-12 width-100">
                    </div>
                    <div class=" col-md-2 mt-3  " id="div_design" runat="server">
                        Designation 
                   
                    </div>
                    <div class="col-md-4 mt-3   col-sm-9">
                        <input type="text" maxlength="500" id="txt_designation" runat="server" tabindex="4" placeholder="..............................................." autocomplete="off" readonly="readonly" class="   all-border border-bottom-2 font-12 width-100">
                    </div>
                    <div class=" col-md-2 mt-3   " id="div_dept" runat="server">
                        Department 
                   
                    </div>
                    <div class="col-md-4 mt-3   col-sm-9">
                        <input type="text" maxlength="500" id="txt_dept" runat="server" tabindex="4" placeholder="..............................................." autocomplete="off" readonly="readonly" class="   all-border border-bottom-2 font-12 width-100">
                    </div>
                </div>

                <%-- <div class="row">
                    <div class=" col-12 mt-3  text-center">
                        <input type="button" id="prof_save" value="Save" onclick="ProfSave();" class="btnthree">
                    </div>
                </div>--%>
            </div>
        </div>


    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_BottomScripts" runat="server">
    <script>


        //-------------------------------------------------------------Password Changes---------------------------------------------------------

        $(document).on('click', '#usr_save', function () {
            regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;


            if ($('#<%=txt_password.ClientID%>').val() == "") {
                MsgArray[MsgArray.length] = 'Please enter password.';
            }
            else if (regex.exec($('#<%=txt_password.ClientID%>').val()) == null) {
                $('#<%=txt_password.ClientID%>').focus();
                MsgArray[MsgArray.length] = 'Password should contain: <br> 1. At least 8 characters. <br>2. At least one lowercase character. <br>3. At least one uppercase character. <br>4.  At least one numeric value(0-9). <br>5. At least one special character(eg. @$!%*?&). <br>6. No spaces in between.';
            }
            if ($('#<%=txt_repassword.ClientID%>').val() == "") {
                MsgArray[MsgArray.length] = 'Please re-enter password.';

            } else if ($('#<%=txt_password.ClientID%>').val() != $('#<%=txt_repassword.ClientID%>').val()) {
                MsgArray[MsgArray.length] = 'Re-enter password does not match with password.';

            }

            if (MsgArray.length > 0) {
                MsgColor(true);
                MsgAlert();
                return false;
            }
            else {
                $.ajax({
                    type: "POST",
                    url: 'Profile.aspx/ChangePassword',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'User':'" + $('#<%=txt_ucode.ClientID%>').val() + "','Password':'" + $('#<%=txt_password.ClientID%>').val() + "' }",
                        async: false,
                        success: function (data) {
                            if (data.d == "1") {
                                $('#<%=txt_password.ClientID%>').val('');
                                $('#<%=txt_repassword.ClientID%>').val('')
                                MsgArray[MsgArray.length] = 'Record updated successfully.'
                                MsgColor(false);
                                MsgAlert();
                            } else {
                                MsgArray[MsgArray.length] = 'Error in saving password.'
                                MsgColor(true);
                                MsgAlert();
                            }
                        },
                        error: function () {
                        }
                    });
            }
        });


    </script>
</asp:Content>
