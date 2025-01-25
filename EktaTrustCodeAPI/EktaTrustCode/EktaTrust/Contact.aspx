<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="Contact.aspx.vb" Inherits="EktaTrust.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        Table tr td a {
            color: #2a6496;
            text-decoration: underline;
            margin-left: 4px;
        }

        Table tr td li {
            color: #2a6496;
            text-decoration: underline;
            margin-left: 5px;
        }

        .heading-image {
            background: #f87801;
            -webkit-border-top-left-radius: 5px;
            -webkit-border-top-right-radius: 5px;
            -moz-border-radius-topleft: 5px;
            -moz-border-radius-topright: 5px;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            padding: 5px;
            margin-left: 15px;
        }

        #divFirstName {
            min-height: 95px;
        }

        .divPanelChair{
            margin-left:16px;
             margin-top:10px;
        }

        .trustee-table{
            margin-top:10px;
        }

        .divTrusteePanel{
            width:97% !important;
        }

        .panelImgMar{
            margin-left:-3px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="about-us">
        <div class="container">
            <img src="images/join_img.jpg" class="img-responsive img-rounded  wow fadeInDown" alt=""/>
            <h2 class="wow fadeInDown">CONTACT US</h2>
            <section>
                <div class="row  wow fadeInDown">
                    <div class=" col-lg-6">
                        <p>If you cannot reach us by the office number, do not hesitate to contact us by the mobile number or by e-mail. We will get back to you as soon as possible.</p>
                        <div class="panel">
                            <div class="panel-heading">
                                <h3>Our <span class="pink_color">Office</span></h3>
                            </div>
                            <div class="panel-body">
                                <address>
                                    <strong>Ekta Navnirman Trust,</strong><br/>
                                    B-15, Pragathi Path, Bajaj Nagar,<br/>
                                    Jaipur
                                    <br/>
                                    <br/>
                                    <strong>Email Us</strong>
                                    <br/>
                                    <a href="mailto:ektanavnirmantrust@gmail.com">ektanavnirmantrust@gmail.com</a>
                                </address>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-heading">
                                <h3>For Offline Donation </h3>
                            </div>
                            <!-- CONTACT FORM https://github.com/jonmbake/bootstrap3-contact-form -->
                            <div class="panel-body">                           
                             <table class="tables">
                               <tr>
                                  <td style="font-weight: bold;">A\C NO.:</td> 
                                  <td style="padding: 0px 0px 0px 15px;">35834326038</td> 
                               </tr>
                               <tr>
                                  <td style="font-weight: bold;">IFSC : </td>  
                                  <td style="padding: 0px 0px 0px 15px;"> SBIN0004227</td> 
                               </tr>
                               <tr>
                                   <td style="font-weight: bold;">Account Name :</td>  
                                   <td style="padding: 0px 0px 0px 15px;"> Ekta Navnirman Trust </td> 
                               </tr>
                               <tr>
                                   <td style="font-weight: bold;">Branch :</td>  
                                   <td style="padding: 0px 0px 0px 15px;"> SBI Chandpole Bazar, Jaipur</td> 
                               </tr>
                             </table>
<%--                                <div class="form-group"><span class="help-block" style="display: none;">Please enter your name.</span> </div>
                                <div class="form-group">
                                    <asp:TextBox ID="textEmailAdd" runat="server" class="form-control" placeholder="Email Address"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="reqEmailAdd" ControlToValidate="textEmailAdd" ForeColor="Red" ErrorMessage="*" ToolTip="Please Enter EmailAddress" />
                                    <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        ControlToValidate="textEmailAdd" ForeColor="Red" ErrorMessage="Please enter valid email id format." />
                                    <span class="help-block" style="display: none;">Please enter a valid e-mail address.</span>
                                </div>
                                <div class="form-group">                              
                                    <asp:TextBox ID="textMobile" runat="server" class="form-control" placeholder="Mobile"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="reqMobile" ControlToValidate="textMobile" ForeColor="Red" ErrorMessage="*" ToolTip="Please Enter Mobile Number" />
                                    <asp:CustomValidator ID="CustomValidatorMobile" runat="server" ForeColor="Red" ErrorMessage="Please enter numeric values."
                                        OnServerValidate="Validate_Numeric" ControlToValidate="textMobile"></asp:CustomValidator>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="TextMessage" runat="server" Rows="5" Columns="40" TextMode="multiline" class="form-control" placeholder="Message"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="reqMessage" ControlToValidate="TextMessage" ForeColor="Red" ErrorMessage="*" ToolTip="Please Enter Message" />
                                    <span class="help-block" style="display: none;">Please enter a message.</span>
                                </div>
                                <div class="form-group">
                                    <table>
                                        <tr>
                                            <td style="height: 50px; width: 50px;">
                                                <img src="GenerateCaptcha.aspx" id="imgCaptcha" />
                                                <a href="#" onclick="javascript:RefreshCaptcha();"></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="btnRefresh" runat="server" Text="Show a Different Image" CausesValidation="False" OnClick="btnRefresh_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="textCaptcha" placeholder="Enter Captcha:" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <span style="color: green; font-weight: bold">
                                    <asp:Label ID="lblErrorMsg" runat="server"></asp:Label></span>
                                <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="Red" Text=""></asp:Label>--%>
                            </div>
                         <%--   <div style="margin-left: 10px;" class="panel">
                                <asp:Button ID="ButtonSendMessage" runat="server" class="btn btn-primary btn-lg" Style="display: block; margin-top: 10px;" Text="Send Message" OnClick="ButtonSendMessage_Click" />
                            </div>--%>
                            <br />
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="panel">
                            <div class="col-sm-6 wow fadeInDown">
                                <div class="row">
                                    <div class="col-sm-12 heading-image" id="divFirstName">
                                        <div class="col-sm-8">
                                            <span style="font-size: 25px; color: #fff; font-weight: bold;">Movil Jeenwal</span>
                                            <span style="font-size: 25px; color: #fff; font-weight: bold;">(Chairman)</span>
                                        </div>
                                        <%-- <span style="font-size:25px;color:#fff;font-weight:bold;">Jeenwal (Chairman)</span>--%>
                                        <div class="col-sm-4">
                                            <img style="width: 70px" src="Images/movil.png" /></div>
                                    </div>
                                </div>
                                <div class="row">
                                <table class="trustee-table divPanelChair">
                                    <tr>
                                        <th>Father Name:</th>
                                        <td>Shri Pradeep Jeenwal</td>
                                    </tr>
                                    <tr>
                                        <th>Mother Name:</th>
                                        <td>Smt Kamla devi</td>
                                    </tr>
                                    <tr>
                                        <th>DOB:</th>
                                        <td>29/06/1991</td>
                                    </tr>
                                    <tr>
                                        <th>Email Id:</th>
                                        <td><a href="mailto:movil.jeenwal@gmail.com">movil.jeenwal@gmail.com</a></td>
                                    </tr>
                                    <tr>
                                        <th>Address:</th>
                                        <td>H No-32 Nadi Area Purani Basti Jaipur </td>
                                    </tr>
                                    <tr>
                                        <th>Mobile:</th>
                                        <td>9660037537</td>
                                    </tr>
                                    <tr>
                                        <th>Educational Qualification:</th>
                                        <%--<td>B.Sc.,M.Sc.(IT) LL.B.</td>--%>
                                        <td>B.Sc, M.Sc(IT), LL.B, LLM(HR & VE)</td>
                                    </tr>
                                    <tr>
                                        <th>Experience</th>
                                        <td>Presently head of computer sc.dept of DAV college, Entrepreneur at Movil Pharmaceuticals</td>
                                    </tr>
                                </table>
                                    </div>
                            </div>
                            <div class="col-sm-6 wow fadeInDown">
                                <div class="row">
                                    <div class="col-sm-12 heading-image divTrusteePanel">
                                        <div class="col-sm-8">
                                            <span style="font-size: 20px; color: #fff; font-weight: bold;">Arvind</span>
                                            <span style="font-size: 20px; color: #fff; font-weight: bold;">Hingonia</span>
                                            <span style="font-size: 20px; color: #fff; font-weight: bold;">(Trustee)</span>
                                        </div>
                                        <%-- <span style="font-size:25px;color:#fff;font-weight:bold;">Jeenwal (Chairman)</span>--%>
                                        <div class="col-sm-4 panelImgMar">
                                            <img style="width: 70px" src="Images/arvind.png" /></div>
                                    </div>
                                </div>
                                <%-- <h1 class="heading-one">Arvind Hingonia (Trustee)</h1>--%>
                                    <table class="trustee-table">
                                        <tr>
                                            <th>Father Name:</th>
                                            <td>Shri Rameshwar Prasad Hingonia</td>
                                        </tr>
                                        <tr>
                                            <th>Mother Name:</th>
                                            <td>Smt Bhawari Devi</td>
                                        </tr>
                                        <tr>
                                            <th>DOB:</th>
                                            <td>8/8/1978</td>
                                        </tr>
                                        <tr>
                                            <th>Email Id:</th>
                                            <td><a href="mailto:arvindhingonia@gmail.com">arvindhingonia@gmail.com</a></td>
                                        </tr>
                                        <tr>
                                            <th>Address:</th>
                                            <td>Plot No-25, Bhagwati Nagar Second, Kartarpura, Jaipur</td>
                                        </tr>
                                        <tr>
                                            <th>Mobile:</th>
                                            <td>9001716311</td>
                                        </tr>
                                        <tr>
                                            <th>Educational Qualification:</th>
                                            <td>M.A.</td>
                                        </tr>
                                    </table>                    
                            </div>
                            <div class="col-sm-12 wow fadeInDown">
                                <h1 class="heading-one">EKTA TEAM</h1>
                                <div class=" table-responsive">
                                    <table id="Contact" class=" table table-striped  table-condensed  Contact" style="border: 1px groove;">

                                        <tbody>
                                            <tr>
                                                <td class="text-danger">Mr. Movil Jeenwal (Chairman)</td>
                                                <td><i class="glyphicon glyphicon-envelope"></i><a href="mailto:movil.jeenwal@gmail.com">movil.jeenwal@gmail.com</a></td>
                                                <td><i class="glyphicon glyphicon-phone">966-003-7537</i></td>
                                            </tr>
                                            <tr>
                                                <td class="text-danger">Mr. Arvind Hingonia (Trustee)</td>
                                                <td><i class="glyphicon glyphicon-envelope"></i><a href="mailto:arvindhingonia@gmail.com">arvindhingonia@gmail.com</a></td>
                                                <td><i class="glyphicon glyphicon-phone">900-171-6311</i></td>
                                            </tr>
                                            <tr>
                                                <td class="text-danger">Ms. Alka Verma</td>
                                                <td><i class="glyphicon glyphicon-envelope "></i><a href="mailto:alkaguru155@gmail.com">alkaguru155@gmail.com</a></td>
                                               <%-- <td><i class="glyphicon glyphicon-phone">966-002-2000</i></td>--%>
                                            </tr>

                                            <%--<tr>
                                            <td class="text-danger">Shri Brij Mohan Singh</td>
                                            <td><i class="glyphicon glyphicon-envelope"></i><a href="mailto:drbharatksingh@gmail.com">drbharatksingh@gmail.com</a></td>
                                            <td><i class="glyphicon glyphicon-phone"> </i></td>
                                        </tr>--%>
                                            <%--<tr>
                                            <td class="text-danger">Ms. Etti Hingonia </td>
                                            <td><i class="glyphicon glyphicon-envelope"></i><a>ettihingonia@gmail.com</a></td>
                                            <td><i class="glyphicon glyphicon-phone"></i></td>
                                        </tr>--%>
                                            <tr>
                                                <td class="text-danger">Ms. Gurupyari </td>
                                                <td style="padding: 7px !important"><i class="glyphicon glyphicon-envelope"></i><a href="mailto:gurupriyasukhdhami@gmail.com">gurupriyasukhdhami@gmail.com</a></td>
                                               <%-- <td><i class="glyphicon glyphicon-phone">946-048-4849</i></td>--%>
                                            </tr>
                                            <%--<tr>
                                            <td class="text-danger">Ms. Himani Sonwal </td>
                                            <td><i class="glyphicon glyphicon-envelope"></i><a href="mailto:hsonwal93@gmail.com">hsonwal93@gmail.com</a></td>
                                            <td><i class="glyphicon glyphicon-phone">809-485-9558</i></td>
                                        </tr>--%>
                                            <tr>
                                                <td class="text-danger">Ms. Kavita Dadwal</td>
                                                <td><i class="glyphicon glyphicon-envelope"></i><a href="mailto:kskavitas01@gmail.com">kskavitas01@gmail.com</a></td>
                                                <%--<td><i class="glyphicon glyphicon-phone">999-890-4124</i></td>--%>
                                            </tr>
                                            <%--<tr>
                                            <td class="text-danger">Ms. Madhu Singh</td>
                                            <td><i class="glyphicon glyphicon-envelope"></i><a href="mailto:yashikaaswal@gmail.com">yashikaaswal@gmail.com</a></td>
                                            <td><i class="glyphicon glyphicon-phone">774-254-9175</i></td>
                                        </tr>--%>

                                            <tr>
                                                <td class="text-danger">Ms. Manisha Jinolia</td>
                                                <td><i class="glyphicon glyphicon-envelope"></i><a href="mailto:sarveshjai236@gmail.com">sarveshjai236@gmail.com</a></td>
                                                <%--<td><i class="glyphicon glyphicon-phone">998-205-4079</i></td>--%>
                                            </tr>
                                            <tr>
                                                <td class="text-danger">Mr. R.N. Bairva </td>
                                                <td><i class="glyphicon glyphicon-envelope"></i><a href="mailto:neotarng@gmail.com">neotarng@gmail.com</a></td>
                                                <%--<td><i class="glyphicon glyphicon-phone">941-374-9082</i></td>--%>
                                            </tr>
                                            <tr>
                                                <td class="text-danger">Mrs. Suman Kayal</td>
                                                <td><i class="glyphicon glyphicon-envelope"></i><a>bunkar.pawan@gmail.com</a></td>
                                                <%--<td><i class="glyphicon glyphicon-phone">759-717-7732</i></td>--%>
                                            </tr>
                                            <tr>
                                                <td class="text-danger">Mr. Alok Hingonia</td>
                                                <td><i class="glyphicon glyphicon-envelope"></i><a href="mailto:alokhingonia@gmail.com">alokhingonia@gmail.com</a></td>
                                               <%-- <td><i class="glyphicon glyphicon-phone">982-815-0030</i></td>--%>
                                            </tr>
                                            <tr>
                                                <td class="text-danger">Ms. Yashoda Salvi</td>
                                                <td><i class="glyphicon glyphicon-envelope"></i><a href="mailto:salvi.yashoda@gmail.com">salvi.yashoda@gmail.com</a></td>
                                                <%--<td><i class="glyphicon glyphicon-phone">965-488-9439</i></td>--%>
                                            </tr>
                                            <%--<tr>
                                            <td class="text-danger">Mr. Mahesh Tanwar</td>
                                            <td><i class="glyphicon glyphicon-envelope"></i><a href="mailto:tanwarmahes@gmail.com">tanwarmahes@gmail.com</a></td>
                                            <td><i class="glyphicon glyphicon-phone">988-750-2157</i></td>
                                        </tr>--%>
                                            <%--       <tr>
                                            <td class="text-danger">Shri Dev Karan Tanwar</td>
                                            <td><i class="glyphicon glyphicon-envelope"></i><a>	devkarancrpf@gmail.com</a></td>
                                            <td><i class="glyphicon glyphicon-phone">971 731 6305</i></td>
                                        </tr>--%>
                                            <%-- <tr>
                                            <td class="text-danger">Mr. Raman Lal Baloch </td>
                                            <td><i class="glyphicon glyphicon-envelope"></i><a>	advramanbaloch@gmail.com</a></td>
                                            <td><i class="glyphicon glyphicon-phone"></i></td>
                                        </tr>--%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
           </section>
        </div> 
    </div>
    
  <!--/.container-->
</asp:Content>
