<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Inner.Master" CodeBehind="DashBoard.aspx.vb" Inherits="EktaTrust.DashBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            HideLogdetails()
        });
       
       function HideLogdetails() {
            var name = '<%=Session("RoleId") %>'
            if (name == 2) {
                $('#LogDetails').hide();
            }
            else {
                $('#LogDetails').show();
            }
        }
</script>

    <h2 class="admin-heading2">Dashboard</h2>
    <br>
    <br>
    <div class="container text-center">
        <div class="col-lg-12">
            <a href="TrainingActivity" class="nb-btn-circle"><i class="fa fa-graduation-cap"></i>
                <p>Training Activities</p>
            </a><a href="Joining" class="nb-btn-circle"><i class="fa fa-handshake-o"></i>
                <p>Joining</p>
            </a><a href="#" class="nb-btn-circle"><i class="fa fa-money"></i>
                <p>Donation</p>
            </a><a href="ContactDetails" class="nb-btn-circle"><i class="fa fa-address-book"></i>
                <p>Contact Detail</p>
            </a><a href="SUGGESTIONTRUSTACTIVITIES" class="nb-btn-circle"><i class="fa fa-cog"></i>
                <p>Trust Activities</p>
            </a><a href="ChangePassword" class="nb-btn-circle"><i class="fa fa-unlock-alt"></i>
                <p>Change Password</p>
            </a>

        </div>
    </div>
    <div class="container text-center">
        <div class="col-lg-12">
            <a href="EventDetails.aspx" class="nb-btn-circle"><i class="fa fa-calendar"></i>
                <p>Events</p>
            </a>
             <a href="MIPRegistrationDetails.aspx" class="nb-btn-circle"><i class="fa fa-edit"></i>
                <p>MIP-Registration Details</p>
            </a>
            <a href="MIPFacultyRegistrationDetails.aspx" class="nb-btn-circle"><i class="fa fa-user-plus"></i>
                <p>MIP Faculty Registration Details</p>
            </a>
             <a href="SendNotificationMIP.aspx" class="nb-btn-circle"><i class="fa fa-bell"></i>
                <p>Send Notification</p>
            </a>
            <a href="ModificationEmailAndSms.aspx" class="nb-btn-circle"><i class="fa fa-envelope"></i>
                <p>Mail Template</p>
            </a>
              <a href="TemplateListing.aspx" class="nb-btn-circle"><i class="fa fa-map-marker"></i>
                <p>Templates</p>
            </a>
        </div>
    </div>
     <div class="container text-center">
        <div class="col-lg-12">
            <a href="LogDetails.aspx" class="nb-btn-circle" id="LogDetails"><i class="fa fa-list"></i>
                <p>Log Details</p>
            </a>
             <a href="UserDetails.aspx" class="nb-btn-circle"><i class="fa fa-users"></i>
                <p>Users</p>
            </a>
            <a href="MatrimonialDetails.aspx" class="nb-btn-circle"><i class="fa fa-diamond"></i>
                <p>MatrimonialDetails</p>
            </a>
             <a href="CareerCounsellingDetails.aspx" class="nb-btn-circle"><i class="fa fa-bookmark-o"></i>
                <p>Career Counselling Details</p>
            </a>
          
        </div>
    </div>
    <div class="container text-center">
        <div class="col-lg-12">          
            <a href="AtrocityReportingDetails.aspx" class="nb-btn-circle"><i class="fa fa-gavel"></i>
                <p>Atrocities Reporting Details</p>
            </a>
            <a href="AddNotification.aspx" class="nb-btn-circle"><i class="fa fa-bell"></i>
                <p>Add Notification</p>
            </a>
        </div>
    </div>
     <div class="container text-center">
        <div class="col-lg-12">          
           
            <a href="DonationDetails.aspx" class="nb-btn-circle"><i class="fa fa-money"></i>
                <p>Donation Details</p>
            </a>
        </div>
    </div>
</asp:Content>
