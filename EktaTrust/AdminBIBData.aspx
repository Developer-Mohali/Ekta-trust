<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Inner.Master" CodeBehind="AdminBIBData.aspx.vb" Inherits="EktaTrust.AdminBIBData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
  <%@ Register Src="~/Controls/BIBDataRunner.ascx" TagPrefix="ucBIB" TagName="BIBDataRunner" %>
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
     <div class="col-md-10">

     <ucBIB:BIBDataRunner runat="server" id="BIBDataRunner" />
       </div>
           </div>
</asp:Content>
