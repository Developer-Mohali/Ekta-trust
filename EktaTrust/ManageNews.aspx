<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Inner.Master" CodeBehind="ManageNews.aspx.vb" Inherits="EktaTrust.ManageNews" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .table {
            width: 80%;
            margin-bottom: 20px;
          
        }
   

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:Label ID="lblMessage" runat="server" style="margin-left:650px; font-size:medium"></asp:Label><br /> 
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
                            <li><a href="MIPRegistrationDetails.aspx">MIP Registration Details</a></li>
                            <li><a href="MIPFacultyRegistrationDetails.aspx">Registration Details</a></li>
                            <li ><a href="SendNotificationMIP.aspx">Send Notification</a></li>
                            <li><a href="ModificationEmailAndSms.aspx">New Template</a></li>
                            <li><a href="TemplateListing.aspx">Templates</a></li>
                            <li><a href="LogDetails.aspx" id="LogDetails">Log Details</a></li>
                            <li><a href="UserDetails.aspx">Users</a></li>
                            <li><a href="MatrimonialDetails.aspx">Matrimonial Details</a></li>
                            <li><a href="CareerCounsellingDetails.aspx">Career Counselling Details</a></li>
                            <li><a href="AtrocityReportingDetails.aspx">Atrocities Reporting Details</a></li>
                            <li class="active"><a href="AddNotification.aspx">Add New Notification</a></li>
                            <li><a href="DonationDetails.aspx">Donation Details</a></li>
                             <li><a href="CertificationReport.aspx">Certification</a></li>
                            <li><a href="FeedbackAndSuggestion.aspx">Feedback And Suggestion</a></li>
                        </ul>
                    </div>                   
                </nav>
            </div>
        </div>
    </div> 


            <div class="col-md-10 ">    
        <div class="col-sm-5">    
       <asp:Label ID="lblNewsTitle" runat="server" Text="Add News Title "></asp:Label><br />
       <asp:TextBox ID="txtNewsTitle" runat="server" TextMode="MultiLine" ></asp:TextBox>
            <br /><br />
    <asp:TextBox ID="txtNews" runat="server" Width="500px" Height="200px" TextMode="MultiLine"></asp:TextBox>
   <asp:RequiredFieldValidator ID="rfvtxtNews" runat="server" ControlToValidate="txtNews"  ErrorMessage="Required News Description" ForeColor="Red" Font-Size="Small" ></asp:RequiredFieldValidator> 
<br />
      <%-- <asp:HtmlEditorExtender ID="HtmlEditorExtender1" runat="server" TargetControlID="txtNews" EnableSanitization="false">
</asp:HtmlEditorExtender>--%>
  <asp:Label ID="lblactive" runat="server" Text="IsActive"></asp:Label>
  <asp:CheckBox ID="chkactive" runat="server" />
    <asp:Button ID="btnAdd" runat="server" Text="Add News" OnClick="btnAdd_Click" class="btn btn-primary btn-lg" style="margin-left:200px;"  />
             <div class="col-sm-10" id="btnupdate" style="margin-left:150px; margin-top:20px; margin-bottom:20px;">
                <asp:Button ID="btnUpdate" runat="server" class="btn btn-primary btn-lg"  Text="Update" OnClick="btnUpdate_Click" CausesValidation="true"/>
                <asp:Button ID="btnCancel" runat="server"  class="btn btn-primary btn-lg" Text="Cancel" OnClick="btnCancel_Click"  />
                </div></div>
         <asp:HiddenField ID="hdnid" runat="server" />
    <asp:GridView ID="gvNews" runat="server" class="table table-bordered table-hover table-striped" AutoGenerateColumns="false" DataKeyNames="ID"  PageSize="15" 
   Style="font-weight: normal;" OnRowDeleting="gvNews_RowDeleting" OnPageIndexChanging="gvNews_PageIndexChanging" ShowHeaderWhenEmpty="true">
<Columns> 
    <asp:BoundField HeaderText="News Title" DataField="NewsTitle" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="160"  />
    <asp:BoundField HeaderText="News Description" DataField="NewsDescription" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="Created Date" DataField="CreatedDate" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="160"></asp:BoundField>
    <asp:BoundField HeaderText="Is Active" DataField="IsActive" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="160"></asp:BoundField>
    <asp:TemplateField HeaderText="Action" ItemStyle-Width="72" >
        <ItemTemplate>
          <asp:ImageButton ID="imgbtn" ImageUrl="Images/UI_Icons-09-128.png" runat="server" Width="25" Height="25" OnClick="imgbtn_Click" CausesValidation="false"/>
            <asp:ImageButton ID="ButtonDelete" runat="server" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this news?');"  Text="Delete" Width="25" Height="25"  CausesValidation="false" CssClass="input" ImageUrl="Images/minimal-97-128.png" />
        </ItemTemplate>
       </asp:TemplateField>       
</Columns> 
        <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
</asp:GridView>       
                </div>
                </div>
 </asp:Content>
