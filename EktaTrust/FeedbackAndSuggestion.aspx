<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Inner.Master" CodeBehind="FeedbackAndSuggestion.aspx.vb" Inherits="EktaTrust.FeedbackAndSuggestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <div class="container-fluid main-container">
    <div class="col-md-2 sidebar">
    <div class="row"> 
        <!-- uncomment code for absolute positioning tweek see top comment in css -->
        <div class="absolute-wrapper"> </div>
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
                <li><a href="#"> Donation</a></li>
                 <li><a href="SUGGESTIONTRUSTACTIVITIES.aspx"> Trust Activities</a></li>
                 <li><a href="EventDetails.aspx">Events</a></li>
                <li><a href="MIPRegistrationDetails.aspx">MIP Registration Details</a></li>
                <li><a href="MIPFacultyRegistrationDetails.aspx">MIP Faculty Registration Details</a></li>
                <li><a href="SendNotificationMIP.aspx">Send Notification</a></li>
                <li><a href="TemplateListing.aspx">Templates</a></li>
                <li><a href="LogDetails.aspx">Log Details</a></li>
                <li><a href="UserDetails.aspx">Users</a></li>
                <li><a href="MatrimonialDetails.aspx">Matrimonial Details</a></li>
                <li><a href="CareerCounsellingDetails.aspx">Career Counselling Details</a></li>
                <li><a href="AtrocityReportingDetails.aspx">Atrocities Reporting Details</a></li>
                <li><a href="AddNotification.aspx">Add New Notification</a></li>
                <li><a href="DonationDetails.aspx">Donation Details</a></li>
                <li><a href="CertificationReport.aspx">Certification</a></li>
                <%-- <li><a href="CertificationReport.aspx">Certification</a></li>--%>
                <li class="active"><a href="FeedbackAndSuggestion.aspx">Feedback And Suggestion</a></li>

              </ul>
                
          </div>
            <!-- /.navbar-collapse --> 
          </nav>
      </div>
      </div>
  </div>
    <div class="col-md-10 ">
        <h2 class="admin-heading">FeedBack and Suggestions</h2>
           
    <div class="table-responsive">
       <asp:Label ID="MessageUpdated" runat="server" Text="" ForeColor="Green"></asp:Label>
        <table class="table table-bordered table-hover table-striped">
           
        <tbody>

            <br />
    <tr>
        <td> Search by Mobile Number
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
        </td><td>
            <asp:Button ID="btnSearch" runat="server" Text="Search" 
                />
             <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="Red" Text=""></asp:Label>
            
        </td></tr>
    
</tbody>
 <br />
          
            <asp:GridView ID="gvEvent" runat="server" class="table table-bordered table-hover table-striped" AutoGenerateColumns="false" DataKeyNames="ID"  PageSize="25" 
   EmptyDataText="No records has been added." Style="font-weight: normal;" onpageindexchanging="gvEvent_PageIndexChanging" >
<Columns> 
    
    <asp:BoundField HeaderText="Name" DataField="Name" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="Mobile Number" DataField="MobileNumber" ItemStyle-HorizontalAlign="Left"></asp:BoundField>  
    <asp:BoundField HeaderText="Comments" DataField="Comments" ItemStyle-HorizontalAlign="Left"></asp:BoundField>   
    
            <%--<asp:CommandField ButtonType="Link"  ItemStyle-Width="62"/>--%>
</Columns>
</asp:GridView>
      </table>
             Total Items Count: <asp:Label ID="lblRecords" runat="server" Text="Label"></asp:Label> 
  </div>
</div>
</div>

    </asp:Content>
