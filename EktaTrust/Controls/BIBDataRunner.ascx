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

    <div class="col-md-12 ">
        <h2 class="admin-heading">BIB Data</h2>
           
    <div class="table-responsive">
       <asp:Label ID="MessageUpdated" runat="server" Text="" ForeColor="Green"></asp:Label>
        <table class="table table-bordered table-hover table-striped">
           
        <tbody>
                  <tr>

        <td> Upload CSV file
           <asp:FileUpload ID="BIBDataFileUpload" style="display:inline-block;margin-left: 12px;" runat="server" />
        </td><td>
           <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="ImportFromExcel" />
                
            <asp:Label ID="lblMessage" ForeColor="Green" runat="server" />
            
        </td></tr>

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
   EmptyDataText="No records has been added." Style="font-weight: normal;" OnRowDeleting="gvMIP_RowDeleting" onpageindexchanging="gvEvent_PageIndexChanging" >
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
   

</Columns>
</asp:GridView>
      </table>
             Total Items Count: <asp:Label ID="lblRecords" runat="server" Text="Label"></asp:Label> 
  </div>
</div>