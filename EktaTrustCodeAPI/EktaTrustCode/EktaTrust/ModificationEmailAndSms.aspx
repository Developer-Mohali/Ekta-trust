<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Inner.Master" CodeBehind="ModificationEmailAndSms.aspx.vb" ValidateRequest="false" Inherits="EktaTrust.ModificationEmailAndSms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script>

        $(document).ready(function () {

            HideLogdetails();

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

     <style type="text/css">
        /* CSS REQUIRED */
        .state-icon {
            left: -5px;
        }

        .list-group-item-primary {
            color: rgb(255, 255, 255);
            background-color: rgb(66, 139, 202);
        }

        /* DEMO ONLY - REMOVES UNWANTED MARGIN */
        .well .list-group {
            margin-bottom: 0px;
        }
    </style>
    <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
   
    <style>
        .container {
            border: 2px solid #ccc;
            background-color: #eee;
            border-radius: 5px;
            padding: 16px;
            margin: 16px 0;
        }

            .container::after {
                content: "";
                clear: both;
                display: table;
            }

            .container img {
                float: left;
                margin-right: 20px;
                border-radius: 50%;
            }

            .container span {
                font-size: 20px;
                margin-right: 15px;
            }

        @media (max-width: 500px) {
            .container {
                text-align: center;
            }

                .container img {
                    margin: auto;
                    float: none;
                    display: block;
                }
        }
        .panel-primary > .panel-heading {
            font-size: 17px;
            color: #fff;
            background-color: #428bca;
            border-color: #428bca;
        }
    </style>
    <style type="text/css">
        .modalBackground {
            background-color: Gray;
            filter: alpha(opacity=80);
            opacity: 0.8;
            z-index: 10000;
        }
        .btn {
            width:100%;
            font-size: 17px;
            
        }
   
    </style>
    <script>

    </script>

    <div class="container-fluid main-container">
        <div class="col-md-2 sidebar">
            <div class="row">
                <!-- uncomment code for absolute positioning tweek see top comment in css -->
                <div class="absolute-wrapper"></div>
                <!-- Menu -->
                <div class="side-menu">
                    <nav class="navbar navbar-default" role="navigation">

                        <!-- Main Menu -->
                        <div class="side-menu-container">
                            <ul class="nav navbar-nav">
                                <li><a href="DashBoard.aspx">Dashboard</a></li>
                                <li><a href="TrainingActivity.aspx">Training Activites</a></li>
                                <li><a href="Joining.aspx">Joining</a></li>
                                <li><a href="ContactDetails.aspx">Contact Detail</a></li>
                                <li><a href="#">Donation</a></li>
                                <li><a href="SUGGESTIONTRUSTACTIVITIES.aspx">Trust Activities</a></li>
                                <li><a href="EventDetails.aspx">Events</a></li>
                                <li><a href="MIPRegistrationDetails.aspx">MIP-Registration Details</a></li>
                                <li><a href="MIPFacultyRegistrationDetails.aspx">MIP Faculty Registration Details</a></li>
                                <li><a href="SendNotificationMIP.aspx">Send Notification</a></li>
                                <li class="active"><a href="ModificationEmailAndSms.aspx">New Template</a></li>
                                <li><a href="TemplateListing.aspx">Templates</a></li>
                                <li><a href="LogDetails.aspx" id="LogDetails">Log Details</a></li>
                                <li><a href="UserDetails.aspx">Users</a></li>
                                <li><a href="MatrimonialDetails.aspx">Matrimonial Details</a></li>
                                <li><a href="CareerCounsellingDetails.aspx">Career Counselling Details</a></li>
                                <li><a href="AtrocityReportingDetails.aspx">Atrocities Reporting Details</a></li>
                                <li><a href="AddNotification.aspx">Add New Notification</a></li>
                                <li><a href="DonationDetails.aspx">Donation Details</a></li>
                            </ul>

                        </div>
                        <!-- /.navbar-collapse -->
                    </nav>
                </div>
            </div>
        </div>
        <div class="col-md-6 ">
            
             <div class="panel panel-primary">
      <div class="panel-heading">Template Page</div>
      <div class="panel-body">
     <div class="col-lg-1">
         </div>
          <div class="col-lg-10">
              <asp:Label ID="Message" runat="server" Text="" ForeColor="Green"></asp:Label>
                  <div class="form-group col-sm-12">
                        <div class="panel-heading" style="color:#777">Category</div> 
                           <asp:DropDownList runat="server" class="form-control" ID="drpEvent">
                            <asp:ListItem Value="1">---Select Category---</asp:ListItem>
                            <asp:ListItem Value="2">For Verification OTP</asp:ListItem>
                            <asp:ListItem Value="3">For MIP Registration</asp:ListItem>
                            <asp:ListItem Value="4">For Event Registration</asp:ListItem>
                            <asp:ListItem Value="4">For Faculty Registration</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                <div class="form-group col-sm-6">
                        <div class="panel-heading" style="color:#777">Template Type</div> 
                         <asp:DropDownList runat="server" class="form-control" ID="drpTemplateType">
                            <asp:ListItem Value="1">---Select Template---</asp:ListItem>
                            <asp:ListItem Value="2">EMAIL</asp:ListItem>
                            <asp:ListItem Value="3">SMS</asp:ListItem>
                           
                        </asp:DropDownList>
                    </div>
                      <div class="form-group col-sm-6">
                        <div class="panel-heading" style="color:#777">Subject  <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" controltovalidate="txtTitle" ForeColor="Red" ErrorMessage="Please Enter Subject."  ToolTip="Please Enter Subject." /></div> 
                        <asp:TextBox ID="txtTitle" runat="server" Rows="3" Columns="30" TextMode="SingleLine" class="form-control" placeholder="Message"></asp:TextBox>
                    </div>
           
                    <div class="form-group col-sm-12">
                        <div class="panel-heading" style="color:#777">Message  <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator2" controltovalidate="txtMessage" ForeColor="Red" ErrorMessage="Please Enter Message."  ToolTip="Please Enter Message." /></div> 
                        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="6" Cols="20" class="form-control" style="width:100%;height: 213px;"/>
                        
                    </div>
              
                    <div class="form-group col-sm-12">
                        <%-- <button type="submit" name="submit" class="btn btn-primary btn-lg" >Submit Message</button>--%>
                        <asp:Button ID="Button1" runat="server" class="btn btn-info" value="Send Notification"  Text="Submit"/>
              
                    </div>
                </div></div>
    </div>
            
        </div>
    </div>
</asp:Content>
