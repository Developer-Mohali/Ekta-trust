<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="EventPrize.aspx.vb" Inherits="EktaTrust.EventPrize" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<style>
    @media only screen and (max-width : 430px) {
        h2.fadeInDown {
            text-align: center;
        }
        #EventRegistration{
            float:unset !important;
        }
    }
</style>





    <div class="clsBackImage wow fadeInDown animated about-us">
        <div class="col-sm-12">
            <div style="margin: 6px auto; padding-left: 15px; padding-right: 15px;">
                <h2 class="wow fadeInDown" style="display: flow-root;">
                    <div class="col-sm-4">
                         <button onclick="termsAndCondition(event)" style="float:left" id="EventRegistration" class="btn btn-danger">Registration Closed</button>
                    </div>
                     <div class="col-sm-4">
                            <center>
                                Run For Equality 7-Cyberthon                    
                                    <p style="font-size: small; font-style: oblique; text-transform: none;">A Step towards a cyber safe world</p>
                            </center>
                     </div>
                     <div class="col-sm-4"></div>
                </h2>
            </div>
            <%--<div class="col-sm-3">
               <h2 style="margin-left: 31px;"></h2>
                 </div>--%>
            <%--   <div class="col-sm-6">
             <center><h2>Run For Equality 2025</h2></center></div>--%>
        </div>

        <div class="col-sm-12">

            <div class="col-sm-3">

                <table class="table table-striped" style="box-shadow: 0px 1px 10px 2px lightgrey; width: 100%;">
                    <tr>
                        <td colspan="2">
                            <h4>7th Run for Equality-2026 Details</h4>

                        </td>
                    </tr>
                    <tr style="box-shadow: 0px 1px 10px 2px lightgrey;">
                        <td>
                            <a href="#"><i class="fa fa-telegram"></i></a>
                            &nbsp; &nbsp;
                        <a href="#"><i class="fa fa-facebook"></i></a>
                            &nbsp; &nbsp;
                      <a href="#"><i class="fa fa-twitter"></i></a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Event Date-</b> 14.04.2026<br />
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <b>Place-</b>  Albert Hall, JLN Marg, Jaipur (Rajasthan)<br />
                            <br />

                            <div class="hidden">
                                <b>Routes-</b><br />
                                <b>5KM-</b> Gandhi Circle -Jhalana Road- back to Gandhi Circle.<br />
                                <br />
                                <b>10KM-</b> Gandhi Circle-Jhalana Road-Turn from Forest View Apartment Traffic light before Jagatpura Pulia- back to Gandhi Circle.
                                <br />
                                <br />
                                <b>21.09KM-</b> Gandhi Circle-Jhalana Road-Forest View Apartment Traffic light- Jagatpura Pulia- Mahal Road- Turn from AkshayPatra Chaurha - back to Gandhi Circle .<br />
                                <br />
                            </div>


                            <b>Reporting Time-</b>14.04.2026<br />
                            <br />
                            <b>Time-</b>&nbsp;&nbsp;21.09 KM &nbsp;- 4:15 AM
                            <br />
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10 KM&nbsp;&nbsp;- 5:15 AM<br />

                            &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5 KM&nbsp;&nbsp;- 5:30 AM 
                            <br />
                            <br />
                            <b>Ceremony-</b> 7:00AM onwards<br />
                            <br />



                            <b>Registration Fee-</b>
                            <br />
                            <%-- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Fix Rs 500 in all categories(5k, 10k, 21.09k)<br /><br />--%>
                             &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Rs 1100 - 21KM<br />
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Rs 1100 - 10KM<br />
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Rs 500 - 5KM<br /><br />
                            <br />

                            <b>On Spot registration in BIB EXPO</b><br />
                            &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rs 1500 in all categories(5k, 10k, 21.09k)
                            <br />

                            <br />
                            <b>Beginner's guide</b><br />
                            &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                            <a href="Gallery_2025/SOP_for_RFE.pdf" target="_blank" style="background-color: transparent; border: none; color: blue; text-decoration: underline;">Suggestions are invited for Schedule of Practice for RFE</a>
                            <br />
                        </td>
                    </tr>
                    <tr class="">
                        <td colspan="2">

                            <%--<b> BIB EXPO Date </b> - 13.04.2025 <br />
                         
                           <b>  BIB EXPO Time </b>- 09AM To 6PM  <br />
                           <b> BIB EXPO Place </b>- Institute of Local self-Government, Tonk Road, Jaipur <br />--%>

                            <b>BIB Expo will be held at the Institute of Local self-Government, Tonk Road, Jaipur </br> on 13th April from 10AM to 7PM.</b>
                            <br />
                            <b>BIB Expo Location : </b><a href="https://share.google/uDKLU8Psb4WBZZIME" target="_blank" style="text-decoration: underline; color: blue">https://share.google/uDKLU8Psb4WBZZIME </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>

                                <%--Bib-Expo for run for equality will be organised on 13 April at Conference Hall,Rajasthan Swayat Shasan Mahavidyalaya, Tonk Road (Near Laxmi Mandir)Jaipur for collection of Tshirts, bib etc
       <br/>
               <br/>Time-10AM to 7PM. 
        <br/><br/> Map: <a href="http://shorturl.at/svDK4" target="_blank"> http://shorturl.at/svDK4 </a> 
        <br/>
              <br/>--%>
                                <b>Ekta Team</b>
                            </p>

                        </td>
                    </tr>

                </table>

                   <table class="table table-striped" style="box-shadow: 0px 1px 10px 2px lightgrey;">
       <tr>
           <td colspan="2">
               <h4>Prize money for winners</h4>
           </td>
       </tr>
       <tr>
           <td colspan="2">
               <h6>21KM (First Three Runners)</h6>
           </td>
       </tr>
       <tr>
           <td>First</td>
    <%--       <td>Rs. 11,000</td>--%>
           <td>Rs. 9,100</td>
       </tr>
       <tr>
           <td>Second</td>
<%--           <td>Rs. 5,100</td>--%>
           <td>Rs. 7,100</td>
       </tr>
       <tr>
           <td>Third</td>
           <%--<td>Rs. 3,100</td>--%>
           <td>Rs. 5,100</td>
       </tr>

       <tr>
           <td colspan="2">
               <h6>10KM (First Three Runners)</h6>
           </td>
       </tr>
       <tr>
           <td>First</td>
           <td>Rs. 5,100</td>
       </tr>
       <tr>
           <td>Second</td>
           <td>Rs. 3,100</td>
       </tr>
       <tr>
           <td>Third</td>
           <td>Rs. 2,100</td>
       </tr>

       <tr>
           <td colspan="2">
               <h6>5KM (First Three Runners)</h6>
           </td>
       </tr>
       <tr>
           <td>First</td>
           <td>Rs. 3,100</td>
       </tr>
       <tr>
           <td>Second</td>
           <td>Rs. 2,100</td>
       </tr>
       <tr>
           <td>Third</td>
           <td>Rs. 1,100</td>
       </tr>

   </table>
            </div>



            <div class="col-sm-6">

                <%--   <img src="Gallery_2025/Route-Map-clear-2026.png"style="box-shadow: 0px 1px 10px 2px lightgrey; width:100%;"/>--%>
                <%--<img src="Images/ekta-combine-2025.jpg" style="box-shadow: 0px 1px 10px 2px lightgrey; width:100%;"  />--%>
                <%--<img src="Images/ekta-combine.jpg" style="box-shadow: 0px 1px 10px 2px lightgrey; width:100%;"  />--%>

                <%--<img src="Images/Marathon_2023.jpeg" style="box-shadow: 0px 1px 10px 2px lightgrey; width:100%;margin-right:11px"  />--%>




                  <img src="images/map2026.jpeg" style="box-shadow: 0px 1px 10px 2px lightgrey; width:100%;"  />



               
            </div>

            <div class="col-sm-3">


                <table class="table table-striped" style="box-shadow: 0px 1px 10px 2px lightgrey;">
                    <tr>
                        <td colspan="2">
                            <h4>
                                <center>Terms and Conditions</center>
                            </h4>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>I agree that the fee paid is non-refundable and event category[5K, 10K, 21.09K] once filled cannot be modified.</p>
                            <p>I confirm that I am above 18 years old and I am physically fit to participate in this event.</p>
                            <p>I am aware that long distance running is extreme sport and can be injurious to body and health, hence I shall not hold the organisation or any of its member responsible for any injury/accident or any other mishap. Participation in this event is purely at my own risk.</p>
                            <p>I agree and understand that participating in this event includes contact with other participants, the effects of the weather including high heat or humidity, traffic and other condition of the road and all other risk associated with a public event.</p>
                            <p>I agree that the Ekta Navnirman Trust or its member cannot be held responsible in any way for loss or injury to myself, or any other party nor for any loss/damage of any of my valuables/belongings.</p>
                            <p>I agree to abide by the instructions provided by the organisers from time to time in the best interest of participants’ health and safety.</p>
                            <p>I agree to receive regular updates to the mobile number provided in the registration.</p>
                            <p>I agree that my name and media recording taken during your participation maybe used to publicise this event.</p>


                        </td>

                    </tr>


                </table>
            </div>

            <br />
            <%--<img src="RunForEquality2018/IAS2.jpg" class="img-responsive" style="box-shadow: 0px 1px 10px 2px lightgrey; width:100%;" />--%>
            <%--        <img src="RunForEquality2018/IAS.jpg"  class="img-responsive" style="box-shadow: 0px 1px 10px 2px lightgrey; width:100%;" />--%>
            <br />

            <%--   <img src="RunForEquality2018/Ekta%20Banner.jpeg" class="img-responsive" style="box-shadow: 0px 1px 10px 2px lightgrey;  width:100%;" />--%>
        </div>


        <%--<img src="RunForEquality2018/IAS2.jpg" class="img-responsive" style="box-shadow: 0px 1px 10px 2px lightgrey; width:100%;" />--%>
        <div class="row">


            <div class="col-sm-3"></div>

            <div class="col-sm-6">
            </div>
            <div class="col-sm-3"></div>

        </div>

    </div>


    <%--   <video src="RunForEqualityGallery/RunForEqualityFMAds.mpeg" height="0" width="0" id="FMaudio" autoplay="autoplay"></video>--%>

    <script type="text/javascript">
        $(document).ready(function () {
            setEqualHeightFromFirst();  // set col height auto set to equal...
            var vid = document.getElementById("FMaudio");
            vid.volume = 0.2;

        });
        function setEqualHeightFromFirst() {
            if ($(window).width() >= 992) {
                // Get height of first .col-sm-4
                var firstHeight = $('.col-sm-4 table').first().outerHeight();
                var headerHeight = $('.col-sm-4 table tr').first().outerHeight();

                // Set all .col-sm-4 to that height
                $('.col-sm-4 table').css('height', firstHeight + 'px');
                $('.col-sm-4 table tr:first-child').css('height', headerHeight + 'px');
            }
        }
    </script>
    <script>
        function isInstagramInAppBrowser() {
            return navigator.userAgent.includes("Instagram");
        }
        function termsAndCondition(event) {
            event.preventDefault(); // Prevent default behavior (if inside a form)
            event.stopPropagation(); // Stop further event bubbling
            //var isChecked = $("#cbTermsAndCondition").is(":checked");
            //if (isChecked) {

               window.location.href = '../EventRegistsrationClosed.aspx';
                //window.location.href = '../EventRegistration.aspx';
                //var win = window.open('../EventRegistsrationClosed.aspx');
                 //win.focus();
                //if (isInstagramInAppBrowser()) {
                //    window.location.href = 'https://www.onlinesbi.sbi/sbicollect/icollecthome.htm?corpID=922784';
                //} else {
                //    var win = window.open('https://www.onlinesbi.sbi/sbicollect/icollecthome.htm?corpID=922784', '_blank');
                //    win.focus();
                //}
            //}
            //else {
            //    alert('Please Check Terms And Conditions!');

            //}
        }
    </script>



    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
            }

            /* The Modal (background) */
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                padding-top: 100px; /* Location of the box */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }

            /* Modal Content */
            .modal-content {
                background-color: #fefefe;
                margin: auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
            }

            /* The Close Button */
            .close {
                color: #aaaaaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

                .close:hover,
                .close:focus {
                    color: #000;
                    text-decoration: none;
                    cursor: pointer;
                }
        </style>
    </head>




    <!-- Trigger/Open The Modal -->



    <!-- The Modal -->
    <div id="Modal" class="modal">

        <!-- Modal content -->
        <div class="modal-content">
            <span class="close">&times;</span>
            <h3 align="center">
                <p align="left" style="color: black">Terms and Conditions</p>
            </h3>
            <p>I agree that the fee paid is non-refundable and event category[5K, 10K, 21.09K] once filled cannot be modified.</p>
            <br />
            <p>I confirm that I am above 18 years old and I am physically fit to participate in this event.</p>
            <br />
            <p>I am aware that long distance running is extreme sport and can be injurious to body and health, hence I shall not hold the organisation or any of its member responsible for any injury/accident or any other mishap. Participation in this event is purely at my own risk.</p>
            <br />
            <p>I agree and understand that participating in this event includes contact with other participants, the effects of the weather including high heat or humidity, traffic and other condition of the road and all other risk associated with a public event.</p>
            <br />
            <p>I agree that the Ekta Navnirman Trust or its member cannot be held responsible in any way for loss or injury to myself, or any other party nor for any loss/damage of any of my valuables/belongings.</p>
            <br />
            <p>I agree to abide by the instructions provided by the organisers from time to time in the best interest of participants’ health and safety.</p>
            <br />
            <p>I agree to receive regular updates to the mobile number provided in the registration.</p>
            <br />
            <p>I agree that my name and media recording taken during your participation maybe used to publicise this event.</p>
            <br />
        </div>

    </div>

    <script>
        // Get the modal
        var modal = document.getElementById("Modal");

        // Get the button that opens the modal
        var btn = document.getElementById("btnTermsAndConditions");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks the button, open the modal 
        btn.onclick = function () {
            modal.style.display = "block";
        }

        // When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>


</asp:Content>
