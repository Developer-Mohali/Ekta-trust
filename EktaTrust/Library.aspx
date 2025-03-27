<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="Library.aspx.vb" Inherits="EktaTrust.Library" %>
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
                    Library
                <hr class="row marginImage" style="border: 1px dotted orange;" />
                </p>

            </div>
            <!--Page Title-->
            <div class="row marginImage" style="margin-left: 15px">
            </div>
            <!--first Rows Add-->

             <%-- gallery event menu --%>
            <uc:GallerySideMenuControl runat="server" id="GallerySideMenuControl" />

            <div class="col-md-9 col-sm-10 col-xs-12" style="padding-right: 0px; padding-left: 0px; top: 10px;">

                <!--one row-->
                <div class="row marginImage"style="margin-left: 15px">
                   <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        
                        <img class="thumbnail" id="dd" src="Gallery_2022/3.jpg" alt="#" />
                        <div>
                            <a class="lightbox" href="Gallery_2022/3.jpg" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                                
                            </a>
                        </div>
                    </div>

                     <div id="box" class="burst-side strawberry">
                          <div class="caption"></div>     
                          <img class="thumbnail" id="dd" src="Gallery_2022/53.jpeg" alt="#" />
                          <div>
                              <a class="lightbox" href="Gallery_2022/53.jpeg" data-littlelightbox-group="gallery">
                                  <h1>View Image</h1>
              
                              </a>
                          </div>
                      </div>
                    <div id="box" class="burst-side strawberry">
                         <div class="caption"></div>     
                         <img class="thumbnail" id="dd" src="Gallery_2022/54.jpeg" alt="#" />
                         <div>
                             <a class="lightbox" href="Gallery_2022/54.jpeg" data-littlelightbox-group="gallery">
                                 <h1>View Image</h1>
              
                             </a>
                         </div>
                     </div>
                         <div id="box" class="burst-side strawberry">
                              <div class="caption"></div>     
                              <img class="thumbnail" id="dd" src="Gallery_2022/55.jpeg" alt="#" />
                              <div>
                                  <a class="lightbox" href="Gallery_2022/55.jpeg" data-littlelightbox-group="gallery">
                                      <h1>View Image</h1>
              
                                  </a>
                              </div>
                          </div>
                       <div id="box" class="burst-side strawberry">
                            <div class="caption"></div>     
                            <img class="thumbnail" id="dd" src="Gallery_2022/56.jpeg" alt="#" />
                            <div>
                                <a class="lightbox" href="Gallery_2022/56.jpeg" data-littlelightbox-group="gallery">
                                    <h1>View Image</h1>
              
                                </a>
                            </div>
                        </div>
                      <div id="box" class="burst-side strawberry">
                           <div class="caption"></div>     
                           <img class="thumbnail" id="dd" src="Gallery_2022/57.jpeg" alt="#" />
                           <div>
                               <a class="lightbox" href="Gallery_2022/57.jpeg" data-littlelightbox-group="gallery">
                                   <h1>View Image</h1>
              
                               </a>
                           </div>
                       </div>
                        <div id="box" class="burst-side strawberry">
                           <div class="caption"></div>     
                           <img class="thumbnail" id="dd" src="Gallery_2022/58.jpeg" alt="#" />
                           <div>
                               <a class="lightbox" href="Gallery_2022/58.jpeg" data-littlelightbox-group="gallery">
                                   <h1>View Image</h1>           
                               </a>
                           </div>
                       </div> 

                </div>
                    <div class="row" style="padding-left: 22px; padding-top:25px">
                        <div class="col-sm-6">
                            <video width="400" height="300" controls="" style="cursor: pointer">
                                <source src="Gallery_2022/Video1.mp4" />" type="video/mp4">
                            </video>
                        </div>
                         
                        <div class="col-sm-6">
                            <video width="400" height="300" controls="">
                                <source src="Gallery_2022/Video2.mp4" type="video/mp4" style="cursor: pointer">
                            </video>
                        </div>

                          <div class="col-sm-6">
                              <video width="400" height="300" controls="">
                                  <source src="Gallery_2022/Video8.mp4" type="video/mp4" style="cursor: pointer">
                              </video>
                          </div>
                   </div>

                <!-- Library 2 section -->
                <h2 style="margin: 20px; font-size: 25px !important; border-bottom: 1px dotted orange; font-weight: bold;">Ambedkar Library in Baba Garibnath Boys Hostel</h2>
                <!-- Images-->
                   <div class="row marginImage"style="margin-left: 15px">
                         <div id="box" class="burst-side strawberry">
                               <div class="caption"></div>     
                               <img class="thumbnail" id="dd" src="Gallery_2022/59.jpeg" alt="#" />
                               <div>
                                   <a class="lightbox" href="Gallery_2022/59.jpeg" data-littlelightbox-group="gallery">
                                       <h1>View Image</h1>
              
                                   </a>
                               </div>
                           </div>
                          <div id="box" class="burst-side strawberry">
                               <div class="caption"></div>     
                               <img class="thumbnail" id="dd" src="Gallery_2022/60.jpeg" alt="#" />
                               <div>
                                   <a class="lightbox" href="Gallery_2022/60.jpeg" data-littlelightbox-group="gallery">
                                       <h1>View Image</h1>
              
                                   </a>
                               </div>
                           </div>
                          <div id="box" class="burst-side strawberry">
                               <div class="caption"></div>     
                               <img class="thumbnail" id="dd" src="Gallery_2022/61.jpeg" alt="#" />
                               <div>
                                   <a class="lightbox" href="Gallery_2022/61.jpeg" data-littlelightbox-group="gallery">
                                       <h1>View Image</h1>
              
                                   </a>
                               </div>
                           </div>   
                        <div id="box" class="burst-side strawberry">
                               <div class="caption"></div>     
                               <img class="thumbnail" id="dd" src="Gallery_2022/62.jpeg" alt="#" />
                               <div>
                                   <a class="lightbox" href="Gallery_2022/62.jpeg" data-littlelightbox-group="gallery">
                                       <h1>View Image</h1>
              
                                   </a>
                               </div>
                           </div>
                    </div>

                  <!-- Videos-->
                          <div class="row" style="padding-left: 22px; padding-top:25px">
                              <div class="col-sm-6">
                                  <video width="400" height="300" controls="">
                                      <source src="Gallery_2022/Video9.mp4" type="video/mp4" style="cursor: pointer">
                                  </video>
                              </div>
                         </div>

                <!-- Library 3 section -->
                <h2 style="margin: 20px; font-size: 25px !important; border-bottom: 1px dotted orange; font-weight: bold;">Ekta Library at Manoharpur</h2>
                       <!-- Images-->
                  <div class="row marginImage"style="margin-left: 15px">             
                         <div id="box" class="burst-side strawberry">
                              <div class="caption"></div>     
                              <img class="thumbnail" id="dd" src="Gallery_2022/63.jpeg" alt="#" />
                              <div>
                                  <a class="lightbox" href="Gallery_2022/63.jpeg" data-littlelightbox-group="gallery">
                                      <h1>View Image</h1>
     
                                  </a>
                              </div>
                          </div>   
                   </div>

                        <!-- Videos-->
                          <div class="row" style="padding-left: 22px; padding-top:25px">
                              <div class="col-sm-6">
                                  <video width="400" height="300" controls="">
                                      <source src="Gallery_2022/Video10.mp4" type="video/mp4" style="cursor: pointer">
                                  </video>
                              </div>
                         </div>
                <!-- End of Section 3 -->

                 <!-- Library 4 section (Library at Mania) -->
                <h2 style="margin: 20px; font-size: 25px !important; border-bottom: 1px dotted orange; font-weight: bold;">Ekta Library at Mania</h2>
                       <!-- Images-->
      <%--            <div class="row marginImage"style="margin-left: 15px">             
                         <div id="box" class="burst-side strawberry">
                              <div class="caption"></div>     
                              <img class="thumbnail" id="dd" src="Gallery_2022/63.jpeg" alt="#" />
                              <div>
                                  <a class="lightbox" href="Gallery_2022/63.jpeg" data-littlelightbox-group="gallery">
                                      <h1>View Image</h1>
     
                                  </a>
                              </div>
                          </div>   
                   </div>--%>

                        <!-- Videos-->
                          <div class="row" style="padding-left: 22px; padding-top:25px">
                              <div class="col-sm-6">
                                  <video width="400" height="300" controls="">
                                      <source src="Gallery_2022/Video11.mp4" type="video/mp4" style="cursor: pointer" />
                                  </video>
                              </div>
                                 <div class="col-sm-6">
                                       <video width="400" height="300" controls="">
                                           <source src="Gallery_2022/Video12.mp4" type="video/mp4" style="cursor: pointer" />
                                       </video>
                                   </div>
                         </div>
                <!-- End of Section 4 -->

                <!-- Library 5 section (Library at Mania) -->
                <h2 style="margin: 20px; font-size: 25px !important; border-bottom: 1px dotted orange; font-weight: bold;">Ekta Library at Virat Nagar</h2>
                       <!-- Images-->
      <%--            <div class="row marginImage"style="margin-left: 15px">             
                         <div id="box" class="burst-side strawberry">
                              <div class="caption"></div>     
                              <img class="thumbnail" id="dd" src="Gallery_2022/63.jpeg" alt="#" />
                              <div>
                                  <a class="lightbox" href="Gallery_2022/63.jpeg" data-littlelightbox-group="gallery">
                                      <h1>View Image</h1>
     
                                  </a>
                              </div>
                          </div>   
                   </div>--%>

                        <!-- Videos-->
                          <div class="row" style="padding-left: 22px; padding-top:25px">
                              <div class="col-sm-6">
                                  <video width="400" height="300" controls="">
                                      <source src="Gallery_2022/Video13.mp4" type="video/mp4" style="cursor: pointer" />
                                  </video>
                              </div>
                         </div>
                <!-- End of Section 4 -->

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
