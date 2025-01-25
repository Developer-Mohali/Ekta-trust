<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/ProfileMaster.Master" CodeBehind="UserChangePassword.aspx.vb" Inherits="EktaTrust.UserChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
  <div class="card card-container">
  <img id="profile-img" class="profile-img-card" src="Images/images/avatar.png" />
    <form class="form-signin" runat="server">
   <%-- <input type="password" id="inputPassword" class="form-control" placeholder="Old Password" required>--%>
        <asp:TextBox ID="TextOldPassword" runat="server" class="form-control" placeholder="Old Password" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ErrorMessage="*"  ToolTip="Please Enter Old Password" ForeColor="Red" ControlToValidate="TextOldPassword"
                runat="server" />
           <%--<input type="password" id="inputPassword" class="form-control" placeholder="New Password" required>--%>
        <asp:TextBox ID="textNewPassword" runat="server" class="form-control" placeholder="New Password" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ErrorMessage="*"  ToolTip="Please Enter Password" ForeColor="Red" ControlToValidate="textNewPassword"
                runat="server" />
                       <%-- <input type="password" id="inputPassword" class="form-control" placeholder="Confirm Password" required>--%>
        <asp:TextBox ID="textConfirmPassword" runat="server" class="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ErrorMessage="*"  ToolTip="Please Enter Password" ForeColor="Red" ControlToValidate="textConfirmPassword"
                runat="server" />
        <asp:CompareValidator ErrorMessage="Passwords do not match." ForeColor="Red" ControlToCompare="textNewPassword"
                ControlToValidate="textConfirmPassword" runat="server" />
                        <%--<button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Change Password</button>--%>
         <asp:Button ID="ButtonChangePassword" runat="server" class="btn btn-lg btn-primary btn-block btn-signin"  Text="Change Password" />
        <asp:Label ID="lblErrorMsg" runat="server" Font-Bold="True" ForeColor="Red" Text=""></asp:Label>
            </form><!-- /form -->
        
      </div><!-- /card-container -->
    </div>
</asp:Content>
