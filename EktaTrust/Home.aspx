<%@ Page Title="" Language="vb" EnableViewState="false" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" EnableEventValidation="false" CodeBehind="Home.aspx.vb" Inherits="EktaTrust.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
            color: white !important;
            text-decoration: none !important;
        }

        .panel-heading a:hover {
            color: black !important
        }

        .panel-heading.active a:hover {
            color: white !important
        }

 /*       .modal-content {
            margin-top: 221px;
            width: 313px;
            margin-left: 155px;
            background-image: url("Images/slider/new_img_3.jpg");
        }

        .modal-header {
            margin-top: -10px;
            border-bottom: none;
        }

        .modal-footer {
            border-top: none;
        }

        .close {
            margin-top: 1px;
        }*/

        .feedback {
            background-image: url('Images/DonateUs.gif');
            padding: 10px 15px;
            border-radius: 1em 0 0 1em !important;
            height: 115px !important;
            width: 25px !important;
        }

        #Donate {
            position: fixed;
            top: 190px;
            right: 0px !important;
            z-index: 999;
        }

        #overlay {
position: fixed;
top: 0;
left: 0;
width: 100%;
height: 100%;
background-color: #000;
filter:alpha(opacity=70);
-moz-opacity:0.7;
-khtml-opacity: 0.7;
opacity: 0.7;
z-index: 100;
display: none;
}
.cnt223 a{
text-decoration: none;
}
/*.popup{
width: 100%;
margin: 0 auto;
display:none;
position:fixed;
z-index: 101;
}*/
.cnt223{

width: 600px!important;
min-height: 150px;
margin: 100px auto;
background: #f3f3f3;
position: relative;
z-index: 103;
padding: 15px 35px;
border-radius: 5px;
box-shadow: 0 2px 5px #000;
}
.cnt223 p{
clear: both;
    color: #555555;
 
    font-size: 15px;
    font-family: sans-serif;
}
.cnt223 p a{
color: red;
font-weight: bold;
}
.cnt223 .x{
float: right;
height: 35px;
left: 22px;
position: relative;
top: -25px;
width: 34px;
}
.cnt223 .x:hover{
cursor: pointer;
}


/*.CertificateFeedback {*/
            /*position: absolute;
            bottom: 4.58rem;*/
            /*padding: 22px 55px;
            border: none;
            border-radius: 7px;*/
            /*float: right;*/
            /*color: #fff;
            background-color: #5cb85c;
            border-color: #4cae4c;
            font-size:18px;
        }*/
/* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 500px;
            max-width: 600px;
        }

        /* The Close Button */
        .closepopup {
            color: #aaa;
            float: right;
            font-size: 20px;
            font-weight: bold;
        }

            .closepopup:hover,
            .closepopup:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
            .edifysports{
                padding:25px 8px !important;
            }

            .Header_popup{
                border-bottom: 1px solid #dee2e6;
                margin-bottom:20px;
            }


@media only screen and (min-device-width : 320px) and (max-device-width : 480px) {
        .cnt223 {
            width: 300px!important;
        }

}
@media only screen and (min-device-width : 375px) and (max-device-width : 667px) {
        .cnt223 {
            width: 300px!important;
        }

}

    </style>


    <div id="Donate">
       <%-- <a href="https://www.onlinesbi.com/sbicollect/icollecthome.htm?corpID=922784" target="_blank">
            <button id="btnfeedback" type="button" class="feedback"></button>
        </a>--%>
        <%-- <a href="https://www.onlinesbi.sbi/sbicollect/icollecthome.htm?corpID=922784" target="_blank">
            <button id="btnfeedback" type="button" class="feedback"></button>
        </a>--%>
        <a href="../Donation" target="_blank">
            <button id="btnfeedback" type="button" class="feedback"></button>
        </a>
    </div>

        <script type="text/javascript">
            $(document).ready(function () {
               
            //$("#myModalHomePage").modal("show");
            //$("#myModalHomePage").modal("show");

                //Commented this line below on (6-25-2022)
            //$("#myModalHomePage1").click();
            //$("#myModalHomePage1").click();
            //$("#myModalHomePage1").click();F
            //$("#myModalHomePage").modal("show");
            <%--function HideLabel() {
                var seconds = 5;
                setTimeout(function () {
                    document.getElementById("<%=lblErrorMsg.ClientID%>").style.display = "none";
                }, seconds * 1000);
            };--%>

        });

        </script>


     <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" id="myModalHomePage1" data-toggle="modal" data-target="#myModalHomePage" style="display:none">Open Modal</button>

  <!-- Modal -->
  <div class="modal fade" id="myModalHomePage" role="dialog" >
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <%--<button type="button" class="close" data-dismiss="modal">&times;</button>--%>
          <h4 class="modal-title"> Bib-Expo: Run For Equality 2023</h4>
        </div>
        <div class="modal-body">
          <p>
        Bib-Expo for run for equality will be organised on 13 April at Ambedkar Memorial Welfare Society, Jhalana Doongri, Jaipur
       <br/>
               <br/>Time-11AM to 7PM. 
        <br/><br/> Map: <a href="https://g.co/kgs/7AiBo4" target="_blank"> https://g.co/kgs/7AiBo4 </a> <br />
        <br/>
              Contact Us : Whatsapp  +91-7877664078 <br />
                           &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Call   <a href="tel:+91-9001716311">+91-9001716311</a> <br />
                            &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Call   <a href="tel:+91-9660037537">+91-9660037537</a> <br />
              <br/>
       <%-- Ekta Team--%></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
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
                <marquee direction="left" onmouseover="this.stop();"  onmouseout="this.start();">
                    <ul id="myUl" class="newsticker" style="width: 5300px; height: 60px; left: -222.4px;">
                   <asp:Repeater ID="repmarq" runat="server" >                    
                <ItemTemplate> 
                    <li class="tick-clones" style="color:white; font:bold"><img src="images\logo2.png" width="100"  height="50"/>
                   
                        <asp:Label ID="latestNews" runat="server" Text='<%#Eval("NewsDescription")%>'  ></asp:Label>
                        <div >
                </div>
                    </li>
                        </li>              
                </ItemTemplate>
            </asp:Repeater>
                   
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
                            <div class="media services-wrap wow fadeInDown" id="removeHeight" style="height:176px;">
                                <div class="pull-left">
                                    <a href="../EventPrize" target="_self"><img src="images/runforequality.png" class="img-responsive" style="" alt="" /></a>
                                </div>
                                <br />
                                <div class="media-body">
                                   <%-- <h3 class="media-heading">Bib-Expo Details</h3>--%>
                                   <a href="../EventPrize" target="_self"> <h2 class="media-heading">Run for equality 14.04.2026 Registration</h2></a>
                                    <%--<p>Registration for 14<span class="ordinal">th</span> April Event</p>--%>
                                   <%-- <p>BIB EXPO Details</p>--%>
                                    <a href="../EventPrize" target="_self" class="btn btn-default">Register Here</a>                                   
                                    <%--<a href="../RunCertificate" target="_self" class="btn btn-default">Register</a>--%>                                   
                                </div>
                            </div>
                        </div>
                         <div class="col-sm-6 col-md-6 col-lg-6">
                            <div class="media services-wrap wow fadeInDown">
                                <div class="pull-left">
                                    <a href="/MIPRegistration.aspx?ExamType=UPSC" target="new">
                                        <img src="images/online_apply_img.png" class="img-responsive"  style="height:125px;" alt="" /></a>
                                </div>
                                <div class="media-body"  <%--style="height:150px;--%>" >
                                   <%--<a href="/MIPRegistration.aspx?ExamType=UPSC"> <h3 class="media-heading">Mock Interview Programme(MIP)</h3></a>--%>
                                   <a href="/MIPRegistration.aspx?ExamType=UPSC"> <h3 class="media-heading">Mock Interview Programme(MIP-2024)</h3></a>
                                    <%--<p>UPSC Mock Intreview Programme CSE-2021 Qualified Candidates</p>--%>
                                    <p>Free IAS Mock Interview Programme for CSE-2023 qualified candidates</p>
                                    <a href="/MIPRegistration.aspx?ExamType=UPSC" target="new" class="btn btn-default">Register Here </a>
                                </div>
                            </div>
                        </div>
                         <div class="col-sm-6 col-md-6 col-lg-6">
                            <div class="media services-wrap wow fadeInDown" >
                                <div class="pull-left">
                                    <a href="../MatrimonialInformation" target="new">
                                        <%-- <img src="images/SavitaBheem.jpg" class="img-responsive" alt="" /></a>--%>
                                        <img src="RunForEquality2018/MarrigePic.jpg" class="img-responsive" style="height: 150px;" /></a>
                                </div>
                                <div class="media-body">
                               <a href="../MatrimonialInformation"><h3 class="media-heading padding-top" style="padding-top: 0px;">REGISTER FOR INTER CASTE MARRIAGE </h3></a>
                                    <a href="../MatrimonialInformation" target="_self" class="btn btn-default">Click Here </a>
                                </div>
                            </div>
                        </div>
                        <%--<div class="col-sm-6 col-md-6 col-lg-6">
                            <div class="media services-wrap wow fadeInDown">
                                <div class="pull-left">
                                    <a href="../Training">
                                        <img src="images/MigrantSetImage.jpg" class="img-fluid"  alt=""  style="height: 150px" /></a>
                                </div>
                                <div class="media-body">
                                    <h3 class="media-heading padding-top"><a href="../Training">Migrants Registration</a></h3>
                                    <a href="../MigrantsRegistration.aspx" target="_self" class="btn btn-default">Click Here </a>
                                </div>
                            </div>
                        </div>--%>
                        <div class="col-sm-6 col-md-6 col-lg-6">
                            <div class="media services-wrap wow fadeInDown">
                                <div class="pull-left">
                                    <a href="../EktaCreativeCompetition.aspx">
                                       <img src="Gallery_2023/1.jpeg" class="img-fluid" alt="" style="height: 150px;"/></a>
                                </div>
                                <div class="media-body">
                                    <a href="../EktaCreativeCompetition2025.aspx"> <h3 class="media-heading">Ekta Creative Competition</h3></a>
                                    <a href="../EktaCreativeCompetition2025.aspx" target="_self" class="btn btn-default">Click Here </a>
                                </div>
                            </div>
                        </div>
                        
                      
                       
                       
                    </div>
                </div>
                <div class="col-sm-12  col-md-12 col-lg-4 padding-top wow fadeInDown">
                     <%--<div class="panel-group" id="accordion">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                            <h4 class="panel-title">
                             <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Collapsible Group 1</a>
                 </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse in">
        <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Collapsible Group 2</a>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse">
        <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Collapsible Group 3</a>
        </h4>
      </div>
      <div id="collapse3" class="panel-collapse collapse">
        <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
      </div>
    </div>
  </div> 
</div>--%>



                  <div class="accordion">
                        <div class="panel-group" id="accordion1">
                            <div class="panel panel-default">
                                <div class="panel-heading active ">
                                  
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseThree1" style="font-size: 14px;">
                                          <h3 class="panel-title">VISION<i class="fa fa-angle-right pull-right"></i></h3>
                                    </a>
                                </div>
                                <div id="collapseThree1" class="panel-collapse collapse in">
                                    <div class="panel-body" style="height: 105px; text-align: center; padding-top: 20px;">Create a Casteless and Atrocity free society where people can live with dignity and self respect and contribute in nation building</div>
                                </div>
                            </div>

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseFour1" style="font-size: 14px">
                                        <h3 class="panel-title">MOTTO <i class="fa fa-angle-right pull-right"></i></h3>
                                    </a>
                                </div>
                                <div id="collapseFour1" class="panel-collapse  collapse ">
                                    <div class="panel-body" style="height: 105px; text-align: center; padding-top: 30px;">Building discrimination free India.</div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseTwo1" style="font-size: 14px">
                                        <h3 class="panel-title">SPIRIT OF THE TRUST <i class="fa fa-angle-right pull-right"></i></h3>
                                    </a>
                                </div>
                                <div id="collapseTwo1" class="panel-collapse collapse ">
                                    <div class="panel-body" style="height: 105px; text-align: center; padding-top: 40px;">To work without personal credit or expectations</div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseOne1" style="font-size: 14px">
                                        <h3 class="panel-title">THOUGHT OF THE DAY <i class="fa fa-angle-right pull-right"></i></h3>
                                    </a>
                                </div>
                                <div id="collapseOne1" class="panel-collapse collapse">
                                    <div class="panel-body" style="height: 105px; text-align: center; padding-top: 30px;">
                                        <div class="media accordion-inner">
                                             <div class="media-body">
                                            <p>Life can only be understood backwards;<br />
                                                but it must be lived forwards.</p>
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
                    <a href="https://www.onlinesbi.sbi/sbicollect/icollecthome.htm?corpID=922784" target="_blank">
                        <img src="images/donate1.png" id="imgdonate" class="img-responsive" alt="" /></a>
                </div>
               <%-- <div class="pull-right">
                    <div class="col-sm-8 col-md-8 col-lg-10 pull-right" style="margin-top: 10px; width: 70.3333%;">
                        <a href="Donation">
                            <img src="images/activities_btn1.png" class="img-responsive" alt="" /></a>
                    </div>
                </div>--%>
            </div>
        </div>

    </section>
    <section class="service-item">
        <div class="container">
            <div class="row">


                <div class="col-sm-7">
                    <div class="row">
                         <div class="col-xs-6 col-sm-6 col-md-6">
                            <div class="recent-work-wrap">
                                <img class="img-responsive" src="Images/guidance_img3.png" alt="" style="height: 141px; width: 297px;" />

                                <div class="overlay">
                                    <div class="recent-work-inner">
                                        <h3><a href="CareerCounselling" style="font-size: 18px;">Click Here</a> </h3>
                                        <a class="preview" href="CareerCounselling"><i class="fa fa-eye"></i>View</a>
                                    </div>
                                </div>
                                <p class="text-center" style="font-size:18px">Career Guidance & Counselling</p>
                            </div>
                        </div>
                         <div class="col-xs-6 col-sm-6 col-md-6 ">
                            <div class="recent-work-wrap">
                                <img class="img-responsive" src="Images/enroll.png" alt="" style="height: 141px; width: 297px;" />
                                <div class="overlay">
                                    <div class="recent-work-inner">
                                        <h3><a href="Enroll" style="font-size: 18px;">View Details</a></h3>
                                        <a class="preview" href="Enroll"><i class="fa fa-eye"></i>View</a>
                                    </div>
                                </div>
                                <p class="text-center">Enroll The Students</p>
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <div class="recent-work-wrap">
                                <img src="Images/vacancy_img.png" class="img-responsive" alt="" style="height: 141px; width: 297px;" />
                                <div class="overlay">
                                    <div class="recent-work-inner">
                                        <h3><a href="https://employmentnews.gov.in/" style="font-size: 18px;">Employement News</a> </h3>
                                        <a class="preview" href="http://www.employmentnews.gov.in/"><i class="fa fa-eye"></i>View</a>
                                    </div>
                                </div>
                                <p class="text-center">Employement News</p>
                            </div>

                           
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6  ">
                            <div class="recent-work-wrap">
                                <img class="img-responsive" src="Images/atrocities_img2.png" alt="" style="height: 141px; width: 297px;" />
                                <div class="overlay">
                                    <div class="recent-work-inner">
                                        <h3><a href="AtrocitiesReporting.aspx" style="font-size: 18px;">Atrocities Reporting</a> </h3>
                                        <a class="preview" href="AtrocitiesReporting.aspx"><i class="fa fa-eye"></i>View</a>
                                    </div>
                                </div>

                                <p class="text-center">Atrocities Reporting</p>
                            </div>
                        </div>
                       
                       
                    </div>
                </div>
                
                <div class="col-sm-5 padding-top2 wow fadeInDown animated" style="visibility: visible; animation-name: fadeInDown; margin-top:-15px;">
                    <h2>DETAILS OF GOVT WELFARE SCHEMES</h2>
                    <div id="carousel-example-generic" class="carousel slide hidden-xs" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators indicator">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                        </ol>

                        <!-- Wrapper for slides -->

                        <div class="carousel-inner">

                            <div class="item active ">

                                <a href="../Education" target="new">
                                    <img class="img-responsive" src="images/education.jpg" alt="Education" style="height: 250px; width: 402px;" />
                                </a>
                                <br />
                                <h2>Education</h2>

                                <p><a href="../Education" target="new">Education</a></p>

                            </div>


                            <div class="item">
                                <a href="Insurance.aspx" target="new">
                                    <img class="img-responsive" src="images/insurance.jpg" alt="Insurance" style="height: 250px; width: 402px;" />
                                </a>
                                <br />
                                <h2>Insurance</h2>
                                <p><a href="Insurance.aspx" target="new">Insurance</a></p>
                            </div>


                            <div class="item">
                                <a href="Loans.aspx" target="new">
                                    <img class="img-responsive" src="images/loan.jpg" alt="Insurance" style="height: 250px; width: 402px;" />
                                </a>
                                <br />
                                <h2>Loans</h2>
                                <p><a href="Insurance.aspx" target="new">Loans</a></p>

                            </div>
                            <div class="item">
                                <a href="Girl%20Schemes" target="new">
                                    <img class="img-responsive" src="images/girl.jpg" alt="GirlsRelatedSchemes" style="height: 250px; width: 402px;" />
                                </a>
                                <br />
                                <h2>Girls Related Schemes</h2>
                                <p><a href="Girl%20Schemes" target="new">Girls Related Schemes</a></p>

                            </div>
                        </div>

                        <!-- Controls -->
                        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span>

                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
                    </div>
                </div>



                <!--/.row-->
            </div>
        </div>
        <!--/.container-->
        <section>
            <div class="container wow fadeInDown animated" style="visibility: visible; animation-name: fadeInDown;">
                <%--<button id="btnCertificateFeedback" type="button" class="CertificateFeedback">Feedback / Suggestions</button>--%>
                <div class="col-lg-6 col-sm-6 col-md-6">
                    <a href="#" data-toggle="modal" id="btnCertificateFeedback" type="button" class="CertificateFeedback" data-target="#myModal2"data-dismiss="modal">
                        <img src="images/suggestion_img.png" class="img-responsive" alt="" /></a>
                </div>
             <%-- <div class="col-sm-6 col-md-6 col-lg-6 col-xs-12 pull-right">
                    <div class="view" style="margin: 5px; padding: 9px;">
                        <h2 class="pull-left" style="font-size: 18px; padding: 14px 0px 0px 21px;"><a href="Premable">View Preamable</a>
                            <br />
                            <a href="Objectives">View Objective</a>
                           
                        </h2>


                        <h3 class="text-right" style="font-size: 15px; padding: 8px;">
                            <a href="#" data-toggle="modal" data-target="#myModal">DOWNLOAD <i class="fa fa-download"></i></a></br>
                            <a href="#" data-toggle="modal" data-target="#Div1">DOWNLOAD <i class="fa fa-download"></i></a>
                            <
                            <asp:HyperLink ID="lnkdwnload" runat="server" Style="display: none;" NavigateUrl="~/APK/EktaNavnirmanTrust.apk">Download MyApp</asp:HyperLink>
                        </h3>

                    </div>
                </div>--%>
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
                            <div class="pull-right"><a href="#"><i class="fa fa-telegram"></i></a><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a></div>
                           <%-- <strong>Ekta Navnirman Trust,</strong><br />
                           25, Bhagwati Nagar II, Kartarpura,<br />
                            Jaipur,302006--%>
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

        <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times; </button>
                        <h4 class="modal-title" id="myModalLabel">Premable </h4>
                    </div>
                   

                    <div class="modal-body text-center"><a href="doc/ENT-PREAMBLE.edited.docx" class="btn btn-primary">English Version </a><a href="doc/Preamble-Hindi.docx" class="btn btn-primary">Hindi Version </a></div>
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
                    <a href="doc/Objective%20Doc1.docx">doc/Objective Doc1.docx</a>
                    
                    <div class="modal-body text-center"><a href="doc/Objective%20Doc1.docx" class="btn btn-primary">Download English Version </a></div>
                </div>

                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->

        </div>

        <%--<!-- Modal-->
        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" runat="server" class="close" data-dismiss="modal">&times;</button>
                     
                         
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

        </div>--%>
         <div id="feedbackCertificate" class="modal ">
              <div class="modal-dialog" role="document">
        <!-- Modal content -->
        <div class="modal-content">

            <span class="closepopup">&times;</span>
            <div class="row" style="margin-left: 0">
                <div class="col-12 Header_popup">
                    <div class="modal-header " style="padding:0px">
                        <h5 class="modal-title" style="background-color: #fff; text-align: initial;color: #333;padding:0px;">Feedback/Suggestions Form</h5>
                    </div>
                </div>

                <div class="col-12">
                    <div class="form-group">
                        <label>Name</label>
                        <asp:TextBox ID="txtName" ClientIDMode="Static" name="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredtxtName" ControlToValidate="txtName"
                            runat="server" ClientIDMode="Static" ErrorMessage="Please enter the name." ValidationGroup="feedback" ForeColor="Red"></asp:RequiredFieldValidator>                        
                    </div>
                </div>

                <div class="col-12">
                    <div class="form-group">
                        <label>Mobile no.</label>
                        <asp:TextBox ID="txtMobile" ClientIDMode="Static" name="txtMobile" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredtxtMobile" ControlToValidate="txtMobile"
                            runat="server" ClientIDMode="Static" ErrorMessage="Please enter the mobile number." ValidationGroup="feedback" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ClientIDMode="Static" ID="RegulartxtMobile"                             
                             ControlToValidate="txtMobile" runat="server" ValidationExpression="^([0-9]{10})$"
                            ErrorMessage="Please enter valid mobile number." ValidationGroup="feedback"  ForeColor="Red" style="position: absolute; left: 20px;"></asp:RegularExpressionValidator>
                    </div>
                </div>

                <div class="col-12">
                    <div class="form-group">
                        <label>Comments</label>
                        <asp:TextBox ID="txtComment" ClientIDMode="Static" name="txtComment" runat="server" Rows="4" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredtxtComment" ControlToValidate="txtComment"
                            runat="server" ClientIDMode="Static" ErrorMessage="Please enter the comment." ValidationGroup="feedback" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="col-12">
                    <div class="form-group">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success" Style="float: right" ValidationGroup="feedback" Text="Submit" />
                    </div>
                </div>
            </div>
        </div>
                  </div>
    </div>


    </section>

      <script>       
          var modal = document.getElementById("feedbackCertificate");
          var btn = document.getElementById("btnCertificateFeedback");
          var span = document.getElementsByClassName("closepopup")[0];

          btn.onclick = function () {
              modal.style.display = "block";
          }

          // When the user clicks on <span> (x), close the modal
          span.onclick = function () {

              document.getElementById("RequiredtxtName").style.visibility = "hidden";
              document.getElementById("RequiredtxtMobile").style.visibility = "hidden";
              document.getElementById("RequiredtxtComment").style.visibility = "hidden";
              document.getElementById("RegulartxtMobile").style.visibility = "hidden";

              document.getElementById("txtName").value = ""
              document.getElementById("txtMobile").value = ""
              document.getElementById("txtComment").value = ""

              modal.style.display = "none";
          }

          // When the user clicks anywhere outside of the modal, close it
          window.onclick = function (event) {

              if (event.target == modal) {

                  document.getElementById("RequiredtxtName").style.visibility = "hidden";
                  document.getElementById("RequiredtxtMobile").style.visibility = "hidden";
                  document.getElementById("RequiredtxtComment").style.visibility = "hidden";
                  document.getElementById("RegulartxtMobile").style.visibility = "hidden";

                  document.getElementById("txtName").value = ""
                  document.getElementById("txtMobile").value = ""
                  document.getElementById("txtComment").value = ""

                  modal.style.display = "none";
              }
          }


          // Attach the event listener to the window's resize event
          window.addEventListener('resize', checkScreenWidth);


          // Event listener for checking screen width
          function checkScreenWidth() {
              if (window.innerWidth < 1232) {
                  $("#removeHeight").removeAttr("style");

              }
             
              else if (window.innerWidth > 1232) {
                  $("#removeHeight").css("height", "176");

              }
          }

          $(document).ready(function () {
              
            $("#removeHeight").css("height", "176");
              
          });
      </script>  
   
     
 
    <%--<script>
       
        $(function () {
    var overlay = $('<div id="overlay"></div>');
    overlay.show();
    overlay.appendTo(document.body);
    $('.popup').show();
      $('.close').click(function(){
    $('.popup').hide();
    overlay.appendTo(document.body).remove();
    return false;
               });
          


 

$('.x').click(function(){
$('.popup').hide();
overlay.appendTo(document.body).remove();
return false;
});
        });


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
    </script>--%>
  



</asp:Content>
