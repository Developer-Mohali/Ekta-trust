<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="NewEventRegistration.aspx.vb" Inherits="EktaTrust.NewEventRegistration" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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

        .divFile {
            width: 100% !important;
            padding: 5px !important;
        }
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

        .help-block {
            margin-bottom: 0px !important;
        }

        .clsBackImage {
            height: 800px;
            background: linear-gradient(rgba(196, 102, 0, 0.2), rgba(155, 89, 182, 0.2)), url('test.jpg');
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
            /*stacking fieldse ts above each other*/
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
            margin-top: 2px;
            /*width: 100%;*/
            box-sizing: border-box;
            font-family: montserrat;
            color: #2C3E50;
            font-size: 13px;
        }
        /*buttons*/
        #msform .action-button {
            width: 100%;
            color: #fff;
            background-color: #5cb85c !important;
            border-color: #4cae4c !important;
            font-weight: bold;
            color: white;
            /* border: 0 none; */
            border-radius: 6px;
            cursor: pointer;
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
            }

            body section {
                margin-top: 0px;
                padding: 20px 0;
            }
        }
        /* Large Devices, Wide Screens */
        @media only screen and (min-width : 1200px) {
            #otp {
                height: 51px !important;
                margin-top: 5% !important;
            }

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
    </style>
    <link href="Css/MediaQuery.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="clsBackImage">

        <!-- progressbar -->
        <div style="width: 83%; padding-left: 19%;">
            <ul id="progressbar">
                <li class="active">Basic Information</li>
                <li>Payment</li>
            </ul>
        </div>
        <!--First fieldsets to colect basic information -->
        <div>

            <div class="col-sm-2">
            </div>
           
            <div id="PaymentTab" class="col-sm-8">
                <fieldset id="basic_information">
                    <br />
                    <h2 class="fs-title">Basic Information</h2>
                    <h3 class="fs-subtitle">Please Provide your basic Information.   <span class="pull-right" style="color: red"><b>Event Date -</b> 12th April 2020<br />
                        <b>Venue -</b> Ambedkar Circle, Jaipur*</span></h3>
                    <div class="col-sm-12">
                        <asp:Label ID="lblMessage" ForeColor="Red" runat="server" Text="Label"></asp:Label>
                    </div>
                  
                    <div class="col-sm-12">
                        <asp:TextBox ID="txtName" CssClass="form-control" MaxLength="30" runat="server" placeholder="Enter Name"></asp:TextBox>
                        <span id="nameError" class="help-block" style="color: red"></span>
                    </div>
                    
                    <div class="col-sm-12" style="margin-top: 10px; margin-bottom: 10px;">
                        <asp:DropDownList runat="server" class="form-control" ID="drpEvent">
                            <asp:ListItem value="" disabled Selected="True">Select Run Category</asp:ListItem>
                            <asp:ListItem Value="1">21.09 KM (Half Marathan)</asp:ListItem>
                            <asp:ListItem Value="2">10 KM</asp:ListItem>
                            <asp:ListItem Value="3">5 KM</asp:ListItem>
                        </asp:DropDownList>
                         <%--<span id="eventError" class="help-block" style="color: red"></span>--%>
                    </div>
                    <div class="col-sm-12" style="margin-top: 10px; margin-bottom: 10px;">
                        <asp:DropDownList runat="server" class="form-control" ID="ddlTShrt">
                            <asp:ListItem value="" disabled Selected="True">Select Shirt Size</asp:ListItem>
                            <asp:ListItem Value="1">S-Small</asp:ListItem>
                            <asp:ListItem Value="2">M-Medium</asp:ListItem>
                            <asp:ListItem Value="3">L-Large</asp:ListItem>
                            <asp:ListItem Value="4">XL-Extra large</asp:ListItem>
                            <asp:ListItem Value="5">XXL-Extra Extra large</asp:ListItem>
                            <asp:ListItem Value="6">XXXL-Extra Extra Extra large</asp:ListItem>
                        </asp:DropDownList>    
                        <span id="ShirtError" class="help-block" style="color: red"></span>
                    </div>
                      
				    
                     <div class="col-sm-12" style="margin-top: 10px; margin-bottom: 10px;">
                        <asp:DropDownList runat="server" class="form-control" ID="drpGender">
                            <asp:ListItem Value="" disabled Selected>Select Gender</asp:ListItem>
                            <asp:ListItem Value="1">Male</asp:ListItem>
                            <asp:ListItem Value="2">Female</asp:ListItem>
                        </asp:DropDownList>
                      <%--  <span id="GenderError" class="help-block" style="color: red"></span>--%>
                    </div>

                    <div class="col-sm-12">
                        <asp:TextBox ID="txtMobile" CssClass="form-control" runat="server" MaxLength="10" placeholder="Enter Mobile Number"></asp:TextBox>
                        <span id="phoneError" class="help-block" style="color: red"></span>
                    </div>                 
                   
                   <%-- <div class="col-sm-12">
                        <asp:TextBox ID="txtCntName" MaxLength="20" runat="server" CssClass="form-control" placeholder="Enter Emergency Contact Person Name"></asp:TextBox>
                        <span id="contactnameError" class="help-block" style="color: red"></span>               
                    </div>--%>

                    <div class="col-sm-12">
                        <asp:TextBox ID="txtCntNo" CssClass="form-control" runat="server" MaxLength="10" placeholder="Enter Emergency Contact Number"></asp:TextBox>
                        <%--<span id="contactError" class="help-block" style="color: red"></span>--%>
                    </div>
                    <div class="col-sm-12">    
                          <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"  placeholder="Enter Email Address"></asp:TextBox>
                          <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ForeColor="Red" CssClass="errorMessage" ErrorMessage="Please enter valid email id format." />
                          <span id="emailError" class="help-block" style="color: red"></span>                    
                    </div> 
                  <div class="form-group col-sm-12">        
                    <asp:TextBox ID="TextBox1" runat="server" style="width:300px" ReadOnly = "true" placeholder="Select Date Of Birth"></asp:TextBox>
                   <%-- <img src="Images/calendar.png" />--%>
                      <span id="dateError" class="help-block" style="color: red"></span>
                    </div>
                <%--    <div class="form-group col-sm-12">
                        <asp:TextBox ID="txtDate" CssClass="form-control"  runat="server" placeholder="Enter Date of birth" Format="dd/MM/yyyy"></asp:TextBox>
                    </div>--%>
                    <div class="form-group col-sm-12">
                        <asp:TextBox ID="txtAddress" CssClass="form-control" TextMode="MultiLine" MaxLength="100" runat="server" placeholder="Enter Address"></asp:TextBox>
                        <span id="addressError" class="help-block" style="color: red"></span>
                   </div>
                    <%--<asp:TextBox ID="txtDate" runat="server" ReadOnly = "true"></asp:TextBox>
                    <br/>--%>
                    <asp:HiddenField ID="HiddenOtp" runat="server" Value="0" />
                    <br />
                    <br />
                    <div class="col-sm-12">
                        <asp:CheckBox ID="chbAccept" Checked="true" runat="server" />
                        <a style="font-weight: bold" href="../TermsAndCondition" target="_blank">I Accept the Terms and Conditions
                        </a>
                        <br />
                        
                         <asp:Label ID="lblTC" ForeColor="Red" runat="server" Text="Label"></asp:Label>
                        <br />
                        <span id="chbAcceptError" class="help-block" style="color: red"></span>
                    </div>

                    <div class="col-sm-12" style="margin-bottom: 15px;">
                        <div class="col-sm-6">
                            <asp:Button ID="btnNext" runat="server" CssClass="action-button" Text="Next" OnClick="btnNext_Click" OnClientClick="return onNextButtonClient()" />
                        </div>
                    </div>
                </fieldset>

                <fieldset id="Payment">
                    <h2 class="fs-title">Payment</h2>
                    <h3 class="fs-subtitle">Please provide payment information.</h3>
                </fieldset>
            </div>
                      
            <div class="col-sm-2">
            </div>
          
        </div>
     <%--<script src="Js/jquery-1.11.3.min.js"></script>
     <script src="ScriptLibrary/jquery.dynDateTime.min.js"></script>
     <script src="ScriptLibrary/calendar-en.min.js"></script>
     <link href="Css/calendar-blue.css" rel="stylesheet" />
     <script type="text/javascript">
     $(document).ready(function () {
        $("#<%=TextBox1.ClientID %>").dynDateTime({
            showsTime: true,
            //ifFormat: "%Y/%m/%d %H:%M",
            ifFormat: "%Y/%m/%d ",
            daFormat: "%l;%M %p, %e %m, %Y",
            align: "BR",
            electric: false,
            singleClick: false,
            displayArea: ".siblings('.dtcDisplayArea')",
            button: ".next()"
        });
     });
    </script>--%>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
<link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet" type="text/css" />
<script type="text/javascript">
    $(function () {
        $("[id*=TextBox1]").datepicker({
            showOn: 'button',
            buttonImageOnly: true,
            buttonImage: 'Images/calendar.png'
        });
    });
</script>
    <script>
            //function TransferNewPage() {
            //    $('<a href="https://in.explara.com/e/run-for-equality/checkout" target="blank"></a>')[0].click();
            //}
            // This function check all field validation on button client click.
            function onNextButtonClient() {
                document.forms[0].target = "_blank";
                var validation = 1;

                if ($("#<%=chbAccept.ClientID %>").is(':checked') === 0)
                {
                    $('#chbAcceptError').show();
                    $('#chbAcceptError').html("Please check terms and conditions");
                    validation = 0;
                }
                else
                {
                    $('#chbAcceptError').hide();
                }

                if ($("#<%=txtName.ClientID %>").val() === "")
                {
                    $('#nameError').show();
                    $('#nameError').html("Please enter name");
                    validation = 0;
                }
                else
                {
                    $('#nameError').hide();
                }

                if ($("#<%=txtAddress.ClientID %>").val() === "")
                {
                    $('#addressError').show();
                    $('#addressError').html("Please enter address");
                    validation = 0;
                }
                else
                {
                    $('#addressError').hide();
                }

                  if ($("#<%=TextBox1.ClientID %>").val() === "")
                {
                    $('#dateError').show();
                    $('#dateError').html("Please enter date of birth");
                    validation = 0;
                }
                else
                {
                    $('#addressError').hide();
                }
                var moblieno = $("#<%=txtMobile.ClientID %>").val();
                if (moblieno === "")
                {
                    $('#phoneError').show();
                    $('#phoneError').html("Please enter mobile number");
                    validation = 0;
                }
                else if (moblieno.length < 10)
                {
                    $('#phoneError').show();
                    $('#phoneError').html("Please enter valid mobile number");
                    validation = 0;
                }
                else
                {
                    $('#phoneError').hide();
                }
               <%--   if ($("#<%=txtCntName.ClientID %>").val() === "") {
                    $('#contactnameError').show();
                    $('#contactnameError').html("Please enter emergency contact name");
                    validation = 0;
                }
                else {
                    $('#contactnameError').hide();
                }--%>

                 <%--var contactno = $("#<%=txtCntNo.ClientID %>").val();
                if (contactno === "")
                {
                    $('#contactError').show();
                    $('#contactError').html("Please enter emergency contact number");
                    validation = 0;
                }
                else if (moblieno.length < 10)
                {
                    $('#contactError').show();
                    $('#contactError').html("Please enter valid emergency contact number");
                    validation = 0;
                }
                else
                {
                    $('#contactError').hide();
                }--%>
               
                if ($("#<%=txtEmail.ClientID %>").val() === "")
                {
                    $('#emailError').show();
                    $('#emailError').html("Please enter email address");
                    validation = 0;
                }
                else
                {
                    $('#emailError').hide();
                }

                <%--if ($("#<%=ddlTShrt.ClientID %>").val() === "")
                {
                    $('#ShirtError').show();
                    $('#ShirtError').html("Please select shirt");
                    validation = 0;
                }
                else
                {
                    $('#ShirtError').hide();
                }--%>
                if (validation === 0)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
            // This function is used to hide terms and condition error

            $("#<%=chbAccept.ClientID %>").click(function ()
            {
                $('#chbAcceptError').hide();
            });

            // This function is used prevent alphabet
            $("#<%=txtMobile.ClientID %>").keydown(function (e)
            {
                // Allow: backspace, delete, tab, escape, enter and .
                if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
                    // Allow: Ctrl+A, Command+A
                    (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) ||
                    // Allow: home, end, left, right, down, up
                    (e.keyCode >= 35 && e.keyCode <= 40))
                {
                    // let it happen, don't do anything
                    return;
                }
                // Ensure that it is a number and stop the keypress
                if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105))
                {
                    e.preventDefault();
                }
                $('#phoneError').hide();
            });

            $("#<%=txtCntNo.ClientID %>").keydown(function (e)
            {
                // Allow: backspace, delete, tab, escape, enter and .
                if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
                    // Allow: Ctrl+A, Command+A
                    (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) ||
                    // Allow: home, end, left, right, down, up
                    (e.keyCode >= 35 && e.keyCode <= 40))
                {
                    // let it happen, don't do anything
                    return;
                }
                // Ensure that it is a number and stop the keypress
                if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105))
                {
                    e.preventDefault();
                }
                $('#contactError').hide();
            });
            // This function is used to hide name error message 
            $("#<%=txtName.ClientID %>").keydown(function (e)
            {
                $('#nameError').hide();
            });

            $("#<%=txtEmail.ClientID %>").keydown(function (e)
            {
                $('#emailError').hide();
            });
            $("#<%=txtAddress.ClientID %>").keydown(function (e)
            {
                $('#addressError').hide();
            });
             $("#<%=TextBox1.ClientID %>").keydown(function (e)
            {
                $('#dateError').hide();
            });

          <%--    $("#<%=txtCntName.ClientID %>").keydown(function (e) {
                $('#contactnameError').hide();
            });--%>
   </script>
   </div>
</asp:Content>
