<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Inner.Master" EnableEventValidation="false" CodeBehind="TrainingActivity.aspx.vb" Inherits="EktaTrust.TrainingActivity" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <script type="text/javascript">
        $(document).ready(function () {
            TotalRecord();
            HideLogdetails()
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
        .modalBackground {
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
                <li class="active"><a href="TrainingActivity.aspx"> Training Activites</a></li>
                <li><a href="Joining.aspx"> Joining</a></li>
                <li><a href="ContactDetails.aspx"> Contact Detail</a></li>
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
              </ul>
          </div>
            <!-- /.navbar-collapse --> 
          </nav>
      </div>
      </div>
  </div>

    <div class="col-md-10 ">
        <h2 class="admin-heading">Training Activities</h2>
           
    <div class="table-responsive">
       
        <table class="table table-bordered table-hover table-striped">
           
        <tbody>
           
        <tr>
        <td>Search By:
        <asp:DropDownList ID="ddlSearchBy" runat="server" AutoPostBack="True"
            onselectedindexchanged="ddlSearchBy_SelectedIndexChanged">
        <asp:ListItem Text="All"></asp:ListItem>
        <asp:ListItem Text="Name"></asp:ListItem>       
        <asp:ListItem Text="Email"></asp:ListItem>
        <asp:ListItem Text="Training"></asp:ListItem>
        <asp:ListItem Text="Mobile"></asp:ListItem>
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
    
              <asp:GridView ID="gvPerson" runat="server" class="table table-bordered table-hover table-striped" AutoGenerateColumns="false" DataKeyNames="TrainingId"
OnRowDataBound="OnRowDataBound" onpageindexchanging="gvPerson_PageIndexChanging"  PageSize="25" OnRowDeleting="OnRowDeleting"
   EmptyDataText="No records has been added." Style="font-weight: normal;">
<Columns> 
    <asp:BoundField HeaderText="Name" DataField="Name" ItemStyle-HorizontalAlign="Left" />
         <asp:BoundField HeaderText="Email" DataField="Email" ItemStyle-HorizontalAlign="Left" />
         <asp:BoundField HeaderText="Training" DataField="Training" ItemStyle-HorizontalAlign="Left" />
         <asp:BoundField HeaderText="Mobile" DataField="Mobile" ItemStyle-HorizontalAlign="Left" />
         <asp:BoundField HeaderText="CreateDate" DataField="CreateDate" ItemStyle-HorizontalAlign="Left" DataFormatString="{0:dd-M-yyyy}"> <ItemStyle Width="8px"></ItemStyle> </asp:BoundField >
    <asp:TemplateField HeaderText="" ItemStyle-Width="72" >
        <ItemTemplate>
          <asp:ImageButton ID="imgbtn" ImageUrl="Images/UI_Icons-09-128.png" runat="server" Width="25" Height="25" onclick="imgbtn_Click" />
             <asp:ImageButton ID="ButtonDelete" runat="server" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this event?');" Text="Delete" Width="25" Height="25"  CssClass="input" ImageUrl="Images/minimal-97-128.png" />
        </ItemTemplate>
       </asp:TemplateField>
   <%-- <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="62"/>--%>
</Columns>
</asp:GridView>
                 Total Items Count: <asp:Label ID="lblRecords" runat="server" Text="Label"></asp:Label> 
<%--<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse">

    </table>--%>
       
     <asp:Label ID="lblresult" runat="server"/>
         <asp:Button ID="btnShowPopup" runat="server" style="display:none" />
<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlpopup" CancelControlID="btnCancel" BackgroundCssClass="modalBackground">
</ajaxToolkit:ModalPopupExtender>
              
           
          </tr>
          </tbody>
      </table>
           
       
      </div>
  </div>
           </div>

    <asp:Panel ID="pnlpopup" runat="server" style="display:none">
    <div class = "modal-dialog">
        <div class = "modal-content">
            <div class = "modal-header">
                <div width:100%; border-collapse: inherit; height:100%" cellpadding="0" cellspacing="0" Style="border-bottom: 1px solid #e5e5e5;">
                <tr style="background-color:#D55500">
                <td colspan="2" style=" height:10%; color:White; font-weight:bold;  font-size:larger" align="center"></td>
                <h4>User Training Details</h4>
            </div>  
            <div class="modal-body" >
                <div class="form-group">
                    <label>TrainingId: </label>
<asp:Label ID="lblTrainingId" runat="server" ></asp:Label>
</div>
<div class="form-group">
<label>Name: </label>
<asp:TextBox ID="textName" runat="server" class="form-control" style="width:95%"/>
</div>
<div class="form-group">
<label>Email: </label>
<asp:TextBox ID="textEmail" runat="server" class="form-control" style="width:95%"/>
</div>
<div class="form-group">
<label>Training: </label>
<asp:DropDownList ID="ddlTraining" runat="server" class="form-control" style="width:95%">
                                <asp:ListItem Value="Select">Select</asp:ListItem>
                              <asp:ListItem Value="Education">Education</asp:ListItem>
                              <asp:ListItem Value="Trailoring">Trailoring</asp:ListItem>
                              <asp:ListItem Value="Driving">Driving</asp:ListItem>
                              <asp:ListItem Value="Cooking">Cooking</asp:ListItem>
                              <asp:ListItem Value="Yoga Training">Yoga Training</asp:ListItem>
                              <asp:ListItem Value="Dairying">Dairying</asp:ListItem>
                             </asp:DropDownList>
</div>
<div class="form-group">
<label>Mobile: </label>
<asp:TextBox ID="textMobile" runat="server" class="form-control" style="width:95%"/>
</div>
<div class="form-group">
<asp:Button ID="btnUpdate" CommandName="Update" runat="server" class="btn btn-primary btn-lg" style="height:45px;" Text="Update" onclick="btnUpdate_Click"/>
<asp:Button ID="btnCancel" runat="server" style="height:45px;" class="btn btn-primary btn-lg" Text="Cancel" />
</div>
</div>
</div>
</div>
</div>
</asp:Panel> 

</asp:Content>
