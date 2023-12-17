<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Popup1.ascx.cs" Inherits="LibMan.pages.Partial.Popup1" %>

                                        <%--This user control doesnot reload Page onb close--%>
<section>
    <div class="modal" id="Popup">
        <div class="modal-dialog13 modal-dialog-centered">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <p class="modal-title text-center m-auto"></p>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    <section>
                        <iframe class="PopupIframe">

                        </iframe>
                    </section>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
  
</script>