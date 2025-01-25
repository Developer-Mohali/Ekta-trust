<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="ForgetUserPassword.aspx.vb" Inherits="EktaTrust.ForgetUserPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/css/main.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
      <div class="card card-container">
        <img id="profile-img" class="profile-img-card" src="Images/images/avatar.png" />

          <asp:TextBox ID="txtPhoneNo" MaxLength="10" runat="server" class="form-control" placeholder="Enter mobile number"></asp:TextBox>

          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ToolTip="Please enter mobile number!" ForeColor="Red" ControlToValidate="txtPhoneNo"></asp:RequiredFieldValidator>
          <%--<asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ControlToValidate="textEmailAdd" ForeColor="Black" ErrorMessage="Please enter valid email id format." />--%>

                <br />
          <asp:Button ID="ButtonSend" runat="server" class="btn btn-lg btn-primary btn-block btn-signin"  Text="Send" OnClick="ButtonSend_Click" /><br />
          <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Red" Text=""></asp:Label>
          <asp:Label ID="lblSuccess" runat="server" Font-Bold="True" ForeColor="Green" Text=""></asp:Label>
        
        </div>
    </div>

</asp:Content>
