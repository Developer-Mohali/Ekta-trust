<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Inner.Master" CodeBehind="DashBoard.aspx.vb" Inherits="EktaTrust.DashBoard" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
     <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
      <%@ Register Src="~/Controls/AdminSideMenuControl.ascx" TagPrefix="ucSM" TagName="AdminSideMenuControl" %> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<style>        
        /* Container for the top KPI cards */
        .kpi-container {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }
        
        /* Individual KPI Card styling */
        .kpi-card { 
            background: white; 
            padding: 20px; 
            border-radius: 8px; 
            box-shadow: 0 2px 4px rgba(0,0,0,0.05); 
            flex: 1; /* Makes cards grow equally */
            min-width: 250px;
        }
        
        /* Colored accent borders for visual distinction */
        .card-users { border-left: 5px solid #418cf0; }
        .card-donations { border-left: 5px solid #28a745; }
        .card-visitor { border-left: 5px solid #eb8f34; }
        
        .kpi-card h3 { 
            margin: 0; 
            color: #6c757d; 
            font-size: 1rem; 
            font-weight: 600;
            text-transform: uppercase;
        }
        
        .kpi-card .value { 
            font-size: 2.2rem; 
            font-weight: bold; 
            color: #333; 
            margin-top: 10px; 
        }

        /* Container for the chart */
        .chart-card { 
            background: white; 
            padding: 20px; 
            border-radius: 8px; 
            box-shadow: 0 2px 4px rgba(0,0,0,0.05); 
        }
        
        .chart-card h2 { 
            color: #333; 
            margin-top: 0;
            font-size: 1.2rem;
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
        }
        .card-click{
            cursor: pointer; 
        }
            /* The container that holds both chart cards */
        .charts-row {
            display: flex;
            flex-wrap: wrap; /* Allows wrapping on small screens */
            gap: 20px;       /* Space between the two charts */
            width: 100%;
            margin-top: 20px;
        }

        /* Each chart card takes up 50% minus half the gap */
        .charts-row .chart-card {
            flex: 1; 
            min-width: 300px; /* Prevents them from getting too squashed */
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            box-sizing: border-box; /* Ensures padding doesn't break the width */

            /* FIX: Set a consistent height for both cards */
            height: 400px;
        }
        /* Target the canvas to make sure it respects the parent height */
        .chart-card canvas {
            max-height: 300px !important; 
            width: 100% !important;
        }
        /* Responsive: On screens smaller than 800px, stack them 100% */
        @media (max-width: 800px) {
            .charts-row .chart-card {
                flex: 1 1 100%;
            }
        }
        @media screen and (min-width: 590px) {
            .chart-card { 
                width: fit-content; 
            }
     }
    </style>
        <div class="container-fluid main-container">
         <div class="col-md-2 sidebar">
            <div class="row"> 
                  <div class="absolute-wrapper"> </div>
                  <!-- Menu -->
                   <ucSM:AdminSideMenuControl runat="server" id="AdminSideMenuControl" />
            </div>
         </div>
         <div class="col-md-10 ">
                <!-- Header -->
               <div class="header-admin">
                   <div><h2 class="">Dashboard</h2></div>
                   <%-- <div>
                        <button class="btn btn-primary" title="Refresh Payment Status" onclick="updatePaytmenStatus()">Refresh Payment</button>
                        <asp:Button ID="btnAddBIB" runat="server" Text="Add New" CssClass="btn btn-success" OnClick="btnAddNew_Click" />
                    </div>--%>
               </div>
           <div class="main-card">
            <div class="kpi-container">
                <!-- Visitor Card -->
                    <div class="kpi-card card-visitor">
                        <h3>Total Visitors</h3>
                        <div class="value">
                            <asp:Label ID="lblTotalVisitor" runat="server" Text="0"></asp:Label>
                        </div>
                    </div>
                    <!-- BIB User Card -->
                    <div class="kpi-card card-users">
                        <h3>BIB Users</h3>
                        <div class="value">
                            <asp:Label ID="lblTotalUsers" runat="server" Text="0" CssClass="card-click" onclick="redirectToPage('bib')"></asp:Label>
                        </div>
                    </div>
            <!-- Donation Card -->
                    <div class="kpi-card card-donations">
                        <h3>Total Donations</h3>
                        <div class="value">
                            <asp:Label ID="lblTotalDonations" runat="server" Text="₹0" CssClass="card-click" onclick="redirectToPage('donation')"></asp:Label>
                        </div>
                    </div>
                </div>
               <div class="charts-row">
                   <!-- Donation chart -->
                    <div class="chart-card">
                        <h2>Monthly Donations</h2>      
                        <canvas id="myDonationChart"></canvas>
                        <asp:Literal ID="ChartScriptLiteral" runat="server"></asp:Literal>
                    </div>
                   <!-- BIB reg users chart -->
                    <div class="chart-card">
                        <h2>BIB Users</h2>      
                        <canvas id="regUserChart"></canvas>
                        <asp:Literal ID="regUserLiteral" runat="server"></asp:Literal>
                    </div>
                </div>
            </div>
           </div>
        </div>

<script type="text/javascript">
    function redirectToPage(toPage) {
        if (toPage === 'bib') {
            window.location.href = 'AdminBIBData.aspx';
        } else if (toPage === 'donation') {
            window.location.href = 'DonationDetails.aspx';
        }
    }
</script>
 <%--   <script type="text/javascript">
        $(document).ready(function () {
            HideLogdetails();
           // $('.DivShowHideMenu').hide();
        });
       
       function HideLogdetails() {
           var name = '<%=Session("RoleId") %>';
 
               $('.DivShowHideMenu').show();
               if (name == 2) {
                   $('#LogDetails').hide();
               }
               else {
                   $('#LogDetails').show();
               }
           }

    </script>

    <h2 class="admin-heading2">Dashboard</h2>
    <br/>
    <br/>
    <div runat="server" class="DivShowHideMenu" id="divShowHideMenu" visible="false">

 
    
    <div class="container text-center">
        <div class="col-lg-12">
            <a href="DonationDetails.aspx" class="nb-btn-circle"><i class="fa fa-money"></i>
                <p>Donation Details</p>
            </a>
            <a href="AdminBIBData.aspx"  class="nb-btn-circle"><i class="fa fa-edit"></i>
                 <p>BIB Data</p>
           </a>
             <a href="ManageNews.aspx"  class="nb-btn-circle"><i class="fa fa-money"></i>
                <p>Manage News</p>
            </a>
            <a href="UserDetails.aspx" class="nb-btn-circle"><i class="fa fa-users"></i>
                <p>Users</p>
            </a>
            <a href="EventDetails.aspx" class="nb-btn-circle"><i class="fa fa-calendar"></i>
                <p>Events</p>
            </a>
             <a href="MIPRegistrationDetails.aspx" class="nb-btn-circle"><i class="fa fa-edit"></i>
                <p>MIP-Registration Details</p>
            </a>
          <%--   <a href="LatestNewsDetails.aspx" class="nb-btn-circle"><i class="fa fa-edit"></i>
                <p>Add News</p>
            </a>--%
        </div>
    </div>
     <div class="container text-center">
        <div class="col-lg-12">
            <a href="LogDetails.aspx" class="nb-btn-circle" id="LogDetails"><i class="fa fa-list"></i>
                <p>Log Details</p>
            </a>
            <a href="MatrimonialDetails.aspx" class="nb-btn-circle"><i class="fa fa-diamond"></i>
                <p>MatrimonialDetails</p>
            </a>
             <a href="CareerCounsellingDetails.aspx" class="nb-btn-circle"><i class="fa fa-bookmark-o"></i>
                <p>Career Counselling Details</p>
            </a>
           <a href="AtrocityReportingDetails.aspx" class="nb-btn-circle"><i class="fa fa-gavel"></i>
                <p>Atrocities Reporting Details</p>
            </a>
             <a href="AddNotification.aspx" class="nb-btn-circle"><i class="fa fa-bell"></i>
                <p>Add Notification</p>
            </a>
            <a href="SendNotificationMIP.aspx" class="nb-btn-circle"><i class="fa fa-bell"></i>
                <p>Send Notification</p>
            </a>
        </div>
    </div>
  
     <div class="container text-center">
        <div class="col-lg-12">          
           <a href="CertificationReport.aspx" class="nb-btn-circle"><i class="fa fa-certificate"></i>
                <p>Certificate</p>
            </a>
            <a href="FeedbackAndSuggestion.aspx" class="nb-btn-circle"><i class="fa fa-lightbulb-o"></i>
                <p>Feedback And Suggestion</p>
            </a>
             <a href="MigrantsRegistrationDetails.aspx"  class="nb-btn-circle"><i class="fa fa-edit"></i>
                <p>Migrants Registration Details</p>
            </a>
            <a href="ModificationEmailAndSms.aspx" class="nb-btn-circle"><i class="fa fa-envelope"></i>
                <p>Mail Template</p>
            </a>
              <a href="MIPFacultyRegistrationDetails.aspx" class="nb-btn-circle"><i class="fa fa-user-plus"></i>
                <p>MIP Faculty Registration Details</p>
            </a>
              <a href="TemplateListing.aspx" class="nb-btn-circle"><i class="fa fa-map-marker"></i>
                <p>Templates</p>
            </a>
        </div>
    </div>

     <div class="container text-center">
        <div class="col-lg-12">          
           <a href="CreativeCompetitionRegistered.aspx" class="nb-btn-circle"><i class="fa fa-trophy"></i>
                <p>Creative Competition</p>
            </a>
        </div>
    </div>
   </div>--%>
    
    
</asp:Content>
