<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="Gallery_2018.aspx.vb" Inherits="EktaTrust.Gallery_2018" %>
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
                    Felicitation Programme 2018
                <hr class="row marginImage" style="border: 1px dotted orange;" />
                </p>

            </div>
            <!--Page Title-->
            <div class="row marginImage" style="margin-left: 15px">
            </div>
            <!--first Rows Add-->

            <div class="col-md-3 col-sm-2 col-xs-12" style="padding-right: 0px; padding-left: 0px; top: 10px;">
                <a href="#" class="list-group-item">Gallery of Events</a>

                <div class="panel-group" id="accordionGallery">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordionGallery" href="#collapseThree2" style="font-size: 14px;">
                                <h3 class="panel-title">Run For Equality  <i class="fa fa-angle-right pull-right"></i></h3>
                            </a>
                        </div>
                        <div id="collapseThree2" class="panel-collapse collapse" style="height: auto;">
                            <a href="../RunForEquality2023.aspx" class="list-group-item active">Run For Equality 2023</a>
                            <a href="../RunForEquality2022.aspx" class="list-group-item">Run For Equality 2022</a>
                            <a href="../RunForEquality2020.aspx" class="list-group-item">Run For Equality 2020</a>
                            <a href="../RunForEquality2019" class="list-group-item">Run For Equality 2019</a>
                            <a href="../RunForEquality_2018" class="list-group-item">Run For Equality 2018</a>
                            <a href="../RunForEquality" class="list-group-item">Run For Equality 2017</a>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading active">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordionGallery" href="#collapseThree1" style="font-size: 14px;">
                                <h3 class="panel-title">Felicitation Programme  <i class="fa fa-angle-right pull-right"></i></h3>
                            </a>
                        </div>
                        <div id="collapseThree1" class="panel-collapse in" style="height: auto;">
                            <a href="../Gallery2020" class="list-group-item">Felicitation Programme 2020</a>
                            <a href="../Gallery2019" class="list-group-item">Felicitation Programme 2019</a>
                            <a href="../Gallery2018" class="list-group-item active ">Felicitation Programme 2018</a>
                            <a href="../Gallery2017" class="list-group-item ">Felicitation Programme 2017</a>
                            <a href="../Gallery" class="list-group-item">Felicitation Programme 2016</a>
                        </div>
                    </div>

                   

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordionGallery" href="#Mip" style="font-size: 14px;">
                                <h3 class="panel-title">Mock Inteview Programme  <i class="fa fa-angle-right pull-right"></i></h3>
                            </a>
                        </div>
                        <div id="Mip" class="panel-collapse collapse" style="height: auto;">
                            <a href="../UPSC2018" class="list-group-item">UPSC April 2018</a>
                            <a href="../MIPUPSC" class="list-group-item">UPSC April 2017</a>
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

                <!--one row-->
                <div class="row marginImage" style="margin-left: 15px">
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-1.jpeg?image=1" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-1.jpeg?image=1" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-2.jpeg?image=2" alt="Love nature as if love myself" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-2.jpeg?image=2" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-3.jpeg?image=3" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-3.jpeg?image=3" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-4.jpeg?image=4" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-4.jpeg?image=4" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                </div>
                <!--Second row-->
                <div class="row marginImage" style="margin-top: 6px; margin-left: 15px">
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-5.jpeg?image=5" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-5.jpeg?image=5" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-6.jpeg?image=6" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-6.jpeg?image=6" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-7.jpeg?image=7" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-7.jpeg?image=7" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>  
                  <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-8.jpg?image=8" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-8.jpg?image=8" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>  
                </div> 
                  <!--Third row-->
                <div class="row marginImage" style="margin-top: 6px; margin-left: 15px">
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-9.jpg?image=9" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-9.jpg?image=9" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-10.jpg?image=10" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-10.jpg?image=10" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-11.jpg?image=11" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-11.jpg?image=11" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>  
                  <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-12.jpg?image=12" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-12.jpg?image=12" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>  
                </div> 
                     <!--Fourth row-->
                <div class="row marginImage" style="margin-top: 6px; margin-left: 15px">
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-13.jpg?image=13" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-13.jpg?image=13" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-14.jpg?image=14" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-14.jpg?image=14" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-15.jpg?image=15" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-15.jpg?image=15" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>  
                  <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-16.jpg?image=16" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-16.jpg?image=16" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>  
                </div>
                     <!--Fifth row-->
                <div class="row marginImage" style="margin-top: 6px; margin-left: 15px">
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-17.jpg?image=17" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-17.jpg?image=17" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-18.jpg?image=18" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-18.jpg?image=18" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-19.jpg?image=19" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-19.jpg?image=19" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>  
                  <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-20.jpg?image=20" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-20.jpg?image=20" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>  
                </div>
                     <!--Sixth row-->
                <div class="row marginImage" style="margin-top: 6px; margin-left: 15px">
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-21.jpg?image=21" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-21.jpg?image=21" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-22.jpg?image=22" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-22.jpg?image=22" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-23.jpg?image=23" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-23.jpg?image=23" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>  
                  <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-24.jpg?image=24" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-24.jpg?image=24" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>  
                </div>
                     <!--Seventh row-->
                <div class="row marginImage" style="margin-top: 6px; margin-left: 15px">
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-25.jpg?image=25" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-25.jpg?image=25" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-26.jpg?image=26" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-26.jpg?image=26" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-27.jpg?image=27" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-27.jpg?image=27" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>  
                  <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-28.jpg?image=28" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-28.jpg?image=28" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>  
                </div>
                     <!--Eight row-->
                <div class="row marginImage" style="margin-top: 6px; margin-left: 15px">
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-29.jpg?image=29" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-29.jpg?image=29" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-30.jpg?image=30" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-30.jpg?image=30" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-31.jpg?image=31" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-31.jpg?image=31" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>  
                  <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-32.jpg?image=32" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-32.jpg?image=32" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>  
                </div>
                     <!--Nine row-->
                <div class="row marginImage" style="margin-top: 6px; margin-left: 15px">
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-33.jpg?image=33" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-33.jpg?image=33" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-34.png?image=34" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-34.png?image=34" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-35.jpg?image=35" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-35.jpg?image=35" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>  
                  <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-36.jpg?image=36" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-36.jpg?image=36" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>  
                </div>
                     <!--ten row-->
                <div class="row marginImage" style="margin-top: 6px; margin-left: 15px">
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-37.jpg?image=37" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-37.jpg?image=37" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-38.jpg?image=38" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-38.jpg?image=38" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-39.jpg?image=39" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-39.jpg?image=39" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>  
                  <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-40.jpg?image=40" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-40.jpg?image=40" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>  
                </div>
                     <!--eleven row-->
                <div class="row marginImage" style="margin-top: 6px; margin-left: 15px">
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-41.jpg?image=41" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-41.jpg?image=41" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-42.jpg?image=42" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-42.jpg?image=42" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-43.jpg?image=43" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-43.jpg?image=43" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>  
                  <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-44.jpg?image=44" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-44.jpg?image=44" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>  
                </div>
             <!--twelve row-->
                <div class="row marginImage" style="margin-top: 6px; margin-left: 15px">
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-45.jpg?image=45" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-45.jpg?image=45" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-46.jpg?image=46" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-46.jpg?image=46" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-47.jpg?image=47" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-47.jpg?image=47" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>  
                  <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-48.jpg?image=48" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-48.jpg?image=48" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>  
                </div>
             <!--Thirteen row-->
                <div class="row marginImage" style="margin-top: 6px; margin-left: 15px">
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-49.jpg?image=49" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-49.jpg?image=49" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-50.jpg?image=50" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-50.jpg?image=50" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-51.jpg?image=51" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-51.jpg?image=51" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>  
                  <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-52.jpg?image=52" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-52.jpg?image=52" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>  
                </div>
                <!--Thirteen row-->
                <div class="row marginImage" style="margin-top: 6px; margin-left: 15px">
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-53.jpg?image=53" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-53.jpg?image=53" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-54.jpg?image=54" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-54.jpg?image=54" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-55.jpg?image=55" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-55.jpg?image=55" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>  
                  <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-56.jpg?image=56" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-56.jpg?image=56" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>  
                </div>
                  <!--Thirteen row-->
                <div class="row marginImage" style="margin-top: 6px; margin-left: 15px">
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-57.jpg?image=57" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-57.jpg?image=57" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>           
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-58.jpg?image=58" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-58.jpg?image=58" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div> 
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-59.jpg?image=59" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-59.jpg?image=59" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div> 
                    <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="Gallery_2018/Image-60.jpg?image=60" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2018/Image-60.jpg?image=60" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div> 
                </div>  
                 <div class="row" style="padding-left: 22px;">
                    <div class="col-sm-6">
                        <video width="400" height="308" controls="" style="cursor: pointer" >
                            <source src="Gallery_2018/Video_1.mp4" type="video/mp4"/>
                        </video>
                    </div>

                    <div class="col-sm-6">
                        <video width="400" height="372" controls="" style="cursor: pointer;margin-top: -69px;">
                            <source src="Gallery_2018/Video_2.mp4" type="video/mp4" />
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
