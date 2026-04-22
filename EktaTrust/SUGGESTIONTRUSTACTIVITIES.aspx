<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Inner.Master" CodeBehind="SUGGESTIONTRUSTACTIVITIES.aspx.vb" Inherits="EktaTrust.SUGGESTIONTRUSTACTIVITIES" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<%@ Register Src="~/Controls/AdminSideMenuControl.ascx" TagPrefix="ucSM" TagName="AdminSideMenuControl" %> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script type="text/javascript">
        $(document).ready(function () {
            TotalRecord();
            HideLogdetails();
        })
        function TotalRecord() {
         
            var totalRowCount = $("[id*=gvPerson] tr").length;
            var rowCount = $("[id*=gvPerson] td").closest("tr").length;
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
</style>

     <div class="container-fluid main-container">
    <div class="col-md-2 sidebar">
    <div class="row"> 
        <!-- uncomment code for absolute positioning tweek see top comment in css -->
        <div class="absolute-wrapper"> </div>
        <ucSM:AdminSideMenuControl runat="server" id="AdminSideMenuControl" />
      </div>
  </div>
    <div class="col-md-10 ">
        <h2 class="admin-heading">TRUST ACTIVITIES</h2>
           <div class="table-responsive">
              <table class="table table-bordered table-hover table-striped">
               <tbody>
          
    <tr><td>Search By:
        <asp:DropDownList ID="ddlSearchBy" runat="server" AutoPostBack="True"
            onselectedindexchanged="ddlSearchBy_SelectedIndexChanged">
        <asp:ListItem Text="All"></asp:ListItem>
        <asp:ListItem Text="FirstName"></asp:ListItem>       
        <asp:ListItem Text="LastName"></asp:ListItem>
            <asp:ListItem Text="CompanyName"></asp:ListItem>
            <asp:ListItem Text="Title"></asp:ListItem>
            <asp:ListItem Text="Email"></asp:ListItem>
            <asp:ListItem Text="Activity"></asp:ListItem>
            <asp:ListItem Text="Discription"></asp:ListItem>
            <asp:ListItem Text="Mobile"></asp:ListItem>
                             
        </asp:DropDownList> 
    </td><td> Search
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
        </td><td>
            <asp:Button ID="btnSearch" runat="server" Text="Search"
                onclick="btnSearch_Click" />
             <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="Red" Text=""></asp:Label>
        </td></tr>
    
 <br/>
                   <asp:GridView ID="gvPerson" runat="server" class="table table-bordered table-hover table-striped" AutoGenerateColumns="false" DataKeyNames="TrustId"
OnRowDataBound="OnRowDataBound" onpageindexchanging="gvPerson_PageIndexChanging"  PageSize="25" 
  OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added." Style="font-weight: normal;">
<Columns> 
    <asp:BoundField HeaderText="FirstName" DataField="FirstName" ItemStyle-HorizontalAlign="Left" />
         <asp:BoundField HeaderText="LastName" DataField="LastName" ItemStyle-HorizontalAlign="Left" />
        <asp:BoundField HeaderText="CompanyName" DataField="CompanyName" ItemStyle-HorizontalAlign="Left" />
        <asp:BoundField HeaderText="Title" DataField="Title" ItemStyle-HorizontalAlign="Left" />
        <asp:BoundField HeaderText="Email" DataField="Email" ItemStyle-HorizontalAlign="Left" />
        <asp:BoundField HeaderText="Activity" DataField="Activity" ItemStyle-HorizontalAlign="Left" />
        <asp:BoundField HeaderText="Discription" DataField="Discription" ItemStyle-HorizontalAlign="Left" />
        <asp:BoundField HeaderText="Mobile" DataField="Mobile" ItemStyle-HorizontalAlign="Left" />
         <asp:BoundField HeaderText="CreateDate" DataField="CreateDate" ItemStyle-HorizontalAlign="Left" DataFormatString="{0:dd-M-yyyy}" />
   <asp:TemplateField HeaderText="" ItemStyle-Width="72" >
        <ItemTemplate>
          <asp:ImageButton ID="imgbtn" ImageUrl="Images/UI_Icons-09-128.png" runat="server" Width="25" Height="25" onclick="imgbtn_Click" />
             <asp:ImageButton ID="ButtonDelete" runat="server" CommandName="Delete"  Text="Delete" Width="25" Height="25" OnClientClick="return confirm('Are you sure you want to delete this event?');"  CssClass="input" ImageUrl="Images/minimal-97-128.png" />
        </ItemTemplate>
       </asp:TemplateField>

</Columns>
</asp:GridView>
 <label id="message"></label>
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse">

    </table>
        
  <br />
<asp:Label ID="lblresult" runat="server"/>
         <asp:Button ID="btnShowPopup" runat="server" style="display:none" />
<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlpopup" CancelControlID="btnCancel" BackgroundCssClass="modalBackground">
</ajaxToolkit:ModalPopupExtender>
<asp:Panel ID="pnlpopup" runat="server"  style="display:none;">
 <div class = "modal-dialog">
    <div class = "modal-content">
      <div class = "modal-header">
<div width="100%"  width:100%; border-collapse: inherit; height:%" cellpadding="0" cellspacing="0" Style="border-bottom: 1px solid #e5e5e5;">
<tr style="background-color:#D55500">
<td colspan="2" style=" height:10%; color:White; font-weight:bold;  font-size:larger" align="center"></td>
<h4>User Trust Details</h4>
</div>
<div class="modal-body" >
<div class="form-group">
 <label>TrustId: </label>
<asp:Label ID="lblTrustId" runat="server"></asp:Label>
</div>
<div class="form-group">
 <label>FirstName: </label><asp:TextBox ID="textFirstName" runat="server" class="form-control" />
</div>
<div class="form-group">
 <label>LastName: </label><asp:TextBox ID="textLastName" runat="server" class="form-control" />
</div>
<div class="form-group">
 <label>CompanyName: </label><asp:TextBox ID="textCompanyName" runat="server" class="form-control" />
</div>
<div class="form-group">
 <label>Title: </label><asp:TextBox ID="textTitle" runat="server" class="form-control" />
</div>
<div class="form-group">
 <label>Email: </label><asp:TextBox ID="textEmail" runat="server" class="form-control" />
</div>
<div class="form-group">
 <label>Activity: </label><asp:TextBox ID="textActivity" runat="server" class="form-control" />
</div>
<div class="form-group">
 <label>Discription: </label><asp:TextBox ID="textDiscription"  Rows="2" Columns="10" TextMode="multiline" runat="server" class="form-control" />
</div>
<div class="form-group">
 <label>Mobile: </label><asp:TextBox ID="textMobile" runat="server" class="form-control" />
</div>
<div class="form-group">
 <asp:Button ID="btnUpdate" CommandName="Update" runat="server" class="btn btn-primary btn-lg"   Text="Update" onclick="btnUpdate_Click"/>
<asp:Button ID="btnCancel" runat="server"  class="btn btn-primary btn-lg"  Text="Cancel" />
</div>
</div>
</div>
</div>
</div>
</asp:Panel>                                             
          </tr>
          </tbody>
      </table>
   </div>
  </div>
</asp:Content>
