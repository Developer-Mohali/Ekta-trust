<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Inner.Master" CodeBehind="UserDetails.aspx.vb" Inherits="EktaTrust.UserDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<%@ Register Src="~/Controls/AdminSideMenuControl.ascx" TagPrefix="ucSM" TagName="AdminSideMenuControl" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <script type="text/javascript" src="//tinymce.cachefly.net/4.0/tinymce.min.js"></script>
<%--<script type="text/javascript">
    tinymce.init({ selector: 'textarea', width: 500, height: 200 });
</script>--%>
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
<!--include jQuery Validation Plugin-->  
<script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.12.0/jquery.validate.min.js"  
type="text/javascript">

</script> 
  
      <style type="text/css">
.modalBackground
{
background-color: Gray;
filter: alpha(opacity=80);
opacity: 0.8;
z-index: 10000;
}
.width{
    width:10%;
}
        #id {
            display:none;
        }
            input[type=number]::-webkit-inner-spin-button, 
    input[type=number]::-webkit-outer-spin-button { 
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        margin: 0; 
    }

.gv-center-header th {
    text-align: center !important;
    vertical-align: middle;
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
   

<br />

 <h2 class="admin-heading">User Details</h2>
           
<div class="table-responsive">
    <asp:Label ID="MessageUpdated" runat="server" Text="" ForeColor="Green"></asp:Label>
    <table class="table table-bordered table-hover table-striped">
           
        <tbody>
           
   <tr>
       <td style="border-right:none;">
    <div style="display:flex; justify-content:space-between; align-items:center; flex-wrap:wrap; width:100%;">

        <!-- Left: Search -->
        <div style="flex:1 1 auto; min-width:250px;">
            Search
            <asp:TextBox ID="txtSearch" runat="server" autocomplete="off" style="width:200px;"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />
        </div>

        <!-- Right: Add -->
        <div style="margin-top:5px;">
            <asp:Button ID="Button2" runat="server" Text="Add New User"
                OnClick="Button2_Click" UseSubmitBehavior="False" />
        </div>

    </div>
</td>


    </tr>


    

 <br/>
          
<asp:GridView ID="gvUser" runat="server" OnRowDeleting="gvUser_RowDeleting" class="table table-bordered table-hover table-striped gv-center-header" AutoGenerateColumns="false" DataKeyNames="id"  PageSize="25" 
   ShowHeaderWhenEmpty="true" EmptyDataText="No records found." OnRowDataBound="gvUser_RowDataBound" Style="font-weight: normal;" >
    <EmptyDataTemplate>
    <div style="text-align:center; font-weight:bold;">
        No records found.
    </div>
    </EmptyDataTemplate>
<Columns>
    
   <asp:BoundField HeaderText="Name" DataField="Name" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="Email Address" DataField="EmailAddress" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
   
    <asp:BoundField HeaderText="Address" DataField="Address" ItemStyle-HorizontalAlign="Left"></asp:BoundField>  
    <asp:BoundField HeaderText="Mobile Number" DataField="MobileNumber" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
 <asp:BoundField HeaderText="Role Name" DataField="roleName" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:TemplateField HeaderText="" ItemStyle-Width="72" >
        <ItemTemplate>
          <asp:ImageButton ID="imgbtn" ImageUrl="Images/UI_Icons-09-128.png" runat="server" Width="25" Height="25" OnClick="imgbtn_Click"/>
            <asp:ImageButton ID="ButtonDelete" runat="server" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this event?');"  Text="Delete" Width="25" Height="25"  CssClass="input" ImageUrl="Images/minimal-97-128.png" />
        </ItemTemplate>
       </asp:TemplateField>
    
</Columns>
</asp:GridView>
                 Total Items Count: <asp:Label ID="lblRecords" runat="server" Text="Label"></asp:Label> 
            <table border="1"cellpadding="0"cellspacing="0" style="border-collapse: collapse">

    </table>
            
  <br />
            
         <asp:Button ID="btnShowPopup" runat="server" style="display:none"  CssClass="col-lg-6 col-sm-6 col-md-6"/>
<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlpopup" CancelControlID="btnCancel" BackgroundCssClass="modalBackground">
</ajaxToolkit:ModalPopupExtender>
<asp:Panel ID="pnlpopup" runat="server"   style="display:none">
    <div class = "modal-dialog">
    <div class = "modal-content">
      <div class = "modal-header">
<div width="100%"  width:100%; border-collapse: inherit; height:100%" cellpadding="0" cellspacing="0" Style="border-bottom: 1px solid #e5e5e5;">
<tr style="background-color:#D55500">
<td colspan="2" style=" height:10%; color:White; font-weight:bold;  font-size:larger" align="center "></td>
<h4>User Event Details</h4>
 </div>    
 <div class="modal-body"  style="max-height: 80vh; overflow-y: auto;">
     <form id="form1">
<div class="form-group" style="display:none">
<asp:Label ID="lblId" runat="server" Text="ID:"></asp:Label>
   <asp:Label ID="id" runat="server"/>
</div>
<div class="form-group">
<label>Role: </label>
    <asp:DropDownList ID="drpRole" runat="server" class="form-control" Width="95%"></asp:DropDownList>
</div>
<div class="form-group">
<label>Name:  <span style='color:red'>*</span> </label>
<asp:TextBox ID="txtName" cols="40" Rows="6" runat="server" TextMode="SingleLine" class="form-control" style="width:95%"/>
</div>
     <div class="form-group">
<label>Email Address:  <span style='color:red'>*</span></label>
<asp:TextBox ID="txtEmail" cols="40" Rows="6" runat="server" TextMode="SingleLine" class="form-control" style="width:95%"/>
</div>
     <div class="form-group">
<label>Mobile Number:  <span style='color:red'>*</span></label>
<asp:TextBox ID="txtMobile" cols="40" Rows="6" runat="server" TextMode="SingleLine" class="form-control" style="width:95%"/>
</div>
<div class="form-group">
<label>BIB Add User Limit: </label>
<asp:TextBox ID="txtBibUserLimit" cols="40" Rows="6" runat="server" TextMode="Number" class="form-control" style="width:95%"/>
</div>
     <div class="form-group">
<label>Address: </label>
<asp:TextBox ID="txtAddress" cols="40" Rows="1" runat="server" TextMode="MultiLine" class="form-control" style="width:95%"/>
</div>
  <div class="form-group">
 <asp:Label ID="lblPassword" runat="server" Text="Password: <span style='color:red'>*</span>"/>
<asp:TextBox ID="txtPassword" cols="40" Rows="6" runat="server" TextMode="Password" class="form-control" style="width:95%"/>
</div>
       <div class="form-group">
           
 <asp:Label ID="lblConfirmPass" runat="server" Text="Confirm Password:  <span style='color:red'>*</span>"/>
        
          <asp:CompareValidator ID="CompareValidator"  runat="server" ControlToValidate="txtConfirmPass" ControlToCompare="txtPassword" ErrorMessage="Password does not match!" ForeColor="Red"/>
<asp:TextBox ID="txtConfirmPass" cols="40" Rows="6" runat="server" TextMode="Password" class="form-control" style="width:95%"/>
</div>

<div class="form-group">
<asp:Button ID="btnUpdate" CommandName="Update" runat="server" class="btn btn-primary btn-lg" OnClientClick="return validateAndSubmit();" Text="Add" OnClick="btnUpdate_Click"/>
<asp:Button ID="btnCancel" runat="server"  class="btn btn-primary btn-lg" Text="Cancel"  />
</div>
</form>
 </div>       
</div>
       
</div>
</div>
</asp:Panel>        
      </table>
  </div>
</div>
</div>
<asp:HiddenField ID="hdnOriginalEmail" runat="server" />
<style>
 label.error {             
            color: red;   
            display:inline-flex;                 
        }
</style>

    <% If Not IsPostBack Then %>
<script type="text/javascript">
    window.addEventListener('load', function () {
        setTimeout(function () {
            document.getElementById('<%= txtSearch.ClientID %>').value = '';
        }, 300);
    });
</script>
<% End If %>



     <script type ="text/javascript" >
         $(document).ready(function () {
             $("#form1").validate({  
                 rules: {  
                      
                     <%=txtName.UniqueID%>:{  
                         required:true  

                     },  
                     <%=txtEmail.UniqueID%>:{  
                         required:true,  
                         email: true
                     }, 
                    
                      <%=txtMobile.UniqueID%>:{  
                          required: true,
                          minlength: 10,
                          maxlength: 10

                      },
                       <%=txtPassword.UniqueID%>:{  
                           required:true  

                       },
                      <%=txtConfirmPass.UniqueID%>:{  
                          required:true  

                      },
                 },  

                 messages: {  
                     //This section we need to place our custom   
                     //Validation message for each control.  
                     <%=txtName.UniqueID%>: {  
                         required: "Name is required."  
                     },
                    <%=txtEmail.UniqueID%>:{  
                        required:"Email address is required." 
                        
                    }, 
                    
                     <%=txtMobile.UniqueID%>:{  
                         required: "Mobile number is required.",
                         minlength: "Mobile number must be 10 digits.",
                         maxlength: "Mobile number must be 10 digits."

                      },
                     <%=txtPassword.UniqueID%>:{  
                         required:"Password is required." 

                       },<%=txtConfirmPass.UniqueID%>:{  
                           required:"Confirm Password is required." 

                       }
                 }
                 
            });  
         });   
         function validateAndSubmit() {
             var jqueryValid = $("#form1").valid ? $("#form1").valid() : true;
             var aspnetValid = (typeof (Page_ClientValidate) === 'function') ? Page_ClientValidate() : true;

             if (jqueryValid && aspnetValid) {
                 $('#loader').show();
                 return true;
             }
             return false;
         }
         function GetKeyCode(evt)
         {
             var pass= $("#<%=txtPassword.ClientID%>").val();
             var Confirmpass= $("#<%=txtConfirmPass.ClientID()%>").val();
             var keyCode;
             if(Confirmpass==pass)
             {
                 keyCode = evt.keyCode;
             }
             else
             {
                 alert("You pressed not match : ");
             }
             
         }
         $(document).ready(function () {
             var msg = $('#<%= MessageUpdated.ClientID %>');
                      if (msg && msg.text().trim() !== "") {
                          setTimeout(function () {
                              msg.fadeOut();     // hides with animation
                              msg.text('');      // clears the message content
                          }, 5000); // 5000ms = 5 seconsds
                      }
                  });
     </script>  
</asp:Content>
