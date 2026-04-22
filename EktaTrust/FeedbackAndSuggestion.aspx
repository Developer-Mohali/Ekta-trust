<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Inner.Master" CodeBehind="FeedbackAndSuggestion.aspx.vb" Inherits="EktaTrust.FeedbackAndSuggestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
  <%@ Register Src="~/Controls/AdminSideMenuControl.ascx" TagPrefix="ucSM" TagName="AdminSideMenuControl" %> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
        <h2 class="admin-heading">FeedBack and Suggestions</h2>
           
    <div class="table-responsive">
       <asp:Label ID="MessageUpdated" runat="server" Text="" ForeColor="Green"></asp:Label>
        <table class="table table-bordered table-hover table-striped">
           
        <tbody>

            <br />
    <tr>
        <td> Search by Mobile Number
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
        </td><td>
            <asp:Button ID="btnSearch" runat="server" Text="Search" 
                />
             <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="Red" Text=""></asp:Label>
            
        </td></tr>
    
</tbody>
 <br />
          
            <asp:GridView ID="gvEvent" runat="server" class="table table-bordered table-hover table-striped" AutoGenerateColumns="false" DataKeyNames="ID"  PageSize="25" 
   EmptyDataText="No records has been added." Style="font-weight: normal;" onpageindexchanging="gvEvent_PageIndexChanging" >
<Columns> 
    
    <asp:BoundField HeaderText="Name" DataField="Name" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
    <asp:BoundField HeaderText="Mobile Number" DataField="MobileNumber" ItemStyle-HorizontalAlign="Left"></asp:BoundField>  
    <asp:BoundField HeaderText="Comments" DataField="Comments" ItemStyle-HorizontalAlign="Left"></asp:BoundField>   
    
            <%--<asp:CommandField ButtonType="Link"  ItemStyle-Width="62"/>--%>
</Columns>
</asp:GridView>
      </table>
             Total Items Count: <asp:Label ID="lblRecords" runat="server" Text="Label"></asp:Label> 
  </div>
</div>
</div>

    </asp:Content>
