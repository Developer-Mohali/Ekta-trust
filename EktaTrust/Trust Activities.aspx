<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="Trust Activities.aspx.vb" Inherits="EktaTrust.Trust_Activities" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="about-us">
  <div class="container">
    <h2 class="wow fadeInDown">Suggestion for trust Activities</h2>
    <img src="images/activitiers2.jpg" style=" padding-top:200px; padding-right:70px;" class="img-responsive wow fadeInDown pull-right hidden-sm hidden-xs hidden-md" alt=""> 
     <%--<form id="main-contact-form" class="contact-form " name="contact-form" method="post" action="#">--%>
        <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 nopadding">
            <span style="color: gray; font-weight: bold">
                             <asp:Label ID="lblErrorMsg" runat="server"></asp:Label></span>
          <div class="form-group">
            <label>First Name <asp:RequiredFieldValidator runat="server" id="reqFirstName" controltovalidate="textFirstName" ForeColor="Red" ErrorMessage="*"  ToolTip="Please Enter Your First Name" /></label>
           <%-- <input type="text" name="name" class="form-control" required>--%>
              <asp:TextBox ID="textFirstName" runat="server" class="form-control" ></asp:TextBox>
              
            
               </div>
          <div class="form-group">
            <label> Last Name  <asp:RequiredFieldValidator runat="server" id="reqLastName" controltovalidate="textLastName" ForeColor="Red" ErrorMessage="*"  ToolTip="Please Enter Your Last Name" /></label>
            <%--<input type="text" name="name" class="form-control" required>--%>
              <asp:TextBox ID="textLastName" runat="server" class="form-control" ></asp:TextBox>              
            
               </div>
          <div class="form-group">
            <label> Campany Name/Affiliation </label>
            <%--<input type="text" name="name" class="form-control" required>--%>
              <asp:TextBox ID="textCampName" runat="server" class="form-control"></asp:TextBox>
              
          </div>
          <div class="form-group">
            <label> Title </label>
            <%--<input type="text" name="name" class="form-control" required>--%>
              <asp:TextBox ID="textTitle" runat="server" class="form-control" ></asp:TextBox>
              
          </div>
          <div class="form-group">
            <label>Email <asp:RequiredFieldValidator runat="server" id="reqEmail" controltovalidate="textEmail" ForeColor="Red" ErrorMessage="*"  ToolTip="Please Enter Your EmailID" /></label>
            <%--<input type="email" name="email" class="form-control" required>--%>
              <asp:TextBox ID="textEmail" runat="server" class="form-control" ></asp:TextBox>
              
         <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="textEmail" ForeColor="Red" ErrorMessage="Please enter valid email id format." />
               </div>
          <div class="form-group">
            <label>Activity <asp:RequiredFieldValidator runat="server" id="reqActivity" controltovalidate="textActivity" ForeColor="Red" ErrorMessage="*"  ToolTip="Please Enter Your Acticity" /></label>
            <%--<input type="Text" name="name" class="form-control" required>--%>
              <asp:TextBox ID="textActivity" runat="server" class="form-control" ></asp:TextBox>
              
            </div>
          <div class="form-group">
            <label>Description <asp:RequiredFieldValidator runat="server" id="reqMessage" controltovalidate="textMessage" ForeColor="Red" ErrorMessage="*"  ToolTip="Please Enter Your Message" /></label>
            <%--<textarea name="message" id="message" required class="form-control" rows="8"></textarea>--%>
              <asp:TextBox ID="textMessage" runat="server" TextMode="multiline"  Columns="40" class="form-control"  rows="8"></asp:TextBox>
              
          </div>
          <div class="form-group">
            <label>Mobile <asp:RequiredFieldValidator runat="server" id="reqMobile" controltovalidate="textMobile" ForeColor="Red" ErrorMessage="*"  ToolTip="Please Enter Your Mobile Number" /></label>
            <%--<input type="text" class="form-control">--%>
              <asp:TextBox ID="textMobile" runat="server" class="form-control" ></asp:TextBox>
              
          <asp:CustomValidator ID="CustomValidatorMobile" runat="server" ForeColor="Red" ErrorMessage="Please enter numeric values."
                           OnServerValidate="Validate_Numeric" ControlToValidate="textMobile"></asp:CustomValidator>
          </div>
          <div class="form-group">
            <%--<button type="submit" name="submit" class="btn btn-primary btn-lg">Submit Activities </button>--%>
              <asp:Button ID="ButtonSubmitActivities" runat="server" class="btn btn-primary btn-lg"  Text="Submit Activities" OnClick="ButtonSubmitActivities_Click" />
                             
          </div>
        </div>
    </form>
  </div>
  </div>
  <!--/.container--> 

<!--/#main-slider-->

<section>
<div class="get-started  wow fadeInDown">
    <div class="container">
      <div class="contribute col-lg-6 col-sm-5 col-md-5 "><a href="Donation"><img src="images/donate.png" class="img-responsive" alt=""></a></div>
      <div class="pull-right">
      <div class="col-sm-8 col-md-8 col-lg-10 pull-right" style="margin-top:4px;"><a href="Trust%20Activities"><img src="images/activities_btn.png" class="img-responsive" alt=""></a></div></div>
    </div>
  </div>
</section>
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
      
      <%--<div class="col-md-5">
        <address class="text-white">
        <div class="pull-right"><a href="#"><i class="fa fa-telegram"></i></a><a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a></div>
        <strong>Ekta Navnirman Trust,</strong><br />
        B-15, Pragathi Path,Bajaj Nagar,<br> 
        Jaipur <br>
        <br><img src="images/logo-small.jpg" class="img-responsive pull-right"  alt="">
       
        <br>
        <strong>Email Us</strong><br>
        <a href="mailto:ektanavnirmantrust@gmail.com">ektanavnirmantrust@gmail.com</a><br>
        <br>
        <form method="post" role="form">
          <div class="input-group"> <span class="input-group-addon"> <i class="fa fa-envelope"></i> </span>
            <input class="form-control" type="text" placeholder="Signup Weekly Newsletter">
          </div>
          <input type="submit" value="Subscribe" class="btn btn-large btn-primary" />
        </form>
        </address>
      </div>--%>
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
                Whatsapp <a href="#" class="fa fa-whatsapp"></a>: +91-7877664078
                <br />
               <%-- Call <a href="#" class="fa fa-phone"></a>: <a href="tel:+91-9660037537">+91-9660037537</a>
                <br />
                Call <a href="#" class="fa fa-phone"></a>: <a href="tel:+91-9001716311">+91-9001716311</a>
                <br />--%>
                Email Id <a href="ektanavnirmantrust@gmail.com" class="fa fa-envelope"></a>: <a href="mailto:ektanavnirmantrust@gmail.com">ektanavnirmantrust@gmail.com</a>

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
</asp:Content>
