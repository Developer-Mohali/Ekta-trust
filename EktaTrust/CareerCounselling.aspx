<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="CareerCounselling.aspx.vb" Inherits="EktaTrust.Career_Counselling" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <!-- jQuery easing plugin -->
    <script src="Js/js/jquery.easing.min.js"></script>
    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.js"></script>
    <script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/additional-methods.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="about-us">
        <div class="container">


            <img src="images/Career-Counselling.jpg" alt="" class="img-responsive img-rounded  wow fadeInDown" />
            <h2 class="wow fadeInDown">Mata Savitribai Phule Ekta Career Counseling & Guidance Progrmme</h2>

            <fieldset id="CareerCounselling">
                <center><span id="successMessage" class="help-block" style="color:green;font-weight: bold"></span></center>
                <div class="form-group col-sm-12">
                    <div class="col-sm-4">
                        <label style="float: right; margin-top: 8px">Name of the Student:</label>
                    </div>
                    <div class="col-sm-4">
                        <input type="text" maxlength="20" class="form-control" id="name" name="name" />
                        <span id="nameError" class="help-block" style="color: red"></span>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <div class="col-sm-4">
                        <label style="float: right; margin-top: 8px">Mobile Number:</label>
                    </div>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="mobile" name="mobile" />
                        <span id="MobileError" class="help-block" style="color: red"></span>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <div class="col-sm-4">
                        <label style="float: right; margin-top: 8px">Email:</label>
                    </div>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="email" name="email" />
                        <span id="emailError" class="help-block" style="color: red"></span>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <div class="col-sm-4">
                        <label style="float: right; margin-top: 8px">Education:</label>
                    </div>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="education" name="education" />
                        <span id="educationError" class="help-block" style="color: red"></span>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <div class="col-sm-4">
                        <label style="float: right; margin-top: 8px">Address:</label>
                    </div>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="address" name="address" />
                        <span id="addressError" class="help-block" style="color: red"></span>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <div class="col-sm-4">
                        <label style="float: right; margin-top: 8px">Please give the area in which
                            <br />
                            you want Career Counselling & Guidance</label>
                    </div>
                    <div class="col-sm-4">
                        <textarea class="form-control" id="cCGuidance" name="cCGuidance"></textarea>
                        <span id="cCGuidanceError" class="help-block" style="color: red"></span>
                    </div>
                </div>
                <div>
                    <center><input type="button" id="CCGBtn" name="CCGBtn" value="Submit" class="btn btn-primary"/></center>
                </div>
            </fieldset>
        </div>
    </div>
    <!--/.container-->

    <!--/#main-slider-->
    <br />
    <br />

    <%--<section>
        <div class="get-started  wow fadeInDown">
            <div class="container">
                <div class="contribute col-lg-6 col-sm-5 col-md-5 "><a href="Donation">
                    <img src="images/donate.png" class="img-responsive" alt="" /></a></div>
                <div class="pull-right">
                    <div class="col-sm-8 col-md-8 col-lg-10 pull-right" style="margin-top: 4px;"><a href="Trust%20Activities">
                        <img src="images/activities_btn.png" class="img-responsive" alt="" /></a></div>
                </div>
            </div>
        </div>
    </section>--%>

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
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" group="email" ControlToValidate="txtSignupEmail" ForeColor="Red" ErrorMessage="*" ToolTip="Please Enter EmailId" />
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
        $('#CCGBtn').click(function () {
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
                    name: {
                        required: true,
                        maxlength: 20,
                    },
                    mobile: {
                        required: true,
                        minlength: 10,
                    },
                    //email: {
                    //    required: true,
                    //},
                    education: {
                        required: true,
                    },
                    address: {
                        required: true,                   
                    },
                    cCGuidance: {
                        required: true,
                    },
                },
                messages:
                {
                    name: {
                        required: "Name required.",
                    },
                    mobile: {
                        required: "Mobile Number required.",
                    },
                    email: {
                        required: "Email required.",
                    },
                    education: {
                        required: "Education required.",
                    },
                    address: {
                        required: "Address required.",
                    },
                    cCGuidance: {
                        required: "Please provide area for career counselling & guidance.",
                    }
                }
            });
            if (form.valid() === true) {
                var data = {
                    "name": $("#name").val(),
                    "phone": $("#mobile").val(),
                    "email": $("#email").val(),
                    "education": $("#education").val(),
                    "address": $("#address").val(),
                    "cCGuidance": $("#cCGuidance").val(),
                };
                $.ajax
                    ({

                        url: "/CareerCounselling.aspx/Submitdata",
                        data: JSON.stringify(data),
                        type: "POST",
                        dataType: "json",
                        contentType: "application/json",
                        success: function (msg) {
                            //$("#msform").resetForm();
                            $("#successMessage").show();
                            setTimeout(function () { HideDiv(); }, 6000);
                            $("#successMessage").text("विशेषज्ञ शीघ्र ही आप से बात करेंगे एवं आपको यथा संभव जानकारी देंगे");
                            clearFields();
                        }
                    });
            }
        });

        function clearFields() {

            $("#name").val('');
            $("#mobile").val('');
            $("#email").val('');
            $("#education").val('');
            $("#address").val('');
            $("#cCGuidance").val('');
        }
        function HideDiv() {
            $('#successMessage').hide();
        }
    </script>

</asp:Content>
