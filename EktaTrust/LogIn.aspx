<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Outer.Master" CodeBehind="LogIn.aspx.vb" Inherits="EktaTrust.LogIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--/nav-->
<div class="container">
  <div class="card card-container">
            <img id="profile-img" class="profile-img-card" src="Images/images/avatar.png" />
            
             
            <form id="Form1" class="form-signin" runat="server">
                <span id="reauth-email" class="reauth-email"></span>
                
                <asp:TextBox ID="textEmailAdd" runat="server" class="form-control" placeholder="Email Address"></asp:TextBox>
                <asp:RequiredFieldValidator ErrorMessage="*"  ToolTip="Please enter emailId!" ForeColor="Red" ControlToValidate="textEmailAdd" runat="server" />
                         <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="textEmailAdd" ForeColor="Black" ErrorMessage="Please enter valid emailId!" />
               
                <asp:TextBox ID="TextPassword" runat="server"  class="form-control" placeholder="Password" TextMode="Password" ></asp:TextBox>
                <asp:RequiredFieldValidator ErrorMessage="*"  ToolTip="Please enter password!" ForeColor="Red" ControlToValidate="TextPassword" runat="server" />
               
                <div id="remember" class="checkbox">
                        <asp:CheckBox ID="chkRememberMe" runat="server" class="checkbox" text="Remember me" Checked="true"></asp:CheckBox>
                     <br />
                </div>
           
                <asp:Button ID="ButtonSignIn" runat="server" class="btn btn-lg btn-primary btn-block btn-signin"  Text="Login" OnClick="ButtonSignIn_Click" />
                <br />
                <asp:LinkButton class="forgot-password" ID="LinkButtonForgot" runat="server" CausesValidation="False" PostBackUrl="~/ForgotPassword.aspx">Forgot password ?</asp:LinkButton>
                    </form><!-- /form -->
            <%--<a href="forgot.html" class="forgot-password">
                Forgot the password?
            </a>--%>
    
       <%--<asp:linkbutton id="LinkButtonForgot" text="Forgot the password" runat="server" class="forgot-password"></asp:linkbutton>--%>
      </div><!-- /card-container -->
    </div><!-- /container -->
  <!--/.container--> 


</asp:Content>
