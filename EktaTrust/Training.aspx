<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="Training.aspx.vb" Inherits="EktaTrust.Training" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="about-us">
  <div class="container">
 
      

    <h2 class="wow fadeInDown">Apply for Training</h2>
 
       
             
                <p>Drop Your Message</p>
   
            <div class="row contact-wrap  wow fadeInDown">
                  <img src="images/training.jpg" class="img-responsive wow fadeInDown pull-right" alt=""> 
                <div class="status alert alert-success" style="display: none"></div>
               <%-- <form id="main-contact-form" class="contact-form" name="contact-form" method="post" action="sendemail.php">--%>
                 <span style="color: gray; font-weight: bold">
                             <asp:Label ID="lblErrorMsg" runat="server"></asp:Label></span>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>Name <asp:RequiredFieldValidator runat="server" id="reqName" controltovalidate="textName" ForeColor="Red" ErrorMessage="*"  ToolTip="Please Enter Your Name" /></label>
                            <%--<input type="text" name="name" class="form-control" required>--%>
                             <asp:TextBox ID="textName" runat="server" class="form-control"></asp:TextBox>
                            
                                           </div>
                        <div class="form-group">
                            <label>Email  <asp:RequiredFieldValidator runat="server" id="reqEmail" controltovalidate="textEmail" ForeColor="Red" ErrorMessage="*"  ToolTip="Please Enter Email ID" /></label>
                            <%--<input type="email" name="email" class="form-control" required>--%>
                             <asp:TextBox ID="textEmail" runat="server" class="form-control"></asp:TextBox>
                           
                             <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="textEmail" ForeColor="Red" ErrorMessage="Please enter valid email id format." />
                        </div>
                      
                        <div class="form-group">
                            <label>Training</label>
                            <%--<select name="jumpMenu" id="jumpMenu" class="form-control">
                                 
                              <option>item1</option>
                            </select>--%>
                            <%--<asp:TextBox ID="textTraining" runat="server" class="form-control"></asp:TextBox>--%>
                            <asp:DropDownList ID="ddlTraining" runat="server" class="form-control">
                                <asp:ListItem Value="Select">Select</asp:ListItem>
                              <asp:ListItem Value="Education">Education</asp:ListItem>
                              <asp:ListItem Value="Tailoring">Tailoring</asp:ListItem>
                              <asp:ListItem Value="Driving">Driving</asp:ListItem>
                              <asp:ListItem Value="Cooking">Cooking</asp:ListItem>
                              <asp:ListItem Value="Yoga Training">Yoga Training</asp:ListItem>
                              <asp:ListItem Value="Dairying">Dairying</asp:ListItem>
                             </asp:DropDownList>
                       
                        </div> 
                           <div class="form-group">
                            <label>Mobile <asp:RequiredFieldValidator runat="server" id="reqMobile" controltovalidate="textMobile" ForeColor="Red" ErrorMessage="*"  ToolTip="Please Enter Mobile Number" /></label>
                            <%--<input type="text" name="subject" class="form-control" required>--%>
                            <asp:TextBox ID="textMobile" runat="server" class="form-control"></asp:TextBox>
                               
                         <asp:CustomValidator ID="CustomValidatorMobile" runat="server" ForeColor="Red" ErrorMessage="Please enter numeric values."
                           OnServerValidate="Validate_Numeric" ControlToValidate="textMobile"></asp:CustomValidator>
                           </div><div class="form-group">
                        </div>  <div class="form-group">
                            <%--<button type="submit" name="submit" class="btn btn-primary btn-lg">Submit Message</button>--%>
                            <asp:Button ID="ButtonSubmitMessage" runat="server" class="btn btn-primary btn-lg"  Text="Submit Message" OnClick="ButtonSubmitMessage_Click" />
                        </div>                    
                    </div>
                   
                </form> 
            </div><!--/.row-->
      
  </div>
  </div>
  <!--/.container--><!--/#main-slider-->

<section>
<div class="get-started  wow fadeInDown">
    <div class="container">
                <div class="contribute col-lg-6 col-sm-5 col-md-5 ">
                    <a href="https://www.onlinesbi.com/sbicollect/icollecthome.htm?corpID=922784" target="_blank">
                        <img src="images/donate1.png" id="imgdonate" class="img-responsive" alt=""/></a>
                </div>
                <div class="pull-right">
                    <div class="col-sm-8 col-md-8 col-lg-10 pull-right" style="margin-top: 10px; width: 70.3333%;">
                        <%--<a href="Donation">
                            <img src="images/activities_btn1.png" class="img-responsive" alt=""/></a>--%>
                    </div>
                </div>
            </div>
  </div>
</section>
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
                             Jaipur, Rajasthan-302015 <br>
        <br><img src="images/logo-small.jpg" class="img-responsive pull-right"  alt="">
        
        <br>
        <strong>Email Us</strong><br>
        <a href="mailto:ektanavnirmantrust@gmail.com">ektanavnirmantrust@gmail.com</a><br>
        <br>
        <form method="post" role="form">
          <div class="input-group"> <span class="input-group-addon"> <i class="fa fa-envelope"></i> </span>
            <input class="form-control" type="text" placeholder="Signup Weekly Newsletter">
          </div>
          <input type="submit" value="Subscribe" class="btn btn-large btn-primary" />
        </form>
        </address>
      </div>
    </div>
  </div>
</section>
<!--/#bottom-->
</asp:Content>
