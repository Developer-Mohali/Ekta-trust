<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master"  CodeBehind="JoinUs.aspx.vb" Inherits="EktaTrust.JoinUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .about-us h3 {
            color:black !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="about-us">
        <div class="container">
            <h2 class="wow fadeInDown">Join Us</h2>
            <div class="row contact-wrap  wow fadeInDown">
            <img src="images/joinus2.jpg" class="img-responsive wow fadeInDown pull-right hidden-sm hidden-xs hidden-md" alt="" /> 
                <div class="status alert alert-success" style="display: none"></div>
                <%--<form id="main-contact-form" class="contact-form" name="contact-form" method="post" action="sendemail.php">--%>
                <span style="color: green; font-weight: bold">
                             <asp:Label ID="lblErrorMsg" runat="server"></asp:Label></span>
                <div id="divMobileConfirmation" class="col-lg-6 col-md-12 col-sm-12 col-xs-12"> 
                        <br />
                        <h3 class="fs-title">Mobile No Confirmation</h3>
                        <br />
                    <input type="hidden" id="random" value="0" />

                        <!----fields for mobile number--->
                    <div class="form-group">
                            <input type="text" class="form-control" id="txtMobile" maxlength="10" name="txtMobile" placeholder="Enter mobile number" />
                            <span id="phoneError" style="color: red"></span>
                    </div>
                        
                    <div class="form-group">
                            <input type="text" class="form-control" maxlength="6" id="txtOtpMobile" name="txtOtpMobile" placeholder="Enter OTP" />
                            <span id="OtpError" style="color: red"></span>
                    </div>

                    <div class="row">
                         <div class="form-group col-sm-6">
                            <input type="button" id="otpgenerateForMobile" onclick="GetOTPNumber('Mobile', $('#txtMobile').val());" name="submit" class="btn-success form-control" value="Generate OTP" />
                        </div>
                        <div class="form-group col-sm-6">
                            <input type="button" name="next" class="btn-success form-control" onclick="CheckValidation();" value="Next" />
                        </div>
                    </div>
                </div>

                <div id="divJoinUsDetails" class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                         
                        <div class="form-group">
                            <label>Name  <asp:RequiredFieldValidator runat="server" id="reqName" controltovalidate="textName" ForeColor="Red" ErrorMessage="*"  ToolTip="Please Enter Your Name" /></label>
                             <asp:TextBox ID="textName" runat="server" class="form-control"></asp:TextBox>
                       </div>
                        <div class="form-group">
                            <label>Email <asp:RequiredFieldValidator runat="server" id="reqEmail" controltovalidate="textEmail" ForeColor="Red" ErrorMessage="*"  ToolTip="Please Enter EmailId" /></label>
                             <asp:TextBox ID="textEmail" runat="server" class="form-control"></asp:TextBox>                        
                        <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="textEmail" ForeColor="Red" ErrorMessage="Please enter valid email id format." />
                        </div>
                        <div class="form-group">
                            <label>Address  <asp:RequiredFieldValidator runat="server" id="reqAddress" controltovalidate="textAddress" ForeColor="Red" ErrorMessage="*"  ToolTip="Please Enter Your Address" /></label>
                             <asp:TextBox ID="textAddress" runat="server" class="form-control"></asp:TextBox>
                           
                        </div>
                        <div class="form-group">
                            <label>Occupation/Designation </label> 
                             <asp:TextBox ID="textDesignation" runat="server" class="form-control"></asp:TextBox>
                           
                        </div> 
                           <div class="form-group">
                            <label>Mobile  <asp:RequiredFieldValidator runat="server" id="reqMobile" controltovalidate="textMobile" ForeColor="Red" ErrorMessage="*"  ToolTip="Please Enter Mobile Number" /></label>
                                <asp:TextBox ID="textMobile" runat="server" class="form-control"></asp:TextBox>
                              
                         <asp:CustomValidator ID="CustomValidatorMobile" runat="server" ForeColor="Red" ErrorMessage="Please enter numeric values."
                           OnServerValidate="Validate_Numeric" ControlToValidate="textMobile"></asp:CustomValidator>
                           </div><div class="form-group">
                            <label>Message </label>
                             <asp:TextBox ID="textMessage" runat="server" Rows="5" Columns="40" TextMode="multiline" class="form-control"></asp:TextBox>
                            
                        </div>  <div class="form-group">
                            <asp:Button ID="ButtonSubmitMessage" runat="server" class="btn btn-primary btn-lg"  Text="Submit Message" OnClick="ButtonSubmitMessage_Click" />
                            
                        </div>                    
                    </div>
                   
            </div><!--/.row-->
      
  </div>
    </div>
  <!--/.container--><!--/#main-slider-->


<section id="bottom">
  <div class="container wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
    <div class="row">
      <div class="col-md-7">
        <div class="widget">
          <h3>News and Updates</h3>
          <ul>
            <li><a href="News">Ekta Navnirman Trust Charitable work in Rajasthan: A short update of activities.</a></li>
            <li><a href="News">Ekta Navnirman Trust further plans.</a></li>
            <li><a href="News">Ekta Navnirman Trust Latest Decision.</a></li>
            <li><a href="News">Ekta Navnirman Trust launches Skill Training Programme.</a></li>
            <li><a href="News">Stipend Announcement for Skill Training.</a></li>
          </ul>
        </div>
      </div>
      <!--/.col-md-3--><!--/.col-md-3--><!--/.col-md-3--><!--/.col-md-3-->
      
    <div class="col-md-5">
                        <address class="text-white">
                            <div class="pull-right"><a href="#"><i class="fa fa-telegram"></i></a><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a></div>
                           <strong>Ekta Navnirman Trust,</strong><br />
                             B-15, Pragati Path, Bajaj Nagar,<br />
                             Jaipur, Rajasthan-302015
                            <br />
                            <br />
                            <img src="Images/logo-small.jpg" class="img-responsive pull-right" alt="" />
                            <%--<img src="Images/logo-small1.png" class="img-responsive pull-right" alt="">--%>
                            <br />
                            <strong>Contact Us</strong><br />
                             Whatsapp <a href="#" class="fa fa-whatsapp"></a> : +91-7877664078 <br />
                           <%-- Call <a href="#" class="fa fa-phone"></a> : <a href="tel:+91-9660037537">+91-9660037537</a> <br />
                            Call <a href="#" class="fa fa-phone"></a> : <a href="tel:+91-9001716311">+91-9001716311</a> <br />--%>
                           Email Id <a href="ektanavnirmantrust@gmail.com" class="fa fa-envelope"></a> : <a href="mailto:ektanavnirmantrust@gmail.com">ektanavnirmantrust@gmail.com</a>
                           
                            <br />
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                <asp:TextBox runat="server" group="email" ID="txtSignupEmail" class="form-control" placeholder="Sign For Updates"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" group="email" ControlToValidate="txtSignupEmail" ForeColor="Red" ErrorMessage="*" ToolTip="Please Enter EmailId" />
                            <asp:RegularExpressionValidator runat="server" Display="Dynamic" group="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ControlToValidate="txtSignupEmail" ForeColor="Red" ErrorMessage="Please enter valid email id format." />
                            <input type="button" value="Subscribe" class="btn btn-large btn-primary" id="btncall" />
                        </address>
                    </div>

    </div>
  </div>
</section>
    <script>

        // This function is used to hid join us div when page is load 
        $(document).ready(function () {

            $("#divJoinUsDetails").hide();
        });

        // this function is used press only numarical in that fields
        $("#txtMobile").keypress(function (e) {
            $("#phoneError").hide();
            // Allow: backspace, delete, tab, escape, enter and .
            if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
                // Allow: Ctrl+A, Command+A
                (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) ||
                // Allow: home, end, left, right, down, up
                (e.keyCode >= 35 && e.keyCode <= 40)) {
                // let it happen, don't do anything
                return;

            }
            // Ensure that it is a number and stop the keypress
            if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                e.preventDefault();
            }
        });

        // This function is used hide error message
        $("#txtOtpMobile").keypress(function () {
            $("#OtpError").hide();
        });
        
        // This function is used to check validation
        function CheckValidation()
        {
            var validation = 0;
            var ValueOfMobileOrEmail = $("#txtMobile").val();
            if (ValueOfMobileOrEmail == "") {
                $("#phoneError").show();
                $("#phoneError").html("Please enter mobile number.");
                validation = 1;
            }
            else if (ValueOfMobileOrEmail.length < 10) {
                $("#phoneError").show();
                $("#phoneError").html("Please enter valid mobile number.");
                validation = 1;
            }
            if ($("#txtOtpMobile").val() == "")
            {
                $("#OtpError").show();
                $("#OtpError").text("Please enter your OTP.");
                validation = 1;
            }
            else if ($("#random").val() != $("#txtOtpMobile").val())
            {
                $("#OtpError").show();
                $("#OtpError").text("OTP doesn't match, please try again.");
                validation = 1;
            }
            
            if (validation == 0) {
                $("#divMobileConfirmation").hide();
                $("#divJoinUsDetails").show();
            }
        }

        //This function is used to generate OTP
        function GetOTPNumber(OTPType, ValueOfMobileOrEmail)
        {
            $("#OtpError").hide();
            var data = {
                "OTPtype": OTPType,
                "EmailOrMobile": ValueOfMobileOrEmail
            };
            if (OTPType == "Mobile" && ValueOfMobileOrEmail == "") {
                $("#phoneError").show();
                $("#phoneError").html("Please enter mobile number.");
            }
            else if (ValueOfMobileOrEmail.length < 10) {
                $("#phoneError").show();
                $("#phoneError").html("Please enter valid mobile number.");
            }
            else {
                $.ajax({
                    url: "/JoinUs.aspx/OtpGenerate",
                    data: JSON.stringify(data),
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json",
                    success: function (msg) {
                        //console.log(otp);

                        if (msg.d == "Phone no is already exist!") {
                            alert("This phone number already registered please change or fill other phone number!");
                            //$('#btnEmail').hide();
                        }

                        else if (msg.d == "NotValid") {
                            alert("This email already registered please change or fill other email!");
                            $('#btnEmail').hide();
                        }

                        else {
                            $('#btnEmail').show();
                            if (OTPType == "Email") {
                                alert("Your OTP has been sent to provided email address.\nPlease check.");
                                $('#otpgenerate').prop('value', 'Re-GenerateOTP');
                            }

                            if (OTPType == "Mobile") {
                                alert("Your OTP has been sent to provided mobile number.\nPlease check.");
                                $('#otpgenerateForMobile').prop('value', 'Re-GenerateOTP');
                            }
                            $("#random").val(msg.d);
                            $("#<%=textMobile.ClientID %>").val($("#txtMobile").val());
                        }
                    },
                    error: function () {
                        alert("Please try again!");
                    }
                });
            }
        }
    </script>
<!--/#bottom-->
</asp:Content>
