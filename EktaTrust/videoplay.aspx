<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="videoplay.aspx.vb" Inherits="EktaTrust.videoplay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   <%-- <meta name="viewport" content="width=device-width, initial-scale=1.0" />--%>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    
<style>
* {
    box-sizing: border-box;
}
/*video {
    width: 100%;
    height: auto;
}*/

/*[class*="col-"] {
    float: left;
    padding: 15px;
    width: 100%;
}*/
@media only screen and (min-width: 600px) {
    .col-s-1 {width: 8.33%;}
    .col-s-2 {width: 16.66%;}
    .col-s-3 {width: 25%;}
    .col-s-4 {width: 33.33%;}
    .col-s-5 {width: 41.66%;}
    .col-s-6 {width: 50%;}
    .col-s-7 {width: 58.33%;}
    .col-s-8 {width: 66.66%;}
    .col-s-9 {width: 75%;}
    .col-s-10 {width: 83.33%;}
    .col-s-11 {width: 91.66%;}
    .col-s-12 {width: 100%;}
}

</style>
    <div class="row">
<div class="col-sm-6">
    <asp:FileUpload ID="FileUpload1" runat="server" />
<hr />
<asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="UploadFile" />
<br />
<asp:Label ID="lblMessage" ForeColor="Green" runat="server" />

    </div></div>


<div class="row">
<div class="col-sm-6">
  <video width="400" height="200" controls="" >
    <source src="RunForEqualityGallery/4.mp4" type="video/mp4" />
  </video>
</div>
    
<div class="col-sm-6">
  <video width="200" height="200" controls="" >
    <source src="RunForEqualityGallery/3.mp4" type="video/mp4" />
  </video>
</div>
</div>

</asp:Content>
