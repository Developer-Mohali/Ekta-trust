<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="UpscMipGallery.aspx.vb" Inherits="EktaTrust.UpscMipGallery" %>

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
                    MIP UPSC Gallery 2017
                <hr class="row marginImage" style="border: 1px dotted orange;" />
                </p>
            </div>
            <div class="row marginImage" style="margin-left: 15px">
            </div>
            <div class="col-md-3 col-sm-2 col-xs-12" style="padding-right: 0px; padding-left: 0px; top: 10px;">
                <a href="#" class="list-group-item">Gallery of Events</a>

                <div class="panel-group" id="accordionGallery">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordionGallery" href="#collapseThree" style="font-size: 14px;">
                                <h3 class="panel-title">Run For Equality  <i class="fa fa-angle-right pull-right"></i></h3>
                            </a>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse" style="height: auto;">
                             <a href="../RunForEquality2023.aspx" class="list-group-item active">Run For Equality 2023</a>
                            <a href="../RunForEquality2022.aspx" class="list-group-item">Run For Equality 2022</a>
                            <a href="../RunForEquality2020.aspx" class="list-group-item">Run For Equality 2020</a>
                            <a href="../RunForEquality2019" class="list-group-item ">Run For Equality 2019</a>
                            <a href="../RunForEquality_2018" class="list-group-item ">Run For Equality 2018</a>
                            <a href="../RunForEquality" class="list-group-item">Run For Equality 2017</a>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordionGallery" href="#collapseThree1" style="font-size: 14px;">
                                <h3 class="panel-title">Felicitation Programme  <i class="fa fa-angle-right pull-right"></i></h3>
                            </a>
                        </div>
                        <div id="collapseThree1" class="panel-collapse collapse" style="height: auto;">
                            <a href="../Gallery2020" class="list-group-item">Felicitation Programme 2020</a>
                            <a href="../Gallery2019" class="list-group-item">Felicitation Programme 2019</a>
                            <a href="../Gallery2018" class="list-group-item active">Felicitation Programme 2018</a>
                            <a href="../Gallery2017" class="list-group-item">Felicitation Programme 2017</a>
                            <a href="../Gallery" class="list-group-item">Felicitation Programme 2016</a>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading active">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordionGallery" href="#Mip" style="font-size: 14px;">
                                <h3 class="panel-title">Mock Inteview Programme  <i class="fa fa-angle-right pull-right"></i></h3>
                            </a>
                        </div>
                        <div id="Mip" class="panel-collapse in" style="height: auto;">
                            <a href="../UPSC2018" class="list-group-item">UPSC April 2018</a>
                            <a href="../MIPUPSC" class="list-group-item active">UPSC April 2017</a>
                            <a href="../MIP" class="list-group-item">RPSC Aug-Sep 2017</a>
                            <a href="../RPSC2020" class="list-group-item">RPSC 2020</a>
                        </div>
                    </div>

                      <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordionGallery" href="#CreativeCompetition" style="font-size: 14px;">
                                <h3 class="panel-title">Ekta Creative Competition  <i class="fa fa-angle-right pull-right"></i></h3>
                            </a>
                        </div>
                        <div id="CreativeCompetition" class="panel-collapse collapse" style="height: auto;">
                            <a href="../EktaCreativeCompetitionGallery.aspx" class="list-group-item">Ekta Creative Competition 2022</a>
                             <a href="../EktaCreativeCompetitionGallery2023.aspx" class="list-group-item">Ekta Creative Competition 2023</a>
                        </div>
                    </div>

                </div>
                <a href="../Dandawas" class="list-group-item">Donation to Dangawas Atrocity Victims</a>
                <a href="../Una" class="list-group-item">Donation to Una Atrocity Victims</a>
                <a href="../VolleyBall" class="list-group-item">Mata Ramabai Ekta Vollyball cup 2017</a>
                <a href="../MatrimonialInformation" class="list-group-item">Savita Bhim Ekta InterCaste Marriage Programme</a>
                <a href="../CareerCounselling" class="list-group-item">Mata Savitribai Phule Ekta career Counselling & Guidance Programme</a>
                <a href="../Covid-19" class="list-group-item">Covid-19</a>
                <a href="../Library.aspx" class="list-group-item">Library</a>
                <%--<a href="../EktaCreativeCompetitionGallery.aspx" class="list-group-item">Ekta Creative Competition</a>--%>
                 <a href="../Miscellaneous" class="list-group-item">Miscellaneous</a>
              </div>
            <div class="col-md-9 col-sm-10 col-xs-12" style="padding-right: 0px; padding-left: 0px; top: 10px;">

                <!--Page Title-->

                <!--first Rows Add-->

                <div class="row marginImage" style="margin-left: 15px">
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="MIPGallery/2.jpeg?image=1" alt="" />
                        <div>
                            <a class="lightbox" href="MIPGallery/2.jpeg?image=1" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="MIPGallery/3.jpeg?image=2" alt="" />
                        <div>
                            <a class="lightbox" href="MIPGallery/3.jpeg?image=2" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="MIPGallery/4.jpeg?image=3" alt="" />
                        <div>
                            <a class="lightbox" href="MIPGallery/4.jpeg?image=3" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="MIPGallery/5.jpeg?image=4" alt="" />
                        <div>
                            <a class="lightbox" href="MIPGallery/5.jpeg?image=4" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="MIPGallery/6.jpeg?image=5" alt="" />
                        <div>
                            <a class="lightbox" href="MIPGallery/6.jpeg?image=5" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="MIPGallery/7.jpeg?image=6" alt="" />
                        <div>
                            <a class="lightbox" href="MIPGallery/7.jpeg?image=6" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="MIPGallery/8.jpeg?image=7" alt="" />
                        <div>
                            <a class="lightbox" href="MIPGallery/8.jpeg?image=7" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>


                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="MIPGallery/9.jpeg?image=8" alt="" />
                        <div>
                            <a class="lightbox" href="MIPGallery/9.jpeg?image=8" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>

                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="MIPGallery/10.jpeg?image=9" alt="" />
                        <div>
                            <a class="lightbox" href="MIPGallery/10.jpeg?image=9" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="MIPGallery/11.jpeg?image=10" alt="" />
                        <div>
                            <a class="lightbox" href="MIPGallery/11.jpeg?image=10" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="MIPGallery/12.jpeg?image=11" alt="" />
                        <div>
                            <a class="lightbox" href="MIPGallery/12.jpeg?image=11" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="MIPGallery/13.jpeg?image=12" alt="" />
                        <div>
                            <a class="lightbox" href="MIPGallery/13.jpeg?image=12" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>


                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="MIPGallery/16.jpeg?image=13" alt="" />
                        <div>
                            <a class="lightbox" href="MIPGallery/16.jpeg?image=13" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="MIPGallery/17.jpeg?image=14" alt="" />
                        <div>
                            <a class="lightbox" href="MIPGallery/17.jpeg?image=14" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>

                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="MIPGallery/18.jpeg?image=14" alt="" />
                        <div>
                            <a class="lightbox" href="MIPGallery/18.jpeg?image=14" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>

                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="MIPGallery/19.jpeg?image=14" alt="" />
                        <div>
                            <a class="lightbox" href="MIPGallery/19.jpeg?image=14" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>

                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="MIPGallery/20.jpeg?image=14" alt="" />
                        <div>
                            <a class="lightbox" href="MIPGallery/20.jpeg?image=14" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                     <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="MIPGallery/21.jpg?image=15" alt="" />
                        <div>
                            <a class="lightbox" href="MIPGallery/21.jpg?image=15" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <%-- end main div --%>
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
