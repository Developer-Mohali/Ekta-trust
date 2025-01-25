<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/ProfileMaster.Master" CodeBehind="UserPassword.aspx.vb" Inherits="EktaTrust.UserPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/css/main.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<div class="container">
  <div class="card card-container">
  <img id="profile-img" class="profile-img-card" src="Images/images/avatar.png" />

        <asp:TextBox ID="TextOldPassword" runat="server" class="form-control" placeholder="Old Password" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ErrorMessage="*"  ToolTip="Please Enter Old Password" ForeColor="Red" ControlToValidate="TextOldPassword" runat="server" ValidationGroup="password" />

        <asp:TextBox ID="textNewPassword" runat="server" class="form-control" placeholder="New Password" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ErrorMessage="*"  ToolTip="Please Enter Password" ForeColor="Red" ControlToValidate="textNewPassword" runat="server" ValidationGroup="password" />

        <asp:TextBox ID="textConfirmPassword" runat="server" class="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ErrorMessage="*"  ToolTip="Please Enter Password" ForeColor="Red" ControlToValidate="textConfirmPassword" runat="server" ValidationGroup="password" />
        <asp:CompareValidator ErrorMessage="Passwords do not match." ForeColor="Red" ControlToCompare="textNewPassword" ControlToValidate="textConfirmPassword" runat="server" ValidationGroup="password" />
      
         <asp:Button ID="ButtonChangePassword" runat="server" class="btn btn-lg btn-primary btn-block btn-signin"  Text="Change Password" OnClick="ButtonChangePassword_Click" ValidationGroup="password" />
        <asp:Label ID="lblErrorMsg" runat="server" Font-Bold="True" ForeColor="Red" Text=""></asp:Label>
        
      </div><!-- /card-container -->
    </div><!-- /container -->


</asp:Content>
