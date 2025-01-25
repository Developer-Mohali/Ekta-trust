<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PaymentRequest.aspx.vb" Inherits="EktaTrust.PaymentRequest" EnableEventValidation="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home | Ekta Trust</title>

    <!-- core CSS -->
    <script src="../Js/js/jquery-1.11.3.min.js"></script>
    <%--<link href="../bootstrap/css/bootstrap-datepicker3.min.css" rel="stylesheet" />--%>
    <link href="../Css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Css/font-awesome.css" rel="stylesheet" />
    <link href="../Css/animate.min.css" rel="stylesheet" />
    <link href="../Css/main.css" rel="stylesheet" />
    <link href="../Css/responsive.css" rel="stylesheet" />
    <link href="../Css/font-awesome.min.css" rel="stylesheet" />
    <link rel="icon" href="../ektafavicon.png" type="im" sizes="16x16"/>
    <script src="bootstrap/js/bootstrap.min.js"></script>   
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
</head>
<body>
              <header id="header">
               <div class="top-bar">
                       
                    <div class="container-fluid">
                        <div class="row">

                            <div style="float: left;" class="col-sm-10">
                              <div class="top-number ">
                                    <p class="text-info "><a href="mailto:ektanavnirmantrust@gmail.com "><i class="fa fa-envelope"></i>ektanavnirmantrust@gmail.com </a>
                                       <label class="lable1"><b>Tax Benefits:</b> Registered u/s 12A of the Income Tax Act, 1961. Donations exempted u/s 80G of the Income Tax Act 1961. </label>                    
                                    </p>                        
                                </div>
                            </div>
                        </div>

                        <div>
                            <div class="social col-sm-3 pull-right">
                                <ul class="social-share ">

                                    <li><a href="https://www.facebook.com/runforequality14april/" target="_blank"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="https://twitter.com/TrustEkta" target="_blank"><i class="fa fa-twitter"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/.container-->
   <%-- </div>--%>
    <!--/.top-bar-->

    <div class="container" style="width: 100%;">
        <div class="row col-lg-2 col-xs-12 text-center"><a href="../Home">
            <img src="../Images/logo2.png" alt="logo" style="padding-top: 7px;"/></a> </div>
        <div class="col-lg-2 col-xs-12 pull-right text-center nopadding-right " style="margin: 5px 0px 0px 0px">

            <img class="" width="100" height="100" src="../Images/ambd.png" />
        </div>
        <div class="col-lg-8 col-xs-12" style="color: #50255b; font-size: 25px; text-align: center;font-weight: bold; font-family: Verdana; margin: 20px 0px 5px 0px">
            <strong>Ekta Navnirman Trust</strong>
            <p style="font-size: 10px; font-family: Arial; color: #f57400; margin: -5px 0px 0px 160px;" class="p">Helping People, changing lives.</p>
        </div>
    </div>
    </header>
      <%-- <div class="form-horizontal col-lg-offset-3">  
   <div class="container">
	<div class="row">

    <div class="form-group">
      <label class="control-label col-sm-2" style="color:black" for="First Name:">First Name:-</label>
        
      <asp:Label ID="lblFirstName" runat="server" class="control-label  col-sm-3" ></asp:Label>
    </div>  
    <div class="form-group">
      <label class="control-label col-sm-2" style="color:black" for="Last Name:">Last Name:-</label>
      <asp:Label ID="lblLastName" runat="server"  class="control-label  col-sm-3">
      </asp:Label>
    </div>  
    <div class="form-group">
      <label class="control-label col-sm-2" style="color:black" for="Street:">Street:</label>
      <asp:Label ID="lblStreet" runat="server" class="control-label  col-sm-3">
        </asp:Label>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" style="color:black" for="City:">City:</label>
      <asp:Label ID="lblCity" runat="server" class="control-label  col-sm-3">
      </asp:Label>
    </div>
   <div class="form-group">
      <label class="control-label col-sm-2" for="State:">State:</label>
      <asp:Label ID="lblState" runat="server" class="control-label  col-sm-3">
       </asp:Label>
    </div>
	<div class="form-group">
      <label class="control-label col-sm-2" style="color:black" for="Phone:">Phone:</label>
       <asp:Label ID="lblPhone" runat="server" class="control-label  col-sm-3">
         </asp:Label>
    </div>			
    <div class="form-group">
      <label class="control-label col-sm-2" style="color:black" for="Email:">Email:</label>
      <asp:Label ID="lblEmail" runat="server" class="control-label  col-sm-3">
        </asp:Label>
    </div>          
    <div class="form-group">
      <label class="control-label col-sm-2" style="color:black" for="Zip:">Zip:</label>
       <asp:Label ID="lblZip" runat="server" class="control-label  col-sm-3">
         </asp:Label>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" style="color:black" for="Card Number:">Card Number:</label>
      <asp:Label ID="lblCardNumber" runat="server" class="control-label  col-sm-3">
        </asp:Label>
    </div>        
    <div class="form-group">
      <label class="control-label col-sm-2" style="color:black" for="Expiry Date:(MMYY) ">Expiry Date:(MMYY)</label>
     <asp:Label ID="lblExpiryDate" runat="server" class="control-label  col-sm-3">
      </asp:Label> 
        </div>
     <div class="form-group">
      <label class="control-label col-sm-2" style="color:black" for="CardSecurityCode:">CardSecurityCode:</label>
      <asp:Label ID="lblCardSecurityCode" runat="server" class="control-label  col-sm-3">
        </asp:Label>
    </div>     
   </div>
       </div>
    </div>--%>
    <style>
         Table tr td li {
            color: #2a6496;
            text-decoration: underline;           
        }
        .divPanelChair{            
             margin-top:10px;
        }
        .trustee-table{
            margin-top:10px;
        }

        .trustee-table {
            font-size: 12px;
            margin: 0px 0px 10px 0px;
             width:50%;
            padding: 0px;
            text-align: left;
            border-collapse: collapse;
            border: 1px solid #ccc;
            height: 360px;
        }
    </style>
   
    <div class="row ">
        <div class="col-sm-offset-4">
                                <table class="trustee-table divPanelChair ">
                                   
                                   
                                            <asp:Label ID="lblPaymentId" visibility="false" runat="server" class="control-label  col-sm-6"></asp:Label>
                                      
                                 
                                      <tr>
                                        <th>Name:</th>
                                        <td>
                                            <asp:Label ID="lblName" runat="server" class="control-label  col-sm-6"></asp:Label>
                                        </td>
                                    </tr>
                                      <tr>
                                        <th>Email:</th>                                       
                                        <td>
                                            <asp:Label ID="lblEmail" runat="server" class="control-label  col-sm-6">
                                            </asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>T-Shirt:</th>
                                        <td>
                                            <asp:Label ID="lblTshirt" runat="server" class="control-label col-sm-6">
                                            </asp:Label>
                                        </td>
                                    </tr>
                                       <tr>
                                        <th>Card Holder's Name:</th>
                                        <td>
                                          <asp:Label ID="lblCardHolder" runat="server" class="control-label  col-sm-6">
                                          </asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Card Number:</th>
                                        <td>
                                          <asp:Label ID="lblCardNumber" runat="server" class="control-label  col-sm-6">
                                          </asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Expiry Date:</th>
                                        <td>
                                            <asp:Label ID="lblExpiryDate" runat="server" class="control-label  col-sm-6">
                                            </asp:Label>
                                        </td>
                                    </tr>
                                        <tr>
                                        <th >Card Security Code:</th>
                                        <td>
                                            <asp:Label ID="lblCardSecurityCode" runat="server" visible="false" class="control-label col-sm-6">
                                            </asp:Label>
                                        </td>
                                    </tr>
                                  <%--   <tr>
                                        <th>Version:</th>
                                        <td>
                                            <asp:Label ID="lblVersion" runat="server" class="control-label  col-sm-6">
                                            </asp:Label>
                                        </td>
                                    </tr>
                                     <tr>
                                        <th>TxnRefNo:</th>
                                        <td>
                                            <asp:Label ID="lblTxnRefNo" runat="server" class="control-label  col-sm-6">
                                            </asp:Label>
                                        </td>
                                    </tr>
                                     <tr>
                                        <th>Amount:</th>
                                        <td>
                                            <asp:Label ID="lblAmount" runat="server" class="control-label  col-sm-6">
                                            </asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>PassCode:</th>
                                        <td>
                                            <asp:Label ID="lblPassCode" runat="server" class="control-label  col-sm-6">
                                            </asp:Label>
                                        </td>
                                    </tr>
                                     <tr>
                                        <th>TerminalId:</th>
                                        <td>
                                            <asp:Label ID="lblTerminalId" runat="server" class="control-label  col-sm-6">
                                            </asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>MerchantId:</th>
                                        <td>
                                            <asp:Label ID="lblMerchantId" runat="server" class="control-label  col-sm-6">
                                            </asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>MCC:</th>
                                        <td>
                                            <asp:Label ID="lblMCC" runat="server" class="control-label  col-sm-6">
                                            </asp:Label>
                                        </td>
                                    </tr>
                                     <tr>
                                        <th>Currency:</th>
                                        <td>
                                            <asp:Label ID="lblCurrency" runat="server" class="control-label  col-sm-6">
                                            </asp:Label>
                                        </td>
                                    </tr>
                                      <tr>
                                        <th>TxnType:</th>
                                        <td>
                                            <asp:Label ID="lblTxnType" runat="server" class="control-label  col-sm-6">
                                            </asp:Label>
                                        </td>
                                    </tr>
                                      <tr>
                                        <th>RedirectUrl:</th>
                                        <td>
                                            <asp:Label ID="lblRedirectUrl" runat="server" class="control-label  col-sm-6">
                                            </asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>BankId:</th>
                                        <td>
                                            <asp:Label ID="lblBankId" runat="server" class="control-label  col-sm-6">
                                            </asp:Label>
                                        </td>
                                    </tr>--%>                                 
                                    <%--<tr>
                                        <th>Last Name:</th>
                                        <td>
                                             <asp:Label ID="lblLastName" runat="server" class="control-label  col-sm-6" >
                                             </asp:Label>
                                        </td>
                                    </tr>--%>
                                    <%--<tr>
                                        <th>Address:</th>
                                        <td>
                                            <asp:Label ID="lblAddress" runat="server" class="control-label  col-sm-6">
                                            </asp:Label>
                                        </td>
                                    </tr>--%>
                                    <%--<tr>
                                        <th>City:</th>
                                        <td>
                                            <asp:Label ID="lblCity" runat="server" class="control-label  col-sm-6">
                                            </asp:Label>
                                        </td>
                                    </tr>--%>
                           
                                   <%-- <tr>
                                        <th>Phone:</th>
                                        <td>
                                            <asp:Label ID="lblPhone" runat="server" class="control-label  col-sm-6">
                                            </asp:Label>
                                        </td>
                                    </tr>--%>
                                  
                                   <%-- <tr>
                                        <th>Zip</th>
                                        <td>
                                            <asp:Label ID="lblZip" runat="server" class="control-label  col-sm-6">
                                            </asp:Label>
                                        </td>
                                    </tr>--%>
                                   <%-- <tr>
                                        <th>Payment Option:</th>
                                        <td>
                                            <asp:Label ID="lblPaymentOption" runat="server" class="control-label col-sm-6">
                                            </asp:Label>
                                        </td>
                                    </tr>--%>
                                  <%-- <tr>
                                        <th>Quantity:</th>
                                        <td>
                                            <asp:Label ID="lblQuantity" runat="server" class="control-label col-sm-6">
                                            </asp:Label>
                                        </td>
                                    </tr> --%>                                   
                                </table>

             </div>
                                    </div>
  <form name="RedirectForm" id="RedirectForm" runat="server" action="https://sandbox.isgpay.com:8443/ISGPay/request.action" method="post">
  <%--Add production url(21-nov-2018)--%>
<%-- <form name="RedirectForm" id="RedirectForm" runat="server" action="https://isgpay.com/ISGPay/request.action" method="post">--%>
       
        <asp:Panel ID="Panel_Debug" runat="server" >
            <!-- only display these next fields if debug enabled -->
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label_Debug" runat="server" Visible="false" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label_DigitalOrder" runat="server" />
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel ID="Panel_StackTrace" runat="server" Visible="false">
            <!-- only display these next fields if an stacktrace output exists-->
         <table>   
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr class="title">
                <td>
                    <p><strong>&nbsp;Exception Stack Trace</strong></p>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label_StackTrace" runat="server" Visible="false" />
                </td>
            </tr>
             </table>
        </asp:Panel>

        <table>
            <tr>
                <%-- <td align="right"><strong><i>Message: </i></strong></td>--%>
                <td>
                    <asp:Label ID="Label_Message" runat="server" /></td>
            </tr>
        </table>
        <table width="80%" align="center" border="0" cellpadding='0' cellspacing='0'>         
                <tr>             
                     <td>                      
                        <input type="hidden" name="Amount" id="Amount" runat="server"/>
                     </td>              
                </tr>
                <tr>
                     <td>                       
                       <input type="hidden" runat="server" id="BankId" name="BankId"/>
                     </td>
                </tr> 
                 <tr>
                     <td>               
                         <input type="hidden" name="CardNumber"  id="CardNumber" runat="server"/>
                     </td>
                </tr>
                <tr>
                     <td>               
                         <input type="hidden" name="CardHolder"  id="CardHolder" runat="server"/>
                     </td>
                </tr>
                <tr>
                     <td>                         
                         <input type="hidden" name="CardSecurityCode"  id="CardSecurityCode" runat="server"/>
                     </td>
                </tr>             
                <tr>
                     <td>                        
                         <input type="hidden" name="Currency"  id="Currency" runat="server"/> 
                     </td>
                </tr>            
                <tr>
                     <td>                     
                         <input type="hidden" name="ExpiryDate"  id="ExpiryDate" runat="server"/>
                     </td>
                </tr>
               
                <tr>
                     <td>                       
                         <input type="hidden" name="MCC"  id="MCC" runat="server"/>
                     </td>
                </tr>             
                <tr>
                     <td>                      
                         <input type="hidden" name="PassCode"  id="PassCode" runat="server"/>
                     </td>
                </tr>             
                <tr>
                     <td>                    
                         <input type="hidden" name="ReturnURL"  id="ReturnURL" runat="server"/>
                     </td>
                </tr>             
                <tr> 
                     <td>                    
                         <input type="hidden" name="TxnRefNo"  id="TxnRefNo" runat="server"/>
                     </td>
                </tr>
                <tr>
                     <td>                      
                         <input type="hidden" name="TxnType"  id="TxnType" runat="server"/>
                     </td>
                </tr>              
                <tr>
                  <td>                         
                         <input  type="hidden" runat="server" name="MerchantId" id="MerchantId" />               
                  </td>
               </tr>
               <tr>
                   <td>                    
                         <input  type="hidden" runat="server" name="TerminalId" id="TerminalId" />
                   </td>
               </tr>
               <tr>
                   <td>                       
                         <input  type="hidden" runat="server" name="Version" id="Version" />
                   </td>
               </tr>  
               <tr>
                   <td>                   
                        <input type="hidden" name="EncData" value="<%=encryptdata%>"/>
                    <%--<input type="hidden" runat="server" name="EncData" id="EncData" />--%>                   
                    </td>
                </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="submit" value="Are you sure to Pay?" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
<footer id="footer" class="midnight-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-3">Dedicated for a Better Tomorrow <div style="padding-top:12px"></div> </div>
                <div class="col-sm-9" style="text-align:right" >
                    <ul>
                        <%--<li><a href="../Home">Home</a></li>
                        <li><a href="../Introduction">About Us</a></li>
                        <li><a href="../Training">Training Activities</a></li>
                        <li><a href="../Events">Events</a></li>
                        <li><a href="../Trustee">Ekta Team </a></li>
                        <li><a href="../News">News/Press</a></li>
                        <li><a href="../Contact">Contact Us</a></li>
                        <li><a href="../JoinUs">Join Us</a></li>--%>
                        <li><a href="../TermsAndCondition.aspx" target="_blank">Terms and Conditions</a></li>
                    </ul>
                </div>
               <div class="col-sm-12 rezinfo"> 
                   <div class="col-sm-6 rezinfo"><span id="siteseal"><script async type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=Tx5CaysYwyffrq8bzM0EFkoTXgfJAgBGMcc62iZT5BYncW3t0uStsuFiZsvW"></script></span></div>
                    <div class="col-sm-6 rezinfo" style ="text-align :right "><small>Website Developed & Maintained By: - </small><a href="http://www.kasproit.com/" style="color: red; font-weight: bold;" target="_blank">Kaspro Solutions Pvt Ltd</a><br /><%--<label style="font-size:11px;">Last Updated on: 23/03/2018 4:00 PM</label>--%></div>
               </div>
            </div>
        </div>
    </footer>
