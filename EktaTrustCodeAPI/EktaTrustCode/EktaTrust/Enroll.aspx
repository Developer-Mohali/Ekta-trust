<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="Enroll.aspx.vb" Inherits="EktaTrust.Enroll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

         <div class="about-us">
  <div class="container">
 
      

    <h2 class="wow fadeInDown">Enroll The Students</h2>
   
            <div class="row contact-wrap  wow fadeInDown">
                  <img src="images/elist.png" style=" padding-top:130px; padding-right:130px;" class="img-responsive wow fadeInDown pull-right" alt=""> 
                <div class="status alert alert-success" style="display: none"></div>
                
           

                <%--<form id="main-contact-form" class="contact-form" name="contact-form" method="post" action="sendemail.php">--%>
                    <span style="color: gray; font-weight: bold">
                             <asp:Label ID="lblErrorMsg" runat="server"></asp:Label></span>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label>Name of the Student*</label>
                            <%--<input type="text" name="name" class="form-control" required>--%>
                             <asp:TextBox ID="textName" runat="server" class="form-control" ></asp:TextBox>
                             <asp:RequiredFieldValidator runat="server" id="reqName" controltovalidate="textName" ForeColor="Red" ErrorMessage="*"  ToolTip="Please Enter Name of the Student" />
                        </div>
                         <div class="form-group">
                            <label>Father Name *</label>
                             <asp:TextBox ID="fatherName" runat="server" class="form-control" ></asp:TextBox>
                             <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" controltovalidate="textName" ForeColor="Red" ErrorMessage="*"  ToolTip="Please Enter Father Name" />
                        </div>
                         <div class="form-group">
                            <label>Father's Occupation *</label>                           
                             <asp:TextBox ID="fatherOccupation" runat="server" class="form-control" ></asp:TextBox>
                             <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator2" controltovalidate="textName" ForeColor="Red" ErrorMessage="*"  ToolTip="Please Enter Father's Occupation" />
                        </div>
                         <div class="form-group">
                            <label>Mother Name *</label>                            
                             <asp:TextBox ID="MotherName" runat="server" class="form-control" ></asp:TextBox>
                             <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator3" controltovalidate="textName" ForeColor="Red" ErrorMessage="*"  ToolTip="Please Enter Mother Name" />
                        </div>
                         <div class="form-group">
                            <label>Mother's Occupation *</label>                           
                             <asp:TextBox ID="MotherOccupation" runat="server" class="form-control" ></asp:TextBox>
                             <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator4" controltovalidate="textName" ForeColor="Red" ErrorMessage="*"  ToolTip="Please Enter Mother's Occupation" />
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                             <asp:TextBox ID="textEmail" runat="server" class="form-control" ></asp:TextBox>
                           <%-- <asp:RequiredFieldValidator runat="server" id="reqEmail" controltovalidate="textEmail" ForeColor="Red" ErrorMessage="*"  ToolTip="Please Enter EmailId" />--%>
                       <%--<asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ControlToValidate="textEmail" ForeColor="Red" ErrorMessage="Please enter valid email id format." />--%>
                             </div>
                       <div class="form-group">
        <div class="row">
            <%--<div class="col-xs-4">
                <label class="control-label">Sex</label>
                   <select name="jumpMenu" id="jumpMenu" class="form-control">
                              <option>Male</option>
                                <option>Female</option>
                            </select>
                 <asp:DropDownList ID="ddlSex" runat="server" class="form-control">
                               <asp:ListItem Value="Select">Select</asp:ListItem>
                              <asp:ListItem Value="Male">Male</asp:ListItem>
                              <asp:ListItem Value="Female">Female</asp:ListItem>
                              </asp:DropDownList>
            </div>--%>
              <div class="col-xs-4">
                    <label class="control-label">Category</label>               
                    <asp:DropDownList ID="category" runat="server" class="form-control">
                        <asp:ListItem Value="Select">Select</asp:ListItem>
                        <asp:ListItem Value="sc">SC</asp:ListItem>
                        <asp:ListItem Value="st">ST</asp:ListItem>
                        <asp:ListItem Value="obc">OBC</asp:ListItem>
                        <asp:ListItem Value="ur">UR</asp:ListItem>
                   </asp:DropDownList>
            </div>
            <div class="col-xs-4">         
                <div class="container  col-lg-12">
                    <label class="control-label">DOB</label>
                    <div class="input-group date">
                        <%-- <input type="text" class="form-control">--%>
                        <asp:TextBox TextMode="Date" ID="textDOB" runat="server" class="form-control"></asp:TextBox>
                        <%--<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>--%>
                        <asp:RequiredFieldValidator runat="server" id="reqDOB" controltovalidate="textDOB" ForeColor="Red" ErrorMessage="*"  ToolTip="Please Enter DOB" />
                    </div>
                </div>                                           
            </div>      
            <%--<div class="col-xs-4">
                <label class="control-label">Nationality</label>
             <input type="text" class="form-control" name="producer" />
                 <asp:TextBox ID="textNationality" runat="server" class="form-control" ></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" id="reqNationality" controltovalidate="textNationality" ForeColor="Red" ErrorMessage="*"  ToolTip="Please Enter Nationality" />
            </div>--%>
        </div>
    </div>
                       <%-- <div class="form-group">
                            <label>Select Course</label>
                           <select class="form-control">
                              <option>Course 1</option>
                                <option>Course 2</option>
                            </select>
                            <asp:DropDownList ID="ddlSelectCourse" runat="server" class="form-control">
                                <asp:ListItem Value="Select">Select</asp:ListItem>
                              <asp:ListItem Value="Course 1">Course 1</asp:ListItem>
                              <asp:ListItem Value="Course 2">Course 2</asp:ListItem>
                              </asp:DropDownList>
                        </div> --%>

                         <div class="form-group">
                            <label>Class *</label>
                             <asp:TextBox ID="textClass" runat="server" class="form-control" ></asp:TextBox>
                             <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator5" controltovalidate="textName" ForeColor="Red" ErrorMessage="*"  ToolTip="Please Enter Class" />
                        </div>


                      <div class="form-group">
                            <label>Mobile  *</label>
                                <%-- <input type="text" name="subject" class="form-control" required>--%>
                                <asp:TextBox ID="textMobile" runat="server" class="form-control" ></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" id="reqMobile" controltovalidate="textMobile" ForeColor="Red" ErrorMessage="*"  ToolTip="Please Enter Mobile Number" />
                                <asp:CustomValidator ID="CustomValidatorMobile" runat="server" ForeColor="Red" ErrorMessage="Please enter numeric values."
                           OnServerValidate="Validate_Numeric" ControlToValidate="textMobile"></asp:CustomValidator>
                      </div> 
                     <div class="form-group">
                          <label>Name of the School *</label>
                          <asp:TextBox ID="schoolName" runat="server" class="form-control" ></asp:TextBox>
                           <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator6" controltovalidate="textName" ForeColor="Red" ErrorMessage="*"  ToolTip="Please Enter Name of the School" />
                      </div>
                       <div class="form-group">
                          <label>Percentage in previous class *</label>
                          <asp:TextBox ID="percentage" runat="server" class="form-control" ></asp:TextBox>
                           <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator7" controltovalidate="textName" ForeColor="Red" ErrorMessage="*"  ToolTip="Please Enter Percentage in previous class" />
                      </div>
                        <div class="form-group">
                            <%--<button type="submit" name="submit" class="btn btn-primary btn-lg">Submit Message</button>--%>
                            <asp:Button ID="ButtonSubmitMessage" runat="server" class="btn btn-primary btn-lg"  Text="Submit" OnClick="ButtonSubmitMessage_Click" />
                        </div>                    
                    </div>
                   
                </form> 
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
        <div class="pull-right"><a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a></div>
        <strong>Ekta Navnirman Trust,</strong><br />
        B-15, Pragathi Path,Bajaj Nagar,<br> 
        Jaipur <br>
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
