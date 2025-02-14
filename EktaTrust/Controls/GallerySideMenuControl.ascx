<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="GallerySideMenuControl.ascx.vb" Inherits="EktaTrust.GallerySideMenuControl" %>


 <div class="col-md-3 col-sm-2 col-xs-12" style="padding-right: 0px; padding-left: 0px; top: 10px;">
     <a href="#" class="list-group-item">Gallery of Events</a>

     <div class="panel-group" id="accordionGallery">

         <div class="panel panel-default">
             <div class="panel-heading active">
                 <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordionGallery" href="#collapseThree2" style="font-size: 14px;">
                     <h3 class="panel-title">Run For Equality  <i class="fa fa-angle-right pull-right"></i></h3>
                 </a>
             </div>
             <div id="collapseThree2" class="panel-collapse in" style="height: auto;">
                 <a href="../RunForEquality2025" class="list-group-item">Run For Equality 2025</a>
                 <a href="../RunForEquality2023" class="list-group-item">Run For Equality 2023</a>
                 <a href="../RunForEquality2022" class="list-group-item">Run For Equality 2022</a>
                 <a href="../RunForEquality2020" class="list-group-item">Run For Equality 2020</a>
                 <a href="../RunForEquality2019" class="list-group-item">Run For Equality 2019</a>
                 <a href="../RunForEquality_2018" class="list-group-item">Run For Equality 2018</a>
                 <a href="../RunForEquality" class="list-group-item">Run For Equality 2017</a>
             </div>
         </div>
         <div class="panel panel-default">
             <div class="panel-heading">
                 <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordionGallery" href="#collapseThree1" style="font-size: 14px;">
                     <h3 class="panel-title">Felicitation Programme  <i class="fa fa-angle-right pull-right"></i></h3>
                 </a>
             </div>
             <div id="collapseThree1" class="panel-collapse collapse" style="height: auto;">
                 <a href="../Gallery2019" class="list-group-item">Felicitation Programme 2019</a>
                 <a href="../Gallery2018" class="list-group-item">Felicitation Programme 2018</a>
                 <a href="../Gallery2017" class="list-group-item">Felicitation Programme 2017</a>
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

<script>
    $(document).ready(function () {
        // Get the current URL of the page
        var currentUrl = window.location.pathname.toLowerCase(); // Convert to lowercase for consistency

        // Loop through each link in the navigation
        $('.list-group-item').each(function () {
            var linkUrl = $(this).attr('href').toLowerCase(); // Get the href of the link

            // Check if the current URL contains the link URL
            if (linkUrl.includes(currentUrl)) {
                // Remove the active class from all items
                $('.list-group-item').removeClass('active');

                // Add the active class to the matching link
                $(this).addClass('active');


                // Collapse all panels
                $('.panel-collapse').removeClass('in').css('height', '0'); // Close all panels
                $('.panel-heading').removeClass('active'); // Remove active class from all headings

                // Expand the parent panel if the active link is inside a collapsed panel
                var parentPanel = $(this).closest('.panel-collapse'); // Get the parent panel-collapse

                if (parentPanel.length) {
                    // Expand the panel and add the "active" class to the panel-heading
                    parentPanel.addClass('in').css('height', 'auto'); // Expand the panel
                    parentPanel.prev('.panel-heading').addClass('active'); // Highlight the heading
                }
            }
        });
    });


</script>