<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="CelebritiesAppeal.aspx.vb" Inherits="EktaTrust.CelebritiesAppeal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="about-us">
  <div class="container">
  <%--  <h2 class="wow fadeInDown"><img src="Images/Error.jpeg" alt="Error" class="img-responsive"/></h2>--%>
             <div class="jquery-script-ads" style="margin: 6px auto;">
                 <h2 class="wow fadeInDown">Celebrity Appeal</h2>
            </div>
        <div class="row" style="padding-left: 22px; padding-top:25px">
            <div class="col-sm-6">
                <video width="400" height="300" controls="" style="cursor: pointer">
                    <source src="Gallery_2025/Video7.mp4" />" type="video/mp4" />
                </video>
            </div>  
             <div class="col-sm-6">
                <video width="400" height="300" controls="" style="cursor: pointer">
                    <source src="Gallery_2025/Video4.mp4" type="video/mp4" />
                </video>
            </div>
             <div class="col-sm-6">
                 <video width="400" height="300" controls="" style="cursor: pointer">
                     <source src="Gallery_2025/Video5.mp4" type="video/mp4" />
                 </video>
             </div>
        </div>
    </div>
</div>



</asp:Content>

