<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Inner.Master" CodeBehind="ManageNews.aspx.vb" Inherits="EktaTrust.ManageNews" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       /* .table {
            width: 80%;
            margin-bottom: 20px;
          
        }*/
   

    </style>
</asp:Content>
 <%@ Register Src="~/Controls/AdminSideMenuControl.ascx" TagPrefix="ucSM" TagName="AdminSideMenuControl" %> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid main-container">
       
    <div class="col-md-2 sidebar">
        <div class="row">
            <!-- uncomment code for absolute positioning tweek see top comment in css -->
            <div class="absolute-wrapper"></div>
            <!-- Menu -->
           <ucSM:AdminSideMenuControl runat="server" id="AdminSideMenuControl" />
        <%--    <div class="side-menu">
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
            </div>--%>
        </div>
    </div> 


            <div class="col-md-10 ">    
                <h2 class="admin-heading">Manage News</h2>
                      <asp:Label ID="lblMessage" runat="server" style="font-size:medium"></asp:Label><br /> 
        <div class="card" style="margin-top:unset;">    
             <!-- News Title -->
                <div class="form-group mb-3">
                    <label>News Title:</label>
                    <asp:TextBox ID="txtNewsTitle" runat="server" 
                        CssClass="form-control" TextMode="MultiLine" Rows="2" />
                </div>
             <!-- News Description -->
                <div class="form-group mb-3">
                       <label>News Description:</label>
                    <asp:TextBox ID="txtNews" runat="server"
                        CssClass="form-control" TextMode="MultiLine" Rows="6" />

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ControlToValidate="txtNews"
                        ErrorMessage="News Description is required"
                        ForeColor="Red" Font-Size="Small" />
                </div>
              <!-- Active Checkbox -->
                <div class="form-group form-check mb-3">
                    <asp:CheckBox ID="chkactive" runat="server" CssClass="form-check-input" />
                    <asp:Label ID="lblactive" runat="server" Text="Is Active" CssClass="form-check-label ms-2" />
                </div>
                 <!-- Buttons -->
                <div class="d-flex justify-content-center gap-3 mt-4">

                    <asp:Button ID="btnAdd" runat="server"
                        Text="Add News"
                        OnClick="btnAdd_Click"
                        CssClass="btn btn-success btn-lg px-4" />

                    <asp:Button ID="btnUpdate" runat="server"
                        Text="Update"
                        OnClick="btnUpdate_Click"
                        CssClass="btn btn-primary btn-lg px-4"
                        CausesValidation="true" />

                    <asp:Button ID="btnCancel" runat="server"
                        Text="Cancel"
                        OnClick="btnCancel_Click"
                        CssClass="btn btn-secondary btn-lg px-4" />

                </div>
</div>
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
          <asp:ImageButton ID="imgbtn" ImageUrl="../Images/edit.png" runat="server" Width="15" Height="15" OnClick="imgbtn_Click" CausesValidation="false"/>
            <asp:ImageButton ID="ButtonDelete" runat="server" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this news?');"  Text="Delete" Width="15" Height="15"  CausesValidation="false" CssClass="input" ImageUrl="Images/minimal-97-128.png" />
        </ItemTemplate>
       </asp:TemplateField>       
</Columns> 
        <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
</asp:GridView>       
                </div>
                </div>
 </asp:Content>
