<%@ Page Title="Book Master- Lib-Man" Language="C#" MasterPageFile="../Dashboard/Admin.Master" AutoEventWireup="true" CodeBehind="Book.aspx.cs" EnableEventValidation="false" Inherits="LibMan.pages.Admin.Masters.Book" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <input type="hidden" runat="server" id="hdn_id" />
    <input type="hidden" runat="server" id="hdn_userkid" />
    <section class="table-background">
        <div class="table-responsive">
            <!--Table-->
            <div class="addNew">
                <a href="#" data-backdrop="static" data-target="#Popup" data-toggle="modal" class="btn btn-custom mrg-l15 " onclick="Add();" title="Add New Book"><i class="fa fa-plus-circle"></i>Add New</a>
            </div>
            <table class="table table-striped" id="tbl_Book">
                <!--Table head-->
                <thead class="thead-background">
                    <tr>
                        <th class="table-bolder">#</th>
                        <th class="table-bolder">Title</th>
                        <th class="table-bolder">Subtitle</th>
                        <th class="table-bolder">ISBN 10</th>
                        <th class="table-bolder">ISBN 13</th>
                        <th class="table-bolder">Authors</th>
                        <th class="table-bolder">Publisher</th>
                        <th class="table-bolder">Published Date</th>
                        <th class="table-bolder">Category</th>
                        <th class="table-bolder">Status</th>
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
                    <div class="modal-dialog9 modal-dialog-centered">
                        <div class="modal-content pb-4">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <p class="modal-title text-center m-auto">Book Master</p>
                                <button type="button" class="close" data-dismiss="modal" onclick="Clear();">&times;</button>
                            </div>
                            <!-- Modal body -->
                            <div class="modal-body">
                                <section>
                                    <div class="row  border-bottom-1">
                                        <div class="col-md-2 col-sm-3">
                                            <div class="user-profiles">
                                                <img src="/Image/book.png" class="imgsel user-modal"><i class="fas fa-edit img-upload uploadimage">  </i>
                                                <asp:FileUpload ID="img_upload" Style="display: none" runat="server" CssClass="img img_up" accept=".png, .jpg, .jpeg, .svg, .sveg" onchange="img_pathUrl(this);" />
                                                <asp:HiddenField ID="hdn_downImage" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-md-8 col-sm-8 col-8 mt-3">
                                            <h3 id="Book_head" class="heading-modal">Add Book </h3>
                                        </div>
                                        <div class="col-sm-1 pr-0 col-2 border-left-radius text-right">
                                            <asp:ImageButton ID="btn_save" src="/pages/Admin/images/save.png" class="icon-t-modal" OnClick="btn_save_Click" OnClientClick="return Fn_Save();" TabIndex="28" title="Save" runat="server" />
                                        </div>
                                        <div class="col-sm-1 pl-0 col-2 border-right-radius text-center">
                                            <img src="/pages/Admin/images/clear.png" class="icon-t-modal" onclick="Clear();" title="Clear">
                                        </div>
                                    </div>
                                    <div class="row mt-4">
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">ISBN 13</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <input type="text" maxlength="13" id="txt_isbn13" runat="server" tabindex="1" placeholder="..............................................." class="BlankText int isbn all-border border-bottom-2 font-12 width-100">
                                        </div>
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">ISBN 10</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <input type="text" maxlength="10" id="txt_isbn10" runat="server" tabindex="2" placeholder="..............................................." autocomplete="off" class="int isbn BlankText all-border border-bottom-2 font-12 width-100">
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">Title</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <input type="text" maxlength="100" id="txt_title" runat="server" tabindex="3" placeholder="..............................................." class="BlankText  all-border border-bottom-2 font-12 width-100">
                                        </div>
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">Sub-Title</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <input type="text" maxlength="500" id="txt_subtitle" runat="server" tabindex="4" placeholder="..............................................." autocomplete="off" class="   all-border border-bottom-2 font-12 width-100">
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">Publisher</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <input type="text" maxlength="500" id="txt_publisher" runat="server" tabindex="5" placeholder="..............................................." class="BlankText autocompletePublisher  all-border border-bottom-2 font-12 width-100">
                                            <asp:HiddenField Value="" runat="server" ID="hdn_publisher" />
                                        </div>
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">Published Date</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <input type="text" maxlength="10" id="txt_publishedDate" runat="server" tabindex="6" placeholder="..............................................." autocomplete="off" class=" BlankText date all-border border-bottom-2 font-12 width-100">
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">Authors</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <input type="text" maxlength="1000" id="txt_authors" runat="server" tabindex="7" placeholder="..............................................." class="BlankText autocompleteAuthor  all-border border-bottom-2 font-12 width-100">
                                            <asp:HiddenField Value="" runat="server" ID="hdn_author" />
                                        </div>
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">Categories</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <input type="text" maxlength="500" id="txt_categories" runat="server" tabindex="8" placeholder="..............................................." autocomplete="off" class=" autocompleteCategories BlankText all-border border-bottom-2 font-12 width-100">
                                            <asp:HiddenField Value="" runat="server" ID="hdn_categories" />
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">Edition</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <input type="text" maxlength="1000" id="txt_edition" runat="server" tabindex="9" placeholder="..............................................." class="     all-border border-bottom-2 font-12 width-100">
                                        </div>
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">Purchase Date</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <input type="text" maxlength="500" id="txt_purdate" runat="server" tabindex="10" placeholder="..............................................." autocomplete="off" class=" date   all-border border-bottom-2 font-12 width-100">
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">Quantity</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <input type="text" maxlength="1000" id="txt_quantity" runat="server" tabindex="11" placeholder="..............................................." class="   int  all-border border-bottom-2 font-12 width-100">
                                        </div>
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">Price</label>
                                        </div>
                                        <div class="col-md-4 col-sm-9">
                                            <input type="text" maxlength="500" id="txt_price" runat="server" tabindex="12" placeholder="..............................................." autocomplete="off" class="  decimal   all-border border-bottom-2 font-12 width-100">
                                        </div>
                                    </div>

                                    <div class="row mt-2">
                                        <div class="col-md-2 col-sm-3">
                                            <label class="input-label-modal">Description</label>
                                        </div>
                                        <div class="col-md-10 col-sm-9">
                                            <textarea class="form-control all-border border-bottom-2 font-12 width-100   details" autocomplete="off" runat="server" id="txt_descriptions" tabindex="13" rows="2"></textarea>
                                        </div>

                                    </div>


                                    <div class="row  mt-2">
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
        <div class="modal" id="Popup1">
            <div class="modal-dialog9 modal-dialog-centered">
                <div class="modal-content pb-4">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <p class="modal-title text-center m-auto">Book Details</p>
                        <button type="button" class="close" data-dismiss="modal" onclick="Clear();">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                          <section class="table-background">
        <div class="table-responsive">
                            <table class="table table-striped" id="tbl_BookStock">
                                <!--Table head-->
                                <thead class="thead-background">
                                    <tr>
                                        <th class="table-bolder">#</th>
                                        <th class="table-bolder">BookID </th>
                                        <th class="table-bolder">Edition</th>
                                        <th class="table-bolder">Purchase Date</th>
                                        <th class="table-bolder">Price </th>
                                        <th class="table-bolder">Created Date</th> 
                                    </tr>
                                </thead>
                            </table>
            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </section>
       <%--<Partial:Popup ID="Popup2" runat="server" />--%>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder_BottomScripts">
    <script>
        var table;
        $(function () {
            DataBind();
            autocompletePublisher();
            autocompletAuthor();
            $(".date").datepicker({
                "dateFormat": "yy-mm-dd",
                maxDate: 0
            });
        });


        function DataBind() {
            $.ajax({
                type: "POST",
                url: 'Book.aspx/getAllBooks',
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
            table = $('#tbl_Book').DataTable({
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
                { data: 'book_title', sortable: true, searchable: true },
                { data: 'book_subtitle', sortable: true, searchable: true },
                { data: 'book_isbn10', sortable: true, searchable: true },
                { data: 'book_isbn13', sortable: true, searchable: true },
                { data: 'book_authors', sortable: true, searchable: true },
                { data: 'book_publisher', sortable: true, searchable: true },
                { data: 'book_publishedDate', sortable: true, searchable: true },
                { data: 'book_category', sortable: true, searchable: true },
                {
                    data: 'book_status', sortable: false, searchable: false,
                    render: function (data, type, row, meta) {
                        var actionButtons = '';
                        var chaeck = false;
                        if (data == "True" || parseInt(data) == 1)
                            chaeck = true;
                        actionButtons += $("<label/>", {
                            class: "switch",
                            html: $("<input/>", {
                                type: "checkbox",
                                Title: "Edit Status",
                                id: "Chk_status",
                                class: "chk_status switchBox switch-small form-checkbox",
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
                {
                    name: "Action", data: null, title: "Action", sortable: false, searchable: false,
                    render: function (data, type, row, meta) {
                        var actionButtons = '';
                        actionButtons += $("<a/>", {
                            title: "Show Books",
                            class: "btn btn-default btn-sm tb-edit-btn",
                            href: "#",
                            onclick: "ShowBooks(" + row.book_kid + ")",
                            'data-toggle': "modal",
                            'data-target': "#Popup1",
                            'data-backdrop': "static",
                            html: $("<i/>", {
                                class: "fa fa-eye"
                            }).get(0).outerHTML
                        }).get(0).outerHTML;

                        actionButtons += $("<a/>", {
                            title: "Edit Book",
                            class: "btn btn-default btn-sm tb-edit-btn",
                            href: "#",
                            onclick: "Edit(" + row.book_kid + ")",
                            'data-toggle': "modal",
                            'data-target': "#Popup",
                            'data-backdrop': "static",
                            html: $("<i/>", {
                                class: "fa fa-edit"
                            }).get(0).outerHTML
                        }).get(0).outerHTML;

                        actionButtons += $("<a/>", {
                            title: "Delete Book",
                            class: "btn btn-default btn-sm tb-edit-btn",
                            href: "#",
                            onclick: "Delete(" + row.book_kid + ")",
                            'data-toggle': "modal",
                            'data-target': "#modal-MCity-delete",
                            'data-backdrop': "static",
                            html: $("<i/>", {
                                class: "fa fa-trash"
                            }).get(0).outerHTML
                        }).get(0).outerHTML;

                        return actionButtons;
                    }
                }],
                "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
                    //if (aData.Doc_status == 1 || aData.book_status == "True") {
                    //    $('td', nRow).css('background-color', 'rgb(150 206 150 / 67%)');
                    //}
                    //else {
                    //    $('td', nRow).css('background-color', 'white');
                    //}
                },
            });
        }


        function BookDetail(data) {
             
            table = $('#tbl_BookStock').DataTable({
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
                    { data: 'bookstockdet_bookrefID', sortable: true, searchable: true },
                    { data: 'bookstockdet_edition', sortable: true, searchable: true },
                    { data: 'bookstockdet_purDate', sortable: true, searchable: true },
                    { data: 'bookstockdet_price', sortable: true, searchable: true },
                    { data: 'bookstock_date', sortable: true, searchable: true },],
            });
        }

        function ShowBooks(id) {
            $('#<%=hdn_id.ClientID%>').val(id);
            var ShowBook = jqPost("Book.aspx/GetBookStockByID", "{'id':'" + id + "'}");
            if (ShowBook != null  ) {
                BookDetail(ShowBook);
            }
        }

        function Edit(id) {
            $('[tabindex=' + 1 + ']').focus();
            $('#Book_head').text('Edit Book');
            $('#<%=hdn_id.ClientID%>').val(id);
            var EditBook = jqPost("Book.aspx/GetBookByID", "{'id':'" + id + "'}");

            if (EditBook != null && EditBook.Table1.length > 0) {
                $('#<%=hdn_id.ClientID%>').val(EditBook.Table1[0].book_kid);
                $('#<%=txt_isbn13.ClientID%>').val(EditBook.Table1[0].book_isbn13);
                $('#<%=txt_isbn10.ClientID%>').val(EditBook.Table1[0].book_isbn10);
                $('#<%=txt_title.ClientID%>').val(EditBook.Table1[0].book_title);
                $('#<%=txt_subtitle.ClientID%>').val(EditBook.Table1[0].book_subtitle);
                $('#<%=txt_publishedDate.ClientID%>').val(EditBook.Table1[0].book_publishedDate);
                $('#<%=txt_authors.ClientID%>').val(EditBook.Table1[0].book_authors);
                $('#<%=txt_publisher.ClientID%>').val(EditBook.Table1[0].book_publisher);
                $('#<%=txt_categories.ClientID%>').val(EditBook.Table1[0].book_category);
                $('.details').val(EditBook.Table1[0].book_Description);
                if (EditBook.Table1[0].File_Path != '' && EditBook.Table1[0].File_Path != null && EditBook.Table1[0].File_Path != undefined) {

                    $('.imgsel').attr('src', EditBook.Table1[0].File_Path);
                }
                else {
                    $('.imgsel').attr('src', '/Image/book.png');
                }
            }
        }

        function Delete(id) {
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
                        var DelBook = jqPost("Book.aspx/DeleteUpdateBook", "{'id':'" + id + "','flag':'D','status':'" + false + "'}");
                        if (DelBook != null && DelBook.Table1.length > 0) {

                            if (DelBook.Table1[0].val == "1") {
                                MsgArray[0] = Msg["Delete"];
                                MsgColor(false);
                                MsgAlert();
                                table.destroy();
                                DataBind();
                            }
                            else if (DelBook.Table1[0].val == "2") {
                                MsgArray[0] = Msg["LinkedRec"];
                                MsgColor(true);
                                MsgAlert();
                            }
                        }
                    }
                }
            );
        }

        function Add() {
            $('#Book_head').text('Add Book');
            $('#<%=hdn_id.ClientID%>').val('');
            $('[tabindex=' + 1 + ']').focus();
        }

        function Save(result, id) {
            if (result == "1") {
                MsgArray[0] = Msg["Update"];
                MsgColor(false);
                MsgAlert();
                $('.close').click();
                Clear();
              
                if (id != 0) {
                    $("#Popup").modal('show');
                    $('#Popup p').text('Print Stock');
                    $('.PopupIframe').attr("src", '/PDFHelper/PdfPresSave.aspx?PageID=1&id=' + id);
                }
                else {
                    DataBind();
                }
            }
            else if (result == "2") {
                MsgArray[0] = Msg["Insert"];
                MsgColor(false);
                MsgAlert();
                $('.close').click();
                Clear(); 
                if (id != 0) {
                    $("#Popup").modal('show');
                    $('#Popup p').text('Print Stock');
                    $('.PopupIframe').attr("src", '/PDFHelper/PdfPresSave.aspx?PageID=1&id=' + id);
                } else {
                    DataBind();
                }
            }
            else if (result == "3") {
                MsgArray[0] = Msg["Already"];
                MsgColor(true);
                MsgAlert();
                $('#Popup').modal('show');
            }

        }

        function Clear() {
            $('#Book_head').text('Add Book ');
            $('#<%=hdn_id.ClientID%>').val('');
            $('.border-bottom-Danger').each(function () {
                $(this).removeClass("border-bottom-Danger");
            });
            $('#<%=hdn_id.ClientID%>').val('');
            $('#<%=txt_isbn13.ClientID%>').val('');
            $('#<%=txt_isbn10.ClientID%>').val('');
            $('#<%=txt_title.ClientID%>').val('');
            $('#<%=txt_subtitle.ClientID%>').val('');
            $('#<%=txt_publishedDate.ClientID%>').val('');
            $('#<%=txt_authors.ClientID%>').val('');
            $('#<%=txt_publisher.ClientID%>').val('');
            $('#<%=txt_categories.ClientID%>').val('');
            $('#<%=txt_edition.ClientID%>').val('');
            $('#<%=txt_purdate.ClientID%>').val('');
            $('#<%=txt_quantity.ClientID%>').val('');
            $('#<%=txt_price.ClientID%>').val('');
            $('.details').val('');
            $('.imgsel')[0].src = '/Image/book.png';
        }

        $(document).on('change', '.chk_status', function () {
            var status = $(this).is(":checked");
            var UpdateBook = jqPost("Book.aspx/DeleteUpdateBook", "{'id':'" + $(this).val() + "','flag':'U','status':'" + status + "'}");
            if (UpdateBook != null && UpdateBook.Table1.length > 0) {

                if (UpdateBook.Table1[0].val == "1") {
                    MsgArray[0] = Msg["Update"];
                    MsgColor(false);
                    MsgAlert();
                    DataBind();
                }
            }
        });

        function split(val) {
            return val.split(/,\s*/);
        }
        function extractLast(term) {
            return split(term).pop();
        }
        function autocompletePublisher() {
            var cache = {};
            var xhr2 = new XMLHttpRequest();
            $(".autocompletePublisher")
                .autocomplete({
                    minLength: 0,
                    source: function (request, response) {
                        var term = request.term;
                        console.log(term)
                        if (term in cache) {
                            response(cache[term]);
                        }
                        else {
                            xhr2.abort();
                            xhr2 = $.ajax(
                                {
                                    url: 'Book.aspx/getPublisher',
                                    dataType: 'json',
                                    type: 'POST',
                                    contentType: 'application/json',
                                    data: "{'term':'" + term + "'}",
                                    success: function (data, status, xhr) {
                                        var obj = eval("(" + data.d + ")");
                                        if (isEmptyObj(obj) == false) {
                                            cache[term] = obj.Table1;
                                            if (term.substr(0, 1) != '%') {
                                                var re = $.ui.autocomplete.escapeRegex(term);
                                                var matcher;
                                                matcher = new RegExp(re, "i");
                                                response($.grep(obj.Table1, function (item) {
                                                    return matcher.test(item.label);
                                                }));
                                            }
                                            else {
                                                response(obj);
                                            }
                                        }
                                        else {
                                            loader.val('');
                                        }
                                    },
                                    error: function () {

                                    }
                                });
                        }


                    },
                    focus: function () {
                        return false;
                    },
                    select: function (event, ui) {
                        $('#<%=txt_publisher.ClientID%>').val(ui.item.label);
                        $('#<%=hdn_publisher.ClientID%>').val(ui.item.value);
                        return false;
                    },

                });
        }

        function autocompletAuthor() {
            var cache = {};
            var xhr2 = new XMLHttpRequest();
            $(".autocompleteAuthor")
                .autocomplete({
                    minLength: 0,
                    source: function (request, response) {
                        var term = request.term;
                        console.log(term)
                        if (term in cache) {
                            response(cache[term]);
                        }
                        else {
                            xhr2.abort();
                            xhr2 = $.ajax(
                                {
                                    url: 'Book.aspx/getAuthor',
                                    dataType: 'json',
                                    type: 'POST',
                                    contentType: 'application/json',
                                    data: "{'term':'" + term.split(',').pop() + "'}",
                                    success: function (data, status, xhr) {
                                        var obj = eval("(" + data.d + ")");
                                        if (isEmptyObj(obj) == false) {
                                            cache[term] = obj.Table1;
                                            if (term.substr(0, 1) != '%') {
                                                var re = $.ui.autocomplete.escapeRegex(term);
                                                var matcher;
                                                matcher = new RegExp(re, "i");
                                                response($.grep(obj.Table1, function (item) {
                                                    return matcher.test(item.label);
                                                }));
                                            }
                                            else {
                                                response(obj);
                                            }
                                        }
                                        else {
                                            loader.val('');
                                        }
                                    },
                                    error: function () {

                                    }
                                });
                        }


                    },
                    focus: function () {
                        return false;
                    },
                    select: function (event, ui) {
                        var terms = split($('#<%=txt_authors.ClientID%>').val());
                        terms.pop();
                        terms.push(ui.item.label);
                        terms.push("");
                        $('#<%=txt_authors.ClientID%>').val(terms.join(", "));
                        var termsID = split($('#<%=hdn_author.ClientID%>').val());
                        termsID.pop();
                        termsID.push(ui.item.value);
                        termsID.push("");
                        $('#<%=hdn_author.ClientID%>').val(termsID.join(", "));
                        return false;
                    },
                });
        }

        function autocompleteCategories() {
            var cache = {};
            var xhr2 = new XMLHttpRequest();
            $(".autocompleteCategories")
                .autocomplete({
                    minLength: 0,
                    source: function (request, response) {
                        var term = request.term;
                        console.log(term)
                        if (term in cache) {
                            response(cache[term]);
                        }
                        else {
                            xhr2.abort();
                            xhr2 = $.ajax(
                                {
                                    url: 'Book.aspx/getCategories',
                                    dataType: 'json',
                                    type: 'POST',
                                    contentType: 'application/json',
                                    data: "{'term':'" + term.split(',').pop() + "'}",
                                    success: function (data, status, xhr) {
                                        var obj = eval("(" + data.d + ")");
                                        if (isEmptyObj(obj) == false) {
                                            cache[term] = obj.Table1;
                                            if (term.substr(0, 1) != '%') {
                                                var re = $.ui.autocomplete.escapeRegex(term);
                                                var matcher;
                                                matcher = new RegExp(re, "i");
                                                response($.grep(obj.Table1, function (item) {
                                                    return matcher.test(item.label);
                                                }));
                                            }
                                            else {
                                                response(obj);
                                            }
                                        }
                                        else {
                                            loader.val('');
                                        }
                                    },
                                    error: function () {

                                    }
                                });
                        }


                    },
                    focus: function () {
                        return false;
                    },
                    select: function (event, ui) {
                        var terms = split($('#<%=txt_categories.ClientID%>').val());
                        terms.pop();
                        terms.push(ui.item.label);
                        terms.push("");
                        $('#<%=txt_categories.ClientID%>').val(terms.join(", "));
                        var termsID = split($('#<%=hdn_categories.ClientID%>').val());
                        termsID.pop();
                        termsID.push(ui.item.value);
                        termsID.push("");
                        $('#<%=hdn_categories.ClientID%>').val(termsID.join(", "));
                        return false;
                    },

                });
        }

        var keybuffer = [];
        function press(event) {
            if (event.which === 13) {
                return send();
            }
            var number = event.which - 48;
            if (number < 0 || number > 9) {
                return;
            }
            keybuffer.push(number);
        }

        $(document).on("keypress", '.isbn', press);

        function send() {
            socket.emit('scan', keybuffer.join(""));
            keybuffer.length = 0;
        }


        $(document).on('change', '#<%=txt_isbn13.ClientID%>', function () {
            var isbn = $(this).val();
            if (isbn.length == 13)
                getdataFromISBN(isbn);
        });
        $(document).on('change', '#<%=txt_isbn10.ClientID%>', function () {
            var isbn = $(this).val();
            if (isbn.length == 10)
                getdataFromISBN(isbn);
        });

        function getdataFromISBN(isbn) {
            httpGetAsync("https://www.googleapis.com/books/v1/volumes?q=isbn:" + isbn);
            function httpGetAsync(theUrl) {
                var xmlHttp = new XMLHttpRequest();
                xmlHttp.onreadystatechange = function () {
                    if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
                        var obj = eval("(" + xmlHttp.response + ")");
                        if (obj.totalItems > 0) {
                            if (obj.items[0].volumeInfo.industryIdentifiers.length > 1) {
                                if (obj.items[0].volumeInfo.industryIdentifiers[0].identifier.length == 10) {
                                    $('#<%=txt_isbn10.ClientID%>').val(obj.items[0].volumeInfo.industryIdentifiers[0].identifier);
                                    $('#<%=txt_isbn13.ClientID%>').val(obj.items[0].volumeInfo.industryIdentifiers[1].identifier);
                                } else {
                                    $('#<%=txt_isbn13.ClientID%>').val(obj.items[0].volumeInfo.industryIdentifiers[0].identifier);
                                    $('#<%=txt_isbn10.ClientID%>').val(obj.items[0].volumeInfo.industryIdentifiers[1].identifier);
                                }
                            }
                            $('#<%=txt_title.ClientID%>').val(obj.items[0].volumeInfo.title);
                            $('#<%=txt_subtitle.ClientID%>').val(obj.items[0].volumeInfo.subtitle ?? '');
                            $('#<%=txt_publishedDate.ClientID%>').val(obj.items[0].volumeInfo.publishedDate);
                            $('#<%=txt_authors.ClientID%>').val(obj.items[0].volumeInfo.authors.join(', '));
                            $('#<%=txt_publisher.ClientID%>').val(obj.items[0].volumeInfo.publisher ?? '');
                            $('#<%=txt_categories.ClientID%>').val(obj.items[0].volumeInfo.categories.join(', '));
                            $('#<%=hdn_downImage.ClientID%>').val(obj.items[0].volumeInfo.imageLinks.thumbnail);
                            $('.details').val(obj.items[0].volumeInfo.description);
                            $('.imgsel').attr('src', obj.items[0].volumeInfo.imageLinks.thumbnail);
                        }
                    }
                }
                xmlHttp.open("GET", theUrl, true);
                xmlHttp.send(null);
            }
        }



    </script>
</asp:Content>
