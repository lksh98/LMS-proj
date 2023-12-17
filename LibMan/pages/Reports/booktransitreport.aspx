<%@ Page Title="Book Transition Report - Lib-Man" Language="C#" MasterPageFile="/pages/Admin/Dashboard/Admin.Master" AutoEventWireup="true" CodeBehind="booktransitreport.aspx.cs" EnableEventValidation="false" Inherits="LibMan.pages.Reports.booktransitreport" %>

<%@ Register Src="~/pages/Partial/Popup.ascx" TagName="Popup" TagPrefix="Partial" %>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <input type="hidden" runat="server" id="hdn_id" />
    <input type="hidden" runat="server" id="hdn_userkid" />
    <asp:HiddenField Value="" runat="server" ID="hdn_bookStock" />
    <section class="mb-2">
        <div class="row  border-bottom-1">

            <div class="col-md-9 col-sm-8 col-8 mt-3">
                <h3 id="Book_head" class="heading-modal">Book Transition Report </h3>
            </div>

        </div>
        <div class="row mt-4">

            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">Book ID</label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9">
                <input type="text" maxlength="50" id="txt_bookID" runat="server" tabindex="1" placeholder="..............................................." class="txt_bookid BlankText   isbn all-border border-bottom-2 font-12 width-100">
            </div>
            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">ISBN</label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9">
                <input type="text" maxlength="13" id="txt_isbn" runat="server" tabindex="-1" readonly="readonly" placeholder="..............................................." class="    isbn all-border border-bottom-2 font-12 width-100">
            </div>

            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">Title</label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9">
                <input type="text" maxlength="100" id="txt_title" runat="server" tabindex="-1" readonly="readonly" placeholder="..............................................." class="   all-border border-bottom-2 font-12 width-100">
            </div>
            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">Sub-Title</label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9">
                <input type="text" maxlength="500" id="txt_subtitle" runat="server" tabindex="-1" readonly="readonly" placeholder="..............................................." autocomplete="off" class="   all-border border-bottom-2 font-12 width-100">
            </div>
            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">Edition</label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9">
                <input type="text" maxlength="500" id="txt_edition" runat="server" tabindex="-1" readonly="readonly" placeholder="..............................................." autocomplete="off" class="   all-border border-bottom-2 font-12 width-100">
            </div>
            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">Publisher</label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9">
                <input type="text" maxlength="500" id="txt_publisher" runat="server" tabindex="-1" readonly="readonly" placeholder="..............................................." autocomplete="off" class="   all-border border-bottom-2 font-12 width-100">
            </div>
            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">Author</label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9">
                <input type="text" maxlength="500" id="txt_author" runat="server" tabindex="-1" readonly="readonly" placeholder="..............................................." autocomplete="off" class="   all-border border-bottom-2 font-12 width-100">
            </div>
            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">Category</label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9">
                <input type="text" maxlength="500" id="txt_category" runat="server" tabindex="-1" readonly="readonly" placeholder="..............................................." autocomplete="off" class="   all-border border-bottom-2 font-12 width-100">
            </div>
        </div>
    </section>

    <section class="table-background">
        <div class="table-responsive">
            <table class="table table-striped" id="tbl_Book">
                <thead class="thead-background">
                    <tr>
                        <th class="table-bolder">#</th>
                        <th class="table-bolder">Date</th>
                        <th class="table-bolder">Action Type</th>
                        <th class="table-bolder">Issued User Type </th>
                        <th class="table-bolder">Issued User</th>
                        <th class="table-bolder">Issued By</th>
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
            DataBind(0);
        });

        function DataBind(id) {
            $.ajax({
                type: "POST",
                url: 'booktransitreport.aspx/getIssuedBooks',
                data: "{'id':'" + id + "'}",
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
                columns: [{ data: 'row', sortable: true, searchable: false },
                { data: 'date', sortable: true, searchable: true },
                { data: 'actiontype', sortable: true, searchable: true },
                { data: 'issuedusertype', sortable: true, searchable: true },
                { data: 'issueduser', sortable: true, searchable: true },
                { data: 'issuedby', sortable: true, searchable: true }
                ],
                "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
                    if (aData.actiontype == "Issue") {
                        $('td', nRow).css('background-color', '#e5fdf5');
                    }
                    else if (aData.actiontype == "Scrap") {
                        $('td', nRow).css('background-color', '#F3D2CB');
                    } else if (aData.actiontype == "Return") {
                        $('td', nRow).css('background-color', '#6ec1a9');
                    }
                },
            });
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





        $(document).on('change', '#<%=txt_bookID.ClientID%>', function () {
            var bookid = $(this).val();

            var EditBook = jqPost("booktransitreport.aspx/getBookDetails", "{'bookid':'" + bookid + "'}");
            console.log(EditBook)
            if (EditBook != null && EditBook.Table1.length > 0) {
                $('#<%=hdn_bookStock.ClientID%>').val(EditBook.Table1[0].bookstockdet_kid);
                $('#<%=txt_isbn.ClientID%>').val(EditBook.Table1[0].book_isbn13);
                $('#<%=txt_title.ClientID%>').val(EditBook.Table1[0].book_title);
                $('#<%=txt_subtitle.ClientID%>').val(EditBook.Table1[0].book_subtitle);
                $('#<%=txt_edition.ClientID%>').val(EditBook.Table1[0].bookstockdet_edition);
                $('#<%=txt_author.ClientID%>').val(EditBook.Table1[0].book_authors);
                $('#<%=txt_category.ClientID%>').val(EditBook.Table1[0].book_category);
                $('#<%=txt_publisher.ClientID%>').val(EditBook.Table1[0].book_publisher);
                DataBind(EditBook.Table1[0].bookstockdet_kid);
            }
            else {
                MsgArray[0] = "Book is not available.";
                MsgColor(true);
                MsgAlert();
                $('#<%=txt_bookID.ClientID%>').val("");
                $('#<%=hdn_bookStock.ClientID%>').val("");
                $('#<%=txt_isbn.ClientID%>').val("");
                $('#<%=txt_title.ClientID%>').val("");
                $('#<%=txt_subtitle.ClientID%>').val("");
                $('#<%=txt_edition.ClientID%>').val("");
                $('#<%=txt_author.ClientID%>').val("");
                $('#<%=txt_category.ClientID%>').val("");
                $('#<%=txt_publisher.ClientID%>').val("");
                $('#<%=txt_bookID.ClientID%>').focus();
                DataBind(0);
            }

        });







    </script>
</asp:Content>
