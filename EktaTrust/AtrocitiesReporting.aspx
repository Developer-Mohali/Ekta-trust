<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="AtrocitiesReporting.aspx.vb" Inherits="EktaTrust.Atrocities_Reporting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--event registration -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <!-- jQuery easing plugin -->
    <script src="Js/js/jquery.easing.min.js"></script>
    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.js"></script>
    <script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/additional-methods.js"></script>
    <style>
        /*custom font*/
        @import url(https://fonts.googleapis.com/css?family=Montserrat);
        /*basic reset*/
       
        #otp-error {
            float: left !important;
            padding-left: 10px !important;
        }
        /*form styles*/
        #msform {
            position: relative;
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
                /*position: absolute;*/
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
                /*margin-bottom: 10px;*/
                box-sizing: border-box;
                font-family: montserrat;
                /*color: #2C3E50;*/
                font-size: 13px;
            }
            /*buttons*/
            #msform .action-button {
                
                color: #fff;
                background-color: #5cb85c !important;
                border-color: #4cae4c !important;
                font-weight: bold;
                color: white;
                /* border: 0 none; */
                border-radius: 6px;
                cursor: pointer;
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
                /*color: white;*/
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
                    background: lightgray;
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
                    /*background:lightgray;*/
                    color: white;
                }

        #VerificationPage {
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
            /*#msform fieldset {
                padding: 4px 30px;
                margin: -25px 10%;
            }*/

            /*#otp {
                width: 100% !important;
                height: 51px !important;
                margin-top: 1% !important;
            }*/

            .styled {
                margin-left: 0px;
            }

        }
        /* Large Devices, Wide Screens */
        @media only screen and (min-width : 1200px) {
            /*#otp {
                width: 25% !important;
                height: 51px !important;
                margin-top: 1% !important;
            }*/

            .styled {
                margin-left: 0px;
            }
        }

        /* Custom, iPhone Retina */
        @media only screen and (max-width : 320px) {
            body section {
                margin-top: 151px;
                padding: 20px 0;
            }

            /*#otp {
                width: 100% !important;
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
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="about-us">
        <div class="container">

            <img src="images/atrocities.jpg" alt="" class="img-responsive img-rounded  wow fadeInDown"/>
            <h2 class="wow fadeInDown">Atrocities Reporting</h2>

            <!-- progressbar -->
            <div style="width: 83%; padding-left: 19%;">
                <ul id="progressbar">
                    <li class="active">Verification</li>
                    <li>Reporting</li>
                </ul>
            </div>

            <div>
                <div class="col-sm-2">
                </div>
                <div id="VerificationPage" class="col-sm-8">                 
                    <fieldset id="VerificationFieldset" >                         
                        <h2 class="fs-title" style="margin-top: 5px;">Verify Your Mobile Number</h2>
                        <br />
                        <div class="form-group col-sm-12">
                            <div>
                                <span style="color: green; font-weight: bold"><asp:Label ID="lblConfirmation" runat="server"></asp:Label></span>
                            </div>
                            <div>
                                <input type="text" maxlength="10" class="form-control" id="phone" name="phone" placeholder="Enter Mobile Number" />
                                <span id="phoneError" class="help-block" style="color: red"></span>
                            </div>
                        </div>
                        <input type="hidden" id="random" />
                        <div class="form-group col-sm-12">
                                <input type="text" id="otp" class="form-control" name="otp" placeholder="Enter OTP Here" />
                                
                        </div>
                        <div class="col-sm-12">
                            <div class="row col-sm-6">
                                <input type="button" id="otpgenerate" name="submit" onclick="OTPNumber();" class="submit action-button form-control" value="Generate OTP" />
                            </div>
                            <div class="row col-sm-6">
                                <input type="button" name="next" id="NextSubmit" class="next action-button form-control" value="Next" />
                            </div>
                            
                                
                        </div>
                        <div class="form-group">
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <div style="margin-top: 15px;">
                                <font color="red"> <b>Note: &nbsp;</b>You need to generate OTP first to proceed with the next process</font>
                            </div>
                          </div>
                        </div>
                    </fieldset>

                    <!-- End Of fieldset first-->

                    <!--Second fieldset start-->
                    <fieldset id="mainPage">
                        <div>                            
                            <h2 class="fs-title">Atrocity Reporting</h2>
                            <br />                          
                            <div class=" col-sm-12"> 
                                    <label>Name of the Reporter</label>
                                    <asp:TextBox maxlength="20" runat="server" class="form-control" id="reporterName" name="reporterName" placeholder="Enter Reporter Name."></asp:TextBox> 
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter reporter name." ForeColor="Red" ToolTip="Please enter reporter name." ControlToValidate="reporterName"></asp:RequiredFieldValidator>                             
                            </div>
                            <div class="col-sm-12">
                                    <label>Mobile of the Reporter</label>
                                    <asp:TextBox maxlength="10" runat="server" class="form-control" id="reporterPhone" name="reporterPhone" placeholder="Enter Reporter Phone."></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter reporter mobile number." ForeColor="Red" ToolTip="Please enter reporter mobile number." ControlToValidate="reporterPhone"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please enter valid mobile number" ForeColor="Red" ValidationExpression="^[0-9]{7,10}$" ControlToValidate="reporterPhone"></asp:RegularExpressionValidator>
                            </div>
                            <div class=" col-sm-12">
                                    <label>Email of the Reporter</label>
                                    <asp:TextBox maxlength="20" runat="server" class="form-control" id="reporterEmail" name="reporterEmail" placeholder="Enter Reporter Email."></asp:TextBox>                                    
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter reporter email." ForeColor="Red" ToolTip="Please enter reporter email." ControlToValidate="reporterEmail"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter valid email id format." ControlToValidate="reporterEmail" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                            <div class=" col-sm-12">
                                    <label>Place of Atrocity</label>
                                    <asp:TextBox  runat="server" class="form-control" id="place" name="place" placeholder="Enter Place of Atrocity."></asp:TextBox>                      
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter place of atrocity." ForeColor="Red" ToolTip="Please enter place of atrocity." ControlToValidate="place"></asp:RequiredFieldValidator>
                            </div>
                            <div class=" col-sm-12">
                                <div class="col-sm-4" style="margin-top: 5px;">
                                    <label>Any Printed News</label>
                                </div>
                                <div class="col-sm-8">
                                     <asp:fileupload runat="server" class="form-control" id="FileUpload1" onclientclick="CheckFile(this);"></asp:fileupload>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                    <label>Victims Name</label>
                                    <asp:TextBox maxlength="20" runat="server" class="form-control" id="victimsName" name="victimsName" placeholder="Enter Victims Name."></asp:TextBox>                                 
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please enter victims name." ControlToValidate="victimsName" ForeColor="Red" ToolTip="Please enter victims name."></asp:RequiredFieldValidator>
                            </div>
                            <div class=" col-sm-12">
                                    <label>Victims Mobile Number</label>
                                    <asp:TextBox maxlength="10" runat="server" class="form-control" id="victimsMobile" name="victimsMobile" placeholder="Enter Victims Mobile."></asp:TextBox>                                   
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Plase enter victims mobile number." ForeColor="Red" ToolTip="Plase enter victims mobile number." ControlToValidate="victimsMobile"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please enter valid mobile number" ForeColor="Red" ValidationExpression="^[0-9]{7,10}$" ControlToValidate="victimsMobile"></asp:RegularExpressionValidator>
                            </div>
                            <div class="col-sm-12">
                                    <label>Details of the Atrocity</label>
                                    <asp:TextBox  TextMode="MultiLine" runat="server" class="form-control" id="details" name="details" placeholder="Enter Victims Details."></asp:TextBox>                                                                  
                            </div>
                            <div class="col-sm-12">
                            <asp:button id="ButtonSubmitMessage" runat="server" class="btn action-button btn-lg form-control" text="Submit" OnClientClick="Vailidations();" OnClick="Atrocity_Submit" style="margin-top:15px;"/>
                            </div>
                         </div>
                    </fieldset>
                    <!-- End Second fieldset-->

                </div>
                <div class="col-sm-2"></div>
            </div>
        </div>
    </div>
    <!--/.container-->

    <!--/#main-slider-->

    <%--<section>
        <div class="get-started  wow fadeInDown">
            <div class="container">
                <div class="contribute col-lg-6 col-sm-5 col-md-5 "><a href="Donation">
                    <img src="images/donate.png" class="img-responsive" alt=""/></a></div>
                <div class="pull-right">
                    <div class="col-sm-8 col-md-8 col-lg-10 pull-right" style="margin-top: 4px;"><a href="Trust%20Activities">
                        <img src="images/activities_btn.png" class="img-responsive" alt=""/></a></div>
                </div>
            </div>
        </div>
    </section>--%>
    <br />
    <br />
    <br />
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
                <!--/.col-md-3-->
                <!--/.col-md-3-->
                <!--/.col-md-3-->
                <!--/.col-md-3-->

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
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator7" group="email" ControlToValidate="txtSignupEmail" ForeColor="Red" ErrorMessage="*" ToolTip="Please Enter EmailId" />
                            <asp:RegularExpressionValidator runat="server" Display="Dynamic" group="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ControlToValidate="txtSignupEmail" ForeColor="Red" ErrorMessage="Please enter valid email id format." />
                            <input type="button" value="Subscribe" class="btn btn-large btn-primary" id="btncall" />
                        </address>
                    </div>

            </div>
        </div>
    </section>
    <!--/#bottom-->

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
        var count = 1;

        function OTPNumber() {
            var data = {
                "phone": $("#phone").val(),
            };
            if (data.phone == "") {
                $('#phoneError').html("Please enter your mobile number.");
            }
           else if (data.phone.length < 10)
            {
                $('#phoneError').html("Please enter valid mobile number.");
            }
            else {
                $.ajax({
                    url: "/AtrocitiesReporting.aspx/otpgenerate",
                    data: JSON.stringify(data),
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json",

                    success: function (msg) {
                        //console.log(msg)

                        if (msg.d == "NotValid") {
                            alert("Your mobile is not valid. please try again!");
                        }

                        else {
                            alert("Your OTP has been sent to provided mobile number.\nPlease check that now.");
                            $('#otpgenerate').prop('value', 'Re-GenerateOTP');
                            $("#random").val(msg.d);
                            $("#<%=reporterPhone.ClientID%>").val($("#phone").val());
                        }
                    },
                    error: function () {
                        alert("Please Try Again!");
                    }
                });
            }
        }
        $(document).ready(function () {

            //jQuery time
            var current_fs, next_fs, previous_fs; //fieldsets
            var left, opacity, scale; //fieldset properties which we will animate
            var animating;

            $(".next").click(function () {
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
                        phone: {
                            required: true,
                            minlength: 10,
                        },
                        otp: {
                            required: true,
                            equalTo: '#random',
                        },
                    },
                    messages: {
                        phone: {
                            required: "Mobile number required.",
                        },
                        otp: {
                            required: "OTP required.",
                            equalTo: "OTP doesn't match, please try again.",
                        }
                    }

                });

                if (form.valid() === true) {
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
                        duration: 800,
                        complete: function () {
                            current_fs.hide();
                            animating = false;
                        },
                        //this comes from the custom easing plugin
                        easing: 'easeInOutBack'
                    });


                    if ($('#VerificationFieldset').is(":visible")) {
                        current_fs = $('#VerificationFieldset');
                        next_fs = $('#mainPage');
                    }
                    next_fs.show();
                    current_fs.hide();
                }
            });

        });

        function Vailidations() {
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

                    reporterName: {
                        required: true,
                        maxlength: 20,
                    },
                    reporterEmail: {
                        required: true,
                    },
                    reporterPhone: {
                        required: true,
                        minlength: 10,
                    },
                    place: {
                        required: true,
                    },
                    victimsName: {
                        required: true,
                        maxlength: 20,
                    },
                    victimsMobile: {
                        required: true,
                        minlength: 10,
                    },
                    details: {
                        required: true,
                    },
                },
                messages: {

                    reporterName: {
                        required: "Reporter name required.",
                    },
                    reporterEmail: {
                        required: "Reporter email required.",
                    },
                    reporterPhone: {
                        required: "Reporter mobile number required.",
                    },
                    place: {
                        required: "place required.",
                    },
                    victimsName: {
                        required: "Victims name required.",
                    },
                    victimsMobile: {
                        required: "Victims mobile number required.",
                    },
                    details: {
                        required: "*",
                    },
                }

            });
        }

    </script>

</asp:Content>
