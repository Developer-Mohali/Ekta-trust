<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Inner.Master" CodeBehind="ChangePassword.aspx.vb" Inherits="EktaTrust.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <%@ Register Src="~/Controls/AdminSideMenuControl.ascx" TagPrefix="ucSM" TagName="AdminSideMenuControl" %> 
    <style>
        .input-group{
            width:-webkit-fill-available;
        }
        .mt-3{
            margin-top:1rem;
        }
    </style>
</asp:Content>
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
            <div class="container d-flex justify-content-center align-items-center">
    <div class="card shadow p-4" style="width:100%; max-width:400px; border-radius:12px;">
        
        <h3 class="text-center" style="font-weight: bold;">Change Password</h3>
        <hr />
        <div class="mb-3">
            <label class="form-label">Old Password:</label>
            <div class="input-group">
                <asp:TextBox ID="TextOldPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
<%--                <span class="input-group-text" onclick="togglePassword('<%= TextOldPassword.ClientID %>', this)">
                    <i class="fa fa-eye"></i>
                </span>--%>
            </div>
            <asp:RequiredFieldValidator ErrorMessage="Old Password is Required" ForeColor="Red" ControlToValidate="TextOldPassword" runat="server" />
        </div>

        <div class="mb-3">
            <label class="form-label">New Password:</label>
            <div class="input-group">
                <asp:TextBox ID="textNewPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ErrorMessage="New Password is Required" ForeColor="Red" ControlToValidate="textNewPassword" runat="server" />
        </div>

        <div class="mb-3">
            <label class="form-label">Confirm Password:</label>
            <div class="input-group">
                <asp:TextBox ID="textConfirmPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ErrorMessage="Confirm Password is Required" ForeColor="Red" ControlToValidate="textConfirmPassword" Display="Dynamic" runat="server" />
            <asp:CompareValidator ErrorMessage="Passwords do not match" ForeColor="Red" ControlToCompare="textNewPassword" ControlToValidate="textConfirmPassword" Display="Dynamic" runat="server" />
        </div>

        <div class="d-grid mt-3">
            <asp:Button ID="ButtonChangePassword" runat="server" CssClass="btn btn-primary" OnClientClick="if (Page_ClientValidate()) { $('#loader').show(); } else { return false; }"
                    Text="Change Password" OnClick="ButtonChangePassword_Click" />
        </div>

        <asp:Label ID="lblErrorMsg" runat="server" CssClass="text-danger mt-3 d-block text-center"></asp:Label>
    </div>
</div>
    </div>
</div>


    <!--/nav-->
<%--<div class="container">
  <div class="card card-container">
  <img id="profile-img" class="profile-img-card" src="Images/images/avatar.png" />
    <form class="form-signin" runat="server">
   <%-- <input type="password" id="inputPassword" class="form-control" placeholder="Old Password" required>--%
        <asp:TextBox ID="TextOldPassword" runat="server" class="form-control" placeholder="Old Password" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ErrorMessage="*"  ToolTip="Please Enter Old Password" ForeColor="Red" ControlToValidate="TextOldPassword"
                runat="server" />
           <%--<input type="password" id="inputPassword" class="form-control" placeholder="New Password" required>--%
        <asp:TextBox ID="textNewPassword" runat="server" class="form-control" placeholder="New Password" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ErrorMessage="*"  ToolTip="Please Enter Password" ForeColor="Red" ControlToValidate="textNewPassword"
                runat="server" />
                       <%-- <input type="password" id="inputPassword" class="form-control" placeholder="Confirm Password" required>--%
        <asp:TextBox ID="textConfirmPassword" runat="server" class="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ErrorMessage="*"  ToolTip="Please Enter Password" ForeColor="Red" ControlToValidate="textConfirmPassword"
                runat="server" />
        <asp:CompareValidator ErrorMessage="Passwords do not match." ForeColor="Red" ControlToCompare="textNewPassword"
                ControlToValidate="textConfirmPassword" runat="server" />
                        <%--<button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Change Password</button>--%
         <asp:Button ID="ButtonChangePassword" runat="server" class="btn btn-lg btn-primary btn-block btn-signin"  Text="Change Password" OnClick="ButtonChangePassword_Click" />
        <asp:Label ID="lblErrorMsg" runat="server" Font-Bold="True" ForeColor="Red" Text=""></asp:Label>
            </form><!-- /form -->
        
      </div><!-- /card-container -->
    </div><!-- /container -->--%>
  <!--/.container--> 

    <script>
function togglePassword(fieldId, icon) {
    var input = document.getElementById(fieldId);
    var iconTag = icon.querySelector("i");

    if (input.type === "password") {
        input.type = "text";
        iconTag.classList.remove("fa-eye");
        iconTag.classList.add("fa-eye-slash");
    } else {
        input.type = "password";
        iconTag.classList.remove("fa-eye-slash");
        iconTag.classList.add("fa-eye");
    }
}
    </script>
</asp:Content>
