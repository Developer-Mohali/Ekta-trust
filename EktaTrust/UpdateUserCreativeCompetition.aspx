<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Inner.Master" CodeBehind="UpdateUserCreativeCompetition.aspx.vb" Inherits="EktaTrust.UpdateUserCreativeCompetition" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<%@ Register Src="~/Controls/AdminSideMenuControl.ascx" TagPrefix="ucSM" TagName="AdminSideMenuControl" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid main-container">
        <div class="col-md-2 sidebar">
            <div class="row">
                <!-- uncomment code for absolute positioning tweek see top comment in css -->
                <div class="absolute-wrapper"></div>
                <!-- Menu -->
                <ucSM:AdminSideMenuControl runat="server" ID="AdminSideMenuControl" />
            </div>
        </div>
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title" style="height: 30px; padding-bottom: 28px; font-size: 17px; color: #fff;"><b>Update 3<span class="ordinal">rd</span> Ekta Creative Competition 2025 Registration</b></h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <span style="color: green; font-weight: bold">
                                <asp:Label ID="lblErrorMsg" runat="server"></asp:Label>
                            </span>
                            <span style="color: red; font-weight: bold">
                                <asp:Label ID="lblErrorMsgMobile" runat="server"></asp:Label>
                            </span>

                            <!-- Name -->
                            <div class="form-group">
                                <label style="color: #777">Name</label>
                                <asp:TextBox ID="textName" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="textName"
                                    ForeColor="Red" ErrorMessage="Please Enter Name." ToolTip="Please Enter Name" />
                                <asp:RegularExpressionValidator runat="server" ControlToValidate="textName"
                                    ValidationExpression="[a-zA-Z ]*$" ErrorMessage="Only alphabets allowed." ForeColor="Red" />
                            </div>

                            <!-- Email -->
                            <div class="form-group">
                                <label style="color: #777">Email Address</label>
                                <asp:TextBox ID="textEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RegularExpressionValidator runat="server" ControlToValidate="textEmail"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ForeColor="Red" ErrorMessage="Enter valid email." />
                            </div>

                            <!-- Mobile -->
                            <div class="form-group">
                                <label style="color: #777">Mobile Number</label>
                                <asp:TextBox ID="textMobile" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="textMobile"
                                    ForeColor="Red" ErrorMessage="Please enter mobile." />
                                <asp:RegularExpressionValidator runat="server" ControlToValidate="textMobile"
                                    ForeColor="Red" ErrorMessage="10 digits only." ValidationExpression="^[0-9]{10}$" />
                            </div>

                            <!-- Contest -->
                            <div class="form-group">
                                <label style="color: #777">Contest</label>
                                <asp:DropDownList ID="drpContest" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0">---Select Value---</asp:ListItem>
                                    <asp:ListItem Value="1">Painting for Adults</asp:ListItem>
                                    <asp:ListItem Value="2">Sketch Drawing for Children</asp:ListItem>
                                    <asp:ListItem Value="3">Essay for Adults</asp:ListItem>
                                    <asp:ListItem Value="4">Essay for Children</asp:ListItem>
                                    <asp:ListItem Value="5">Speech for Adults</asp:ListItem>
                                    <asp:ListItem Value="6">Fancy Dress Competition for Kids</asp:ListItem>
                                    <asp:ListItem Value="7">Songs for Adults</asp:ListItem>
                                    <asp:ListItem Value="8">Reels for Adults</asp:ListItem>
                                    <asp:ListItem Value="9">Book Review for Adults</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="drpContest" InitialValue="0"
                                    ForeColor="Red" ErrorMessage="Please select contest." />
                            </div>

                            <!-- Address -->
                            <div class="form-group">
                                <label style="color: #777">Address</label>
                                <asp:TextBox ID="TextAddress" runat="server" TextMode="MultiLine" Rows="5"
                                    CssClass="form-control"></asp:TextBox>
                            </div>

                            <!-- File Upload -->
                            <div class="form-group">
                                <label style="color: #777">Upload Files</label>
                                <asp:FileUpload ID="FileUpload" runat="server" CssClass="form-control" AllowMultiple="true" />
                                <small class="form-text text-muted">Allowed: File (Max 1 GB)</small>
                                <asp:Literal ID="litExistingFiles" runat="server"></asp:Literal>
                                <asp:Label ID="lblFileError" runat="server" ForeColor="Red" Visible="false"></asp:Label>
                            </div>

                            <!-- Buttons -->
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:Button ID="ButtonSubmitMessage" runat="server" CssClass="btn btn-primary btn-lg btn-block"
                                            Text="Update Registration" OnClick="UpdateRegistration" />
                                    </div>
                                    <div class="col-md-6">
                                        <a href="../CreativeCompetitionRegistered.aspx" class="btn btn-default btn-lg btn-block">Back</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 🔹 Loader Spinner -->
    <div id="loaderOverlay" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.7); z-index: 9999; justify-content: center; align-items: center; flex-direction: column;">
        <div style="border: 8px solid #f3f3f3; border-top: 8px solid #007bff; border-radius: 50%; width: 80px; height: 80px; animation: spin 1s linear infinite;">
        </div>
        <div style="color: #fff; margin-top: 15px; font-size: 18px; font-weight: 500;">Please wait, updating...</div>
    </div>

    <style>
        .ordinal {
            font-size: small;
            position: relative;
            top: -0.5em;
            text-transform: capitalize;
        }

        .panel-primary > .panel-heading {
            font-size: 17px;
            color: #fff;
            background-color: #428bca;
            border-color: #428bca;
        }

        .main-container {
            margin-top: 20px;
        }

        .sidebar {
            background-color: #f8f9fa;
            padding: 15px;
            border-right: 1px solid #dee2e6;
        }

        .btn-block {
            width: 100%;
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }
    </style>

    <script type="text/javascript">
        $(document).ready(function () {
            var mobileBox = $("#<%= textMobile.ClientID %>");

            mobileBox.on("keypress", function (e) {
                var charCode = e.which ? e.which : e.keyCode;
                if (charCode < 48 || charCode > 57) {
                    e.preventDefault();
                }
            });

            mobileBox.on("paste", function (e) {
                var pasteData = (e.originalEvent || e).clipboardData.getData('text/plain');
                if (/[^0-9]/.test(pasteData)) {
                    e.preventDefault();
                }
            });

            if (!Page_IsValid) {
                e.preventDefault();
                $("#progressContainer").hide();
                $("#progressBar").css("width", "0%");
                return false;
            }
            function showLoader() {
                document.getElementById("loaderOverlay").style.display = "flex";
            }

            function hideLoader() {
                document.getElementById("loaderOverlay").style.display = "none";
            }

            $(document).ready(function () {
                $("#<%= ButtonSubmitMessage.ClientID %>").on("click", function (e) {
                     // Run ASP.NET client-side validation
                     if (typeof (Page_ClientValidate) === 'function') {
                         Page_ClientValidate();
                     }

                     // 🔹 Only show loader if page is valid
                     if (Page_IsValid) {
                         showLoader();
                     } else {
                         hideLoader();
                         e.preventDefault();
                         return false;
                     }
                 });
             });
        });
    </script>

</asp:Content>
