
//active-page
$(function () {
    var MenuObj = eval("(" + $('#hdn_Menus').val() + ")");
    console.log(MenuObj)
    var html = '';
    var dash = '<i class="fas fa-tachometer-alt"></i>';
    var other = '<i class="fas fa-rocket"></i>';
    var active = 'active-page';
    $.each(MenuObj.Table1, function (module, moduleVal) {
        var icon;
        var activeClass;
        var count = moduleVal.mnum_name.length;
        var max = 30;// Max chars inside the li
        var MenuName = '';
        if (count > max) {
            MenuName = moduleVal.mnum_name.slice(0, max) + '...';
            // Add here your button or whatever you like.
        }

        if (moduleVal.mnum_name == 'Dashboard') {
            var url = '';

            url = '/pages/user/dashboard.aspx';
            html += '<li class="nav-item dropdown"><a class="nav-link " data-toggle="tooltip" data-placement="top" title="' + moduleVal.mnum_name + '" href = "' + url + '" id="dashboardsDropdown" role = "button" aria-haspopup="true" aria-expanded="false" ><i class="' + moduleVal.mnum_image + '"></i>' + moduleVal.mnum_name + '</a><label class="d-none">Home</label></li>';
        }
        //else if (moduleVal.mnum_name == 'Reports') {
        //    html += '<li class="nav-item dropdown"><a class="nav-link " data-toggle="tooltip" data-placement="top" title="' + moduleVal.mnum_name + '" href = "' + moduleVal.mnum_redirectto + '" id="dashboardsDropdown" role = "button" aria-haspopup="true" aria-expanded="false" ><i class="' + moduleVal.mnum_image + '"></i>' + moduleVal.mnum_name + '</a><label class="d-none">Reports</label></li>';
        //}
        else {
            icon = other;

            var my_json = JSON.stringify(MenuObj.Table11);

            var Menu = find_in_object(JSON.parse(my_json), { mnum_parentid: moduleVal.mnum_kid });

            html += '<li class="nav-item dropdown" ><a class="nav-link dropdown-toggle "  data-toggle="tooltip" data-placement="top" title="' + moduleVal.mnum_name + '"  href = "#" id="dashboardsDropdown" role = "button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" ><i class="' + moduleVal.mnum_image + '"></i>' + moduleVal.mnum_name + '</a><ul class="dropdown-menu" aria-labelledby="dashboardsDropdown">';

            $.each(Menu, function (menu, menuVal) {
                //html += '<li><a class="dropdown-toggle sub-nav-link" href="#" id="TravelDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">' + menuVal.mnum_name + '</a><ul class="dropdown-menu dropdown-menu-right show" aria-labelledby="TravelDropdown">';

                //var Submenu = find_in_object(JSON.parse(my_json), { mnum_parentid: menuVal.mnum_kid });

                //$.each(Submenu, function (subMenu, subMenuVal) {
                html += '<li><a class="dropdown-item" href="' + menuVal.mnum_redirectto + '">' + menuVal.mnum_name + '</a><label class="d-none">' + menuVal.mnum_parent + '</label></li>';
                //});

                //html += '</ul>';
            });

            html += '</ul></li>';
        }
    });
    $('#Ul_menu').append(html);
    CreateTable($('#div_tbl'), eval("(" + $('#hdn_Menus').val() + ")"));

    UiAutoComplete($('#txt_search'), 'GetMenuBySearch', "'userRole':'" + $('#hdn_Type').val() + "'");

    $('#A_logOut').on('click', function () {
        window.location = "/Default.aspx";
    });
    $('#hdn_usrID').val(fn_getCookie('MedID'));

    $('.balpha').alphanumeric({ allow: '-_/' });
    $('.alphanumeric').alphanumeric({ allow: ' .-_&()@*/,' });
    $('.numeric').numeric({ allow: '.' });
    $('.int').numeric({});

    $('.decimal').on('input', function () {
        this.value = this.value.match(/^\d+\.?\d{0,2}/);
    });

    //----------------------------------------------------------------
    $('.decimalr').keypress(function (evt) {

        var maxlen = $('.decimalr').attr('maxlength');
        var len = $('.decimalr').val().length;
        var index = $('.decimalr').val().indexOf('.');
        var CharAfterdot = (len) - index;
        var CharBeforeDot = (len) + index;
        var unicode = evt.charCode ? evt.charCode : evt.keyCode;

        if ($('.decimalr').val().indexOf(".") != -1)

            if (unicode == 46)
                return false;
        if (unicode != 8) {

            if (unicode > 31 && (unicode < 48 || unicode > 57) && unicode != 46)
                return false;

            if (index > -1) {
                var CharAfterdot = (len) - index;
                if (CharAfterdot > 2) {
                    return false;
                }
            }

            if (index == -1 && CharAfterdot > (maxlen - 3) && CharBeforeDot > (maxlen - 5)) {
                if (unicode != 46) {

                    return false;
                }
            }
            if (($('.decimalr').val() == '0') && unicode != 46) {
                return false;
            }
        }
    });
    //----------------------------------------------------------------



    var urlCount = 0;
    $('.nav-item a').each(function (row, data) {
        //console.log($(this).prop('href'), $('#hdn_currenturl').val());
        if ($(this).prop('href') == $('#hdn_currenturl').val()) {
            $(this).closest('.nav-item').find('a:eq(0)').addClass('active-page');
            $('#div_title').text($(this).next().text());
            urlCount++;
        }
    });
    if (urlCount == 0) {
        //  window.location = "/Default.aspx";
    }
});

//$(document).on('change', '.ddl_country', function () {
//    $('.ddl_state option').remove();
//    $('.ddl_state').append('<option value=0>---Select---</option>');
//    if ($(this).val() != "0") {
//        var State = jqPost("/Classes/Services.asmx/GetStateByCountryID", "{'id':'" + $(this).val() + "'}");
//        if (State != null) {
//            $.each(State[1], function (SRow, SVal) {
//                $('.ddl_state').append('<option value="' + SVal.state_kid + '">' + SVal.state_name + '</option>');
//            });
//        }
//    }
//});
//$(document).on('change', '.ddl_state', function () {

//    $('.ddl_city option').remove();
//    $('.ddl_city').append('<option value=0>---Select---</option>');
//    if ($(this).val() != "0") {
//        var State = jqPost("/Classes/Services.asmx/GetCityByStateID", "{'id':'" + $(this).val() + "'}");
//        console.log(State[1]);
//        if (State != null) {
//            $.each(State[1], function (SRow, SVal) {
//                $('.ddl_city').append('<option value="' + SVal.City_kid + '">' + SVal.City_name + '</option>');
//            });
//        }
//    }
//    $(this).next().val($(this).val());
//});

//$(document).on('change', '.txt_pincode', function () {
//    $('.ddl_Area option').remove();
//    $('.ddl_Area').append('<option value=0>---Select---</option>');
//    if ($(this).val() != "0") {
//        var pincode = jqPost("/Classes/Services.asmx/GetStateCityAreaByPincode", "{'id':'" + $(this).val() + "'}");
//        if (pincode != null && pincode[1].length > 0) {
//            $('.ddl_state').val(pincode[1][0].State_kid);
//            $('.ddl_state').change();
//          //  $('.ddl_city').val(pincode[1][0].City_kid);
//            $.each(pincode[1], function (SRow, SVal) {
//                $('.ddl_Area').append('<option value="' + SVal.Area_kid + '">' + SVal.Area_name + '</option>');
//            });
//        }
//    }
//    $(this).next().val($(this).val());
//});

//$(document).on('change', '.ddl_Area', function () {
//    $(this).next().val($(this).val());
//});

//$(document).on('change', '.ddl_city', function () {
//    $('.txt_pincode').val('');
//    $('.ddl_Area option').remove();
//    $('.ddl_Area').append('<option value=0>---Select---</option>');
//    if ($(this).val() != "0") {
//        var State = jqPost("/Classes/Services.asmx/GetAreaByCityID", "{'id':'" + $(this).val() + "'}");
//        if (State != null) {
//            $.each(State[1], function (SRow, SVal) {
//                $('.ddl_Area').append('<option value="' + SVal.Area_kid + '">' + SVal.Area_name + '</option>');
//            });
//        }
//    }
//    $(this).next().val($(this).val());
//});


function Gender(e) {
    $('.btn-gender').removeClass('active');
    $(e).addClass('active');
}
$(document).on('change', '.ddl_title', function () {
    var id = $(this).val();
    var data = eval("(" + $(this).next().val() + ")");
    $.each(data.Table1, function (row, value) {
        if (id == parseInt(value.Title_kid)) {
            $('.ddl_Gender').val(value.Title_genderID);
        }
    });
});

function maxDate(year) {
    var date = new Date();
    var dd = date.getDate();
    var mm = date.getMonth() + 1;
    var yyyy = date.getFullYear() - parseInt(year);
    if (dd < 10) {
        dd = '0' + dd
    }
    if (mm < 10) {
        mm = '0' + mm
    }
    date = yyyy + '-' + mm + '-' + dd;
    // date = dd + '-' + mm + '-' + yyyy;

    return date;
}
//--------------------------------Multi Select -------------
function imageupload() {

    $('.img').bind('change', function () {
        alert(this.files[0].size);
    });

}

function BindDashCount(DCount) {
    //   console.log(DCount);
    var Html = '';
    $.each(DCount, function (Name, Val) {
        var Dobj = jqPost("/Classes/Services.asmx/GetDashCountData", '{"usrid":"' + fn_getCookie('MedID') + '","Procedure":"' + Val.DashCount_Procedure + '"}');
        Html += '<div class="item" ><div class="mini-widget ' + Val.DashCount_Color + '"><div class="mini-widget-header"><div><b>' + Val.DashCount_Name + '</b></div></div><div class="mini-widget-body"><i class="' + Val.DashCount_iCon + '"></i><div class="number" id="div_totcons"><p>' + Dobj.Table1[0].CountNo + '</p></div></div></div></div>';
    });
    $('.dashCountBox').html(Html);

    $('.owl-carousel').owlCarousel({
        loop: true,
        margin: 10,
        nav: false,
        dots: true,
        autoplay: true,
        autoplayHoverPause: true,
        responsive: {
            0: {
                items: 2
            },
            600: {
                items: 2
            },
            1000: {
                items: 4
            }
        }
    });

}
