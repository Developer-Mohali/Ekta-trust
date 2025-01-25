<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="MatrimonialLogin.aspx.vb" Inherits="EktaTrust.MatrimonialLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    
    <link href="Css/css/main.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--<div class="row">

        <div class="col-lg-4"></div>
        
        <div class="col-lg-4" style="text-align:center">
            <br />
            <div class="card card-container" style="background-color:#F1F1F2;text-align:center">
            
                <img id="profile-img" class="pic" src="Images/images/avatar.png" />
             
                <span id="reauth-email" class="reauth-email"></span>
           
                <asp:TextBox ID="textEmailAdd" runat="server" class="form-control" placeholder="Email Address"></asp:TextBox>
                
                <asp:RequiredFieldValidator ErrorMessage="*"  ToolTip="Please Enter EmailId" ForeColor="Red" ControlToValidate="textEmailAdd" runat="server" />

                <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="textEmailAdd" ForeColor="Black" ErrorMessage="Please enter valid email id format." />
                
                <asp:TextBox ID="TextPassword" runat="server"  class="form-control" placeholder="Password" TextMode="Password" ></asp:TextBox>
                
                <asp:RequiredFieldValidator ErrorMessage="*"  ToolTip="Please Enter Password" ForeColor="Red" ControlToValidate="TextPassword"
                runat="server" />
                
                <div id="remember" class="checkbox">
                    
                        <asp:CheckBox ID="chkRememberMe" runat="server" class="checkbox" text=" Remember me" Checked="true"></asp:CheckBox>
                
                        <br />
                </div>
           <asp:Button ID="ButtonSignIn" runat="server" class="btn btn-lg btn-primary btn-block btn-signin"  Text="Login" OnClick="ButtonSignIn_Click" />
        <br />
                  <asp:LinkButton class="forgot-password" ID="LinkButtonForgot" runat="server" CausesValidation="False" PostBackUrl="~/ForgetUserPassword.aspx">Forgot the password ?</asp:LinkButton>
                <br />
                <div class="col-lg-4"><br /></div>
      </div>
    </div>
        
        

    </div>--%>

    <div class="container">
  <div class="card card-container">
            <img id="profile-img" class="profile-img-card" src="Images/images/avatar.png" />
            
                <span id="reauth-email" class="reauth-email"></span>
                
                <%--<asp:TextBox ID="textEmailAdd" runat="server" class="form-control" placeholder="Mobile Number"></asp:TextBox>
                <asp:RequiredFieldValidator ErrorMessage="*"  ToolTip="Please Enter EmailId" ForeColor="Red" ControlToValidate="textEmailAdd" runat="server" />
                         <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="textEmailAdd" ForeColor="Black" ErrorMessage="Please enter valid email id format." />--%>
        
                <asp:TextBox ID="txtPhoneNo" runat="server" MaxLength="10" placeholder="Enter mobile number" class="form-control" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ToolTip="Please enter mobile number!" ForeColor="Red" ControlToValidate="txtPhoneNo"></asp:RequiredFieldValidator>
               
                <asp:TextBox ID="TextPassword" runat="server"  class="form-control" placeholder="Enter password" TextMode="Password" ></asp:TextBox>
                <asp:RequiredFieldValidator ErrorMessage="*"  ToolTip="Please enter password!" ForeColor="Red" ControlToValidate="TextPassword" runat="server" />
               
                <div id="remember" class="checkbox">
                        <asp:CheckBox ID="chkRememberMe" runat="server" class="checkbox" text="Remember me" Checked="true"></asp:CheckBox>
                     <br />
                </div>
           
                <asp:Button ID="ButtonSignIn" runat="server" class="btn btn-lg btn-primary btn-block btn-signin"  Text="Login" OnClick="ButtonSignIn_Click" />
                <br />
                <asp:LinkButton class="forgot-password" ID="LinkButtonForgot" runat="server" CausesValidation="False" PostBackUrl="~/ForgetUserPassword.aspx">Forgot password ?</asp:LinkButton>
            <%--<a href="forgot.html" class="forgot-password">
                Forgot the password?
            </a>--%>
    
       <%--<asp:linkbutton id="LinkButtonForgot" text="Forgot the password" runat="server" class="forgot-password"></asp:linkbutton>--%>
      </div><!-- /card-container -->
    </div>

</asp:Content>
