<%@ Page Title="" Language="vb" EnableViewState="false" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" EnableEventValidation="false" CodeBehind="Home.aspx.vb" Inherits="EktaTrust.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .ordinal {
            font-size: small;
            position: relative;
            top: -0.5em;
            text-transform: capitalize;
        }

        .slide h2 {
            font-size: 18px;
        }
        .panel-heading.active a {
            color:white !important;
            text-decoration:none !important;
        }
        .panel-heading a:hover{color:black !important }
        .panel-heading.active a:hover{color:white !important }

        .modal-content{
                margin-top: 221px;
                width: 313px;
                margin-left: 155px;
                background-image:url("Images/slider/new_img_3.jpg")
        }
        .modal-header {
        margin-top: -10px;
        border-bottom: none;
            }
       
         .modal-footer{
        
        border-top: none;
            }
        .close {
            margin-top: 1px;
        }
       .feedback {
       background-image:url('Images/DonateUs.gif');
       padding: 10px 15px;
       border-radius: 1em 0 0 1em !important; 
       height:115px !important;
       width:25px !important;
       }

      #Donate {
     position: fixed;
     top: 190px;
     right: 0px !important;
     z-index:999;
     }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
           //$('#myModalLoad').modal('hide');
           //$('#exampleModal').modal('Show');
             //$('#NotePopup').modal('Show');
            function HideLabel() {
                var seconds = 5;
                setTimeout(function () {
                    document.getElementById("<%=lblErrorMsg.ClientID%>").style.display = "none";
                }, seconds * 1000);
            };

        });

    </script>


   <div id="Donate">
     <a href="https://www.onlinesbi.com/sbicollect/icollecthome.htm?corpID=922784" target="_blank"><button id="btnfeedback" type="button" class="feedback"></button></a>
   </div>

<%--<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header"> 
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <input type="button" style="margin-left: 89px; margin-top: 20px;background-color:#b5580a" id="btnOpenID" onclick="buttonclick()" class="btn btn-primary"  value="Open In App" />
      </div>
      <div class="modal-footer"> 
      </div>
    </div>
  </div>
</div>--%>
    <div class="modal fade" id="myModalLoad" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="background-color: deepskyblue;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h2 class="modal-title">Bib Expo for Run for Equality 2018</h2>
        </div>
        <div class="modal-body">
          
            <p style="font-size:17px"><b>Venue -</b> Youth Hostel Near Ambedkar Circle Jaipur<br /><br />

            <b>Date -</b> 13 April<br /><br />

            <b>Timings- </b>10 AM to 7 PM <br /><br />

            <b>Final Route – </b> Ambedkar Circle To Rambag To Gandhi Circle Turn To Gandhi Circle To Jhalana Road Beside 
                        Rajasthan University To Apex Circle To JagatPura Flyover To Circle Number 7 And Back From The Same Root.
                 
           <br /><br />
                   <b>21.09 KM</b><br />
                    Warm-Up: 4:15 AM to 4:30 AM Flag Off<br /><br />
                        <b>5 KM and 10 KM</b><br />
                         Warm-Up: 5:15 AM to 5:30 AM Flag Off<br /><br />

            <b> Contacts - </b> Mr. Movil (9660037537) or Arvind Hingonia (9001716311)

            </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

  <%--  <div style="display: inline;" id="swifttagdatacontainer85e9kywu98">
        <div>
            <style type="text/css">#kayako_sitebadgebg:hover {	background-color: #bec0c5 !important;}#kayako_sitebadgebg {	background-color: #a2a4ac;	border-color: #bec0c5 #717378 #717378 #717378 !important;}
            </style>
            <div id="kayako_sitebadgecontainer" title="" onclick="BtnClick()" style="background: transparent none repeat scroll 0 0; bottom: 0; cursor:pointer; height: 111px; left: 0; line-height: normal; margin: 0; padding: 0; position: fixed; top: 35% !important; z-index: 4000000000 !important;">	         	
                    <div id="kayako_sitebadgebg" style="background-color: #a2a4ac; border-color: #bec0c5 #717378 #717378 #717378 !important; background-image:url('Images/DonateUs.gif');   -moz-border-radius:  1em 0 0 1em  !important; border-radius: 1em 0 0 1em !important; -webkit-border-radius:  1em 0 0 1em !important; border-width: 1px 1px 1px medium !important; height: 115px !important; right: -1366px  !important; margin: 0 !important; opacity: 0.90 !important; padding: 0 !important; position: absolute !important; top: 0 !important; width: 30px !important; z-index: 19999 !important;">
                    </div>	       
            </div>
        </div>
  </div>--%>
 
    <div id="myCarousel" class="carousel slide hidden-xs " data-ride="carousel">
        <!-- Indicators -->
   
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1" class=""></li>
            <li data-target="#myCarousel" data-slide-to="2" class=""></li>
            <li data-target="#myCarousel" data-slide-to="3" class=""></li>
            <li data-target="#myCarousel" data-slide-to="4" class=""></li>
            <li data-target="#myCarousel" data-slide-to="5" class=""></li>
            <li data-target="#myCarousel" data-slide-to="6" class=""></li>
            <li data-target="#myCarousel" data-slide-to="7" class=""></li> 
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <img style="width: 100%;" src="Images/slider/new_img_1.jpg" alt="" />
            </div>
            <div class="item">
                <img style="width: 100%;" src="Images/slider/new_img_8.jpg" alt="" />
            </div>
            <div class="item">
                <img style="width: 100%;" src="Images/slider/new_img_3.jpg" alt="" />
            </div>
            <div class="item">
                <img style="width: 100%;" src="Images/slider/new_img_4.jpg" alt="" />
            </div>
            <div class="item">
                <img style="width: 100%;" src="Images/slider/new_img_5.jpg" alt="" />
            </div>
            <div class="item">
                <img style="width: 100%;" src="Images/slider/new_img_7.jpg" alt="" />
            </div>
            <div class="item">
                <img style="width: 100%;" src="Images/slider/new_img_6.jpg" alt="" />
            </div>
            <div class="item">
                <img style="width: 100%;" src="Images/slider/new_img_2.jpg" alt="" />
            </div>
         </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span><span class="sr-only">Previous</span> </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><span class="sr-only">Next</span> </a>
    </div>
    <div class="col-xs-4 col-md-2 hidden-xs hidden-sm" style="margin: 0px; padding: 0px;">
        <h5>Latest News</h5>
    </div>
    <div class=" col-md-10 hidden-xs" style="margin: 0px; padding: 0px;">
        <div class="tickercontainer">
            <div class="mask">
                <marquee direction="left" onmouseover="this.stop();" onmouseout="this.start();"><ul id="myUl" class="newsticker" style="width: 3811px; height: 60px; left: -222.4px;">
                    <li class="tick-clones"><img src="images\logo2.png" width="100"  height="50"/>
                        Unless casteless and classless society is created, there will be no progress in India - Dr B R Ambedkar
                        <%--Bib Expo for Run for Equality 2018, Venue-Youth Hostel Near Ambedkar Circle Jaipur, Date - 13 April, Timings- 10 AM to 7 PM. --%></li>
                    <li class="tick-clones"><img src="images\logo2.png" width="100"  height="50"/>
                          Unless casteless and classless society is created, there will be no progress in India - Dr B R Ambedkar
                       <%-- Run for Equality like last year will be organised in Jaipur on 14.04.2018 --%></li>
                    <li class="tick-clones"><img src="images\logo2.png" width="100"  height="50"/>
                          Unless casteless and classless society is created, there will be no progress in India - Dr B R Ambedkar
                       <%-- Bib Expo for Run for Equality 2018, Venue-Youth Hostel Near Ambedkar Circle Jaipur, Date - 13 April, Timings- 10 AM to 7 PM.--%> </li>
                   <li class="tick-clones"><img src="images\logo2.png" width="100"  height="50"/>
                          Unless casteless and classless society is created, there will be no progress in India - Dr B R Ambedkar
                       <%-- Run for Equality like last year will be organised in Jaipur on 14.04.2018 --%></li>
                    <li class="tick-clones"><img src="images\logo2.png" width="100"  height="50"/>
                          Unless casteless and classless society is created, there will be no progress in India - Dr B R Ambedkar
                     <%--   Bib Expo for Run for Equality 2018, Venue-Youth Hostel Near Ambedkar Circle Jaipur, Date - 13 April, Timings- 10 AM to 7 PM. --%></li>
                    <li class="tick-clones"><img src="images\logo2.png" width="100"  height="50"/>
                          Unless casteless and classless society is created, there will be no progress in India - Dr B R Ambedkar
                        <%--Run for Equality like last year will be organised in Jaipur on 14.04.2018 --%></li>
                   </ul></marquee>
            </div>
        </div>
    </div>

    <section>
        <div class="container">
            <div class="">
                <div class="col-sm-12 col-lg-8 col-md-12">
                    <div class="row padding-top">
                        <div class="col-sm-6 col-md-6 col-lg-6">
                            <div class="media services-wrap wow fadeInDown">
                                <div class="pull-left">
                                    <a href="../Training">
                                        <img src="images/online_img.png" class="img-responsive" alt="" /></a>
                                </div>
                                <div class="media-body">
                                    <h3 class="media-heading padding-top"><a href="../Training">Apply For Training</a></h3>
                                    <a href="../Training" target="_self" class="btn btn-default">Click Here </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6 col-lg-6">
                            <div class="media services-wrap wow fadeInDown">
                                <div class="pull-left">
                                    <img src="images/runforequality.png" class="img-responsive" style="height: 125px;" alt="" />
                                </div>
                                <div class="media-body">
                                    <h3 class="media-heading">Run for Equality</h3>
                                    <p>Registration for 14<span class="ordinal">th</span> April Event</p>
                                    <a href="../EventPrize" target="_self" class="btn btn-default">Click Here </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6 col-lg-6">
                            <div class="media services-wrap wow fadeInDown" style="min-height: 162px;">
                                <div class="pull-left">
                                    <a href="../MatrimonialInformation" target="new">
                                       <%-- <img src="images/SavitaBheem.jpg" class="img-responsive" alt="" /></a>--%>
                                    <img src="RunForEquality2018/MarrigePic.jpg" class="img-responsive" style="height:150px"/></a>


                                </div>
                                <div class="media-body">
                                        <h3 class="media-heading padding-top" style="padding-top: 0px; ">Register For Marriage </h3>
                                    <a href="../MatrimonialInformation" target="_self" class="btn btn-default">Click Here </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6 col-lg-6">
                            <div class="media services-wrap wow fadeInDown">
                                <div class="pull-left">
                                    <a href="https://sugamrpg.raj.nic.in/" target="new">
                                        <img src="images/online_apply_img.png" class="img-responsive" alt="" /></a>
                                </div>
                                <div class="media-body">
                                    <h3 class="media-heading">Mock Interview Programme</h3>
                                    <p>UPSC Mock Intreview Programme CSE 2017</p>
                                    <a href="/MIPRegistration.aspx?ExamType=UPSC" target="new" class="btn btn-default">Click Here </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12  col-md-12 col-lg-4 padding-top wow fadeInDown">
                    <div class="accordion">
                        <div class="panel-group" id="accordion1">
                            <div class="panel panel-default">
                                <div class="panel-heading active">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseThree1" style="font-size: 14px;">
                                    <h3 class="panel-title">VISION<i class="fa fa-angle-right pull-right"></i></h3></a>
                                </div>
                                <div id="collapseThree1" class="panel-collapse collapse in">
                                    <div class="panel-body" style="height: 105px; text-align: center; padding-top: 20px;">Create a Casteless and Atrocity free society where people can live with dignity and self respect and contribute in nation building</div>
                                </div>
                            </div>

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseFour1" style="font-size: 14px">
                                    <h3 class="panel-title">MOTTO <i class="fa fa-angle-right pull-right"></i></h3></a>
                                </div>
                                <div id="collapseFour1" class="panel-collapse collapse">
                                    <div class="panel-body" style="height: 105px; text-align: center; padding-top: 30px;">Building discrimination free India.</div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseTwo1" style="font-size: 14px">
                                    <h3 class="panel-title">SPIRIT OF THE TRUST <i class="fa fa-angle-right pull-right"></i></h3></a>
                                </div>
                                <div id="collapseTwo1" class="panel-collapse collapse">
                                    <div class="panel-body" style="height: 105px; text-align: center; padding-top: 40px;">To work without personal credit or expectations</div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion1" href="#collapseOne1" style="font-size: 14px">
                                    <h3 class="panel-title">THOUGHT OF THE DAY <i class="fa fa-angle-right pull-right"></i></h3></a>
                                </div>
                                <div id="collapseOne1" class="panel-collapse collapse">
                                    <div class="panel-body" style="height: 105px; text-align: center; padding-top: 30px;">
                                        <div class="media accordion-inner">
                                            <div class="media-body">
                                                <p>Life can only be understood backwards;<br />but it must be lived forwards.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/#accordion1-->
                    </div>
                </div>
                <!--/.row-->
            </div>
        </div>
        <!--/.container-->
    </section>
   <%-- 31/10/2018--%>

    <section>
        <div class="get-started  wow fadeInDown" style="padding: 0px;">
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
    <section class="service-item">
        <div class="container">
            <div class="row">
                <div class="col-sm-7">
                    <div class="row">
                        <h2>DETAILS OF GOVT WELFARE SCHEMES</h2>
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <div class="recent-work-wrap">
                                <img class="img-responsive" src="images/education.jpg" alt=""/>
                                <div class="overlay">
                                    <div class="recent-work-inner">
                                        <h3><a href="../Education" style="font-size: 18px;">Education</a> </h3>
                                        <a class="preview" href="../Education"><i class="fa fa-eye"></i>View</a>
                                    </div>
                                </div>
                                <p class="text-center">Education</p>
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6  ">
                            <div class="recent-work-wrap">
                                <img class="img-responsive" src="images/insurance.jpg" alt=""/>
                                <div class="overlay">
                                    <div class="recent-work-inner">
                                        <h3><a href="Insurance" style="font-size: 18px;">Insurance</a></h3>
                                        <a class="preview" href="Insurance"><i class="fa fa-eye"></i>View</a>
                                    </div>
                                </div>
                                <p class="text-center">Insurance</p>
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <div class="recent-work-wrap">
                                <img class="img-responsive" src="images/loan.jpg" alt=""/>
                                <div class="overlay">
                                    <div class="recent-work-inner">
                                        <h3><a href="Loans" style="font-size: 18px;">Loans </a></h3>
                                        <a class="preview" href="Loans"><i class="fa fa-eye"></i>View</a>
                                    </div>
                                </div>
                                <p class="text-center">Loans</p>
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6 ">
                            <div class="recent-work-wrap">
                                <img class="img-responsive" src="images/girl.jpg" alt=""/>
                                <div class="overlay">
                                    <div class="recent-work-inner">
                                        <h3><a href="Girl%20Schemes" style="font-size: 18px;">Girls Related Schemes</a></h3>
                                        <a class="preview" href="Girl%20Schemes"><i class="fa fa-eye"></i>View</a>
                                    </div>
                                </div>
                                <p class="text-center">Girls Related Schemes</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-5 padding-top2 wow fadeInDown animated" style="visibility: visible; animation-name: fadeInDown;">
                    <div id="carousel-example-generic" class="carousel slide hidden-xs" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators indicator">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
                            <li data-target="#carousel-example-generic" data-slide-to="3" class=""></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <div class="item active">
                                <a href="https://employmentnews.gov.in/" target="new">
                                    <img src="Images/vacancy_img.png" class="img-responsive" alt="Vacancy/Jobs Corner"/></a><br />
                                <h2>Vacancy/Jobs Corner</h2>
                                <p><a href="https://employmentnews.gov.in/" target="new">Employment news</a></p>
                            </div>
                            <div class="item">
                                <a href="AtrocitiesReporting.aspx">
                                    <img src="Images/atrocities_img2.png" class="img-responsive" alt=" Atrocities Reporting"/></a><br />
                                <h2>Atrocities Reporting</h2>
                                <p><a href="AtrocitiesReporting.aspx">View Details</a></p>
                            </div>
                          <div class="item">
                                <a href="CareerCounselling">
                                    <img src="Images/guidance_img3.png" class="img-responsive" alt="Career Counselling &amp; Guidance" /></a><br />
                                <h2>Career Counselling &amp; Guidance(जानें विशेषज्ञ से)</h2>[जिस क्षेत्र में अपना भविष्य बनाना चाहते है उसके बारे में जानिए विषेशज्ञों से।]
                                <p><a href="CareerCounselling">Click Here</a></p>
                            </div>
                            <div class="item">
                                <a href="Enroll">
                                    <img src="Images/enroll.png" class=" img-responsive" alt="Enroll the Students" /></a><br />
                                <h2>Enroll the Students </h2>
                                <p><a href="Enroll">View Details</a></p>
                            </div>
                        </div>

                        <!-- Controls -->
                        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
                        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
                    </div>
                </div>

                <!--/.row-->
            </div>
     </div>
        <!--/.container-->
        <section>
            <div class="container wow fadeInDown animated" style="visibility: visible; animation-name: fadeInDown;">

                <div class="col-lg-6 col-sm-6 col-md-6">
                    <a href="#" data-toggle="modal" data-target="#myModal2">
                        <img src="images/suggestion_img.png" class="img-responsive" alt=""/></a>
                </div>
                <div class="col-sm-6 col-md-6 col-lg-6 col-xs-12 pull-right">
                    <div class="view" style="margin: 5px; padding: 9px;">
                        <h2 class="pull-left" style="font-size: 18px; padding: 14px 0px 0px 21px;"><a href="Premable">View Preamable</a>
                            <br />
                            <a href="Objectives">View Objective</a></h2><br />
                            <label>Download App from here...</label>

                        <h3 class="text-right" style="font-size: 15px; padding: 8px;">
                            <a href="#" data-toggle="modal" data-target="#myModal">DOWNLOAD <i class="fa fa-download"></i></a></br>
                            <a href="#" data-toggle="modal" data-target="#Div1">DOWNLOAD <i class="fa fa-download"></i></a></br>
                            <a href="APK/EktaNavnirmanTrust.apk" target="_blank" style="text-align: center!important; text-decoration: underline; float:right; ">Download
                    </a>
                        </h3>
                    </div>
                </div>
            </div>
        </section>
        <section id="bottom">
            <div class="container wow fadeInDown animated" data-wow-duration="1000ms" data-wow-delay="600ms" style="visibility: visible; animation-duration: 1000ms; animation-delay: 600ms; animation-name: fadeInDown;">
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
                            <div class="pull-right"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a></div>
                            <strong>Ekta Navnirman Trust,</strong><br/>
                            B-15, Pragathi Path,Bajaj Nagar,<br/>
                            Jaipur
                            <br/>
                            <br/>
                            <img src="Images/logo-small.jpg" class="img-responsive pull-right" alt="" />
                            <%--<img src="Images/logo-small1.png" class="img-responsive pull-right" alt="">--%>
                            <br/>
                            <strong>Email Us</strong><br/>
                            <a href="mailto:ektanavnirmantrust@gmail.com">ektanavnirmantrust@gmail.com</a>
                            <br/>
                            <br/>
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

        <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times; </button>
                        <h4 class="modal-title" id="myModalLabel">Premable </h4>
                    </div>
                    <div class="modal-body text-center"><a href="doc/ENT-PREAMBLE.docx" class="btn btn-primary">English Version </a><a href="doc/Preamble-Hindi.docx" class="btn btn-primary">Hindi Version </a></div>
                </div>

                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->

        </div>
        <!-- /.modal -->
        <div class="modal fade" id="Div1" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times; </button>
                        <h4 class="modal-title" id="myModalLabel">Objective </h4>
                    </div>
                    <div class="modal-body text-center"><a href="doc/Objective%20Doc.docx" class="btn btn-primary">Download English Version </a></div>
                </div>

                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->

        </div>

        <!-- Modal-->
        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times; </button>
                        <h4>Suggestion for the Trust</h4>
                    </div>
                    <div class="modal-body">

                        <asp:Label ID="lblErrorMsg" runat="server" ForeColor="green" Font-Bold="true" Text="Message Submit Successfully" Visible="false"></asp:Label>
                        <div class="form-group">
                            <label>Name *</label>

                            <asp:TextBox ID="textName" runat="server" class="form-control" Text=""></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="reqName" ControlToValidate="textName" ForeColor="Red" ErrorMessage="*" ToolTip="Please Enter Your Name" />
                        </div>
                        <div class="form-group">
                            <label>Email *</label>

                            <asp:TextBox ID="textEmail" runat="server" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="reqEmail" ControlToValidate="textEmail" ForeColor="Red" ErrorMessage="*" ToolTip="Please Enter EmailId" />
                            <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ControlToValidate="textEmail" ForeColor="Red" ErrorMessage="Please enter valid email id format." />
                        </div>
                        <div class="form-group">
                            <label>Feedback Type</label>

                            <asp:DropDownList ID="ddlFeedBack" runat="server" class="form-control">
                                <asp:ListItem Value="Select">Select</asp:ListItem>
                                <asp:ListItem Value="Education">Education</asp:ListItem>
                                <asp:ListItem Value="Insurance">Insurance</asp:ListItem>
                                <asp:ListItem Value="Loans">Loans</asp:ListItem>
                                <asp:ListItem Value="Girl Related Schemes">Girl Related Schemes</asp:ListItem>
                            </asp:DropDownList>

                        </div>
                        <div class="form-group">
                            <label>Comment *</label>

                            <asp:TextBox ID="textComment" runat="server" Rows="5" Columns="40" TextMode="multiline" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="reqComment" ControlToValidate="textComment" ForeColor="Red" ErrorMessage="*" ToolTip="Please Enter Comment" />
                        </div>
                        <div class="form-group">

                            <asp:Button ID="ButtonSubmitMessage" runat="server" class="btn btn-primary btn-lg" Text="Submit Message" OnClick="ButtonSubmitMessage_Click" />

                        </div>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->

        </div>

    </section>
    <script type="text/javascript">   
        //function buttonclick() {
        //    window.location.href = "https://play.google.com";
        //}
      
        //function BtnClick()
        //{           
        //    window.location.href = 'https://www.onlinesbi.com/sbicollect/icollecthome.htm?corpID=922784';
        //}
        
      
        
        $('#btncall').click(function () {
            //$("#<%=txtSignupEmail.ClientId %>").val()
            var textEmail = $("#<%=txtSignupEmail.ClientId %>").val();
            if (textEmail === '') {
                alert("Please enter your email address!");
            }
            else {
                // alert("test testing");
                $.ajax({
                    url: "/Home.aspx/GetDataforMessage",
                    data: '{email: "' + $("#<%=txtSignupEmail.ClientId %>").val() + '" }',
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json",

                    success: function (msg) {
                        if (msg.d === 1) {
                            alert("This is already registered please try another email id!");
                        }
                        else {
                            console.log(msg);
                            alert("Your email address registered successfully!");
                        }
                    },
                    error: function () {
                        alert("Please try again!");
                    }
                });
            }

        });      
        //$("#btnfeedback").click(function () {         
        //        window.location.href = "https://www.onlinesbi.com/sbicollect/icollecthome.htm?corpID=922784";
        //});    

        //$("#imgdonate ").click(function () {
        //       window.location.href = "https://www.onlinesbi.com/sbicollect/icollecthome.htm?corpID=922784";

        //});
    </script>
   
</asp:Content>
