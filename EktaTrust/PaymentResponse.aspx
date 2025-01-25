<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PaymentResponse.aspx.vb" Inherits="EktaTrust.PaymentResponse" %>

<!DOCTYPE html>
<style>

body section {
            padding: 20px 0;
        }

    .row {
        margin-right: 0;
        margin-left: -15px;
    }
       .lable1 {
       color:white !important;
       margin-left:10%;
       font-size:12px;
       font-family:Arial;
       }

        
          .feedback {
       background-image:url('Images/DonateUs.gif');
       padding: 10px 15px;
       border-radius: 1em 0 0 1em !important; 
       height:115px !important;
       width:25px !important;
       }

      #Donate {
     position: fixed;
     top: 190px;
     right: 0px !important;
     z-index:999;
     }

</style>

<html xmlns="http://www.w3.org/1999/xhtml">


<head runat="server">
           
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
                                     <li><a href="https://t.me/EktaTrust" target="_blank"><i class="fa fa-telegram-plane"></i></a></li>
                                    
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

    <div class="container" style="width: 100%; height:120px; border-bottom-style:solid;">
        <div class="row col-lg-2 col-xs-12 text-center"><a href="../Home">
            <img src="../Images/logo2.png" alt="logo" style="padding-top: 7px;"></a> </div>
        <div class="col-lg-2 col-xs-12 pull-right text-center nopadding-right " style="margin: 5px 0px 0px 0px">

            <img class="" width="100" height="100" src="../Images/ambd.png" />
        </div>
        <div class="col-lg-8 col-xs-12" style="color: #50255b; font-size: 25px; text-align: center;font-weight: bold; font-family: Verdana; margin: 20px 0px 5px 0px">
            <strong>Ekta Navnirman Trust</strong>
            <p style="font-size: 10px; font-family: Arial; color: #f57400; margin: -5px 0px 0px 160px;" class="p">Helping People, changing lives.</p>
        </div>



    </div>
   

    <title> MERCHANT RESPONSE PAGE</title>
</head>
<body>
   
     <link href="../Css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Css/main.css" rel="stylesheet" />
     <!-- start branding table -->
   <%-- <table width='100%' border='2' cellpadding='2' class='title'>
        <tr>
            <td class='shade' width='90%'>
                <h2 class='co'>&nbsp;
            MERCHANT RESPONSE PAGE</h2>
            </td>
            <td class='title' align='center'>
                <h3 class='co'></h3>
            </td>
        </tr>
    </table>--%>
    <!-- end branding table -->

    <asp:Panel ID="Panel_Debug" runat="server" display="none" >
        <!-- only display these next fields if debug enabled -->
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label_Debug" runat="server" /></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label_DigitalOrder" runat="server" /></td>
            </tr>
        </table>
    </asp:Panel>

    <h1 align="center">
        <asp:Label ID="Label_Title" runat="server" /></h1>

    <form runat="server" style="height:380px;">
        <table align="center" border="0" width="70%" >

            <tr class="title">
                <td colspan="2">
                    <p>
                        <strong>&nbsp;Fields below are the request values returned </strong>
                </td>
            </tr>

            <tr>
                <td align="right"><strong><em>Transaction Reference Number:</em></strong></td>
                <td>
                    <asp:Label ID="Label_MerchTxnRef" runat="server" /></td>
            </tr>
            <tr class="shade">
                <td align="right"><strong><em  style="display:none;" >Order Info:</em></strong></td>
                <td>
                    <asp:Label ID="Label_OrderInfo" runat="server"  Visible="false"/></td>
            </tr>
            <tr>
                <td align="right"><strong><em style="display:none;" >Merchant ID: </em></strong></td>
                <td>
                    <asp:Label ID="Label_MerchantID" runat="server" Visible="false" /></td>
            </tr>

            <tr class="shade">
                <td align="right"><strong><em>Transaction Amount: </em></strong></td>
                <td>
                    <asp:Label ID="Label_Amount" runat="server" /></td>
            </tr>
            <tr>
                <td align="right"><strong><em style="display:none;">Terminal Id:</em></strong></td>
                <td>
                    <asp:Label ID="Label_TerminalId" runat="server" Visible="false" /></td>
            </tr>

          <%--  <tr class='title'>
                <td colspan='2' height='25'>
                    <p><strong>Fields below are for a standard transaction </strong></p>
                </td>
            </tr>--%>
            <tr class="shade">
                <td align="right"><strong><em>Status: </em></strong></td>
                <td>
                    <asp:Label ID="Label_TxnResponseCode" runat="server" /></td>
            </tr>

            <tr>
                <td align="right"><strong><i> Payment Message: </i></strong></td>
                <td>
                    <asp:Label ID="Label_Message" runat="server" /></td>
            </tr>
            <asp:Panel ID="Panel_Receipt" runat="server">
                <!-- only display these next fields if not an error -->
                <tr>
                    <td align="right"><strong><em>RetRefNo: </em></strong></td>
                    <td>
                        <asp:Label ID="Label_RetRefNo" runat="server" /></td>
                </tr>
                <tr class="shade">
                    <td align="right"><strong><em>Batch Number for this transaction: </em></strong></td>
                    <td>
                        <asp:Label ID="Label_BatchNo" runat="server" /></td>
                </tr>


                <tr>
                    <td align="right"><strong><em>Authorization Code: </em></strong></td>
                    <td>
                        <asp:Label ID="Label_AuthorizeID" runat="server" /></td>
                </tr>
                <tr class="shade">
                    <td align="right"><strong><em>Card Type: </em></strong></td>
                    <td>
                        <asp:Label ID="Label_CardType" runat="server" /></td>
                </tr>
                <tr>
                    <td align="right"><strong><em>Card No: </em></strong></td>
                    <td>
                        <asp:Label ID="Label_CardNo" runat="server" /></td>
                </tr>
                <tr class='title'>
                    <td colspan='2' height='25'>
                        <p><strong>Fields below are for 3-D Secure Authentication Fields </strong></p>
                    </td>
                </tr>
                <tr>
                    <td align='right'><strong><em>CAVV: </em></strong></td>
                    <td>
                        <asp:Label ID="Label_CAVV" runat="server" /></td>
                </tr>
                <tr class='shade'>
                    <td align='right'><strong><em>ECI: </em></strong></td>
                    <td>
                        <asp:Label ID="Label_UCAP" runat="server" /></td>
                </tr>

                <tr>
                    <td align='right'><strong><em>Authentication Status:</em></strong></td>
                    <td>
                        <asp:Label ID="Label_AuthStatus" runat="server" /></td>
                </tr>

                <tr class='shade'>
                    <td align="right"><strong><em>ENROLLED: </em></strong></td>
                    <td>
                        <asp:Label ID="Label_ENROLLED" runat="server" /></td>
                </tr>

            </asp:Panel>
            <tr>
                <td colspan="2">
                    <hr />
                </td>
            </tr>
            <tr class="title">
                <td colspan="2" height="25">
                    <p><strong>&nbsp;Hash Validation</strong></p>
                </td>
            </tr>
            <tr>
                <td align="right"><strong><em>Hash Validated Correctly: </em></strong></td>
                <td>
                    <asp:Label ID="Label_HashValidation" runat="server" /></td>
            </tr>
            <asp:Panel ID="Panel_StackTrace" runat="server"  display="none">
                <!-- only display these next fields if an stacktrace output exists-->
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr class="title">
                    <td colspan="2">
                        <p><strong>&nbsp;Exception Stack Trace</strong></p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label_StackTrace" runat="server" /></td>
                </tr>
            </asp:Panel>
            <tr>
                <td width="50%">&nbsp;</td>
                <td width="50%">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Label ID="Label_AgainLink" runat="server" /></td>
            </tr>
        </table>
    </form>
</body>
    <footer id="footer" class="midnight-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-3">Dedicated for a Better Tomorrow <div style="padding-top:12px"></div> </div>
                <div class="col-sm-9" style="text-align:right" >
                    <ul>
                        <li><a href="../TermsAndCondition.aspx" target="_blank">Terms and Conditions</a></li>
                    </ul>
                </div>
               <div class="col-sm-12 rezinfo"> 
                   <div class="col-sm-6 rezinfo"><span id="siteseal"><script async type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=Tx5CaysYwyffrq8bzM0EFkoTXgfJAgBGMcc62iZT5BYncW3t0uStsuFiZsvW"></script></span></div>
                    <div class="col-sm-6 rezinfo" style ="text-align :right ">
                        <small>Website Developed & Maintained By: - </small>
                        <a href="http://www.kasproit.com/" style="color: red; font-weight: bold;" target="_blank">Kaspro Solutions Pvt Ltd</a>
                        <br />
                      <%--  <label style="font-size:11px;">Last Updated on: 23/03/2018 4:00 PM</label></div>--%>
               </div>

                
            </div>
        </div>
    </footer>
</html>
