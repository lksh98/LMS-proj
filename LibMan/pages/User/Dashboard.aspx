<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="LibMan.pages.User.Dashboard" MasterPageFile="~/pages/Admin/Dashboard/Admin.Master" Title="Dashboard - Lib-Man" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <style>
        .dr-scroll {
            max-height: 400px;
            overflow: auto;
        }
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="owl-carousel owl-theme dashCountBox">
    </div>


</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder_BottomScripts" runat="server">

    <script type="text/javascript">
       

    </script>

</asp:Content>

