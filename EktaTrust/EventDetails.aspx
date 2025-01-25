           <%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Inner.Master" CodeBehind="EventDetails.aspx.vb" Inherits="EktaTrust.EventDetails" EnableEventValidation="false" %>
 <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
.container-fluid {
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
    height: 67px;
}
.imgDiv{
    height:190%;
    width:52%;
}

        a {
            padding-left:10px !important;
        }
        span {
            padding-left:10px !important;
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
                <li><a href="ContactDetails.aspx"> Contact Detail</a></li>
                <li><a href="#"> Donation</a></li>
                <li><a href="SUGGESTIONTRUSTACTIVITIES.aspx"> Trust Activities</a></li>
                <li class="active"><a href="EventDetails.aspx">Events</a></li>
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
        <h2 class="admin-heading">Events</h2>
           
    <div class="table-responsive">
        <asp:Label ID="MessageUpdated" runat="server" Text="" ForeColor="Green"></asp:Label>
        <table class="table table-bordered table-hover table-striped">
           
        <tbody>
           
    <tr>
        <td>Search By:
        <asp:DropDownList ID="ddlSearchBy" runat="server" AutoPostBack="True"
            >
        <asp:ListItem Text="All"></asp:ListItem>
        <asp:ListItem Text="Name"></asp:ListItem>
        <asp:ListItem Text="Mobile"></asp:ListItem>             
        </asp:DropDownList> 
    </td><td> Search
            <asp:TextBox ID="txtSearch" runat="server" ></asp:TextBox>
        </td>
         <td>
            Year By:
        <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="True">
        <asp:ListItem Text="2022">2022</asp:ListItem>
        <asp:ListItem Text="2021">2021</asp:ListItem>
        <asp:ListItem Text="2020">2020</asp:ListItem>
        <asp:ListItem Text="2019">2019</asp:ListItem>
        <asp:ListItem Text="2018">2018</asp:ListItem>
        <asp:ListItem Text="2017">2017</asp:ListItem>           
        </asp:DropDownList>
        </td>
        <td>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"/>
                
             <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="Red" Text=""></asp:Label>
        </td>
        <td>
            <asp:Button ID="Button1" runat="server" Text="Export to Excel" OnClick="Button1_Click" class="btn btn-info"/>

            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#EventDetailsModalAdd">Add New</button>

          
        </td>
    </tr>
  
            <asp:GridView ID="gvEvent" runat="server" class="table table-bordered table-hover table-striped" AutoGenerateColumns="false" DataKeyNames="ID"  PageSize="25" 
   onpageindexchanging="gvEvent_PageIndexChanging" OnRowDataBound="gvEvent_RowDataBound" ShowFooter="true"  OnRowDeleting="gvEvent_RowDeleting"  EmptyDataText="No records has been added." Style="font-weight: normal;" >
<Columns> 
    <asp:BoundField HeaderText="Name" DataField="Name" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="Email Address" DataField="EmailID" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="Event" DataField="Event" ItemStyle-HorizontalAlign="Left"></asp:BoundField>   
    <asp:BoundField HeaderText="Address" DataField="Address" ItemStyle-HorizontalAlign="Left"></asp:BoundField>  
    <asp:BoundField HeaderText="T-shirt Size" DataField="ShirtSize" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="Mobile Number" DataField="MobileNumber" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="Registration Date" DataField="CreateDate" ItemStyle-HorizontalAlign="Left" DataFormatString="{0:dd-M-yyyy}" HeaderStyle-Width="10%"></asp:BoundField>
    <asp:BoundField HeaderText="Registration Type" DataField="RegistrationType1" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="10%"></asp:BoundField>
    <asp:BoundField HeaderText="File Name" DataField="AttachedFile" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
  <asp:BoundField HeaderText="Gender" DataField="Gender" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
     <asp:BoundField HeaderText="DOB" DataField="DOB" ItemStyle-HorizontalAlign="Left" DataFormatString="{0:dd-M-yyyy}" HeaderStyle-Width="10%"></asp:BoundField>
 <%--  <asp:BoundField HeaderText="CardHolderName" DataField="CardHolderName" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
   <asp:BoundField HeaderText="CardNumber" DataField="CardNumber" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
   <asp:BoundField HeaderText="CVV" DataField="Gender" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
   <asp:BoundField HeaderText="ExpiryDate" DataField="ExpiryDate" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
   <asp:BoundField HeaderText="PaymentStatus" DataField="PaymentStatus" ItemStyle-HorizontalAlign="Left"></asp:BoundField>--%>
    <%--   <ItemTemplate>
    <%# string.Format("{0:dd/MM/yyyy}", Eval("app_datetime"))%>
 </ItemTemplate>--%>
 <%--<asp:BoundField DataField="DOB" HeaderText="DOB" ItemStyle-HorizontalAlign="Left" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundField>--%>          
            
<%--    <asp:TemplateField ItemStyle-Width="30px" HeaderText="DOB">  
                            <ItemTemplate>  
                                '<%# Eval("DOB", "{0:dd, MMM yyyy}") %>'
                                                     
                                <!-- <%#String.Format("{0:dd/mm/yyyy}", Eval("DOB"))%> -->
                            </ItemTemplate>  
                        </asp:TemplateField>--%>
  <%--  <asp:BoundField HeaderText="DOB" DataField="DOB" ItemStyle-HorizontalAlign="Left"></asp:BoundField>--%>
    
    <asp:TemplateField HeaderText="DownLoad">
        <ItemTemplate>
            <asp:LinkButton ID="lnkDownload" Text = "Download" CommandArgument = '<%# Eval("AttachedFile") %>' runat="server" OnClick="lnkDownload_Click"></asp:LinkButton>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Action" ItemStyle-Width="72" >
        <ItemTemplate>
          <asp:ImageButton ID="imgbtn" ImageUrl="Images/UI_Icons-09-128.png" runat="server" Width="25" Height="25" OnClick="imgbtn_Click" />
          <asp:ImageButton ID="ButtonDelete" runat="server" CommandName="Delete"  Text="Delete" Width="25" Height="25" OnClientClick="return confirm('Are you sure you want to delete this event?');" CssClass="input" ImageUrl="Images/minimal-97-128.png" />
        </ItemTemplate>
     </asp:TemplateField>
</Columns>
     <FooterStyle BackColor="#336699" Font-Bold="True" ForeColor="White" HorizontalAlign="Right" />
</asp:GridView>
           Total Items Count: <asp:Label ID="lblRecords" runat="server" Text="Label"></asp:Label>
<table id="FooterTable" border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse">

    </table>
            
            <asp:Label ID="lblresult" runat="server"/>
         <asp:Button ID="btnShowPopup" runat="server" style="display:none"  CssClass="col-lg-6 col-sm-6 col-md-6"/>
<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlpopup" CancelControlID="btnCancel" BackgroundCssClass="modalBackground">
</ajaxToolkit:ModalPopupExtender>
<asp:Panel ID="pnlpopup" runat="server"   style="display:none">
    <div class = "modal-dialog">
    <div class = "modal-content">
      <div class = "modal-header">
<div border-collapse: inherit; height:100%" cellpadding="0" cellspacing="0" Style="border-bottom: 1px solid #e5e5e5; width:100%">
<tr style="background-color:#D55500">
<td colspan="2" style=" height:10%; color:White; font-weight:bold;  font-size:larger" align="center "  ></td>
<h4>User Event Details</h4>
 </div>    
 <div class="modal-body" >
<div class="form-group">
<label>ContactId: </label>
<asp:Label ID="lblContactId" runat="server" ></asp:Label>
</div>
<div class="form-group">
<label>Name: </label>
<asp:TextBox ID="textName" runat="server" class="form-control" style="width:95%"/>
</div>

<div class="form-group">
<label>Email Address: </label>
<asp:TextBox ID="textEmail" runat="server" class="form-control" style="width:95%"/>
</div>
<div class="form-group">
<label>Mobile Number: </label>
<asp:TextBox ID="textMobile"   runat="server" class="form-control" style="width:95%"/>
</div>
     <div class="form-group">
<label>Event: </label>
<asp:TextBox ID="textEvent" runat="server" class="form-control" style="width:95%"/>
</div>
<div class="form-group">
<label>Gender: </label>
<asp:TextBox ID="textGender" runat="server" class="form-control" style="width:95%"/>
</div>
     <div class="form-group">
<label>DOB: </label>
<asp:TextBox ID="textDOB" runat="server" class="form-control" style="width:95%"/>
</div>

 <div class="form-group">
<label>Address: </label>
<asp:TextBox ID="textAddress" Rows="2" Columns="40" TextMode="MultiLine"   runat="server" class="form-control" style="width:95%"/>
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
          <h4 class="modal-title">Event Registration</h4>
        </div>
        <div class="modal-body">

                    <div class="form-group col-sm-12">
                        <asp:TextBox ID="txtName" CssClass="form-control" MaxLength="20" runat="server" placeholder="Enter Name"></asp:TextBox>
                            <span id="nameError" class="help-block" style="color: red"></span>
                    </div>

                    <div class="form-group col-sm-12">
                        <asp:TextBox ID="txtEmail" CssClass="form-control" MaxLength="20" runat="server" placeholder="Enter Email Id"></asp:TextBox>
                            <span id="emailError" class="help-block" style="color: red"></span>
                    </div>

                    <div class="form-group col-sm-12">
                        <asp:TextBox ID="txtMobile" CssClass="form-control" MaxLength="10" runat="server" placeholder="Enter Mobile Number"></asp:TextBox>
                            <span id="phoneError" class="help-block" style="color: red"></span>
                    </div>
                     <div class="form-group col-sm-12">
                        <asp:DropDownList runat="server" class="form-control" ID="drpEvent">
                            <asp:ListItem value="" disabled Selected="True">Select Run Category</asp:ListItem>
                            <asp:ListItem Value="1">21.09 KM (Half Marathan)</asp:ListItem>
                            <asp:ListItem Value="2">10 KM</asp:ListItem>
                            <asp:ListItem Value="3">5 KM</asp:ListItem>
                        </asp:DropDownList>
                         <%--<span id="eventError" class="help-block" style="color: red"></span>--%>
                    </div>                            
                    <div id="divFileUpload" class="form-group col-sm-12">
                        <asp:FileUpload ID="FileUploadFile" runat="server" CssClass="form-control" />
                        <span id="fileError" class="help-block" style="color: red"></span>
                    </div>

                    <div class="form-group col-sm-12">
                        <asp:DropDownList CssClass="form-control" ID="ddlTShirt" runat="server">
                            <asp:ListItem Value="" disabled Selected>Select Tshirt Size</asp:ListItem>
                            <asp:ListItem Value="1">S-Small</asp:ListItem>
                            <asp:ListItem Value="2">M-Medium</asp:ListItem>
                            <asp:ListItem Value="3">L-Large</asp:ListItem>
                            <asp:ListItem Value="4">XL-Extra large</asp:ListItem>
                            <asp:ListItem Value="5">XXL- Extra Extra Large</asp:ListItem>
                           <asp:ListItem Value="5">XXXL- Extra Extra Extra Large</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group col-sm-12" style="margin-top: 10px; margin-bottom: 10px;">
                        <asp:DropDownList runat="server" class="form-control" ID="drpGender">
                            <asp:ListItem Value="" disabled Selected>Select Gender</asp:ListItem>
                            <asp:ListItem Value="1">Male</asp:ListItem>
                            <asp:ListItem Value="2">Female</asp:ListItem>
                        </asp:DropDownList>
                    
                    </div>
                   <div class="form-group col-sm-12">        
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control form_datetime" style="width:539px" ReadOnly = "true" placeholder="Select Date Of Birth"></asp:TextBox>              
                    <span id="dateError" class="help-block" style="color: red"></span>
                  </div>
                    <div class="form-group col-sm-12">
                        <asp:TextBox ID="txtEName" MaxLength="20" runat="server" CssClass="form-control" placeholder="Emergency Contact Person Name"></asp:TextBox>
                         <span id="ENameError" class="help-block" style="color: red"></span>
                    </div>

                    <div class="form-group col-sm-12">
                        <asp:TextBox ID="txtEmobile" CssClass="form-control" MaxLength="10" runat="server" placeholder="Emergency Contact Number"></asp:TextBox>
                        <%--<span id="EmobileError" class="help-block" style="color: red"></span>--%>
                    </div>
                     <div class="form-group col-sm-12">
                        <asp:TextBox ID="txtAddress" CssClass="form-control" TextMode="MultiLine" MaxLength="100" runat="server" placeholder="Enter Address"></asp:TextBox>
                        <span id="addressError" class="help-block" style="color: red"></span>
                    </div>
                   
            </div>
          
          <div class="modal-footer" style="border-top:0px;border-bottom:1px solid #e5e5e5;">
            <asp:Button ID="btnAddNew" class="btn btn-primary btn-lg" runat="server" Text="Add New" OnClick="btnAddNew_Click1" OnClientClick="return onNextButtonClient()" />
          <button type="button" class="btn btn-primary btn-lg" onclick="clearInformation();" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
       
  </div>
  
  
<script type="text/javascript">

    $(document).ready(function () {
        TotalRecord();
        HideLogdetails();
        $("#divFileUpload").hide();
    });

    function TotalRecord() {
        var totalRowCount = $("[id*=gvEvent] tr").length;
        var rowCount = $("[id*=gvEvent] td").closest("tr").length;
        var message = "Total Items Count: " + rowCount;
        $('#message').text(message);
        return false;
    }

    // this function is used to onclient click to check validation
    function onNextButtonClient() {
        var validation = 1;
        if ($("#<%=txtName.ClientID %>").val() === "") {
            $('#nameError').show();
            $('#nameError').html("Please enter name");
            validation = 0;
        }
        else {
            $('#nameError').hide();
        }
         if ($("#<%=txtEmail.ClientID %>").val() === "") {
            $('#emailError').show();
            $('#emailError').html("Please enter email address");
            validation = 0;
        }
         else
         {
            $('#emailError').hide();
        }

           $("#<%=txtMobile.ClientID %>").keydown(function (e)
            {
                // Allow: backspace, delete, tab, escape, enter and .
                if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
                    // Allow: Ctrl+A, Command+A
                    (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) ||
                    // Allow: home, end, left, right, down, up
                    (e.keyCode >= 35 && e.keyCode <= 40))
                {
                    // let it happen, don't do anything
                    return;
                }
                // Ensure that it is a number and stop the keypress
                if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105))
                {
                    e.preventDefault();
                }
                $('#phoneError').hide();
        });

         if ($("#<%=txtAddress.ClientID %>").val() === "") {
            $('#addressError').show();
            $('#addressError').html("Please enter address");
            validation = 0;
        }
        else {
            $('#addressError').hide();
        }
           if ($("#<%=TextBox1.ClientID %>").val() === "") {
            $('#dateError').show();
            $('#dateError').html("Please enter date of birth");
            validation = 0;
        }
        else {
            $('#dateError').hide();
        }
         if ($("#<%=txtEName.ClientID %>").val() === "") {
            $('#ENameError').show();
            $('#ENameError').html("Please enter emergency name");
            validation = 0;
        }
        else {
            $('#ENameError').hide();
        }

   <%--   if ($("#<%=txtEmobile.ClientID %>").val() === "") {
            $('#EmobileError').show();
            $('#EmobileError').html("Please enter emergency mobile no");
            validation = 0;
        }
        else {
            $('#EmobileError').hide();
        }--%>
         if ($("#<%=txtMobile.ClientID %>").val() === "") {
            $('#phoneError').show();
            $('#phoneError').html("Please enter mobile no");
            validation = 0;
        }
        else {
            $('#phoneError').hide();
        }

         if ($("#<%=TextBox1.ClientID %>").val() === "") {
            $('#dateError').show();
            $('#dateError').html("Please select date of birth");
            validation = 0;
        }
        else {
            $('#dateError').hide();
        }
        if ($("#<%=drpEvent.ClientID %> option:selected").val() === 1) {
            if (document.getElementById('<%= FileUploadFile.ClientID %>').files.length === 0) {
                $('#fileError').show();
                $('#fileError').html("Upload your timing certificate of any 10K Run in last six months for 21.09K Run for Equality.");
                validation = 0;
            }
            else { $('#fileError').hide(); }
        }
        if (validation === 0) {
            return false;
        }
        else { return true; }
    }

    // this function is used to hide error name
    $("#<%=txtName.ClientID %>").click(function () {
        $('#nameError').hide();
    });

    // This function is used to hide file error message 
    $("#<%=FileUploadFile.ClientID %>").click(function () {
        $('#fileError').hide();
    });
     $("#<%=TextBox1.ClientID %>").click(function () {
        $('#dateError').hide();
    });
     $("#<%=txtEmail.ClientID %>").click(function () {
        $('#emailError').hide();
    });
      $("#<%=txtMobile.ClientID %>").click(function () {
        $('#phoneError').hide();
    });
    $("#<%=txtAddress.ClientID %>").click(function () {
        $('#addressError').hide();
    });
      $("#<%=txtEName.ClientID %>").click(function () {
        $('#ENameError').hide();
    });
      $("#<%=txtEmobile.ClientID %>").click(function () {
        $('#EmobileError').hide();
    });

    

    // This function is used to Show and Hide file Upload div 
    $("#<%=drpEvent.ClientID %>").change(function () {
        if ($("#<%=drpEvent.ClientID %> option:selected").val() === 1) {
            $("#divFileUpload").show();
        }
        else {
            $("#divFileUpload").hide();
            $('#fileError').hide();
        }
    });

    function clearInformation() {
        $("#<%=txtName.ClientID %>").val('');
        $("#<%=txtAddress.ClientID %>").val('');
        $("#<%=txtEmail.ClientID %>").val('');
        $("#<%=txtEmobile.ClientID %>").val('');
        $("#<%=txtEName.ClientID %>").val('');
        $("#<%=txtMobile.ClientID %>").val('');
        $("#<%=TextBox1.ClientID %>").val('');
        $('#fileError').hide();
        $('#nameError').hide();
        $('#emailError').hide();
        $('#phoneError').hide();
        $('#addressError').hide();
        $('#ENameError').hide();
        $('#EmobileError').hide();
        $('#dateError').hide();

    }


    function HideLogdetails() {
        var name = '<%=Session("RoleId") %>';
        if (name === 2) {
            $('#LogDetails').hide();
        }
        else {
            $('#LogDetails').show();
        }
    }

</script>
<%--     <script src="Js/jquery-1.11.3.min.js"></script>--%>
<%--    <script src="ScriptLibrary/jquery.dynDateTime.min.js"></script>
    <script src="ScriptLibrary/calendar-en.min.js"></script>
    <link href="Css/calendar-blue.css" rel="stylesheet" />--%>
   <script src="Css/DAtetimePicker/bootstrap-datetimepicker.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
       <%-- $("#<%=TextBox1.ClientID %>").dynDateTime({
            showsTime: true,
            ifFormat: "%Y/%m/%d %H:%M",
            daFormat: "%l;%M %p, %e %m, %Y",
            align: "BR",
            electric: false,
            singleClick: false,
            displayArea: ".siblings('.dtcDisplayArea')",
            button: ".next()"
        });--%>
        $("#<%=TextBox1.ClientID %>").datetimepicker(
        {format: 'yyyy-mm-dd hh:ii'});
    });
</script>
 <%--<script src="Css/DAtetimePicker/bootstrap-datetimepicker.js"></script>--%>
<script type="text/javascript">
    $(document).ready(function () {
       <%-- $("#<%=TextBox1.ClientID %>").dynDateTime({
            showsTime: true,
            ifFormat: "%Y/%m/%d %H:%M",
            daFormat: "%l;%M %p, %e %m, %Y",
            align: "BR",
            electric: false,
            singleClick: false,
            displayArea: ".siblings('.dtcDisplayArea')",
            button: ".next()"
        });--%>
        $("#<%=textDOB.ClientID %>").datetimepicker(
        {format: 'yyyy-mm-dd hh:ii'});
    });
</script>

</asp:Content>
