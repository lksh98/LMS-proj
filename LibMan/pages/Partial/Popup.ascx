<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Popup.ascx.cs" Inherits="LibMan.pages.Partial.Popup" %>
<style>
    .modal-dialog100 {
        max-width: 100%;
    }
    .PopupIframe {
    width: 100%;
    height: calc(100vh - 75px);
}
</style>
<section>
    <div class="modal" id="Popup">
        <div class="modal-dialog100 modal-dialog-centered">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <p class="modal-title text-center m-auto"></p>
                    <button type="button" class="close" data-dismiss="modal" onclick="PopClose();">&times;</button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    <section>
                        <iframe class="PopupIframe"></iframe>
                    </section>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    function PopClose() {
        window.location = window.location.href;
    }
</script>
