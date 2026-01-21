<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EktaCreativeCompetition2025.aspx.vb" MasterPageFile="~/MasterPage/Admin.Master" Inherits="EktaTrust.EktaCreativeCompetition" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />

    <div class="container">
        <div class="jquery-script-ads" style="margin: 6px auto;">

            <p style="display: inline-block;" class="Comp">
                3rd Ekta Creative Competition 2025
            </p>
            <a href="../EktaCreativeCompetitionGallery.aspx" style="display: inline-block; margin-left: 200px;" class="Comp-list-group-item">Creative Competition Gallery</a>
            <%--  <a href="../RegistrationCreativeCompetition.aspx" style="display:inline-block; margin-left:10px;" class="Comp-list-group-item">Register</a>--%>
            <hr class="row marginImage" style="border: 1px dotted #b5580a;">
            <p></p>

        </div>
        <div class="wow fadeInDown">
            <h3><strong>एकता नवनिर्माण ट्रस्ट के तत्त्वाधान में निम्न प्रतियोगिताओं का आयोजन किया जा रहा है-</strong> </h3>
            <%-- <h4><strong>व्यस्क के लिए (आयु वर्ग - 16 वर्ष एव उससे ऊपर)-</strong> </h4>
     <ul>
        <li><strong>(1) निबंध - (कम से कम 500 शब्द )</strong></li>
        <li><strong>विषय -</strong></li>
        <li><strong>(A) भगवान बुद्ध द्वारा बताया गया ब्रह्मविहार एव मानवीय जीवन में इसकी उपयोगित</strong></li>
        <li><strong>अथवा</strong></li>
        <li><strong>(B) भगवान बुद्ध द्वारा बतायी हुई पारमिताए एव उनका महत्त्व।</strong></li>
        <li><strong>अथवा</strong></li>
        <li><strong>(C) ”में ऐसे धर्म को मानता हूँ जो स्वतंत्रता, समानता एव भाईचारा सिखाता है” बाबासाहेब के उक्त कथन को विस्तार पूर्वक समझाइये।</strong></li>
     </ul>
     <br />
     <ul>
         <li><strong>(2) पेंटिंग</strong></li>
         <li><strong>विषय -</strong></li>
         <li><strong>(A) डॉ बी आर अम्बेडकर द्वारा अपनी पत्नी एव अनुयायियो के साथ बुद्ध धर्म अपनाते हुए दृश्य की कोई पेंटिंग।</strong></li>
         <li><strong>अथवा</strong></li>
         <li><strong>(B) भगवान बुद्ध द्वारा ज्ञान प्राप्ति से पूर्व मार का सामना करते हुए दृश्य की पेंटिंग।</strong></li>
         <li><strong>अथवा</strong></li>
         <li><strong>(C) ध्यान के दौरान भगवान बुद्ध के शरीर का कंकाल जैसी स्थिति में परिवर्तन का दृश्य।</strong></li>
     </ul>
     <br />

          <h4><strong>बच्चो के लिए (आयु वर्ग - 5 वर्ष से 16 वर्ष से नीचे)</strong> </h4>
     <ul>
         <li><strong>(1) स्केच / ड्राइंग</strong></li>
         <li><strong>विषय -</strong></li>
         <li><strong>(A) साँची का स्तूप एव तोरण</strong></li>
         <li><strong>अथवा</strong></li>
         <li><strong>(B) महाबोधि मंदिर</strong></li>
         <li><strong>अथवा</strong></li>
         <li><strong>(C) ग्लोबल विपश्यना पगोडा</strong></li>
     </ul>
     <br />
     <ul>
        <li><strong>(2) निबंध (कम से कम 250 शब्दों में)</strong></li>
        <li><strong>विषय -</strong></li>
        <li><strong>(A) भगवान बुद्ध द्वारा दिए गए पंचशील पाली एव हिंदी भाषा में अर्थ सहित एव प्रत्येक शील का विस्तृत वर्णन और मानव जीवन में महत्त्व।</strong></li>
     </ul>
     <br />

          <h4><strong>बच्चो के लिए (आयु वर्ग - 2 वर्ष से 10 वर्ष)</strong> </h4>
     <ul>
        <li><strong>(1) फैंसी ड्रेस कम्पटीशन</strong></li>
        <li><strong>विषय -</strong></li>
        <li><strong>(A) भगवान बुद्ध</strong></li>
        <li><strong>अथवा</strong></li>
        <li><strong>(B) बाबासाहेब</strong></li>
        <li><strong>अथवा</strong></li>
        <li><strong>(C) सावित्री बाई फूले</strong></li>
     </ul>
     <br />

          <h4><strong>रील्स</strong> </h4>
      <ul>
         <li><strong>विषय -</strong></li>
         <li><strong>(A) बाबासाहेब</strong></li>
         <li><strong>अथवा</strong></li>
         <li><strong>(B) भगवान बुद्ध</strong></li>
         <li><strong>अथवा</strong></li>
         <li><strong>(C) सम्राट अशोक</strong></li>

      </ul>
      <br />
          <h3><strong>Cash Prize in each category -</strong> </h3>
     <ul>
        <li><strong>(1) Rs 5100</strong></li>
        <li><strong>(2) Rs 3100</strong></li>
        <li><strong>(3) Rs 2100</strong></li>
        <li><strong>(4) Rs 1100</strong></li>
        <li><strong>(5) Rs 501</strong></li>
       </ul>
      <br />  
          <h3><strong>Books for prize -</strong> </h3>
    <ul>
        <li><strong>(1) Dhamma Vandana by VRI</strong></li>
        <li><strong>(2) Dhammapada by VRI</strong></li>
        <li><strong>(3) Buddha Pooja Path - By Buddha Vachana Trust</strong></li>
        <li><strong>(4) Buddha and His Dhamma by Dr B R Ambedkar </strong></li>
        <li><strong>(5) Annihilation of Caste - By Dr B R Ambekdar</strong></li>
        </ul>
        <br />  
           <h3><strong>3rd Ekta Creative Competition (2025)-</strong> </h3>
    <ul>
        <li><strong>(1) Essay both adult and kids - Tanuja Ji</strong></li>
        <li><strong>(2) Book Review - Vidit Raj Bundesh ji</strong></li>
        <li><strong>(3) Reels - Tarachand Ji</strong></li>
        <li><strong>(4) Songs - Prof Priyanand Ji</strong></li>
        <li><strong>(5) Fancy Dress Kids- Gyatri Ji</strong></li>
        <li><strong>(6) Sketch & Drawing -</strong></li>
        <li><strong>(7) Poems - Narendra Ji</strong></li>
        <li><strong>(8) Speech -</strong></li>
        <li><strong>(9) Painting-</strong></li>
        </ul>
        <br /> 
          <h3><strong>Rules & Guidelines for Book Review -</strong> </h3>
          <h4><strong>(1) Participation/Entry:-</strong> </h4>
     <ul>
        <li><strong>(a) Entry Dates- 25 September 2025 to 10th October 2025.</strong></li>
        <li><strong>(b) Mode of Entry- WhatsApp (+91 78776 64078), Email (jaibheem.ektacompetition@gmail.com ), Speed post.</strong></li>
        <li><strong>(c) Provisional Result Announcement: 14 October 2025 (To commemorate English calendar date of embracing Buddhism by Babasaheb and his followers.</strong></li>
       </ul>
     <br />
          <h4><strong>(2) Eligibility:-</strong> </h4>
     <ul>
        <li><strong>(a) Participants should be of age 16 years and above.</strong></li>
        <li><strong>(b) The book must be read fully by the reviewer.</strong></li>
        <li><strong>(c) One person can send only one entry.</strong></li>
        <li><strong>(d) The review shall be the original work of participants, it should not be reviewedby any other person</strong></li>
        <li><strong>(e) Selected reviews will be presented by winners during the prize ceremony. The winners shall explain the book to other members for the benefit of all.</strong></li>
        <li><strong>(f) In the bottom of the review the participant shall certify that “the review is his/her original work and it is not copy pasted from the internet or AI like 
            ChatGPT etc and it is not a review by any other person.”</strong></li>
       </ul>
     <br />
          <h4><strong>(3) Book Selection:-</strong> </h4>
     <ul>
        <li><strong>Buddha and his Dhamma by Dr BR Ambedkar</strong></li>
       </ul>
     <br />
          <h4><strong>(4) Submission Guidelines:-</strong> </h4>
        <ul>
           <li><strong>(a) Language: English / Hindi.</strong></li>
           <li><strong>(b) Word Limit: 300 to 1000 words.</strong></li>
           <li><strong>(c) Format: Hand written review (Computerised and typed review will be rejected).</strong></li>
           <li><strong>(d) Include at the top of the document: Book Title, Author, Your Name, Age, Contact Info (address, email/phone etc).</strong></li>
           <li><strong>(e) Submission Method: WhatsApp (+91 78776 64078), Email (jaibheem.ektacompetition@gmail.com ), Speed post at address</strong></li>
          </ul>
     <br />
          <h4><strong>(5) Disqualification Rules:-</strong> </h4>
        <ul>
           <li><strong>(a) Any copy-paste work from the internet or AI like ChatGpt will be immediately disqualified.</strong></li>
           <li><strong>(b) More than one entry/review by one person will lead to disqualification of surplus (more than one) entries.</strong></li>
           <li><strong>(c) The book review shall be handwritten in English or Hindi. Computerised and typed review will be rejected.</strong></li>
           <li><strong>(d) The reviews Exceeding maximum word limit of 1000 will be rejected.</strong></li>
           <li><strong>(e) Review received Submission after the deadline of 10th October 2025 will be rejected.</strong></li>
           <li><strong>(f) Inappropriate or offensive content will be rejected.</strong></li>
          </ul>
     <br />
          <h4><strong>(6) Awards & Recognition Winners in each category will receive:-</strong> </h4>
        <ul>
           <li><strong>(a) Certificates.</strong></li>
           <li><strong>(b) Books.</strong></li>
           <li><strong>(c) Cash Prize: Cash prize will be given in the bank account of the winner. First PrizeRs 5100, Second Prize- Rs 3100, Third Prize- Rs 2100, 
               Fourth Prize- Rs 1100, Fifth Prize- Rs 501/-</strong></li>
          </ul>
     <br />
          <h4><strong>(7) Contact for Queries:-</strong> </h4>
        <ul>
           <li><strong>WhatsApp (+91 78776 64078), Email (jaibheem.ektacompetition@gmail.com )</strong></li>
          </ul>
     <br />
          <h4><strong>(8) Tips for Participants:-</strong> </h4>
        <ul>
           <li><strong>(a) Read the book fully before reviewing and writing the review.</strong></li>
           <li><strong>(b) Make it personal as to what you understood from reading the book— share what you felt or learned, do not copy past sentences or paragraphs from the book.</strong></li>
           <li><strong>(c) Be honest and original — don’t just summarize.</strong></li>
           <li><strong>(d) Use your own voice and style — judges appreciate authenticity.</strong></li>
           <li><strong>(e) Don't copy paste from the internet or ChatGPT etc. Such review will be rejected.</strong></li>
           <li><strong>(f) Don’t rely only on reviews by others—form your own opinion and give your own review..</strong></li>
          </ul>
      <br />     --%>
            <div class="container mt-4">

                <h3 class="mb-3"><strong>Competition Categories</strong></h3>

                <ul class="list-group mb-4">
                    <li class="list-group-item">
                        <h4 class="mb-1"><strong>Painting for Adults</strong></h4>
<%--                        <a href='<%= ResolveUrl("~/doc/CanvassPaintingCompetition2025.pdf") %>' target="_blank" class="btn btn-sm btn-primary">For more details, click here to download pdf file
                        </a>
                        <a href="../RegistrationCreativeCompetition.aspx?DDLId=1" style="display: inline-block; background-color: #007bff;" class="btn btn-sm btn-primary">Apply Now</a>--%>
                          <a href='<%= ResolveUrl("~/doc/Result-EKTA-CREATIVE-COMPETITION-2025.pdf") %>' target="_blank" class="btn btn-sm btn-primary">Result for Ekta Creative Competition 2025 has been declared. Please click here to download.
                        </a>
                        <%--<a href="../UploadCreativeCompetition.aspx" style="display: inline-block; background-color: #007bff;" class="btn btn-sm btn-primary">Upload pdf file, image or video</a>--%>
                        <%--<a href="#" id="btnApplyNow" style="display: inline-block; background-color: #007bff;" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#applyNowModal">Upload pdf file, image or video</a>--%>
                    </li>

                    <li class="list-group-item">
                        <h4 class="mb-1"><strong>Sketch Drawing for Children</strong></h4>
                      <%--  <a href='<%= ResolveUrl("~/doc/DrawingSketchCompetitionChildren2025.pdf") %>' target="_blank" class="btn btn-sm btn-primary">For more details, click here to download pdf file
                        </a>
                        <a href="../RegistrationCreativeCompetition.aspx?DDLId=2" style="display: inline-block; background-color: #007bff;" class="btn btn-sm btn-primary">Apply Now</a>
                        --%><%--<a href="../UploadCreativeCompetition.aspx" style="display: inline-block; background-color: #007bff;" class="btn btn-sm btn-primary">Upload pdf file, image or video</a>--%>
                         <a href='<%= ResolveUrl("~/doc/Result-EKTA-CREATIVE-COMPETITION-2025.pdf") %>' target="_blank" class="btn btn-sm btn-primary">Result for Ekta Creative Competition 2025 has been declared. Please click here to download.
                        </a>
                    </li>

                    <li class="list-group-item">
                        <h4 class="mb-1"><strong>Essay for Adults</strong></h4>
                      <%--  <a href='<%= ResolveUrl("~/doc/EssayCompetitionforAdults2025.pdf") %>' target="_blank" class="btn btn-sm btn-primary">For more details, click here to download pdf file
                        </a>
                        <a href="../RegistrationCreativeCompetition.aspx?DDLId=3" style="display: inline-block; background-color: #007bff;" class="btn btn-sm btn-primary">Apply Now</a>
                      --%>  <%--<a href="../UploadCreativeCompetition.aspx" style="display: inline-block; background-color: #007bff;" class="btn btn-sm btn-primary">Upload pdf file, image or video</a>--%>
                         <a href='<%= ResolveUrl("~/doc/Result-EKTA-CREATIVE-COMPETITION-2025.pdf") %>' target="_blank" class="btn btn-sm btn-primary">Result for Ekta Creative Competition 2025 has been declared. Please click here to download.
                        </a>
                    </li>

                    <li class="list-group-item">
                        <h4 class="mb-1"><strong>Essay for Children</strong></h4>
                      <%--  <a href='<%= ResolveUrl("~/doc/EssayCompetitionforChildren2025.pdf") %>' target="_blank" class="btn btn-sm btn-primary">For more details, click here to download pdf file
                        </a>
                        <a href="../RegistrationCreativeCompetition.aspx?DDLId=4" style="display: inline-block; background-color: #007bff;" class="btn btn-sm btn-primary">Apply Now</a>
                       --%> <%--<a href="../UploadCreativeCompetition.aspx" style="display: inline-block; background-color: #007bff;" class="btn btn-sm btn-primary">Upload pdf file, image or video</a>--%>
                         <a href='<%= ResolveUrl("~/doc/Result-EKTA-CREATIVE-COMPETITION-2025.pdf") %>' target="_blank" class="btn btn-sm btn-primary">Result for Ekta Creative Competition 2025 has been declared. Please click here to download.
                        </a>
                    </li>

                    <li class="list-group-item">
                        <h4 class="mb-1"><strong>Speech for Adults</strong></h4>
                       <%-- <a href='<%= ResolveUrl("~/doc/EktaSpeechcompetition.pdf") %>' target="_blank" class="btn btn-sm btn-primary">For more details, click here to download pdf file
                        </a>
                        <a href="../RegistrationCreativeCompetition.aspx?DDLId=5" style="display: inline-block; background-color: #007bff;" class="btn btn-sm btn-primary">Apply Now</a>
                        --%><%--<a href="../UploadCreativeCompetition.aspx" style="display: inline-block; background-color: #007bff;" class="btn btn-sm btn-primary">Upload pdf file, image or video</a>--%>
                         <a href='<%= ResolveUrl("~/doc/Result-EKTA-CREATIVE-COMPETITION-2025.pdf") %>' target="_blank" class="btn btn-sm btn-primary">Result for Ekta Creative Competition 2025 has been declared. Please click here to download.
                        </a>
                    </li>

                    <li class="list-group-item">
                        <h4 class="mb-1"><strong>Fancy Dress Competition for Kids</strong></h4>
                       <%-- <a href='<%= ResolveUrl("~/doc/फेंसीड्रेसकॉम्पिटीशन2025एकतानवनिर्माणट्रस्ट.pdf") %>' target="_blank" class="btn btn-sm btn-primary">For more details, click here to download pdf file
                        </a>
                        <a href="../RegistrationCreativeCompetition.aspx?DDLId=6" style="display: inline-block; background-color: #007bff;" class="btn btn-sm btn-primary">Apply Now</a>
                       --%> <%--<a href="../UploadCreativeCompetition.aspx" style="display: inline-block; background-color: #007bff;" class="btn btn-sm btn-primary">Upload pdf file, image or video</a>--%>
                         <a href='<%= ResolveUrl("~/doc/Result-EKTA-CREATIVE-COMPETITION-2025.pdf") %>' target="_blank" class="btn btn-sm btn-primary">Result for Ekta Creative Competition 2025 has been declared. Please click here to download.
                        </a>
                    </li>

                    <li class="list-group-item">
                        <h4 class="mb-1"><strong>Songs for Adults</strong></h4>
                       <%-- <a href='<%= ResolveUrl("~/doc/SongsCompetition2025.pdf") %>' target="_blank" class="btn btn-sm btn-primary">For more details, click here to download pdf file
                        </a>
                        <a href="../RegistrationCreativeCompetition.aspx?DDLId=7" style="display: inline-block; background-color: #007bff;" class="btn btn-sm btn-primary">Apply Now</a>
                       --%> <%--<a href="../UploadCreativeCompetition.aspx" style="display: inline-block; background-color: #007bff;" class="btn btn-sm btn-primary">Upload pdf file, image or video</a>--%>
                         <a href='<%= ResolveUrl("~/doc/Result-EKTA-CREATIVE-COMPETITION-2025.pdf") %>' target="_blank" class="btn btn-sm btn-primary">Result for Ekta Creative Competition 2025 has been declared. Please click here to download.
                        </a>
                    </li>

                    <li class="list-group-item">
                        <h4 class="mb-1"><strong>Reels for Adults</strong></h4>
                       <%-- <a href='<%= ResolveUrl("~/doc/EktaNavNirmanTrustReelCompetition.pdf") %>' target="_blank" class="btn btn-sm btn-primary">For more details, click here to download pdf file
                        </a>
                        <a href="../RegistrationCreativeCompetition.aspx?DDLId=8" style="display: inline-block; background-color: #007bff;" class="btn btn-sm btn-primary">Apply Now</a>
                       --%> <%--<a href="../UploadCreativeCompetition.aspx" style="display: inline-block; background-color: #007bff;" class="btn btn-sm btn-primary">Upload pdf file, image or video</a>--%>
                       <a href='<%= ResolveUrl("~/doc/Result-EKTA-CREATIVE-COMPETITION-2025.pdf") %>' target="_blank" class="btn btn-sm btn-primary">Result for Ekta Creative Competition 2025 has been declared. Please click here to download.
                        </a>
                    </li>

                    <li class="list-group-item">
                        <h4 class="mb-1"><strong>Book Review for Adults</strong></h4>
                       <%-- <a href='<%= ResolveUrl("~/doc/BookReviewCompetition2025.pdf") %>' target="_blank" class="btn btn-sm btn-primary">For more details, click here to download pdf file
                        </a>
                        <a href="../RegistrationCreativeCompetition.aspx?DDLId=9" style="display: inline-block; background-color: #007bff;" class="btn btn-sm btn-primary">Apply Now</a>
                       --%> <%--<a href="../UploadCreativeCompetition.aspx" style="display: inline-block; background-color: #007bff;" class="btn btn-sm btn-primary">Upload pdf file, image or video</a>--%>
                         <a href='<%= ResolveUrl("~/doc/Result-EKTA-CREATIVE-COMPETITION-2025.pdf") %>' target="_blank" class="btn btn-sm btn-primary">Result for Ekta Creative Competition 2025 has been declared. Please click here to download.
                        </a>
                    </li>
                </ul>

                <h3 class="mt-4"><strong>टीम एकता</strong></h3>
                <ul class="list-unstyled">
                    <li><strong>You can send your entries before:</strong> 20-11-2025</li>
                    <li><strong>For details related to Topics, results etc. Visit Ekta Navnirman Trust website :</strong> Visit <a href="http://www.ektatrust.org.in" target="_blank">www.ektatrust.org.in</a></li>
                    <li><strong>For queries :</strong> WhatsApp +91-7877664078, 9509969196</li>
                    <!-- Uncomment if you want to show address -->
                    <!-- <li><strong>Address:</strong> B-15, Pragati Path, Bajaj Nagar, Jaipur, Rajasthan-302015</li> -->
                </ul>

            </div>

        </div>
        <hr class="row marginImage" style="border: 1px dotted #b5580a;">
    </div>

    <!-- Bootstrap Modal -->
    <%--<div class="modal fade" id="applyNowModal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <h5 class="modal-title">Apply Now</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>

      <div class="modal-body">
        <!-- Mobile Number -->
        <div class="form-group">
          <label for="txtMobile">Mobile Number</label>
          <input type="text" id="txtMobile" class="form-control" placeholder="Enter your mobile number" />
      </div>

            <!-- Display User Details if exists -->
            <div id="userDetails" style="display:none;">
              <p><b>Name:</b> <span id="lblName"></span></p>
              <p><b>Email:</b> <span id="lblEmail"></span></p>
              <p><b>Mobile:</b> <span id="lblMobile"></span></p>
              <p><b>Contest:</b> <span id="lblContest"></span></p>
              <p><b>Address:</b> <span id="lblAddress"></span></p>
              <p><b>Create Date:</b> <span id="lblCreateDate"></span></p>
            </div>

        <!-- File Upload -->
        <div class="form-group">
          <label for="fileUpload">Upload File (PDF, Image, Video)</label>
          <input type="file" id="fileUpload" class="form-control-file" />
          <small class="form-text text-muted">
            Allowed: PDF, Images, Video (Max 1 GB for Video)
          </small>
        </div>
      </div>

      <div class="modal-footer">
        <%--<asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btnSubmit_Click" />--%>
    <%--<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>--%>

    <div class="modal fade" id="applyNowModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title">Apply Now</h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body">
                    <!-- Mobile Number -->
                    <div class="form-group">
                        <label for="txtMobile">Mobile Number</label>
                        <div class="input-group">
                            <input type="text" id="txtMobile" class="form-control" placeholder="Enter mobile number" />
                            <div class="input-group-append">
                                <button class="btn btn-primary" id="btnSearchMobile" type="button">Search</button>
                            </div>
                        </div>
                    </div>

                    <!-- User Details -->
                    <div id="userDetails" style="display: none;">
                        <div class="form-group">
                            <label>Name</label><input type="text" id="lblName" class="form-control" readonly />
                        </div>
                        <div class="form-group">
                            <label>Email</label><input type="text" id="lblEmail" class="form-control" readonly />
                        </div>
                        <div class="form-group">
                            <label>Mobile</label><input type="text" id="lblMobile" class="form-control" readonly />
                        </div>
                        <div class="form-group">
                            <label>Contest</label><input type="text" id="lblContest" class="form-control" readonly />
                        </div>
                        <div class="form-group">
                            <label>Address</label><input type="text" id="lblAddress" class="form-control" readonly />
                        </div>
                        <input type="hidden" id="hdnID" />
                        <input type="hidden" id="hdnCreateDate" />
                    </div>

                    <!-- File Upload -->
                    <div class="form-group mt-3">
                        <label for="fileUpload">Upload File (PDF, Image, Video)</label>
                        <input type="file" id="fileUpload" class="form-control-file" />
                        <small class="form-text text-muted">Allowed: PDF, Images, Video (Max 1 GB)</small>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="btnSubmit">Submit</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>

            </div>
        </div>
    </div>


    <script type="text/javascript">
        $(document).ready(function () {
            // When user leaves the mobile field, check mobile in DB
            $("#btnSearchMobile").click(function () {
                var mobile = $("#txtMobile").val().trim();

                if (!mobile) {
                    alert("Please enter a mobile number");
                    return;
                }
                console.log(JSON.stringify({ mobileNumber: $("#txtMobile").val().trim() }));
                $.ajax({
                    type: "POST",
                    url: "EktaCreativeCompetition2025.aspx/CheckMobile",
                    data: JSON.stringify({ mobileNumber: mobile }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var data = response.d;

                        if (data.Exists) {
                            $("#userDetails").show();
                            $("#lblName").text(data.Name);
                            $("#lblEmail").text(data.EmailID);
                            $("#lblMobile").text(data.MobileNumber);
                            $("#lblContest").text(data.Contest);
                            $("#lblAddress").text(data.Address);
                            $("#hdnID").val(data.Id);
                            $("#hdnCreateDate").val(data.CreateDate);
                        } else {
                            $("#userDetails").hide();
                            alert("No user found with this mobile number.");
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error("AJAX Error:", error);
                    }
                });
            });


            // File size validation for video
            $("#fileUpload").on("change", function () {
                var file = this.files[0];
                if (file) {
                    var fileType = file.type;
                    var fileSize = file.size;

                    // 1 GB = 1073741824 bytes
                    if (fileType.startsWith("video/") && fileSize > 1073741824) {
                        alert("Video file size cannot exceed 1 GB.");
                        $(this).val(""); // reset file input
                    }
                }
            });

        });
    </script>


    <style>
        .Comp {
            margin-left: 22px;
            padding-top: 1px;
            font-size: 27px;
            padding-bottom: -1px;
            margin-left: -5px;
            margin-top: 17px;
            color: #4e4e4e;
        }

        .Comp-list-group-item {
            position: relative;
            display: block;
            padding: 10px 15px;
            margin-bottom: -1px;
            background-color: #fff;
            border: 1px solid #b5580a;
        }

        a.Comp-list-group-item {
            color: black;
        }

        h4 {
            font-size: 15px !important;
            margin-left: 9px !important;
        }
    </style>
</asp:Content>
