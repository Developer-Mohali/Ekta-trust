<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Inner.Master" EnableEventValidation="false" CodeBehind="ContactDetails.aspx.vb" Inherits="EktaTrust.ContactDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            TotalRecord();
            HideLogdetails();
        })

        function TotalRecord() {
         
            var totalRowCount = $("[id*=gvPerson] tr").length;
            var rowCount = $("[id*=gvPerson] td").closest("tr").length;
            var message = "Total Items Count: " + rowCount;
                
                $('#message').text(message);
                return false;
        }

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
.modalBackground
{
background-color: Gray;
filter: alpha(opacity=80);
opacity: 0.8;
z-index: 10000;
}
</style>

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
                <li class="active"><a href="ContactDetails.aspx"> Contact Detail</a></li>
                <li><a href="#"> Donation</a></li>
                <li><a href="SUGGESTIONTRUSTACTIVITIES.aspx"> Trust Activities</a></li>
                <li><a href="EventDetails.aspx">Events</a></li>
                <li><a href="MIPRegistrationDetails.aspx">MIP Registration Details</a></li>
                <li><a href="MIPFacultyRegistrationDetails.aspx">MIP Faculty Registration Details</a></li>
                <li><a href="SendNotificationMIP.aspx">Send Notification</a></li>
                <li><a href="TemplateListing.aspx">Templates</a></li>
                <li><a href="LogDetails.aspx" id="LogDetails">Log Details</a></li>
                <li><a href="UserDetails.aspx">Users</a></li>
                <li><a href="MatrimonialDetails.aspx">Matrimonial Details</a></li>
                <li><a href="CareerCounsellingDetails.aspx">Career Counselling Details</a></li>
                <li><a href="AtrocityReportingDetails.aspx">Atrocities Reporting Details</a></li>
                <li><a href="AddNotification.aspx">Add New Notification</a></li>
                <li><a href="DonationDetails.aspx">Donation Details</a></li>
                 <li><a href="CertificationReport.aspx">Certification</a></li>
                <li><a href="FeedbackAndSuggestion.aspx">Feedback And Suggestion</a></li>
              </ul>
                
          </div>
            <!-- /.navbar-collapse --> 
          </nav>
      </div>
      </div>
  </div>
    <div class="col-md-10 ">
        <h2 class="admin-heading">Contact Details</h2>
           
    <div class="table-responsive">
       
        <table class="table table-bordered table-hover table-striped">
           
        <tbody>
           
    <tr><td>Search By:
        <asp:DropDownList ID="ddlSearchBy" runat="server" AutoPostBack="True"
            onselectedindexchanged="ddlSearchBy_SelectedIndexChanged">
        <asp:ListItem Text="All"></asp:ListItem>
        <asp:ListItem Text="EmailAddress"></asp:ListItem>
        <asp:ListItem Text="Mobile"></asp:ListItem>       
        <asp:ListItem Text="Message"></asp:ListItem>
                 
        </asp:DropDownList> 
    </td><td> Search
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
        </td><td>
            <asp:Button ID="btnSearch" runat="server" Text="Search"
                onclick="btnSearch_Click" />
             <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="Red" Text=""></asp:Label>
        </td>
        <td>
     <asp:Button ID="Button1" runat="server" Text="Export to Excel" class="btn btn-info"
                onclick="Button1_Click" />
        </td>
    </tr>
    

 <br/>
          
            <asp:GridView ID="gvPerson" runat="server" class="table table-bordered table-hover table-striped" AutoGenerateColumns="false" DataKeyNames="ContactId"
OnRowDataBound="OnRowDataBound"  onpageindexchanging="gvPerson_PageIndexChanging"  PageSize="25" OnRowDeleting="OnRowDeleting"
   EmptyDataText="No records has been added."  Style="font-weight: normal;">
<Columns> 
    
    <asp:BoundField HeaderText="ContactId" DataField="ContactId" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="EmailAddress" DataField="EmailAddress" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="Mobile" DataField="Mobile" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
         <asp:BoundField HeaderText="Message" DataField="Message" ItemStyle-HorizontalAlign="Left"><ItemStyle Width="480px"></ItemStyle></asp:BoundField>
         <asp:BoundField HeaderText="Date" DataField="Date" ItemStyle-HorizontalAlign="Left" DataFormatString="{0:dd-M-yyyy}"></asp:BoundField>
    <asp:TemplateField HeaderText="" ItemStyle-Width="72" >
        <ItemTemplate>
          <asp:ImageButton ID="imgbtn" ImageUrl="Images/UI_Icons-09-128.png" runat="server" Width="25" Height="25" onclick="imgbtn_Click" />
            <asp:ImageButton ID="ButtonDelete" runat="server" CommandName="Delete"  Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this event?');" Width="25" Height="25"  CssClass="input" ImageUrl="Images/minimal-97-128.png" />
        </ItemTemplate>
       </asp:TemplateField>
    
            <%--<asp:CommandField ButtonType="Link"  ItemStyle-Width="62"/>--%>
</Columns>
</asp:GridView>
     Total Items Count: <asp:Label ID="lblRecords" runat="server" Text="Label"></asp:Label> 
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
    </table>           
  <br />
            <asp:Label ID="lblresult" runat="server"/>
         <asp:Button ID="btnShowPopup" runat="server" style="display:none"  CssClass="col-lg-6 col-sm-6 col-md-6"/>
<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlpopup" CancelControlID="btnCancel" BackgroundCssClass="modalBackground">
</ajaxToolkit:ModalPopupExtender>
<asp:Panel ID="pnlpopup" runat="server"   style="display:none">
    <div class = "modal-dialog">
    <div class = "modal-content">
      <div class = "modal-header">
<div width="100%"  width:100%; border-collapse: inherit; height:100%" cellpadding="0" cellspacing="0" Style="border-bottom: 1px solid #e5e5e5;">
<tr style="background-color:#D55500">
<td colspan="2" style=" height:10%; color:White; font-weight:bold;  font-size:larger" align="center "  ></td>
<h4>User Contact Details</h4>
 </div>    
 <div class="modal-body" >
<div class="form-group">
<label>ContactId: </label>
<asp:Label ID="lblContactId" runat="server" ></asp:Label>
</div>
<div class="form-group">
<label>EmailAddress: </label>
<asp:TextBox ID="textEmailAddress" runat="server" class="form-control"  style="width:95%"/>
</div>

<div class="form-group">
<label>Mobile: </label>
<asp:TextBox ID="textMobile" runat="server" class="form-control" style="width:95%"/>
</div>
<div class="form-group">
<label>Message: </label>
<asp:TextBox ID="textMessage" Rows="10" Columns="40" TextMode="multiline"  runat="server" class="form-control" style="width:95%"/>
</div>
    
            
<div class="form-group">
<asp:Button ID="btnUpdate" CommandName="Update" runat="server" class="btn btn-primary btn-lg"  Text="Update" onclick="btnUpdate_Click"/>
<asp:Button ID="btnCancel" runat="server"  class="btn btn-primary btn-lg" Text="Cancel" />
</div>
      
 </div>       
</div>
</div>
</div>
</asp:Panel>        
                
       
      </table>
  </div>

</asp:Content>
