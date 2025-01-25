<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="EventRegistrationDetails.aspx.vb" Inherits="EktaTrust.EventRegistrationDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <style>
        .clsBackImage {
            padding:10px;
            height: auto;
            background: linear-gradient(rgba(196, 102, 0, 0.2), rgba(155, 89, 182, 0.2)), url('test.jpg') round;
        }
        #textLine p {
            text-align:justify;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row clsBackImage wow fadeInDown animated">
       
        <div class="col-lg-8 col-sm-offset-2" style="background-color:white;opacity:0.85">
            
           <center>
            <h2  style="margin-left: 80px;"> Run for Equality - 2018
                <span class="pull-right" style="color:red;font-size: 11px;"><b>Venue -</b> Ambedkar Circle, Jaipur*</span>
            </h2>
            
          </center>

            <div class="row">

                
                <div class="col-lg-7" id="textLine">

           <p style="font-size:16px;">This social run is being organized to give a message for casteless society, fraternity among human beings and to come together for social harmony and brotherhood in the society to build a better and discrimination free India.</p>
                    <br />    
                    <p><b> Date – 14.04.2018</b></p><br />
                        <p><b>Start Point – </b>Ambedkar Circle, Jaipur near Vidhansabha</p>
                        <p><b>Finish Point – </b>Ambedkar Circle, Jaipur near Vidhansabha</p><br />
                        <%--<p><b>Tentative Route</b> -  Ambedkar Circle to Rambag to Ajmeri Gate to police
                        Commissionerate to Ahimsa Circle to Maharani College to Tonk road to Rambagh to Ambedkar Circle</p>--%>
                        <p><b>Final Route – </b> Ambedkar Circle To Rambag To Gandhi Circle Turn To Gandhi Circle To Jhalana Road Beside 
                        Rajasthan University To Apex Circle To Jagatpura Flyover To Circle Number 7 And Back From The Same Root.</p><br />
                        
                        <p><b>21.09 KM <%--Two Round of the above route with little diversion--%></b></p>
                    <p>Warm-Up: 4:15 AM to 4:30 AM Flag Off</p><br />
                        <p><b>5 KM and 10 KM</b></p>
                        <p> Warm-Up: 5:15 AM to 5:30 AM Flag Off</p>
                        <%--<p>Warm-up- 5:45 AM to 6 AM</p>--%>
                        <%--<p>6 AM        -10KM – One round of the above Round</p>
                        <p>6:10 AM    -5KM -  Back from SMS Bus Stand Tonk Road</p>--%>

                   

                </div>
                <div class="col-lg-5">
                    <img src="RunForEquality2018/4.png" style="height: 440px;width: 336px;" />
                </div>
            </div>

            <div class="row">
                
            <div class="col-lg-7">
                <br /><br />
                 
           <p style="margin-top: 150px;"> <b> For any other inconvenience also please call on 9001716311 or 9660037537</b></p>
                <%--<p style="color: red;font-size: 13px;"><b>
             Registration Closed, those who missed, It will open for one day on 5th April. Bib and Tshirt collection venue & timings will be communicated shortly... <br />Thanks. </b></p>--%>
           </div>
                
            <div class="col-lg-5">
                <center>
                <h2 style="margin-top: 0px;"> Last year path.</h2>
                    </center>
            <img src="EktaTrustImage/EktaTrust-ImageMapPath.jpeg" style="height:270px; width:336px" />
             
            </div>

            </div>

            <div class="row" style="text-align:center;margin-top: 1%;">
                <div class="col-lg-6">
                    <a href="../EventRegistsrationClosed.aspx">
                <input type="button" style="margin-bottom:15px;margin-left: 75%;font-size:larger; " id="EventRegistration" class="btn btn-success" value="Register Me" />
                   
                </a>
                    </div>
                <div class="col-lg-6">
                     <a href="RunForEquality" style="font-size: 150%;color:blue;text-decoration: underline;">Watch Last Year Video</a>
                </div>
            </div>

        </div>
        <div class="col-lg-2"></div>
    </div>
       
</asp:Content>
