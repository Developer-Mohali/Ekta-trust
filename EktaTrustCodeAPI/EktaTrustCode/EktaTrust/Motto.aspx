<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="Motto.aspx.vb" Inherits="EktaTrust.Motto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="about-us">
  <div class="container">
 
      
   <img src="images/moto_img.jpg" class="img-responsive img-rounded  wow fadeInDown" alt="">
    <h2 class="wow fadeInDown">Motto</h2>
 
    <div class="row center">
      <div class="col-sm-12 center  wow fadeInDown">
        <h3>Motto</h3>
        <img src="images/motto_img.png" alt="" class="img-responsive">
        <p class="lead">
            <%--Empowering the weaker and deprived people<br/>
            <b>through Human Resource Development</b> --%>
            <b>Building discrimination free India.</b>
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
                        <a href="Donation">
                            <img src="images/activities_btn1.png" class="img-responsive" alt=""/></a>
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
        <div class="pull-right"><a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a></div>
        <strong>Ekta Navnirman Trust,</strong><br />
        B-15, Pragathi Path,Bajaj Nagar,<br> 
        Jaipur <br>
        <br><img src="images/logo-small.jpg" class="img-responsive pull-right"  alt="">
        
        <br>
        <strong>Email Us</strong><br>
        <a href="mailto:ektanavnirmantrust@gmail.com">ektanavnirmantrust@gmail.com</a><br>
        <br>
        <form action="#">
          <div class="input-group"> <span class="input-group-addon"> <i class="fa fa-envelope"></i> </span>
            <input class="form-control" placeholder="Signup Weekly Newsletter">
          </div>
          <input type="submit" value="Subscribe" class="btn btn-large btn-primary" />
        </form>
        </address>
      </div>
    </div>
  </div>
</section>
<!--/#bottom-->
</asp:Content>
