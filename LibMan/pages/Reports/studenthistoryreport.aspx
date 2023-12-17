<%@ Page Title="Student History Report - Lib-Man" Language="C#" MasterPageFile="/pages/Admin/Dashboard/Admin.Master" AutoEventWireup="true" CodeBehind="studenthistoryreport.aspx.cs" EnableEventValidation="false" Inherits="LibMan.pages.Reports.studenthistoryreport" %>

<%@ Register Src="~/pages/Partial/Popup.ascx" TagName="Popup" TagPrefix="Partial" %>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <input type="hidden" runat="server" id="hdn_id" />
    <input type="hidden" runat="server" id="hdn_userkid" />
    <asp:HiddenField Value="" runat="server" ID="hdn_bookStock" />
    <section class="mb-2">
        <div class="row  border-bottom-1">

            <div class="col-md-9 col-sm-8 col-8 mt-3">
                <h3 id="Book_head" class="heading-modal">Student History Report </h3>
            </div>

        </div>
        <div class="row mt-4">

            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">Student ID</label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9">
                <input type="text" maxlength="50" id="txt_studentID" runat="server" tabindex="1" placeholder="..............................................." class="txt_bookid BlankText   isbn all-border border-bottom-2 font-12 width-100">
            </div>
            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">Name</label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9">
                <input type="text" maxlength="13" id="txt_name" runat="server" tabindex="-1" readonly="readonly" placeholder="..............................................." class="    isbn all-border border-bottom-2 font-12 width-100">
            </div>

            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">Course</label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9">
                <input type="text" maxlength="100" id="txt_course" runat="server" tabindex="-1" readonly="readonly" placeholder="..............................................." class="   all-border border-bottom-2 font-12 width-100">
            </div>
            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">Branch</label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9">
                <input type="text" maxlength="500" id="txt_branch" runat="server" tabindex="-1" readonly="readonly" placeholder="..............................................." autocomplete="off" class="   all-border border-bottom-2 font-12 width-100">
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
                        <th class="table-bolder">Book Id</th>
                        <th class="table-bolder">Title</th>
                        <th class="table-bolder">Sub-Title</th>
                        <th class="table-bolder">ISBN</th>
                        <th class="table-bolder">Edition </th>
                        <th class="table-bolder">Publisher</th>
                        <th class="table-bolder">Authors</th>
                        <th class="table-bolder">Category</th>
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
                url: 'studenthistoryreport.aspx/getIssuedBooks',
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
                    { data: 'bookstockdet_bookrefID', sortable: true, searchable: true },
                    { data: 'book_title', sortable: true, searchable: true },
                    { data: 'book_subtitle', sortable: true, searchable: true },
                    { data: 'book_isbn13', sortable: true, searchable: true },
                    { data: 'bookstockdet_edition', sortable: true, searchable: true },
                    { data: 'book_publisher', sortable: true, searchable: true },
                    { data: 'book_authors', sortable: true, searchable: true },
                    { data: 'book_category', sortable: true, searchable: true }
                ],
                "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
                    if (aData.actiontype == "Issue") {
                        if (aData.status == "I") {
                            $('td', nRow).css('background-color', '#E3C0B9');
                        } else {
                            $('td', nRow).css('background-color', '#e5fdf5');
                        }
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





        $(document).on('change', '#<%=txt_studentID.ClientID%>', function () {
            var stid = $(this).val();

            var EditBook = jqPost("studenthistoryreport.aspx/getStudentDetails", "{'stid':'" + stid + "'}");
            console.log(EditBook)
            if (EditBook != null && EditBook.Table1.length > 0) {
                $('#<%=hdn_id.ClientID%>').val(EditBook.Table1[0].student_kid);
                $('#<%=txt_name.ClientID%>').val(EditBook.Table1[0].student_name);
                $('#<%=txt_course.ClientID%>').val(EditBook.Table1[0].course_name);
                $('#<%=txt_branch.ClientID%>').val(EditBook.Table1[0].branch_name);
                DataBind(EditBook.Table1[0].student_kid);
            }
            else {
                MsgArray[0] = "Student is not available.";
                MsgColor(true);
                MsgAlert();
                $('#<%=hdn_id.ClientID%>').val("");
                $('#<%=txt_name.ClientID%>').val("");
                $('#<%=txt_course.ClientID%>').val("");
                $('#<%=txt_branch.ClientID%>').val("");
                $('#<%=txt_studentID.ClientID%>').val("");
                $('#<%=txt_studentID.ClientID%>').focus();
                DataBind(0);
            }

        });







    </script>
</asp:Content>
