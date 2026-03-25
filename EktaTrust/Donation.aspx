<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="Donation.aspx.vb" Inherits="EktaTrust.Donation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="about-us">
  <div class="container">
    <h2 class="wow fadeInDown">Donation</h2>
    <p></p>
    <p>The online transfer facility through this website is available now.<%-- It will be introduced shortly...--%></p><p>The details of the account are given below:</p>
    <p><strong>ATM/Debit Card</strong></p>
      <p style="background-color: black; padding: 10px; border-radius: 10px; font-size:18px; "><strong style="color: white;"> Ekta Navnirman Trust</strong></p>
    <table class="tables" >
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
    </table>
      <br/>
    <div class="contact-wrap">
        <img src="images/donation.jpg" style=" padding-top:70px; padding-right:100px;" class="img-responsive pull-right hidden-sm hidden-xs hidden-md  wow fadeInDown" alt=""/>
      <form id="main-contact-form" class="contact-form " name="contact-form" method="post" action="#">
        <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 nopadding">
          <div class="form-group">
            <label>Full Name *</label>
            <input type="text" name="name" id="txtName" class="form-control" required />
          </div>
          <div class="form-group">
            <label>Amount *</label>
            <input type="text" name="txtAmount" id="txtAmount" class="form-control" required />
          </div>
          <div class="form-group">
            <label>Mobile</label>
            <input type="text" class="form-control" id="txtMobile" />
          </div>
          <div class="form-group">
            <asp:DropDownList CssClass="form-control" ID="ddlModeOfPayment1" runat="server">
              <asp:ListItem Value="Select">Select Payment Way</asp:ListItem>
                <asp:ListItem Value="UPI">UPI</asp:ListItem>
                <asp:ListItem Value="Credit Card">Credit Card</asp:ListItem>
              <asp:ListItem Value="Debit Card">Debit Card</asp:ListItem>
              <asp:ListItem Value="Net Banking">Net Banking</asp:ListItem>                                       
           </asp:DropDownList>
          </div>
            <div class="form-group">
              <label>Comment</label>
              <textarea type="text" class="form-control" id="txtComment"></textarea>
            </div>
          <div class="form-group">
            <button type="submit" name="submit" id="btnDonate" class="btn btn-primary btn-lg">Donate Now</button>
          </div>
        </div>
      </form>
      <!--/.row--> 
    </div>
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
        $("#btnDonate").click(function () {

            var name = $("#txtName").val().trim();
            var amount = $("#txtAmount").val().trim();
            var mobile = $("#txtMobile").val().trim();
            var paymentMode = $("#<%= ddlModeOfPayment1.ClientID %>").val();

        // ✅ Validation
        if (name === "") {
            alert("Enter Full Name");
            return;
        }

        if (amount === "" || isNaN(amount) || parseFloat(amount) <= 0) {
            alert("Enter valid amount");
            return;
        }

        if (paymentMode === "Select") {
            alert("Select payment mode");
            return;
        }

        $.ajax({
            type: "POST",
            url: "/Donation.aspx/AddDonation",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({
                name: name,
                amount: amount,
                mobile: mobile,
                paymentMode: paymentMode,
                comment: $('#txtComment').val()
            }),
            dataType: "json",
            success: function (response) {

                // response.d is returned from WebMethod
                //var result = response.d;

                //if (result.success) {
                //    // redirect to Paytm or next step
                //    window.location.href = result.redirectUrl;
                //} else {
                //    alert(result.message);
                //}
            },
            error: function (err) {
                console.log(err);
            }
        });

    });
    </script>
</asp:Content>
