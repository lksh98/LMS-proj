<%@ Page Title="Add Book Stock - Lib-Man" Language="C#" MasterPageFile="/pages/Admin/Dashboard/Admin.Master" AutoEventWireup="true" CodeBehind="addstock.aspx.cs" EnableEventValidation="false" Inherits="LibMan.pages.item.addstock" %>
<%@ Register Src="~/pages/Partial/Popup.ascx" TagName="Popup" TagPrefix="Partial" %>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <input type="hidden" runat="server" id="hdn_id" />
    <input type="hidden" runat="server" id="hdn_userkid" />
    <asp:HiddenField Value="" runat="server" ID="hdn_bookStock" />
    <section class="mb-2">
        <div class="row  border-bottom-1 pb-0">

            <div class="col-md-9 col-sm-8 col-8 ">
                <h3 id="Book_head" class="heading-modal">Add Book Stock </h3>
            </div>
            <div class="col-sm-1 pr-0 col-2 border-left-radius text-right">
                <asp:ImageButton ID="btn_save" src="/pages/Admin/images/save.png" class="icon-t-modal mt-0" OnClick="btn_save_Click" OnClientClick="return fn_check();" TabIndex="28" title="Save" runat="server" />
            </div>
            <div class="col-sm-1 pl-0 col-2 border-right-radius text-center">
                <img src="/pages/Admin/images/clear.png" class="icon-t-modal mt-0" onclick="Clear();" title="Clear">
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">ISBN</label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9">
                <input type="text" maxlength="13" id="txt_isbn" runat="server" tabindex="1" placeholder="..............................................." class="BlankText int isbn all-border border-bottom-2 font-12 width-100">
            </div>

            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">Title</label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9">
                <input type="text" maxlength="100" id="txt_title" runat="server" tabindex="3" placeholder="..............................................." class="BlankText  all-border border-bottom-2 font-12 width-100">
            </div>
            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">Sub-Title</label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9">
                <input type="text" maxlength="500" id="txt_subtitle" runat="server" tabindex="4" placeholder="..............................................." autocomplete="off" class="   all-border border-bottom-2 font-12 width-100">
            </div>

            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">Edition</label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9">
                <input type="text" maxlength="500" id="txt_edition" runat="server" tabindex="9" placeholder="..............................................." autocomplete="off" class="  all-border border-bottom-2 font-12 width-100">
            </div>
            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">Purchase Date</label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9">
                <input type="text" maxlength="500" id="txt_pdate" runat="server" tabindex="10" placeholder="..............................................." autocomplete="off" class="date  BlankText all-border border-bottom-2 font-12 width-100">
            </div>
            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">Quantity</label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9">
                <input type="text" maxlength="500" id="txt_qty" runat="server" tabindex="11" placeholder="..............................................." autocomplete="off" class=" int text-right BlankText all-border border-bottom-2 font-12 width-100">
            </div>
            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">Price</label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9">
                <input type="text" maxlength="500" id="txt_Price" runat="server" tabindex="12" placeholder="..............................................." autocomplete="off" class="decimal  text-right BlankText all-border border-bottom-2 font-12 width-100">
            </div>

            <div class="col-md-2 mt-1 col-sm-9">
                <input type="button" value="Add" class="btntwo addRecord" tabindex="14" />
            </div>
        </div>


    </section>

    <section class="table-background">
        <div class="table-responsive">
            <table class="table table-striped" id="tbl_Book">
                <!--Table head-->
                <thead class="thead-background">
                    <tr>
                        <th class="table-bolder">#</th>
                        <th class="table-bolder">Title</th>
                        <th class="table-bolder">Subtitle</th>
                        <th class="table-bolder">ISBN </th>
                        <th class="table-bolder">Edition</th>
                        <th class="table-bolder">Purchse Date</th>
                        <th class="table-bolder">Quantity</th>
                        <th class="table-bolder">Price</th>
                        <th class="table-bolder">Action</th>
                    </tr>
                </thead>
            </table>
        </div>
    </section>
     <Partial:Popup ID="Popup" runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder_BottomScripts">
    <script>
        var table;
        $(function () {
            DataBind();
            $(".date").datepicker({
                "dateFormat": "yy-mm-dd",
                maxDate: 0
            });
        });

        var data = [];
        $(document).on('click', '.addRecord', function () {
            if (Fn_Save()) {
                if (parseInt($('#<%=txt_qty.ClientID%>').val()) > 0) {
                    let json = {
                        row: data.length + 1,
                        book_kid: $('#<%=hdn_id.ClientID%>').val(),
                        book_isbn: $('#<%=txt_isbn.ClientID%>').val(),
                        book_title: $('#<%=txt_title.ClientID%>').val(),
                        book_subtitle: $('#<%=txt_subtitle.ClientID%>').val(),
                        book_edition: $('#<%=txt_edition.ClientID%>').val(),
                        book_purdate: $('#<%=txt_pdate.ClientID%>').val(),
                        book_qty: parseInt($('#<%=txt_qty.ClientID%>').val()),
                        book_price: $('#<%=txt_Price.ClientID%>').val(),
                        book_Description: $('.details').val(),
                    };
                    data.push(json);
                    $('[tabindex=' + 1 + ']').focus();
                    Clear();
                    OnSuccess(data)
                }
                else {
                    $('#<%=txt_qty.ClientID%>').addClass('border-bottom-Danger');
                    MsgArray[MsgArray.length] = 'Quantity should be greater than 0.';
                    MsgColor(true);
                    MsgAlert();
                }
            }
        });

        function fn_check() {
            if (data.length > 0) {
                $('#<%=hdn_bookStock.ClientID%>').val(JSON.stringify(data));
                return true;
            }
            alert("Please add at least one record");
            return false;
        }

        function DataBind() {
            let json = {
                row: "",
                book_kid: "",
                book_isbn: "",
                book_title: "",
                book_subtitle: "",
                book_edition: "",
                book_purdate: "",
                book_qty: "",
                book_price: "",
                book_Description: "",
            };
            data.push(json);
            OnSuccess(data);
            data.splice(0, 1);
            OnSuccess(data)
        }
        function OnSuccess(data) {
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
                data: data,
                columns: [{ data: 'row', sortable: false, searchable: false },
                { data: 'book_title', sortable: true, searchable: true },
                { data: 'book_subtitle', sortable: true, searchable: true },
                { data: 'book_isbn', sortable: true, searchable: true },
                { data: 'book_edition', sortable: true, searchable: true },
                { data: 'book_purdate', sortable: true, searchable: true },
                { data: 'book_qty', sortable: true, searchable: true },
                { data: 'book_price', sortable: true, searchable: true },

                {
                    name: "Action", data: null, title: "Action", sortable: false, searchable: false,
                    render: function (data, type, row, meta) {
                        var actionButtons = '';
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

                },
            });
        }
        function Edit(id) {
            $('[tabindex=' + 1 + ']').focus();
            $('#Book_head').text('Edit Book Stock');

            let EditBook = data.filter(e => { return e.book_kid == id })[0];
            data.splice(data.indexOf(EditBook), 1);
            OnSuccess(data)
            $('#<%=hdn_id.ClientID%>').val(EditBook.book_kid);
            $('#<%=txt_isbn.ClientID%>').val(EditBook.book_isbn);
            $('#<%=txt_title.ClientID%>').val(EditBook.book_title);
            $('#<%=txt_subtitle.ClientID%>').val(EditBook.book_subtitle);
            $('#<%=txt_edition.ClientID%>').val(EditBook.book_edition);
            $('#<%=txt_pdate.ClientID%>').val(EditBook.book_purdate);
            $('#<%=txt_qty.ClientID%>').val(EditBook.book_qty);
            $('#<%=txt_Price.ClientID%>').val(EditBook.book_price);

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
                        let DelBook = data.filter(e => { return e.book_kid == id })[0];
                        data.splice(data.indexOf(DelBook), 1);
                        OnSuccess(data)
                    }
                }
            );
        }

        function Add() {
            $('#Book_head').text('Add Book Stock');
            $('#<%=hdn_id.ClientID%>').val('');
            $('[tabindex=' + 1 + ']').focus();
        }

        function Save(result, id) {
            if (result == "1") {
                MsgArray[0] = Msg["Insert"];
                MsgColor(false);
                MsgAlert();
                Clear();
                DataBind();

                $("#Popup").modal('show');
                $('#Popup p').text('Print Stock');
                $('.PopupIframe').attr("src", '/PDFHelper/PdfPresSave.aspx?PageID=1&id=' + id );

                //window.open('/PDFHelper/PdfPresSave.aspx?PageID=1&id=' + id , '_blank');
            }
            else if (result == "-1") {
                MsgArray[0] = Msg["Error"];
                MsgColor(true);
                MsgAlert();
            }

        }

        function Clear() {
            let toda = new Date();
            toda.toISOString().split('T')[0];
            $('.border-bottom-Danger').each(function () {
                $(this).removeClass("border-bottom-Danger");
            });
            $('#<%=hdn_id.ClientID%>').val('');
            $('#<%=txt_isbn.ClientID%>').val("");
            $('#<%=txt_title.ClientID%>').val('');
            $('#<%=txt_subtitle.ClientID%>').val('');
            $('#<%=txt_edition.ClientID%>').val('');
            $('#<%=txt_pdate.ClientID%>').val('');
            $('#<%=txt_qty.ClientID%>').val('');
            $('#<%=txt_Price.ClientID%>').val('');
            $('.details').val('');
            Add();
        }

        function split(val) {
            return val.split(/,\s*/);
        }

        function extractLast(term) {
            return split(term).pop();
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


        $(document).on('change', '#<%=txt_isbn.ClientID%>', function () {
            var isbn = $(this).val();
            if (isbn.length == 13) {
                var EditBook = jqPost("addstock.aspx/GetBookByISBN", "{'isbn':'" + isbn + "'}");
                console.log(EditBook)
                if (EditBook != null && EditBook.Table1.length > 0) {
                    $('#<%=hdn_id.ClientID%>').val(EditBook.Table1[0].book_kid);
                    $('#<%=txt_isbn.ClientID%>').val(EditBook.Table1[0].book_isbn13);
                    $('#<%=txt_title.ClientID%>').val(EditBook.Table1[0].book_title);
                    $('#<%=txt_subtitle.ClientID%>').val(EditBook.Table1[0].book_subtitle);
                    $('#<%=txt_edition.ClientID%>').val("");
                    $('#<%=txt_pdate.ClientID%>').val("");
                    $('#<%=txt_qty.ClientID%>').val("");
                    $('#<%=txt_Price.ClientID%>').val("");
                }
            }
            else {
                alert('Book does not exist');
            }
        });





    </script>
</asp:Content>
