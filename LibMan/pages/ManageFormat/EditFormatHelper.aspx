<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Admin/Dashboard/Empty.Master" AutoEventWireup="true" ValidateRequest="false" CodeBehind="EditFormatHelper.aspx.cs" Inherits="pages.ManageFormats.EditFormatHelper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="updatePanel1" runat="server" UpdateMode="Always" IsInPartialRendering="true">
        <ContentTemplate>
            <div class="row mt-2">
                <div class="col-md-2 col-sm-3 mt-2">
                    <label class="input-label-modal">Header Linking</label>

                </div>
                <div class="col-md-2  col-sm-3 mt-2">
                    <asp:DropDownList ID="ddl_header" runat="server" TabIndex="1" CssClass=" form-control  all-border border-bottom-2 font-12">
                    </asp:DropDownList>
                </div>
                <div class="col-md-2 col-sm-3 mt-2">
                    <label class="input-label-modal">Footer Linking</label>
                </div>
                <div class="col-md-2  col-sm-3 mt-2">
                    <asp:DropDownList ID="ddl_footer" runat="server" TabIndex="2" CssClass=" form-control  all-border border-bottom-2 font-12">
                    </asp:DropDownList>
                </div>
                <div class="col-md-2 col-sm-3 mt-2">
                    <label class="input-label-modal">Page Orientation</label>

                </div>
                <div class="col-md-2  col-sm-3 mt-2">
                    <asp:DropDownList ID="ddl_str_PageOrintion" runat="server" TabIndex="3" CssClass=" form-control  all-border border-bottom-2 font-12">
                        <asp:ListItem Value="P">Portrait</asp:ListItem>
                        <asp:ListItem Value="L">Landscape</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-2 col-sm-3 mt-2">
                    <label class="input-label-modal">Page type</label>
                </div>
                <div class="col-md-2  col-sm-3 mt-2">
                    <asp:DropDownList ID="ddl_str_PageType" runat="server" TabIndex="4" CssClass=" form-control  all-border border-bottom-2 font-12">
                    </asp:DropDownList>
                </div>
                <div class="col-md-2 col-sm-3 mt-2">
                    <label class="input-label-modal">Oth. Page Header Link</label>

                </div>
                <div class="col-md-2  col-sm-3 mt-2">
                    <asp:DropDownList ID="ddl_OPH" runat="server" TabIndex="5" CssClass=" form-control  all-border border-bottom-2 font-12">
                    </asp:DropDownList>
                </div>

                <div class="col-md-2 col-sm-3 mt-2">

                    <label class="input-label-modal">Last Page Footer Link</label>
                </div>
                <div class="col-md-2  col-sm-3 mt-2">
                    <asp:DropDownList ID="ddl_LPF" runat="server" TabIndex="6" CssClass=" form-control  all-border border-bottom-2 font-12">
                    </asp:DropDownList>
                </div>

                <div class="col-md-2 col-sm-3 mt-2">

                    <label class="input-label-modal">Plugin Editable</label>
                </div>
                <div class="col-md-2  col-sm-3 mt-2">
                    <input type="radio" id="rdbtn_Editable" name="edit" tabindex="7" />
                    <label class="input-label-modal">Non-Editable</label>
                    <input type="radio" id="rdbtn_NonEditable" tabindex="8" checked="checked" name="edit" />
                    <label class="input-label-modal">Editable</label>
                </div>

                <div class="col-md-2 col-sm-3 mt-2">
                    <label class="input-label-modal">Margin</label>

                </div>
                <div class="col-md-2  col-sm-3 mt-2">
                    <div class="row">
                        <div class="col-md-2  col-sm-6">
                            <label class="input-label-modal">Left</label>
                        </div>
                        <div class="col-md-4  col-sm-6">
                            <asp:DropDownList ID="ddl_leftmargin" runat="server" TabIndex="9" CssClass=" form-control  all-border border-bottom-2 font-12">
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-2  col-sm-6">
                            <label class="input-label-modal">Right</label>
                        </div>
                        <div class="col-md-4  col-sm-6">
                            <asp:DropDownList ID="ddl_rightmargin" runat="server" TabIndex="10" CssClass=" form-control  all-border border-bottom-2 font-12">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 col-sm-3 mt-2">
                    <label class="input-label-modal">Header Body Margin</label>
                </div>
                <div class="col-md-2  col-sm-3 mt-2">
                    <asp:DropDownList ID="ddl_HBodymargin" runat="server" TabIndex="11" CssClass=" form-control  all-border border-bottom-2 font-12">
                    </asp:DropDownList>
                </div>
                <div class="col-md-2 col-sm-3 mt-2">
                    <label class="input-label-modal">Body Footer Margin</label>
                </div>
                <div class="col-md-2  col-sm-3 mt-2">
                    <asp:DropDownList ID="ddl_BFootermargin" runat="server" TabIndex="12" CssClass=" form-control  all-border border-bottom-2 font-12">
                    </asp:DropDownList>
                </div>
                <div class="col-md-2 col-sm-3 mt-2">
                    <label class="input-label-modal">Show Page No</label>
                </div>
                <div class="col-md-2  col-sm-3 mt-2">
                    <label class="switch">
                        <input id="chk_Pagenoshow" type="checkbox" tabindex="13" runat="server" class="switchBox switchBox switch-small form-checkbox" data_on="success" data_off="danger" checked="checked" />

                        <span class="slider round"></span>
                    </label>

                </div>

                <div class="col-md-2 col-sm-3 mt-2">

                    <label class="input-label-modal">Page No Font Color</label>
                </div>
                <div class="col-md-2  col-sm-3 mt-2">
                    <asp:DropDownList ID="ddl_pagenocolor" runat="server" TabIndex="14" CssClass=" form-control  all-border border-bottom-2 font-12">
                    </asp:DropDownList>
                </div>

            </div>

            <div class="row mt-2">
                <div class="col-md-5 col-lg-5 col-sm-12 mb-2">
                    <section class="table-background editor-table">
                        <div class="table-responsive">
                            <table class="table table-striped myTable" id="tbl_AddOns">
                                <thead class="thead-background">
                                    <tr>
                                        <th class="table-bolder">#</th>
                                        <th class="table-bolder">Column Name</th>
                                        <th class="table-bolder">Table</th>
                                        <th class="table-bolder">Action</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </section>
                </div>
                <div class="col-md-7 col-lg-7 col-sm-12 editor-auto" id="div_Editor">
                    <asp:TextBox ID="txt_FormatEditor" runat="server" TabIndex="16" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-4">
                <div class="form-group mb-0 text-center ml-0 mx-auto">
                    <asp:Button ID="btn_Save" runat="server" Text="Save" TabIndex="17" ValidationGroup="Save" OnClick="btn_Save_Click"
                        CssClass="btn  btntwo" />
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-12">
                    <div id="myDiv" style="position: absolute; left: 50; top: 50; visibility: hidden">
                    </div>
                    <div id="myDiv_L" style="position: absolute; left: 50; top: 50; visibility: hidden">
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btn_save" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder_BottomScripts" runat="server">
    <script src="/Scripts/tiny_mce/tiny_mce.js"></script>
    <script type="text/javascript">
        function fn_getEleobj(id, context) {
            var el = $("#" + id, context);
            if (el.length < 1)
                el = $("[id$=_" + id + "]", context);
            return el;
        }

        tinymce.create('tinymce.plugins.LineSpacePlugin', {
            createControl: function (n, cm) {
                switch (n) {
                    case 'listbox':
                        var mlb = cm.createListBox('listbox', {
                            title: 'Line Space',
                            onselect: function (v) {
                                mlb.focus();
                                var sel = tinymce.activeEditor.selection;
                                var node = tinymce.activeEditor.selection.getNode();
                                if (node.nodeName == 'BODY') {
                                    if (v == "") {
                                        var val = '<p>';
                                        var valUL = '<ul>';
                                        var valLI = '<li>';
                                        var Content = tinyMCE.activeEditor.selection.getContent({ format: 'html' }).replace(/<p(\s*\w*\s*style(\W*line)).*?>/g, val);
                                        Content = Content.replace(/<ul(\s*\w*\s*style(\W*line)).*?>/g, valUL);
                                        Content = Content.replace(/<li(\s*\w*\s*style(\W*line)).*?>/g, valLI);
                                        tinyMCE.execCommand('insertHTML', 0, Content);
                                        var content_all = tinyMCE.activeEditor.getContent();
                                        tinyMCE.activeEditor.setContent(content_all);
                                    }
                                    else {
                                        var val = '<p style="line-height:' + v + 'pt;">';
                                        var valUL = '<ul style="line-height:' + v + 'pt;">';
                                        var valLI = '<li style="line-height:' + v + 'pt;">';
                                        var Content = tinyMCE.activeEditor.selection.getContent({ format: 'html' }).replace(/<p>/g, val);
                                        Content = Content.replace(/<p(\s*\w*\s*style(\W*line)).*?>/g, val);
                                        Content = Content.replace(/<ul>/g, valUL);
                                        Content = Content.replace(/<ul(\s*\w*\s*style(\W*line)).*?>/g, valUL);
                                        Content = Content.replace(/<li>/g, valLI);
                                        Content = Content.replace(/<li(\s*\w*\s*style(\W*line)).*?>/g, valLI);
                                        tinyMCE.execCommand('insertHTML', false, Content);
                                        var content_all = tinyMCE.activeEditor.getContent();
                                        tinyMCE.activeEditor.setContent(content_all);
                                    }
                                }
                                else if (node.nodeName == "SPAN") {
                                    if (v == "") {
                                        if ($(node).parents('LI'))
                                            $(node).parent().css("line-height", "");
                                        else
                                            $(node).closest('p').css("line-height", "");
                                    }
                                    else {
                                        if ($(node).parents('LI'))
                                            $(node).parent().css("line-height", "" + v + "pt");
                                        else
                                            $(node).closest('p').css("line-height", "" + v + "pt");
                                    }
                                }
                                else if (v == "") {
                                    $(node).css("line-height", "");
                                }
                                else {
                                    $(node).css("line-height", "" + v + "pt");
                                }
                            }
                        });

                        mlb.add('1 pt', '1');
                        mlb.add('2 pt', '2');
                        mlb.add('3 pt', '3');
                        mlb.add('4 pt', '4');
                        mlb.add('5 pt', '5');
                        mlb.add('6 pt', '6');
                        mlb.add('7 pt', '7');
                        mlb.add('8 pt', '8');
                        mlb.add('9 pt', '9');
                        mlb.add('10 pt', '10');
                        mlb.add('11 pt', '11');
                        mlb.add('12 pt', '12');
                        mlb.add('13 pt', '13');
                        mlb.add('14 pt', '14');
                        mlb.add('15 pt', '15');
                        mlb.add('16 pt', '16');
                        mlb.add('17 pt', '17');
                        mlb.add('18 pt', '18');
                        mlb.add('19 pt', '19');
                        mlb.add('20 pt', '20');
                        mlb.add('21 pt', '21');
                        mlb.add('22 pt', '22');
                        mlb.add('23 pt', '23');
                        mlb.add('24 pt', '24');
                        mlb.add('25 pt', '25');
                        return mlb;
                }

                return null;
            }
        });


        tinymce.PluginManager.add('linespace', tinymce.plugins.LineSpacePlugin);


        function TinyMCE() {
            var myLine = '____________________________________________________________________________________';
            var myLine_L = '_________________________________________________________________________________________________________________________';
            tinyMCE.init({
                mode: "textareas",
                theme: "advanced",
                height: '310',
                plugins: "legacyoutput",
                relative_urls: false,
                remove_script_host: false,
                file_browser_callback: 'openFileBrowser',
                plugins: "autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,spellchecker,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount,advlist,autosave,autocomplete,pramukhime,-linespace",
                setup: function (ed) {
                    //ed.addButton('formatTester',
                    //    {
                    //        title: 'Check my Format',
                    //        image: '/Image/pdf.png',
                    //        onclick: function () {
                    //            openTester();
                    //        }
                    //    });

                    ed.addButton('UpperCase',
                        {
                            title: 'Upper Case',
                            image: '/Image/UpperCase.png',
                            onclick: function () {
                                ed.selection.setContent(ed.selection.getContent().replace(/&nbsp;/g, ' ').toUpperCase());
                            }
                        });

                    ed.addButton('LowerCase',
                        {
                            title: 'Lower Case',
                            image: '/Image/LowerCase.png',
                            onclick: function () {
                                ed.selection.setContent(ed.selection.getContent().replace(/&nbsp;/g, ' ').toLowerCase());
                            }
                        });

                    ed.onKeyDown.add(function (ed, e) {

                        if (e.keyCode == "45") {
                            parent.getWord();
                            var temptext = ed.selection.getContent().trim();
                            var $html = $('<div>', { html: temptext }).hide().appendTo('body');

                            $html.find('.verse').each(function (i, e) {
                                var verse = $(e).find('span.trans').remove().end().text();
                            });
                            $html.remove();
                            $.ajax({
                                type: 'Post',
                                url: 'LowerCase.pngGS_GetMacroText',
                                contentType: "application/json; charset=utf-8",
                                data: "{'str_test': '" + $html.text().trim() + "'}",
                                dataType: "json",
                                success: function (val) {
                                    var obj = eval("(" + val.d + ")");
                                    ed.selection.setContent(obj.Table1[0].macro_value);
                                },
                                error: function () { }
                            });
                        }

                        if (e.keyCode == "32") {
                            ed.execCommand('mceSpellCheck', true);
                        }
                    });

                    ed.addButton('drawline',
                        {
                            title: 'draw hr',
                            image: '/Image/line.png',
                            onclick: function () {
                                ed.focus();
                                if ($('#<%=ddl_str_PageOrintion.ClientID %>').val() == 'P')
                                    ed.selection.setContent(myLine);
                                else
                                    ed.selection.setContent(myLine_L);
                                ed.windowManager.alert('Hello world!! Selection: ' + ed.selection.getContent({ format: 'text' }));
                            }
                        });
                },
                theme_advanced_buttons1: ",bold,italic,underline,|,justifyleft,justifycenter,justifyright,justifyfull,cut,copy,|,bullist,numlist,visualaid,|,sub,sup,|,iespell,|,ltr,rtl,fontselect,fontsizeselect,outdent,indent|,link,unlink,pagebreak,",
                theme_advanced_buttons2: 'image,help,code,forecolor,backcolor,|,spellchecker,formatTester,UpperCase,LowerCase,drawline,pramukhime,pramukhimeclick,pramukhimeconvert,pramukhimehelp,listbox',
                theme_advanced_toolbar_location: "top",
                theme_advanced_toolbar_align: "left",
                theme_advanced_statusbar_location: "bottom",
                template_external_list_url: "lists/template_list.js",
                external_link_list_url: "lists/link_list.js",
                external_image_list_url: "lists/image_list.js",
                media_external_list_url: "lists/media_list.js",

                style_formats: [
                    { title: 'Bold text', inline: 'b' },
                    { title: 'Red text', inline: 'span', styles: { color: '#ff0000' } },
                    { title: 'Red header', block: 'h1', styles: { color: '#ff0000' } },
                    { title: 'Example 1', inline: 'span', classes: 'example1' },
                    { title: 'Example 2', inline: 'span', classes: 'example2' },
                    { title: 'Table styles' },
                    { title: 'Table row 1', selector: 'tr', classes: 'tablerow1' }
                ],
                autocomplete_options_url: "/Classes/ManageFormatHandler.ashx",
                autocomplete_options: "john,jane,william",
                autocomplete_min_length: 1,

                template_replace_values: {
                    username: "Some User",
                    staffid: "991234"
                }
            });
            }

            var fileWindow;

            function openFileBrowser(field_name, url, type, win) {

                fileWindow = win;
                if (navigator.appName == "Microsoft Internet Explorer") {
                    window.open("tinymce/jscripts/tiny_mce/plugins/advimage/MyFileManager.aspx", null, "height=400,width=600,status=yes,scrollbars=yes,toolbar=no,menubar=no,location=no");
                }
                else {
                    window.open("MyFileManager.aspx", null, "height=400,width=600,status=yes,scrollbars=yes,toolbar=no,menubar=no,location=no");
                }
            }

            function returnToOpener(imgUrl) {
                fileWindow.document.getElementById('src').value = imgUrl;
                fileWindow.ImageDialog.showPreviewImage(imgUrl);
            }

            $(function () {
                TinyMCE();
                $('[tabindex=1]').focus();

                setTimeout(function () {
                    GetTemplateData(getParameterByName('FormatID'));
                }, 2000);

                $('#<%=ddl_str_PageType.ClientID %>').change(function () {
                    pageType_Size();
                    pageType_Size_Landscape();
                });

                $('#<%=ddl_str_PageOrintion.ClientID %>').change(function () {
                    //pageType_Size();
                    //pageType_Size_Landscape();
                });
                $(':radio').change(function () {
                    var jFrame = $('iframe');
                    var objDoc = jFrame[0].contentWindow.document;
                    if ($(this).attr('id') == 'rdbtn_Editable') {
                        var cusid_ele = objDoc.getElementsByClassName('GS_Value');
                        for (var i = 0; i < cusid_ele.length; ++i) {
                            var item = cusid_ele[i];
                            item.className = 'GS_Value';
                            item.removeAttribute("data-mce-contenteditable");
                        }
                    }
                    else if ($(this).attr('id') == 'rdbtn_NonEditable') {
                        var cusid_ele = objDoc.getElementsByClassName('GS_Value');
                        for (var i = 0; i < cusid_ele.length; ++i) {
                            var item = cusid_ele[i];
                            item.className = 'GS_Value mceNonEditable';
                            item.setAttribute("data-mce-contenteditable", "false");
                        }
                    }
                });
            });


            function GetTemplateData(myVal) {
                $.ajax({
                    type: "POST",
                    url: "/Classes/Services.asmx/GetEditorTemplate",
                    data: "{'ID': '" + myVal + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (retVal) {
                        var obj = eval("(" + retVal.d + ")");
                        GetAddOns(myVal, obj.Table1[0].Format_spname);
                        setDropDownData($('#<%=ddl_str_PageType.ClientID %>').attr('id'), obj.Table1[0].FormatTemplate_PageType);
                    setDropDownData($('#<%=ddl_str_PageOrintion.ClientID %>').attr('id'), obj.Table1[0].FormatTemplate_PageOrientation);

                    setDropDownData($('#<%=ddl_leftmargin.ClientID %>').attr('id'), obj.Table1[0].FormatTemplate_PageLeftMargin);
                    setDropDownData($('#<%=ddl_rightmargin.ClientID %>').attr('id'), obj.Table1[0].FormatTemplate_PageRightMargin);

                    setDropDownData($('#<%=ddl_pagenocolor.ClientID %>').attr('id'), obj.Table1[0].FormatTemplate_FooterPageNoColor);
                    if (obj.Table1[0].FormatTemplate_FooterPageNoShow == "Y") {
                        $('#<%=chk_Pagenoshow.ClientID %>').attr('checked', true);
                    }
                    else {
                        $('#<%=chk_Pagenoshow.ClientID %>').attr('checked', false);
                    }

                    if (obj.Table1[0].FormatTemplate_HeaderBodyMargin != "")
                        setDropDownData($('#<%=ddl_HBodymargin.ClientID %>').attr('id'), obj.Table1[0].FormatTemplate_HeaderBodyMargin);
                    else
                        setDropDownData($('#<%=ddl_HBodymargin.ClientID %>').attr('id'), "0");
                    if (obj.Table1[0].FormatTemplate_BodyFooterMargin != "")
                        setDropDownData($('#<%=ddl_BFootermargin.ClientID %>').attr('id'), obj.Table1[0].FormatTemplate_BodyFooterMargin);
                    else
                        setDropDownData($('#<%=ddl_BFootermargin.ClientID %>').attr('id'), "0");
                    pageType_Size();
                    pageType_Size_Landscape();
                    if (obj.Table1.length > 0)
                        tinyMCE.activeEditor.setContent(obj.Table1[0].FormatTemplate_Format);
                    else
                        tinyMCE.activeEditor.setContent('');
                },
                error: function () { }
            });
        }

        function GetAddOns(pID, spName) {
            $.ajax({
                type: "POST",
                url: "EditFormatHelper.aspx/GetData",
                data: "{'val': " + pID + ",'spName': '" + spName + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                error: OnError
            });
        }

        function setData(pID, eleClass) {
            var type = $('#' + pID).attr('title');
            var val = $('#' + pID).val();
            var sel = tinymce.activeEditor.selection;
            var node = tinymce.activeEditor.selection.getNode();
            if ($(node).closest('td').length > 0) {
                if (!$(node).closest('table').hasClass(eleClass)) {//alert('sd');
                    $(node).closest('table').addClass(eleClass);
                }
            }
            else {
                if (!$(node).hasClass(eleClass)) {
                    $(node).addClass(eleClass);
                }
            }
            content = val.split('_');
            if (content[0].toLowerCase() == 'img') {
                sel.setContent('<span class="GS_Value"><img alt="' + val + '" src="/img/p.png" /></span>');
            }
            else if (content[0].toLowerCase() == 'bar') {
                sel.setContent('<span class="GS_Value"><img alt="' + val + '" src="/img/b.png" /></span>');
            }
            else if (content[0].toLowerCase() == 'sign') {
                sel.setContent('<span class="GS_Value"><img alt="' + val + '" src="/img/s.jpg" /></span>');
            }
            else if (content[0].toLowerCase() == 'hindi') {
                sel.setContent('<span class="GS_Value Hindi" style="font-family: KrutiDev010;">[' + val + ']</span>');
            }
            else if ($('#rdbtn_NonEditable').attr('checked'))
                sel.setContent('<span class="GS_Value mceNonEditable" data-mce-contenteditable="false">[' + val + ']</span>');
            else if ($('#rdbtn_Editable').attr('checked'))
                sel.setContent('<span class="GS_Value">[' + val + ']</span>');
        }

        function OnSuccess(json) {
            var data = eval("(" + json.d + ")");
            console.log(data);
            table = $('#tbl_AddOns').DataTable({
                bLengthChange: true,
                lengthMenu: [[5, 10, -1], [5, 10, "All"]],
                bFilter: true,
                bSort: true,
                destroy: true,
                bPaginate: true,
                "scrollCollapse": true,
                "scrollY": 350,
                "jQueryUI": true,
                data: data.Table1,
                columns: [{ data: 'datarow', sortable: false, searchable: false },
                { data: 'Column_Name', sortable: true, searchable: true },
                { data: 'Table_No', sortable: true, searchable: true },
                {
                    name: "Action", data: null, Title: "Action", sortable: false, searchable: false,
                    render: function (data, type, row, meta) {
                        var actionButtons = '';
                        actionButtons += $("<input/>", {
                            type: "hidden",
                            id: "idx_" + row.datarow,
                            value: row.Column_Name,
                            title: row.FEDBCoulmns_ImageType
                        }).get(0).outerHTML;
                        actionButtons += $("<a/>", {
                            class: "btn  btn-sm tb-edit-btn",
                            title: "Add Addons",
                            onclick: "setData('idx_" + row.datarow + "' , '" + row.Table_No + "')",
                            html: $("<i/>", {
                                class: "fa fa-arrow-right"
                            }).get(0).outerHTML
                        }).get(0).outerHTML;

                        return actionButtons;
                    }
                }]
            });


        }

        function OnError(err) { }

        function openTester() {
            var newwindow = window.open('GS_FormatTesterHelper.aspx?FormatID=' + getParameterByName('FormatID') + '&PageType=' + $('#<%=ddl_str_PageType.ClientID %>').val() + '&PageOrientation=' + $('#<%=ddl_str_PageOrintion.ClientID %>').val(), 'Label Tester');
        }

        function tinyMCEdata() {
            return tinyMCE.activeEditor.getContent();
        }


        function fcu() {
            tinyMCE.execInstanceCommand("ctl00_ContentPlaceHolder1_txt_Formatditor", "mceFocus");
        }

        function getWord() {
            var jFrame = $('iframe');
            var objDoc = jFrame[0].contentWindow.document;
            var sel, word = "";
            if (jFrame[0].contentWindow.getSelection && (sel = jFrame[0].contentWindow.getSelection()).modify) {
                var selectedRange = sel.getRangeAt(0);
                sel.collapseToStart();
                sel.modify("move", "backward", "word");
                sel.modify("extend", "forward", "word");
                word = sel.toString();
                sel.addRange(selectedRange);
            } else if ((sel = objDoc.selection) && sel.type != "Control") {
                var range = sel.createRange();
                range.collapse(true);
                range.expand("word");
                word = range.text;
            }
        }

        function fn_CheckPaper(paperType) {
            if (paperType.toLowerCase() == 'a4') {

            }
        }

        function changeW() {
            $('#ctl00_ContentPlaceHolder1_txt_Formatditor_tbl').width(200);
        }

        function pageType_Size() {
            var ptype = fn_getEleobj('ddl_str_PageType').val();
            var line = '____________________________________________________________________________________';
            switch (ptype) {
                case 'LETTER': line = '______________________________________________________________________________________'; break;
                case 'NOTE': line = '___________________________________________________________________________'; break;
                case 'LEGAL': line = '______________________________________________________________________________________'; break;
                case 'TABLOID': line = '_________________________________________________________________________________________________________________'; break;
                case 'EXECUTIVE': line = '_________________________________________________________________________'; break;
                case 'POSTCARD': line = '_____________________________________'; break;
                case 'A0': line = '_______________________________________________________________________________________________________________________________________________________________________________________________'; break;
                case 'A1': line = '_______________________________________________________________________________________________________________________________________________________________________________________________'; break;
                case 'A2': line = '____________________________________________________________________________________________________________________________________________________________________________'; break;
                case 'A3': line = '_________________________________________________________________________________________________________________________'; break;
                case 'A4': line = '____________________________________________________________________________________'; break;
                case 'A5': line = '_________________________________________________________'; break;
                case 'A6': line = '_______________________________________'; break;
                case 'A7': line = '__________________________'; break;
                case 'A8': line = '_________________'; break;
                case 'A9': line = '__________'; break;
                case 'A10': line = '_____'; break;
                case 'B0': line = '_______________________________________________________________________________________________________________________________________________________________________________________________'; break;
                case 'B1': line = '_______________________________________________________________________________________________________________________________________________________________________________________________'; break;
                case 'B2': line = '_______________________________________________________________________________________________________________________________________________________________________________________________'; break;
                case 'B3': line = '_______________________________________________________________________________________________________________________________________________'; break;
                case 'B4': line = '_____________________________________________________________________________________________________'; break;
                case 'B5': line = '_____________________________________________________________________'; break;
                case 'B6': line = '_______________________________________________'; break;
                case 'B7': line = '________________________________'; break;
                case 'B8': line = '_____________________'; break;
                case 'B9': line = '_____________'; break;
                case 'B10': line = '_______'; break;
                case 'ARCH_E': line = '_______________________________________________________________________________________________________________________________________________________________________________________________'; break;
                case 'ARCH_D': line = '_______________________________________________________________________________________________________________________________________________________________________________________________'; break;
                case 'ARCH_C': line = '____________________________________________________________________________________________________________________________________________________________________________________________'; break;
                case 'ARCH_B': line = '____________________________________________________________________________________________________________________________'; break;
                case 'ARCH_A': line = '____________________________________________________________________________________________'; break;
                case 'FLSA': line = '______________________________________________________________________________________'; break;
                case 'FLSE': line = '____________________________________________________________________________________________'; break;
                case 'HALFLETTER': line = '______________________________________________________'; break;
                case '_11X17': line = '_________________________________________________________________________________________________________________'; break;
                case 'ID_1': line = '_______________________________'; break;
                case 'ID_2': line = '_______________________________________'; break;
                case 'ID_3': line = '_______________________________________________'; break;
                case 'LEDGER': line = '_________________________________________________________________________________________________________________________________________________________________________________'; break;
                case 'CROWN_QUARTO': line = '___________________________________________________________________________'; break;
                case 'LARGE_CROWN_QUARTO': line = '________________________________________________________________________________'; break;
                case 'DEMY_QUARTO': line = '_______________________________________________________________________________________'; break;
                case 'ROYAL_QUARTO': line = '_______________________________________________________________________________________________'; break;
                case 'CROWN_OCTAVO': line = '_______________________________________________'; break;
                case 'LARGE_CROWN_OCTAVO': line = '_________________________________________________'; break;
                case 'DEMY_OCTAVO': line = '_____________________________________________________'; break;
                case 'ROYAL_OCTAVO': line = '_____________________________________________________________'; break;
                case 'SMALL_PAPERBACK': line = '_________________________________________'; break;
                case 'PENGUIN_SMALL_PAPERBACK': line = '_________________________________________'; break;
                case 'PENGUIN_LARGE_PAPERBACK': line = '_________________________________________________'; break;
                case 'CustomThermal': line = '_______________________________________'; break;
                case 'CustomCheque': line = '_______________________________________'; break;
                default: line; break;
            }
            tinymce.activeEditor.setContent('');
            myLine = line;
            $('#myDiv').html(line);
            //var w = document.getElementById("myDiv").clientWidth;

            //if (w < 290) {

            //}
        }

        function pageType_Size_Landscape() {
            var ptype = fn_getEleobj('ddl_str_PageType').val();
            var line = '_________________________________________________________________________________________________________________________';
            switch (ptype) {
                case 'LETTER': line = '_________________________________________________________________________________________________________________'; break;
                case 'NOTE': line = '______________________________________________________________________________________________________'; break;
                case 'LEGAL': line = '________________________________________________________________________________________________________________________________________________'; break;
                case 'TABLOID': line = '_________________________________________________________________________________________________________________________________________________________________________________'; break;
                case 'EXECUTIVE': line = '____________________________________________________________________________________________________________'; break;
                case 'POSTCARD': line = '_________________________________________________________'; break;
                case 'A0': line = '___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________'; break;
                case 'A1': line = '________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________'; break;
                case 'A2': line = '_______________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________'; break;
                case 'A3': line = '_____________________________________________________________________________________________________________________________________________________________________________'; break;
                case 'A4': line = '_________________________________________________________________________________________________________________________'; break;
                case 'A5': line = '____________________________________________________________________________________'; break;
                case 'A6': line = '_________________________________________________________'; break;
                case 'A7': line = '_______________________________________'; break;
                case 'A8': line = '__________________________'; break;
                case 'A9': line = '_________________'; break;
                case 'A10': line = ''; break;
                case 'B0': line = '________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________'; break;
                case 'B1': line = '________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________'; break;
                case 'B2': line = '_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________'; break;
                case 'B3': line = '______________________________________________________________________________________________________________________________________________________________________________________________________________'; break;
                case 'B4': line = '_______________________________________________________________________________________________________________________________________________'; break;
                case 'B5': line = '_____________________________________________________________________________________________________'; break;
                case 'B6': line = '_____________________________________________________________________'; break;
                case 'B7': line = '_______________________________________________'; break;
                case 'B8': line = '________________________________'; break;
                case 'B9': line = '_____________________'; break;
                case 'B10': line = ''; break;
                case 'ARCH_E': line = '________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________'; break;
                case 'ARCH_D': line = '_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________'; break;
                case 'ARCH_C': line = '____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________'; break;
                case 'ARCH_B': line = '____________________________________________________________________________________________________________________________________________________________________________________________'; break;
                case 'ARCH_A': line = '____________________________________________________________________________________________________________________________'; break;
                case 'FLSA': line = '______________________________________________________________________________________________________________________________________'; break;
                case 'FLSE': line = '______________________________________________________________________________________________________________________________________'; break;
                case 'HALFLETTER': line = '______________________________________________________________________________________'; break;
                case '_11X17': line = '__________________________________________________________________________________________________________________________________________________________________________________'; break;
                case 'ID_1': line = '_________________'; break;
                case 'ID_2': line = '__________________________'; break;
                case 'ID_3': line = '________________________________'; break;
                case 'LEDGER': line = '_________________________________________________________________________________________________________________'; break;
                case 'CROWN_QUARTO': line = '___________________________________________________________________________________________________'; break;
                case 'LARGE_CROWN_QUARTO': line = '________________________________________________________________________________________________________'; break;
                case 'DEMY_QUARTO': line = '________________________________________________________________________________________________________________'; break;
                case 'ROYAL_QUARTO': line = '_______________________________________________________________________________________________________________________________'; break;
                case 'CROWN_OCTAVO': line = '_________________________________________________________________________'; break;
                case 'LARGE_CROWN_OCTAVO': line = '______________________________________________________________________________'; break;
                case 'DEMY_OCTAVO': line = '______________________________________________________________________________________'; break;
                case 'ROYAL_OCTAVO': line = '______________________________________________________________________________________________'; break;
                case 'SMALL_PAPERBACK': line = '______________________________________________________________________'; break;
                case 'PENGUIN_SMALL_PAPERBACK': line = '_______________________________________________________________________'; break;
                case 'PENGUIN_LARGE_PAPERBACK': line = '______________________________________________________________________________'; break;
                case 'CustomThermal': line = '____________________________________________________________________________________'; break;
                case 'CustomCheque': line = '_________________________________________________________________________________________________________________________'; break;
                default: line; break;
            }
            tinymce.activeEditor.setContent('');
            myLine_L = line;
            $('#myDiv_L').html(line);
            var w = document.getElementById("myDiv_L").clientWidth;
        }

        function setDropDownData(cntrlID, val) {
            var $cntrl = $('#' + cntrlID);
            $cntrl.val(val);
            var op = $cntrl.find('option:selected').prevAll().length;
            document.getElementById(cntrlID).options[op].selected = true;
        }

        function savePrompt() {
            alert('Format has been Saved Successfully!!');
            window.location = 'EditFormatHelper.aspx?type=' + getParameterByName('type') + '&FormatID=' + getParameterByName('FormatID');
        }

        function HBodymargin() {
            $('.tempH').show();
            $('.tempF').hide();
            $('.tempAll').hide();
        }
        function BodyfooterFmargin() {
            $('.tempH').hide();
            $('.tempF').show();
            $('.tempAll').hide();
        }
        function HBFFmargin() {
            $('.tempH').hide();
            $('.tempF').hide();
            $('.tempAll').show();
        }
    </script>
</asp:Content>
