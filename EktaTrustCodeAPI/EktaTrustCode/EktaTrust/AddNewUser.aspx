<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Outer.Master" CodeBehind="AddNewUser.aspx.vb" Inherits="EktaTrust.AddNewUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <!--/nav-->
<div class="container">
  <div class="card card-container">
            <img id="profile-img" class="profile-img-card" src="Images/images/avatar.png" />    
            <form id="Form1" runat="server">
                 <asp:Label ID="message" runat="server" Text="" ForeColor="Green"></asp:Label>
                <span id="reauth-email" class="reauth-email"></span>
               
                <asp:Label ID="Label1" runat="server" Text="Email Address:"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email address is required." ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>

                 <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Email Address"></asp:TextBox>
                 <asp:Label ID="Label2" runat="server" Text="New Password:"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="New password is required." ControlToValidate="txtNewPass"  ForeColor="Red"></asp:RequiredFieldValidator>
              
                 <asp:TextBox ID="txtNewPass" TextMode="Password" runat="server" class="form-control" placeholder="New Password"></asp:TextBox>
                   <asp:Label ID="Label3" runat="server" Text="Confirm Password:"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Confirm password is required." ControlToValidate="txtconfirpass"  ForeColor="Red"></asp:RequiredFieldValidator>
               <asp:CompareValidator ID="CompareValidator"  runat="server" ControlToValidate="txtconfirpass" ControlToCompare="txtNewPass" ErrorMessage="Password does not match!" ForeColor="Red"/>
                 <asp:TextBox ID="txtconfirpass" TextMode="Password" runat="server" class="form-control" placeholder="Confirm Password"></asp:TextBox>
              
            
           <asp:Button ID="ButtonSignIn" runat="server" class="btn btn-lg btn-primary btn-block btn-signin"  Text="Register" OnClick="ButtonSignIn_Click"/>
        <br />
                  <asp:LinkButton class="forgot-password" ID="LinkButtonForgot" runat="server" CausesValidation="False" PostBackUrl="~/ForgotPassword.aspx">Forgot the password ?</asp:LinkButton>
                <asp:LinkButton class="forgot-password" ID="LinkButton1" runat="server" CausesValidation="False" PostBackUrl="~/login.aspx">Login Here</asp:LinkButton>
                    </form>
    
      
      </div><!-- /card-container -->
    </div><!-- /container -->
  <!--/.container--> 
        <script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.12.0/jquery.validate.min.js" type="text/javascript"/>
    <style>
 label.error {             
            color: red;   
            display:inline-flex;                 
        }
</style>
     <%--<script type ="text/javascript" >                
         $(document).ready(function () {  
             $("#form1").validate({  
                 rules: {  
                      
                     <%=txtEmail.UniqueID%>:{  
                         required:true  

                     },  
                     <%=txtNewPass.UniqueID%>:{  
                         required:true,  
                         email: true
                     }, 
                    
                     <%=txtconfirpass.UniqueID%>:{  
                          required:true  

                      },
                   
                 },  

                 messages: {  
                     //This section we need to place our custom   
                     //Validation message for each control.  
                     <%=txtEmail.UniqueID%>: {  
                         required: "Email is required."  
                     },
                     <%=txtNewPass.UniqueID%>:{  
                        required:"New password is required." 
                        
                    }, 
                    
                     <%=txtconfirpass.UniqueID%>:{  
                         required:"Confirm password is required." 

                     },
                    
                 }
                 
             });  
         });   
        
    </script>--%>  
    <
</asp:Content>
