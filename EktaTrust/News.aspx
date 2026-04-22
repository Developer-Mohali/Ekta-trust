<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="News.aspx.vb" Inherits="EktaTrust.News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CssGallery/src/jquery.littlelightbox.css" rel="stylesheet" />
    <style>
        .lightbox {
        }

        .navbar-inverse .navbar-nav > li > a {
            padding: 4px 10px;
            margin: 0;
            font-size: 14px;
            border-radius: 3px;
            color: #fff;
            line-height: 24px;
            display: inline-block;
        }

        .gallery {
            margin-left: 22px;
            padding-top: 1px;
            font-size: 27px;
            padding-bottom: 9px;
        }

        hr {
            margin-top: 0px;
            margin-bottom: 0px;
        }

        .lightbox-wrap .lightbox-title p {
            line-height: 16px;
            padding-left: 6px;
            text-align: justify;
            font-size: 13px;
            padding-right: 6px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="about-us">
        <div class="container">
            <img src="images/news_img.jpg" class="img-responsive img-rounded  wow fadeInDown" alt="">
            <h2 class="wow fadeInDown">News/Press</h2>
            <div class="col-sm-6 nopadding featured-news">
                <section class="page">
                    <!-- Page Content -->
                    <div class="container">
                        <!--Page Title-->
                        <div class="row marginImage" style="margin-left: 15px">
                        </div>
                        <!--first Rows Add-->

                        <div class="row marginImage" style="margin-left: 15px">

                            <div id="box" class="burst-side strawberry">
                                <div class="caption"></div>
                                <img class="thumbnail" id="dd" src="RunForEquality2018/Img1.png?image=1" alt="">
                                <div>
                                    <a class="lightbox" href="RunForEquality2018/Img1.png?image=1" data-littlelightbox-group="gallery">
                                        <h1>View Image</h1>
                                    </a>
                                </div>
                            </div>

                            <div id="box" class="burst-side strawberry">
                                <div class="caption"></div>
                                <img class="thumbnail" id="dd" src="RunForEquality2018/img3.png?image=3" alt="">
                                <div>
                                    <a class="lightbox" href="RunForEquality2018/img3.png?image=3" data-littlelightbox-group="gallery">
                                        <h1>View Image</h1>
                                    </a>
                                </div>
                            </div>

                            <div id="box" class="burst-side strawberry">
                                <div class="caption"></div>
                                <img class="thumbnail" id="dd" src="RunForEquality2018/img8.png?image=8" alt="">
                                <div>
                                    <a class="lightbox" href="RunForEquality2018/img8.png?image=8" data-littlelightbox-group="gallery">
                                        <h1>View Image</h1>
                                    </a>
                                </div>
                            </div>

                            <div id="box" class="burst-side strawberry">
                                <div class="caption"></div>
                                <img class="thumbnail" id="dd" src="RunForEquality2018/img11.png?image=11" alt="">
                                <div>
                                    <a class="lightbox" href="RunForEquality2018/img11.png?image=11" data-littlelightbox-group="gallery">
                                        <h1>View Image</h1>
                                    </a>
                                </div>
                            </div>

                            <div id="box" class="burst-side strawberry">
                                <div class="caption"></div>
                                <img class="thumbnail" id="dd" src="RunForEquality2018/img13.png?image=13" alt="">
                                <div>
                                    <a class="lightbox" href="RunForEquality2018/img13.png?image=13" data-littlelightbox-group="gallery">
                                        <h1>View Image</h1>
                                    </a>
                                </div>
                            </div>

                        </div>

                        <div class="row marginImage" style="margin-left: 15px">

                            <div id="box" class="burst-side strawberry">
                                <div class="caption"></div>
                                <img class="thumbnail" id="dd" src="RunForEquality2018/img16.png?image=16" alt="">
                                <div>
                                    <a class="lightbox" href="RunForEquality2018/img16.png?image=16" data-littlelightbox-group="gallery">
                                        <h1>View Image</h1>
                                    </a>
                                </div>
                            </div>

                            <div id="box" class="burst-side strawberry">
                                <div class="caption"></div>
                                <img class="thumbnail" id="dd" src="RunForEquality2018/img22.png?image=22" alt="">
                                <div>
                                    <a class="lightbox" href="RunForEquality2018/img22.png?image=22" data-littlelightbox-group="gallery">
                                        <h1>View Image</h1>
                                    </a>
                                </div>
                            </div>

                            <div id="box" class="burst-side strawberry">
                                <div class="caption"></div>
                                <img class="thumbnail" id="dd" src="RunForEquality2018/img23.png?image=23" alt="">
                                <div>
                                    <a class="lightbox" href="RunForEquality2018/img23.png?image=23" data-littlelightbox-group="gallery">
                                        <h1>View Image</h1>
                                    </a>
                                </div>
                            </div>

                            <div id="box" class="burst-side strawberry">
                                <div class="caption"></div>
                                <img class="thumbnail" id="dd" src="RunForEquality2018/img24.png?image=24" alt="">
                                <div>
                                    <a class="lightbox" href="RunForEquality2018/img24.png?image=24" data-littlelightbox-group="gallery">
                                        <h1>View Image</h1>
                                    </a>
                                </div>
                            </div>

                            <div id="box" class="burst-side strawberry">
                                <div class="caption"></div>
                                <img class="thumbnail" id="dd" src="RunForEquality2018/4.png?image=5" alt="">
                                <div>
                                    <a class="lightbox" href="RunForEquality2018/4.png?image=5" data-littlelightbox-group="gallery">
                                        <h1>View Image</h1>
                                    </a>
                                </div>
                            </div>

                        </div>

                        <div class="row marginImage" style="margin-left: 15px">

                            <div id="box" class="burst-side strawberry">
                                <div class="caption"></div>
                                <img class="thumbnail" id="dd" src="RunForEquality2018/5.png?image=6" alt="">
                                <div>
                                    <a class="lightbox" href="RunForEquality2018/5.png?image=6" data-littlelightbox-group="gallery">
                                        <h1>View Image</h1>
                                    </a>
                                </div>
                            </div>

                            <div id="box" class="burst-side strawberry">
                                <div class="caption"></div>
                                <img class="thumbnail" id="dd" src="RunForEquality2018/6.png?image=7" alt="">
                                <div>
                                    <a class="lightbox" href="RunForEquality2018/6.png?image=7" data-littlelightbox-group="gallery">
                                        <h1>View Image</h1>
                                    </a>
                                </div>
                            </div>

                            <div id="box" class="burst-side strawberry">
                                <div class="caption"></div>
                                <img class="thumbnail" id="dd" src="RunForEquality2018/8.png?image=8" alt="">
                                <div>
                                    <a class="lightbox" href="RunForEquality2018/8.png?image=8" data-littlelightbox-group="gallery">
                                        <h1>View Image</h1>
                                    </a>
                                </div>
                            </div>

                            <div id="box" class="burst-side strawberry">
                                <div class="caption"></div>
                                <img class="thumbnail" id="dd" src="EktaTrustImage/Image-6.png?image=1" alt="" />
                                <div>
                                    <a class="lightbox" href="EktaTrustImage/Image-6.png?image=1" data-littlelightbox-group="gallery" title="<br/><a href='DangawasVictimsDetail'><b style='color:#b5580a'></b></a>">
                                        <h1>View Image</h1>
                                    </a>
                                </div>
                            </div>
                            <div id="box" class="burst-side strawberry">
                                <div class="caption"></div>
                                <img class="thumbnail" id="Img1" src="EktaTrustImage/Image-7.png?image=2" alt="#" />
                                <div>
                                    <a class="lightbox" href="EktaTrustImage/Image-7.png?image=2" data-littlelightbox-group="gallery" title="<br/><a href='DangawasVictimsDetail'><b style='color:#b5580a'></b></a>">
                                        <h1>View Image</h1>
                                    </a>
                                </div>
                            </div>

                        </div>

                        <div class="row marginImage" style="margin-left: 15px">

                            <div id="box" class="burst-side strawberry">
                                <div class="caption"></div>
                                <img class="thumbnail" id="Img3" src="Images/Image-4.jpg?image=4" alt="#" />
                                <div>
                                    <a class="lightbox" href="Images/Image-4.jpg?image=4" data-littlelightbox-group="gallery" title="<b>Helping News<b/> <br>10 May 2013 On the other hand, we denounce with righteous indignation and dislike men who are so beguiled .<br/><a href='HelpingNews'><b style='color:#b5580a'>Read more...</b></a>">
                                        <h1>View Image</h1>
                                    </a>
                                </div>
                            </div>
                             <%--<div id="box" class="burst-side strawberry">
                                <div class="caption"></div>
                                 <img src="RunForEquality2018/img%20new.png?image=4" alt="#" class="thumbnail" id="Img4" />

                                <div>
                                    <a class="lightbox" href="RunForEquality2018/img%20new.png?image=4" data-littlelightbox-group="gallery" >

                                        <h1>View Image</h1>
                                    </a>
                                </div>
                            </div>--%>
                        </div>
                    </div>

                </section>

                <script src="CssGallery/src/jquery.littlelightbox.js"></script>
                <script>
                    $('.lightbox').littleLightBox();
                </script>
                <style>
                    .span {
                        font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
                        font-size: small;
                    }

                    .hovereffect {
                        width: 100%;
                        height: 100%;
                        float: left;
                        overflow: hidden;
                        position: relative;
                        text-align: center;
                        cursor: default;
                        background: -webkit-linear-gradient(45deg, #ff89e9 0%, #05abe0 100%);
                        background: linear-gradient(45deg, #ff89e9 0%,#05abe0 100%);
                    }

                        .hovereffect .overlay {
                            width: 100%;
                            height: 100%;
                            position: absolute;
                            overflow: hidden;
                            top: 0;
                            left: 0;
                            padding: 3em;
                            text-align: left;
                        }

                        .hovereffect img {
                            display: block;
                            position: relative;
                            max-width: none;
                            width: calc(100% + 60px);
                            -webkit-transition: opacity 0.35s, -webkit-transform 0.45s;
                            transition: opacity 0.35s, transform 0.45s;
                            -webkit-transform: translate3d(-40px,0,0);
                            transform: translate3d(-40px,0,0);
                        }

                        .hovereffect h2 {
                            text-transform: uppercase;
                            color: #fff;
                            position: relative;
                            font-size: 17px;
                            background-color: transparent;
                            padding: 15% 0 10px 0;
                            text-align: left;
                        }

                        .hovereffect .overlay:before {
                            position: absolute;
                            top: 20px;
                            right: 20px;
                            bottom: 20px;
                            left: 20px;
                            border: 1px solid #fff;
                            content: '';
                            opacity: 0;
                            filter: alpha(opacity=0);
                            -webkit-transition: opacity 0.35s, -webkit-transform 0.45s;
                            transition: opacity 0.35s, transform 0.45s;
                            -webkit-transform: translate3d(-20px,0,0);
                            transform: translate3d(-20px,0,0);
                        }

                        .hovereffect a, .hovereffect p {
                            color: #FFF;
                            opacity: 0;
                            filter: alpha(opacity=0);
                            -webkit-transition: opacity 0.35s, -webkit-transform 0.45s;
                            transition: opacity 0.35s, transform 0.45s;
                            -webkit-transform: translate3d(-10px,0,0);
                            transform: translate3d(-10px,0,0);
                        }

                        .hovereffect:hover img {
                            opacity: 0.6;
                            filter: alpha(opacity=60);
                            -webkit-transform: translate3d(0,0,0);
                            transform: translate3d(0,0,0);
                        }

                        .hovereffect:hover .overlay:before,
                        .hovereffect:hover a, .hovereffect:hover p {
                            opacity: 1;
                            filter: alpha(opacity=100);
                            -webkit-transform: translate3d(0,0,0);
                            transform: translate3d(0,0,0);
                        }

                    .container {
                        padding-left: 40px;
                    }

                    .p {
                        padding-top: 9px;
                    }
                </style>

                <link href="CssGallery/style.css" rel="stylesheet" />
                <link href="CssGallery/figure.css" rel="stylesheet" />

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
