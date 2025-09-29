<%@ Page Title="" Language="vb" AutoEventWireup="false"  MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="RegistrationCreativeCompetition.aspx.vb" EnableEventValidation="false" Inherits="EktaTrust.RegistrationCreativeCompetition" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="about-us">
  <div class="container">
    <h2 class="wow fadeInDown">Registration for 3<span class="ordinal">rd</span> Ekta Creative Competition 2025</h2>
            <div class="row contact-wrap  wow fadeInDown">
           <%--<img src="images/Image-Run.png" class="img-responsive wow fadeInDown pull-right hidden-sm hidden-xs hidden-md" alt=""/>--%> 
                <div class="status alert alert-success" style="display: none"></div>
                <%--<form id="main-contact-form" class="contact-form" name="contact-form" method="post" action="sendemail.php">--%>
                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                         <span style="color: green; font-weight: bold">
                             <asp:Label ID="lblErrorMsg" runat="server"></asp:Label></span>
                        <span style="color: red; font-weight: bold">
                             <asp:Label ID="lblErrorMsgMobile" runat="server"></asp:Label></span>
                        <div class="form-group">
                            <label>Name <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" controltovalidate="textName" ForeColor="Red" ErrorMessage="Please Enter Name."  ToolTip="Please Enter Name" />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="textName"
                             ValidationExpression="[a-zA-Z ]*$" ErrorMessage="Please only alphabets value." ForeColor="Red"/>
                            </label>
                           <%-- <input type="text" name="name" class="form-control" required>--%>
                             <asp:TextBox ID="textName" runat="server" class="form-control"></asp:TextBox>                     
                       </div>
                        <div class="form-group">
                            <label>Email Address</label>
                            <%--<input type="email" name="email" class="form-control" required>--%>
                              <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ControlToValidate="textEmail" ForeColor="Red" ErrorMessage="Please enter valid email id format." />
                             <asp:TextBox ID="textEmail" runat="server" class="form-control"></asp:TextBox>                        
                        </div>
                      
                        <div class="form-group">
                            <label for="textMobile">Mobile Number 
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="textMobile" ForeColor="Red" ErrorMessage="Please enter mobile."  Display="Dynamic" CssClass="d-block" />
                                <asp:RegularExpressionValidator ID="RegExp1" runat="server" ControlToValidate="textMobile" ForeColor="Red" ErrorMessage="Accept only Integer value 10." ValidationExpression="^[0-9]{10}$" Display="Dynamic" CssClass="d-block" />
                            </label>
                            <asp:TextBox ID="textMobile" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="drpContest">Contest <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="drpContest" ForeColor="Red" ErrorMessage="Please Select a Contest."  InitialValue="0" Display="Dynamic" /></label>
                            <asp:DropDownList runat="server" CssClass="form-control" ID="drpContest">
                                <asp:ListItem Value="0">---Select Value---</asp:ListItem>
                                <asp:ListItem Value="1">Essay both adult and kids</asp:ListItem>
                                <asp:ListItem Value="2">Book Review</asp:ListItem>
                                <asp:ListItem Value="3">Reels</asp:ListItem>
                                <asp:ListItem Value="4">Songs</asp:ListItem>
                                <asp:ListItem Value="5">Fancy Dress Kids</asp:ListItem>
                                <asp:ListItem Value="6">Sketch & Drawing</asp:ListItem>
                                <asp:ListItem Value="7">Poems</asp:ListItem>
                                <asp:ListItem Value="8">Speech</asp:ListItem>
                                <asp:ListItem Value="9">Painting</asp:ListItem>
                            </asp:DropDownList>

                            
                        </div>

                          <div class="form-group">
                            <label>Address</label>
                           <asp:TextBox ID="TextAddress" runat="server" Rows="5" Columns="40" TextMode="multiline" class="form-control" placeholder="Message"></asp:TextBox>
                        </div>

                        <!---Check Box Here-->
                            <asp:checkbox id="chbCondition" runat="server"></asp:checkbox>
                            
                            <a href="../TermsAndCondition" target="_blank">
                                <label style="cursor:pointer">I Accept the Terms and Conditions</label>
                            </a>
                     <br />
                            <span style="color: red; font-weight: bold">
                            <asp:Label ID="lblConditionMessage" runat="server"></asp:Label></span>

                        <div class="form-group">
                            <%-- <button type="submit" name="submit" class="btn btn-primary btn-lg" >Submit Message</button>--%>
                            <asp:button id="ButtonSubmitMessage" runat="server" class="btn btn-success btn-lg" text="Submit & Continue" OnClick="Insert_Contest_Registration"/>

                        </div>                    
                    </div>
                   
                <%--</form> --%>
            </div><!--/.row-->
      
  </div>
  </div>
  <!--/.container--><!--/#main-slider-->


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
        <div class="pull-right"><a href="#"><i class="fa fa-telegram"></i></a><a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a></div>
       <strong>Ekta Navnirman Trust,</strong><br />
                             B-15, Pragati Path, Bajaj Nagar,<br />
                             Jaipur, Rajasthan-302015 <br/>
        <br/>
            <img src="images/logo-small.jpg" class="img-responsive pull-right"  alt=""/>   
        <br/>
        <strong>Email Us</strong><br/>
        <a href="mailto:ektanavnirmantrust@gmail.com">ektanavnirmantrust@gmail.com</a><br/>
        <br/>
        <form action="#">
          <div class="input-group"> <span class="input-group-addon"> <i class="fa fa-envelope"></i> </span>
            <input class="form-control" placeholder="Signup Weekly Newsletter"/>
          </div>
          <input type="submit" value="Subscribe" class="btn btn-large btn-primary" />
        </form>
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
         .img-responsive {
    display: block;
    height: auto;
    margin-top: 90px;
    max-width: 100%;
}
    </style>
</asp:Content>

