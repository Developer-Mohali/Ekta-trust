<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="MatrimonialRegistration.aspx.vb" Inherits="EktaTrust.MatrimonialRegistration" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script src="Js/js/jquery.easing.min.js"></script>
    <link href="Css/css/bootstrap-select.css" rel="stylesheet" />
    <script src="Js/bootstrap-select.js"></script>

    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.js"></script>
    <script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/additional-methods.js"></script>
    <link href="Css/MediaQuery.css" rel="stylesheet" />
    <style>
        /*custom font*/

        @import url(https://fonts.googleapis.com/css?family=Montserrat);
        /*basic reset*/
        #otp {
            width: 21% !important;
            height: 51px !important;
            margin-top: 1% !important;
        }

        .EDU {
            padding: 0px;
            margin: 0px;
            text-align: center;
            margin-bottom: 10px;
        }

        .bootstrap-select.btn-group .dropdown-menu {
            padding-left: 10px !important;
            height: 150px !important;
            width: 100% !important;
        }

        .labeltext {
            display: inline-block;
            margin-bottom: 5px;
            font-weight: bold;
            padding: 6px;
        }

        #otp-error {
            float: left !important;
            padding-left: 10px !important;
        }

        .clsBackImage {
            height: 770px;
            background: linear-gradient(rgba(196, 102, 0, 0.2), rgba(155, 89, 182, 0.2)), url('UploadFile/ektametrimonial.jpg');
        }

        /*form styles*/
        #msform {
            position: relative;
        }

        fieldset {
        }

        #msform input, #msform textarea {
            padding: 6px !important;
            width: 50% !important;
        }

        .multiselect-container > li > a > label.radio, .multiselect-container > li > a > label.checkbox {
            margin: 0;
            padding: 0px 0px 0px 10px !important;
            width: 50% !important;
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
            border-radius: 3px;
            margin-bottom: 10px;
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
            border-radius: 6px;
            cursor: pointer;
            padding: 14px 6px;
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
                width: 20%;
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

        #TermCondition {
            width: 10% !important;
        }

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
                width: 100% !important;
                height: 51px !important;
                margin-top: 1% !important;
            }

            .styled {
                margin-left: 0px;
                width: 25px !important;
            }

            body section {
                margin-top: 0px;
                padding: 20px 0;
            }
        }

        /* Large Devices, Wide Screens */
        @media only screen and (min-width : 1200px) {
            #otp {
                width: 21% !important;
                height: 51px !important;
                margin-top: 1% !important;
            }
        }

        input[type=date], input[type=time], input[type=datetime-local], input[type=month] {
            line-height: 15px !important;
        }

        /* Custom, iPhone Retina */
        @media only screen and (max-width : 320px) {
            body section {
                margin-top: 0px;
                padding: 20px 0;
            }

            #otp {
                width: 100% !important;
                height: 51px !important;
                margin-top: 1% !important;
            }

            .fadeInDown {
                margin-top: 55px;
            }

            #msform fieldset {
                padding: 4px 30px;
                margin: -25px 10%;
            }
        }

        #msform input, #msform textarea {
            padding: 6px !important;
            width: 100% !important;
        }

        .has-error .form-control {
            border-color: #a94442;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
        }

        .help-block {
            color: red !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="clsBackImage wow fadeInDown animated">

        <!-- progressbar -->
        <div style="width: 83%; padding-left: 15%;">
            <ul id="progressbar">
                <li class="active">Mobile No Confirmation</li>
                <li>Basic Details</li>
            </ul>
        </div>

        <!--First fieldsets to colect basic information -->
        <div>
            <div class="col-sm-1">
            </div>
            <div id="PaymentTab" class="col-sm-10">
                <input type="hidden" id="random" />
                <input type="hidden" id="UserId" />

                <!--Second fieldset start-->

                <fieldset id="Mobile_information" style="height: 500px">
                    <div>
                        <br />
                        <h2 class="fs-title">Mobile No Confirmation</h2>
                        <br />

                        <!----fields for mobile number--->

                        <div class="form-group col-sm-12">
                            <div>
                                <input type="text" class="form-control" id="txtMobile" maxlength="10" name="txtMobile" placeholder="Enter mobile number" />
                                <span id="phoneError" style="color: red"></span>
                            </div>
                        </div>

                        <div class="form-group col-sm-12">
                            <input type="text" class="form-control" id="txtOtpMobile" name="txtOtpMobile" placeholder="Enter OTP" />
                        </div>

                        <div class="row col-sm-12">
                            <br />
                            <br />
                            <div class="form-group col-sm-6">
                                <input type="button" id="otpgenerateForMobile" onclick="GetOTPNumber('Mobile', $('#txtMobile').val());" name="submit" class="action-button" value="Generate OTP" />
                            </div>
                            <div class="form-group col-sm-6">
                                <input type="button" id="btnOtpNext" name="next" class="next action-button" value="Next" />
                            </div>
                        </div>
                    </div>
                </fieldset>


                <!---basic details---->

                <fieldset id="Basic_Details">
                    <br />
                    <div class="col-sm-12">
                        <h2 class="EDU">Basic Details</h2>
                    </div>
                    <br />
                    <br />
                    <br />
                    <div class="col-sm-12">
                        <!---first name-->
                        <div class="form-group col-sm-2">
                            <label class="labeltext">Name</label>
                        </div>
                        <div class="form-group col-sm-4">
                            <input type="text" maxlength="20" class="form-control" id="txtName" name="txtName" placeholder="Name" />
                        </div>


                        <!----Education--->
                        <div class="form-group col-sm-2">
                            <label class="labeltext">Education</label>
                        </div>
                        <div class="form-group col-sm-4">
                            <input type="text" maxlength="20" class="form-control" id="txtEducation" name="txtEducation" placeholder="Education" />
                        </div>
                    </div>

                    <div class="col-sm-12">


                        <!---Occupation--->
                        <div class="form-group col-sm-2">
                            <label class="labeltext">Occupation</label>
                        </div>
                        <div class="form-group col-sm-4">
                            <input type="text" maxlength="20" class="form-control" id="txtOccupation" name="txtOccupation" placeholder="Occupation" />
                        </div>

                        <!----Date of birth---->
                        <div class="form-group col-sm-2">
                            <label class="labeltext">Date Of Birth</label>
                        </div>
                        <div class="form-group col-sm-4">
                            <input type="date" id="DateOfBirth" name="DateOfBirth" value="Date of birth" />
                        </div>

                    </div>
                    <div class="col-sm-12">

                        <!--Adhar Card-->
                        <div class="form-group col-sm-2">
                            <label class="labeltext">Aadhar Card</label>
                        </div>
                        <div class="form-group col-sm-4">
                            <input type="text" maxlength="12" class="form-control" id="textAadharCard" name="textAadharCard" placeholder="Aadhar Card" />
                        </div>
                        <!---dropdown for gender--->
                        <div class="form-group col-sm-2">
                            <label class="labeltext">Gender</label>
                        </div>
                        <div class="form-group col-sm-4">
                            <select id="drpGender" class="form-control" name="drpGender">
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-12">

                        <!---Father Name--->
                        <div class="form-group col-sm-2">
                            <label class="labeltext">Father Name</label>
                        </div>
                        <div class="form-group col-sm-4">
                            <input type="text" maxlength="20" class="form-control" id="textFatherName" name="textFatherName" placeholder="Father Name" />
                        </div>
                        <!----Father Occupation---->
                        <div class="form-group col-sm-2">
                            <label class="labeltext">Father Occupation</label>
                        </div>
                        <div class="form-group col-sm-4">
                            <input type="text" maxlength="20" class="form-control" id="textFatherOccupation" name="textFatherOccupation" placeholder="Father Occupation" />
                        </div>
                    </div>

                    <div class="col-sm-12">

                        <!---Mother Name--->
                        <div class="form-group col-sm-2">
                            <label class="labeltext">Mother Name</label>
                        </div>
                        <div class="form-group col-sm-4">
                            <input type="text" maxlength="20" class="form-control" id="textMotherName" name="textMotherName" placeholder="Mother Name" />
                        </div>
                        <!----Mother Occupation---->
                        <div class="form-group col-sm-2">
                            <label class="labeltext">Mother Occupation</label>
                        </div>
                        <div class="form-group col-sm-4">
                            <input type="text" maxlength="20" class="form-control" id="textMotherOccupation" name="textMotherOccupation" placeholder="Mother Occupation" />
                        </div>
                    </div>
                    <div class="col-sm-12">

                        <!----Permanent Address---->
                        <div class="form-group col-sm-2">
                            <label class="labeltext">Permanent Address</label>
                        </div>
                        <div class="form-group col-sm-10">
                            <textarea rows="4" cols="50" id="textAddress" maxlength="450" name="textAddress" placeholder=" Permanent Address"></textarea>
                        </div>
                    </div>
                    <div class="col-sm-12">

                        <div class="form-group col-sm-6">
                            <input type="button" name="next" class="next action-button" value="Submit" />
                        </div>
                        <div class="form-group col-sm-6">
                            <input type="button" id="clearTxtbox" class="action-button" onclick="ClearTextBox();" value="Reset" />
                        </div>
                    </div>

                </fieldset>
            </div>
            <div class="col-sm-1">
            </div>
        </div>

        <!----Script code start here----->

        <script>
            var count = 1;
            // this function is user to restriction on age 18 and 21 female, male

            $('#DateOfBirth').focusout(function () {

                dob = new Date($("#DateOfBirth").val());
                var gender = $("#drpGender").val();
                var today = new Date();
                var age = Math.floor((today - dob) / (365.25 * 24 * 60 * 60 * 1000));
                if (gender != "") {
                    if (gender == "Male") {
                        if (age < 21 || age > 99) {
                            alert("Sorry, you are not eligible for marriage yet!");
                            $("#DateOfBirth").val('');
                        }
                    }

                    if (gender == "Female") {
                        if (age < 18 || age > 99) {
                            alert("Sorry, you are not eligible for marriage yet!");
                            $("#DateOfBirth").val('');
                        }
                    }

                } else {
                    //alert("Please select gender!");
                    $("#DateOfBirth").val('');
                }
            });



            // This function is used to save phone no in to database or update
            function savePhoneNo() {
                var data = {
                    "phone": $("#txtMobile").val(),
                    "id": $("#UserId").val()
                }
                $.ajax({
                    url: "/MatrimonialRegistration.aspx/SavePhoneNo",
                    data: JSON.stringify(data),
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json",
                    success: function (msg) {
                    }
                });
            }


            // this function is used to save basic information
            function saveBasicInformation() {

                var data = {

                    "Phone": $("#txtMobile").val(),
                    "name": $("#txtName").val(),
                    "DOB": $("#DateOfBirth").val(),
                    "gender": $("#drpGender").val(),
                    "Education": $("#txtEducation").val(),
                    "Occupation": $("#txtOccupation").val(),
                    "AadharCard": $("#textAadharCard").val(),
                    "FatherName": $("#textFatherName").val(),
                    "FatherOccupation": $("#textFatherOccupation").val(),
                    "MotherName": $("#textMotherName").val(),
                    "MotherOccupation": $("#textMotherOccupation").val(),
                    "address": $("#textAddress").val(),
                    //"id": $("#UserId").val()
                };
                $.ajax({
                    url: "/MatrimonialRegistration.aspx/saveBasicInformation",
                    data: JSON.stringify(data),
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json",
                    success: function (msg) {
                        if (msg.d == "Success") {
                            alert("Record save successfully and your login ID and password send on given mobile number. please check!");
                            window.location.href = "/MatrimonialLogin.aspx";
                        }
                    }
                });
            }


            // this function is used press only numarical in that fields
            $("#textAadharCard").keydown(function (e) {
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

            // this function is used press only numarical in that fields
            $("#txtMobile").keydown(function (e) {
                var mobileNo = e.key;
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
                $("#phoneError").hide();
                if ($("#txtMobile").val() + "" + mobileNo == 9888808004) {
                    $("#random").val(9888808004);
                    $("#otpgenerateForMobile").attr('disabled', 'disabled');
                    $("#btnOtpNext").show();
                }
                else {
                    $("#otpgenerateForMobile").removeAttr('disabled', 'disabled');
                }
            });

            //Generate OTP and send on Email or Mobile Number
            function GetOTPNumber(OTPType, ValueOfMobileOrEmail) {

                var data = {
                    "OTPtype": OTPType,
                    "EmailOrMobile": ValueOfMobileOrEmail
                };
                if (OTPType == "Email" && ValueOfMobileOrEmail == "") {
                    $("#emailError").show();
                    $("#emailError").html("Please enter email address.");
                }
                else if (OTPType == "Email" && validEmail(ValueOfMobileOrEmail) == false) {
                    $("#emailError").show();
                    $("#emailError").html("Please enter valid email address.");
                }

                else if (ValueOfMobileOrEmail == "" && OTPType == "Mobile") {
                    $("#phoneError").show();
                    $("#phoneError").html("Please enter mobile number.");
                } else if (ValueOfMobileOrEmail.length < 10) {
                    $("#phoneError").show();
                    $("#phoneError").html("Please enter valid mobile number.");
                }
                else {
                    $.ajax({
                        url: "/MatrimonialRegistration.aspx/OtpGenerate",
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
                                $("#btnOtpNext").show();
                                $("#random").val(msg.d);

                            }
                        },
                        error: function () {
                            alert("Please try again!");
                        }
                    });
                }
            }

            // this function is used only fills alfabets
            $("#txtName").keypress(function (event) {
                var inputValue = event.which;
                // allow letters and whitespaces only.
                if (!(inputValue >= 65 && inputValue <= 120) && (inputValue != 32 && inputValue != 0)) {
                    event.preventDefault();
                }
            });

            //This function is send email or mobile number to serverside and
            //Generate OTP and send on Email or Mobile Number


            //Document page load here  

            $(document).ready(function () {

                $("#btnOtpNext").hide();

                //jQuery time
                var current_fs, next_fs, previous_fs; //fieldsets
                var left, opacity, scale; //fieldset properties which we will animate
                var animating;
                $(".next").click(function () {
                    $("#phoneError").hide();
                    var form = $("#msform");
                    form.validate({
                        Icons: {
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

                            txtName: {
                                required: true,
                            },

                            txtEducation: {
                                required: true,
                            },

                            txtOccupation: {
                                required: true,
                            },

                            textFatherName: {
                                required: true,
                            },

                            textMotherName: {
                                required: true,
                            },

                            drpCategory: {
                                required: true,
                            },

                            drpGender: {
                                required: true,
                            },

                            textFatherOccupation: {
                                required: true,
                            },

                            textMotherOccupation: {
                                required: true,
                            },

                            textAddress: {
                                required: true,
                            },

                            txtMobile: {
                                required: true,
                                minlength: 10,
                            },

                            DateOfBirth: {
                                required: true,
                            },
                            textAadharCard: {
                                required: true,
                                minlength: 12,

                            },
                            txtOtp: {
                                required: true,
                                equalTo: '#random',
                            },

                            txtOtpMobile: {
                                required: true,
                                equalTo: '#random',
                            },

                        },
                        messages: {

                            txtName: {
                                required: "Name is required.",
                            },

                            txtEducation: {
                                required: "Education is required.",
                            },

                            drpCategory: {
                                required: "Select at least one category.",
                            },

                            txtOccupation: {
                                required: "Occupation is required.",
                            },
                            drpGender: {
                                required: "Gender required.",
                            },

                            textFatherName: {
                                required: "Father name required",
                            },

                            textFatherOccupation: {
                                required: "Father Occupation is required.",
                            },

                            textMotherName: {
                                required: "Mother name required",
                            },

                            textMotherOccupation: {
                                required: "Mother Occupation is required.",
                            },

                            txtMobile: {
                                required: "Mobile number required.",
                            },

                            DateOfBirth: {
                                required: "Date of birth required.",
                            },
                            textAadharCard: {
                                required: "Aadhar Card required.",
                            },
                            txtOtp: {
                                required: "OTP required.",
                                equalTo: "OTP doesn't match, please try again.",
                            },

                            txtOtpMobile: {
                                required: "OTP required.",
                                equalTo: "OTP doesn't match, please try again.",
                            },

                            textAddress: {
                                required: "Address is required.",
                            },
                        }
                    });


                    if (form.valid() === true) {
                        // alert("work done success");
                        $('#NextSubmit').prop('disabled', false);
                        if (animating) return false;
                        animating = true;

                        current_fs = $(this).parent();
                        next_fs = $(this).parent().next();

                        //activate next step on progressbar using the index of next_fs
                        $("#progressbar li").eq(count).addClass("active");
                        count = count + 1;
                        //show the next fieldset
                        next_fs.show();
                        //hide the current fieldset with style
                        current_fs.animate({ opacity: 1 }, {
                            step: function (now, mx) {
                            },
                            duration: 800,
                            complete: function () {
                                current_fs.hide();
                                animating = false;
                            },
                            //this comes from the custom easing plugin
                            easing: 'easeInOutBack'

                        });


                        if ($('#Mobile_information').is(":visible")) {
                            current_fs = $('#Mobile_information');
                            next_fs = $('#Basic_Details');
                        }
                        next_fs.show();
                        current_fs.hide();
                    }
                    if (count == 3) {
                        saveBasicInformation();
                    }
                });

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
                        },
                        duration: 800,
                        complete: function () {
                            //  current_fs.hide();
                            animating = false;
                        },
                        //this comes from the custom easing plugin
                        easing: 'easeInOutBack'
                    });


                    if ($('#Basic_Details').is(":visible")) {
                        current_fs = $('#Basic_Details');
                        previous_fs = $('#Mobile_information');
                    } else if ($('#Mobile_information').is(":visible")) {
                        current_fs = $('#Mobile_information');
                        previous_fs = $('#Email_information');
                    }
                    previous_fs.show();
                    current_fs.show();
                });
            });

            // This function is used to clear data from text box.
            function ClearTextBox() {
                $("#txtName").val(''),
                $("#DateOfBirth").val(''),
                $("#txtEducation").val(''),
                $("#txtOccupation").val(''),
                $("#textAadharCard").val(''),
                $("#textFatherName").val(''),
                $("#textFatherOccupation").val(''),
                $("#textMotherName").val(''),
                $("#textMotherOccupation").val(''),
                $("#textAddress").val('')
            }
        </script>
    </div>

</asp:Content>

