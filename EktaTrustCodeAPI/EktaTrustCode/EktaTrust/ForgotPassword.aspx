<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Outer.Master" CodeBehind="ForgotPassword.aspx.vb" Inherits="EktaTrust.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--/nav-->
<div class="container">
  <div class="card card-container">
  <img id="profile-img" class="profile-img-card" src="Images/images/avatar.png">
    <form class="form-signin" runat="server" >
           <%-- <input type="password" id="inputPassword" class="form-control" placeholder="Old Password" required="">--%>
               <asp:TextBox ID="textEmailAdd" runat="server" class="form-control" placeholder="Email Address"></asp:TextBox>
         <asp:RequiredFieldValidator ErrorMessage="*"  ToolTip="Please enter emailId!" ForeColor="Red" ControlToValidate="textEmailAdd"
                runat="server" />
                         <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="textEmailAdd" ForeColor="Black" ErrorMessage="Please enter valid emailId!" />
            <br />
        <asp:Button ID="ButtonSend" runat="server" class="btn btn-lg btn-primary btn-block btn-signin"  Text="Send" OnClick="ButtonSend_Click" /><br />
        <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Red" Text=""></asp:Label>
         </form><!-- /form -->
        
      </div><!-- /card-container -->
    </div><!-- /container -->
  <!--/.container--> 
</asp:Content>

        
        
        