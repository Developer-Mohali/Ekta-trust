<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="Donation.aspx.vb" Inherits="EktaTrust.Donation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--event registration -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

    <!-- jQuery easing plugin -->
    <script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.js"></script>
     <asp:Literal ID="ltPaytmScript" runat="server"></asp:Literal>
    <div class="about-us">
  <div class="container">
    <h2 class="wow fadeInDown">Donation</h2>
    <p></p>
    <p>The online transfer facility through this website is available now.<%-- It will be introduced shortly...--%></p><%--<p>The details of the account are given below:</p>--%>
   <p><strong>Accepted Payment Methods:</strong> UPI, Credit/Debit Card, Net Banking</p>
      <p style="background-color: black; padding: 10px; border-radius: 10px; font-size:18px; "><strong style="color: white;"> Ekta Navnirman Trust</strong></p>
<%--    <table class="tables" >
        <tr>
           <td style="font-weight: bold;">A\C NO.:</td> 
            <td style="padding: 0px 0px 0px 15px;">35834326038</td> 
        </tr>
        <tr>
           <td style="font-weight: bold;">IFSC : </td>  
           <td style="padding: 0px 0px 0px 15px;"> SBIN0004227</td> 
        </tr>
        <tr>
           <td style="font-weight: bold;">Account Name :</td>  
           <td style="padding: 0px 0px 0px 15px;"> Ekta Navnirman Trust </td> 
        </tr>
        <tr>
           <td style="font-weight: bold;">Branch :</td>  
           <td style="padding: 0px 0px 0px 15px;"> SBI Chandpole Bazar, Jaipur</td> 
        </tr>
    </table>--%>
      <br/>
      <div class="container">
  <div class="row">
    
    <!-- Form Section -->
    <div class="col-lg-6 col-md-12">
      <div class="panel panel-default" style="padding:25px; border-radius:10px; box-shadow:0 4px 10px rgba(0,0,0,0.1);">
        
      <%--  <h3 class="text-center" style="margin-bottom:20px;">Donate Now</h3>--%>

        <form id="main-contact-form" method="post" action="#">
          
          <div class="form-group">
            <label>Full Name *</label>
            <input type="text" id="txtName" name="txtName" class="form-control" placeholder="Enter your full name" />
          </div>

          <div class="form-group">
            <label>Amount (₹) *</label>
            <input type="number" id="txtAmount" name="txtAmount" class="form-control" placeholder="Enter donation amount" />
          </div>

          <div class="form-group">
            <label>PAN Number *</label>
            <input type="text" id="txtPan" name="txtPan" class="form-control" placeholder="ABCDE1234F" style="text-transform:uppercase;" />
          </div>

          <div class="form-group">
            <label>Mobile Number</label>
            <input type="tel" id="txtMobile" class="form-control" placeholder="Enter mobile number" />
          </div>

          <div class="form-group">
            <label>Email Address</label>
            <input type="email" id="txtEmail" class="form-control" placeholder="Enter email address" />
          </div>

          <div class="form-group">
            <label>Address</label>
            <textarea id="txtComment" class="form-control" rows="2" placeholder="Enter your address"></textarea>
          </div>

          <div class="text-center">
            <button type="submit" id="btnDonate" class="btn btn-success btn-lg" style="padding:10px 30px; border-radius:30px;">
              Donate Now
            </button>
          </div>

        </form>
      </div>
    </div>

    <!-- Image Section -->
    <div class="col-lg-6 hidden-md hidden-sm hidden-xs text-center">
     <img src="images/donation.jpg" style=" padding-top:70px; padding-right:100px;" class="img-responsive pull-right hidden-sm hidden-xs hidden-md  wow fadeInDown" alt=""/>
    </div>

  </div>
</div>
<%--    <div class="contact-wrap">
        <img src="images/donation.jpg" style=" padding-top:70px; padding-right:100px;" class="img-responsive pull-right hidden-sm hidden-xs hidden-md  wow fadeInDown" alt=""/>
      <form id="main-contact-form" class="contact-form " name="contact-form" method="post" action="#">
        <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 nopadding">
          <div class="form-group">
            <label>Full Name *</label>
            <input type="text" name="name" id="txtName" class="form-control" />
          </div>
          <div class="form-group">
            <label>Amount *</label>
            <input type="text" name="txtAmount" id="txtAmount" class="form-control" />
          </div>
           <div class="form-group">
            <label>Pan Number *</label>
            <input type="text" name="txtPan" id="txtPan" class="form-control" style="text-transform: uppercase;" />
          </div>
          <div class="form-group">
            <label>Mobile</label>
            <input type="text" class="form-control" id="txtMobile" />
          </div>
           <div class="form-group">
            <label>EmailAddress</label>
            <input type="text" class="form-control" id="txtEmail" />
           </div>
     <%--     <div class="form-group">
            <asp:DropDownList CssClass="form-control" ID="ddlModeOfPayment1" runat="server">
              <asp:ListItem Value="Select">Select Payment Way</asp:ListItem>
                <asp:ListItem Value="UPI">UPI</asp:ListItem>
                <asp:ListItem Value="Credit Card">Credit Card</asp:ListItem>
              <asp:ListItem Value="Debit Card">Debit Card</asp:ListItem>
              <asp:ListItem Value="Net Banking">Net Banking</asp:ListItem>                                       
           </asp:DropDownList>
          </div>--%
            <div class="form-group">
              <label>Address</label>
              <textarea type="text" class="form-control" id="txtComment"></textarea>
            </div>
          <div class="form-group">
            <button type="submit" name="submit" id="btnDonate" class="btn btn-success btn-lg">Donate Now</button>
          </div>
        </div>
      </form>
      <!--/.row--> 
    </div>--%>
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
        <div class="pull-right"><a href="#"><i class="fa fa-telegram"></i></a><a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a></div>
        <strong>Ekta Navnirman Trust,</strong><br />
                             B-15, Pragati Path, Bajaj Nagar,<br />
                             Jaipur, Rajasthan-302015 <br/>
        <br/><img src="images/logo-small.jpg" class="img-responsive pull-right"  alt=""/>  
        <br/>
        <strong>Email Us</strong><br/>
        <a href="mailto:ektanavnirmantrust@gmail.com">ektanavnirmantrust@gmail.com</a><br/>
        <br/>
        <form method="post" role="form">
          <div class="input-group"> <span class="input-group-addon"> <i class="fa fa-envelope"></i> </span>
            <input class="form-control" type="text" placeholder="Signup Weekly Newsletter"/>
          </div> 
          <input type="submit" value="Subscribe" class="btn btn-large btn-primary" />
        </form>
        </address>
      </div>
    </div>
  </div>
</section>
<!--/#bottom-->
    <script>
        $(document).ready(function () {
            $("#msform").validate({
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
                    txtName: {
                        required: true,
                        minlength: 3
                    },
                    txtAmount: {
                        required: true,
                        number: true,
                        min: 1
                    },
                    txtPan: {
                        required: true,
                        minlength: 10,
                        maxlength: 10
                    }
                },

                messages: {
                    txtName: {
                        required: "Please enter your full name",
                        minlength: "Name must be at least 3 characters long"
                    },
                    txtAmount: {
                        required: "Please enter amount",
                        number: "Only numeric values allowed",
                        min: "Amount must be greater than 0"
                    },
                    txtPan: {
                        required: "Pan Number is Required",
                        minlength: "PAN must be 10 characters",
                        maxlength: "PAN must be 10 characters"
                    }
                }
            });
        });

        $("#btnDonate").click(function (event) {
            event.preventDefault();
            var name = $("#txtName").val().trim();
            var amount = $("#txtAmount").val().trim();
            var mobile = $("#txtMobile").val().trim();
            var email = $('#txtEmail').val().trim();
            <%--var paymentMode = $("#<%= ddlModeOfPayment1.ClientID %>").val();--%>

            if (!$("#msform").valid()) {
                return;
            }
        // ✅ Validation
        if (name === "") {
            alert("Enter Full Name");
            return;
        }

        if (amount === "" || isNaN(amount) || parseFloat(amount) <= 0) {
            alert("Enter valid amount");
            return;
        }

        //if (paymentMode === "Select") {
        //    alert("Select payment mode");
        //    return;
            //}
            $('#loader').show();
            try {
                $.ajax({
                    type: "POST",
                    url: "/Donation.aspx/AddDonation",
                    contentType: "application/json;",
                    data: JSON.stringify({
                        name: name,
                        amount: amount,
                        mobile: mobile,
                        pan: $('#txtPan').val(),
                        address: $('#txtComment').val(),
                        email: email
                    }),
                    dataType: "json",
                    success: function (response) {

                        // response.d is returned from WebMethod
                        var result = response.d;
                        if (result.success) {
                            paytmPaymentPopupOpen(amount, result.orderId, name, mobile, email);
                            // redirect to Paytm or next step
                            ///window.location.href = result.redirectUrl;
                        } else {
                            alert(result.message);
                        }
                    },
                    error: function (err) {
                        console.log('error while donating: ', err);
                    }
                });
            } catch (err) {
                console.log('Error in while donating:==> ', err);
                $('#loader').hide();
            }

        });

        // main paytm function to initiate transaction from paytm...
        function paytmPaymentPopupOpen(amount, orderId, name, phone = '', email = '') {
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
                console.log('Error in paytmPaymentPopupOpen==> ', err);
                $('#loader').hide();
            }
        }

        function openPaytm(resData) {
            var config = {
                root: "",
                flow: "DEFAULT",
                data: {
                    orderId: resData.orderId,
                    token: resData.txnToken,
                    tokenType: "TXN_TOKEN",
                    amount: resData.amount
                },
                handler: {
                    notifyMerchant: function (eventName, data) {

                        console.log("Event:", eventName);

                        if (eventName === "PAYMENT_SUCCESS") {
                            //alert("Payment Successful");
                            //location.reload();
                        }

                        if (eventName === "PAYMENT_FAILURE") {
                            //alert("Payment Failed");
                            updatePaymentStatus(resData.orderId, data, "Failed");
                        }

                        if (eventName === "APP_CLOSED") {
                            //alert("Payment cancelled by user");
                            updatePaymentStatus(resData.orderId, data, "Cancelled");
                        }

                        if (eventName === "SESSION_EXPIRED") {
                            //alert("Session expired. Please try again.");
                            updatePaymentStatus(resData.orderId, data, "Expired");
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
        function updatePaymentStatus(orderId, paytmRes, status) {
            $.ajax({
                type: "POST",
                url: "/PaytmCallBack.aspx/UpdatePaymentStatus",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({
                    orderId: orderId,
                    status: status,
                    apiResponse: JSON.stringify(paytmRes),
                    isDonation:true
                }),
                success: function () {
                    console.log("Status updated:", status);
                }
            });
        }
    </script>
</asp:Content>
