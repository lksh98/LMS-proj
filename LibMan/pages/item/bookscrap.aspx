<%@ Page Title="Book Scrap - Lib-Man" Language="C#" MasterPageFile="/pages/Admin/Dashboard/Admin.Master" AutoEventWireup="true" CodeBehind="bookscrap.aspx.cs" EnableEventValidation="false" Inherits="LibMan.pages.item.bookscrap" %>

<%@ Register Src="~/pages/Partial/Popup.ascx" TagName="Popup" TagPrefix="Partial" %>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <input type="hidden" runat="server" id="hdn_id" />
    <input type="hidden" runat="server" id="hdn_userkid" />
    <asp:HiddenField Value="" runat="server" ID="hdn_bookStock" />
    <section class="mb-2">
        <div class="row  border-bottom-1 pb-0">

            <div class="col-md-9 col-sm-8 col-8 ">
                <h3 id="Book_head" class="heading-modal">Scrap Book  </h3>
            </div>

        </div>
        <div class="row mt-4">

            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">Book ID</label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9">
                <input type="text" maxlength="50" id="txt_bookID" runat="server" tabindex="2" placeholder="..............................................." class="txt_bookid BlankText   isbn all-border border-bottom-2 font-12 width-100">
            </div>
            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">ISBN</label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9">
                <input type="text" maxlength="13" id="txt_isbn" runat="server" tabindex="-1" readonly="readonly" placeholder="..............................................." class="BlankText int isbn all-border border-bottom-2 font-12 width-100">
            </div>

            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">Title</label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9">
                <input type="text" maxlength="100" id="txt_title" runat="server" tabindex="-1" readonly="readonly" placeholder="..............................................." class="BlankText  all-border border-bottom-2 font-12 width-100">
            </div>
            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">Sub-Title</label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9">
                <input type="text" maxlength="500" id="txt_subtitle" runat="server" tabindex="-1" readonly="readonly" placeholder="..............................................." autocomplete="off" class="   all-border border-bottom-2 font-12 width-100">
            </div>
            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">Remarks </label>
            </div>
            <div class="col-md-8 mt-1 col-sm-9">
                <textarea class="form-control all-border border-bottom-2 font-12 width-100   details" autocomplete="off" runat="server" id="txt_descriptions" tabindex="10" rows="2"></textarea>
            </div>

            <div class="col-md-2 mt-1 col-sm-9">
                <input type="button" value="Add" class="btntwo addRecord" tabindex="3" />
            </div>
        </div>


    </section>

    <section class="table-background">
        <div class="table-responsive">
            <table class="table table-striped" id="tbl_Book">
                <thead class="thead-background">
                    <tr>
                        <th class="table-bolder">#</th>
                        <th class="table-bolder">Book ID</th>
                        <th class="table-bolder">Title</th>
                        <th class="table-bolder">Subtitle</th>
                        <th class="table-bolder">ISBN </th>
                        <th class="table-bolder">Edition</th>
                        <th class="table-bolder">Authors</th>
                        <th class="table-bolder">Publisher</th>
                        <th class="table-bolder">Category</th>
                        <th class="table-bolder">Scrap Date</th>
                        <th class="table-bolder">Scrap By</th>
                        <th class="table-bolder">Remarks</th>
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
        });


        function DataBind() {
            $.ajax({
                type: "POST",
                url: 'bookscrap.aspx/getScrapBooks',
                data: "{}",
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
                { data: 'bookstockdet_bookrefID', sortable: true, searchable: true },
                { data: 'book_title', sortable: true, searchable: true },
                { data: 'book_subtitle', sortable: true, searchable: true },
                { data: 'book_isbn13', sortable: true, searchable: true },
                { data: 'bookstockdet_edition', sortable: true, searchable: true },
                { data: 'book_authors', sortable: true, searchable: true },
                { data: 'book_publisher', sortable: true, searchable: true },
                { data: 'book_category', sortable: true, searchable: true },
                { data: 'bookscrap_idate', sortable: true, searchable: true },
                { data: 'usr_name', sortable: true, searchable: true },
                { data: 'bookscrap_remarks', sortable: true, searchable: true }
                ],
                "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
                    if (aData.issueToDept_status == "I") {
                        $('td', nRow).css('background-color', '#e5fdf5');
                    }
                    else if (aData.issueToDept_status == "R") {
                        $('td', nRow).css('background-color', '#6ec1a9');
                    }

                },
            });
        }





        function Save(result, id) {
            if (result == "1") {
                MsgArray[0] = Msg["Insert"];
                MsgColor(false);
                MsgAlert();
                Clear();
                DataBind();
            }
            else if (result == "-1") {
                MsgArray[0] = Msg["Error"];
                MsgColor(true);
                MsgAlert();
            }

        }

        function Clear() {
            $('.border-bottom-Danger').each(function () {
                $(this).removeClass("border-bottom-Danger");
            });
            $('#<%=hdn_bookStock.ClientID%>').val('');
            $('#<%=txt_bookID.ClientID%>').val('');
            $('#<%=txt_isbn.ClientID%>').val("");
            $('#<%=txt_title.ClientID%>').val('');
            $('#<%=txt_subtitle.ClientID%>').val('');
            $('#<%=txt_descriptions.ClientID%>').val('');
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

        $(document).on("keypress", '.txt_bookid', press);

        function send() {
            socket.emit('scan', keybuffer.join(""));
            keybuffer.length = 0;
        }


        $(document).on('click', '.addRecord', function () {
            if (Fn_Save) {
                var EditBook = jqPost("bookscrap.aspx/saveBook", "{'bookid':'" + $('#<%=hdn_bookStock.ClientID%>').val() + "','remarks':'" + $('#<%=txt_descriptions.ClientID%>').val() + "'}");
                console.log(EditBook)
                if (EditBook != null && EditBook.Table1.length > 0) {
                    Save(EditBook.Table1[0].val, EditBook.Table1[0]?.ID);
                }


            }
        });



        $(document).on('change', '#<%=txt_bookID.ClientID%>', function () {
            var bookid = $(this).val();

            var EditBook = jqPost("bookscrap.aspx/getBookDetails", "{'bookid':'" + bookid + "'}");
            console.log(EditBook)
            if (EditBook != null && EditBook.Table1.length > 0) {
                $('#<%=hdn_bookStock.ClientID%>').val(EditBook.Table1[0].bookstockdet_kid);
                $('#<%=txt_isbn.ClientID%>').val(EditBook.Table1[0].book_isbn13);
                $('#<%=txt_title.ClientID%>').val(EditBook.Table1[0].book_title);
                $('#<%=txt_subtitle.ClientID%>').val(EditBook.Table1[0].book_subtitle);
            }
            else {
                MsgArray[0] = "Book is not available.";
                MsgColor(true);
                MsgAlert();
                $('#<%=hdn_bookStock.ClientID%>').val('');
                $('#<%=txt_isbn.ClientID%>').val("");
                $('#<%=txt_title.ClientID%>').val("");
                $('#<%=txt_subtitle.ClientID%>').val("");
                $('#<%=txt_bookID.ClientID%>').val("");
                $('#<%=txt_bookID.ClientID%>').focus();
            }

        });





    </script>
</asp:Content>
