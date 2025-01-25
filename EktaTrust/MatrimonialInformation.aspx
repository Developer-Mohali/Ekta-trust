<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="MatrimonialInformation.aspx.vb" Inherits="EktaTrust.MatrimonialInformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        .button1 {
            width: 150px;
            color: #fff;
            background-color: #5cb85c !important;
            border-color: #4cae4c !important;
            font-weight: bold;
            color: white;
            /* border: 0 none; */
            border-radius: 6px;
            cursor: pointer;
            padding: 14px 6px;
            margin-bottom:15px;
            font-size:14px;
        }
        .clsBackImage {
            height: 790px;
            background: linear-gradient(rgba(196, 102, 0, 0.2), rgba(155, 89, 182, 0.2)), url('UploadFile/ektametrimonial.jpg');
        }
        .divBackGround {
            background-color:white;
             opacity: 0.85;
        }
        h4 {
            color:mediumblue;
        }

        h2 {
            color:mediumblue;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="clsBackImage wow fadeInDown animated">
            <div class="col-sm-2">
            </div>
            <div class="col-sm-8 divBackGround">

                    <div class="col-sm-12" style="text-align:center">
                       
                    <%--<h2 style="font-size:xx-large"><u>सविता-भीम विवाह परिचय सम्मेलन-2018</u></h2>--%>
                        <br />

                        <h4 style="color:dodgerblue">Parameters to Find Your Suitable Life Partner.</h4>
                        <div class="col-lg-12">
                            <div class="col-lg-6">
                        <h3 style="color:deepskyblue;margin-left: 1%;text-align: justify;"><i style="float: left;">" Match Your temper, not your gotras;<br />
                        
                        Check Your blood groups, not your castes;<br />
                        
                       Match Your Education, not your wealth…"</i></h3>
                       </div>
                            <div class="col-lg-6">
                         <h3 style="color:deepskyblue;margin-left: 24%;text-align: justify;"><i>"अपने स्वभाव का मिलान करे, गोत्रो का नही |<br />
                        
                       अपने रक्त की जाँच करे, जातियो की नही |<br />
                        
                      अपनी शिक्षा का मिलाप करे, धन का नही |…"</i></h3>
                                </div>
                            </div>

                               <h3>"The relationship between husband and wife should be one of closest friends."<br />

                    "पति- पत्नी  के  बीच  का  सम्बन्ध   घनिष्ट  मित्रों  के  सम्बन्ध   के  समान  होना  चाहिए."</h3>

                    <h4>DR. B. R. Ambedkar डॉ. बी. आर.  अम्बेडकर</h4>

                    <h3>"I measure the progress of a community by the degree of progress which women have achieved."<br /> 

                    "मैं  किसी  समुदाय  की  प्रगति  महिलाओं  ने  जो  प्रगति  हांसिल  की  है  उससे  मापता  हूँ."</h3>

                    <h4>DR. B. R. Ambedkar डॉ. बी. आर.  अम्बेडकर </h4>

                       <%-- <h3 style="text-align: justify;">15 एप्रिल को जात-पात की बुराई को मिटाने, सामाजिक सौहार्द को बढ़ाने, समाज मे एकता स्थापित करने, जातिमुक्त भारत बनाने मे अविवाहित युवा वर्ग बाबासाहेब की शादी की वर्षगांठ पर एकत्रित होकर उनके मिशन "जात पात का विनाश" को सार्थक बनाने मे एकता नवनिर्माण ट्रस्ट के तत्वाधान मे जयपुर मे सविता-भीम विवाह परिचय सम्मेलन-2018 मे सम्मिलित होंगे|| इस अवसरपर सामाजिक कल्याण विभाग राजस्थान सरकार द्वारा अंतरजातीय विवाह के लिए दी जाने वाली आर्थिक सहायता (2.5 लाख) की जानकारी भी अधिकारियो द्वारा प्रेज़ेंटेशन के माध्यम से दी जाएगी| </h3>
                          <h3 style="text-align: justify;">  इस अवसर पर वैज्ञानिक एवं मनुष्य जाति का विज्ञान(Anthropology) के जानकारो के द्वारा अंतरजातीए विवाह से आगामी पीढ़ी को शारीरिक रूप से होने वाले फायदे के बारे मे भी बताया जाएगा| गौरतलब है की 15 एप्रिल 1948 मे बाबासाहेब ने अंतरजातीय विवाह किया था| एकता नवनिर्माण ट्रस्ट हर वर्ष 15 एप्रिल को बाबा साहेब की शादी की वर्षगांठ पर सविता-भीम विवाह परिचय सम्मेलन का आयोजन करेगा|
                         

                       </h3>--%>

                        <h3 style="float:right;"> एकता टीम|<br />जाति तोडो, भारत जोड़ो|</h3>
                       <%--   <h3 style="float:right;">जाति तोडो, भारत जोड़ो|</h3>--%>
                     </div>
                <br /><br />
                <div class="col-sm-12">
            
                    <div class="form-group">
                        
                        <p style="margin-left:75px;"><br />
                            
                            <input type="checkbox" id="TermCondition" name="TermCondition" style="width:25px !important;" class="styled" />
                            
                         Terms & Conditions</p>
                        <ul class="list-group" style="margin-left:100px">    
                            <li>I agree for dowry free marriage.</li>

                             <li>I agree for actual verification of bio data at my personal level.</li>

                             <li>Ekta Navnirman Trust is just facilitating me in choosing my life partner, the Trust shall not be responsible for anything.</li>
                            </ul>
                    </div>

                </div>
                  
                <div class="col-sm-12" style="text-align:center">
                <div class="col-sm-3"></div>
                    <div class="col-sm-3">
                        <input type="button" name="next" id="NextSubmit" class="button1" value="I Accept" />
                    </div>
                    <div class="col-sm-3">
                        <input type="button" name="next" id="DisAgree" class="button1" value="Don't Accept" />  
                    </div>
                    <div class="col-sm-3"></div>
                    
                      
                </div>
                </div>
                    <!----fields for email id--->
                <div class="col-sm-2">
            </div>
        </div>

    <script>

        $("#NextSubmit").click(function () {

            if ($('#TermCondition').is(':checked')) {

                window.location.href = "/MatrimonialRegistration.aspx"
                
            }
            else {

                alert("Please Check Terms & Conditions!");

            }

        });

        $("#DisAgree").click(function () {

            window.location.href = "Home.aspx"

        });

    </script>

</asp:Content>
