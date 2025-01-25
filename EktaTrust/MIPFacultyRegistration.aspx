<%@ Page Title="" Language="vb" AutoEventWireup="false" EnableEventValidation="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="MIPFacultyRegistration.aspx.vb" Inherits="EktaTrust.MIPFacultyRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .about-us h3 {
        color:black !important;
        }
    </style>
  

    <div class="about-us">
  <div class="container">
    <h2 class="wow fadeInDown">MIP Faculty Registration</h2>
        <span style="color: green; font-weight: bold">
                             <asp:Label ID="lblErrorMsg" runat="server"></asp:Label></span>
                        <span style="color: red; font-weight: bold">
                             <asp:Label ID="lblErrorMsgMobile" runat="server"></asp:Label></span>
            
                    <div id="divEmailConfirm" class="wow fadeInDown">
                        <br />
                        <h3 class="fs-title">Email ID Confirmation</h3>
                        <br />

                        <!----fields for mobile number--->
                        
                    <div class="form-group inputs col-sm-12">
                        <div class="col-sm-3">
                            <label>Email Address</label> 
                        </div>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="txtEmail" name="txtEmail" placeholder="Enter your email address" />
                            <span id="emailError" style="color: red"></span>
                        </div>
                    </div>
                    
                    <input type="hidden" id="random" />
                         
                    <div class="form-group inputs col-sm-12">
                        <div class="col-sm-3">
                        <label>Enter OTP</label>
                            </div>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="txtOtp" name="txtOtp" placeholder="Enter your OTP" />
                        </div>
                    </div>
                    <div class="row col-sm-12">
                        <div class="col-sm-3"></div>
                        <div class="form-group col-sm-9">
                            <div class="form-group col-sm-6">
                                <input type="button" id="otpgenerate" class="btn btn-success form-control" name="submit" onclick="GetOTPNumber('Email', $('#txtEmail').val());" value="Generate OTP" />
                            </div>
                            <div class="form-group col-sm-6">
                                <input type="button" id="btnEmail" name="next" class="btn btn-success form-control" value="Next" />
                            </div>
                        </div>
                        </div>
                    </div>
                
            <div class="row contact-wrap  wow fadeInDown" id="divRegistrationFaculty">
            
                <div class="status alert alert-success" style="display: none"></div>
                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                         
                        
                        <!----Name Text Fields----> 
                        <div class="form-group">
                            <label>Name
                                <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" controltovalidate="txtName" ForeColor="Red" ErrorMessage="Please Enter Name."  ToolTip="Please Enter Name." />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtName"
                             ValidationExpression="[a-zA-Z ]*$" ErrorMessage="Please only alphabets value." ForeColor="Red"/>
                            </label> 
                             <asp:TextBox ID="txtName" runat="server" class="form-control"></asp:TextBox>
                       </div>
                        
                        <!----Email Text Fields---->
                        <div class="form-group">
                            <label>Email Address
                              <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ControlToValidate="txtEmail2" ForeColor="Red" ErrorMessage="Please enter valid email id format." /></label>
                             <asp:TextBox ID="txtEmail2" runat="server" class="form-control"></asp:TextBox>                        
                        </div>

                      <!----Mobile No Text Fields---->
                        <div class="form-group">
                            <label>Mobile Number 
                            <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator2" controltovalidate="txtMobile" ForeColor="Red" ErrorMessage="Please Enter Mobile Number."  ToolTip="Please Enter Mobile Number." /> </label>
                            <asp:RegularExpressionValidator ID="RegExp1" runat="server" ErrorMessage="Accept only Integer value maximum value 10."  ForeColor="Red" ControlToValidate="txtMobile" ValidationExpression="^[0-9]{7,10}$" />
                             <asp:TextBox ID="txtMobile" runat="server" class="form-control"></asp:TextBox>
                        </div> 
                        
                        <!----Address Text Fields---->
                        <div class="form-group">
                            <label>Address
                            <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator6" controltovalidate="txtAddress" ForeColor="Red" ErrorMessage="Please Enter Your Address."  ToolTip="Please Enter Your Address." />
                            </label>
                            <asp:TextBox ID="txtAddress" runat="server" Rows="5" Columns="40" TextMode="multiline" class="form-control" placeholder="Address......"></asp:TextBox>
                        </div>  
                    </div>

                <!---Right part of form-->

                 <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                         <span style="color: green; font-weight: bold">
                             <asp:Label ID="Label1" runat="server"></asp:Label></span>

                     <!----Occupation/Service Text Fields---->
                         <div class="form-group">
                            <label>Occupation/Service/Batch</label> 
                            <asp:TextBox ID="txtOccupation" runat="server" class="form-control"></asp:TextBox> 
                           </div>

                     <!----Present Posting Text Fields---->
                        <div class="form-group">
                            <label>Present Posting </label>
                            <asp:TextBox ID="txtPosting" runat="server" class="form-control"></asp:TextBox> 
                        </div>

                     <!----SubJect Specification Text Fields---->
                        <div class="form-group">
                            <label>Subject Specialization</label>
                            <asp:TextBox ID="txtSubSpecialistion" runat="server" class="form-control"></asp:TextBox> 
                        </div>

                     <!----Date Of Availability Text Fields---->
                        <div class="form-group">
                            <label>Date of Availability</label>
                            <asp:TextBox ID="txtDate" type="Date" runat="server" class="form-control"></asp:TextBox>
                        </div>

                     <!---Check Box Here-->
                     <div runat="server" id="divTermscondition" class="form-group">
                            <asp:checkbox id="chbCondition" runat="server"></asp:checkbox>
                            <a href="../TermsAndCondition" target="_blank">
                                <label style="cursor:pointer">I Accept the Terms and Conditions</label>
                            </a>
                     <br />
                            <span style="color: red; font-weight: bold">
                            <asp:Label ID="lblConditionMessage" runat="server"></asp:Label></span>
                     </div>
                     <!----Submit Button here--->

                        <div class="form-group">
                            <asp:button id="ButtonSubmitMessage" runat="server" class="btn btn-success btn-lg" text="Submit" onClick="ButtonSubmitMessage_Click" OnClientClick="condtionChecked();"/>
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
                           25, Bhagwati Nagar II, Kartarpura,<br />
                            Jaipur,302006
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
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" group="email" ControlToValidate="txtSignupEmail" ForeColor="Red" ErrorMessage="*" ToolTip="Please Enter EmailId" />
                            <asp:RegularExpressionValidator runat="server" Display="Dynamic" group="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ControlToValidate="txtSignupEmail" ForeColor="Red" ErrorMessage="Please enter valid email id format." />
                            <input type="button" value="Subscribe" class="btn btn-large btn-primary" id="btncall" />
                        </address>
                    </div>

     
    </div>
  </div>
</section>
    <style>
        .ordinal {
  font-size:small;
  position: relative;
  top: -0.5em;
  text-transform:capitalize;
}
        .lablehand {
            
        visibility:visible !important;
        }
           
    </style>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#divRegistrationFaculty').hide();
            $('#btnEmail').attr('disabled', 'disabled');
            $('#btnEmail').click(function () {
                if ($('#txtOtp').val() == $('#random').val()) {
                    $('#divEmailConfirm').hide();
                    $('#divRegistrationFaculty').show();
                }
                else {
                    alert("Otp does not match, Please try again!");
                }

            });
            $("#txtOtp").keyup(function () {
                if ($('#txtOtp').val() != null && $('#txtOtp').val() != "") {
                    $('#btnEmail').removeAttr('disabled');
                }
                else {
                    $('#btnEmail').attr('disabled', 'disabled');
                }
            });
        });

        $("#txtEmail").keypress(function () {
            $("#emailError").hide();
        });

        // this function is used to check a valid email id format and return a ture or false
        function validEmail(v) {
            var r = new RegExp("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
            return (v.match(r) == null) ? false : true;
        }


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

            else {
                $.ajax({
                    url: "/MIPFacultyRegistration.aspx/OtpGenerate",
                    data: JSON.stringify(data),
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json",
                    success: function (msg) {

                        //if (msg.d == "NotValid") {
                        //    alert("This email already registered please change or fill other email!");
                        //    $('#btnEmail').hide();
                        //}

                        //else {
                        //    $('#btnEmail').show();
                            if (OTPType == "Email") {
                                alert("Your OTP has been sent to provided email address.\nPlease check that now!");
                                $('#otpgenerate').prop('value', 'Re-GenerateOTP');
                            }
                        $("#random").val(msg.d);

                        //}
                    },
                    error: function () {
                        alert("Please try again!");
                    }
                });
            }
        }

        function condtionChecked()
        {

             if ($('#<%=chbCondition.ClientID %>').attr('checked', true) != true)
            {
                $('#<%=lblConditionMessage.ClientID %>').text("Please check Terms&Conditions!");
            }
        }

    </script>

</asp:Content>
