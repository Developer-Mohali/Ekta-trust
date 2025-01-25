<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="Gallery_2019.aspx.vb" Inherits="EktaTrust.Gallery_2019" %>
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
                    Felicitation Programme 2019
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
                            <a href="../RunForEquality2019.aspx" class="list-group-item ">Run For Equality 2019</a>
                            <a href="../RunForEquality2018.aspx" class="list-group-item">Run For Equality 2018</a>
                            <a href="../RunForEquality" class="list-group-item">Run For Equality 2017</a>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading active">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordionGallery" href="#collapseThree1" style="font-size: 14px;">
                                <h3 class="panel-title">Felicitation Programme  <i class="fa fa-angle-right pull-right"></i></h3>
                            </a>
                        </div>
                        <div id="collapseThree1" class="panel-collapse show" style="height: auto;">
                            <a href="../Gallery2020" class="list-group-item">Felicitation Programme 2020</a>
                            <a href="../Gallery2019" class="list-group-item active">Felicitation Programme 2019</a>
                            <a href="../Gallery2018" class="list-group-item">Felicitation Programme 2018</a>
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
               <%--<div class="row marginImage" style="margin-left: 15px">
        
               <div id="box" class="burst-side strawberry">
                    <div class="caption"></div>
                    <img class="thumbnail" id="dd" src="Gallery_2019/ekta%20Registration.jpg" alt="#" />
                    <div>
                        <a class="lightbox" href="Gallery_2019/ekta Registration.jpg" data-littlelightbox-group="gallery">
                            <h1>View Image</h1>
                        </a>
                    </div>
                </div>
                   <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       <img class="thumbnail" id="dd" src="Gallery_2019/IAS2.jpg" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/IAS2.jpg" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>
                   </div>
                   <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       <img class="thumbnail" id="dd" src="Gallery_2019/ektagroup.jpg" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/ektagroup.jpg" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>

                   </div>
                      <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       <img class="thumbnail" id="dd" src="Gallery_2019/img8.png" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/img8.png"   data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>

                   </div>
                    
                </div> --%>

                <!--first row-->
               <div class="row marginImage" style="margin-left: 15px">
        
               <div id="box" class="burst-side strawberry">
                    <div class="caption"></div>
                  
                    <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8336.JPG" alt="#" />
                    <div>
                        <a class="lightbox" href="Gallery_2019/6M0A8336.JPG" data-littlelightbox-group="gallery">
                            <h1>View Image</h1>
                        </a>
                    </div>
                </div>
                   <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8337.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8337.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>
                   </div>
                   <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8346.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8346.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>

                   </div>
                      <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8354.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8354.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>

                   </div>
                    
                </div>
                
                <!--second row-->

               <div class="row marginImage" style="margin-left: 15px">
        
               <div id="box" class="burst-side strawberry">
                    <div class="caption"></div>
                  
                    <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8359.JPG" alt="#" />
                    <div>
                        <a class="lightbox" href="Gallery_2019/6M0A8359.JPG" data-littlelightbox-group="gallery">
                            <h1>View Image</h1>
                        </a>
                    </div>
                </div>
                   <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8360.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8360.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>
                   </div>
                   <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8361.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8361.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>

                   </div>
                      <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8373.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8373.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>

                   </div>
                    
                </div> 

                <!--third row-->
               
               <div class="row marginImage" style="margin-left: 15px">
        
               <div id="box" class="burst-side strawberry">
                    <div class="caption"></div>
                  
                    <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8395.JPG" alt="#" />
                    <div>
                        <a class="lightbox" href="Gallery_2019/6M0A8395.JPG" data-littlelightbox-group="gallery">
                            <h1>View Image</h1>
                        </a>
                    </div>
                </div>
                   <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8407.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8407.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>
                   </div>
                   <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8414.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8414.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>

                   </div>
                      <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8415.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8415.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>

                   </div>
                    
                </div> 

                 <!--fourth row-->
                
               <div class="row marginImage" style="margin-left: 15px">
        
               <div id="box" class="burst-side strawberry">
                    <div class="caption"></div>
                  
                    <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8451.JPG" alt="#" />
                    <div>
                        <a class="lightbox" href="Gallery_2019/6M0A8451.JPG" data-littlelightbox-group="gallery">
                            <h1>View Image</h1>
                        </a>
                    </div>
                </div>
                   <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8460.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8460.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>
                   </div>
                   <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8463.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8463.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>

                   </div>
                      <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8465.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8465.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>

                   </div>
                    
                </div> 

                <!--fifth row-->
               
               <div class="row marginImage" style="margin-left: 15px;">
        
               <div id="box" class="burst-side strawberry">
                    <div class="caption"></div>
                  
                    <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8473.JPG" alt="#" />
                    <div>
                        <a class="lightbox" href="Gallery_2019/6M0A8473.JPG" data-littlelightbox-group="gallery">
                            <h1>View Image</h1>
                        </a>
                    </div>
                </div>
                   <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8474.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8474.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>
                   </div>
                   <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8679.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8679.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>

                   </div>
                      <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8480.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8480.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>

                   </div>
                    
                </div> 

                 <!--sixth row-->
                
               <div class="row marginImage" style="margin-left: 15px;">
        
               <div id="box" class="burst-side strawberry">
                    <div class="caption"></div>
                  
                    <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8493.JPG" alt="#" />
                    <div>
                        <a class="lightbox" href="Gallery_2019/6M0A8493.JPG" data-littlelightbox-group="gallery">
                            <h1>View Image</h1>
                        </a>
                    </div>
                </div>
                   <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8512.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8512.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>
                   </div>
                   <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8515.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8515.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>

                   </div>
                      <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8684.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8684.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>

                   </div>
                    
                </div>

                <!--seventh row-->
                
               <div class="row marginImage" style="margin-left: 15px;">
        
               <div id="box" class="burst-side strawberry">
                    <div class="caption"></div>
                  
                    <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8528.JPG" alt="#" />
                    <div>
                        <a class="lightbox" href="Gallery_2019/6M0A8528.JPG" data-littlelightbox-group="gallery">
                            <h1>View Image</h1>
                        </a>
                    </div>
                </div>
                   <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8532.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8532.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>
                   </div>
                   <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8540.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8540.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>

                   </div>
                      <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8541.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8541.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>

                   </div>
                    
                </div>

                 <!--eighth row-->
                 
               <div class="row marginImage" style="margin-left: 15px;">
        
               <div id="box" class="burst-side strawberry">
                    <div class="caption"></div>
                  
                    <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8553.JPG" alt="#" />
                    <div>
                        <a class="lightbox" href="Gallery_2019/6M0A8553.JPG" data-littlelightbox-group="gallery">
                            <h1>View Image</h1>
                        </a>
                    </div>
                </div>
                   <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8904.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8904.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>
                   </div>
                   <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8574.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8574.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>

                   </div>
                      <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8579.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8579.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>

                   </div>
                    
                </div>

                <!--ninth row-->
                
               <div class="row marginImage" style="margin-left: 15px;">
        
               <div id="box" class="burst-side strawberry">
                    <div class="caption"></div>
                  
                    <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8600.JPG" alt="#" />
                    <div>
                        <a class="lightbox" href="Gallery_2019/6M0A8600.JPG" data-littlelightbox-group="gallery">
                            <h1>View Image</h1>
                        </a>
                    </div>
                </div>
                   <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8603.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8603.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>
                   </div>
                   <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8604.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8604.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>

                   </div>
                      <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8607.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8607.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>

                   </div>
                    
                </div>

                <!--tenth row-->
                 
               <div class="row marginImage" style="margin-left: 15px;">
        
               <div id="box" class="burst-side strawberry">
                    <div class="caption"></div>
                  
                    <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8635.JPG" alt="#" />
                    <div>
                        <a class="lightbox" href="Gallery_2019/6M0A8635.JPG" data-littlelightbox-group="gallery">
                            <h1>View Image</h1>
                        </a>
                    </div>
                </div>
                   <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8638.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8638.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>
                   </div>
                   <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8645.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8645.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>

                   </div>
                      <div id="box" class="burst-side strawberry">
                       <div class="caption"></div>
                       <img class="thumbnail" id="dd" src="Gallery_2019/6M0A8646.JPG" alt="#" />
                       <div>
                           <a class="lightbox" href="Gallery_2019/6M0A8646.JPG" data-littlelightbox-group="gallery">
                               <h1>View Image</h1>
                           </a>
                       </div>

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


