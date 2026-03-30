<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Inner.Master" CodeBehind="ManageAuthenticator.aspx.vb" Inherits="EktaTrust.ManageAuthenticator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <%@ Register Src="~/Controls/AdminSideMenuControl.ascx" TagPrefix="ucSM" TagName="AdminSideMenuControl" %> 
    <style>
        .switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

.switch input {
  opacity: 0;
  width: 0;
  height: 0;
}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  transition: .4s;
}

input:checked + .slider {
  background-color: #28a745;
}

input:checked + .slider:before {
  transform: translateX(26px);
}

.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container-fluid main-container">
  <div class="col-md-2 sidebar">
      <div class="row"> 
        <!-- uncomment code for absolute positioning tweek see top comment in css -->
        <div class="absolute-wrapper"> </div>
        <ucSM:AdminSideMenuControl runat="server" id="AdminSideMenuControl" />
       </div>
   </div>

   <!-- Main Content -->
    <div class="col-md-10">
        
        <div class="row">
            <div class="col-md-6 col-md-offset-3">

                <div class="panel panel-default" style="margin-top:30px;">
                    
                    <!-- Header -->
                    <div class="panel-heading" style="display:flex; justify-content:space-between; align-items:center;">
                        <h3>🔐 Enable Two-Factor Authentication</h3>
                            <label class="switch">
                            <asp:CheckBox ID="chkEnable2FA" runat="server"
                                AutoPostBack="true"
                                OnCheckedChanged="chkEnable2FA_CheckedChanged" />
                            <span class="slider round"></span>
                        </label>
                    </div>

                    <!-- Body -->
                    <div class="panel-body text-center">

                        <!-- QR Code -->
                        <asp:Image ID="imgQR" runat="server" CssClass="img-responsive" 
                            style="margin:auto; max-width:200px;" />
                        
                        <br />

                        <!-- Instructions -->
                        <p>
                            Scan this QR code using Google Authenticator or any authenticator app.
                        </p>

                        <!-- Manual Key -->
                        <div class="alert alert-info">
                            <strong>Manual Key:</strong><br />
                            <asp:Label ID="lblSecret" runat="server" Font-Bold="true" />
                        </div>

                        <!-- OTP Input -->
                        <div class="form-group">
                            <asp:TextBox ID="txtOtp" runat="server" CssClass="form-control text-center"
                                Placeholder="Enter 6-digit code" MaxLength="6" />
                        </div>

                        <!-- Button -->
                        <asp:Button ID="btnVerify" runat="server" Text="Verify & Enable"
                            CssClass="btn btn-success btn-block"
                            OnClick="btnVerify_Click" />

                        <br />

                        <!-- Message -->
                        <asp:Label ID="lblMessage" runat="server" />

                    </div>

                </div>

            </div>
        </div>

    </div>

</div>


</asp:Content>