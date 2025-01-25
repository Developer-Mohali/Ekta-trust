<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="MIPRegistration.aspx.vb" EnableEventValidation="false" Inherits="EktaTrust.MIPRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
  <div class="container">
      <h2 class="wow fadeInDown" id="hadline">
      <asp:Label ID="lblTitle" runat="server" Text="Label"></asp:Label></h2>
                        <span style="color: green; font-weight: bold">
                             <asp:Label ID="lblErrorMsg" runat="server"></asp:Label></span>
                        <span style="color: red; font-weight: bold">
                             <asp:Label ID="lblErrorMsgMobile" runat="server"></asp:Label></span>
      
            <div class="row contact-wrap  wow fadeInDown" id="MipRegistration">
           <img src="images/moke-image.png" class="img-responsive wow fadeInDown pull-right hidden-sm hidden-xs hidden-md" alt="" style="margin-top:150px" /> 

                <div class="status alert alert-success" style="display: none"></div>
                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                        
                        <div class="form-group">
                           
                            <label>Name <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" controltovalidate="textName" ForeColor="Red" ErrorMessage="Please enter name."  ToolTip="Please enter name." />
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="textName"
                             ValidationExpression="[a-zA-Z ]*$" ErrorMessage="Please only alphabets value." ForeColor="Red"/>
                            </label>
                             <asp:TextBox ID="textName" runat="server" class="form-control"></asp:TextBox>
                       
                       </div>
                         <div class="form-group">
                            <label>Roll No <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator3" controltovalidate="RollNo" ForeColor="Red" ErrorMessage="Please enter roll no."  ToolTip="Please enter roll no." /></label>
                            <asp:TextBox ID="RollNo" runat="server" class="form-control"></asp:TextBox> 
                           </div> 
                        <div class="form-group">
                            <label>Email Address</label>
                              <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ControlToValidate="textEmail" ForeColor="Red" ErrorMessage="Please enter valid email id format." />
                             <asp:TextBox ID="textEmail" runat="server" class="form-control"></asp:TextBox>                        
                        </div>
                      
                        <div class="form-group">
                            <label>Mobile Number <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator2" controltovalidate="textMobile" ForeColor="Red" ErrorMessage="Please enter mobile number."  ToolTip="Please enter mobile number." />
                                <asp:RegularExpressionValidator ID="RegExp1" runat="server" ErrorMessage="Accept only Integer value maximum value 10."  ForeColor="Red" ControlToValidate="textMobile" ValidationExpression="^[0-9]{7,10}$" />
                            </label> 
                             <asp:TextBox ID="textMobile" runat="server" class="form-control"></asp:TextBox>
                        </div> 
                          
                          <div class="form-group">
                            <label>Address</label>
                           <asp:TextBox ID="TextAddress" runat="server" Rows="5" Columns="40" TextMode="multiline" class="form-control" placeholder="Address"></asp:TextBox>
                        </div>
                            <div class="form-group">
                            <label style="color:red">Note: Upload DAF (pdf file) Max size 50MB 
                                <%--<asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator4" controltovalidate="FileUpload" ForeColor="Red" ErrorMessage="Registraion for MIP cannot be done without DAF uploading. Please upload DAF file and try again. Thanks !"  ToolTip="Please upload file." />--%>
                               
                            </label>
                            <asp:fileupload runat="server" class="form-control" id="FileUpload" onclientclick="CheckFile(this);" ></asp:fileupload>
                        </div>

                        <div runat="server" id="divTermscondition" class="form-group">                        <!---Check Box Here-->
                            <asp:checkbox id="chbCondition" runat="server"></asp:checkbox>
                            
                            <a href="../TermsAndCondition" target="_blank">
                                <label style="cursor:pointer">I Accept the Terms and Conditions</label>
                            </a>
                            <br />
                            <span style="color: red; font-weight: bold">
                            <asp:Label ID="lblConditionMessage" runat="server"></asp:Label></span>
                        </div>

                        <div class="form-group">
                            <asp:button id="ButtonSubmitMessage" runat="server" class="btn btn-success btn-lg" text="Submit" OnClientClick="condtionChecked();" OnClick="MIP_Registration"/>
                        </div>                    
                    </div>
            </div><!--/.row-->
      
  </div>

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
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" group="email" ControlToValidate="txtSignupEmail" ForeColor="Red" ErrorMessage="*" ToolTip="Please Enter EmailId" />
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
       
    </style>

      <script type="text/javascript">

          $(document).ready(function () {
              $("#MipRegistration").show();
              $("#mobileConfirnation").show();
              $('#btnMobile').attr('disabled', 'disabled');
              $('#btnMobile').click(function () {
                  if ($('#txtOtpMobile').val() == $('#random').val()) {
                      $('#mobileConfirnation').hide();
                      $('#MipRegistration').show();
                  }
                  else {
                      alert("Otp does not match, Please try again!");
                  }
              });
              $("#txtOtpMobile").keyup(function () {
                  if ($('#txtOtpMobile').val() != null && $('#txtOtpMobile').val() != "") {
                      $('#btnMobile').removeAttr('disabled');
                  }
                  else {
                      $('#btnMobile').attr('disabled', 'disabled');
                  }
              });
          });

          $("#txtMobile").keypress(function () {
              $("#phoneError").hide();
          });

        function GetOTPNumber(OTPType, ValueOfMobileOrEmail) {
            var data = {
                "OTPtype": OTPType,
                "EmailOrMobile": ValueOfMobileOrEmail
            };
            if ((ValueOfMobileOrEmail == "" && OTPType == "Mobile") || ValueOfMobileOrEmail.length < 10) {
                $("#phoneError").show();
                $("#phoneError").html("Please enter mobile number");
            }
            
            else {
                $.ajax({
                    url: "/MIPFacultyRegistration.aspx/OtpGenerate",
                    data: JSON.stringify(data),
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json",
                    success: function (msg) {

                           if (OTPType == "Mobile") {
                                alert("Your OTP has been sent to provided mobile number.\nPlease check that now!");
                                $('#otpgenerateForMobile').prop('value', 'Re-GenerateOTP');
                            }
                            $("#random").val(msg.d);
                    },
                    error: function () {
                        alert("Please try again!");
                    }
                });
            }
        }

          function condtionChecked() {
              if ($('#<%=chbCondition.ClientID %>').prop('checked') != true) {
                  $('#<%=lblConditionMessage.ClientID %>').css('display', 'block');
                  $('#<%=lblConditionMessage.ClientID %>').text("Please check Terms&Conditions!");
              }
              else
                  $('#<%=lblConditionMessage.ClientID %>').css('display','none');
        }

      </script>
</asp:Content>
