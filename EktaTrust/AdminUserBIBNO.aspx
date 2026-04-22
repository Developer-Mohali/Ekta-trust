<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Inner.Master" CodeBehind="AdminUserBIBNO.aspx.vb" Inherits="EktaTrust.AdminUserBIBNO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<%@ Register Src="~/Controls/BIBDataRunner.ascx" TagPrefix="ucBIB" TagName="BIBDataRunner" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <ucBIB:BIBDataRunner runat="server" id="BIBDataRunner" />
</asp:Content>
