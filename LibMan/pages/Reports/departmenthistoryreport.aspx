<%@ Page Title="Department History  Report - Lib-Man" Language="C#" MasterPageFile="/pages/Admin/Dashboard/Admin.Master" AutoEventWireup="true" CodeBehind="departmenthistoryreport.aspx.cs" EnableEventValidation="false" Inherits="LibMan.pages.Reports.departmenthistoryreport" %>

<%@ Register Src="~/pages/Partial/Popup.ascx" TagName="Popup" TagPrefix="Partial" %>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <input type="hidden" runat="server" id="hdn_id" />
    <input type="hidden" runat="server" id="hdn_userkid" />
    <asp:HiddenField Value="" runat="server" ID="hdn_bookStock" />
    <section class="mb-2">
        <div class="row  border-bottom-1">

            <div class="col-md-9 col-sm-8 col-8 mt-3">
                <h3 id="Book_head" class="heading-modal">Department History Report </h3>
            </div>

        </div>
        <div class="row mt-4">

            <div class="col-md-1 mt-1 col-sm-3">
                <label class="input-label-modal">Department </label>
            </div>
            <div class="col-md-2 mt-1 col-sm-9">
                 <asp:DropDownList ID="ddl_dept" CssClass="ddl_dept BlankSelect form-control all-border border-bottom-2 font-12" runat="server" TabIndex="1"></asp:DropDownList>
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
                url: 'departmenthistoryreport.aspx/getIssuedBooks',
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





        $(document).on('change', '#<%=ddl_dept.ClientID%>', function () {
            var stid = $(this).val();
            DataBind(stid);

        });







    </script>
</asp:Content>
