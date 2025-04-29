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
</style>

    <div class="col-md-12 ">
        <h2 class="admin-heading">BIB Data</h2>
           
    <div class="table-responsive">
       <asp:Label ID="MessageUpdated" runat="server" Text="" ForeColor="Green" ClientIDMode="Static"></asp:Label>
                     <asp:Button ID="btnAddBIB" runat="server" Text="Add New" OnClick="AddBIB_Click" UseSubmitBehavior="False" style=" float: right; margin-top: 10px;" />
        <table class="table table-bordered table-hover table-striped">
           
        <tbody>
                  <tr>

        <td> Upload CSV file
           <asp:FileUpload ID="BIBDataFileUpload" style="display:inline-block;margin-left: 12px;" runat="server" />
        </td><td>
           <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="ImportFromExcel" />
                
            <asp:Label ID="lblMessage" ForeColor="Green" runat="server" />
            
              <asp:Button ID="btnDownload" Text="Download Sample" runat="server" OnClick="DownloadFile" />
        </td>         
                  </tr>

            <br />
    <tr>
        <td> Search by Bib No
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
        </td><td>
            <asp:Button ID="btnSearch" runat="server" Text="Search" 
                />
             <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="Red" Text=""></asp:Label>
            
        </td></tr>
    
            </tbody>
 <br />
          
 <asp:GridView ID="gvEvent" runat="server" class="table table-bordered table-hover table-striped" AutoGenerateColumns="false" DataKeyNames="ID"  PageSize="25" 
   EmptyDataText="No records has been added." Style="font-weight: normal;" OnRowCommand="gvMIP_RowAction" onpageindexchanging="gvEvent_PageIndexChanging" >
<Columns> 
    
    <asp:BoundField HeaderText="Category" DataField="CategoryName" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="Name" DataField="RunnerName" ItemStyle-HorizontalAlign="Left"></asp:BoundField>  
    <asp:BoundField HeaderText="Gender" DataField="Gender" ItemStyle-HorizontalAlign="Left"></asp:BoundField>   
    <asp:BoundField HeaderText="Blood Group" DataField="BloodGroup" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="T-shirt Size" DataField="TShirtSize" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="Mobile Number" DataField="MobileNumber" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="Run Category" DataField="RunCatagory" ItemStyle-HorizontalAlign="Left"></asp:BoundField> 
    <asp:BoundField HeaderText="BIB Number" DataField="BIBNo" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="Year" DataField="Year" ItemStyle-HorizontalAlign="Left"></asp:BoundField>

       <asp:TemplateField HeaderText="Action" ItemStyle-Width="72" >
        <ItemTemplate>
            <asp:ImageButton ID="ButtonDelete" runat="server" ToolTip="Delete" CommandName="DeleteRow" CommandArgument='<%# Container.DataItemIndex %>' OnClientClick="return confirm('Are you sure you want to delete this event?');"  Text="Delete" Width="25" Height="25"  CssClass="input" ImageUrl="../Images/minimal-97-128.png" />
            <asp:ImageButton ID="ButtonEdit" runat="server" ToolTip="Edit" CommandName="EditRow" CommandArgument='<%# Container.DataItemIndex %>' Width="25" Height="25"  CssClass="input" ImageUrl="../Images/edit.png" />
        </ItemTemplate>
       </asp:TemplateField>

</Columns>
</asp:GridView>
            <br />
            <!-- Modal -->
  <asp:Button ID="btnShowPopup" runat="server" style="display:none"  CssClass="col-lg-6 col-sm-6 col-md-6" UseSubmitBehavior="false" />
<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlpopup" CancelControlID="btnCancel" BackgroundCssClass="modalBackground">
</ajaxToolkit:ModalPopupExtender>
<asp:Panel ID="pnlpopup" runat="server"   style="display:none">
    <div class = "modal-dialog">
    <div class = "modal-content">
      <div class = "modal-header">
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
        <label>BIB Number: </label>
        <asp:Textbox ID="txtBibNumber" runat="server" class="form-control" Width="95%" />
        </div>
    <div class="form-group">
    <label>Category: </label>
        <asp:Textbox ID="txtCategory" runat="server" class="form-control" Width="95%" />
    </div>
    <div class="form-group">
    <label>Name:  </label>
    <asp:TextBox ID="txtName" cols="40" Rows="6" runat="server" TextMode="SingleLine" class="form-control" style="width:95%"/>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtName" runat="server" ErrorMessage="Name is Required" ValidationGroup="BibDataSave" ForeColor="Red" Display="Dynamic" />
    </div>
    <div class="form-group">
           <label>Gender: </label>
           <asp:DropDownList ID="ddlGender" runat="server" class="form-control" Width="95%">
                <asp:ListItem Text="Select Gender" Value="" />
                <asp:ListItem Text="Male" Value="Male" />
                <asp:ListItem Text="Female" Value="Female" />
            </asp:DropDownList>
           <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="ddlGender" InitialValue="" ErrorMessage="Please select Gender" ForeColor="Red" Display="Dynamic" ValidationGroup="BibDataSave">
    </asp:RequiredFieldValidator>
    </div>
    <div class="form-group">
        <label>Email: </label>
        <asp:TextBox ID="txtEmail" cols="40" Rows="6" runat="server" TextMode="SingleLine" class="form-control" style="width:95%"/>
    </div>
    <div class="form-group">
        <label>Bloob Group: </label>
        <asp:TextBox ID="txtBloodGroup" cols="40" Rows="6" runat="server" TextMode="SingleLine" class="form-control" style="width:95%"/>
    </div>
    <div class="form-group">
        <label>T-Shirt size: </label>
        <asp:DropDownList ID="txtTshirtSize" runat="server" class="form-control" Width="95%">
           <asp:ListItem Text="Select T-Shirt Size" Value="" />
           <asp:ListItem Text="XS" Value="XS" />
           <asp:ListItem Text="S" Value="S" />
           <asp:ListItem Text="M" Value="M" />
           <asp:ListItem Text="L" Value="L" />
           <asp:ListItem Text="XL" Value="XL" />
           <asp:ListItem Text="XXL" Value="XXL" />
       </asp:DropDownList>
    </div>
     <div class="form-group">
        <label>Mobile: </label>
        <asp:TextBox ID="txtMobile" cols="40" Rows="6" runat="server" TextMode="Number" class="form-control" style="width:95%"/>
                <asp:RequiredFieldValidator ID="RequiredValidatorMobile" ControlToValidate="txtMobile"
        runat="server" ErrorMessage="Please enter the Mobile number" ValidationGroup="BibDataSave" ForeColor="Red" Display="Dynamic" />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Phone number should be 10 digit" 
    ControlToValidate="txtMobile" ValidationExpression="^\d{10}$" ValidationGroup="BibDataSave" ForeColor="Red" Display="Dynamic" />
    </div>
     <div class="form-group">
        <label>Run Category: </label>
         <asp:DropDownList ID="txtRunCategory" runat="server" class="form-control" Width="95%">
             <asp:ListItem Text="Select Run Category" Value="" />
             <asp:ListItem Text="21.09KM" Value="21.09KM" />
             <asp:ListItem Text="10KM" Value="10KM" />
             <asp:ListItem Text="5KM" Value="5KM" />
         </asp:DropDownList>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRunCategory" InitialValue="" ErrorMessage="Run Category is Required" ForeColor="Red" Display="Dynamic" ValidationGroup="BibDataSave" />
    </div>
    <div class="form-group">
        <label>Year: </label>
        <asp:TextBox ID="txtYear" cols="40" Rows="6" runat="server" TextMode="Number" class="form-control" style="width:95%"/>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtYear" InitialValue="" ErrorMessage="Year is Required" ForeColor="Red" Display="Dynamic" ValidationGroup="BibDataSave" />
    </div>

    <div class="form-group">
    <asp:Button ID="btnAdd" CommandName="Save" runat="server"  ValidationGroup="BibDataSave" class="btn btn-primary btn-lg"  Text="Save" OnClick="btnSave_Click"/>
    <asp:Button ID="btnCancel" runat="server"  class="btn btn-primary btn-lg" Text="Cancel"  />
    </div>
</from>
 </div>       
</div>
       
</div>
</div>
    </asp:Panel>   

      </table>
             Total Items Count: <asp:Label ID="lblRecords" runat="server" Text="Label"></asp:Label> 
  </div>


</div>

<script type="text/javascript">
    window.onload = function () {
        var msg = document.getElementById("MessageUpdated");
        if (msg && msg.innerText.trim() !== "") {
            setTimeout(function () {
                msg.style.display = "none";
                msg.innerText = "";
            }, 5000); // 5000ms = 5 seconds
        }
    };
</script>