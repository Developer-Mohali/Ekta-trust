<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Inner.Master" CodeBehind="AddNotification.aspx.vb" Inherits="EktaTrust.AddNotification" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
           <script>
function ContactUsEvent() {  
            
    var AddNotification = {};
    AddNotification.Message = $("#NewMessage").val();
    AddNotification.startDate = $("#StartDate").val();
    AddNotification.EndDate = $("#EndDate").val();
    //contactUs.EmailId = $("#txtemail").val();
    //Register.Distance = $("#txtdistance").val();
    //Register.Tshirt = $("#txtTshirt").val();
  
  
            $.ajax({  
                url:"<%=Page.ResolveUrl("/EktaTrust/NotificationSend/MessageToAdmin")%>",   
                type: "POST",  
                contentType: "application/json;charset=utf-8",  
                data: JSON.stringify(Register),  
                dataType: "json",  
                success: function (response) {  
  
                    alert(response);           
  
                },  
  
                error: function (x, e) {  
                    alert('Failed');  
                    alert(x.responseText);  
                    alert(x.status);  
  
                }  
            });   
        }       
   
        $(document).ready(function ()  
         {   
            $("#btnSave").click(function (e) {
                ContactUsEvent();
                e.preventDefault();  
            });    
        });  
  
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <%-- <h1>notification</h1>--%>
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
                    <!-- /.navbar-collapse -->
                </nav>
            </div>
        </div>
    </div>
    <div>
    <div class="form-group col-sm-offset-3 col-sm-6" id="divSendSmsAnonymous" style="margin-left:12%">
        <div class="panel-heading" style="color: #777">
            Write a Message  <span class="label label-danger" id="mobileMessage"></span>
            <div class="pull-right" style="padding-bottom: 8px;">
                <asp:DropDownList ID="drpMobileMessage" runat="server" class="form-control">
                </asp:DropDownList>
            </div>
            <div style="float: left; margin-right: 5px">
                <input type="checkbox" id="checkBoxMobile"/></div>
        </div>
        <asp:TextBox ID="NewMessage" runat="server" Rows="10" Columns="30" TextMode="multiline" class="form-control" placeholder="Write a Message"></asp:TextBox>
        <div>
            <div class="panel-heading" style="color: #777">
                Start Date
         <input type="date" id="startDate" runat="server" />
          <%--  </div>
            <div class="panel-heading" style="color: #777">--%>
                End Date
         <input type="date" id="EndDate" runat="server" />
            </div>
        </div>
   <%-- </div>
    <div id="panel" class="form-group col-sm-offset-3 col-sm-6" style="margin-left:12%">--%>
        <span class="label label-success" id="spnMessageNotification" style="margin-left: 46%"></span>
        <br />
        <br />
        <asp:Button ID="btnSaveNotification" runat="server" class="btn btn-info" value="Send Notification" Text="Send Notification" OnClick="btnSaveNotification_Click" />

    </div>
    <div>
        <asp:Label ID="Label1" runat="server" ></asp:Label>
    </div>
   
        <asp:GridView ID="gridViewNotification" runat="server" DataKeyNames="NotificationID" OnRowDataBound="gridViewNotification_RowDataBound"
            OnRowEditing="gridViewNotification_RowEditing" OnRowCancelingEdit="gridViewNotification_RowCancelingEdit" OnRowUpdating="gridViewNotification_RowUpdating" 
            OnRowDeleting="gridViewNotification_RowDeleting" EmptyDataText="No records has been added."
            AutoGenerateEditButton="true" AutoGenerateDeleteButton="true" AutoGenerateColumns="false" style="margin-left:30%">
            <Columns>
                 <asp:BoundField HeaderText="Message" DataField="Message" ItemStyle-HorizontalAlign="Left" />
            
                <asp:TemplateField HeaderText="Start Date">
                    <ItemTemplate>
                       <asp:Label ID="lblStartDate" runat="server" Text='<%# Bind("Startdate") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtStartDate"  runat="server" Text='<%# Bind("Startdate") %>' TextMode="Date"></asp:TextBox>"
                    </EditItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="End Date">
                    <ItemTemplate>
                       <asp:Label ID="lblEndDate" runat="server" Text='<%# Bind("EndDate") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEndDate"  runat="server" Text='<%# Bind("EndDate") %>' TextMode="Date"></asp:TextBox>"
                    </EditItemTemplate>
                </asp:TemplateField>
                   <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HiddenField ID="hideNotificationID" runat="server" Value='<%# Eval("NotificationID") %>' />
                        <asp:HiddenField ID="hideCreatedBy" runat="server" Value='<%# Eval("CreatedBy") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    <%-- <asp:GridView ID="gridViewNotification" class="form-group col-sm-offset-3 col-sm-6" runat="server">
            <Columns>
                <asp:BoundField HeaderText="Message" DataField="Message" ItemStyle-HorizontalAlign="Left" />
                <asp:BoundField HeaderText="Start Date" DataField="StartDate" ItemStyle-HorizontalAlign="Left" />
                <asp:BoundField HeaderText="End Date" DataField="EndDate" ItemStyle-HorizontalAlign="Left" />
                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:Button ID="btnEditNotification" runat="server" Text="Edit" OnClick="btnEditNotification_Click" />
                        <asp:HiddenField ID="hideNotificationID" runat="server" Value='<%# Eval("NotificationID") %>' />
                        <asp:HiddenField ID="hideCreatedBy" runat="server" Value='<%# Eval("CreatedBy") %>' />
                    </ItemTemplate>
                </asp:TemplateField>--%>
              <%--  <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:Button ID="btnDeleteNotification" runat="server" Text="Delete" OnClick="btnDeleteNotification_Click"/>
                    </ItemTemplate>
                    
                </asp:TemplateField>
            </Columns>
            <%--    <Columns> 
    
    <asp:BoundField HeaderText="Message" DataField="Message" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="Start Date" DataField="StartDate" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="End Date" DataField="EndDate" ItemStyle-HorizontalAlign="Left"></asp:BoundField>   
     <asp:TemplateField HeaderText="DownLoad">
            <ItemTemplate>
           <asp:LinkButton ID="lnkDownload" Text = "Download" CommandArgument = '<%# Eval("UploadFile") %>' runat="server" OnClick="lnkDownload_Click"></asp:LinkButton>
            </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Action" ItemStyle-Width="72" >
        <ItemTemplate>
          <asp:ImageButton ID="imgbtn" ImageUrl="Images/UI_Icons-09-128.png" runat="server" Width="25" Height="25" OnClick="imgbtn_Click"/>
            <asp:ImageButton ID="ButtonDelete" runat="server" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this event?');"  Text="Delete" Width="25" Height="25"  CssClass="input" ImageUrl="Images/minimal-97-128.png" />
            
        </ItemTemplate>
       </asp:TemplateField>
    
            <asp:CommandField ButtonType="Link"  ItemStyle-Width="62"/>
</Columns>
        </asp:GridView> --%> 
    
        </div>
</asp:Content>
