<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LibMan._Default" EnableEventValidation="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>LibMan</title>
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta charset="utf-8">
    <%: Styles.Render("~/bundles/DefCss") %>
</head>
<body class="login-page">
    <form id="form1" runat="server">
        <input type="hidden" runat="server" id="hdn_otp" value="" />
        <input type="hidden" runat="server" id="hdn_userkid" value="" />
        <input type="hidden" runat="server" id="hdn_usercode" value="" />
        <input type="hidden" runat="server" id="hdn_userpasswd" value="" />
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="login-background">
                            <div class="row">
                                <div class="col-lg-12">
                                    <img src="Image/logo150.png" class="logo-img">
                                </div>
                                <div class="col-sm-6 text-center">
                                    <img src="Image/ambulance-login.png" class="img-responsive">
                                </div>
                                <div class="offset-lg-1 col-lg-4 col-sm-6">
                                    <h1 class="blue-text mb-2">
                                        <img src="Image/login-icon.png" class="login-icon"><b>Login</b></h1>
                                    <p class="blue-text opacity-5 font-12">
                                        Login to <b>Lib-Man</b> .
                                        <br />
                                        Kindly enter your <b>Login Details</b> below to proceed.
                                    </p>

                                    <div class="input-background gree-back">
                                        <div class="row">
                                            <div class="col-md-2 col-sm-3 col-2">
                                                <i class="fas fa-user transform-center opacity-5"></i>
                                            </div>
                                            <div class="col-md-10 col-sm-9  col-10 pl-0">
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <label class="font-12 opacity-5">Username</label>
                                                    </div>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox runat="server" CssClass="form-control font-12  p-0 login-input" placeholder="Example" ID="txtUserName" name="username"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="input-background gree-back">
                                        <div class="row">
                                            <div class="col-md-2 col-sm-3 col-2">
                                                <i class="fas fa-unlock-alt transform-center opacity-5"></i>
                                            </div>
                                            <div class="col-md-10 col-sm-9 col-10 pl-0">
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <label class="font-12 opacity-5">Password</label>
                                                    </div>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox runat="server" TextMode="Password" class="form-control font-12  p-0 login-input" MaxLength="50" placeholder="Password" ID="txtUserPass" name="username"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-md-6 font-12 mt-2">
                                            <input runat="server" id="chk_remem" type="checkbox" class="ml-2 mr-2 float-left">
                                            <div class="remember opacity-5">Remember Me</div>
                                        </div>
                                        <div class="col-md-6  text-right">
                                            <a href="#" class="pr-2 font-12 opacity-5 bleck-text" data-toggle="modal" data-backdrop="static" data-target="#forget-password">Forget Password?</a>
                                        </div>
                                    </div>
                                    <div class="mt-4 buttons tra-30">
                                        <nav>
                                            <ul>
                                                <li><span>
                                                    <asp:Button runat="server" ID="btn_login" Text="Login Now" CssClass="btn" OnClick="btn_login_Click" OnClientClick="return LogIn(); " /></span></li>
                                            </ul>
                                        </nav>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal" id="forget-password">
                        <div class="modal-dialog5  modal-dialog-centered">
                            <div class="modal-content">
                                <div class="col-lg-12">
                                    <div class="modal-header">
                                        <h4 class="modal-title text-center blue-text">Forget Password</h4>
                                        <button type="button" class="close" id="btn_close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="Forget_usrcode">
                                            <input type="text" id="txt_Usr" autocomplete="off" placeholder="Username" class="font-12 input-background gree-back" />
                                            <input type="password" id="txt_otp" maxlength="4" autocomplete="off" placeholder="Enter OTP" class="d-none int font-12 input-background gree-back" />
                                            <div class="hour d-none">
                                                <img src="/Image/hourglass.gif" />
                                                <span id="timer"></span>
                                            </div>
                                            <div class="modal-footer request">
                                                <div class="buttons">
                                                    <nav>
                                                        <ul>
                                                            <li class="mr-3 getotp "><span>
                                                                <input type="button" id="btn_otp" value="Get OTP" class="btn">
                                                            </span></li>
                                                            <li class="mr-3 submitotp d-none"><span>
                                                                <input type="button" id="btn_otpSubmit" value="Submit" class="btn">
                                                            </span></li>

                                                        </ul>
                                                    </nav>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="resetpass d-none">
                                            <input type="password" id="txt_newpass" maxlength="24" autocomplete="off" placeholder="Enter New Password" maxlength="50" class="font-12 input-background gree-back" />
                                            <input type="password" id="txt_renewpass" maxlength="24" autocomplete="off" placeholder="Re-type New Password" maxlength="50" class="font-12 input-background gree-back" />
                                            <div class="modal-footer">
                                                <div class="buttons">
                                                    <nav>
                                                        <ul>
                                                            <li><span>

                                                                <input type="button" id="btn_reset" value="Reset Password" class="btn">
                                                            </span></li>
                                                        </ul>
                                                    </nav>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal" id="userAgreement">
                        <div class="modal-dialog11  modal-dialog-centered">
                            <div class="modal-content">
                                <div class="col-lg-12">
                                    <div class="modal-header">
                                        <h4 class="modal-title text-center blue-text">User Agreement</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div id="div_agreement"></div>
                                        <div id="div_privacy"></div>
                                        <div id="div_terms"></div>
                                    </div>
                                    <div class="modal-footer">
                                        <div class="modal-footer request">
                                            <div class="buttons">
                                                <nav>
                                                    <ul>
                                                        <li class="mr-3"><span>
                                                            <asp:Button runat="server" ID="btn_agrement" Text="I Agree" CssClass="btn" OnClick="btn_agrement_Click"  OnClientClick="return closePopup();" />
                                                        </span></li>
                                                    </ul>
                                                </nav>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>


            </div>
        </section>
        <span class="d-none" id="agreepopup" data-toggle="modal" data-backdrop="static" data-target="#userAgreement"></span>
        <span class="d-none" id="agreepopup_close" data-dismiss="modal"></span>
        <div class="MsgPopUp">
        </div>


        <%: Scripts.Render("~/bundles/modernizr") %>

        <script>
            $(function () {
                var time;
                $('.int').numeric({});
                $('.Forget_mob').hide();
                $('.Forget_email').hide();
                $('.Forget_Pass').hide();
                $('.Forget_next').hide();

            });

            function LogIn() {
                if ($('#txtUserName').val() != "") {
                    if ($('#txtUserPass').val() == "")
                        MsgArray[MsgArray.length] = Msg["UsrPass"];
                }
                else {
                    MsgArray[MsgArray.length] = Msg["UsrCode"];
                    if ($('#txtUserPass').val() == "")
                        MsgArray[MsgArray.length] = Msg["UsrPass"];
                }

                if (MsgArray.length > 0) {
                    MsgColor(true);
                    MsgAlert();
                    return false;
                }
                else
                    return true;
            }

            function CorrectPass() {
                MsgArray[MsgArray.length] = Msg["PassMatch"];
                MsgColor(true);
                MsgAlert();
            }
            function CorrectUser() {
                MsgArray[MsgArray.length] = 'Please enter correct user code';
                MsgColor(true);
                MsgAlert();
            }
            function InValidUser() { }

            $(document).on('click', '#btn_otp', function () {
                if ($('#txt_Usr').val() == "") {
                    MsgArray[MsgArray.length] = 'Please enter user code.';
                }

                if (MsgArray.length > 0) {
                    MsgColor(true);
                    MsgAlert();
                    return false;
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: 'Default.aspx/GetOTP',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: "{'username':'" + $('#txt_Usr').val() + "'}",
                        async: false,
                        success: function (data) {
                            var otp = data.d;
                            if (otp == "0") {
                                MsgArray[MsgArray.length] = 'user not exist.'
                                MsgColor(true);
                                MsgAlert();
                            }
                            else {
                                $('#<%=hdn_otp.ClientID%>').val(otp);
                                $('.hour').removeClass('d-none');
                                time = setTimeout(timeOut, 300000);
                                document.getElementById('timer').innerHTML = 05 + ":" + 00;
                                startTimer();
                                $('#txt_Usr').attr('disabled', 'disabled');
                                $('#txt_otp').removeClass('d-none');
                                $('.getotp').addClass('d-none');
                                $('.submitotp').removeClass('d-none');
                                MsgArray[MsgArray.length] = 'OTP sent successfully.'
                                MsgColor(false);
                                MsgAlert();
                            }
                        },
                        error: function () {
                            MsgArray[MsgArray.length] = 'Error in getting OTP.'
                            MsgColor(true);
                            MsgAlert();
                        }
                    });
                }
            });

            $(document).on('click', '#btn_otpSubmit', function () {
                if ($('#txt_otp').val() == "") {
                    MsgArray[MsgArray.length] = 'Please enter OTP.';
                }

                if (MsgArray.length > 0) {
                    MsgColor(true);
                    MsgAlert();
                    return false;
                }
                else {
                    clearTimeout(time);
                    $.ajax({
                        type: "POST",
                        url: 'Default.aspx/VerifyOTP',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: "{'OTP':'" + $('#txt_otp').val() + "','hdn':'" + $('#<%=hdn_otp.ClientID%>').val() + "'}",
                        async: false,
                        success: function (data) {
                            var otp = data.d;
                            if (otp == "0") {
                                MsgArray[MsgArray.length] = 'OTP does not match.'
                                MsgColor(true);
                                MsgAlert();
                            }
                            else {
                                $('#<%=hdn_otp.ClientID%>').val(otp);
                                $('.Forget_usrcode').addClass('d-none');
                                $('.resetpass').removeClass('d-none');
                            }
                        },
                        error: function () {
                        }
                    });


                }


            });


            $(document).on('click', '#btn_reset', function () {
                regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
                if ($('#txt_newpass').val() == "") {
                    MsgArray[MsgArray.length] = 'Please enter new password.';
                }
                else if (regex.exec($('#txt_newpass').val()) == null) {
                    $('#txt_newpass').focus();
                    MsgArray[MsgArray.length] = 'Password should contain: <br> 1. At least 8 characters. <br>2. At least one lowercase character. <br>3. At least one uppercase character. <br>4.  At least one numeric value(0-9). <br>5. At least one special character(eg. @$!%*?&). <br>6. No spaces in between.';
                }
                else if ($('#txt_renewpass').val() == "") {
                    MsgArray[MsgArray.length] = 'Please re-enter password.';

                } else if ($('#txt_renewpass').val() != $('#txt_newpass').val()) {
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
                        url: 'Default.aspx/ResetPassword',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: "{'User':'" + $('#txt_Usr').val() + "','Password':'" + $('#txt_newpass').val() + "'}",
                        async: false,
                        success: function (data) {
                            if (data.d == "1") {
                                MsgArray[MsgArray.length] = 'Password saved successfully.'
                                MsgColor(false);
                                MsgAlert();
                            } else {
                                MsgArray[MsgArray.length] = 'Error in saving password.'
                                MsgColor(true);
                                MsgAlert();
                            }
                            $('#btn_close').click();
                        },
                        error: function () {
                        }
                    });
                }
            });

            $(document).on('click', '#btn_close', function () {
                $('#<%=hdn_otp.ClientID%>').val('');
                $('#txt_Usr').removeAttr('disabled');
                $('#txt_otp').addClass('d-none');
                $('.getotp').removeClass('d-none');
                $('.submitotp').addClass('d-none');
                $('.Forget_usrcode').removeClass('d-none');
                $('.resetpass').addClass('d-none');
                $('.hour').addClass('d-none');
                $('#txt_Usr').val('');
                $('#txt_otp').val('');
                $('#txt_newpass').val('');
                $('#txt_renewpass').val('');
                document.getElementById('timer').innerHTML = "";
            });



            function timeOut() {
                $('#<%=hdn_otp.ClientID%>').val('');
                $('#txt_Usr').removeAttr('disabled');
                $('#txt_otp').addClass('d-none');
                $('#txt_otp').val('');
                $('.hour').addClass('d-none');
                $('.getotp').removeClass('d-none');
                $('.submitotp').addClass('d-none');
                document.getElementById('timer').innerHTML = "";
                MsgArray[MsgArray.length] = 'OTP expired try again.'
                MsgColor(true);
                MsgAlert();
            }


            function startTimer() {
                var presentTime = document.getElementById('timer').innerHTML;
                var timeArray = presentTime.split(/[:]+/);
                var m = timeArray[0];
                var s = checkSecond((timeArray[1] - 1));
                if (s == 59) { m = m - 1 }
                if (m >= 0) {
                    if (m == 0 && s < 30) {
                        $('#timer').attr('style', 'color:red');
                    }

                    document.getElementById('timer').innerHTML = m + ":" + s;
                    setTimeout(startTimer, 1000);
                }

            }
            function checkSecond(sec) {
                if (sec < 10 && sec >= 0) { sec = "0" + sec };
                if (sec < 0) { sec = "59" };
                return sec;
            }

            function Agreementshow(type) {
                var agreement = jqPost("/Classes/Services.asmx/GetAgreementByUserType", "{'type':'" + type + "'}");
                if (agreement != null && agreement.Table1.length > 0) {
                    $('#div_agreement').html(agreement.Table1[0].agreement);
                    $('#div_privacy').html(agreement.Table1[0].privacy);
                    $('#div_terms').html(agreement.Table1[0].terms);
                }
                $('#agreepopup').click();

            }


            function closePopup() {
                var ret = jqPost("/Classes/Services.asmx/saveAgreementByID", "{'user':'" + $('#<%=hdn_userkid.ClientID%>').val() + "'}");
                if (ret.Table1[0].val == '2') {
                    $('#agreepopup_close').click();
                    return true;
                }
                else {
                    MsgArray[MsgArray.length] = 'Some error occured.'
                    MsgColor(true);
                    MsgAlert();
                    return false;
                }
            }
        </script>
    </form>
</body>
</html>

