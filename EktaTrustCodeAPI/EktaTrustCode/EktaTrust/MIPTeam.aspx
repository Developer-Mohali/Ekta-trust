<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="MIPTeam.aspx.vb" Inherits="EktaTrust.MIPTeam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
    .ImageSize {
        height:600px;
        width:100%;
    }

</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="about-us">
  <div class="container" runat="server" id="DivUPSC">
    <h2 class="wow fadeInDown"><img src="EktaTrustImage/MIP Advertisement.jpg" alt="Error"  class="img-responsive thumbnail small"/></h2>
      </div>
       <div class="container" runat="server" id="DivRPSC">
           <div class="col-sm-8">
                <h2 class="wow fadeInDown"><img src="EktaTrustImage/RPSCimage.jpg" alt="Error"  class="img-responsive thumbnail small ImageSize"/></h2>
            </div>
               <div class="col-sm-4">
                   <h2 class="wow fadeInDown">
                   <img src="EktaTrustImage/RASsqcm.jpg" class="img-responsive thumbnail small ImageSize" />
                       </h2>
               </div>

       </div>
       </div>
</asp:Content>
