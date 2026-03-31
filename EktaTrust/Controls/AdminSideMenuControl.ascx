<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="AdminSideMenuControl.ascx.vb" Inherits="EktaTrust.AdminSideMenuControl" %>

    <div runat="server" class="DivShowHideMenu" id="divShowHideMenu" visible="false">

<style>

    #bibMenu a{
        padding:5px 15px !important;
    }
    #bibMenu{
        padding:0px;
    }

    @media only screen and (min-width: 421px) {
        .container-fluid.main-container{
            padding:unset;
        }
    }

</style>
   <!-- Menu -->
   <div class="side-menu">
   <nav class="navbar navbar-default" role="navigation"> 
      
       <!-- Main Menu -->
       <div class="side-menu-container">
       <ul class="nav navbar-nav">
           <li><a href="DashBoard.aspx"> Dashboard</a></li>
           <li ><a href="TrainingActivity.aspx"> Training Activites</a></li>
           <li><a href="Joining.aspx"> Joining</a></li>
           <li><a href="ContactDetails.aspx"> Contact Detail</a></li>
           <li><a href="DonationDetails.aspx"> Donation</a></li>
            <li><a href="SUGGESTIONTRUSTACTIVITIES.aspx"> Trust Activities</a></li>
            <li><a href="EventDetails.aspx">Events</a></li>
           <li><a href="MIPRegistrationDetails.aspx">MIP-Registration Details</a></li>
           <li><a href="MIPFacultyRegistrationDetails.aspx">MIP Faculty Registration Details</a></li>
            <li><a href="SendNotificationMIP.aspx">Send Notification</a></li>
           <li><a href="TemplateListing.aspx">Templates</a></li>
           <li><a href="LogDetails.aspx" id="LogDetails">Log Details</a></li>
      
           <li>
                <a href="javascript:void(0);" class="nav-link bib-toggle">
                    Manage BIB User
                    <span class="caret pull-right"></span>
                </a>

                <ul id="bibMenu" class="collapse">
                    <li><a class="list-group-item" href="UserDetails.aspx">Manage BIB Users</a></li>
                    <li><a class="list-group-item" href="AdminBIBData.aspx">BIB Data</a></li>
                </ul>
            </li>

          <%-- <li class="active"><a href="UserDetails.aspx">Users</a></li>--%>
           <li><a href="MatrimonialDetails.aspx">Matrimonial Details</a></li>
           <li><a href="CareerCounsellingDetails.aspx">Career Counselling Details</a></li>
           <li><a href="AtrocityReportingDetails.aspx">Atrocities Reporting Details</a></li>
           <li><a href="AddNotification.aspx">Add New Notification</a></li>
           <li><a href="DonationDetails.aspx">Donation Details</a></li>
           <li><a href="CertificationReport.aspx">Certification</a></li>
           <li><a href="FeedbackAndSuggestion.aspx">Feedback And Suggestion</a></li>
           <li><a href="CreativeCompetitionRegistered.aspx">Creative Competition</a></li>
      <%--     <li><a href="AdminBIBData.aspx">BIB Data</a></li>--%>
         </ul>
           
     </div>
       <!-- /.navbar-collapse --> 
     </nav>
 </div>

    </div>


<script>
    $(document).ready(function () {
        $('.bib-toggle').click(function (e) {
            e.preventDefault(); // prevent postback or default href
            $('#bibMenu').collapse('toggle');
        });

        // Optional: rotate caret
        $('#bibMenu').on('shown.bs.collapse', function () {
            $('.bib-toggle .caret').css('transform', 'rotate(180deg)');
        });
        $('#bibMenu').on('hidden.bs.collapse', function () {
            $('.bib-toggle .caret').css('transform', 'rotate(0deg)');
        });
    });

    $(function () {
        var currentPage = location.pathname.split('/').pop().toLowerCase();

        $('.navbar-nav li').removeClass('active');

        $('.navbar-nav li a').each(function () {
            var href = $(this).attr('href');

            if (href && href.toLowerCase() === currentPage) {
                $(this).parent('li').addClass('active');

                // If submenu → open parent
                $(this).closest('ul.collapse').addClass('in');
            }
        });
    });
</script>
