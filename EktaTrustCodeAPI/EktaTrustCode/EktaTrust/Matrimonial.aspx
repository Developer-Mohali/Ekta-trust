<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="Matrimonial.aspx.vb" Inherits="EktaTrust.Matrimonial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   <!--event registration -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script src="Js/js/jquery.easing.min.js"></script>
    <link href="Css/css/bootstrap-select.css" rel="stylesheet" />
    <script src="Js/bootstrap-select.js"></script>

    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.js"></script>
    <script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/additional-methods.js"></script>
    
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
            padding:0px;
            margin:0px;
            text-align:center;
            margin-bottom: 10px;
        }

        .bootstrap-select.btn-group .dropdown-menu {
            padding-left: 10px !important;
            height: 150px !important;
            width:100% !important;
        }

        .labeltext {
            display: inline-block;
            margin-bottom: 5px;
            font-weight: bold;
            padding:6px;
        }

        #otp-error {
            float: left !important;
            padding-left: 10px !important;
        }
        
        .clsBackImage {
            height: 1150px;
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
            padding:6px !important;
            width:100% !important;
        }

        .has-error .form-control {
            border-color: #a94442;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
        }

        </style>
        <link href="Css/MediaQuery.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="clsBackImage">

        <!-- progressbar -->
        <div style="width: 83%; padding-left: 15%;">
            <ul id="progressbar">
                <li class="active">Email ID Confirmation</li>
                <li>Mobile No Confirmation</li>
                <li>Basic Details</li>
                <li>Other Information</li>
                <li>Family Information</li>
            </ul>
        </div>
        
        <!--First fieldsets to colect basic information -->
        <div>
            <div class="col-sm-1">
            </div>
            <div id="PaymentTab" class="col-sm-10">
                
                <fieldset id="Email_information" style="height:500px">
                    <div>
                        <br />
                        <h2 class="fs-title">Email ID Confirmation</h2>
                        <br />

                        <!----fields for mobile number--->
                        
                    <div class="form-group inputs col-sm-12">
                        <div>
                            <input type="text" class="form-control" id="txtEmail" name="txtEmail" placeholder="Enter your email address" />
                            <span id="emailError" style="color: red"></span>
                        </div>
                    </div>
                    
                    <input type="hidden" id="random" />
                    <input type="hidden" id="UserId" />
                    <div class="row col-sm-12">
                    
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="txtOtp" name="txtOtp" placeholder="Enter your OTP" />
                        </div>

                        <div class="col-sm-6">
                            <input type="button" id="otpgenerate" style="width: auto;" name="submit" onclick="GetOTPNumber('Email', $('#txtEmail').val());" class="btn-info" value="Generate OTP" />
                        </div>
                    </div>

                        <div class="row col-sm-12">
                            <br /><br />
                            <div class="form-group col-sm-6">
                                <input type="button" id="btnEmail" name="next" class="next action-button" value="Next" />
                            </div>
                        </div>
                    </div>
                </fieldset>

                <!--Second fieldset start-->
                
                <fieldset id="Mobile_information" style="height:500px">
                    <div>
                        <br />
                        <h2 class="fs-title">Mobile No Confirmation</h2>
                        <br />

                        <!----fields for mobile number--->

                    <div class="form-group col-sm-12">
                        <div>
                            <input type="text" class="form-control" id="txtMobile" maxlength="10" name="txtMobile" placeholder="Enter your mobile number" />
                            <span id="phoneError" style="color: red"></span>
                        </div>
                    </div>
                        
                    <div class="row col-sm-12">
                    
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="txtOtpMobile" name="txtOtpMobile" placeholder="Enter your OTP" />
                        </div>
                        <div class="col-sm-6">
                            <input type="button" id="otpgenerateForMobile" style="width: auto;" onclick="GetOTPNumber('Mobile', $('#txtMobile').val());" name="submit" class="btn-info" value="Generate OTP" />
                        </div>
                    </div>

                    <div class="row col-sm-12">
                        <br /><br />
                        <div class="form-group col-sm-6">
                            <input type="button" name="previous" class="previous action-button" value="Previous" />
                        </div>
                        <div class="form-group col-sm-6">
                            <input type="button" name="next" class="next action-button" value="Next" />
                        </div>
                    </div>
                    </div>
                </fieldset>

                <!-- End Second fieldset-->

                <!---basic details and third fieldset---->
                
                <fieldset id="Basic_Details">
                    <br />
                    <div class="col-sm-12">
                        <h2 class="EDU">Basic Details</h2>
                    </div>
                    <br />
                  
                        <!---Name of user first name-->
                    <div class="col-sm-12">
                        <div class="form-group col-sm-2">
                            <label class="labeltext">First Name</label>
                        </div>
                        <div class="form-group col-sm-4">
                            <input type="text" maxlength="20" class="form-control" id="txtName" name="txtName" placeholder="First Name" />
                        </div>

                        <!--- user last name-->
                        <div class="form-group col-sm-2">
                            <label class="labeltext">Last Name</label>
                        </div>
                        <div class="form-group col-sm-4">
                            <input type="text" maxlength="20" class="form-control" id="txtLastName" name="txtLastName" placeholder="Last Name" />
                        </div>

                    </div>

                    <div class="col-sm-12">
                    
                        <div class="form-group col-sm-2">
                            <label class="labeltext">Gender</label>
                        </div>
                    <!---dropdown for gender--->
                        <div class="form-group col-sm-4">
                        <select id="drpGender" class="form-control" name="drpGender">
                            <option value="">----Select Gender----</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
                         </div> 

                    <!----Date oof birth---->
                    <div class="form-group col-sm-2">
                            <label class="labeltext">Date Of Birth</label>
                        </div>
                    <div class="form-group col-sm-4">
                        <input type="date" id="DateOfBirth" name="DateOfBirth" value="Date of birth" />
                        </div>
                    
                    </div>

                    <div class="col-sm-12">
                    
                        <!---Native place here-->
                    <div class="form-group col-sm-2">
                            <label class="labeltext">Native Place</label>
                        </div>
                    <div class="form-group col-sm-4">
                            <input type="text" maxlength="20" class="form-control" id="txtNativePlace" name="txtNativePlace" placeholder="Native Place" />
                    </div>

                        <!---dropdown for Category--->
                    <div class="form-group col-sm-2">
                            <label class="labeltext">Category</label>
                        </div>
                    <div class="form-group col-sm-4">
                        <select id="drpCategory" class="form-control" name="drpCategory">
                            <option value="">----Select Category----</option>
                            <option value="SC">SC</option>
                            <option value="ST">ST</option>
                            <option value="OBC">OBC</option>
                            <option value="OTHER">OTHER</option>
                        </select>
                    </div>
                    </div>

                    <div class="col-sm-12">

                    <div class="form-group col-sm-2">
                            <label class="labeltext">Height</label>
                        </div>

                        <!----height of login users----->
                    <div class="col-sm-4 form-group">
                        <select name="height" id="drpHeight" class="form-control">
                            <option value="4ft 5in - 134cm">4ft 5in - 134cm</option>
                            <option value="ft 6in - 137cm">4ft 6in - 137cm</option>
                            <option value="ft 7in - 139cm">4ft 7in - 139cm</option>
                            <option value="4ft 8in - 142cm">4ft 8in - 142cm</option>
                            <option value="4ft 9in - 144cm">4ft 9in - 144cm</option>
                            <option value="4ft 10in - 147cm">4ft 10in - 147cm</option>
                            <option value="4ft 11in - 149cm">4ft 11in - 149cm</option>
                            <option value="5ft - 152cm">5ft - 152cm</option>
                            <option value="5ft 1in - 154cm">5ft 1in - 154cm</option>
                            <option value="5ft 2in - 157cm">5ft 2in - 157cm</option>
                            <option value="5ft 3in - 160cm">5ft 3in - 160cm</option>
                            <option value="5ft 4in - 162cm">5ft 4in - 162cm</option>
                            <option value="5ft 5in - 165cm">5ft 5in - 165cm</option>
                            <option value="5ft 6in - 167cm">5ft 6in - 167cm</option>
                            <option value="5ft 7in - 170cm">5ft 7in - 170cm</option>
                            <option value="5ft 8in - 172cm" selected="selected">5ft 8in - 172cm</option>
                            <option value="5ft 9in - 175cm">5ft 9in - 175cm</option>
                            <option value="5ft 10in - 177cm">5ft 10in - 177cm</option>
                            <option value="5ft 11in - 180cm">5ft 11in - 180cm</option>
                            <option value="6ft - 182cm">6ft - 182cm</option>
                            <option value="6ft 1in - 185cm">6ft 1in - 185cm</option>
                            <option value="6ft 2in - 187cm">6ft 2in - 187cm</option>
                            <option value="6ft 3in - 190cm">6ft 3in - 190cm</option>
                            <option value="6ft 4in - 193cm">6ft 4in - 193cm</option>
                            <option value="6ft 5in - 195cm">6ft 5in - 195cm</option>
                            <option value="6ft 6in - 198cm">6ft 6in - 198cm</option>
                            <option value="6ft 7in - 200cm">6ft 7in - 200cm</option>
                            <option value="6ft 8in - 203cm">6ft 8in - 203cm</option>
                            <option value="6ft 9in - 205cm">6ft 9in - 205cm</option>
                            <option value="6ft 10in - 208cm">6ft 10in - 208cm</option>
                            <option value="6ft 11in - 210cm">6ft 11in - 210cm</option>
                            <option value="7ft - 213cm">7ft - 213cm</option>
                        </select>
                    </div>

                    <div class="form-group col-sm-2">
                            <label class="labeltext">Body Weight</label>
                        </div>

                    <div class="form-group col-sm-4">
                        <input type="text" class="form-control" id="txtWeight" name="txtWeight" maxlength="3" placeholder="Weight In Kilogrames" />
                    </div>
                    </div>

                    <div class="col-sm-12">
                        <div class="form-group col-sm-2">
                            <label class="labeltext">Marital Status</label>
                        </div>

                        <div class="form-group col-sm-4">
                            <select id="drpMaritalStatus" name="MaritalStatus" class="form-control">
								<option value="Never Married">Never Married</option>
								<option value="Divorced">Divorced</option>
								<option value="Widowed">Widowed</option>
								<option value="Awaiting Divorce">Awaiting Divorce</option>
								<option value="Annulled">Annulled</option>
							</select>
                        </div>
                    </div>

                    <div class="col-sm-12">
                        <label class="labeltext" style="font-size:large">Present Address</label>
                    </div>

                    <div class="col-sm-12">
                    
                        <div class="form-group col-sm-2">
                            <label class="labeltext">Street Address</label>
                        </div>
                        <div class="form-group col-sm-4">
                            <input type="text" class="form-control" id="txtStreetAddress" name="txtWeight" maxlength="40" placeholder="Street address" />
                        </div>
                        <div class="form-group col-sm-2">
                                <label class="labeltext">City</label>
                        </div>
                        <div class="form-group col-sm-4">
                            <input type="text" class="form-control" id="txtCity" name="txtCity" maxlength="15" placeholder="City here" />
                        </div>
                    
                    </div>

                    <div class="col-sm-12">
                    
                        <div class="form-group col-sm-2">
                            <label class="labeltext">State</label>
                        </div>
                        <div class="form-group col-sm-4">
                            <input type="text" class="form-control" id="txtState" name="txtState" maxlength="15" placeholder="State name" />
                        </div>
                        <div class="form-group col-sm-2">
                                <label class="labeltext">Pin Code</label>
                        </div>
                        <div class="form-group col-sm-4">
                            <input type="text" class="form-control" id="txtPinCode" name="txtPinCode" maxlength="6" placeholder="Pin Code" />
                        </div>
                    
                    </div>

                    <div class="col-sm-12" style="padding-left:5px !important">
                         <div class="form-group col-sm-4">
                             <label class="labeltext" style="font-size:large">Permanent Address</label>
                            
                        </div>
                        <div class="form-group col-sm-8">
                            <input type="checkbox" id="chbSameAddress" style="width:20px !important" title="Please select if permanent and present address" />Please select if permanent and present address

                        </div>
                                                
                    </div>

                    <div class="col-sm-12">
                    
                        <div class="form-group col-sm-2">
                            <label class="labeltext">Street Address</label>
                        </div>
                        <div class="form-group col-sm-4">
                            <input type="text" class="form-control" id="txtStreetAddress2" name="txtWeight" maxlength="40" placeholder="Street address" />
                        </div>
                        <div class="form-group col-sm-2">
                                <label class="labeltext">City</label>
                        </div>
                        <div class="form-group col-sm-4">
                            <input type="text" class="form-control" id="txtCity2" name="txtCity" maxlength="15" placeholder="City here" />
                        </div>
                    
                    </div>

                    <div class="col-sm-12">
                    
                        <div class="form-group col-sm-2">
                            <label class="labeltext">State</label>
                        </div>
                        <div class="form-group col-sm-4">
                            <input type="text" class="form-control" id="txtState2" name="txtState" maxlength="15" placeholder="State name" />
                        </div>
                        <div class="form-group col-sm-2">
                                <label class="labeltext">Pin Code</label>
                        </div>
                        <div class="form-group col-sm-4">
                            <input type="text" class="form-control" id="txtPinCode2" name="txtPinCode" maxlength="6" placeholder="Pin Code" />
                        </div>
                    
                    </div>

                    <div class="col-sm-12">
                        <div class="form-group col-sm-6">
                            <input type="button" name="previous" class="previous action-button" value="Previous" />
                        </div>
                        <div class="form-group col-sm-6">
                            <input type="button" name="next" id="btnBasicInformation" class="next action-button" value="Next" />
                        </div>
                    </div>

                </fieldset>

                <fieldset id="Other_information">
                    <div>
                        <br />
                        <!----fields for mobile number--->

                    <div class="col-sm-12">
                        <h2 class="EDU">Education Details</h2>
                    </div>

                    <div class="col-sm-12">
                        <div class="form-group col-sm-2">
                            <label class="labeltext">Qualification</label>
                        </div>
                        
                        <div class="form-group col-sm-4">
                            <select id="EducationType" name="EducationType" class="form-control">
								<option value="Less Than High School">Less Than High School</option>
								<option value="High School">High School</option>
								<option value="Undergraduate">Undergraduate</option>
								<option value="Bachelor's Degree">Bachelor's Degree</option>
								<option value="Engineering Degree">Engineering Degree</option>
								<option value="Masters Degree">Masters Degree</option>
								<option value="Doctorate">Doctorate</option>
								<option value="Others">Others</option>
							</select>
                        </div>
                        <div class="form-group col-sm-2">
                            <label class="labeltext">Description</label>
                        </div>
                        <div class="form-group col-sm-4">
                            <input type="text" maxlength="100" class="form-control" id="txtEducationDiscription" name="txtEducationDiscription" placeholder="Education Discription" />
                        </div>
                    </div>

                    <div class="col-sm-12">
                        <h2 class="EDU">Service Or Work</h2>
                    </div>
                    
                    <div class="col-sm-12">
                    
                    <!----Service and work fields here--->
                    <div class="form-group col-sm-2">
                            <label class="labeltext">Occupation</label>
                        </div>
                    <div class="form-group col-sm-4">
                            <input type="text" class="form-control" maxlength="20" id="txtWork" name="txtWork" placeholder="Service/Work" />
                    </div>

                    <div class="form-group col-sm-2">
                            <label class="labeltext">Occupation Type</label>
                    </div>
                    <div class="form-group col-sm-4">
                            <select id="OccupationType" name="OccupationType" class="form-control">
								<option value="Government">Government</option>
                                <option value="Private" selected="selected">Private</option>
                                <option value="Bussiness">Bussiness</option>
                                <option value="Others">Others</option>
							</select>
                    </div>
                    </div>

                    <div class="col-sm-12">
                    
                     <!---- Posting of service here --->
                    <div class="form-group col-sm-2">
                        <label class="labeltext">Posting</label>
                    </div>
                    <div class="form-group col-sm-4">
                        <input type="text" class="form-control" maxlength="25" id="txtPosting" name="txtPosting" placeholder="Present place of posting" />
                    </div>

                    <!---- annual income --->
                    <div class="form-group col-sm-2">
                            <label class="labeltext">Annual Income</label>
                        </div>
                    <div class="form-group col-sm-4">
                            <input type="text" class="form-control" maxlength="8" id="txtAnnualIncome" name="txtAnnualIncome" placeholder="Annual Income" />
                        </div>
                    </div>

                    <div class="col-sm-12">
                    
                        <div class="form-group col-sm-2">
                            <label class="labeltext">Job Description</label>
                        </div>
                    <div class="form-group col-sm-4">
                            <input type="text" class="form-control" maxlength="25" id="txtJobDiscription" name="txtJobDiscription" placeholder="Job Discription" />
                        </div>
                    </div>

                    
                    <div class="col-sm-12">
                        <h2 class="EDU">Lifestyle & Habbits</h2>
                    </div>

                    <div class="col-sm-12">
                    
                        <!----Food habbit of User type--->
                        <div class="form-group col-sm-2">
                            <label class="labeltext">Food Habbit</label>
                        </div>
                        <div class="form-group col-sm-4">
                            <select id="drpFoodHabbit" class="form-control" name="drpFoodHabbit">
                            
                             <option value="Vegetarian">Vegetarian</option>
                                <option value="Non-Veg">Non-Veg</option>
                            <option value="Eggetarian">Eggetarian</option>
                            </select>
                        </div>
                        <!---language of candidates---->
                        <div class="form-group col-sm-2">
                            <label class="labeltext">Language</label>
                        </div>
                    <div class="form-group col-sm-4">

                        <select class="selectpicker form-control" id="drpLanguage" multiple="multiple" data-max-options="5">
                            <option value="Aka">Aka</option>
                            <option value="Arabic">Arabic</option>
                            <option value="Arunachali">Arunachali</option>
                            <option value="Assamese">Assamese</option>
                            <option value="Awadhi">Awadhi</option>
                            <option value="Baluchi">Baluchi</option>
                            <option value="Bengali">Bengali</option>
                            <option value="Bhojpuri">Bhojpuri</option>
                            <option value="Bhutia">Bhutia</option>
                            <option value="Brahui">Brahui</option>
                            <option value="Brij">Brij</option>
                            <option value="Burmese">Burmese</option>
                            <option value="Chattisgarhi">Chattisgarhi</option>
                            <option value="Chinese">Chinese</option>
                            <option value="Coorgi">Coorgi</option>
                            <option value="Dogri">Dogri</option>
                            <option value="English">English</option>
                            <option value="French">French</option>
                            <option value="Garhwali">Garhwali</option>
                            <option value="Garo">Garo</option>
                            <option value="Gujarati">Gujarati</option>
                            <option value="Haryanavi">Haryanavi</option>
                            <option value="Himachali/Pahari">Himachali/Pahari</option>
                            <option value="Hindi">Hindi</option>
                            <option value="Hindko">Hindko</option>
                            <option value="Kakbarak">Kakbarak</option>
                            <option value="Kanauji">Kanauji</option>
                            <option value="Kannada">Kannada</option>
                            <option value="Kashmiri">Kashmiri</option>
                            <option value="Khandesi">Khandesi</option>
                            <option value="Khasi">Khasi</option>
                            <option value="Konkani">Konkani</option>
                            <option value="Koshali">Koshali</option>
                            <option value="Kumaoni">Kumaoni</option>
                            <option value="Kutchi">Kutchi</option>
                            <option value="Ladakhi">Ladakhi</option>
                            <option value="Lepcha">Lepcha</option>
                            <option value="Magahi">Magahi</option>
                            <option value="Maithili">Maithili</option>
                            <option value="Malay">Malay</option>
                            <option value="Malayalam">Malayalam</option>
                            <option value="Manipuri">Manipuri</option>
                            <option value="Marathi">Marathi</option>
                            <option value="Marwari">Marwari</option>
                            <option value="Miji">Miji</option>
                            <option value="Mizo">Mizo</option>
                            <option value="Monpa">Monpa</option>
                            <option value="Nepali">Nepali</option>
                            <option value="Odia">Odia</option>
                            <option value="Pashto">Pashto</option>
                            <option value="Persian">Persian</option>
                            <option value="Punjabi">Punjabi</option>
                            <option value="Rajasthani">Rajasthani</option>
                            <option value="Russian">Russian</option>
                            <option value="Sanskrit">Sanskrit</option>
                            <option value="Santhali">Santhali</option>
                            <option value="Seraiki">Seraiki</option>
                            <option value="Sindhi">Sindhi</option>
                            <option value="Sinhala">Sinhala</option>
                            <option value="Sourashtra">Sourashtra</option>
                            <option value="Spanish">Spanish</option>
                            <option value="Swedish">Swedish</option>
                            <option value="Tagalog">Tagalog</option>
                            <option value="Tamil">Tamil</option>
                            <option value="Telugu">Telugu</option>
                            <option value="Tulu">Tulu</option>
                            <option value="Urdu">Urdu</option>
                            <option value="Other">Other</option>
                              
                        </select>
                        </div>
                    </div>

                    <div class="col-sm-12">

                        <!---dropdown for Smooking--->
                        <div class="form-group col-sm-2">
                            <label class="labeltext">Smoke</label>
                        </div>
                        <div class="form-group col-sm-4">
                            <select id="drpSmoking" class="form-control" name="drpSmoking">
                                <option value="">----Select Smoking----</option>
                                <option value="Yes">Yes</option>
                                <option value="No">No</option>
                                <option value="Occasionally">Occasionally</option>
                            </select>
                        </div>

                        <!---dropdown for Smooking--->
                        <div class="form-group col-sm-2">
                            <label class="labeltext">Drink</label>
                        </div>
                        <div class="form-group col-sm-4">
                            <select id="drpDrinking" class="form-control" name="drpDrinking">
                                <option value="">----Select Drinking----</option>
                                <option value="Yes">Yes</option>
                                <option value="No">No</option>
                                <option value="Occasionally">Occasionally</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="col-sm-12">
                        <h2 class="EDU">Partner Preference</h2>
                    </div>

                    <div class="col-sm-12">
                    <div class="form-group col-sm-2">
                            <label class="labeltext">Age</label>
                        </div>

                        <div class="form-group col-sm-3">
                            <select name="drpAgeFrom" id="drpAgeFrom" class="form-control">
                                <option value="18" label="18">18</option>
                                <option value="19" label="19">19</option>
                                <option value="20" label="20">20</option>
                                <option value="21" label="21">21</option>
                                <option value="22" label="22">22</option>
                                <option value="23" label="23" selected="selected">23</option>
                                <option value="24" label="24">24</option>
                                <option value="25" label="25">25</option>
                                <option value="26" label="26">26</option>
                                <option value="27" label="27">27</option>
                                <option value="28" label="28">28</option>
                                <option value="29" label="29">29</option>
                                <option value="30" label="30">30</option>
                                <option value="31" label="31">31</option>
                                <option value="32" label="32">32</option>
                                <option value="33" label="33">33</option>
                                <option value="34" label="34">34</option>
                                <option value="35" label="35">35</option>
                                <option value="36" label="36">36</option>
                                <option value="37" label="37">37</option>
                                <option value="38" label="38">38</option>
                                <option value="39" label="39">39</option>
                                <option value="40" label="40">40</option>
                                <option value="41" label="41">41</option>
                                <option value="42" label="42">42</option>
                                <option value="43" label="43">43</option>
                                <option value="44" label="44">44</option>
                                <option value="45" label="45">45</option>
                                <option value="46" label="46">46</option>
                                <option value="47" label="47">47</option>
                                <option value="48" label="48">48</option>
                                <option value="49" label="49">49</option>
                                <option value="50" label="50">50</option>
                                <option value="51" label="51">51</option>
                                <option value="52" label="52">52</option>
                                <option value="53" label="53">53</option>
                                <option value="54" label="54">54</option>
                                <option value="55" label="55">55</option>
                                <option value="56" label="56">56</option>
                                <option value="57" label="57">57</option>
                                <option value="58" label="58">58</option>
                                <option value="59" label="59">59</option>
                                <option value="60" label="60">60</option>
                                <option value="61" label="61">61</option>
                                <option value="62" label="62">62</option>
                                <option value="63" label="63">63</option>
                                <option value="64" label="64">64</option>
                                <option value="65" label="65">65</option>
                                <option value="66" label="66">66</option>
                                <option value="67" label="67">67</option>
                                <option value="68" label="68">68</option>
                                <option value="69" label="69">69</option>
                                <option value="70" label="70">70</option>
                                <option value="71" label="71">71</option>
                            </select>
                        </div>

                        <div class="col-sm-1 form-group">
                            <span> to</span>
                        </div>

                        <div class="form-group col-sm-3">
                            <select name="drpAgeTo" id="drpAgeTo" class="form-control">
                                <option value="18" label="18">18</option>
                                <option value="19" label="19">19</option>
                                <option value="20" label="20">20</option>
                                <option value="21" label="21">21</option>
                                <option value="22" label="22">22</option>
                                <option value="23" label="23">23</option>
                                <option value="24" label="24">24</option>
                                <option value="25" label="25">25</option>
                                <option value="26" label="26">26</option>
                                <option value="27" label="27">27</option>
                                <option value="28" label="28" selected="selected">28</option>
                                <option value="29" label="29">29</option>
                                <option value="30" label="30">30</option>
                                <option value="31" label="31">31</option>
                                <option value="32" label="32">32</option>
                                <option value="33" label="33">33</option>
                                <option value="34" label="34">34</option>
                                <option value="35" label="35">35</option>
                                <option value="36" label="36">36</option>
                                <option value="37" label="37">37</option>
                                <option value="38" label="38">38</option>
                                <option value="39" label="39">39</option>
                                <option value="40" label="40">40</option>
                                <option value="41" label="41">41</option>
                                <option value="42" label="42">42</option>
                                <option value="43" label="43">43</option>
                                <option value="44" label="44">44</option>
                                <option value="45" label="45">45</option>
                                <option value="46" label="46">46</option>
                                <option value="47" label="47">47</option>
                                <option value="48" label="48">48</option>
                                <option value="49" label="49">49</option>
                                <option value="50" label="50">50</option>
                                <option value="51" label="51">51</option>
                                <option value="52" label="52">52</option>
                                <option value="53" label="53">53</option>
                                <option value="54" label="54">54</option>
                                <option value="55" label="55">55</option>
                                <option value="56" label="56">56</option>
                                <option value="57" label="57">57</option>
                                <option value="58" label="58">58</option>
                                <option value="59" label="59">59</option>
                                <option value="60" label="60">60</option>
                                <option value="61" label="61">61</option>
                                <option value="62" label="62">62</option>
                                <option value="63" label="63">63</option>
                                <option value="64" label="64">64</option>
                                <option value="65" label="65">65</option>
                                <option value="66" label="66">66</option>
                                <option value="67" label="67">67</option>
                                <option value="68" label="68">68</option>
                                <option value="69" label="69">69</option>
                                <option value="70" label="70">70</option>
                                <option value="71" label="71">71</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-sm-12">

                        <div class="form-group col-sm-2">
                            <label class="labeltext">Qualification</label>
                        </div>

                        <div class="form-group col-sm-4">
                            <select id="drpPartnerEducationType" name="EducationType" class="form-control selectpicker" multiple="multiple" data-max-options="3">
								<option value="Less Than High School">Less Than High School</option>
								<option value="High School">High School</option>
								<option value="Undergraduate">Undergraduate</option>
								<option value="Bachelor's Degree">Bachelor's Degree</option>
								<option value="Engineering Degree">Engineering Degree</option>
								<option value="Masters Degree">Masters Degree</option>
								<option value="Doctorate">Doctorate</option>
								<option value="Others">Others</option>
							</select>
                        </div>

                        <div class="form-group col-sm-2">
                            <label class="labeltext">Marital Status</label>
                        </div>

                        <div class="form-group col-sm-4">
                            <select id="drpPartnerMaritalStatus" name="EducationType" class="form-control">
								<option value="Never Married">Never Married</option>
								<option value="Divorced">Divorced</option>
								<option value="Widowed">Widowed</option>
								<option value="Awaiting Divorce">Awaiting Divorce</option>
								<option value="Annulled">Annulled</option>
							</select>
                        </div>

                    </div>
                    
                    <div class="col-sm-12">

                    <div class="form-group col-sm-2">
                            <label class="labeltext">Height</label>
                        </div>

                    <div class="col-sm-3 form-group">
                        <select name="height" id="drpPartnerHeightFrom" class="form-control">
                           
                            <option value="4ft 5in - 134cm">4ft 5in - 134cm</option>
                            <option value="ft 6in - 137cm">4ft 6in - 137cm</option>
                            <option value="ft 7in - 139cm">4ft 7in - 139cm</option>
                            <option value="4ft 8in - 142cm">4ft 8in - 142cm</option>
                            <option value="4ft 9in - 144cm">4ft 9in - 144cm</option>
                            <option value="4ft 10in - 147cm">4ft 10in - 147cm</option>
                            <option value="4ft 11in - 149cm">4ft 11in - 149cm</option>
                            <option value="5ft - 152cm">5ft - 152cm</option>
                            <option value="5ft 1in - 154cm">5ft 1in - 154cm</option>
                            <option value="5ft 2in - 157cm">5ft 2in - 157cm</option>
                            <option value="5ft 3in - 160cm">5ft 3in - 160cm</option>
                            <option value="5ft 4in - 162cm">5ft 4in - 162cm</option>
                            <option value="5ft 5in - 165cm">5ft 5in - 165cm</option>
                            <option value="5ft 6in - 167cm">5ft 6in - 167cm</option>
                            <option value="5ft 7in - 170cm">5ft 7in - 170cm</option>
                            <option value="5ft 8in - 172cm" selected="selected">5ft 8in - 172cm</option>
                            <option value="5ft 9in - 175cm">5ft 9in - 175cm</option>
                            <option value="5ft 10in - 177cm">5ft 10in - 177cm</option>
                            <option value="5ft 11in - 180cm">5ft 11in - 180cm</option>
                            <option value="6ft - 182cm">6ft - 182cm</option>
                            <option value="6ft 1in - 185cm">6ft 1in - 185cm</option>
                            <option value="6ft 2in - 187cm">6ft 2in - 187cm</option>
                            <option value="6ft 3in - 190cm">6ft 3in - 190cm</option>
                            <option value="6ft 4in - 193cm">6ft 4in - 193cm</option>
                            <option value="6ft 5in - 195cm">6ft 5in - 195cm</option>
                            <option value="6ft 6in - 198cm">6ft 6in - 198cm</option>
                            <option value="6ft 7in - 200cm">6ft 7in - 200cm</option>
                            <option value="6ft 8in - 203cm">6ft 8in - 203cm</option>
                            <option value="6ft 9in - 205cm">6ft 9in - 205cm</option>
                            <option value="6ft 10in - 208cm">6ft 10in - 208cm</option>
                            <option value="6ft 11in - 210cm">6ft 11in - 210cm</option>
                            <option value="7ft - 213cm">7ft - 213cm</option>
                        </select>
                    </div>

                    <div class="col-sm-1 form-group">
                            <span> to</span>
                    </div>

                    <div class="col-sm-3 form-group">
                        <select name="height" id="drpPartnerHeightTo" class="form-control">
                            
                            <option value="4ft 5in - 134cm">4ft 5in - 134cm</option>
                            <option value="ft 6in - 137cm">4ft 6in - 137cm</option>
                            <option value="ft 7in - 139cm">4ft 7in - 139cm</option>
                            <option value="4ft 8in - 142cm">4ft 8in - 142cm</option>
                            <option value="4ft 9in - 144cm">4ft 9in - 144cm</option>
                            <option value="4ft 10in - 147cm">4ft 10in - 147cm</option>
                            <option value="4ft 11in - 149cm">4ft 11in - 149cm</option>
                            <option value="5ft - 152cm">5ft - 152cm</option>
                            <option value="5ft 1in - 154cm">5ft 1in - 154cm</option>
                            <option value="5ft 2in - 157cm">5ft 2in - 157cm</option>
                            <option value="5ft 3in - 160cm">5ft 3in - 160cm</option>
                            <option value="5ft 4in - 162cm">5ft 4in - 162cm</option>
                            <option value="5ft 5in - 165cm">5ft 5in - 165cm</option>
                            <option value="5ft 6in - 167cm">5ft 6in - 167cm</option>
                            <option value="5ft 7in - 170cm">5ft 7in - 170cm</option>
                            <option value="5ft 8in - 172cm" selected="selected">5ft 8in - 172cm</option>
                            <option value="5ft 9in - 175cm">5ft 9in - 175cm</option>
                            <option value="5ft 10in - 177cm">5ft 10in - 177cm</option>
                            <option value="5ft 11in - 180cm">5ft 11in - 180cm</option>
                            <option value="6ft - 182cm">6ft - 182cm</option>
                            <option value="6ft 1in - 185cm">6ft 1in - 185cm</option>
                            <option value="6ft 2in - 187cm">6ft 2in - 187cm</option>
                            <option value="6ft 3in - 190cm">6ft 3in - 190cm</option>
                            <option value="6ft 4in - 193cm">6ft 4in - 193cm</option>
                            <option value="6ft 5in - 195cm">6ft 5in - 195cm</option>
                            <option value="6ft 6in - 198cm">6ft 6in - 198cm</option>
                            <option value="6ft 7in - 200cm">6ft 7in - 200cm</option>
                            <option value="6ft 8in - 203cm">6ft 8in - 203cm</option>
                            <option value="6ft 9in - 205cm">6ft 9in - 205cm</option>
                            <option value="6ft 10in - 208cm">6ft 10in - 208cm</option>
                            <option value="6ft 11in - 210cm">6ft 11in - 210cm</option>
                            <option value="7ft - 213cm">7ft - 213cm</option>
                        </select>
                    </div>
                    </div>

                        <div class="row col-sm-12">
                            <br /><br />
                            <div class="form-group col-sm-6">
                                <input type="button" name="previous" class="previous action-button" value="Previous" />
                            </div>
                            <div class="form-group col-sm-6">
                                <input type="button" name="next" class="next action-button" value="Next" />
                            </div>
                        </div>
                    </div>
                </fieldset>


                <!-----End of third fieldset------>

                <fieldset id="family_information">
                    <div>
                        <br />
                        <h2 class="fs-title">Family Information</h2><br />

                        <!----Father name here--->
                        <div class="col-sm-12">
                            <div class="form-group col-sm-2">
                                <label class="labeltext">Father's Name</label>
                            </div>
                            <div class="form-group col-sm-4">
                                <input type="text" maxlength="20" class="form-control" id="txtFatherName" name="txtFatherName" placeholder="Father Name" />
                            </div>
                            <!----Mother name here--->
                            <div class="form-group col-sm-2">
                                <label class="labeltext">Mother's Name</label>
                            </div>
                            <div class="form-group col-sm-4">
                                <input type="text" maxlength="20" class="form-control" id="txtMotherName" name="txtMotherName" placeholder="Mother Name" />
                            </div> 
                        </div>

                        <div class="col-sm-12">
                     
                            <!----father work fields here--->
                            <div class="form-group col-sm-2">
                                <label class="labeltext">Father Profession</label>
                            </div>
                            <div class="form-group col-sm-4">
                                <input type="text" maxlength="20" class="form-control" id="txtFatherWork" name="txtFatherWork" placeholder="Father Profession" />
                            </div>
                            
                            <!----Mother work fields here--->
                            <div class="form-group col-sm-2">
                                <label class="labeltext">Mother Profession</label>
                            </div>
                            <div class="form-group col-sm-4">
                                <input type="text" maxlength="20" class="form-control" id="txtMotherWork" name="txtMotherWork" placeholder="Mother Profession" />
                            </div>
                        </div>

                        <div class="col-sm-12">

                            <!---Name of Grand Father Name-->
                            <div class="form-group col-sm-2">
                                <label class="labeltext">GrandFather Name</label>
                            </div>
                            <div class="form-group col-sm-4">
                              <input type="text" maxlength="20" class="form-control" id="txtGrandFather" name="txtGrandFather" placeholder="Grand Father Name" />
                            </div>

                             <!---Name of Grand Mother Name-->
                            <div class="form-group col-sm-2">
                                <label class="labeltext">GrandMother Name</label>
                            </div>
                            <div class="form-group col-sm-4">
                                <input type="text" maxlength="20" class="form-control" id="txtGrandMother" name="txtGrandMother" placeholder="Grand Mother Name" />
                            </div>
                        </div>

                        <div class="col-sm-12">

                            <!----No of brother you have---->
                            <div class="form-group col-sm-2">
                                <label class="labeltext">No Of Brother</label>
                            </div>
                            <div class="form-group col-sm-4">
                                <select id="drpBrotherNo" class="form-control" name="drpBrotherNo">
                                <option value="0">0</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                </select>
                            </div>

                            <!---No of Brother Married-->
                            <div class="form-group col-sm-2">
                                <label class="labeltext">Married Brother</label>
                            </div>
                            <div class="form-group col-sm-4">
                            <select id="drpBrotherMarriedNo" class="form-control" name="drpBrotherMarriedNo">
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                            </select>
                        </div>
                        </div>

                        <div class="col-sm-12">

                        <!-------No of Sister You Have------>
                        <div class="form-group col-sm-2">
                                <label class="labeltext">No Of Sister</label>
                            </div>
                        <div class="form-group col-sm-4">

                            <select id="drpSisterNo" class="form-control" name="drpSisterNo">
                            <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                            </select>
                        </div>

                        <!---No of Sister Married-->
                        <div class="form-group col-sm-2">
                                <label class="labeltext">Married Sister</label>
                            </div>
                        <div class="form-group col-sm-4">
                            <select id="drpSisterMarriedNo" class="form-control" name="drpSisterMarriedNo">
                            <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                            </select>
                        </div>
                    </div>

                        <div class="col-sm-12">
                            <!----Food habbit of family --->
                            <div class="form-group col-sm-2">
                                    <label class="labeltext">Food Type</label>
                                </div>
                            <div class="form-group col-sm-4">
                                <select id="drpFamilyFoodHabbit" class="form-control" name="drpFamilyFoodHabbit">
                                    <option value="">---- Select Food Type Of Family ----</option>
                                    <option value="Vegetarian">Vegetarian</option>
                                    <option value="NonVeg">Non-Veg</option>
                                    <option value="Eggetarian">Eggetarian</option>
                                </select>
                            </div>

                            <!----Social Work by person fields here--->
                            <div class="form-group col-sm-2">
                                    <label class="labeltext">Social Work</label>
                                </div>
                            <div class="form-group col-sm-4">
                                <input type="text" class="form-control" id="txtSocialWork" name="txtSocialWork" placeholder="Social Work Done By Family" />
                            </div>
                        </div>

                        <div class="col-sm-12">
                    
                            <!----Any disease history in family--->
                            <div class="form-group col-sm-2">
                                    <label class="labeltext">Disease</label>
                                </div>
                            <div class="form-group col-sm-4">
                                <input type="text" class="form-control" id="txtAnyDisease" name="txtAnyDisease" placeholder="Any disease history in family" />
                            </div>

                             <!----Any achievement of the family--->
                            <div class="form-group col-sm-2">
                                    <label class="labeltext">Achievement</label>
                                </div>
                            <div class="form-group col-sm-4">
                                <input type="text" class="form-control" id="txtAChievement" name="txtAChievement" placeholder="Any other achievement of the family" />
                            </div>
                        </div>


                        <div class="col-sm-12">
                            <div class="form-group col-sm-6">
                                <input type="button" name="previous" class="previous action-button" value="Previous" />
                            </div>
                            <div class="form-group col-sm-6">
                                <input type="button" name="next" class="next action-button" value="Submit" />
                            </div>
                        </div>
                    </div>

                </fieldset>

            </div>
            <div class="col-sm-1">
            </div>
        </div>

        <!----Script code start here----->

        <script>

            // this function is user to restriction on age 18 and 21 female, male

            $('#DateOfBirth').focusout(function () {

                dob = new Date($("#DateOfBirth").val());
                var gender = $("#drpGender").val();
                var today = new Date();
                var age = Math.floor((today - dob) / (365.25 * 24 * 60 * 60 * 1000));
                if (gender != "") {
                    if (gender == "Male") {
                        if (age < 21) {
                            alert("Sorry, you are not elligible for marriage yet!");
                            $("#DateOfBirth").val('');
                        }
                    }

                    if (gender == "Female") {
                        if (age < 18) {
                            alert("Sorry, you are not elligible for marriage yet!");
                            $("#DateOfBirth").val('');
                        }
                    }
                    
                } else {
                    alert("Please select gender!");
                    $("#DateOfBirth").val('');
                }
            });

            
            // this function is used to save email id into data base and get user Id
            function saveEmail() {
                var data = {
                    "email": $("#txtEmail").val(),
                    "userid": $("#UserId").val()
                }
                $.ajax({
                    url: "/Matrimonial.aspx/SaveEmailID",
                    data: JSON.stringify(data),
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json",
                    success: function (msg) {
                        $("#UserId").val(msg.d);
                    }
                });
            }

            // This function is used to save phone no in to database or update
            function savePhoneNo()
            {
                var data = {
                    "phone": $("#txtMobile").val(),
                    "id":$("#UserId").val()
                }
                $.ajax({
                    url: "/Matrimonial.aspx/SavePhoneNo",
                    data: JSON.stringify(data),
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json",
                    success: function (msg) {
                    }
                });
            }

            // this function is used to save basic information
            function saveBasicInformation()
            {
                var presentAddress = $("#txtStreetAddress").val() + ' ' + $("#txtCity").val() + ' ' + $("#txtState").val() + ' ' + $("#txtPinCode").val();
                var parmanentAddress = $("#txtStreetAddress2").val() + ' ' + $("#txtCity2").val() + ' ' + $("#txtState2").val() + ' ' + $("#txtPinCode2").val();
                var data = {
                    "lastName": $("#txtLastName").val(),
                    "email": $("#txtEmail").val(),
                    "phone": $("#txtMobile").val(),
                    "nativePlace": $("#txtNativePlace").val(),
                    "name": $("#txtName").val(),
                    "address": presentAddress,
                    "DOB": $("#DateOfBirth").val(),
                    "gender": $("#drpGender").val(),
                    "category": $("#drpCategory").val(),
                    "height": $("#drpHeight").val(),
                    "weight": $("#txtWeight").val(),
                    "maritalStatus": $("#drpMaritalStatus").val(),
                    "parmanentAddress":parmanentAddress,
                    "id": $("#UserId").val()
                };
                $.ajax({
                    url: "/Matrimonial.aspx/saveBasicInformation",
                    data: JSON.stringify(data),
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json",
                    success: function (msg) {
                    }
                });
            }

            // this function is used to save and update other information
            function SaveOtherInformation() {
                
                var language = $("#drpLanguage").val();
                var partnerQualification = $("#drpPartnerEducationType").val();

                if (language == null) {
                    language = " ";
                }
                if (partnerQualification == null) {
                    partnerQualification = " ";
                }
                var data = {
                    "id": $("#UserId").val(),
                    "qualification": $("#EducationType").val(),
                    "education": $("#txtEducationDiscription").val(),
                    "posting": $("#txtPosting").val(),
                    "foodHabbit": $("#drpFoodHabbit").val(),
                    "language": language.toLocaleString(),
                    "smoke": $("#drpSmoking").val(),
                    "drink": $("#drpDrinking").val(),
                    "work": $("#txtWork").val(),
                    "partnerHeightTo": $("#drpPartnerHeightTo").val(),
                    "partnerHeightfrom": $("#drpPartnerHeightFrom").val(),
                    "partnerQualification": partnerQualification.toLocaleString(),
                    "partnerMarriedStatus": $("#drpPartnerMaritalStatus").val(),
                    "partnerAgeFrom": $("#drpAgeFrom").val(),
                    "partnerAgeTo": $("#drpAgeTo").val(),
                    "occupationType": $("#OccupationType").val(),
                    "annualIncome": $("#txtAnnualIncome").val(),
                    "jobDiscription": $("#txtJobDiscription").val()
                };
                $.ajax({
                    url: "/Matrimonial.aspx/SaveOtherInformation",
                    data: JSON.stringify(data),
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json",
                    success: function (msg) {
                        //alert(msg.d);
                    }
                });
            }

            // this function is used to save and update family infomation
            function saveFamilyInformation() {
                var data = {
                    "id":$("#UserId").val(),
                    "grandMother": $("#txtGrandMother").val(),
                    "grandFather": $("#txtGrandFather").val(),
                    "brotherNo": $("#drpBrotherNo").val(),
                    "brotherMarried": $("#drpBrotherMarriedNo").val(),
                    "sisterNo": $("#drpSisterNo").val(),
                    "sisterMarried": $("#drpSisterMarriedNo").val(),
                    "familyFood": $("#drpFamilyFoodHabbit").val(),
                    "fatherName": $("#txtFatherName").val(),
                    "motherName": $("#txtMotherName").val(),
                    "motherWork": $("#txtMotherWork").val(),
                    "fatherWork": $("#txtFatherWork").val(),
                    "socialWork": $("#txtSocialWork").val(),
                    "disease": $("#txtAnyDisease").val(),
                    "achievement": $("#txtAChievement").val(),
                };
                $.ajax({
                    url: "/Matrimonial.aspx/SaveFamilyInformation",
                    data: JSON.stringify(data),
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json",
                    success: function (msg) {
                        if (msg.d == "Record save successfully!") {
                            alert("Record save successfully and your login ID and password send on given mobile number and email plaese check them!");
                            window.location.href = "/MatrimonialLogin.aspx";
                        }
                    }
                });
                
            }

            <%--var proFileImage;
                $(document).on('change', '#<%= uploadProfilePhoto.ClientID%>', function (e) {
                    proFileImage = e.target.files[0].name;
                });--%>

            // this function is used to file same address in parmanent address which in present address
            $('#chbSameAddress').click(function () {
                if ($("#txtStreetAddress").val() != "" || $("#txtCity").val() != "" || $("#txtState").val() != "" || $("#txtPinCode").val() != "") {
                    if ($('#chbSameAddress').is(':checked')) {
                        $("#txtStreetAddress2").val($("#txtStreetAddress").val());
                        $("#txtCity2").val($("#txtCity").val());
                        $("#txtState2").val($("#txtState").val());
                        $("#txtPinCode2").val($("#txtPinCode").val());
                    } else {
                        $("#txtStreetAddress2").val('');
                        $("#txtCity2").val('');
                        $("#txtState2").val('');
                        $("#txtPinCode2").val('');
                    }
                }
                else {
                    alert("Please fill present address!");
                    $('#chbSameAddress').attr('checked', false);
                }
            });

            // key press function
            $("#txtEmail").keypress(function () {
                $("#emailError").hide();
            });

            // this function is used press only numarical in that fields
            $("#txtPinCode2").keydown(function (e) {
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
            $("#txtPinCode").keydown(function (e) {
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
            $("#txtAnnualIncome").keydown(function (e) {
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

            // this function is used to fill only min to max
            $('#drpAgeTo').change(function () {

                if ($('#drpAgeTo').val() < $('#drpAgeFrom').val()) {
                    alert("Age should be minmum to maximum!");
                    $('#drpAgeTo').val($('#drpAgeFrom').val());
                }
                else { }
            });

            // not select married brother than brother
            $('#drpBrotherMarriedNo').change(function () {

                if ($('#drpBrotherNo').val() < $('#drpBrotherMarriedNo').val()) {
                    alert("You can't select more than, you have brothers!")
                    $('#drpBrotherMarriedNo').val($('#drpBrotherNo').val()) ;
                }
                else { }
            });

            // not select married sister than sister have
            $('#drpSisterMarriedNo').change(function () {

                if ($('#drpSisterNo').val() < $('#drpSisterMarriedNo').val()) {
                    alert("You can't select more than, you have sisters!")
                    $('#drpSisterMarriedNo').val($('#drpSisterNo').val());
                }
                else { }
            });

            // this function is used only fills alfabets
            $("#username").keypress(function (event) {
                var inputValue = event.which;
                // allow letters and whitespaces only.
                if (!(inputValue >= 65 && inputValue <= 120) && (inputValue != 32 && inputValue != 0)) {
                    event.preventDefault();
                }
            });

            var count = 1;

            // this function is used to check a valid email id format and return a ture or false
            function validEmail(v) {
                var r = new RegExp("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
                return (v.match(r) == null) ? false : true;
            }

            //This function is send email or mobile number to serverside and
            //Generate OTP and send on Email or Mobile Number
            function GetOTPNumber(OTPType, ValueOfMobileOrEmail) {

                var data = {
                    "OTPtype": OTPType,
                    "EmailOrMobile": ValueOfMobileOrEmail
                };
                if (OTPType == "Email" && ValueOfMobileOrEmail == "") {
                    $("#emailError").show();
                    $("#emailError").html("Please enter email address");
                }
                else if (OTPType == "Email" && validEmail(ValueOfMobileOrEmail) == false) {
                    $("#emailError").show();
                    $("#emailError").html("Please enter valid email address");
                }
                
                else if ((ValueOfMobileOrEmail == "" && OTPType == "Mobile") || ValueOfMobileOrEmail.length < 10) {
                    $("#phoneError").show();
                    $("#phoneError").html("Please enter mobile number");
                }
                else {
                    $.ajax({
                        url: "/Matrimonial.aspx/OtpGenerate",
                        data: JSON.stringify(data),
                        type: "POST",
                        dataType: "json",
                        contentType: "application/json",
                        success: function (msg) {

                            if (msg.d == "NotValid") {
                                alert("This email already registered please change or fill other email!");
                                $('#btnEmail').hide();
                            }

                            else {
                                $('#btnEmail').show();
                                if (OTPType == "Email") {
                                    alert("Your OTP has been sent to provided email address.\nPlease check that now.");
                                    $('#otpgenerate').prop('value', 'Re-GenerateOTP');
                                }

                                if (OTPType == "Mobile") {
                                    alert("Your OTP has been sent to provided mobile number.\nPlease check that now.");
                                    $('#otpgenerateForMobile').prop('value', 'Re-GenerateOTP');
                                }
                                $("#random").val(msg.d);

                            }
                        },
                        error: function () {
                            alert("Please try again!");
                        }
                    });
                }
            }

            //Document page load here  

            $(document).ready(function () {
               
                //jQuery time
                var current_fs, next_fs, previous_fs; //fieldsets
                var left, opacity, scale; //fieldset properties which we will animate
                var animating;
                $(".next").click(function () {
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

                            txtFatherName: {
                                required: true,
                            },

                            txtMotherName: {
                                required: true,
                            },

                            drpCategory: {
                                required: true,
                            },

                            drpGender: {
                                required: true,
                            },

                            txtEmail: {
                                required: true,
                            },

                            txtMobile: {
                                required: true,
                                minlength: 10,
                            },

                            DateOfBirth: {
                                required: true,
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
                                required: "User name required",
                            },

                            drpCategory: {
                                required: "Select at least one category",
                            },

                            drpGender: {
                                required: "Select gender",
                            },

                            txtFatherName: {
                                required: "Father name required",
                            },

                            txtMotherName: {
                                required: "Mother name required",
                            },

                            txtMobile: {
                                required: "Mobile number required",
                            },

                            DateOfBirth: {
                                required: "Date of birth required",
                            },

                            txtOtp: {
                                required: "OTP required",
                                equalTo: "OTP doesn't match, please try again.",
                            },

                            txtOtpMobile: {
                                required: "OTP required",
                                equalTo: "OTP doesn't match, please try again.",
                            },

                            txtEmail: {
                                required: "Email required",
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
                        
                        if ($('#Email_information').is(":visible")) {
                        current_fs = $('#Email_information');
                        next_fs = $('#Mobile_information');
                        }else if ($('#Mobile_information').is(":visible")) {
                        current_fs = $('#Mobile_information');
                        next_fs = $('#Basic_Details');
                        } else if ($('#Basic_Details').is(":visible")) {
                            current_fs = $('#Basic_Details');
                            next_fs = $('#Other_information');
                        } else if ($('#Other_information').is(":visible")) {
                            current_fs = $('#Other_information');
                            next_fs = $('#family_information');
                        }
                        next_fs.show();
                        current_fs.hide();
                    }

                    //// here is function which stored all data at every steps in to the database and it's call after all the stages complete by the user
                    
                    if (count == 2)
                    {
                        saveEmail();
                    }
                    if (count == 3)
                    {
                        savePhoneNo();
                    }
                    if (count == 4)
                    {
                        saveBasicInformation();
                    }
                    if (count == 5) {
                        SaveOtherInformation();
                    }
                    if (count == 6) {
                        saveFamilyInformation();
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

                    if ($('#family_information').is(":visible")) {
                        current_fs = $('#family_information');
                        previous_fs = $('#Other_information');
                    } else if ($('#Other_information').is(":visible")) {
                        current_fs = $('#Other_information');
                        previous_fs = $('#Basic_Details');
                    } else if ($('#Basic_Details').is(":visible")) {
                        current_fs = $('#Basic_Details');
                        previous_fs = $('#Mobile_information');
                    } else if ($('#Mobile_information').is(":visible")) {
                        current_fs = $('#Mobile_information');
                        previous_fs = $('#Email_information');
                    } else if ($('#Email_information').is(":visible")) {
                        current_fs = $('#Email_information');
                        previous_fs = $('#Email_information');
                    }
                    previous_fs.show();
                    current_fs.hide();
                });
            });

        </script>
    </div>
</asp:Content>
