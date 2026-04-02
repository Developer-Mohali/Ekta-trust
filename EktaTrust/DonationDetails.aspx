<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Inner.Master" CodeBehind="DonationDetails.aspx.vb" Inherits="EktaTrust.DonationDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%--    <script src="../Js/jquery.blockUI.js"></script>--%>
     <%@ Register Src="~/Controls/AdminSideMenuControl.ascx" TagPrefix="ucSM" TagName="AdminSideMenuControl" %> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
  <style type="text/css">
     .modalBackground
        {
            background-color: Gray;
            filter: alpha(opacity=80);
            opacity: 0.8;
            z-index: 10000;
        }
     .container-fluid 
        {
            padding-right: 15px;
            padding-left: 15px;
            margin-right: auto;
            margin-left: auto;
            height: 67px;
        }
     .imgDiv
        {
            height:190%;
            width:52%;
        }
       a 
        {
            padding-left:10px !important;
        }
       span 
        {
            padding-left:10px !important;
        }
</style>
    <div class="container-fluid main-container">
         <div class="col-md-2 sidebar">
            <%-- <div class="row"> 
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
                      <li ><a href="EventDetails.aspx">Events</a></li>
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
                      <li class="active"><a href="DonationDetails.aspx">Donation Details</a></li>
                         <li><a href="CertificationReport.aspx">Certification</a></li>
                        <li><a href="FeedbackAndSuggestion.aspx">Feedback And Suggestion</a></li>
                   </ul>                
                 </div>
               <!-- /.navbar-collapse --> 
               </nav>
               </div>
            </div>--%>
            <div class="row"> 
                  <!-- uncomment code for absolute positioning tweek see top comment in css -->
                  <div class="absolute-wrapper"> </div>
                  <!-- Menu -->
                   <ucSM:AdminSideMenuControl runat="server" id="AdminSideMenuControl" />
            </div>
         </div>
         <div class="col-md-10 ">
             <h2 class="admin-heading">Donation Details</h2>           
             <div class="table-responsive">
                 <asp:Label ID="MessageUpdated" runat="server" Text="" ForeColor="Green" style="margin-left:411px"></asp:Label>
                 <table class="table table-bordered table-hover table-striped">         
                   <tbody>          
                      <tr>
                        <td>
                          Search By:
                         <asp:DropDownList ID="ddlSearchBy" runat="server" AutoPostBack="True" >          
                            <asp:ListItem Text="All"></asp:ListItem>
                            <asp:ListItem Text="Full Name"></asp:ListItem>                   
                            <asp:ListItem Text="Payment Status"></asp:ListItem>                   
                         </asp:DropDownList> 
                        </td>
                        <td> 
                           Search
                           <asp:TextBox ID="txtSearch" runat="server" autocomplete="off"></asp:TextBox>
                        </td>
                        <td>
                            Year By:
                            <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="True">
                                <asp:ListItem Selected Text="2026">2026</asp:ListItem>
                                <asp:ListItem Text="2025">2025</asp:ListItem>
                              <%--<asp:ListItem Text="2017">2017</asp:ListItem>      --%>     
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"/>
                            <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="Red" Text=""></asp:Label>
                        </td>
                        <td>                
                          <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#EventDetailsModalAdd">Add New</button>     
                        </td>
                      </tr>  
                                    
                <asp:GridView ID="gvEvent" runat="server" class="table table-bordered table-hover table-striped" AutoGenerateColumns="false" DataKeyNames="DonationID"  PageSize="25" 
                  onpageindexchanging="gvEvent_PageIndexChanging" OnRowDataBound="gvEvent_RowDataBound" ShowFooter="true"  OnRowDeleting="gvEvent_RowDeleting"  EmptyDataText="No records has been added." Style="font-weight: normal;" >
                <Columns> 
                   <asp:BoundField HeaderText="Full Name" DataField="FullName" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                   <asp:BoundField HeaderText="Amount" DataField="Amount" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                   <asp:BoundField HeaderText="Mobile Number" DataField="MobileNumber" ItemStyle-HorizontalAlign="Left"></asp:BoundField>   
                   <asp:BoundField HeaderText="Mode Of Payment" DataField="ModeOfPayment" ItemStyle-HorizontalAlign="Left"></asp:BoundField>  
                   <asp:BoundField HeaderText="Pan Number" DataField="PanNuber" ItemStyle-HorizontalAlign="Left"></asp:BoundField>   
                   <asp:BoundField HeaderText="Payment Status" DataField="PaymentStatus" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                 <%--  <asp:BoundField HeaderText="Comments" DataField="Comments" ItemStyle-HorizontalAlign="Left"></asp:BoundField>  --%>           
                   <asp:BoundField HeaderText="Address" DataField="Address" ItemStyle-HorizontalAlign="Left"></asp:BoundField>   
                     <asp:BoundField HeaderText="OrderId" DataField="OrderId" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                   <asp:BoundField HeaderText="Donated On" DataField="CreatedDate" ItemStyle-HorizontalAlign="Left"></asp:BoundField> 
                   <asp:BoundField HeaderText="TransId" DataField="TxnId" ItemStyle-HorizontalAlign="Left"></asp:BoundField> 
                  <asp:TemplateField HeaderText="Action" ItemStyle-Width="72" >
                      <ItemTemplate>
                          <asp:ImageButton ID="imgbtn" ImageUrl="Images/UI_Icons-09-128.png" runat="server" Width="25" Height="25" OnClick="imgbtn_Click" />
                          <asp:ImageButton ID="ButtonDelete" runat="server" CommandName="Delete" Text="Delete" Width="25" Height="25" OnClientClick="return confirm('Are you sure you want to delete this event?');" CssClass="input" ImageUrl="Images/minimal-97-128.png" />
                        <!-- Certificate -->
                        <asp:LinkButton ID="btnCertificate" runat="server" ToolTip="Generate Certificate" OnClick="generate_Certificate">
                            <i class="fa fa-file-pdf-o" style="color:red; font-size:18px;"></i>Cert
                        </asp:LinkButton>
                      </ItemTemplate>
                  </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#336699" Font-Bold="True" ForeColor="White" HorizontalAlign="Right" />
                </asp:GridView>
              
                  Total Items Count: <asp:Label ID="lblRecords" runat="server" Text="Label"></asp:Label>
                <table id="FooterTable" border="1" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
                </table>
                                 
            <asp:Label ID="lblresult" runat="server"/>
             <asp:Button ID="btnShowPopup" runat="server" style="display:none"  CssClass="col-lg-6 col-sm-6 col-md-6"/>
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlpopup" CancelControlID="btnCancel" BackgroundCssClass="modalBackground">
        </ajaxToolkit:ModalPopupExtender>
            <asp:Panel ID="pnlpopup" runat="server" style="display:none">
                 <div class = "modal-dialog">
                   <div class = "modal-content">
                     <div class = "modal-header">
                       <div border-collapse: inherit; height:100%" cellpadding="0" cellspacing="0" Style="border-bottom: 1px solid #e5e5e5; width:100%">
                         <tr style="background-color:#D55500">
                         <td colspan="2" style=" height:10%; color:White; font-weight:bold;  font-size:larger" align="center "  ></td>
                         <h4>Donation Details</h4>
                       </div>    
                       <div class="modal-body" >
                          <div class="form-group">
                            <label>DonationID: </label>
                            <asp:Label ID="lblDonationId" runat="server" ></asp:Label>
                          </div>
                          <div class="form-group">
                            <label>Full Name: </label>
                            <asp:TextBox ID="textFullName" runat="server" class="form-control" style="width:95%"/>
                          </div>

                          <div class="form-group">
                            <label>Amount: </label>
                            <asp:TextBox ID="textAmount" runat="server" class="form-control" style="width:95%"/>
                          </div>
    
                          <div class="form-group">
                            <label>Mobile Number: </label>
                            <asp:TextBox ID="textMobileNumber" runat="server" class="form-control" style="width:95%"/>
                          </div>

                         <div class="form-group" style="width: 95%">
                           <label>Mode Of Payment: </label>
                           <asp:DropDownList CssClass="form-control" ID="ddlModeOfPayment"  runat="server">
                             <asp:ListItem value="Select">Select Payment Way</asp:ListItem>
                             <asp:ListItem Value="Credit Card">Credit Card</asp:ListItem>
                             <asp:ListItem Value="Debit card">Debit Card</asp:ListItem>
                             <asp:ListItem Value="Net Banking">Net Banking</asp:ListItem>                      
                           </asp:DropDownList>
                         </div>

                          <div class="form-group">
                            <label>Comments </label>
                            <asp:TextBox ID="textComments" runat="server" class="form-control" style="width:95%"/>                          
                          </div>
                                                   
                          <div class="form-group">
                           <asp:Button ID="btnUpdate" CommandName="Update" runat="server" class="btn btn-primary btn-lg"  Text="Update" OnClick="btnUpdate_Click"/>
                           <asp:Button ID="btnCancel" runat="server"  class="btn btn-primary btn-lg" Text="Cancel" />
                          </div>
                           
                       </div>       
                     </div>
                  </div>
                </div>
            </asp:Panel>                    
       </tbody>
      </table>
             </div>
         </div>
    </div>
        

  <!-- Modal -->
  <div class="modal fade" id="EventDetailsModalAdd" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" onclick="clearInformation();" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Donation Details</h4>
        </div>
        <div class="modal-body">

                    <div class="form-group col-sm-12">
                        <asp:TextBox ID="txtFullName" CssClass="form-control" MaxLength="20" runat="server" placeholder="Enter FullName" AutoComplete="off"></asp:TextBox>
                            <span id="nameError" class="help-block" style="color: red"></span>
                    </div>

                    <div class="form-group col-sm-12">
                        <asp:TextBox ID="txtAmount" CssClass="form-control" MaxLength="20" runat="server" placeholder="Enter Amount" AutoComplete="off"></asp:TextBox>
                            <span id="amountError" class="help-block" style="color: red"></span>
                    </div>
                    <div class="form-group col-sm-12">
                        <asp:TextBox ID="txtMobileNumber" CssClass="form-control" MaxLength="10" runat="server" placeholder="Enter Mobile Number" AutoComplete="off"></asp:TextBox>
                            <span id="mobileNumberError" class="help-block" style="color: red"></span>
                    </div>
               
                   <div class="form-group col-sm-12">
                           <asp:DropDownList CssClass="form-control" ID="ddlModeOfPayment1" runat="server">
                             <asp:ListItem Value="Select">Select Payment Way</asp:ListItem>
                               <asp:ListItem Value="Credit Card">Credit Card</asp:ListItem>
                             <asp:ListItem Value="Debit Card">Debit Card</asp:ListItem>
                             <asp:ListItem Value="Net Banking">Net Banking</asp:ListItem>                                       
                          </asp:DropDownList>
                         </div>

                    <div class="form-group col-sm-12">
                        <asp:TextBox ID="txtComments" CssClass="form-control" TextMode="MultiLine" MaxLength="700" runat="server" placeholder="Enter Comment" AutoComplete="off"></asp:TextBox>
                         <span id="commentsError" class="help-block" style="color: red"></span>
                    </div>
            </div>
        <div class="modal-footer" style="border-top:0px;border-bottom:1px solid #e5e5e5;">
            <asp:Button ID="btnAddNew" class="btn btn-default" runat="server" Text="Add New" OnClick="btnAddNew_Click1" OnClientClick="return onNextButtonClient()" />
          <button type="button" class="btn btn-default" onclick="clearInformation();" data-dismiss="modal">Close</button>

        </div>
      </div>
      
    </div>
  </div>        
<script type="text/javascript">
    $(document).ready(function () {
        var msg = $('#<%= lblmsg.ClientID %>');
            if (msg && msg.text().trim() !== "") {
                setTimeout(function () {
                    msg.fadeOut();     // hides with animation
                    msg.text('');      // clears the message content
                }, 5000); // 5000ms = 5 seconsds
            }
    });

    $(document).ready(function () {
       
        TotalRecord();
    });
       
    function TotalRecord() {
        var totalRowCount = $("#gvEvent tr").length;
        var rowCount = $("#gvEvent td").closest("tr").length;
        var message = "Total Items Count: " + rowCount;
        $('#message').text(message);
        return false;
    }
    // This function is used to onclient click to check validation
    function onNextButtonClient() {
        var validation = 1;
        if ($("#<%=txtFullName.ClientID %>").val() == "")
        {
            $('#nameError').show();
            $('#nameError').html("Please Enter Name");
            validation = 0;
        }
        else
        {
            $('#nameError').hide();
        }     
        if ($("#<%=txtAmount.ClientID %>").val() == "")
        {
            $('#amountError').show();
            $('#amountError').html("Please Enter Amount");
            validation = 0;
        }
        else
        {
            $('#amountError').hide();
        }
        if ($("#<%=txtMobileNumber.ClientID %>").val() == "")
        {
            $('#mobileNumberError').show();
            $('#mobileNumberError').html("Please Enter Mobile Number");
            validation = 0;
        }
        else
        {
            $('#mobileNumberError').hide();
        }
        if ($("#<%=ddlModeOfPayment1.ClientID %>").val() == "")
        {
            $('#modeOfPaymentError').show();
            $('#modeOfPaymentError').html("Please Enter Mode Of payement");
            validation = 0;
        }
        else
        {
            $('#modeOfPaymentError').hide();
        }
        if ($("#<%=txtComments.ClientID %>").val() == "")
        {
            $('#commentsError').show();
            $('#commentsError').html("Please Enter Comment");
            validation = 0;
        }
        else
        {
            $('#commentsError').hide();
        }       
        if (validation == 0)
        {
            return false;
        }
        else { return true }
    }

    // This function is used to hide error name
    $("#<%=txtFullName.ClientID %>").click(function () {
        $('#nameError').hide();
    });
    $("#<%=txtAmount.ClientID %>").click(function () {
        $('#amountError').hide();
    });
    $("#<%=txtMobileNumber.ClientID %>").click(function () {
        $('#mobileNumberError').hide();
    });
    $("#<%=ddlModeOfPayment1.ClientID %>").click(function () {
        $('#modeOfPaymentError').hide();
    });
    $("#<%=txtComments.ClientID %>").click(function () {
        $('#commentsError').hide();
    });
 
    function clearInformation()
    {
        $("#<%=txtFullName.ClientID %>").val('');
        $("#<%=txtAmount.ClientID %>").val('');
        $("#<%=txtMobileNumber.ClientID %>").val('');
        $("#<%=ddlModeOfPayment1.ClientID %>").val('');
        $("#<%=txtComments.ClientID %>").val('');
        $('#nameError').hide();
    }

</script>
</asp:Content>
