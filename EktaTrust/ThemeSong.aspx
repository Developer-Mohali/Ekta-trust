<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="ThemeSong.aspx.vb" Inherits="EktaTrust.ThemeSong" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="about-us">
  <div class="container">
  <%--  <h2 class="wow fadeInDown"><img src="Images/Error.jpeg" alt="Error" class="img-responsive"/></h2>--%>
         <div class="jquery-script-ads" style="margin: 6px auto;">
             <h2 class="wow fadeInDown">Theme Song</h2>
        </div>
        <div class="row">
             <div class="col-sm-12">
                 <video autoplay="autoplay" loop="loop" controls="" style="cursor: pointer; width:100%">
                     <source src="Gallery_2025/RUN-FOR-EQUALITY-5th-theme-song2023.mp4?v=1" type="video/mp4" />
                 </video>
             </div>  
        </div>
    </div>
 </div>



</asp:Content>
