<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="BIBDataRunner.ascx.vb" Inherits="EktaTrust.BIBDataRunner" %>

 <script type="text/javascript">
$(document).ready(function () {
   // TotalRecord();
   // HideLogdetails();
})
function TotalRecord() {
 
        var totalRowCount = $("[id*=gvEvent] tr").length;
        var rowCount = $("[id*=gvEvent] td").closest("tr").length;
        var message = "Total Items Count: " + rowCount;
       
        $('#message').text(message);
        return false;
}

 function HideLogdetails() {
    var name = '<%=Session("RoleId") %>'
     if (name == 2) {
         window.location.href = "/LogIn.aspx";
        //$('#LogDetails').hide();
    }
    else {
        //$('#LogDetails').show();
    }
}
 </script>

<style>
         input[type=number]::-webkit-inner-spin-button, 
         input[type=number]::-webkit-outer-spin-button { 
             -webkit-appearance: none;
             -moz-appearance: none;
             appearance: none;
             margin: 0; 
         }
         .btn{
             height: fit-content;
         }
         div:has(> table.table.table-bordered.table-hover.table-striped) {
          overflow: auto;
        }
         hr{
            margin-top: 10px;
            margin-bottom: 10px;
         }
         .col-md-10{
             padding:0px;
         }
        .table a {
            color: #337ab7;
           padding-left:10px !important;
       }
        td span{
             padding-left:10px !important;
        }
           .wrap-text {
            word-break: break-all;      /* breaks long strings */
            white-space: normal;        /* allow multiple lines */
            max-width: 120px;           /* control column width */
        }
</style>

    <div class="col-md-12">
        <!-- Header -->
        <div class="header-admin">
            <div><h2 class="">BIB Data</h2></div>
             <div>
                 <button class="btn btn-primary" title="Refresh Payment Status" onclick="updatePaytmenStatus()">Refresh Payment</button>
                 <asp:Button ID="btnAddBIB" runat="server" Text="Add New" CssClass="btn btn-success" OnClick="AddBIB_Click" />
             </div>
        </div>
    <div class="table-responsive p-0">
        <asp:Label ID="MessageUpdated" runat="server" Text="" ForeColor="Green"></asp:Label>
        <asp:Label ID="AddCount" runat="server" Text="" ClientIDMode="Static"></asp:Label>

<div class="card search-card">

    <!-- 🔼 Top Row: Upload + Actions -->
    <div class="row align-items-center mb-3">

        <!-- Upload Section -->
        <div class="col-md-3">
            <label class="mb-0">Upload CSV:</label>
            <asp:FileUpload ID="BIBDataFileUpload" runat="server" CssClass="form-control w-auto" />
         </div>  <div class="col-md-3">
            <div id="divUploadUserDDL" runat="server" ClientIDMode="Static">
                <label class="mb-0 ms-2">Created By:</label>
                <asp:DropDownList ID="ddlUploadedBy" runat="server" CssClass="form-control w-auto"></asp:DropDownList>
             </div>
        </div>

        <!-- Buttons -->
        <div class="col-md-6 text-end cus-buttons">
            <asp:Button ID="btnUpload" Text="Upload" runat="server" CssClass="btn btn-primary" OnClientClick="$('#loader').show();" OnClick="ImportFromExcel" />

            <asp:Button ID="btnDownload" Text="Sample CSV" runat="server" CssClass="btn btn-outline-secondary" OnClick="DownloadFile" />
                <%--   <asp:LinkButton ID="btnExport" runat="server" CssClass="btn btn-primary" ClientIDMode="Static" ToolTip="Generate Certificate" OnClick="btnExport_Click" Style="float:right;">                       
                        <i class="fa fa-file-excel-o"></i>Export
                    </asp:LinkButton>   --%>
             <asp:Button ID="btnExport" runat="server" CssClass="btn btn-primary" Text="Export to Excel" OnClientClick="$('#loader').show(); setTimeout($('#loader').hide(), 2000);" OnClick="btnExport_Click" Style="float:right;" />
        </div>
    </div>

    <!-- 🔍 Search Row -->
    <div class="row align-items-center">
        <hr />
        <!-- Main Search -->
        <div class="col-md-4">
            <label>Search</label>
            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Bib No / Payment Status / OrderId"></asp:TextBox>
        </div>

        <!-- Date -->
        <div class="col-md-3" id="divtxtDateSearch" runat="server" ClientIDMode="Static">
            <label>Reg Date</label>
            <asp:TextBox ID="txtDateSearch" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
        </div>

        <!-- User -->
        <div class="col-md-2" id="divCreatedByView" runat="server" ClientIDMode="Static">
            <label>User</label>
            <asp:DropDownList ID="ddlBiBCreatedUsers" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlBiBCreatedUsers_SelectedIndexChanged">
            </asp:DropDownList>
        </div>

        <!-- Year -->
        <div class="col-md-2">
            <label>Year</label>
            <asp:DropDownList ID="ddlYearBy" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlYearBy_SelectedIndexChanged">
                <asp:ListItem Text="2026" Value="2026" Selected="True" />
                <asp:ListItem Text="2025" Value="2025" />
                <asp:ListItem Text="2024" Value="2024" />
            </asp:DropDownList>
        </div>

        <!-- Search Button -->
        <div class="col-md-1 d-flex align-items-end cus-buttons">
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary w-100" />
        </div>
    </div>

    <!-- Message -->
    <div class="mt-2">
        <asp:Label ID="lblmsg" runat="server" CssClass="text-danger fw-bold"></asp:Label>
    </div>

</div>
 <br />
          
 <asp:GridView ID="gvEvent" runat="server" class="table table-bordered table-hover table-striped" AutoGenerateColumns="false" DataKeyNames="ID"  PageSize="25" 
   EmptyDataText="No records found." Style="font-weight: normal;" OnRowCommand="gvMIP_RowAction" onpageindexchanging="gvEvent_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound">
<Columns> 
    
  <%--  <asp:BoundField HeaderText="Category" DataField="CategoryName" ItemStyle-HorizontalAlign="Left"></asp:BoundField>--%>
        <asp:BoundField HeaderText="BIB No." DataField="BIBNo" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="Name" DataField="RunnerName" ItemStyle-HorizontalAlign="Left"></asp:BoundField>  
    <asp:BoundField HeaderText="Run Category" DataField="RunCatagory" ItemStyle-HorizontalAlign="Left"></asp:BoundField> 
    <asp:BoundField HeaderText="T-shirt Size" DataField="TShirtSize" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="Gender" DataField="Gender" ItemStyle-HorizontalAlign="Left"></asp:BoundField>   
   <asp:TemplateField HeaderText="DOB">
    <ItemTemplate>
        <%# If(Eval("RunnerDOB") Is DBNull.Value OrElse String.IsNullOrEmpty(Eval("RunnerDOB").ToString()), "", Convert.ToDateTime(Eval("RunnerDOB")).ToString("dd MMM yyyy")) %>
    </ItemTemplate>
</asp:TemplateField>

  
   <%-- <asp:BoundField HeaderText="Blood Group" DataField="BloodGroup" ItemStyle-HorizontalAlign="Left"></asp:BoundField>--%>

    <asp:BoundField HeaderText="Contact" DataField="MobileNumber" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
 <%--   <asp:BoundField HeaderText="Emergency Contact Name" DataField="EmergencyContactName" ItemStyle-HorizontalAlign="Left"></asp:BoundField>--%>
  <%--  <asp:BoundField HeaderText="Emergency Contact Number" DataField="EmergencyContactNumber" ItemStyle-HorizontalAlign="Left"></asp:BoundField>--%>
    <asp:BoundField HeaderText="Amount" DataField="Amount" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
 <%--   <asp:BoundField HeaderText="Payment Reference" DataField="BankReferenceNo" ItemStyle-HorizontalAlign="Left"></asp:BoundField>--%>
     <asp:BoundField HeaderText="Payment Status" DataField="PaymentStatus" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
<%--     <asp:BoundField HeaderText="OrderId" DataField="OrderId" ItemStyle-HorizontalAlign="Left"></asp:BoundField>--%>
         <asp:TemplateField HeaderText="OrderId">
     <ItemTemplate>
         <asp:Label ID="lblOrderId" runat="server" Text='<%# Eval("OrderId") %>' CssClass="wrap-text"> </asp:Label>
     </ItemTemplate>
 </asp:TemplateField>
    <asp:BoundField HeaderText="Created By" DataField="CreatedBy" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="Reg. On" DataField="CreatedAt" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
<%--    <asp:BoundField HeaderText="Year" DataField="Year" ItemStyle-HorizontalAlign="Left"></asp:BoundField>--%>

       <asp:TemplateField HeaderText="Action" ItemStyle-Width="90" >
        <ItemTemplate>
             <asp:ImageButton ID="ButtonEdit" runat="server" ToolTip="Edit" CommandName="EditRow" CommandArgument='<%# Eval("Id") %>' Width="15" Height="15"  CssClass="input" ImageUrl="../Images/edit.png" />
            <asp:ImageButton ID="ButtonDelete" runat="server" ToolTip="Delete" CommandName="DeleteRow" CommandArgument='<%# Eval("Id") %>' OnClientClick="return confirm('Are you sure you want to delete this event?');"  Text="Delete" Width="15" Height="15"  CssClass="input" ImageUrl="../Images/minimal-97-128.png" />
             <i class="fa fa-refresh" style="cursor:pointer; font-size: medium;" onclick='showJson("<%# HttpUtility.JavaScriptStringEncode(Eval("OrderId").ToString()) %>", "<%# HttpUtility.JavaScriptStringEncode(Eval("PaymentStatus").ToString()) %>")' title="Refresh status from Paytm"></i>
                   <asp:LinkButton ID="btnCertificate" runat="server" ToolTip="Generate Certificate" OnClick="generate_Certificate" style="padding-left:0px !important;">                       
                        <i class="fa fa-download" style="cursor:pointer; font-size: medium;"></i>
                    </asp:LinkButton>    
        </ItemTemplate>
          
       </asp:TemplateField>

</Columns>
</asp:GridView>
          
            <!-- Modal -->
  <asp:Button ID="btnShowPopup" runat="server" style="display:none"  CssClass="col-lg-6 col-sm-6 col-md-6" UseSubmitBehavior="false" />
<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlpopup" CancelControlID="btnCancel" BackgroundCssClass="modalBackground">
</ajaxToolkit:ModalPopupExtender>
<asp:Panel ID="pnlpopup" runat="server"   style="display:none">
    <div class = "modal-dialog">
    <div class = "modal-content">
      <div class = "modal-header">
          <button type="button" class="close" aria-label="Close" onclick="closeBibPopup();">
        <span aria-hidden="true">&times;</span>
    </button>
<div width="100%"  width:100%; border-collapse: inherit; height:100%" cellpadding="0" cellspacing="0" Style="border-bottom: 1px solid #e5e5e5;">
<tr style="background-color:#D55500">
<td colspan="2" style=" height:10%; color:White; font-weight:bold;  font-size:larger" align="center "></td>
<h4>BIB Data</h4>
    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
 </div>    
 <div class="modal-body" style="max-height: 80vh; overflow-y: auto;">
<from id="form1">
<%--<div class="form-group">
<asp:Label ID="lblId" runat="server" Text="ID:"></asp:Label>
   <asp:Label ID="id" runat="server"/>
</div>--%>
    <asp:HiddenField ID="hfEditID" runat="server" />
    <div class="form-group">
        <label>Bank Reference: </label>
        <asp:Textbox ID="txtBankRef" runat="server" class="form-control" Width="95%" />
    </div>
         <div class="form-group">
        <label>Run Category:  <span style="color:red">*</span></label>
         <asp:DropDownList ID="txtRunCategory" runat="server" class="form-control" Width="95%">
             <asp:ListItem Text="Select Run Category" Value="" />
             <asp:ListItem Text="21.09KM" Value="21.09KM" />
             <asp:ListItem Text="10KM" Value="10KM" />
             <asp:ListItem Text="5KM" Value="5KM" />
         </asp:DropDownList>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRunCategory" InitialValue="" ErrorMessage="Run Category is Required" ForeColor="Red" Display="Dynamic" ValidationGroup="BibDataSave" />
    </div>
     <div class="form-group">
        <label>BIB Number: <span style="color:red">*</span></label>
        <asp:Textbox ID="txtBibNumber" runat="server" class="form-control" Width="95%" />
         <asp:RequiredFieldValidator ID="RequiredBiBNo" ControlToValidate="txtBibNumber" runat="server" ErrorMessage="BIB No. is Required" ValidationGroup="BibDataSave" ForeColor="Red" Display="Dynamic" />
        </div>
<%--    <div class="form-group">
    <label>Category: </label>
        <asp:Textbox ID="txtCategory" runat="server" class="form-control" Width="95%" Text="Registration For RUN FOR EQUALITY" />
    </div>--%>
    <div class="form-group">
    <label>Runner Name:  <span style="color:red">*</span></label>
    <asp:TextBox ID="txtName" cols="40" Rows="6" runat="server" TextMode="SingleLine" class="form-control" style="width:95%"/>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtName" runat="server" ErrorMessage="Name is Required" ValidationGroup="BibDataSave" ForeColor="Red" Display="Dynamic" />
    </div>
    <div class="form-group">
           <label>Gender:  <span style="color:red">*</span></label>
           <asp:DropDownList ID="ddlGender" runat="server" class="form-control" Width="95%">
                <asp:ListItem Text="Select Gender" Value="" />
                <asp:ListItem Text="Male" Value="Male" />
                <asp:ListItem Text="Female" Value="Female" />
            </asp:DropDownList>
           <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="ddlGender" InitialValue="" ErrorMessage="Please select Gender" ForeColor="Red" Display="Dynamic" ValidationGroup="BibDataSave">
    </asp:RequiredFieldValidator>
    </div>
      <div class="form-group">
     <label>Date Of Birth:</label>
      <asp:TextBox ID="txtDOB" cols="40" Rows="6" runat="server" TextMode="Date" class="form-control" style="width:95%"/>
 </div>
<%--    <div class="form-group">
        <label>Email: </label>
        <asp:TextBox ID="txtEmail" cols="40" Rows="6" runat="server" TextMode="SingleLine" class="form-control" style="width:95%"/>
    </div>--%>
   <%-- <div class="form-group">
        <label>Bloob Group: </label>
        <asp:TextBox ID="txtBloodGroup" cols="40" Rows="6" runat="server" TextMode="SingleLine" class="form-control" style="width:95%"/>
    </div>--%>
    <div class="form-group">
        <label>T-Shirt size: </label>
        <asp:DropDownList ID="txtTshirtSize" runat="server" class="form-control" Width="95%">
           <asp:ListItem Text="Select T-Shirt Size" Value="" />
          <%-- <asp:ListItem Text="XS" Value="XS" />--%>
           <asp:ListItem Text="S" Value="S" />
           <asp:ListItem Text="M" Value="M" />
           <asp:ListItem Text="L" Value="L" />
           <asp:ListItem Text="XL" Value="XL" />
           <asp:ListItem Text="XXL" Value="XXL" />
       </asp:DropDownList>
    </div>
     <div class="form-group">
        <label>Mobile:  <span style="color:red">*</span></label>
        <asp:TextBox ID="txtMobile" cols="40" Rows="6" runat="server" TextMode="Number" class="form-control" style="width:95%"/>
                <asp:RequiredFieldValidator ID="RequiredValidatorMobile" ControlToValidate="txtMobile"
        runat="server" ErrorMessage="Please enter the Mobile number" ValidationGroup="BibDataSave" ForeColor="Red" Display="Dynamic" />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Phone number should be 10 digit" 
    ControlToValidate="txtMobile" ValidationExpression="^\d{10}$" ValidationGroup="BibDataSave" ForeColor="Red" Display="Dynamic" />
    </div>
<%--    <div class="form-group">
        <label>Year:  <span style="color:red">*</span></label>
        <asp:DropDownList ID="txtYear" runat="server" class="form-control" Width="95%">
            <asp:ListItem Text="2025" Value="2025" />
            <asp:ListItem Text="2026" Value="2026" />
            <asp:ListItem Text="2027" Value="2027" />
            <asp:ListItem Text="2028" Value="2028" />
            <asp:ListItem Text="2029" Value="2029" />
            <asp:ListItem Text="2030" Value="2030" />
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtYear" InitialValue="" ErrorMessage="Year is Required" ForeColor="Red" Display="Dynamic" ValidationGroup="BibDataSave" />
    </div>--%>
    <div class="form-group">
        <label>Emergency Contact Name:</label>
         <asp:TextBox ID="txtEmgName" cols="40" Rows="6" runat="server" TextMode="SingleLine" class="form-control" style="width:95%"/>
    </div>
    <div class="form-group">
      <label>Emergency Contact Number:</label>
       <asp:TextBox ID="txtEmgMobile" cols="40" Rows="6" runat="server" TextMode="Number" class="form-control" style="width:95%"/>
  </div>
      <div class="form-group" Width="95%">
     <label>Payment Status: </label>
     <asp:DropDownList CssClass="form-control" ID="ddlStatusOfPayment"  runat="server">
       <asp:ListItem value="">Select Payment Status</asp:ListItem>
       <asp:ListItem value="Pending">Pending</asp:ListItem>
       <asp:ListItem value="Success">Success</asp:ListItem>
       <asp:ListItem value="Cancelled">Cancelled</asp:ListItem>   
       <asp:ListItem value="Failed">Failed</asp:ListItem>
         
     </asp:DropDownList>
   </div>
    <div class="form-group">
        <label>Amount:</label>
         <asp:TextBox ID="txtAmount" cols="40" Rows="6" runat="server" TextMode="SingleLine" class="form-control" style="width:95%"/>
    </div>
    <div class="form-group">
    <asp:Button ID="btnAdd" CommandName="Save" runat="server" ValidationGroup="BibDataSave" class="btn btn-primary btn-lg" OnClientClick="return validateAndSubmit();"  Text="Save" OnClick="btnSave_Click"/>
    <asp:Button ID="btnCancel" runat="server"  class="btn btn-primary btn-lg" Text="Cancel" />
    </div>
</from>
 </div>       
</div>
       
</div>
</div>
    </asp:Panel>   

      </table>
             Total Items Count: <asp:Label ID="lblRecords" runat="server" Text="Label"></asp:Label> <br />
             Total Reg Amount:  <asp:Label ID="lblTotalAmount" runat="server" Text="Label"></asp:Label> 
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
        var msg = $('#<%= MessageUpdated.ClientID %>');
        if (msg && msg.text().trim() !== "") {
            setTimeout(function () {
                msg.fadeOut();     // hides with animation
                msg.text('');      // clears the message content
            }, 5000); // 5000ms = 5 seconsds
        }
    });

    function validateAndSubmit() {
        var dobInput = document.getElementById('ContentPlaceHolder1_BIBDataRunner_txtDOB');

        // 1️⃣ Detect invalid / empty / malformed date
        if (!dobInput.checkValidity()) {
            dobInput.reportValidity(); // shows browser message
            return false;
        }
        var aspnetValid = (typeof (Page_ClientValidate) === 'function') ? Page_ClientValidate() : false;

        if (aspnetValid) {
            $('#loader').show();
            return true;
        }
        return false;
    }

    // clear form values...
    $('#ContentPlaceHolder1_BIBDataRunner_btnCancel').click(function () {
        $('#ContentPlaceHolder1_BIBDataRunner_txtBankRef').val('');
        $('#ContentPlaceHolder1_BIBDataRunner_txtBibNumber').val('');
       // $('#ContentPlaceHolder1_BIBDataRunner_txtCategory').val('Registration For RUN FOR EQUALITY');
        $('#ContentPlaceHolder1_BIBDataRunner_txtName').val('');
        $('#ContentPlaceHolder1_BIBDataRunner_ddlGender').val('');
       // $('#ContentPlaceHolder1_BIBDataRunner_txtEmail').val('');
        //$('#ContentPlaceHolder1_BIBDataRunner_txtBloodGroup').val('');
        $('#ContentPlaceHolder1_BIBDataRunner_txtTshirtSize').val('');
        $('#ContentPlaceHolder1_BIBDataRunner_txtMobile').val('');
        $('#ContentPlaceHolder1_BIBDataRunner_txtRunCategory').val('');
       // $('#ContentPlaceHolder1_BIBDataRunner_txtYear').val('');
        $('#ContentPlaceHolder1_BIBDataRunner_txtEmgName').val('');
        $('#ContentPlaceHolder1_BIBDataRunner_txtEmgMobile').val('');
        $('#ContentPlaceHolder1_BIBDataRunner_txtDOB').val('');
    });
    function closeBibPopup() {
        $('#ContentPlaceHolder1_BIBDataRunner_btnCancel').click();
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
                    paymentFor:'Registration'
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
                url: "/AdminBIBData.aspx/UpdatePendingPaymentStatus",
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
            hideLoader();
            console.error('Error in updatePaytmenStatus', e);
        }
    }
</script>