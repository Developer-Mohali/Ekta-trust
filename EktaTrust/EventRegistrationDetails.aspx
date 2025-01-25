<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="EventRegistrationDetails.aspx.vb" Inherits="EktaTrust.EventRegistrationDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <style>
        .clsBackImage {
            padding: 10px;
            height: auto;
            background: linear-gradient(rgba(196, 102, 0, 0.2), rgba(155, 89, 182, 0.2)), url('test.jpg') round;
        }

        #textLine p {
            text-align: justify;
        }

        .modal-content iframe {
            margin: 0 auto;
            display: block;
        }

        .modalBackground {
            background-color: ghostwhite;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }

        .modalPopup {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 8px;
            padding-left: 10px;
            width: 480px;
            height: 410px;
        }
    </style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="script" runat="server"></asp:ScriptManager>
    <div class="row clsBackImage wow fadeInDown animated">

        <div class="col-lg-8 col-sm-offset-2" style="background-color: white; opacity: 0.85">

            <center>
            <h2  style="margin-left: 80px;"> Run for Equality - 2019
                <span class="pull-right" style="color:red;font-size: 11px;"><b>Venue -</b> Ambedkar Circle, Jaipur*</span>
            </h2>
            
          </center>

            <div class="row">


                <div class="col-lg-7" id="textLine">

                    <p style="font-size: 16px;">This social run is being organized to give a message for casteless society, fraternity among human beings and to come together for social harmony and brotherhood in the society to build a better and discrimination free India.</p>
                    <br />
                    रन फ़ॉर इक्वलिटी : एक संदेश<br />
                    <br />

                    रन फ़ॉर इक्वलिटी(समानता के लिए दौड़) एक जातिविहीन समाज की परिकल्पना का संदेश है
                जो भारत के नागरिक को यह समझाती है कि हम प्रथम एवम अंत मे एक भारतीय है एवम सभी नागरिक समान है, 
                एक दूसरे से प्रेम, भाईचारा एवम सद्भाव को बढ़ाने का संदेश है। एकता नवनिर्माण ट्रस्ट द्वारा यह एक मजबूत भारत का
                निर्माण एवम नवीन एकता स्थापित करने की दिशा में एक कदम है, जिसकी नीव जाति या धर्म पर न होकर सिर्फ भारतीय नागरिक(एक पहचान) पर आधारित हो।
            <br />
                    <br />
                    <p><b>Date – 14.04.2019</b>
                    </p>
                    
                    <br />
                    <p><b>Start Point – </b>Ambedkar Circle, Jaipur near Vidhansabha</p>
                    <p><b>Finish Point – </b>Ambedkar Circle, Jaipur near Vidhansabha</p>
                    <br />
                     
                    <%--<p><b>Tentative Route</b> -  Ambedkar Circle to Rambag to Ajmeri Gate to police
                        Commissionerate to Ahimsa Circle to Maharani College to Tonk road to Rambagh to Ambedkar Circle</p>--%>
                    <p>
                        <b>Final Route–</b> Ambedkar Circle -> Rambag -> Gandhi Circle Turn->
                         Gandhi Circle -> Jhalana Road Beside 
                        Rajasthan University -> Apex Circle -> Jagatpura Flyover -> Circle Number 7 And Back From The Same Root.
                    </p>
                    <br />

                    <p><b>21.09 KM <%--Two Round of the above route with little diversion--%></b></p>
                    <p>Warm-Up: 4:15 AM to 4:30 AM Flag Off</p>
                    <br />
                    <p><b>5 KM and 10 KM</b></p>
                    <p>Warm-Up: 5:15 AM to 5:30 AM Flag Off</p>
                    <br />
                  
                    
                    <%--<p>Warm-up- 5:45 AM to 6 AM</p>--%>
                    <%--<p>6 AM        -10KM – One round of the above Round</p>
                        <p>6:10 AM    -5KM -  Back from SMS Bus Stand Tonk Road</p>--%>
                </div>
                <div class="col-lg-5">
                    <%--<img src="RunForEquality2018/4.png" style="height: 440px;width: 336px;" />--%>
                    <img src="RunForEquality2018/nation.jpg" style="height: 440px; width: 336px;" /><br />
                    <br />



                    <%--                     <a href="RunForEquality" style="font-size: 150%;color:blue;text-decoration: underline;">Watch Last Year Video</a>--%>
                    <%--<asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
                    <asp:ModalPopupExtender ID="ModalPopupExtender1" BehaviorID="mpe" runat="server"
                        PopupControlID="pnlPopup" TargetControlID="lnkDummy" BackgroundCssClass="modalBackground" CancelControlID="btnClose">
                    </asp:ModalPopupExtender>
                    <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none">
                       
                        <div class="body">
                             <asp:Button ID="btnClose" runat="server" Text="x" style="text-align:right; margin-left:427px;" OnClientClick="return HideModalPopup() " /><br />
                            <iframe id="video" width="450" height="350"  autoplay="0" src="RunForEquality2018/Video_4.mp4 type="video/mp4" frameborder="0" allowfullscreen></iframe>
                            <br />
                            <br />
                           
                        </div>
                    </asp:Panel>--%>
                    <%--                    <img src="RunForEquality2018/image.jpg" style="height: 440px;width: 336px;" />--%>
                </div>
                <div class="col-lg-5">
                <p><b>BIB EXPO Details</b><br />
                    RUN FOR EQUALITY 2019<br />
                    Date: 13.04.2019<br />
                    Time: 10AM to 6PM<br />
                    Address- Youth Hostel <br />
                    Near Amar jawan Jyoti,Ambedkar Circle, opposite New Vidhan Sabha,Jaipur,Rajasthan 302005.<br />
                    For Queries contact at 09828150030 or 09414224488</p>

               </div>
            </div>
            

            <div class="row">

                <div class="col-lg-7">
                   <%-- <br />
                    <br />--%>
                    <p style="margin-top: 5px;"><b>For any other inconvenience also please call on 9001716311 or 9660037537</b></p>
                     
                          
                      

                    <%--<p style="color: red;font-size: 13px;"><b>
             Registration Closed, those who missed, It will open for one day on 5th April. Bib and Tshirt collection venue & timings will be communicated shortly... <br />Thanks. </b></p>--%>
                </div>

                <%-- <div class="col-lg-5">
                <center>
                <h2 style="margin-top: 0px;"> Last year path.</h2>
                    </center>
            <img src="EktaTrustImage/EktaTrust-ImageMapPath.jpeg" style="height:270px; width:336px" />
             
            </div>--%>
            </div>

            <div class="row" style="text-align: center; margin-top: 1%;">
                <div class="col-lg-6">
                    <a href="EventRegistsrationClosed.aspx">
                        <input type="button" style="margin-bottom: 15px; margin-left: 90%; font-size: larger;" id="EventRegistration" class="btn btn-success" value="Register Me" />

                    </a>

                </div>
<%--            <asp:LinkButton ID="btnshow" runat="server" Text="Watch Last Year Video" Style="font-size: 150%; color: blue; text-decoration: underline; margin-left:240px;" OnClientClick="return ShowModalPopup()"></asp:LinkButton>--%>

                <%--  <div class="col-lg-6">
                     <a href="RunForEquality" style="font-size: 150%;color:blue;text-decoration: underline;">Watch Last Year Video</a>
                </div>--%>
            </div>

        </div>
        <div class="col-lg-2"></div>
    </div>
    <%--<script type="text/javascript">
        function ShowModalPopup() {
            $get("video").src = "RunForEquality2018/Video_4.mp4?autoplay=0"
            $find("mpe").show();
            return false;
        }
        function HideModalPopup() {
            $get("video").src = "";
            $find("mpe").hide();
            return false;
        }
        function pageLoad() {
        var modalPopup = $find('mpe');
        modalPopup.add_shown(function () {
            modalPopup._backgroundElement.addEventListener("click", function () {
                modalPopup.hide();
            });
        });
    };
    </script>--%>

</asp:Content>
