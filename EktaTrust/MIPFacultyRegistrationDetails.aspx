<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Inner.Master" CodeBehind="MIPFacultyRegistrationDetails.aspx.vb" Inherits="EktaTrust.MIPFacultyRegistrationDetails" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<%@ Register Src="~/Controls/AdminSideMenuControl.ascx" TagPrefix="ucSM" TagName="AdminSideMenuControl" %> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            TotalRecord();
            HideLogdetails();
        });

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
                $('#LogDetails').hide();
            }
            else {
                $('#LogDetails').show();
            }
        }

</script>
    <style type="text/css">
.modalBackground
{
background-color: Gray;
filter: alpha(opacity=80);
opacity: 0.8;
z-index: 10000;
}
.modal-dialog {
    position: relative;
    z-index: 1050;
    margin: 0px;
    /* margin: 10px; */
}

.width{
    width:10%;
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
        <h2 class="admin-heading">MIP Faculty Registration Details</h2>
           
    <div class="table-responsive">
       <asp:Label ID="MessageUpdated" runat="server" Text="" ForeColor="Green"></asp:Label>
        <table class="table table-bordered table-hover table-striped">
           
        <tbody>
           
    <tr><td>Search By:
        <asp:DropDownList ID="ddlSearchBy" runat="server" AutoPostBack="True">
        <asp:ListItem Text="All"></asp:ListItem>
        <asp:ListItem Text="Name"></asp:ListItem>
        <asp:ListItem Text="Mobile"></asp:ListItem>       
        </asp:DropDownList> 
    </td>
        <td>MIP Type
        <asp:DropDownList ID="DropDownList1" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" runat="server" AutoPostBack="True">
        <asp:ListItem Text="All"></asp:ListItem>
        <asp:ListItem Text="UPSC"></asp:ListItem>
        <asp:ListItem Text="RPSC"></asp:ListItem>      
        </asp:DropDownList> 
    </td>
        <td> Search
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
        </td><td>
            <asp:Button ID="btnSearch" runat="server" Text="Search" 
                />
             <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="Red" Text=""></asp:Label>
            
        </td>
        <td>
<asp:Button ID="Button1" runat="server" Text="Export to Excel"  OnClick="Button1_Click" class="btn btn-info"
                />
        </td>
    </tr>
    

 <br/>
          
            <asp:GridView ID="gvEvent" runat="server" class="table table-bordered table-hover table-striped" AutoGenerateColumns="false" DataKeyNames="ID"  PageSize="25" 
   EmptyDataText="No records has been added." OnRowDataBound="gvEvent_RowDataBound1" Style="font-weight: normal;" OnRowDeleting="gvMIP_RowDeleting"  onpageindexchanging="gvEvent_PageIndexChanging" >
<Columns> 
    
    <asp:BoundField HeaderText="Name" DataField="Name" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="Address" DataField="Address" ItemStyle-HorizontalAlign="Left"></asp:BoundField>   
    <asp:BoundField HeaderText="Email" DataField="Email" ItemStyle-HorizontalAlign="Left"></asp:BoundField>  
    <asp:BoundField HeaderText="Mobile Number" DataField="Mobile" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="Posting" DataField="Posting" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="Occupation" DataField="Occupatoin" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="Specalization" DataField="SubjectSpecialistion" ItemStyle-HorizontalAlign="Left"></asp:BoundField> 
    <asp:BoundField HeaderText="Avalability" DataField="DateOfAvailabil" ItemStyle-HorizontalAlign="Left" DataFormatString="{0:dd-M-yyyy}" HeaderStyle-Width="10%"></asp:BoundField> 
    
    <asp:BoundField HeaderText="Date" DataField="CreateDate" ItemStyle-HorizontalAlign="Left" DataFormatString="{0:dd-M-yyyy}" HeaderStyle-Width="10%"></asp:BoundField>
    <asp:TemplateField HeaderText="Action" ItemStyle-Width="72" >
        <ItemTemplate>
          <asp:ImageButton ID="imgbtn" ImageUrl="Images/UI_Icons-09-128.png" runat="server" Width="25" Height="25" OnClick="imgbtn_Click1"/>
            <asp:ImageButton ID="ButtonDelete" runat="server" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this event?');"  Text="Delete" Width="25" Height="25"  CssClass="input" ImageUrl="Images/minimal-97-128.png" />
        </ItemTemplate>
       </asp:TemplateField>
    
            <%--<asp:CommandField ButtonType="Link"  ItemStyle-Width="62"/>--%>
</Columns>
</asp:GridView>
     Total Items Count: <asp:Label ID="lblRecords" runat="server" Text="Label"></asp:Label>   
<table border="1"cellpadding="0"cellspacing="0" style="border-collapse: collapse">

    </table>
            
  <br />
            <asp:Label ID="lblresult" runat="server"/>
         <asp:Button ID="btnShowPopup" runat="server" style="display:none"  CssClass="col-lg-6 col-sm-6 col-md-6"/>
<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlpopup" CancelControlID="btnCancel" BackgroundCssClass="modalBackground">
</ajaxToolkit:ModalPopupExtender>
<asp:Panel ID="pnlpopup" runat="server"   style="display:none; overflow-y: scroll; max-height:100%;">
    <div class = "modal-dialog">
    <div class = "modal-content">
      <div class = "modal-header">
<div width="100%"  width:100%; border-collapse: inherit; height:100%" cellpadding="0" cellspacing="0" Style="border-bottom: 1px solid #e5e5e5;">
<tr style="background-color:#D55500">
<td colspan="2" style=" height:10%; color:White; font-weight:bold;  font-size:larger" align="center "></td>
<h4>MIP Faculty Registration Details</h4>
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
<label>Email: </label>
<asp:TextBox ID="Email"    runat="server" class="form-control" style="width:95%"/>
</div>
        <div class="form-group">
<label>Mobile: </label>
<asp:TextBox ID="Mobile"   runat="server" class="form-control" style="width:95%"/>
</div>
     <div class="form-group">
<label>Posting: </label>
<asp:TextBox ID="txtPosting"    runat="server" class="form-control" style="width:95%"/>
</div>
     <div class="form-group">
<label>Occupation: </label>
<asp:TextBox ID="txtOccupation"    runat="server" class="form-control" style="width:95%"/>
</div>
     <div class="form-group">
<label>	Specalization: </label>
<asp:TextBox ID="txtSpecalization"    runat="server" class="form-control" style="width:95%"/>
</div>
     <div class="form-group">
<label>Avalability: </label>
<asp:TextBox ID="txtAvalability" type="Date"   runat="server" class="form-control" style="width:95%"/>
</div>
     <div class="form-group">
<label>Address: </label>
    <asp:TextBox ID="Address" Rows="6" Columns="10" TextMode="MultiLine"   runat="server" class="form-control" style="width:95%"/>
</div>
<div class="form-group">
<asp:Button ID="btnUpdate" CommandName="Update" runat="server" class="btn btn-primary btn-lg"  Text="Update" OnClick="btnUpdate_Click1"/>
<asp:Button ID="btnCancel" runat="server"  class="btn btn-primary btn-lg" Text="Cancel"  />
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


</asp:Content>
