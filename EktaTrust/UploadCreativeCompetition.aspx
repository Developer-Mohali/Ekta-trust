<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="UploadCreativeCompetition.aspx.vb" Inherits="EktaTrust.UploadCreativeCompetition" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-group label { font-weight: 700; }
        .ordinal { font-size: small; position: relative; top: -0.5em; text-transform: capitalize; }
        .img-responsive { display: block; height: auto; margin-top: 90px; max-width: 100%; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <h2 class="wow fadeInDown">Uploads for 3<span class="ordinal">rd</span> Ekta Creative Competition 2025</h2>

        <div class="row contact-wrap wow fadeInDown">
            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                <span style="color: green; font-weight: bold"><asp:Label ID="lblSuccess" runat="server"></asp:Label></span>
                <span style="color: red; font-weight: bold"><asp:Label ID="lblError" runat="server"></asp:Label></span>

                <!-- Mobile Search -->
                <div class="form-group">
                    <label for="txtMobile">Mobile Number</label>
                    <div class="form-group d-flex align-items-center">
                        <input type="text" id="txtMobile" class="form-control" placeholder="Enter mobile number" maxlength="10" pattern="\d{10}" />
                        <button class="btn btn-primary" id="btnSearchMobile" type="button" style="margin-top: 1rem; margin-right: 0.5rem;">Search</button>
                        <a href="../EktaCreativeCompetition2025.aspx" class="btn btn-success" style="margin-top: 1rem;">Back to Creative Competition</a>
                    </div>
                </div>

                <!-- User Details -->
                <div id="userDetails" style="display: none;">
                    <div class="form-group"><label>Name: <span id="lblName"></span></label></div>
                    <div class="form-group"><label>Email: <span id="lblEmail"></span></label></div>
                    <div class="form-group"><label>Mobile: <span id="lblMobile"></span></label></div>
                    <div class="form-group"><label>Contest: <span id="lblContest"></span></label></div>
                    <div class="form-group"><label>Address: <span id="lblAddress"></span></label></div>

                    <!-- Hidden fields for registration ID and mobile -->
                    <asp:HiddenField ID="hdnIDClient" runat="server" />
                    <asp:HiddenField ID="hdnMobileClient" runat="server" />

                    <!-- File Upload -->
                    <div class="form-group" style="margin-top: 2rem;">
                        <label for="FileUpload">Upload File (PDF, Image, Video)</label>
                        <asp:FileUpload ID="FileUpload" runat="server" CssClass="form-control-file" />
                        <small class="form-text text-muted">Allowed: PDF, Images, Video (Max 1 GB)</small>
                    </div>

                    <!-- Message -->
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

                    <div class="form-group mt-4">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success btn-lg" OnClick="btnSubmit_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script>
        // Only digits for mobile
        $("#txtMobile").on("keypress", function (e) {
            var charCode = e.which ? e.which : e.keyCode;
            if (charCode < 48 || charCode > 57) e.preventDefault();
        });
        $("#txtMobile").on("paste", function (e) {
            var pasteData = (e.originalEvent || e).clipboardData.getData('text/plain');
            if (/[^0-9]/.test(pasteData)) e.preventDefault();
        });

        // AJAX Mobile Search
        $("#btnSearchMobile").click(function () {
            debugger
            var mobile = $("#txtMobile").val().trim();
            if (mobile.length !== 10) { alert("Enter a valid 10-digit number."); return; }

            $.ajax({
                type: "POST",
                url: "UploadCreativeCompetition.aspx/CheckMobile",
                data: JSON.stringify({ mobile: mobile }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var data = response.d;
                    if (data.success) {
                        $("#lblName").text(data.Name);
                        $("#lblEmail").text(data.Email);
                        $("#lblMobile").text(data.Mobile);
                        $("#lblContest").text(data.Contest);
                        $("#lblAddress").text(data.Address);
                        $("#<%= hdnIDClient.ClientID %>").val(data.ID);
                        $("#<%= hdnMobileClient.ClientID %>").val(data.Mobile);
                        $("#userDetails").show();
                    } else {
                        alert(data.message);
                        $("#userDetails").hide();
                    }
                },
                error: function (xhr) {
                    console.error(xhr.responseText);
                    alert("Internal Server Error.");
                }
            });
        });
    </script>
</asp:Content>
