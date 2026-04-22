<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Inner.Master" CodeBehind="LogDetails.aspx.vb" Inherits="EktaTrust.LogDetails" %>
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
        <h2 class="admin-heading">Log Details</h2>
           
    <div class="table-responsive">
       <asp:Label ID="MessageUpdated" runat="server" Text="" ForeColor="Green"></asp:Label>
        <table class="table table-bordered table-hover table-striped">
           
        <tbody>
           
    <tr>
        <%--<td>Search By:
        <asp:DropDownList ID="ddlSearchBy" runat="server" AutoPostBack="True">
        <asp:ListItem Text="All"></asp:ListItem>
        <asp:ListItem Text="Name"></asp:ListItem>
        <asp:ListItem Text="Mobile"></asp:ListItem>       
        </asp:DropDownList> 
        </td>--%>
        <td> Search
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
        </td><td>
            <asp:Button ID="btnSearch" runat="server" Text="Search" 
                />
             <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="Red" Text=""></asp:Label>
            
        </td></tr>
    

 <br />
          
            <asp:GridView ID="gvEvent" runat="server" class="table table-bordered table-hover table-striped" AutoGenerateColumns="false" DataKeyNames="ID"  PageSize="25" 
   EmptyDataText="No records has been added." Style="font-weight: normal;" OnRowDeleting="gvMIP_RowDeleting" onpageindexchanging="gvEvent_PageIndexChanging" >
<Columns> 
    
    <asp:BoundField HeaderText="PageUrl" DataField="PageUrl" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="Error Step" DataField="ErrorStep" ItemStyle-HorizontalAlign="Left"></asp:BoundField>   
    <asp:BoundField HeaderText="Mobile Number" DataField="SmsMobileNumber" ItemStyle-HorizontalAlign="Left"></asp:BoundField>  
    <asp:BoundField HeaderText="Method Name" DataField="MethodName" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="IP Address" DataField="IPAddress" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="Browser Name" DataField="BrowserName" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="Browser Version" DataField="BrowserVersion" ItemStyle-HorizontalAlign="Left"></asp:BoundField> 
    <asp:BoundField HeaderText="Mobile Device Name" DataField="MobileDeviceName" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="Mobile Device" DataField="MobileDevice" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="Created Date" DataField="CreatedDate" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <%--<asp:BoundField HeaderText="MobileDeviceName" DataField="MobileDeviceName" ItemStyle-HorizontalAlign="Left" DataFormatString="{0:dd-M-yyyy}" HeaderStyle-Width="10%"></asp:BoundField>--%> 
    <%--<asp:BoundField HeaderText="MobileDevice" DataField="MobileDevice" ItemStyle-HorizontalAlign="Left" DataFormatString="{0:dd-M-yyyy}" HeaderStyle-Width="10%"></asp:BoundField>--%>
    <asp:TemplateField HeaderText="Action" ItemStyle-Width="72" >
        <ItemTemplate>
          <%--<asp:ImageButton ID="imgbtn" ImageUrl="Images/UI_Icons-09-128.png" runat="server" Width="25" Height="25" OnClick="imgbtn_Click1"/>--%>
            <asp:ImageButton ID="ButtonDelete" runat="server" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this event?');"  Text="Delete" Width="25" Height="25"  CssClass="input" ImageUrl="Images/minimal-97-128.png" />
        </ItemTemplate>
       </asp:TemplateField>
    
            <%--<asp:CommandField ButtonType="Link"  ItemStyle-Width="62"/>--%>
</Columns>
</asp:GridView>
      </table>
             Total Items Count: <asp:Label ID="lblRecords" runat="server" Text="Label"></asp:Label> 
  </div>
</div>
</div>

</asp:Content>
