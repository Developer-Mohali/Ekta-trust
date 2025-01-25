<%@ Page Language="vb" Title="" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="false" CodeBehind="ViratNagar.aspx.vb" Inherits="EktaTrust.ViratNagar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        Table tr td a {
            color: #2a6496;
            text-decoration: underline;
            margin-left: 4px;
        }

        Table tr td li {
            color: #2a6496;
            text-decoration: underline;
            margin-left: 5px;
        }

        .heading-image {
            background: #f87801;
            -webkit-border-top-left-radius: 5px;
            -webkit-border-top-right-radius: 5px;
            -moz-border-radius-topleft: 5px;
            -moz-border-radius-topright: 5px;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            padding: 5px;
            margin-left: 15px;
        }

        #divFirstName {
            min-height: 95px;
        }

        .divPanelChair {
            margin-left: 16px;
            margin-top: 10px;
        }

        .trustee-table {
            margin-top: 10px;
        }

        .divTrusteePanel {
            width: 97% !important;
        }

        .panelImgMar {
            margin-left: -3px;
        }

        .panel-heading {
            margin-right: 50%;
        }

        .content-us .trustee-table {
    font-size: 12px;
    margin: 0px 0px 10px 0px;
    width: 100%;
    padding: 0px;
    text-align: left;
    border-collapse: collapse;
     border: 0px; 
     height: 60px; 
} .content-us .trustee-table td{
     padding: 0px 0px 0px 0px;
     background-color:#f5f5f5;
 }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="about-us">
        <div class="container">
           <img src="Images/CommingSoon.png" class="img-responsive img-rounded  wow fadeInDown" alt="" style="width:1200px;height:400px;" />
        </div>
    </div>

    <!--/.container-->
</asp:Content>