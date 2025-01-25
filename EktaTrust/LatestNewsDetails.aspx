<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Inner.Master" CodeBehind="LatestNewsDetails.aspx.vb" Inherits="EktaTrust.LatestNewsDetails" %>

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
 .panel-primary>.panel-heading {
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
            width:21%;
            font-size: 17px;
            
        }
        

   
    </style>

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
                                <li class="active"><a href="SendNotificationMIP.aspx">Send Notification</a></li>
                                <li><a href="ModificationEmailAndSms.aspx">New Template</a></li>
                                <li><a href="TemplateListing.aspx">Templates</a></li>
                                <li><a href="LogDetails.aspx" id="LogDetails">Log Details</a></li>
                                <li><a href="UserDetails.aspx">Users</a></li>
                                <li><a href="MatrimonialDetails.aspx">Matrimonial Details</a></li>
                                <li><a href="CareerCounsellingDetails.aspx">Career Counselling Details</a></li>
                                <li><a href="AtrocityReportingDetails.aspx">Atrocities Reporting Details</a></li>
                                <li><a href="AddNotification.aspx">Add New Notification</a></li>
                                <li><a href="DonationDetails.aspx">Donation Details</a></li>
                                <li><a href="DonationDetails.aspx">Add News</a></li>
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
                 
   <div class="form-group col-sm-6" id="divAddNews">
          <asp:Label ID="lblMessage" runat="server" ></asp:Label></h2>
        <asp:TextBox ID="txtBoxTitle" runat="server" Rows="2" Columns="30" TextMode="multiline" class="form-control" placeholder="Title"></asp:TextBox>
                        <asp:TextBox ID="AddNewsLatest" runat="server" Rows="10" Columns="30" TextMode="multiline" class="form-control" placeholder="Write Latest New"></asp:TextBox>
                    </div>
      <div class="form-group col-sm-6">
                        <%--<input type="button"  class="btn btn-primary btn-lg"  value="Add Latest News" runat="server"  ></input>--%>
                       <%-- <asp:Button ID="Button1" runat="server" class="btn btn-info" value="Send Notification"  Text="Send Notification" OnClientClick="GetAllSelectNotificationValue()"/>--%>
          <asp:Button ID="ButtonSubmitMessage" runat="server" class="btn btn-info" value="Add News"  Text="Add News" />
              </div>
     <asp:GridView ID="gridViewNotification" runat="server" DataKeyNames="Newid" OnRowDataBound="gridViewNews_RowDataBound"
            OnRowEditing="gridViewNotification_RowEditing" OnRowCancelingEdit="gridViewNotification_RowCancelingEdit" OnRowUpdating="gridViewNotification_RowUpdating" 
            OnRowDeleting="gridViewNotification_RowDeleting" EmptyDataText="No records has been added."
            AutoGenerateEditButton="true" AutoGenerateDeleteButton="true" AutoGenerateColumns="false" style="margin-left:30%">
            <Columns>
                 <asp:BoundField HeaderText="Title" DataField="Title" ItemStyle-HorizontalAlign="Left" />
            
              <%--  <asp:TemplateField HeaderText="Title">
                    <ItemTemplate>
                       <asp:Label ID="Title" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTitle"  runat="server" Text='<%# Bind("Title") %>' TextMode="Date"></asp:TextBox>"
                    </EditItemTemplate>
                </asp:TemplateField>--%>
                  <asp:TemplateField HeaderText="NewsDescription">
                    <ItemTemplate>
                       <asp:Label ID="lblNewDescription" runat="server" Text='<%# Bind("NewDescription") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="lblNewsDescription"  runat="server" Text='<%# Bind("NewDescription") %>' TextMode="MultiLine"></asp:TextBox>"
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CreatedDate">
                    <ItemTemplate>
                       <asp:Label ID="lblCreatedDate" runat="server" Text='<%# Bind("CreatedDate") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="lblCreatedDate"  runat="server" Text='<%# Bind("CreatedDate") %>' TextMode="Date"></asp:TextBox>"
                    </EditItemTemplate>
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="IsDeleted">
                    <ItemTemplate>
                       <asp:Label ID="lblIsDeleted" runat="server" Text='<%# Bind("IsDeleted") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="lblIsDeleted"  runat="server" Text='<%# Bind("IsDeleted") %>' TextMode="Date"></asp:TextBox>"
                    </EditItemTemplate>
                </asp:TemplateField>
                   <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HiddenField ID="hideNotificationID" runat="server" Value='<%# Eval("Newid") %>' />
                        <%--<asp:HiddenField ID="hideCreatedBy" runat="server" Value='<%# Eval("CreatedBy") %>' />--%>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
             </div>
      
    </div>

   <style>

       .activeTab { width:100%; padding:30px 0 20px 0; background:#fff; } 
.active { background: #f0f0f0; }

     .mybtn{
background-color:#428bca;
}

.expand{
background-color:red;
}
   </style>
</asp:Content>
