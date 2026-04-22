<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="WorkDone.aspx.vb" Inherits="EktaTrust.WorkDone" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="about-us">
        <div class="container">
            <img src="images/news_img.jpg" class="img-responsive img-rounded  wow fadeInDown" alt="">
            <h2 class="wow fadeInDown">Work/Done</h2>
        </div>
        <div class="container">

            <div class="panel-group">
                <div class="panel panel-primary">
                    <div class="panel-heading">Ekta Navnirman Trust Work Information</div>
                    <div class="panel-body"><a href="../Dandawas">(1) Donation to Dangawas Victims- 1.5 Lacs.</a> </div>
                    <div class="panel-body"><a href="../Una">(2) Donation to Una Victims – 2.7 Lacs.</a></div>
                    <div class="panel-body"><a href="Gallerys.aspx">(3) 4.12.2016, Felicitation of 2016 Year Meritorious Students of 10th and 12th class. </a></div>
                    <div class="panel-body"><a href="Gallerys.aspx">(4) Letter Submitted on PM APP for Babasaheb photo on Currency.</a></div>
                    <div class="panel-body"><a href="Gallerys.aspx">(5) Skill Training for tailoring.</a></div>
                </div>
            </div>
        </div>
    </div>
    <!--/.container-->
    <!--/#main-slider-->


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
                        <br>
                        <br>
                        <img src="images/logo-small.jpg" class="img-responsive pull-right" alt="">

                        <br>
                        <strong>Email Us</strong><br>
                        <a href="mailto:ektanavnirmantrust@gmail.com">ektanavnirmantrust@gmail.com</a><br>
                        <br>
                        <form action="#">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
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
    <style>
        .panel-heading {
            font-size: larger;
            font-weight: bold;
        }
        .panel-body {
            padding-top: 11px;
            font-size: 14px;
            font-weight: normal;
        }
        .panel-primary > .panel-heading {
            border-radius:4px;
        }
    </style>
</asp:Content>

