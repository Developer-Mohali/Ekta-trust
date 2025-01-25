<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="MigrantsRegistration.aspx.vb" Inherits="EktaTrust.MigrantsRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
  <div class="container">
      <h2 class="wow fadeInDown" id="hadline">Covid-19 Migrant Registration Form/ कोविद -19 प्रवासी पंजीकरण फॉर्म 
      <asp:Label ID="lblTitle" runat="server" ></asp:Label></h2>
                        <span style="color: green; font-weight: bold">
                             <asp:Label ID="lblErrorMsg" runat="server"></asp:Label></span>
                        <span style="color: red; font-weight: bold">
                             <asp:Label ID="lblErrorMsgMobile" runat="server"></asp:Label></span>
      
            <div class="row contact-wrap  wow fadeInDown" id="MipRegistration">
           <img src="images/MigrantSetImage.jpg" class="img-fluid wow fadeInDown pull-right hidden-sm hidden-xs hidden-md" alt=""  /> 
                <div class="status alert alert-success" style="display: none"></div>
                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                        
                        <div class="form-group">
                           
                            <label>Name/ नाम <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" ValidationGroup="GroupMigrantRegistration"  controltovalidate="textName" ForeColor="Red" ErrorMessage="Please enter name."  ToolTip="Please enter name." />
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="textName"
                             ValidationExpression="[a-zA-Z ]*$" ErrorMessage="Please only alphabets value."   ForeColor="Red"/>
                            </label>
                             <asp:TextBox ID="textName" placeholder="Name" runat="server" class="form-control"></asp:TextBox>
                       
                       </div>
                         <div class="form-group">
                            <label>Aadhar Number(optional)/ आधार संख्या(वैकल्पिक)</label>
                            <asp:TextBox ID="AdharcardNumber" placeholder="Adhar Card Number" runat="server" class="form-control"></asp:TextBox> 
                           </div> 
                        <div class="form-group">
                            <label>Mobile Number/ मोबाइल नंबर <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator2" ValidationExpression= "^([0-9\(\)\/\+ \-]*)$"   ValidationGroup="GroupMigrantRegistration" controltovalidate="textMobile" ForeColor="Red" ErrorMessage="Please enter mobile number."  ToolTip="Please enter mobile number." />
                              
                            </label> 
                             <asp:TextBox ID="textMobile" placeholder="Mobile Number" runat="server" MaxLength="10" class="form-control"></asp:TextBox>                       
                        </div>
                      
                        <div class="form-group">
                             <label>Present Full Address/ पूरा पता</label>
                             <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator4"  ValidationGroup="GroupMigrantRegistration" controltovalidate="TextPresentAddress" ForeColor="Red" ErrorMessage="Please enter Address."  ToolTip="Please enter Address." />
                           
                           <asp:TextBox ID="TextPresentAddress" runat="server" Rows="5" Columns="40" TextMode="multiline" class="form-control" placeholder="Full Address"></asp:TextBox>
                        
                        </div> 
                          
                          <div class="form-group">
                            <label>Native Place Address/ देशी स्थान का पता</label>
                               <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator3"  ValidationGroup="GroupMigrantRegistration" controltovalidate="TextAddress" ForeColor="Red" ErrorMessage="Please enter Address."  ToolTip="Please enter Address." />
                           <asp:TextBox ID="TextAddress" runat="server" Rows="5" Columns="40" TextMode="multiline" class="form-control" placeholder="Full Address"></asp:TextBox>
                        </div>
                           

                      

                        <div class="form-group">
                            <asp:button id="ButtonSubmitMessage" runat="server" class="btn btn-success btn-lg" text="Submit"  ValidationGroup="GroupMigrantRegistration" OnClick="ButtonSubmitMessage_Click" />
                        </div>                    
                    </div>
            </div><!--/.row-->
      
  </div>

<section id="bottom">
  <div class="container wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
    <div class="row">
      <div class="col-md-7">
        <div class="widget">
          <h3>News and Updates</h3>
          <ul>
            <li><a href="News">Ekta Navnirman Trust Charitable work in Rajasthan: A short update of activities.</a></li>
            <li><a href="News">Ekta Navnirman Trust further plans.</a></li>
            <li><a href="News">Ekta Navnirman Trust Latest Decision.</a></li>
            <li><a href="News">Ekta Navnirman Trust launches Skill Training Programme.</a></li>
            <li><a href="News">Stipend Announcement for Skill Training.</a></li>
          </ul>
        </div>
      </div>
      <!--/.col-md-3--><!--/.col-md-3--><!--/.col-md-3--><!--/.col-md-3-->
      
       <div class="col-md-5">
                        <address class="text-white">
                            <div class="pull-right"><a href="#"><i class="fa fa-telegram"></i></a><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a></div>
                            <strong>Ekta Navnirman Trust,</strong><br />
                           25, Bhagwati Nagar II, Kartarpura,<br />
                            Jaipur,302006
                            <br />
                            <br />
                            <img src="Images/logo-small.jpg" class="img-responsive pull-right" alt="" />
                            <%--<img src="Images/logo-small1.png" class="img-responsive pull-right" alt="">--%>
                            <br />
                            <strong>Contact Us</strong><br />
                             Whatsapp <a href="#" class="fa fa-whatsapp"></a> : +91-7877664078 <br />
                           <%-- Call <a href="#" class="fa fa-phone"></a> : <a href="tel:+91-9660037537">+91-9660037537</a> <br />
                            Call <a href="#" class="fa fa-phone"></a> : <a href="tel:+91-9001716311">+91-9001716311</a> <br />--%>
                           Email Id <a href="ektanavnirmantrust@gmail.com" class="fa fa-envelope"></a> : <a href="mailto:ektanavnirmantrust@gmail.com">ektanavnirmantrust@gmail.com</a>
                           
                            <br />
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                <asp:TextBox runat="server" group="email" ID="txtSignupEmail" class="form-control" placeholder="Sign For Updates"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" group="email" ControlToValidate="txtSignupEmail" ForeColor="Red" ErrorMessage="*" ToolTip="Please Enter EmailId" />
                            <asp:RegularExpressionValidator runat="server" Display="Dynamic" group="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ControlToValidate="txtSignupEmail" ForeColor="Red" ErrorMessage="Please enter valid email id format." />
                            <input type="button" value="Subscribe" class="btn btn-large btn-primary" id="btncall" />
                        </address>
                    </div>
    </div>
  </div>
</section>
    <style>
        .ordinal {
  font-size:small;
  position: relative;
  top: -0.5em;
  text-transform:capitalize;
}
       
    </style>

      
</asp:Content>