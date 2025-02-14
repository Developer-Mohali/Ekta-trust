<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="RunForEquality2018.aspx.vb" Inherits="EktaTrust.RunForEquality2018" %>
<%@ Register Src="~/Controls/GallerySideMenuControl.ascx" TagPrefix="uc" TagName="GallerySideMenuControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="CssGallery/src/jquery.littlelightbox.css" rel="stylesheet" />
    <link href="Css/css/Gallery.css" rel="stylesheet" />


    <section class="page">
        <!-- Page Content -->
        <div class="container">
            <div class="jquery-script-ads" style="margin: 6px auto;">
                <p class="gallery">
                    Run For Equality 2018
                <hr class="row marginImage" style="border: 1px dotted orange;" />
                </p>

            </div>
            <div class="row marginImage" style="margin-left: 15px">
            </div>
             <%-- gallery event menu --%>
             <uc:GallerySideMenuControl runat="server" id="GallerySideMenuControl" />

            <div class="col-md-9 col-sm-10 col-xs-12" style="padding-right: 0px; padding-left: 0px; top: 10px;">

                <!--Page Title-->

                <div class="row marginImage" style="margin-left: 15px">

                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="RunForEquality2018/Img1.png?image=1" alt="" />
                        <div>
                            <a class="lightbox" href="RunForEquality2018/Img1.png?image=1" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                        <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="MiscellaneousGallery/Image-2.jpeg?image=2" alt="Love nature as if love myself" />
                        <div>
                            <a class="lightbox" href="MiscellaneousGallery/Image-2.jpeg?image=2" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                       <img class="thumbnail" id="dd" src="MiscellaneousGallery/Image-3.jpeg?image=3" alt="#" />
                        <div>
                            <a class="lightbox" href="MiscellaneousGallery/Image-3.jpeg?image=3" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="MiscellaneousGallery/Image-4.jpeg?image=4" alt="#" />
                        <div>
                            <a class="lightbox" href="MiscellaneousGallery/Image-4.jpeg?image=4" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                </div>
                <!--Second row-->
                <div class="row marginImage" style="margin-top: 6px; margin-left: 15px">
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="MiscellaneousGallery/Image-5.jpeg?image=5" alt="#" />
                        <div>
                            <a class="lightbox" href="MiscellaneousGallery/Image-5.jpeg?image=5" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>

                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="RunForEquality2018/img2.png?image=2" alt="">
                        <div>
                            <a class="lightbox" href="RunForEquality2018/img2.png?image=2" data-littlelightbox-group="gallery">
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
                        <img class="thumbnail" id="dd" src="RunForEquality2018/img4.png?image=4" alt="">
                        <div>
                            <a class="lightbox" href="RunForEquality2018/img4.png?image=4" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>

                </div>

                <div class="row marginImage" style="margin-left: 15px">

                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="RunForEquality2018/img5.png?image=5" alt="">
                        <div>
                            <a class="lightbox" href="RunForEquality2018/img5.png?image=5" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>

                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="RunForEquality2018/img6.png?image=6" alt="">
                        <div>
                            <a class="lightbox" href="RunForEquality2018/img6.png?image=6" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>

                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="RunForEquality2018/img7.png?image=7" alt="">
                        <div>
                            <a class="lightbox" href="RunForEquality2018/img7.png?image=7" data-littlelightbox-group="gallery">
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

                </div>

                <div class="row marginImage" style="margin-left: 15px">

                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="RunForEquality2018/img9.png?image=9" alt="">
                        <div>
                            <a class="lightbox" href="RunForEquality2018/img9.png?image=9" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>

                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="RunForEquality2018/img10.png?image=10" alt="">
                        <div>
                            <a class="lightbox" href="RunForEquality2018/img10.png?image=10" data-littlelightbox-group="gallery">
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
                        <img class="thumbnail" id="dd" src="RunForEquality2018/img12.png?image=12" alt="">
                        <div>
                            <a class="lightbox" href="RunForEquality2018/img12.png?image=12" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>

                </div>

                <div class="row marginImage" style="margin-left: 15px">

                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="RunForEquality2018/img13.png?image=13" alt="">
                        <div>
                            <a class="lightbox" href="RunForEquality2018/img13.png?image=13" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>

                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="RunForEquality2018/img14.png?image=14" alt="">
                        <div>
                            <a class="lightbox" href="RunForEquality2018/img14.png?image=14" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>

                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="RunForEquality2018/img15.png?image=15" alt="">
                        <div>
                            <a class="lightbox" href="RunForEquality2018/img15.png?image=15" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>

                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="RunForEquality2018/img16.png?image=16" alt="">
                        <div>
                            <a class="lightbox" href="RunForEquality2018/img16.png?image=16" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>

                </div>

                <div class="row marginImage" style="margin-left: 15px">

                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="RunForEquality2018/img17.png?image=17" alt="">
                        <div>
                            <a class="lightbox" href="RunForEquality2018/img17.png?image=17" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>

                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="RunForEquality2018/img18.png?image=18" alt="">
                        <div>
                            <a class="lightbox" href="RunForEquality2018/img18.png?image=18" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>

                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="RunForEquality2018/img19.png?image=19" alt="">
                        <div>
                            <a class="lightbox" href="RunForEquality2018/img19.png?image=19" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>

                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="RunForEquality2018/img20.png?image=20" alt="">
                        <div>
                            <a class="lightbox" href="RunForEquality2018/img20.png?image=20" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>

                </div>

                <div class="row marginImage" style="margin-left: 15px">

                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="RunForEquality2018/img21.png?image=21" alt="">
                        <div>
                            <a class="lightbox" href="RunForEquality2018/img21.png?image=21" data-littlelightbox-group="gallery">
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

                </div>


                <div class="row marginImage" style="margin-left: 15px">
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="RunForEquality2018/7.png?image=1" alt="">
                        <div>
                            <a class="lightbox" href="RunForEquality2018/7.png?image=1" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>

                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="RunForEquality2018/1.png?image=2" alt="">
                        <div>
                            <a class="lightbox" href="RunForEquality2018/1.png?image=2" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>

                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="RunForEquality2018/2.png?image=3" alt="">
                        <div>
                            <a class="lightbox" href="RunForEquality2018/2.png?image=3" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>

                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="RunForEquality2018/3.png?image=4" alt="">
                        <div>
                            <a class="lightbox" href="RunForEquality2018/3.png?image=4" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="row marginImage" style="margin-left: 15px">

                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="RunForEquality2018/4.png?image=5" alt="">
                        <div>
                            <a class="lightbox" href="RunForEquality2018/4.png?image=5" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>

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
                </div>
                 <div class="row marginImage" style="margin-left: 15px">
                     <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                         <img src="RunForEquality2018/Ekta%20Banner.jpeg" class="thumbnail" id="dd" alt="" />

                        <div>
                             <a class="lightbox" href="RunForEquality2018/Ekta%20Banner.jpeg?image=8" data-littlelightbox-group="gallery">
<%--                            <a class="lightbox" href="RunForEquality2018/8.png?image=8" data-littlelightbox-group="gallery">--%>
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                     </div>

                <div class="row" style="padding-left: 22px;">
                    <div class="col-sm-6">
                        <video width="400" height="300" controls="" style="cursor: pointer">
                            <source src="RunForEquality2018/Video_1.mp4" type="video/mp4">
                        </video>
                    </div>

                    <div class="col-sm-6">
                        <video width="400" height="300" controls="">
                            <source src="RunForEquality2018/Video_2.mp4" type="video/mp4" style="cursor: pointer">
                        </video>
                    </div>
                </div>

                <div class="row" style="padding-left: 22px;">
                    <div class="col-sm-6">
                        <video width="400" height="300" controls="" style="cursor: pointer">
                            <source src="RunForEquality2018/Video_3.mp4" type="video/mp4">
                        </video>
                    </div>
                    <div class="col-sm-6">
                        <video width="400" height="300" controls="">
                            <source src="RunForEquality2018/Video_4.mp4" type="video/mp4" style="cursor: pointer">
                        </video>
                    </div>
                </div>
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

</asp:Content>
