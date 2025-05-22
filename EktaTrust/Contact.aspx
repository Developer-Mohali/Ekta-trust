<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="Contact.aspx.vb" Inherits="EktaTrust.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

        .divPanelChair {
            margin-left: 16px;
            margin-top: 10px;
        }

        .trustee-table {
            margin-top: 10px;
        }

        .divTrusteePanel {
            width: 97% !important;
        }

        .panelImgMar {
            margin-left: -3px;
        }

        .panel-heading {
            margin-right: 50%;
        }

        .content-us .trustee-table {
    font-size: 12px;
    margin: 0px 0px 10px 0px;
    width: 100%;
    padding: 0px;
    text-align: left;
    border-collapse: collapse;
     border: 0px; 
     height: 60px; 
} .content-us .trustee-table td{
     padding: 0px 0px 0px 0px;
     background-color:#f5f5f5;
 }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="about-us">
        <div class="container">
            <img src="images/join_img.jpg" class="img-responsive img-rounded  wow fadeInDown" alt="" />
            <h2 class="wow fadeInDown">CONTACT US</h2>
            <section>
                <div class="row  wow fadeInDown">

                    <div class=" col-lg-3">

                        <p>If you cannot reach us by the office number, do not hesitate to contact us by the mobile number or by e-mail. We will get back to you as soon as possible.</p>

                        <div class="">
                            <h3>Our<span class="pink_color">Office</span></h3>
                        </div>

                        <address>
                            <strong>Ekta Navnirman Trust,</strong><br />
                             B-15, Pragati Path, Bajaj Nagar,<br />
                             Jaipur, Rajasthan-302015
                                    <br />
                            <%-- <br/>
                                    <strong>Email Us</strong>
                                    <br/>--%>
                            <%--<a href="mailto:ektanavnirmantrust@gmail.com">ektanavnirmantrust@gmail.com</a><br>--%>
                            <%--  <a href="#" class="fa fa-whatsapp">     +91 78776-64078</a>--%>
                        </address>


                        <%--    <div class="panel">
                            
                                <h3>For Donation</h3>
                           
                            <!-- CONTACT FORM https://github.com/jonmbake/bootstrap3-contact-form -->
                                                     
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
                            <br />
                        </div>--%>
                         <div class="">
                        <div class="panel content-us">
                            <h3>Contact Us</h3>

                            <table class="trustee-table divPanelChair ">
                                <tr>
                                   <td style="font-weight: bold;">Email Id <a href="ektanavnirmantrust@gmail.com" class="fa fa-envelope"></a> :</td>  
                                   <td style="padding: 0px 0px 0px 5px;"><a href="mailto:ektanavnirmantrust@gmail.com">ektanavnirmantrust@gmail.com</a></td> 
                               </tr>
                                <tr>
                                    <td style="font-weight: bold;">Whatsapp<a href="#" class="fa fa-whatsapp"></a> : </td>
                                    <td style="padding: 0px 0px 0px 5px;">+91-7877664078</td>
                                </tr>
                                <%--<tr>
                                    <td style="font-weight: bold;">Call <a href="#" class="fa fa-phone"></a> : </td>
                                    <td style="padding: 0px 0px 0px 5px;"><a href="tel:+91-9001716311">+91-9001716311</a></td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold;">Call <a href="#" class="fa fa-phone"></a> :</td>
                                    <td style="padding: 0px 0px 0px 5px;"><a href="tel:+91-9660037537">++91-9660037537</a></td>
                                </tr>--%>
                               <%-- <tr>
                                   <td style="font-weight: bold;">Email Id <a href="#" class="fa fa-envelope"></a> :</td>  
                                   <td style="padding: 0px 0px 0px 15px;">ektanavnirmantrust@gmail.com </td> 
                               </tr>--%>
                            </table>
                        </div>
                             </div>

                    </div>

                    <div class="col-lg-3">
                        <div class="panel">

                            <div class="wow fadeInDown">
                                <div class="row">
                                    <div class="col-sm-12 heading-image" id="divFirstName">
                                        <div class="col-sm-8">
                                            <span style="font-size: 25px; color: #fff; font-weight: bold;">Movil Jeenwal</span>
                                            <%--<span style="font-size: 25px; color: #fff; font-weight: bold;">(Chairman)</span>--%>
                                        </div>
                                        <%-- <span style="font-size:25px;color:#fff;font-weight:bold;">Jeenwal (Chairman)</span>--%>
                                        <div class="col-sm-4">
                                            <img style="width: 70px" src="Images/movil.png" />
                                        </div>
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
                                       <%-- <tr>
                                            <th>DOB:</th>
                                            <td>29/06/1991</td>
                                        </tr>
                                        <tr>
                                            <th>Email Id:</th>
                                            <td><a href="mailto:movil.jeenwal@gmail.com">movil.jeenwal@gmail.com</a></td>
                                        </tr>--%>
                                        <tr>
                                            <th>Address:</th>
                                            <td>H No-32 Nadi Area Purani Basti Jaipur </td>
                                        </tr>
                                        <%--<tr>
                                            <th>Mobile:</th>
                                            <td>9660037537</td>
                                        </tr>--%>
                                        <tr>
                                            <th>Whatsapp:</th>
                                            <td>+91-7877664078</td>
                                        </tr>
                                        <tr>
                                            <th>Educational Qualification:</th>
                                            <%--<td>B.Sc.,M.Sc.(IT) LL.B.</td>--%>
                                            <td>B.Sc, M.Sc(IT), LL.B, LLM(HR & VE)</td>
                                        </tr>
                                        <tr>
                                            <%--     <th>Experience</th>
                                        <td>Presently head of computer sc.dept of DAV college, Entrepreneur at Movil Pharmaceuticals</td>--%>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-lg-3">
                        <div class="panel">
                            <div class="wow fadeInDown">
                                <div class="row">
                                    <div class="col-sm-12 heading-image" id="divFirstName">
                                        <div class="col-sm-8">
                                            <span style="font-size: 25px; color: #fff; font-weight: bold;">Arvind Hingonia</span>

                                            <%--<span style="font-size: 20px; color: #fff; font-weight: bold;">(Trustee)</span>--%>
                                        </div>
                                        <%-- <span style="font-size:25px;color:#fff;font-weight:bold;">Jeenwal (Chairman)</span>--%>
                                        <div class="col-sm-4 panelImgMar">
                                            <img style="width: 70px" src="Images/arvind-latest.jpg" />
                                        </div>
                                    </div>
                                </div>
                                <%-- <h1 class="heading-one">Arvind Hingonia (Trustee)</h1>--%>
                                <div class="row">
                                    <table class="trustee-table divPanelChair">
                                        <tr>
                                            <th>Father Name:</th>
                                            <td>Shri Rameshwar Prasad Hingonia</td>
                                        </tr>
                                        <tr>
                                            <th>Mother Name:</th>
                                            <td>Smt Bhawari Devi</td>
                                        </tr>
                                       <%-- <tr>
                                            <th>DOB:</th>
                                            <td>8/8/1978</td>
                                        </tr>
                                        <tr>
                                            <th>Email Id:</th>
                                            <td><a href="mailto:arvindhingonia@gmail.com">arvindhingonia@gmail.com</a></td>
                                        </tr>--%>
                                        <tr>
                                            <th>Address:</th>
                                            <%--<td>25, Bhagwati Nagar II, Kartarpura, Jaipur 302006</td>--%>
                                            <td>B-15, Pragati Path, Bajaj Nagar, Jaipur, Rajasthan-302015</td>
                                        </tr>
                                        <%--<tr>
                                            <th>Mobile:</th>
                                            <td>9001716311</td>
                                        </tr>--%>
                                        <tr>
                                            <th>Whatsapp:</th>
                                            <td>+91-7877664078</td>
                                        </tr>
                                        <tr>
                                            <th>Educational Qualification:</th>
                                            <td>M.A.</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-lg-3">
                        <div class="panel">
                            <div class="wow fadeInDown">
                                <div class="row">
                                    <div class="col-sm-12 heading-image" id="divFirstName">
                                        <div class="col-sm-8">
                                            <span style="font-size: 25px; color: #fff; font-weight: bold;">Yashoda Salvi</span>
                                            <%--<span style="font-size: 25px; color: #fff; font-weight: bold;">(Chairman)</span>--%>
                                        </div>
                                        <%-- <span style="font-size:25px;color:#fff;font-weight:bold;">Jeenwal (Chairman)</span>--%>
                                        <div class="col-sm-4">
                                            <img style="width: 70px" src="Images/yashoda.jpg" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <table class="trustee-table divPanelChair">
                                        <tr>
                                            <th>Father Name:</th>
                                            <td>Shri Kesha Ram</td>
                                        </tr>
                                        <tr>
                                            <th>Mother Name:</th>
                                            <td>Meera devi</td>
                                        </tr>
                                       <%-- <tr>
                                            <th>DOB:</th>
                                            <td>06/07/1989</td>
                                        </tr>
                                        <tr>
                                            <th>Email Id:</th>
                                            <td><a href="mailto:salvi.yashoda@gmail.com">salvi.yashoda@gmail.com</a></td>
                                        </tr>--%>
                                        <tr>
                                            <th>Address:</th>
                                            <td>D2/93, second floor, janakpuri, New Delhi </td>
                                        </tr>
                                        <%--<tr>
                                            <th>Mobile:</th>
                                            <td>9654889439</td>
                                        </tr>--%>
                                        <tr>
                                            <th>Whatsapp:</th>
                                            <td>+91-7877664078</td>
                                        </tr>
                                        <tr>
                                            <th>Educational Qualification:</th>
                                            <%--<td>B.Sc.,M.Sc.(IT) LL.B.</td>--%>
                                            <td>BA</td>
                                        </tr>
                                        <tr>
                                            <%--  <th>Experience</th>
                                        <td>Presently head of computer sc.dept of DAV college, Entrepreneur at Movil Pharmaceuticals</td>--%>
                                        </tr>
                                    </table>
                                </div>
                            </div>

                        </div>

                    </div>
                    <div class="col-sm-12 wow fadeInDown">
                        <h1 class="heading-one">EKTA TEAM</h1>
                        <div class=" table-responsive">
                            <table id="Contact" class=" table table-striped  table-condensed  Contact" style="border: 1px groove;">

                                <tbody>

                                    <tr>
                                        <td class="text-danger">Mr. Movil Jeenwal (Trustee)</td>
                                        <td><i class="glyphicon glyphicon-envelope"></i><a href="mailto:movil.jeenwal@gmail.com">movil.jeenwal@gmail.com</a></td>
                                        <%--<td><i class="glyphicon glyphicon-phone">966-003-7537</i></td>--%>
                                    </tr>
                                    <tr>
                                        <td class="text-danger">Mr. Arvind Hingonia (Trustee)</td>
                                        <td><i class="glyphicon glyphicon-envelope"></i><a href="mailto:arvindhingonia@gmail.com">arvindhingonia@gmail.com</a></td>
                                        <%--<td><i class="glyphicon glyphicon-phone">900-171-6311</i></td>--%>
                                    </tr>
                                    <tr>
                                        <td class="text-danger">Ms. Yashoda Salvi (Trustee)</td>
                                        <td><i class="glyphicon glyphicon-envelope"></i><a href="mailto:salvi.yashoda@gmail.com">salvi.yashoda@gmail.com</a></td>
                                        <%--<td><i class="glyphicon glyphicon-phone">900-171-6311</i></td>--%>

                                    </tr>
                                      <tr>
                                        <td class="text-danger">Mr. R.N. Bairva </td>
                                        <td><i class="glyphicon glyphicon-envelope"></i><a href="mailto:neotarng@gmail.com">neotarng@gmail.com</a></td>
                                        <td><i></i></td>
                                        <%--<td><i class="glyphicon glyphicon-phone">941-374-9082</i></td>--%>
                                    </tr>
                                     <tr>
                                                <td class="text-danger">Ms. Alka Verma</td>
                                                <td><i class="glyphicon glyphicon-envelope "></i><a href="mailto:alkaguru155@gmail.com">alkaguru155@gmail.com</a></td>
                                                <%--<td><i class="glyphicon glyphicon-phone">966-002-2000</i></td>--%>
                 
                                             
                                         </tr>
                                    <tr>
                                        <td class="text-danger">Mr. Alok Hingonia</td>
                                        <td><i class="glyphicon glyphicon-envelope"></i><a href="mailto:alokhingonia@gmail.com">alokhingonia@gmail.com</a></td>
                                        <td><i></i></td>
                                        <%-- <td><i class="glyphicon glyphicon-phone">982-815-0030</i></td>--%>
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
                                        <td><i></i></td>
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
                                        <td><i></i></td>
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
                                        <td><i></i></td>
                                        <%--<td><i class="glyphicon glyphicon-phone">998-205-4079</i></td>--%>
                                    </tr>

                                    <tr>
                                        <td class="text-danger">Mrs. Suman Kayal</td>
                                        <td><i class="glyphicon glyphicon-envelope"></i><a>bunkar.pawan@gmail.com</a></td>
                                        <td><i></i></td>
                                        <%--<td><i class="glyphicon glyphicon-phone">759-717-7732</i></td>--%>
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
            </section>
        </div>
    </div>

    <!--/.container-->
</asp:Content>
