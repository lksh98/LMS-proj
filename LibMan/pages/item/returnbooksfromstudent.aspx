﻿<%@ Page Title="Return Books from Student - Lib-Man" Language="C#" MasterPageFile="/pages/Admin/Dashboard/Admin.Master" AutoEventWireup="true" CodeBehind="returnbooksfromstudent.aspx.cs" EnableEventValidation="false" Inherits="LibMan.pages.item.returnbooksfromstudent" %>

<%@ Register Src="~/pages/Partial/Popup.ascx" TagName="Popup" TagPrefix="Partial" %>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <input type="hidden" runat="server" id="hdn_id" />
    <input type="hidden" runat="server" id="hdn_issueID" />
    <input type="hidden" runat="server" id="hdn_userkid" />
    <asp:HiddenField Value="" runat="server" ID="hdn_bookStock" />
    <section class="mb-2">
        <div class="row  border-bottom-1 pb-0">

            <div class="col-md-9 col-sm-8 col-8">
                <h3 id="Book_head" class="heading-modal">Return Books from Student </h3>
            </div>

        </div>
        <div class="row mt-4">
            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">Student ID </label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9">
                <input type="text" maxlength="50" id="txt_studentID" runat="server" tabindex="1" placeholder="..............................................." class="txt_studentID BlankText   isbn all-border border-bottom-2 font-12 width-100">
            </div>
            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">Student Name </label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9">
                <input type="text" maxlength="50" id="txt_studentname" readonly="readonly" runat="server" tabindex="-1" placeholder="..............................................." class="txt_studentname       all-border border-bottom-2 font-12 width-100">
            </div>
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
                <label class="input-label-modal">Edition</label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9">
                <input type="text" maxlength="500" id="txt_edition" runat="server" tabindex="-1" readonly="readonly" placeholder="..............................................." autocomplete="off" class="   all-border border-bottom-2 font-12 width-100">
            </div>
            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">Return Date </label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9">
                <input type="text" maxlength="500" id="txt_rdate" runat="server" tabindex="-1" readonly="readonly" placeholder="..............................................." autocomplete="off" class="   all-border border-bottom-2 font-12 width-100">
            </div>
            <div class="col-md-1 mt-1 col-sm-3 isfine d-none">
                <label class="input-label-modal">Fine Amount</label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9 isfine d-none">
                <input type="text" maxlength="500" id="txt_fine" runat="server" tabindex="-1" readonly="readonly" value="0" placeholder="..............................................." autocomplete="off" class="decimal text-right all-border border-bottom-2 font-12 width-100">
            </div>

            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">Remarks</label>
            </div>
            <div class="col-md-5 mt-1 col-sm-9">
                <input type="text" maxlength="500" id="txt_remark" runat="server" tabindex="-1" placeholder="..............................................." autocomplete="off" class="   all-border border-bottom-2 font-12 width-100">
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
                        <th class="table-bolder">ISBN </th>
                        <th class="table-bolder">Edition</th>
                        <th class="table-bolder">Publisher</th>
                        <th class="table-bolder">Issue Date</th>
                        <th class="table-bolder">Tentative Return Date</th>
                        <th class="table-bolder">Issued By</th>
                        <th class="table-bolder">Fine Amount</th>
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
        <%--$(document).on('change', '#<%=txt_studentID.ClientID%>', DataBind);--%>

        function DataBind(id) {
            $.ajax({
                type: "POST",
                url: 'returnbooksfromstudent.aspx/getIssuedBooks',
                data: "{'StudentID':'" + id + "'}",
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
                { data: 'book_isbn13', sortable: true, searchable: true },
                { data: 'bookstockdet_edition', sortable: true, searchable: true },
                { data: 'book_publisher', sortable: true, searchable: true },
                { data: 'issueTostudent_issuedate', sortable: true, searchable: true },
                { data: 'issueTostudent_rdate', sortable: true, searchable: true },
                { data: 'usr_name', sortable: true, searchable: true },
                { data: 'fine', sortable: true, searchable: true }
                ],
                "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
                    if (aData.issueTostudent_status == "I") {
                        if (aData.Late == 'L') {
                            $('td', nRow).css('background-color', '#F3D2CB');
                        }
                        else {
                            $('td', nRow).css('background-color', '#e5fdf5');
                        }
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
                DataBind($('#<%=hdn_id.ClientID%>').val());

                //$("#Popup").modal('show');
                //$('#Popup p').text('Print Stock');
                //$('.PopupIframe').attr("src", '/PDFHelper/PdfPresSave.aspx?PageID=1&id=' + id);

            }
            else if (result == "2") {
                MsgArray[0] = "Maximum book issued.";
                MsgColor(true);
                MsgAlert();
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
            $('#<%=txt_edition.ClientID%>').val('');
            $('#<%=txt_rdate.ClientID%>').val("");
            $('#<%=txt_fine.ClientID%>').val("");
            $('#<%=hdn_issueID.ClientID%>').val("");
            $('#<%=txt_remark.ClientID%>').val("");
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
            if (Fn_Save()) {
                if ($('#<%=txt_fine.ClientID%>').val() != "" && $('#<%=txt_fine.ClientID%>').val() != "0") {
                    swal({
                        text: "Fine Applicable",
                        title: `₹ ${$('#<%=txt_fine.ClientID%>').val()}`,
                        showCancelButton: true,
                        type: "warning",
                        confirmButtonColor: "#015184",
                        confirmButtonText: "Yes",
                        cancelButtonText: "No"
                    },
                        function (isConfirm) {
                            if (isConfirm) {
                                var EditBook = jqPost("returnbooksfromstudent.aspx/saveBook", "{ 'issueID':'" + $('#<%=hdn_issueID.ClientID%>').val() + "','remark':'" + $('#<%=txt_remark.ClientID%>').val() + "','fine':'" + $('#<%=txt_fine.ClientID%>').val() + "'}");
                                if (EditBook != null && EditBook.Table1.length > 0) {
                                    Save(EditBook.Table1[0].val, EditBook.Table1[0]?.ID);
                                }
                            }
                        }
                    );
                }
                else {
                    var EditBook = jqPost("returnbooksfromstudent.aspx/saveBook", "{ 'issueID':'" + $('#<%=hdn_issueID.ClientID%>').val() + "','remark':'" + $('#<%=txt_remark.ClientID%>').val() + "','fine':'" + $('#<%=txt_fine.ClientID%>').val() + "'}");
                    if (EditBook != null && EditBook.Table1.length > 0) {
                        Save(EditBook.Table1[0].val, EditBook.Table1[0]?.ID);
                    }
                }



            }
        });



        $(document).on('change', '#<%=txt_bookID.ClientID%>', function () {
            var bookid = $(this).val();
            var txt_studentID = $('#<%=txt_studentID.ClientID%>').val();

            var EditBook = jqPost("returnbooksfromstudent.aspx/getBookDetails", "{'bookid':'" + bookid + "','StudentID':'" + txt_studentID + "'}");
            console.log(EditBook)
            if (EditBook != null && EditBook.Table1.length > 0) {
                $('#<%=hdn_bookStock.ClientID%>').val(EditBook.Table1[0].bookstockdet_kid);
                $('#<%=txt_isbn.ClientID%>').val(EditBook.Table1[0].book_isbn13);
                $('#<%=txt_title.ClientID%>').val(EditBook.Table1[0].book_title);
                $('#<%=txt_subtitle.ClientID%>').val(EditBook.Table1[0].book_subtitle);
                $('#<%=txt_edition.ClientID%>').val(EditBook.Table1[0].bookstockdet_edition);
                $('#<%=txt_rdate.ClientID%>').val(EditBook.Table1[0].issueTostudent_rdate);
                $('#<%=txt_fine.ClientID%>').val(EditBook.Table1[0].fine);
                $('#<%=hdn_issueID.ClientID%>').val(EditBook.Table1[0].issueTostudent_kid);
                if (!isNaN(EditBook.Table1[0].fine) && parseFloat(EditBook.Table1[0].fine) > 0) {
                    $('.isfine').removeClass('d-none');
                }
                else {
                    $('.isfine').addClass('d-none');
                }
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
                $('#<%=txt_edition.ClientID%>').val("");
                $('#<%=txt_rdate.ClientID%>').val("");
                $('#<%=txt_fine.ClientID%>').val("");
                $('#<%=hdn_issueID.ClientID%>').val("");
                $('.isfine').addClass('d-none');
            }

        });

        $(document).on('change', '#<%=txt_studentID.ClientID%>', function () {
            var txt_studentID = $(this).val();

            var EditBook = jqPost("returnbooksfromstudent.aspx/getStudentDetails", "{'StudentID':'" + txt_studentID + "'}");
            console.log(EditBook)
            if (EditBook != null && EditBook.Table1.length > 0) {
                $('#<%=hdn_id.ClientID%>').val(EditBook.Table1[0].student_kid);
                $('#<%=txt_studentname.ClientID%>').val(EditBook.Table1[0].student_name);
                DataBind(EditBook.Table1[0].student_kid)
            }
            else {
                MsgArray[0] = "Student ID does not exists.";
                MsgColor(true);
                MsgAlert();
                $('#<%=hdn_id.ClientID%>').val('');
                $('#<%=txt_studentID.ClientID%>').val("");
                $('#<%=txt_studentname.ClientID%>').val("");
                DataBind(0)
            }

        });





    </script>
</asp:Content>
