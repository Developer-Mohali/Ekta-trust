<%@ Page Title="" Language="vb" AutoEventWireup="false" ValidateRequest="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="EventRegistration.aspx.vb" Inherits="EktaTrust.EventRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!--event registration -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

    <!-- jQuery easing plugin -->
    <script src="Js/js/jquery.easing.min.js"></script>
    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.js"></script>
    <script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/additional-methods.js"></script>
     <asp:Literal ID="ltPaytmScript" runat="server"></asp:Literal>
    <style>
        /*custom font*/

        @import url(https://fonts.googleapis.com/css?family=Montserrat);
        /*basic reset*/
        #otp {
            width: 21% !important;
            height: 51px !important;
            margin-top: 1% !important;
        }

        #otp-error {
            float: left !important;
    padding-left: 10px !important;
        }
        .clsBackImage {
       /*     height: 800px;*/
            background: linear-gradient(rgba(196, 102, 0, 0.2), rgba(155, 89, 182, 0.2)), url('test.jpg');
            min-height: 100vh;
            background: linear-gradient(rgba(196, 102, 0, 0.2), rgba(155, 89, 182, 0.2)), url('test.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        /*form styles*/
        #msform {
            position: relative;
        }

        fieldset {
        }

        #msform fieldset {
            background: white;
            border: 0 none;
            border-radius: 3px;
            box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
            padding: 20px 30px;
            box-sizing: border-box;
            width: 80%;
            margin: 0 10%;
            /*stacking fieldse
    ts above each other*/
            position: absolute;
            opacity: 0.85;
        }
            /*Hide all except first fieldset*/
            #msform fieldset:not(:first-of-type) {
                display: none;
                opacity: 0.85;
            }
        /*inputs*/
        #msform input, #msform textarea {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            margin-bottom: 10px;
            /*width: 100%;*/
            box-sizing: border-box;
            font-family: montserrat;
            color: #2C3E50;
            font-size: 13px;
        }
        /*buttons*/
        #msform .action-button {
            width: 100px;
            color: #fff;
            background-color: #5cb85c !important;
            border-color: #4cae4c !important;
            font-weight: bold;
            color: white;
            /* border: 0 none; */
            border-radius: 6px;
            cursor: pointer;
            padding: 14px 6px;
            margin: 10px 5px;
        }

            #msform .action-button:hover, #msform .action-button:focus {
                box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
            }
        /*headings*/
        .fs-title {
            font-size: 15px;
            text-transform: uppercase;
            color: #2C3E50;
            margin: 0px;
            text-align: center;
        }

        .fs-subtitle {
            font-weight: normal;
            font-size: 13px;
            color: #666;
            margin: 0px;
        }
        /*progressbar*/
        #progressbar {
            margin-bottom: 30px;
            overflow: hidden;
            /*CSS counters to number the steps*/
            counter-reset: step;
        }

            #progressbar li {
                margin-top: 2%;
                list-style-type: none;
                color: white;
                text-transform: uppercase;
                font-size: 9px;
                width: 24%;
                float: left;
                position: relative;
                text-align: center;
            }

                #progressbar li:before {
                    content: counter(step);
                    counter-increment: step;
                    width: 20px;
                    line-height: 20px;
                    display: block;
                    font-size: 10px;
                    color: #333;
                    background: white;
                    border-radius: 3px;
                    margin: 0 auto 5px auto;
                }
                /*progressbar connectors*/
                #progressbar li:after {
                    content: '';
                    width: 100%;
                    height: 2px;
                    background: white;
                    position: absolute;
                    left: -50%;
                    top: 9px;
                    z-index: -1; /*put it behind the numbers*/
                }

                #progressbar li:first-child:after {
                    /*connector not needed before the first step*/
                    content: none;
                }
                /*marking active/completed steps green*/
                /*The number of the step and the connector before it = green*/
                #progressbar li.active:before, #progressbar li.active:after {
                    background: #27AE60;
                    color: white;
                }

        #PaymentTab {
            margin-top: 1%;
        }

/*        #TermCondition {
            width: 10% !important;
        }*/

        #TermCondition-error {
            float: right;
            margin: 0%;
        }
            @media only screen and (min-width : 360px) {

        #msform fieldset {
            padding: 4px 30px;
            margin: -25px 10%;
        }
        #otp {
    width:100% !important;
    height: 51px !important;
    margin-top: 1% !important;
}
        .styled {
            margin-left:0px;
        }
body section {
    margin-top: 151px;
    padding: 20px 0;
}


    }
              /* Large Devices, Wide Screens */
    @media only screen and (min-width : 1200px) {
 #otp {
    width:21% !important;
    height: 51px !important;
    margin-top: 1% !important;
}
        .styled {
            margin-left:0px;
        }

    
    }

    /* Custom, iPhone Retina */
        @media only screen and (max-width : 380px) {
            body section {
                margin-top: 151px;
                padding: 20px 0;
            }
          /*      #otp {
    width:100% !important;
    height: 51px !important;
    margin-top: 1% !important;
}*/
            .fadeInDown {
                margin-top: 55px;
            }
             #msform fieldset {
            padding: 4px 30px;
            margin: -25px 10%;
        }
             .terms-font-size{
                 font-size: 11px;
             }
             .d-flex{
                 display:flex;
             }
             .clsBackImage {
                 height:830px;
             }
             .col-sm-2, .col-sm-8{
                 padding-left:0px;
             }
        }

        section{
            display:none;
        }
    </style>
    <link href="Css/MediaQuery.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="clsBackImage">

        <!-- progressbar -->
        <div style="width: 83%; padding-left: 19%; padding-top: 20px">
           <%-- <ul id="progressbar">
                <li class="active">Basic Information</li>
            </ul>--%>
        </div>
        <!--First fieldsets to colect basic information -->
        <div>
            <div class="col-sm-2">
            </div>
            <div id="PaymentTab" class="col-sm-8">
                <fieldset id="basic_information">
                    <%--<div style="height :540px;">--%>


                 <%--   <h2 class="fs-title">Information</h2>--%>
                    <h3 class="fs-subtitle">Run for Equality Registration.   <span class="pull-right" style="color:red"><b> Event Date -</b> 14th April 2026<br /> <b>Venue -</b> JLN Marg, Jaipur*</span></h3>
                  
                    <br />
                    <div class="form-group col-sm-12">
                        <label style="margin-right:10px;">Full Name:</label>
                        <div>
                            <input type="text" maxlength="20" class="form-control" id="username" name="username" placeholder="Enter Name" />
                            <span id="nameError" class="help-block" style="color: red"></span>
                        </div>
                    </div>

                    <div class="form-group col-sm-12">
                        <label style="margin-right:10px;">Email Address:</label>
                        <div>
                            <input type="text" class="form-control" id="email" name="email" placeholder="Enter Email Id" />
                            <span id="emailError" class="help-block" style="color: red"></span>
                        </div>
                    </div>

                    <div class="form-group col-sm-12">
                        <label style="margin-right:10px;">Mobile Number:</label>
                        <div>
                            <input type="text" maxlength="10" class="form-control" id="phone" name="phone" placeholder="Enter Mobile Number" />
                            <span id="phoneError" class="help-block" style="color: red"></span>
                        </div>
                    </div>

                    <div class="form-group col-sm-12">
                        <label style="margin-right:10px;">Run Category:</label>
                        <asp:DropDownList runat="server" class="form-control" ID="drpEvent">
                            <asp:ListItem Value="21.09KM" Selected="True">Run For Equality 21 KM</asp:ListItem>
                            <asp:ListItem Value="10KM">Run For Equality 10 KM</asp:ListItem>
                            <asp:ListItem Value="5KM">Run For Equality 5 KM</asp:ListItem>
                        </asp:DropDownList>
                        <span id="runCategoryError" class="help-block" style="color: red"></span>
                    </div>
                      <div class="form-group col-sm-12">
                          <label style="margin-right:10px;">Gender:</label>
                           <select id="ddlGender" name="ddlGender" class="form-control">
                                <option value="">Select Gender</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                          <span id="genderError" class="help-block" style="color: red"></span>
                      </div>
                  <div class="form-group col-sm-12">
                        <label style="margin-right:10px;">Date of Birth:</label>
                        <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" CssClass="form-control" />
                    </div>

                    <div class="form-group col-sm-12">
                       <label style="margin-right:10px;">T-Shirt Size:</label>
                        <asp:DropDownList ID="txtTshirtSize" runat="server" class="form-control">
                        <asp:ListItem Text="Select T-Shirt Size" Value="" />
                        <asp:ListItem Text="S" Value="S" />
                        <asp:ListItem Text="M" Value="M" />
                        <asp:ListItem Text="L" Value="L" />
                        <asp:ListItem Text="XL" Value="XL" />
                        <asp:ListItem Text="XXL" Value="XXL" />
                    </asp:DropDownList>
                    </div>

                   <%-- <div class="form-group col-sm-12">
                        <div>
                            <input type="text" class="form-control" id="address" rows="3" columns="40" name="address" placeholder="Enter Address" />
                        </div>
                    </div>--%>
                    <div class="form-group col-sm-12">
                        <input type="checkbox" name="TermCondition" checked="checked" class="styled" id="TermCondition" />                   
                        <a style="text-decoration: underline;" href="../TermsAndCondition" target="_blank">
                            <label class="terms-font-size" style="cursor: pointer">I Accept the Terms and Conditions</label>
                        </a>
                    </div>
                    <input type="hidden" id="random" />


                    <div class="form-group col-sm-12">

                        <div class="d-flex">
                            <%--<input  type = "text" id="otp" Class="col-sm-4" name="otp" placeholder="Enter OTP Here" /><input type="button" id="otpgenerate" style="width: auto;" name="submit" onclick="OTPNumber()" Class="submit action-button" value="Generate OTP" /> --%>
                          <input type="button" name="submitbtn" id="submitbtn" class="action-button" value="Submit Data" />
                         <input type="button" class="action-button" value="Back"  onclick="window.location.href='../EventPrize.aspx';" style="background-color: #ef5430 ! IMPORTANT; border-color: #e13810 !important;" />
                            
                        </div>




                    </div>



                    <div class="form-group">
                    </div>
                    <div class="form-group">
                       <%-- <div class="col-sm-6">
                            <font color="red"> <b>Note:</b> <br />You need to generate OTP first to proceed with the registration process.<br /> Fill all the information first and then click on "Generate OTP" button to proceed with OTP Verification.</font>
                        </div>--%>
                        <div class="col-sm-6">
                            <label>
                                <b>Tax Benefits:</b>
                                <p>
                                    Registered u/s 12A of the Income Tax Act, 1961
                                       Donations exempted u/s 80G of the Income Tax  
                                         Act 1961
                                </p>
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-6">
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </fieldset>
                <!-- End Of fieldset first-->


                <!--Second fieldset start-->

<%--                <fieldset id="shirt_information">
                    <div>
                        <h2 class="fs-title">T-Shirt Details</h2>
                        <h3 class="fs-subtitle">Please chose your T-shirt size</h3>
                        <div class="form-group">
                            <div>
                                <asp:DropDownList CssClass="form-control" ID="ddlTShirt" runat="server">
                                    <asp:ListItem Value="1">---Select T-Shirt Size---</asp:ListItem>
                                    <asp:ListItem Value="2">S-Small</asp:ListItem>
                                    <asp:ListItem Value="3">M-Medium</asp:ListItem>
                                    <asp:ListItem Value="2">L-Large</asp:ListItem>
                                    <asp:ListItem Value="2">XL-Extra large</asp:ListItem>
                                    <asp:ListItem Value="2">XXL- Extra Extra Large</asp:ListItem>
                                   
                                </asp:DropDownList>
                            </div>
                        </div>


                        <input type="button" name="previous" class="previous action-button" value="Previous" />
                        <input type="button" name="next" class="next action-button" value="Next" />
                    </div>
                </fieldset>--%>

                <!-- End Second fieldset-->
          <%--      <fieldset id="Emergency">
                    <div>
                        <h2 class="fs-title">Emergency Contacts</h2>
                        <h3 class="fs-subtitle">Please provide emergency contact numbers.</h3>

                        <div class="form-group">
                            <div>
                                <input type="text" class="form-control" id="txtEmergencyName" name="txtEmergencyName" placeholder="Emergency Contact Person Name" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div>
                                <input type="text" class="form-control" id="txtEmergencyMobile" name="txtEmergencyMobile" placeholder="Emergency Contact Number" />
                            </div>
                        </div>

                        <input type="button" name="previous" class="previous action-button" value="Previous" />
                        <input type="button" id="submitEventDetail" name="next" class="action-button" value="Next" />
                    </div>
                </fieldset>--%>
          <%--      <fieldset id="Payment">
                    <h2 class="fs-title">Payment</h2>
                    <h3 class="fs-subtitle">Please provide payment information.</h3>

                </fieldset>--%>
            </div>
            <div class="col-sm-2">
            </div>
        </div>

        <script>

            $("#phone").keydown(function (e) {
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

            $("#username").keypress(function (event) {
                var inputValue = event.which;
                // allow letters and whitespaces only.
                if (!(inputValue >= 65 && inputValue <= 120) && (inputValue !== 32 && inputValue !== 0)) {
                    event.preventDefault();
                }
            });
            var count = 1;


            /*function OTPNumber() {
                var data = {
                    "username": $("#username").val(),
                    "phone": $("#phone").val(),
                    "email": $("#email").val()
                };
                if (data.username === "") {
                    $('#nameError').html("Please Enter Your Name");
                } else if (data.email === "") {
                    $('#emailError').html("Please Enter Your Email Address");
                } else if (data.phone === "") {
                    $('#phoneError').html("Please Enter Your Mobile Number");
                } else {
                    $.ajax({
                        url: "/EventRegistration.aspx/otpgenerate",
                        //data: { "phone": $("#phone").val() },
                        data: JSON.stringify(data),
                        type: "POST",
                        dataType: "json",
                        contentType: "application/json",

                        success: function (msg) {
                            //console.log(msg)

                            if (msg.d === "NotValid") {
                                alert("Your Mobile Is Not Valid. Please Try Again!");
                            }

                            else {
                                alert("Your OTP has been sent to provided mobile number and email address.\nPlease check that now.");
                                $('#otpgenerate').prop('value', 'Re-GenerateOTP');
                                //$('#NextSubmit').prop('disabled', false);
                                $("#random").val(msg.d);

                            }
                        },
                        error: function () {
                            alert("Please Try Again!");
                        }
                    });
                }
            }*/
            $(document).ready(function () {
                $('#submitEventDetail').show();
                //$('#NextSubmit').prop('disabled', true);


                //$("#otp").on('input change', function () {
                //    var value = $("#random").val();
                //    alert(value);
                //    if ($(this).val() == value) {
                //        alert("TRUE");
                //      $('#NextSubmit').prop('disabled', true);

                //$("#otp").keypress(function () {
                //    $('#NextSubmit').prop('disabled', true);
                //});
                //    }
                //    else {
                //        alert("FALSE");
                //      $('#NextSubmit').prop('disabled', false);
                //    }
                //});
                // Key press hide function
                $("#email").keypress(function () {

                    $("#emailError").hide();
                });
                $("#phone").keypress(function () {

                    $("#phoneError").hide();
                });
                $("#username").keypress(function () {
                   $("#nameError").hide();
                });
                $('#submitbtn').click(function () {
                    const amount = getAmountByRunCategory($("#<%=drpEvent.ClientId %> option:selected").val());

                    //alert("call it");
                    var data = {
                        "email": $("#email").val(),
                        "name": $("#username").val(),
                        "phone": $("#phone").val(),
                        "runCategory": $("#<%=drpEvent.ClientId %> option:selected").val(),
                        "gender": $("#ddlGender option:selected").val(),
                        "runnerDOB": $("#<%=txtDOB.ClientID %>").val(),
                        "tshirtSize": $("#<%=txtTshirtSize.ClientID %>").val(),
                        "amount": amount
                        <%--"drpEvent": $("#<%=drpEvent.ClientId %> option:selected").text(),--%>
                        <%--"shirt": $("#<%=ddlTShirt.ClientId %> option:selected").text(),
                        "ename": $("#txtEmergencyName").val(),--%>
                        //"ephone": $("#txtEmergencyMobile").val
                       <%-- "emobile": $("#txtEmergencyMobile").val()--%>
                    };
                    $('#submitEventDetail').hide();

                    validateForm();
                    if (!$("#msform").valid()) {
                        return;
                    }

                    //if (data.ddlGender === "") {
                    //    $('#genderError').html("Please Select Gender");
                    //} else if (data.username === "") {
                    //    $('#nameError').html("Please Enter Your Name");
                    //}  else if (data.phone === "") {
                    //    $('#phoneError').html("Please Enter Your Mobile Number");
                    //} else if (data.drpEvent === "") {
                    //    $('#runCategoryError').html("Please Select Run Category");
                    //} else if ($('#TermCondition').is(":checked") == false) {
                    //    $('#errorTermCondition').css('display', 'block');
                    //} else {
                        $('#loader').show();
                        try {
                            $.ajax({
                                url: "/EventRegistration.aspx/SaveBibForm",
                                data: JSON.stringify(data),
                                type: "POST",
                                dataType: "json",
                                contentType: "application/json",

                                success: function (res) {
                                    const result = res.d;
                                    if (result.success) {
                                        paytmPaymentPopupOpen(amount, result.orderId, data.name, data.phone, data.email);
                                    } else {
                                        $('#loader').show();
                                        alert(result.message);
                                    }
                                    //if (msg.d == 2) {
                                    //    alert("Please enter mobile number");
                                    //}
                                    //if (msg.d === 1) {
                                    //    //$('#submitEventDetail').show();
                                    //    //console.log(msg)
                                    //    alert("Phone number already Registered. Please try again with different number.");
                                    //}
                                    //else {
                                    //    //window.location = "Payments.aspx";
                                    //    alert('successfully data inserted !');
                                    //    return;
                                    //}
                                },
                                error: function (err) {
                                    console.error('error while saveBIB ==> ', err);
                                    $('#loader').hide();
                                    alert("Please try again later.");
                                }
                            });
                        }
                        catch (err){
                            console.error('error ==> ', err);
                            $('#loader').hide();
                        }
                    //}
                    
                });
                //jQuery time
                var current_fs, next_fs, previous_fs; //fieldsets
                var left, opacity, scale; //fieldset properties which we will animate
                var animating;
                //$(".next").click(function () {
                function validateForm() {
                    var form = $("#msform");
                    form.validate({
                        feedbackIcons: {
                            valid: 'glyphicon glyphicon-ok',
                            invalid: 'glyphicon glyphicon-remove',
                            validating: 'glyphicon glyphicon-refresh'
                        },
                        err:
                            {
                                container: 'tooltip'
                            },
                        errorElement: 'span',
                        errorClass: 'help-block',
                        highlight: function (element, errorClass, validClass) {
                            $(element).closest('.form-group').addClass("has-error");
                        },
                        unhighlight: function (element, errorClass, validClass) {
                            $(element).closest('.form-group').removeClass("has-error");
                        },
                        rules: {

                            username: {
                                required: true,
                                maxlength: 50
                                //minlength: 6,
                                //regexp: /^[a-zA-Z0-9_\.]+$/,
                            },
                            ddlGender: {
                                required: true
                            },
                            drpEvent: {
                                required: true
                            },
                            phone: {
                                required: true,
                                minlength: 10
                            },
                            //otp: {
                            //    required: true,
                            //    equalTo: '#random'
                            //},

                            TermCondition: {

                                required: true

                            },

                            //email: {
                            //    required: true

                            //}

                        },
                        messages: {
                            username: {
                                required: "Name is Required"
                            },
                            phone: {
                                required: "Mobile Number is Required"
                            },
                            //otp: {
                            //    required: "OTP Required",
                            //    equalTo: "OTP doesn't match, please try again."
                            //},
                            drpEvent: {
                                required: "Please Select One"
                            },
                            ddlGender: {
                                required: "Gender is Required"
                            },
                            //email: {
                            //    required: "Email Required"
                            //},
                            TermCondition: {
                                required: "Please Accept Terms & Conditions."
                            }

                        }

                    });



                    if (form.valid() === true) {
                        // alert("work done success");
                        //$('#NextSubmit').prop('disabled', false);
                        //if (animating) return false;
                        //animating = true;

                        //current_fs = $(this).parent();
                        //next_fs = $(this).parent().next();



                        ////activate next step on progressbar using the index of next_fs
                        //$("#progressbar li").eq(count).addClass("active");
                        //count = count + 1;
                        ////show the next fieldset
                        //next_fs.show();
                        ////hide the current fieldset with style
                        //current_fs.animate({ opacity: 1 }, {
                        //    step: function (now, mx) {
                        //        //as the opacity of current_fs reduces to 0 - stored in "now"
                        //        //1. scale current_fs down to 80%
                        //        //scale = 1 - (1 - now) * 0.2;
                        //        ////2. bring next_fs from the right(50%)
                        //        //left = (now * 50) + "%";
                        //        ////3. increase opacity of next_fs to 1 as it moves in
                        //        //opacity = .85 - now;
                        //        //current_fs.css({ 'transform': 'scale(' + scale + ')' });
                        //        //next_fs.css({ 'left': left, 'opacity': opacity });
                        //    },
                        //    duration: 800,
                        //    complete: function () {
                        //        current_fs.hide();
                        //        animating = false;
                        //    },
                        //    //this comes from the custom easing plugin
                        //    easing: 'easeInOutBack'
                        //});


                        //if ($('#basic_information').is(":visible")) {
                        //    current_fs = $('#basic_information');
                        //    var win = window.open('https://www.onlinesbi.com/sbicollect/icollecthome.htm?corpID=922784', '_blank');
                        //    win.focus();
                        //    // next_fs = $('#shirt_information');
                        //}
                        //// else if ($('#shirt_information').is(":visible")) {
                        ////    current_fs = $('#shirt_information');
                        ////    next_fs = $('#Emergency');
                        ////} else if ($('#Emergency').is(":visible")) {
                        ////    current_fs = $('#Emergency');
                        ////    next_fs = $('#Payment');
                        ////}
                        //next_fs.show();
                        //current_fs.hide();
                    }
                }

                $('.previous').click(function () {

                    if (animating) return false;
                    animating = true;

                    current_fs = $(this).parent();
                    previous_fs = $(this).parent().prev();

                    //de-activate current step on progressbar
                    count = count - 1;
                    $("#progressbar li").eq(count).removeClass("active");

                    //show the previous fieldset
                    // previous_fs.show();
                    //hide the current fieldset with style
                    current_fs.animate({ opacity: 1 }, {
                        step: function (now, mx) {
                            //as the opacity of current_fs reduces to 0 - stored in "now"
                            //1. scale previous_fs from 80% to 100%
                            //scale = 0.8 + (1 - now) * 0.2;
                            ////2. take current_fs to the right(50%) - from 0%
                            //left = ((1 - now) * 50) + "%";
                            ////3. increase opacity of previous_fs to 1 as it moves in
                            //opacity = .85 - now;
                            //current_fs.css({ 'left': left });
                            //previous_fs.css({ 'transform': 'scale(' + scale + ')', 'opacity': opacity });
                        },
                        duration: 800,
                        complete: function () {
                            //  current_fs.hide();
                            animating = false;
                        },
                        //this comes from the custom easing plugin
                        easing: 'easeInOutBack'
                    });


                    if ($('#shirt_information').is(":visible")) {
                        current_fs = $('#shirt_information');
                        previous_fs = $('#basic_information');
                    } else if ($('#Emergency').is(":visible")) {
                        current_fs = $('#Emergency');
                        previous_fs = $('#shirt_information');
                    } else if ($('#Payment').is(":visible")) {
                        current_fs = $('#Payment');
                        previous_fs = $('#Emergency');
                    }
                    previous_fs.show();
                    current_fs.hide();
                });
            });

            function getAmountByRunCategory(runCategory) {
                if (runCategory.includes('21.09KM')) {
                    return '1600'
                } else if (runCategory.includes('10KM')) {
                    return '1100'
                } else if (runCategory.includes('5KM')) {
                    return '500'
                }
            }

            function paytmPaymentPopupOpen(amount, orderId, name, phone, email) {
                try {
                    $.ajax({
                        type: "POST",
                        url: "/EventRegistration.aspx/InitiateTransaction",
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify({
                            amount: amount,
                            orderId: orderId,
                            name: name,
                            phone: phone,
                            email: email
                        }),
                        dataType: "json",
                        success: function (res) {
                            var data = res.d;
                            //console.log('Response==>', res)
                            setTimeout(() => {
                                $('#loader').hide();
                            }, 1000);
                            if (data.success) {
                                openPaytm(data);
                            } else {
                                alert(data.message);
                            }
                        },
                        error: function (err) {
                            console.log(err);
                            $('#loader').hide();
                            alert("Server error");
                        }
                    });
                } catch (err) {
                    console.log('Error in paytmPaymentPopupOpen==> ',err);
                    $('#loader').hide();
                }
            }

            function openPaytm(data) {
                var config = {
                    root: "",
                    flow: "DEFAULT",
                    data: {
                        orderId: data.orderId,
                        token: data.txnToken,
                        tokenType: "TXN_TOKEN",
                        amount: data.amount
                    },
                    handler: {
                        notifyMerchant: function (eventName, data) {

                            console.log("Event:", eventName);

                            if (eventName === "PAYMENT_SUCCESS") {
                                alert("Payment Successful");
                                location.reload();
                            }

                            if (eventName === "PAYMENT_FAILURE") {
                                alert("Payment Failed");
                            }
                        }
                    }
                };
          

                if (window.Paytm && window.Paytm.CheckoutJS) {
                    window.Paytm.CheckoutJS.init(config).then(function () {
                        window.Paytm.CheckoutJS.invoke();
                    }).catch(function (err) {
                        console.log(err);
                    });
                }
            }
        </script>

    </div>
</asp:Content>
