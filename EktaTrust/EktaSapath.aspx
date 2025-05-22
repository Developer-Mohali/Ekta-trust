<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EktaSapath.aspx.vb" MasterPageFile="~/MasterPage/Admin.Master" Inherits="EktaTrust.EktaSapath" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="about-us">
  <div class="container">
 
      
   <img src="images/moto_img.jpg" class="img-responsive img-rounded  wow fadeInDown" alt="">
    <h2 class="wow fadeInDown">Ekta Shapath</h2>
 
    <div class="row">
      <div class="col-sm-4 col-sm-offset-4 wow fadeInDown" >
        <%--<h3>Ekta Sapath</h3>--%>
        <%--<img src="images/motto_img.png" alt="" class="img-responsive">--%>
        <p class="lead" style="box-shadow: 0px 1px 10px 2px lightgrey; color:dodgerblue; padding:10px;" >
            <%--Empowering the weaker and deprived people<br/>
            <b>through Human Resource Development</b> --%>
             <b>जय भीम।<br />
             ।।एकता शपथ।।<br /><br />
             <%--1. हमारा एक ही धर्म है -'इंसानियत'।<br />
             2. हमारा एक ही मंदिर है -'संसद'।<br />
             3. हमारा एक ही भगवान है -'न्याय'।<br />
             4. हमारी एक ही धार्मिक किताब है -'संविधान'।</b><br />
             <b>5. हमारा एक ही हथियार है -'शिक्षा'।</b><br />
             <b>6. हमारी एक ही शक्ति है -'संगठन'।</b><br />
             <b>7. हमारी एक ही पूजा है -'संघर्ष'।।</b><br /><br />--%>
                 बाबासाहेब हमारे आदर्श है।<br />
             संविधान हमारा पूजनीय ग्रंथ है।</b><br />
             <b>इंसानियत हमारा धर्म है।</b><br />
             <b>शिक्षा हमारा हथियार है।</b><br />

             <b>संगठन हमारी शक्ति है।</b><br />
             <b>संघर्ष हमारी पूजा है। </b><br />
             <b>भाईचारा हमारा लक्ष्य है।</b><br /><br />
             <b>जय भीम।</b>
        </p>
      </div>
      
    </div>
  </div>
  </div>
  <!--/.container--><!--/#main-slider-->

<section>
<div class="get-started  wow fadeInDown">
     <div class="container">
                <div class="contribute col-lg-6 col-sm-5 col-md-5 ">
                    <a href="https://www.onlinesbi.com/sbicollect/icollecthome.htm?corpID=922784" target="_blank">
                        <img src="images/donate1.png" id="imgdonate" class="img-responsive" alt=""/></a>
                </div>
                <div class="pull-right">
                    <div class="col-sm-8 col-md-8 col-lg-10 pull-right" style="margin-top: 10px; width: 70.3333%;">
                        <%--<a href="Donation">
                            <img src="images/activities_btn1.png" class="img-responsive" alt=""/></a>--%>
                    </div>
                </div>
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
</asp:Content>

