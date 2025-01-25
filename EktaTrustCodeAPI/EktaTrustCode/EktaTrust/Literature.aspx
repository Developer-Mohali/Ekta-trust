<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="Literature.aspx.vb" Inherits="EktaTrust.Literature" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <style>
        /*li {
            display:block;
        }*/

 .listShow 
     {
       display:normal !important;
     }

 .content_text 
     {
       background: #F4EFEF;
       padding: 5px;
       border: 1px #CCC solid;
       color: #620062;
       font-weight: bold;
       font-size: 14px;
       width: 91%;
       margin-top: 3%;
       margin-bottom: 2%;
     }

 .imageSize
     {
       height:200px;
       width:175px;
     }

 .divMargin 
     {
       margin-left:18%;
     }
       
 .divtop 
     {
       margin-top:6%;
     }

 .col-lg-2 
     {
       width: 18.666667%;
     }
 .lnkbutton 
     {
       text-decoration:underline !important;
       color:blue !important;
       margin-left:33px !important;
       font-weight:normal !important;
     }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left: 5%;" class="widget-content popular-posts">

<div class="item-content wow fadeInDown">
    <div class="content_text">Books</div>  
     
    <div class="item-thumbnail col-lg-3">
        <div>
           <a href="../Books" target="_blank">
            <img alt="" border="0" class="imageSize" src="Images/dr._bhim_rao_ambedkar-hindi.jpg" />
           </a>
        </div>       
        <div class="item-title divtop">
           <a class="divMargin" style="text-decoration:underline;color:blue;margin-left:7px" target="_blank" href="../Books">Dr Ambedkar Books in Hindi</a>     
        </div>
    </div>

    <div class="item-thumbnail col-lg-3">
        <div>
           <a href="../Books1" target="_blank">
            <img alt="" border="0" class="imageSize" src="Images/Dr.Ambedkar.jpg" />
           </a>
        </div>       
        <div class="item-title divtop">   
           <a class="divMargin" style="text-decoration:underline;color:blue;margin-left:0px" target="_blank" href="../Books1">Dr Ambedkar Books in English</a>
        </div>
    </div>

    <div class="item-thumbnail col-lg-3">
        <div>  
           <a href="Kanshi%20Ram%20book/The%20Chamcha%20Age.pdf" target="_blank">
           <img alt="" border="0" class="imageSize" src="Images/Kansi.jpg" />
           </a>
        </div>       
        <div class="item-title divtop">       
           <asp:linkbutton id="LinkButtonDownloadPdf" class="lnkbutton" runat="server" text="The Chamcha Age" style="color:Navy;font-weight: bold;" onclick="LinkButtonDownloadPdf_Click" />
        </div>
    </div>
   
    <div class="item-thumbnail col-lg-3">
        <div>
           <a href="#" target="_blank">
           <img alt="" border="0" class="imageSize" src="Images/jyotibaPhule.jpg" />
           </a>
        </div>
        <div class="item-title divtop">
           <a class="divMargin" style="text-decoration:underline;color:blue" target="_blank" href="doc/ज्योतिबा%20फुले%20जीवनी.pdf" title="Jyotiba Phule Jivni">Download</a>
        </div>
    </div>

     <div class="item-thumbnail col-lg-3" style="margin-top:18px;">
         <div>
            <a href="#" target="_blank">
            <img alt="" border="0" class="imageSize" src="Images/Riddles.jpg" />
            </a>
         </div>
         <div class="item-title divtop">
            <a class="divMargin" style="text-decoration:underline;color:blue" target="_blank" href="doc/Riddles in Hinduism by BR Ambedkar.pdf" title="Riddles in Hinduism">Download</a>
        </div>
    </div>
    
     <div class="item-thumbnail col-lg-3" style="margin-top:18px;">
         <div>
            <a href="https://www.baiae.org/downloads-baiae.html" target="_blank">
            <img alt="" border="0" class="imageSize" src="Images/Literature1.jpg" />
            </a>
         </div>       
         <div class="item-title divtop">
            <a class="divMargin" style="text-decoration:underline;color:blue" target="_blank" href="https://www.baiae.org/downloads-baiae.html">Download</a>
         </div>
    </div>
  
     <div class="item-thumbnail col-lg-3" style="margin-top:18px;">
        <div>
           <a href="#" target="_blank">
           <img alt="" border="0" class="imageSize" src="Images/ambdbook.jpg"/>
           </a>
        </div>
        <div class="item-title divtop">
           <a  class="divMargin" style="text-decoration:underline;color:blue" target="_blank" title="Work of Dr.Ambedker" href="doc/Selected-Works-of-Dr-B-R-Ambedkar.pdf">   Download</a>
        </div>
    </div>

     <div class="item-thumbnail col-lg-3" style="margin-top:18px;">
        <div>
           <a href="#" target="_blank">
           <img alt="" border="0" class="imageSize" src="Images/runForEqualityPlan.png" />
           </a>
        </div>
        <div class="item-title divtop">
           <a class="divMargin" style="text-decoration:underline;color:blue;" target="_blank" title="Traning plan for Beginners" href="doc/8-week-beginners-guide_0.pdf">Download</a>
        </div>
    </div>

    <div class="item-thumbnail col-lg-3" style="margin-top:18px;">
        <div>
           <a href="#" target="_blank">
           <img alt="" border="0" class="imageSize" src="Images/bhim 2.jpg" />
           </a>
        </div>
        <div class="item-title divtop">
          <a class="divMargin" style="text-decoration:underline;color:blue" target="_blank" title="Baba Saheb Stories" href="doc/Baba%20Saheb%20-%20Album.pdf">Download</a>
        </div>
    </div>
</div>
<div style="clear: both;"></div>

<div class="item-content">
<div class="content_text wow fadeInDown">बाबासाहेब के अनमोल वचन।
 </div>
<%--<div class="item-snippet col-sm-3 wow fadeInDown">  <br />  &nbsp; अगर परिन्दों में भी जातियाँ होती,<br />
तो कईयों को दरख़्त नसीब नहीं होता। <br />
अगर दरख़्तों में भी जातियाँ होती,<br />
तो कईयों को भूतल नसीब ना होता। <br /><br /><br />

अगर मछलियों में भी जातियाँ होती,<br />
तो कईयों को पानी नसीब नहीं होता। <br />
मधुमक्खियों में भी गर जातियाँ होती,<br />
 तो कईयों को फूल नसीब नहीं होता। <br /><br /><br />

अगर फूलों में भी जातियाँ होती तो <br />
कईयों को भौंरां नसीब ना होता। <br />
अगर दरख्त भी जातियाँ देखते तो <br />
कई फलों को हाथ नसीब ना होता। <br /><br /><br />

अगर फूल भी जातियाँ देखते तो <br />
कईयों को हार नसीब ना होता। <br />
फ़सलें भी गर जातियाँ देखतीं तो <br />
कईयों को अनाज नसीब ना होता। <br /><br /><br />

मवेशी भी अगर जातियाँ देखते तो <br />
कईयों को दूध नसीब ना होता।<br />
सूरज भी अगर जातियाँ देखता तो <br />
कईयों को उजाला नसीब ना होता। <br /><br /><br />

बादल भी अगर जातियाँ देखते तो <br />
कईयों को पानी नसीब ना होता। <br />
सागर भी अगर जातियाँ देखते तो <br />
कईयों को मोती नसीब ना होता। <br /><br /><br />

जल भी अगर जातियाँ देखता तो <br />
कईयों को जीवन नसीब ना होता। <br />
हवा भी अगर जातियाँ देखती तो <br />
कईयों को साँस नसीब ना होता। <br /><br /><br />

जापान में भी यों जातियाँ होती तो <br />
उसे इतना विकास नसीब ना होता। <br />
भारत में अगर जातियाँ ना होती तो <br />
देश को पिछड़ापन नसीब ना होता। <br /><br /><br />

जातिभेद छोड़ो, इंसानियत जोड़ो। <br />

<b>✍टीकम बोहरा "अनजाना"</b> आर॰ए॰एस॰<br />
जयपुर राजस्थान <br />
</div>--%>
    <div class="item-snippet col-sm-5 wow fadeInDown">
        <br />
        <ul style="list-style-type:disc;">
        <li>आज भारतीय दो अलग-अलग विचारधाराओं द्वारा शासित हो रहे हैं। उनके राजनीतिक आदर्श जो संविधान के प्रस्तावना में इंगित हैं वो स्वतंत्रता, समानता, और भाई -चारे को स्थापित करते हैं और उनके धर्म में समाहित सामाजिक आदर्श इससे इनकार करते हैं।</li> 
        <li>इतिहास बताता है कि जहाँ नैतिकता और अर्थशाश्त्र के बीच संघर्ष होता है वहां जीत हमेशा अर्थशाश्त्र की होती है। निहित स्वार्थों को तब तक स्वेच्छा से नहीं छोड़ा गया है जब तक कि मजबूर करने के लिए पर्याप्त बल ना लगाया गया हो।</li>
        <li>उदासीनता लोगों को प्रभावित करने वाली सबसे खराब किस्म की बीमारी है।</li>
        <li>एक सफल क्रांति के लिए सिर्फ असंतोष का होना ही काफी नहीं है, बल्कि इसके लिए न्याय, राजनीतिक और सामाजिक अधिकारों में गहरी आस्था का होना भी बहुत आवश्यक है।</li>
        <li>एक सुरक्षित सेना एक सुरक्षित सीमा से बेहतर है।</li>
        <li>क़ानून और व्यवस्था राजनीति रूपी शरीर की दवा है और जब राजनीति रूपी शरीर बीमार पड़ जाएँ तो दवा अवश्य दी जानी चाहिए।</li>
        <li>जब तक आप सामाजिक स्वतंत्रता नहीं हांसिल कर लेते, क़ानून आपको जो भी स्वतंत्रता देता है वो आपके किसी काम की नहीं।</li>
        <li>जिस प्रकार हर एक व्यक्ति यह सिद्धांत दोहराता हैं कि एक देश दूसरे देश पर शासन नहीं कर सकता, उसी तरह उसे यह भी मानना होगा कि एक वर्ग दूसरे वर्ग पर शासन नहीं कर सकता।</li>
        <li>मनुष्य का जीवन महान होना चाहिए ना कि लंबा।</li>
        <li>मैं ऐसे धर्म को मानता हूँ जो स्वतंत्रता, समानता, और भाई-चारा सीखाये।</li>
        <li>यदि मुझे लगा कि संविधान का दुरुपयोग किया जा रहा है, तो मैं इसे सबसे पहले जलाऊंगा।</li>
        <li>यदि हम एक संयुक्त एकीकृत आधुनिक भारत चाहते हैं, तो सभी धर्मों के धर्मग्रंथों की संप्रभुता का अंत होना चाहिए।</li>
        <li>लोग और उनके धर्म, सामाजिक नैतिकता के आधार पर, सामाजिक मानकों द्वारा परखे जाने चाहिए। अगर धर्म को लोगों के भले के लिये आवश्यक वस्तु मान लिया जायेगा तो और किसी मानक का मतलब नहीं होगा।</li>
        <li>समुद्र में मिलकर अपनी पहचान खो देने वाली पानी की एक बूँद के विपरीत, इंसान जिस समाज में रहता है वहां अपनी पहचान नहीं खोता। इंसान का जीवन स्वतंत्र है वह सिर्फ समाज के विकास के लिए पैदा नहीं हुआ है, बल्कि स्वयं के विकास के लिए पैदा हुआ है।</li>
        <li>हम भारतीय हैं, पहले और अंत में</li>
        <li>हिंदू धर्म में विवेक, कारण, और स्वतंत्र सोच के विकास के लिए कोई गुंजाइश नहीं है।</li>
        <li>एक महान व्यक्ति एक प्रतिष्ठित व्यक्ति से अलग है क्योंकि वह समाज का सेवक बनने के लिए तैयार रहता है।</li>
        </ul>
        <br />
        <p style="font-size:14px; padding-left:4%"><b>-डॉ. भीम राव अम्बेडकर (बाबा साहेब)</b></p>
            
    </div>
    <div class="item-snippet col-sm-6 wow fadeInDown">
        <br />
        <ul>
            <li>Indians today are governed by two different ideologies. Their political ideal set in the preamble of the Constitution affirms a life of liberty, equality and fraternity. Their social ideal embodied in their religion denies them.</li>
            <li>History shows that where ethics and economics come in conflict, victory is always with economics. Vested interests have never been known to have willingly divested themselves unless there was sufficient force to compel them.</li>
            <li>Indifferentism is the worst kind of disease that can affect people.</li>
            <li>For a successful revolution it is not enough that there is discontent. What is required is a profound and thorough conviction of the justice, necessity and importance of political and social rights.</li>
            <li>A safe army is better than a safe border.</li>
            <li>Law and order are the medicine of the body politic and when the body politic gets sick, medicine must be administered.</li>
            <li>So long as you do not achieve social liberty, whatever freedom is provided by the law is of no avail to you.</li>
            <li>Every man who repeats the dogma of Mill that one country is no fit to rule another country must admit that one class is not fit to rule another class.</li>
            <li>Life should be great rather than long.</li>
            <li>I like the religion that teaches liberty, equality and fraternity.</li>
            <li>If I find the constitution being misused, I shall be the first to burn it.</li>
            <li>The sovereignty of scriptures of all religions must come to an end if we want to have a united integrated modern India.</li>
            <li>People and their religion must be judged by social standards based on social ethics. No other standard would have any meaning if religion is held to be necessary good for the well-being of the people.</li>
            <li>Unlike a drop of water which loses its identity when it joins the ocean, man does not lose his being in the society in which he lives. Man’s life is independent. He is born not for the development of the society alone, but for the development of his self.</li>
            <li>We are Indians, firstly and lastly.</li>
            <li>In Hinduism, conscience, reason and independent thinking have no scope for development.</li>
            <li>A great man is different from an eminent one in In that he is ready to be the servant of the society.</li>
        </ul>
        <br /><br />
        <p style="font-size:14px; padding-left:4%"><b>-Dr. Bhimrao Ambedkar(Baba saheb)</b></p>
    </div>
    <div class="col-sm-1"></div>
</div>
<div style="clear: both;"></div>

<div class="clear"></div>

<div class="clear"></div>
</div>
</asp:Content>
