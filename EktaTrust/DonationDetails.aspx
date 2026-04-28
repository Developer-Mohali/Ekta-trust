<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Inner.Master" CodeBehind="DonationDetails.aspx.vb" Inherits="EktaTrust.DonationDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
<%--    <script src="../Js/jquery.blockUI.js"></script>--%>
<script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.12.0/jquery.validate.min.js"  type="text/javascript"></script> 
     <%@ Register Src="~/Controls/AdminSideMenuControl.ascx" TagPrefix="ucSM" TagName="AdminSideMenuControl" %> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
  <style type="text/css">
    /* .modalBackground
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
        }*/
       .table a 
        {
                    color: #337ab7;
            padding-left:10px !important;
        }
         td span{
             padding-left:10px !important;
        }
        .btn{
             height: fit-content;
         }
         hr{
            margin-top: 10px;
            margin-bottom: 10px;
         }
        .truncate-address {
    display: inline-block;
    max-width: 100px;   /* adjust as needed */
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    cursor: pointer;
}
         .wrap-text {
            word-break: break-all;      /* breaks long strings */
            white-space: normal;        /* allow multiple lines */
            max-width: 120px;           /* control column width */
        }
</style>
    <div class="container-fluid main-container">
         <div class="col-md-2 sidebar">
            <div class="row"> 
                  <!-- uncomment code for absolute positioning tweek see top comment in css -->
                  <div class="absolute-wrapper"> </div>
                  <!-- Menu -->
                   <ucSM:AdminSideMenuControl runat="server" id="AdminSideMenuControl" />
            </div>
         </div>
         <div class="col-md-10 ">
                <!-- Header -->
               <div class="header-admin">
                   <div><h2 class="">Donation Details</h2></div>
                    <div>
                        <button class="btn btn-primary" title="Refresh Payment Status" onclick="updatePaytmenStatus()">Refresh Payment</button>
                        <asp:Button ID="btnAddBIB" runat="server" Text="Add New" CssClass="btn btn-success" OnClick="btnAddNew_Click" />
                    </div>
               </div>
         <%--    <h2 class="admin-heading">Donation Details</h2>     --%>      
             <div class="table-responsive">
                 <asp:Label ID="MessageUpdated" runat="server" Text="" ForeColor="Green"></asp:Label>
                 <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="Red" Text=""></asp:Label>
                
                <div class="card search-card">

                    <!-- 🔍 Search Row -->
                    <div class="row align-items-center">
                        <!-- Main Search -->
                        <div class="col-md-4" style="display:none;">
                            <label>Search By:</label>
                              <asp:DropDownList ID="ddlSearchBy" runat="server" CssClass="form-control" AutoPostBack="false" >          
                                   <asp:ListItem Text="All"></asp:ListItem>
                                   <asp:ListItem Text="Full Name"></asp:ListItem>                   
                                   <asp:ListItem Text="Payment Status"></asp:ListItem>                   
                                </asp:DropDownList>
                        </div>
                        <div class="col-md-4">
                            <label>Search</label>
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Name / Payment Status / OrderId" autocomplete="off"></asp:TextBox>
                        </div>

                        <!-- Year -->
                        <div class="col-md-2">
                            <label>Year</label>
                            <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-control" AutoPostBack="false">
                                <asp:ListItem Text="2026" Value="2026" Selected="True" />
                                <asp:ListItem Text="2025" Value="2025" />
                                <asp:ListItem Text="2024" Value="2024" />
                            </asp:DropDownList>
                        </div>

                        <!-- Search Button -->
                        <div class="col-md-6 d-flex align-items-end cus-buttons">
                            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary w-100" OnClick="btnSearch_Click" />
                             <asp:Button ID="btnExport" runat="server" CssClass="btn btn-primary" Text="Export to Excel" OnClientClick="$('#loader').show(); setTimeout($('#loader').hide(), 2000);" OnClick="btnExport_Click" Style="float:right;" />
                        </div>
                    </div>

                </div>
 <br />
                                    
                <asp:GridView ID="gvEvent" runat="server" class="table table-bordered table-hover table-striped" AutoGenerateColumns="false" DataKeyNames="DonationID, Address, EmailId, BankNarration"  PageSize="25" 
                  onpageindexchanging="gvEvent_PageIndexChanging" OnRowDataBound="gvEvent_RowDataBound" OnRowDeleting="gvEvent_RowDeleting"  EmptyDataText="No records found." Style="font-weight: normal;" >
                <Columns> 
                   <asp:BoundField HeaderText="Full Name" DataField="FullName" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                   <asp:BoundField HeaderText="Amount" DataField="Amount" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                   <asp:BoundField HeaderText="Mobile Number" DataField="MobileNumber" ItemStyle-HorizontalAlign="Left"></asp:BoundField>   
                   <asp:BoundField HeaderText="Mode Of Payment" DataField="ModeOfPayment" ItemStyle-HorizontalAlign="Left"></asp:BoundField>  
                   <asp:BoundField HeaderText="Pan Number" DataField="PanNuber" ItemStyle-HorizontalAlign="Left"></asp:BoundField>   
                   <asp:BoundField HeaderText="Payment Status" DataField="PaymentStatus" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                 <%--  <asp:BoundField HeaderText="Comments" DataField="Comments" ItemStyle-HorizontalAlign="Left"></asp:BoundField>  --%>           
              <%--     <asp:BoundField HeaderText="Address" DataField="Address" ItemStyle-HorizontalAlign="Left"></asp:BoundField>   --%>
                    <asp:TemplateField HeaderText="Address">
                        <ItemTemplate>
                            <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>' ToolTip='<%# Eval("Address") %>' CssClass="truncate-address"> </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="OrderId">
                    <ItemTemplate>
                        <asp:Label ID="lblOrderId" runat="server" Text='<%# Eval("OrderId") %>' CssClass="wrap-text"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
             <%--        <asp:BoundField HeaderText="OrderId" DataField="OrderId" ItemStyle-HorizontalAlign="Left"></asp:BoundField>--%>
                   <asp:BoundField HeaderText="Donated On" DataField="CreatedDate" ItemStyle-HorizontalAlign="Left"></asp:BoundField> 
                   <asp:BoundField HeaderText="TransId" DataField="TxnId" ItemStyle-HorizontalAlign="Left" Visible="false"></asp:BoundField> 
                   <asp:BoundField HeaderText="Type" DataField="PaymentType" ItemStyle-HorizontalAlign="Left"></asp:BoundField> 
                   <asp:BoundField HeaderText="Email" DataField="EmailId" Visible="false" ItemStyle-HorizontalAlign="Left"></asp:BoundField> 
                   <asp:BoundField HeaderText="Receipt Date" DataField="ReceiptDate" ItemStyle-HorizontalAlign="Left"></asp:BoundField> 
                   <asp:BoundField HeaderText="Bank Narration" DataField="BankNarration" Visible="false" ItemStyle-HorizontalAlign="Left"></asp:BoundField> 
                  <asp:TemplateField HeaderText="Action" ItemStyle-Width="90" >
                      <ItemTemplate>
                          <asp:ImageButton ID="imgbtn" ImageUrl="../Images/edit.png" runat="server" Width="15" Height="15" OnClick="imgbtn_Click" />
                          <asp:ImageButton ID="ButtonDelete" runat="server" CommandName="Delete" Text="Delete" Width="15" Height="15" OnClientClick="return confirm('Are you sure you want to delete this event?');" CssClass="input" ImageUrl="Images/minimal-97-128.png" />
                   <i class="fa fa-refresh" style="cursor:pointer; font-size: medium;" onclick='showJson("<%# HttpUtility.JavaScriptStringEncode(Eval("OrderId").ToString()) %>", "<%# HttpUtility.JavaScriptStringEncode(Eval("PaymentStatus").ToString()) %>")' title="Refresh status from Paytm"></i>
                          <!-- Certificate -->
                        <asp:LinkButton ID="btnCertificate" runat="server" ToolTip="Generate Certificate" OnClick="generate_Certificate" style="padding-left:0px !important;"
                                    Visible='<%# (Not IsDBNull(Eval("PaymentType")) AndAlso Eval("PaymentType").ToString().ToLower() = "donation") AndAlso (Not IsDBNull(Eval("PaymentStatus")) AndAlso Eval("PaymentStatus").ToString().ToLower() = "success") %>'>
                            <i class="fa fa-download" style="cursor:pointer; font-size: medium;"></i>
                        </asp:LinkButton>
                      </ItemTemplate>
                  </asp:TemplateField>
                </Columns>
              <%--  <FooterStyle BackColor="#336699" Font-Bold="True" ForeColor="White" HorizontalAlign="Right" />--%>
                </asp:GridView>
              
                  Total Items Count: <asp:Label ID="lblRecords" runat="server" Text="Label"></asp:Label> <br />
                  Total Reg Amount:  <asp:Label ID="lblTotalAmount" runat="server" Text="Label"></asp:Label> 
               <%-- <table id="FooterTable" border="1" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
                </table>--%>
                                 
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
                       <div class="modal-body" style="max-height: 80vh; overflow-y: auto;">
                          <div class="form-group">
                            <label>DonationID: </label>
                            <asp:Label ID="lblDonationId" runat="server" ></asp:Label>
                          </div>
                          <div class="form-group">
                            <label>Full Name: <sup class="sup">*</sup></label>
                            <asp:TextBox ID="textFullName" runat="server" class="form-control" style="width:95%"/>
                               <span id="nameError" class="help-block" style="color: red"></span>
                          </div>

                          <div class="form-group">
                            <label>Amount: <sup class="sup">*</sup></label>
                            <asp:TextBox ID="textAmount" runat="server" class="form-control" style="width:95%"/>
                                <span id="amountError" class="help-block" style="color: red"></span>
                          </div>
    
                          <div class="form-group">
                            <label>Mobile Number: <sup class="sup">*</sup></label>
                            <asp:TextBox ID="textMobileNumber" runat="server" class="form-control" style="width:95%"/>
                               <span id="mobileNumberError" class="help-block" style="color: red"></span>
                          </div>
                             <!-- Email input -->
                           <div class="form-group">
                            <label>Email: </label>
                            <asp:TextBox ID="txtEmail" runat="server" class="form-control" style="width:95%"/>
                               <span id="emailError" class="help-block" style="color: red"></span>
                          </div>
                           <!-- Pan Card input -->
                          <div class="form-group">
                            <label>Pan Number: <sup class="sup">*</sup></label>
                            <asp:TextBox ID="txtPanNum" runat="server" class="form-control" style="width:95%;text-transform:uppercase;"/>
                               <span id="panNumError" class="help-block" style="color: red"></span>
                          </div>

                         <div class="form-group" style="width: 95%">
                           <label>Mode Of Payment: <sup class="sup">*</sup></label>
                           <asp:DropDownList CssClass="form-control" ID="ddlModeOfPayment"  runat="server">
                             <asp:ListItem value="">Select Payment Way</asp:ListItem>
                             <asp:ListItem value="Credit Card">Credit Card</asp:ListItem>
                             <asp:ListItem value="Debit Card">Debit Card</asp:ListItem>
                             <asp:ListItem value="Net Banking">Net Banking</asp:ListItem>                      
                             <asp:ListItem value="UPI">UPI</asp:ListItem>                      
                             <asp:ListItem value="Cheque">Cheque</asp:ListItem>                      
                             <asp:ListItem value="Other">Other</asp:ListItem>                      
                           </asp:DropDownList>
                             <span id="modeOfPaymentError" class="help-block" style="color: red"></span>
                         </div>

                           <div class="form-group" style="width: 95%">
                              <label>Payment Status: <sup class="sup">*</sup></label>
                              <asp:DropDownList CssClass="form-control" ID="ddlStatusOfPayment"  runat="server">
                                <asp:ListItem value="">Select Payment Status</asp:ListItem>
                                <asp:ListItem value="Pending">Pending</asp:ListItem>
                                <asp:ListItem value="Success">Success</asp:ListItem>
                                <asp:ListItem value="Cancelled">Cancelled</asp:ListItem>
                                   <asp:ListItem value="Failed">Failed</asp:ListItem>
                              </asp:DropDownList>
                               <span id="paymentStatusError" class="help-block" style="color: red"></span>
                            </div>
                            <div class="form-group" style="width: 95%">
                              <label>Payment Type: <sup class="sup">*</sup></label>
                              <asp:DropDownList CssClass="form-control" ID="paymentType"  runat="server">
                                <asp:ListItem value="Donation" Selected="True">Donation</asp:ListItem>
                                <asp:ListItem value="BIB Registration">BIB Registration</asp:ListItem>
                                <asp:ListItem value="Other">Other</asp:ListItem>          
                              </asp:DropDownList>
                            </div>
                           <!-- Date of receipt in account -->
                            <div class="form-group">
                                <label>Date Of receipt:</label>
                                 <asp:TextBox ID="txtReciept" cols="40" Rows="6" runat="server" TextMode="Date" class="form-control" style="width:95%"/>
                            </div>
                           <!-- Narration in bank account -->
                            <div class="form-group">
                                <label>Narration in bank account:</label>
                                  <asp:TextBox ID="txtNarration" runat="server" class="form-control" style="width:95%" />   
                            </div>
                          <div class="form-group">
                            <label>Address </label>
                            <asp:TextBox ID="txtAddress" runat="server" class="form-control" style="width:95%"/>                          
                          </div>
                                                   
                          <div class="form-group">
                           <asp:Button ID="btnUpdate" CommandName="Update" runat="server" class="btn btn-primary btn-lg"  OnClientClick="return onNextButtonClient();"  Text="Update" OnClick="btnUpdate_Click"/>
                              <asp:Button ID="btnAddNew" class="btn btn-primary btn-lg" runat="server" Text="Add New" OnClick="btnAddNew_Click1" OnClientClick="return onNextButtonClient();" />
                           <asp:Button ID="btnCancel" runat="server"  class="btn btn-primary btn-lg" Text="Cancel" OnClientClick="clearInformation()" />
                          </div>
                           
                       </div>       
                     </div>
                  </div>
                </div>
            </asp:Panel>                    
     <%--  </tbody>
      </table>--%>
             </div>
         </div>
    </div>
        

  <!-- Modal -->
  <div class="modal fade" id="EventDetailsModalAdd123456" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" onclick="clearInformation();" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Donation Details</h4>
        </div>
     <%--   <div class="modal-body">

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
                             <asp:ListItem Value="UPI">UPI</asp:ListItem>                                       
                          </asp:DropDownList>
                         </div>
                   <div class="form-group col-sm-12">
                            <asp:DropDownList CssClass="form-control" ID="ddlStatusOfPayment1"  runat="server">
                                <asp:ListItem value="Select">Select Payment Status</asp:ListItem>
                                <asp:ListItem Value="Pending" Selected="True">Pending</asp:ListItem>
                                <asp:ListItem Value="Success">Success</asp:ListItem>
                                <asp:ListItem Value="Cancelled">Cancelled</asp:ListItem>                                               
                            </asp:DropDownList>
                   </div>

                    <div class="form-group col-sm-12">
                        <asp:TextBox ID="txtAddress1" CssClass="form-control" TextMode="MultiLine" MaxLength="700" runat="server" placeholder="Enter Comment" AutoComplete="off"></asp:TextBox>
                         <span id="commentsError" class="help-block" style="color: red"></span>
                    </div>
            </div>--%>
        <div class="modal-footer" style="border-top:0px;border-bottom:1px solid #e5e5e5;">
            
          <button type="button" class="btn btn-default" onclick="clearInformation();" data-dismiss="modal">Close</button>

        </div>
      </div>
      
    </div>
  </div>   
    <div id="jsonModal" style="display:none; position:fixed; top:10%; left:20%; width:60%; background:#fff; padding:20px; border:1px solid #ccc; z-index:9999;">
    
     <div>
        <h4>Payment Response</h4>
         <button type="button" class="close" onclick="closeModal(event)" style="margin-top: -30px;">
              <span aria-hidden="true">&times;</span>
          </button>
    </div>
    
    <pre id="jsonContent" style="max-height:400px; overflow:auto; background:#f5f5f5; padding:10px;"></pre>
    
    <button type="button" onclick="closeModal(event)" class="btn btn-danger">Close</button>

</div>
    <asp:Button ID="btnBindGrid" runat="server" OnClick="btnBindGrid_Click" Style="display:none;" />
<script type="text/javascript">
    $(document).ready(function () {
        var msg = $('#<%= lblmsg.ClientID %>');
            if (msg && msg.text().trim() !== "") {
                setTimeout(function () {
                    msg.fadeOut();     // hides with animation
                    msg.text('');      // clears the message content
                }, 5000); // 5000ms = 5 seconsds
        }
        var successMsg = $('#<%= MessageUpdated.ClientID %>');
        if (successMsg && successMsg.text().trim() !== "") {
            setTimeout(function () {
                successMsg.fadeOut();     // hides with animation
                successMsg.text('');      // clears the message content
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
        if ($("#<%=textFullName.ClientID %>").val() == "")
        {
            $('#nameError').show();
            $('#nameError').html("Please Enter Name");
            validation = 0;
        }
        else
        {
            $('#nameError').hide();
        }     
        if ($("#<%=textAmount.ClientID %>").val() == "")
        {
            $('#amountError').show();
            $('#amountError').html("Please Enter Amount");
            validation = 0;
        }
        else
        {
            $('#amountError').hide();
        }
        if ($("#<%=textMobileNumber.ClientID %>").val() == "")
        {
            $('#mobileNumberError').show();
            $('#mobileNumberError').html("Please Enter Mobile Number");
            validation = 0;
        }
        else
        {
            $('#mobileNumberError').hide();
        }
        if ($("#<%=ddlModeOfPayment.ClientID %>").val() == "")
        {
            $('#modeOfPaymentError').show();
            $('#modeOfPaymentError').html("Please Enter Mode Of payement");
            validation = 0;
        }
        else
        {
            $('#modeOfPaymentError').hide();
        }
        if ($("#<%=txtPanNum.ClientID %>").val() == "")
        {
            $('#panNumError').show();
            $('#panNumError').html("Please Enter Pan Number");
            validation = 0;
        }
        else
        {
            $('#panNumError').hide();
        }
        if ($("#<%=ddlStatusOfPayment.ClientID %>").val() == "")
        {
            $('#paymentStatusError').show();
            $('#paymentStatusError').html("Please select Payment status");
            validation = 0;
        }
        else
        {
            $('#paymentStatusError').hide();
        }
        if (validation == 0)
        {
            return false;
        }
        else { $('#loader').show(); return true }
    }


    // This function is used to hide error validations msg...
    $(document).ready(function () {

        $("#<%=textFullName.ClientID %>").on("input", function () {
        if ($(this).val() !== "") {
            $('#nameError').hide();
        }
        });

        $("#<%=textAmount.ClientID %>").on("input", function () {
            if ($(this).val() !== "") {
                $('#amountError').hide();
            }
        });

        $("#<%=textMobileNumber.ClientID %>").on("input", function () {
            if ($(this).val() !== "") {
                $('#mobileNumberError').hide();
            }
        });

        $("#<%=ddlModeOfPayment.ClientID %>").on("change", function () {
            if ($(this).val() !== "") {
                $('#modeOfPaymentError').hide();
            }
        });

        $("#<%=txtPanNum.ClientID %>").on("input", function () {
            if ($(this).val() !== "") {
                $('#panNumError').hide();
            }
        });

        $("#<%=ddlStatusOfPayment.ClientID %>").on("change", function () {
            if ($(this).val() !== "") {
                $('#paymentStatusError').hide();
            }
        });

    });
 
    function clearInformation()
    {
        $("#<%=textFullName.ClientID %>").val('');
        $("#<%=textAmount.ClientID %>").val('');
        $("#<%=textMobileNumber.ClientID %>").val('');
        $("#<%=ddlModeOfPayment.ClientID %>").val('');
        $("#<%=ddlStatusOfPayment.ClientID %>").val('');
        $("#<%=txtAddress.ClientID %>").val('');
        $('#nameError').hide();
    }

    function showJson(id, status) {
        showLoader();
        try {
            $.ajax({
                type: "POST",
                url: "/AdminBIBData.aspx/GetJsonData",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({
                    id: id,
                    currentStatus: status,
                    paymentFor: 'Donation'
                }),
                success: function (response) {
                    var data = response.d;
                    hideLoader();
                    // Pretty format JSON
                    var formatted = JSON.stringify(JSON.parse(data), null, 4);

                    $("#jsonContent").text(formatted);
                    $("#jsonModal").show();
                },
                error: function () {
                    hideLoader();
                    //alert("Error loading data");
                }
            });
        } catch {
            hideLoader();
        }
    }

    function closeModal(e) {
        if (e) e.preventDefault();
        $("#jsonModal").hide();
        __doPostBack('<%= btnBindGrid.UniqueID %>', '');
    }

    function updatePaytmenStatus(e) {
        try {
            if (e) e.preventDefault();
            showLoader();
            $.ajax({
                type: "POST",
                url: "/DonationDetails.aspx/UpdatePendingPaymentStatus",
                contentType: "application/json; charset=utf-8",
                success: function (res) {
                    hideLoader();
                    __doPostBack('<%= btnBindGrid.UniqueID %>', '');
                },
                error: function () {
                    hideLoader();
                    //alert("Error loading data");
                }
            });
            } catch (e) {
            console.error('Error in Donation updatePaytmenStatus', e);
            hideLoader();
            }
        }
</script>
</asp:Content>
